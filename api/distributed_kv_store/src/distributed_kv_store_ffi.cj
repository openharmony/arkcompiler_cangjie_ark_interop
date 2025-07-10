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

package ohos.distributed_kv_store

import ohos.base.*
import std.collection.*
import ohos.ffi.*

foreign {
    func FfiOHOSDistributedKVStoreCreateKVManager(boudleName: CString, context: StageContext): Int64

    func FfiOHOSDistributedKVStoreGetKVStore(id: Int64, storeId: CString, options: COptions, errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedKVStoreCloseKVStore(id: Int64, appId: CString, storeId: CString): Int32

    func FfiOHOSDistributedKVStoreDeleteKVStore(id: Int64, appId: CString, storeId: CString): Int32

    func FfiOHOSDistributedKVStoreGetAllKVStoreId(id: Int64, appId: CString, errCode: CPointer<Int32>): CArrString

    func FfiOHOSDistributedKVStoreOnDistributedDataServiceDie(id: Int64, funcId: Int64): Int32

    func FfiOHOSDistributedKVStoreOffDistributedDataServiceDie(id: Int64, funcId: Int64): Int32

    func FfiOHOSDistributedKVStoreOffAllDistributedDataServiceDie(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStorePut(id: Int64, key: CString, value: CKVValueType): Int32

    func FfiOHOSDistributedKVStoreSingleKVStorePutBatch(id: Int64, cArrEntry: CArrEntry): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreDelete(id: Int64, key: CString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreDeleteBatch(id: Int64, keys: CArrString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreRemoveDeviceData(id: Int64, deviceId: CString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreGet(id: Int64, key: CString, errCode: CPointer<Int32>): CKVValueType

    func FfiOHOSDistributedKVStoreSingleKVStoreGetEntriesByQuery(id: Int64, queryId: Int64, errCode: CPointer<Int32>): CArrEntry

    func FfiOHOSDistributedKVStoreSingleKVStoreGetEntriesByString(id: Int64, prefix: CString, errCode: CPointer<Int32>): CArrEntry

    func FfiOHOSDistributedKVStoreSingleKVStoreGetResultSetByString(id: Int64, keyPrefix: CString,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedKVStoreSingleKVStoreGetResultSetByQuery(id: Int64, queryId: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedKVStoreSingleKVStoreCloseResultSet(id: Int64, resultSetId: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreGetResultSize(id: Int64, queryId: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreBackup(id: Int64, file: CString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreRestore(id: Int64, file: CString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreDeleteBackup(id: Int64, cArrStr: CArrString, errCode: CPointer<Int32>): CStringNum

    func FfiOHOSDistributedKVStoreSingleKVStoreStartTransaction(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreCommit(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreRollback(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreEnableSync(id: Int64, enabled: Bool): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreSetSyncRange(id: Int64, localLabels: CArrString,
        remoteSupportLabels: CArrString): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreSetSyncParam(id: Int64, defaultAllowedDelayMs: UInt32): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreSync(id: Int64, deviceIds: CArrString, mode: UInt8, delayMs: Int32): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreSyncByQuery(id: Int64, deviceIds: CArrString, queryId: Int64,
        mode: UInt8, delayMs: Int32): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreOnDataChange(id: Int64, sb: UInt8, funcId: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreOnSyncComplete(id: Int64, funcId: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreOffDataChange(id: Int64, funcId: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreOffAllDataChange(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreOffAllSyncComplete(id: Int64): Int32

    func FfiOHOSDistributedKVStoreSingleKVStoreGetSecurityLevel(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSDistributedKVStoreQueryConstructor(): Int64

    func FfiOHOSDistributedKVStoreQueryReset(id: Int64): Unit

    func FfiOHOSDistributedKVStoreQueryEqualTo(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryNotEqualTo(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryGreaterThan(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryLessThan(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryGreaterThanOrEqualTo(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryLessThanOrEqualTo(id: Int64, field: CString, value: CKVValueType): Unit

    func FfiOHOSDistributedKVStoreQueryIsNull(id: Int64, field: CString): Unit

    func FfiOHOSDistributedKVStoreQueryInString(id: Int64, field: CString, valueList: CArrString): Unit

    func FfiOHOSDistributedKVStoreQueryNotInString(id: Int64, field: CString, valueList: CArrString): Unit

    func FfiOHOSDistributedKVStoreQueryLike(id: Int64, field: CString, value: CString): Unit

    func FfiOHOSDistributedKVStoreQueryUnlike(id: Int64, field: CString, value: CString): Unit

    func FfiOHOSDistributedKVStoreQueryAnd(id: Int64): Unit

    func FfiOHOSDistributedKVStoreQueryOr(id: Int64): Unit

    func FfiOHOSDistributedKVStoreQueryOrderByAsc(id: Int64, field: CString): Unit

    func FfiOHOSDistributedKVStoreQueryOrderByDesc(id: Int64, field: CString): Unit

    func FfiOHOSDistributedKVStoreQueryLimit(id: Int64, total: Int32, offset: Int32): Unit

    func FfiOHOSDistributedKVStoreQueryIsNotNull(id: Int64, field: CString): Unit

    func FfiOHOSDistributedKVStoreQueryBeginGroup(id: Int64): Unit

    func FfiOHOSDistributedKVStoreQueryEndGroup(id: Int64): Unit

    func FfiOHOSDistributedKVStoreQueryPrefixKey(id: Int64, prefix: CString): Unit

    func FfiOHOSDistributedKVStoreQuerySetSuggestIndex(id: Int64, index: CString): Unit

    func FfiOHOSDistributedKVStoreQueryDeviceId(id: Int64, deviceId: CString): Unit

    func FfiOHOSDistributedKVStoreQueryGetSqlLike(id: Int64): CString

    func FfiOHOSDistributedKVStoreDeviceKVStoreGet(id: Int64, deviceId: CString, key: CString, errCode: CPointer<Int32>): CKVValueType

    func FfiOHOSDistributedKVStoreDeviceKVStoreGetEntries(id: Int64, deviceId: CString, keyPrefix: CString,
        errCode: CPointer<Int32>): CArrEntry

    func FfiOHOSDistributedKVStoreDeviceKVStoreGetEntriesQuery(id: Int64, deviceId: CString, queryId: Int64,
        errCode: CPointer<Int32>): CArrEntry

    func FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSet(id: Int64, deviceId: CString, keyPrefix: CString,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSetQuery(id: Int64, deviceId: CString, queryId: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSize(id: Int64, deviceId: CString, queryId: Int64,
        errCode: CPointer<Int32>): Int32

    func FfiOHOSDistributedKVStoreKVStoreResultSetGetCount(id: Int64): Int32

    func FfiOHOSDistributedKVStoreKVStoreResultSetGetPosition(id: Int64): Int32

    func FfiOHOSDistributedKVStoreKVStoreResultSetMoveToFirst(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetMoveToLast(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetMoveToNext(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetMoveToPrevious(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetMove(id: Int64, offset: Int32): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetMoveToPosition(id: Int64, position: Int32): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetIsFirst(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetIsLast(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetIsBeforeFirst(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetIsAfterLast(id: Int64): Bool

    func FfiOHOSDistributedKVStoreKVStoreResultSetGetEntry(id: Int64): CEntry

    func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32
}

@C
struct CArrByte {
    CArrByte(
        let head: CPointer<UInt8>,
        let size: Int64
    ) {}
}

@C
struct CStringNum {
    CStringNum(
        let headString: CPointer<CString>,
        let headInt32: CPointer<Int32>,
        let size: Int64
    ) {}

    func toArrayAndFree(): ArrayList<(String, Int32)> {
        unsafe {
            let res = ArrayList<(String, Int32)>(size, {i => (headString.read(i).toString(), headInt32.read(i))})
            if (!this.headString.isNull()) {
                for (i in 0..this.size) {
                    LibC.free(this.headString.read(i))
                }
            }
            LibC.free<CString>(this.headString)
            LibC.free<Int32>(this.headInt32)
            return res
        }
    }
}

@C
struct CKVValueType {
    var string: CPointer<UInt8>
    var integer: Int32
    var float: Float32
    var byteArray: CArrByte
    var bool: Bool
    var double: Float64
    var tag: UInt8

    init(value: ValueType) {
        string = CPointer<UInt8>()
        integer = 0
        float = 0.0
        byteArray = CArrByte(CPointer<UInt8>(), 0)
        bool = false
        double = 0.0

        match (value) {
            case STRING(v) =>
                string = unsafe { LibC.mallocCString(v).getChars() }
                tag = 0
            case INTEGER(v) =>
                integer = v
                tag = 1
            case FLOAT(v) =>
                float = v
                tag = 2
            case BYTE_ARRAY(v) =>
                let bArrSize = v.size
                let bArr: CPointer<UInt8> = safeMalloc<UInt8>(count: bArrSize)
                unsafe {
                    let cp = acquireArrayRawData(v)
                    memcpy_s(bArr, UIntNative(bArrSize), cp.pointer, UIntNative(bArrSize))
                    releaseArrayRawData(cp)
                }
                byteArray = CArrByte(bArr, bArrSize)
                tag = 3
            case BOOLEAN(v) =>
                bool = v
                tag = 4
            case DOUBLE(v) =>
                double = v
                tag = 5
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func toValueType(): ValueType {
        match (this.tag) {
            case 0 => return ValueType.STRING(CString(this.string).toString())
            case 1 => return ValueType.INTEGER(this.integer)
            case 2 => return ValueType.FLOAT(this.float)
            case 3 =>
                let ptr = this.byteArray.head
                let size = this.byteArray.size
                if (ptr.isNull()) {
                    return ValueType.BYTE_ARRAY(Array<UInt8>())
                }
                let result = unsafe { Array<UInt8>(size, {i => ptr.read(i)}) }
                return ValueType.BYTE_ARRAY(result)
            case 4 => return ValueType.BOOLEAN(this.bool)
            case 5 => return ValueType.DOUBLE(this.double)
            case _ =>
                KV_STORE_LOG.info("WARNING: Blob have no data!")
                return ValueType.INTEGER(-1)
        }
    }

    func free() {
        if (this.tag == 0) {
            if (!string.isNull()) {
                unsafe { LibC.free<UInt8>(string) }
            }
            return
        }
        if (this.tag == 3) {
            if (!byteArray.head.isNull()) {
                unsafe { LibC.free<UInt8>(byteArray.head) }
            }
            return
        }
    }

    func asResource(): CTypeResource<CKVValueType> {
        CTypeResource(this, free)
    }
}

@C
struct CFieldNode {
    var nullable: Bool
    var defaultString: CPointer<UInt8>
    var type_: Int32

    init(fieldNode: FieldNode) {
        nullable = fieldNode.nullable
        type_ = fieldNode.type_
        defaultString = unsafe { LibC.mallocCString(fieldNode.default).getChars() }
    }

    func free() {
        if (!defaultString.isNull()) {
            unsafe { LibC.free<UInt8>(defaultString) }
        }
    }
}

@C
struct CSchema {
    var root: CFieldNode
    var indexes: CPointer<CString>
    var indexesSize: Int64
    var mode: Int32
    var skip: Int32

    init(schema: Schema) {
        indexesSize = schema.indexes.size
        mode = schema.mode
        skip = schema.skip
        let node = CFieldNode(schema.root)
        indexes = unsafe { cjArr2CArr<String, CString>(schema.indexes, FUNCTION_S2CS, FUNCTION_CS_FREE, node.free) }
        root = node
    }

    func free() {
        root.free()
        if (indexes.isNull()) {
            return
        }
        for (i in 0..indexesSize) {
            unsafe {
                LibC.free(indexes.read(i))
            }
        }
        unsafe { LibC.free<CString>(indexes) }
    }
}

@C
struct COptions {
    var createIfMissing: Bool
    var encrypt: Bool
    var backup: Bool
    var autoSync: Bool
    var kvStoreType: Int32
    var securityLevel: Int32
    var schema: CSchema

    init(options: Options, kvStoreType: KVStoreType) {
        createIfMissing = options.createIfMissing
        encrypt = options.encrypt
        backup = options.backup
        autoSync = options.autoSync
        this.kvStoreType = kvStoreType.getValue()
        securityLevel = options.securityLevel.getValue()
        schema = CSchema(options.schema)
    }

    func free() {
        schema.free()
    }

    func asResource(): CTypeResource<COptions> {
        CTypeResource(this, free)
    }
}

@C
struct CEntry {
    var key: CString
    var value: CKVValueType
    init(entry: Entry) {
        this.key = unsafe { LibC.mallocCString(entry.key) }
        try {
            this.value = CKVValueType(entry.value)
        } catch (e: Exception) {
            unsafe { LibC.free(this.key) }
            throw e
        }
    }

    func toEntry(): Entry {
        return Entry(key.toString(), value.toValueType())
    }

    func free() {
        unsafe { LibC.free(key) }
        value.free()
    }
}

@C
struct CArrEntry {
    var head: CPointer<CEntry>
    var size: Int64

    init(arr: ArrayList<Entry>) {
        size = arr.size
        unsafe {
            let constructor = {p: Entry => CEntry(p)}
            let destructor = {p: CEntry => p.free()}
            head = cjArr2CArr<Entry, CEntry>(arr.toArray(), constructor, destructor)
        }
    }

    func toArray(): ArrayList<Entry> {
        if (head.isNull()) {
            return ArrayList<Entry>()
        }
        unsafe {
            return ArrayList<Entry>(size, {i => Entry(head.read(i).key.toString(), head.read(i).value.toValueType())})
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free<CEntry>(head)
        }
    }
}

@C
struct CChangeNotification {
    CChangeNotification(
        var insertEntries: CArrEntry,
        var updateEntries: CArrEntry,
        var deleteEntries: CArrEntry,
        var deviceId: CString
    ) {}
}
