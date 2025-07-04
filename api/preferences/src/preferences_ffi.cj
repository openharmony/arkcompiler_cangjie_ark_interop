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

package ohos.preferences

import std.collection.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FfiOHOSPreferencesGetPreferences(context: StageContext, name: CString, dataGroupId: CString,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSPreferencesDeletePreferences(context: StageContext, name: CString, dataGroupId: CString): Int32

    func FfiOHOSPreferencesRemovePreferencesFromCache(context: StageContext, name: CString, dataGroupId: CString): Int32

    func FfiOHOSPreferencesDelete(id: Int64, key: CString): Int32

    func FfiOHOSPreferencesHas(id: Int64, key: CString): Bool

    func FfiOHOSPreferencesOn(id: Int64, mode: CString, funcId: Int64): Int32

    func FfiOHOSPreferencesOff(id: Int64, mode: CString, funcId: Int64): Int32

    func FfiOHOSPreferencesOffAll(id: Int64, mode: CString): Int32

    func FfiOHOSPreferencesGet(id: Int64, key: CString, defValue: CPreferencesValueType): CPreferencesValueType

    func FfiOHOSPreferencesPut(id: Int64, key: CString, value: CPreferencesValueType): Int32

    func FfiOHOSPreferencesGetAll(id: Int64): CPreferencesValueTypes

    func FfiOHOSPreferencesFlush(id: Int64): Unit

    func FfiOHOSPreferencesClear(id: Int64): Unit
}

@C
struct CPreferencesValueType {
    var integer: Int64 = 0
    var double: Float64 = 0.0
    var string: CPointer<UInt8> = CPointer<UInt8>()
    var bool: Bool = false
    var boolArray: CArrBool = CArrBool(CPointer<Bool>(), 0)
    var doubleArray: CArrDouble = CArrDouble(CPointer<Float64>(), 0)
    var stringArray: CArrString = CArrString(CPointer<CString>(), 0)
    var tag: UInt8 = 0

    init(value: ValueType) {
        unsafe {
            match (value) {
                case integer(n) =>
                    tag = 0
                    integer = n
                case double(n) =>
                    tag = 1
                    double = n
                case string(str) =>
                    tag = 2
                    string = LibC.mallocCString(str).getChars()
                case bool(b) =>
                    tag = 3
                    bool = b
                case boolArray(bArray) =>
                    tag = 4
                    let bArrSize = bArray.size
                    let bArr: CPointer<Bool> = cjArr2CArr<Bool, Bool>(bArray, {v => v})
                    boolArray = CArrBool(bArr, bArrSize)
                case doubleArray(dArray) =>
                    tag = 5
                    let dArrsize = dArray.size
                    let dArr: CPointer<Float64> = cjArr2CArr<Float64, Float64>(dArray, {v => v})
                    doubleArray = CArrDouble(dArr, dArrsize)
                case stringArray(sArray) =>
                    tag = 6
                    let sArrsize = sArray.size
                    let sArr: CPointer<CString> = cjArr2CArr<String, CString>(sArray, {str => LibC.mallocCString(str)}) {
                        cstr => LibC.free(cstr)
                    }
                    stringArray = CArrString(sArr, sArrsize)
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(cPreferencesValueType: CPreferencesValueType): ValueType {
        match (cPreferencesValueType.tag) {
            case 0 => return ValueType.integer(cPreferencesValueType.integer)
            case 1 => return ValueType.double(cPreferencesValueType.double)
            case 2 => return ValueType.string(CString(cPreferencesValueType.string).toString())
            case 3 => return ValueType.bool(cPreferencesValueType.bool)
            case 4 =>
                let ptr = cPreferencesValueType.boolArray.head
                let size = cPreferencesValueType.boolArray.size
                let result = unsafe { Array<Bool>(size, {i => ptr.read(i)}) }
                return ValueType.boolArray(result)
            case 5 =>
                let ptr = cPreferencesValueType.doubleArray.head
                let size = cPreferencesValueType.doubleArray.size
                let result = unsafe { Array<Float64>(size, {i => ptr.read(i)}) }
                return ValueType.doubleArray(result)
            case 6 =>
                let ptr = cPreferencesValueType.stringArray.head
                let size = cPreferencesValueType.stringArray.size
                let result = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
                return ValueType.stringArray(result)
            case _ =>
                PREFERENCES_LOG.info("WARNING: Shouldn't have walked here")
                return ValueType.integer(-1)
        }
    }

    func toValueType(): ValueType {
        return parse(this)
    }

    func free() {
        if (this.tag == 2) {
            if (!string.isNull()) {
                unsafe { LibC.free<UInt8>(string) }
            }
            return
        }
        if (this.tag == 4) {
            if (!boolArray.head.isNull()) {
                unsafe { LibC.free<Bool>(boolArray.head) }
            }
            return
        }
        if (this.tag == 5) {
            if (!doubleArray.head.isNull()) {
                unsafe { LibC.free<Float64>(doubleArray.head) }
            }
            return
        }
        if (this.tag == 6) {
            for (i in 0..this.stringArray.size) {
                unsafe {
                    LibC.free(this.stringArray.head.read(i))
                }
            }
            unsafe { LibC.free<CString>(this.stringArray.head) }
            return
        }
    }
}

@C
struct CPreferencesValueTypes {
    let key: CPointer<CString>
    let value: CPointer<CPreferencesValueType>
    let size: Int64

    init(key: CPointer<CString>, value: CPointer<CPreferencesValueType>, size: Int64) {
        this.key = key
        this.value = value
        this.size = size
    }

    static func parse(cPreferencesValueTypes: CPreferencesValueTypes): HashMap<String, ValueType> {
        var result = HashMap<String, ValueType>()
        var typeSize = cPreferencesValueTypes.size
        for (i in 0..typeSize) {
            let pStr = cPreferencesValueTypes.key
            let pValueType = cPreferencesValueTypes.value
            unsafe {
                let resultStr = pStr.read(i).toString()
                let resultCValueType = pValueType.read(i)
                let resultValueType = resultCValueType.toValueType()
                result.add(resultStr, resultValueType)
            }
        }
        return result
    }

    func free() {
        for (i in 0..size) {
            unsafe {
                LibC.free(this.key.read(i))
                this.value.read(i).free()
            }
        }
        unsafe { LibC.free<CString>(this.key) }
        unsafe { LibC.free<CPreferencesValueType>(this.value) }
    }
}
