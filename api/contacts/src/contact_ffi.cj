/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.contact

import ohos.values_bucket.ValueType

// while ohos.ValuesBucket.CValueType is protected we need to keep this here:
// ATTENTION: must conform to CValueType in cj_data_share_predicates_utils.h
@C
protected struct CValueType {
    var integer: Int64 = 0
    var double: Float64 = 0.0
    var boolean: Bool = false
    var string: CPointer<UInt8> = CPointer<UInt8>()
    var tag: UInt8 = 0

    // ATTENTION:
    // string <=> 3
    // boolean <=> 4
    protected init(value: ValueType) {
        match (value) {
            case Integer(n) =>
                tag = 1
                integer = n
            case Double(n) =>
                tag = 2
                double = n
            case Str(str) =>
                tag = 3
                unsafe { string = LibC.mallocCString(str).getChars() }
            case Boolean(b) =>
                tag = 4
                boolean = b
            case _ => tag = 0
        }
    }

    protected func free() {
        if (this.tag == 3) {
            if (!string.isNull()) {
                unsafe { LibC.free<UInt8>(string) }
            }
            return
        }
    }
}

// This is a derivative of ohos.relational_store.ValuesBucket with external keys allocation/releasing management
// with ValueType/CValueType from ohos.value_bucket.
// The keys are cached when the bucket is allocated at cj-side, only values are released for such buckets.
// When the bucket comes as a result of an Ffi<> method, use free(alsoFreeKeysContent: true).
// So the keys will also be released.
@C
struct CachedKeysValuesBucket {
    static let NULL = CPointer<CachedKeysValuesBucket>()
    static let EMPTY = CachedKeysValuesBucket(CPointer<CString>(), CPointer<CValueType>(), 0)

    CachedKeysValuesBucket(
        let key: CPointer<CString>,
        let value: CPointer<CValueType>,
        let size: Int64 // consider UInt64
    ) {}

    func isEmpty(): Bool {
        size == 0
    }

    static func create(pairs: Array<(CString, String)>): Option<CachedKeysValuesBucket> {
        unsafe {
            let total = pairs.size
            if (total == 0) {
                return CachedKeysValuesBucket.EMPTY
            }

            let keys = calloc<CString>(count: total)
            let values = calloc<CValueType>(count: total)
            if (keys.isNull() || values.isNull()) {
                LibC.free(keys)
                LibC.free(values)
                return None
            }

            var allocated = 0
            for ((cKey, value) in pairs) {
                try {
                    let cValue: CValueType = CValueType(ValueType.Str(value))
                    keys.write(allocated, cKey)
                    values.write(allocated, cValue)
                    allocated++
                } catch (e: Exception) {
                    for (i in 0..allocated) {
                        values.read(i).free()
                    }
                    LibC.free(keys)
                    LibC.free(values)
                    LOG.error(
                        "CachedKeysValuesBucket.create: failed to alloc record for <${cKey.toString()}; ${value}>")
                    LOG.error("                       due to: e.toString()")
                    return None
                }
            }

            CachedKeysValuesBucket(keys, values, total)
        }
    }

    func lookupKey(k: Option<CString>, reverse!: Bool = false): Option<CValueType> {
        let range = if (reverse) {
            (size - 1)..=0 : -1
        } else {
            0..size
        }
        for (i in range) {
            unsafe {
                if (equals(k, key.read(i).getChars())) {
                    return value.read(i)
                }
            }
        }
        None
    }

    // releasing the keys content can be forced for buckets returned as a result from native side
    func free(alsoFreeKeysContent!: Bool = false) {
        unsafe {
            if (key.isNotNull()) {
                if (alsoFreeKeysContent) {
                    for (i in 0..size) {
                        LibC.free(key.read(i))
                    }
                }
                LibC.free(key)
            }
            if (value.isNotNull()) {
                for (i in 0..size) {
                    value.read(i).free()
                }
                LibC.free(value)
            }
        }
    }
}

// one holder resides in one ValuesBucket
type CHolders = CContactData

// one holder resides in one ValuesBucket
type CGroups = CContactData

@C
struct CContactData {
    static let NULL = CPointer<CContactData>()

    CContactData(let data: CPointer<CachedKeysValuesBucket>, let bucketCount: Int64) {}

    func free(alsoFreeKeysContent!: Bool = false) {
        unsafe {
            for (i in 0..bucketCount) {
                data.read(i).free(alsoFreeKeysContent: alsoFreeKeysContent)
            }
            LibC.free(data)
        }
    }
}

@C
struct CContactsData {
    CContactsData(let contacts: CPointer<CContactData>, let contactsCount: Int64) {}

    func free(alsoFreeKeysContent!: Bool = false) {
        unsafe {
            for (i in 0..contactsCount) {
                contacts.read(i).free(alsoFreeKeysContent: alsoFreeKeysContent)
            }
            LibC.free(contacts)
        }
    }
}

func calloc<T>(count!: Int64 = 1): CPointer<T> where T <: CType {
    return CPointer<T>(unsafe { calloc(UIntNative(count), sizeOf<T>()) })
}

func mallocCString(str: String): Option<CString> {
    var cstr = CString(CPointer<UInt8>())
    try {
        cstr = unsafe { LibC.mallocCString(str) }
    } catch (_: Exception) {
        return None
    }
    return cstr
}

foreign {
    func calloc(nitems: UIntNative, size: UIntNative): CPointer<Unit>

    func FfiOHOSContactAddContact(contextId: Int64, rawContact: CPointer<CachedKeysValuesBucket>,
        contactData: CPointer<CContactData>, errCode: CPointer<Int32>): Int64

    func FfiOHOSContactDeleteContact(contextId: Int64, predicatesId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSContactUpdateContact(contextId: Int64, contactId: Int64, contactData: CPointer<CContactData>,
        predicatesId: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSContactIsLocalContact(contextId: Int64, contactId: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSContactIsMyCard(contextId: Int64, contactId: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSContactQueryMyCard(contextId: Int64, predicatesId: Int64, errCode: CPointer<Int32>): CPointer<CContactsData>

    func FfiOHOSContactQueryHolders(contextId: Int64, errCode: CPointer<Int32>): CPointer<CHolders>

    // is used for contact, contacts, contactsByEmail, contactsByPhone and also for queryKey
    func FfiOHOSContactQueryContacts(contextId: Int64, predicatesId: Int64, errCode: CPointer<Int32>): CPointer<CContactsData>

    func FfiOHOSContactQueryGroups(contextId: Int64, predicatesId: Int64, errCode: CPointer<Int32>): CPointer<CGroups>
}
