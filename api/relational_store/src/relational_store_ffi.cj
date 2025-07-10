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

package ohos.relational_store

import ohos.ffi.*
import std.collection.*
import std.time.*
import ohos.base.*

type StageContext = CPointer<Unit>

foreign {
    func FfiOHOSRelationalStoreGetRdbStore(context: StageContext, config: RetStoreConfig, errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreDeleteRdbStore(context: StageContext, name: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSRelationalStoreDeleteRdbStoreConfig(context: StageContext, config: RetStoreConfig,
        errCode: CPointer<Int32>): Unit

    func FfiOHOSRelationalStoreQuery(id: Int64, predicatesID: Int64, columnsArray: CPointer<CString>, size: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreRemoteQuery(id: Int64, device: CString, predicatesID: Int64,
        columnsArray: CPointer<CString>, size: Int64): Int64

    func FfiOHOSRelationalStoreDelete(id: Int64, predicatesID: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreSetDistributedTables(id: Int64, tables: CPointer<CString>, tablesSize: Int64): Int32

    func FfiOHOSRelationalStoreSetDistributedTablesType(id: Int64, tables: CPointer<CString>, tablesSize: Int64,
        distributedType: Int32): Int32

    func FfiOHOSRelationalStoreSetDistributedTablesConfig(id: Int64, tables: CPointer<CString>, tablesSize: Int64,
        distributedType: Int32, config: RetDistributedConfig): Int32

    func FfiOHOSRelationalStoreBeginTransaction(id: Int64): Int32

    func FfiOHOSRelationalStoreCommit(id: Int64): Int32

    func FfiOHOSRelationalStoreRollBack(id: Int64): Int32

    func FfiOHOSRelationalStoreBackUp(id: Int64, destName: CString): Int32

    func FfiOHOSRelationalStoreReStore(id: Int64, cSrcName: CString): Int32

    func FfiOHOSRelationalStoreObtainDistributedTableName(id: Int64, device: CString, table: CString): CString

    func FfiOHOSRelationalStoreInsert(id: Int64, table: CString, value: ValuesBucket, conflict: Int32,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreUpdate(id: Int64, valuesBucket: ValuesBucket, predicatesID: Int64,
        conflictResolution: Int32, errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreExecuteSql(id: Int64, sql: CString, errCode: CPointer<Int32>): Unit

    func FfiOHOSRelationalStoreSync(id: Int64, mode: Int32, predicatesID: Int64, errCode: CPointer<Int32>): CArrSyncResult

    func FfiOHOSRelationalStoreRdbPredicatesConstructor(tablename: CString): Int64

    func FfiOHOSRelationalStoreInDevices(id: Int64, devicesArray: CPointer<CString>, devicesSize: Int64): Int32

    func FfiOHOSRelationalStoreInAllDevices(id: Int64): Int32

    func FfiOHOSRelationalStoreBeginWrap(id: Int64): Int32

    func FfiOHOSRelationalStoreEndWrap(id: Int64): Int32

    func FfiOHOSRelationalStoreOr(id: Int64): Int32

    func FfiOHOSRelationalStoreAnd(id: Int64): Int32

    func FfiOHOSRelationalStoreContains(id: Int64, field: CString, value: CString): Int32

    func FfiOHOSRelationalStoreBeginsWith(id: Int64, field: CString, value: CString): Int32

    func FfiOHOSRelationalStoreEndsWith(id: Int64, field: CString, value: CString): Int32

    func FfiOHOSRelationalStoreIsNull(id: Int64, field: CString): Int32

    func FfiOHOSRelationalStoreIsNotNull(id: Int64, field: CString): Int32

    func FfiOHOSRelationalStoreLike(id: Int64, field: CString, value: CString): Int32

    func FfiOHOSRelationalStoreGlob(id: Int64, field: CString, value: CString): Int32

    func FfiOHOSRelationalStoreOrderByAsc(id: Int64, field: CString): Int32

    func FfiOHOSRelationalStoreOrderByDesc(id: Int64, field: CString): Int32

    func FfiOHOSRelationalStoreDistinct(id: Int64): Int32

    func FfiOHOSRelationalStoreLimitAs(id: Int64, value: Int32): Int32

    func FfiOHOSRelationalStoreOffsetAs(id: Int64, rowOffset: Int32): Int32

    func FfiOHOSRelationalStoreGroupBy(id: Int64, fieldsArray: CPointer<CString>, fieldsSize: Int64): Int32

    func FfiOHOSRelationalStoreIndexedBy(id: Int64, field: CString): Int32

    func FfiOHOSRelationalStoreLessThanOrEqualTo(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreEqualTo(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreGreaterThanOrEqualTo(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreGreaterThan(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreNotBetween(id: Int64, field: CString, lowValue: RetValueType, highValue: RetValueType): Int32

    func FfiOHOSRelationalStoreLessThan(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreBetween(id: Int64, field: CString, lowValue: RetValueType, highValue: RetValueType): Int32

    func FfiOHOSRelationalStoreIn(id: Int64, field: CString, values: CPointer<RetValueType>, valuesSize: Int64): Int32

    func FfiOHOSRelationalStoreNotIn(id: Int64, field: CString, values: CPointer<RetValueType>, valuesSize: Int64): Int32

    func FfiOHOSRelationalStoreNotEqualTo(id: Int64, field: CString, value: RetValueType): Int32

    func FfiOHOSRelationalStoreGetAllColumnNames(id: Int64): CArrString

    func FfiOHOSRelationalStoreGetColumnCount(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSRelationalStoreGetRowCount(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSRelationalStoreGetRowIndex(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSRelationalStoreIsAtFirstRow(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreIsAtLastRow(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreIsEnded(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreIsStarted(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreIsClosed(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGetDouble(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): Float64

    func FfiOHOSRelationalStoreGoToRow(id: Int64, position: Int32, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGoToPreviousRow(id: Int64, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGoToLastRow(id: Int64, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGetColumnName(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): CString

    func FfiOHOSRelationalStoreIsColumnNull(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGetAsset(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): RetAsset

    func FfiOHOSRelationalStoreClose(id: Int64): Int32

    func FfiOHOSRelationalStoreGetColumnIndex(id: Int64, columnName: CString, rtnCode: CPointer<Int32>): Int32

    func FfiOHOSRelationalStoreGetString(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): CString

    func FfiOHOSRelationalStoreGoToFirstRow(id: Int64, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGetAssets(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): RetAssets

    func FfiOHOSRelationalStoreGetLong(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreGoToNextRow(id: Int64, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreGetBlob(id: Int64, columnIndex: Int32, rtnCode: CPointer<Int32>): CArrUI8

    func FfiOHOSRelationalStoreGoTo(id: Int64, offset: Int32, rtnCode: CPointer<Int32>): Bool

    func FfiOHOSRelationalStoreCleanDirtyData(id: Int64, tableName: CString, cursor: UInt64): Int32

    func FfiOHOSRelationalStoreBatchInsert(id: Int64, tableName: CString, values: CPointer<ValuesBucket>,
        valuesSize: Int64, insertNum: CPointer<Int64>): Int32

    func FfiOHOSRelationalStoreQuerySql(id: Int64, sql: CString, bindArgs: CPointer<RetValueType>, size: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSRelationalStoreExecuteSqlBindArgs(id: Int64, sql: CString, bindArgs: CPointer<RetValueType>,
        bindArgsSize: Int64, errCode: CPointer<Int32>): Unit

    func FfiOHOSRelationalStoreGetRow(id: Int64, errCode: CPointer<Int32>): ValuesBucket

    func FfiOHOSRelationalStoreOn(id: Int64, event: CString, interProcess: Bool, callback: Int64, observerID: Int64): Int32

    func FfiOHOSRelationalStoreOnArrStr(id: Int64, subscribeType: Int32, callbackId: Int64): Int32

    func FfiOHOSRelationalStoreOnChangeInfo(id: Int64, subscribeType: Int32, callbackId: Int64): Int32

    func FfiOHOSRelationalStoreOnProgressDetails(id: Int64, callbackId: Int64): Int32

    func FfiOHOSRelationalStoreOff(id: Int64, event: CString, interProcess: Bool, callback: Int64): Int32

    func FfiOHOSRelationalStoreOffAll(id: Int64, event: CString, interProcess: Bool): Int32

    func FfiOHOSRelationalStoreOffArrStrChangeInfo(id: Int64, subscribeType: Int32, callbackId: Int64): Int32

    func FfiOHOSRelationalStoreOffArrStrChangeInfoAll(id: Int64, subscribeType: Int32): Int32

    func FfiOHOSRelationalStoreOffProgressDetails(id: Int64, callbackId: Int64): Int32

    func FfiOHOSRelationalStoreOffProgressDetailsAll(id: Int64): Int32

    func FfiOHOSRelationalStoreEmit(id: Int64, event: CString): Int32

    func FfiOHOSRelationalStoreCloudSync(id: Int64, mode: Int32, tables: CArrString, callbackId: Int64): Int32

    func calloc(nitems: UIntNative, size: UIntNative): CPointer<Unit>

    func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

    func FfiOHOSRelationalStoreGetVersion(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSRelationalStoreSetVersion(id: Int64, value: Int32, errCode: CPointer<Int32>): Unit
}

func calloc<T>(count!: Int64 = 1): CPointer<T> where T <: CType {
    return CPointer<T>(unsafe { calloc(sizeOf<T>(), UIntNative(count)) })
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

func cArrStringtoArrayStringAndFree(carr: CArrString): Array<String> {
    if (carr.head.isNull() || carr.size <= 0) {
        return Array<String>()
    }
    let res = ArrayList<String>()
    for (i in 0..carr.size) {
        unsafe { res.add(carr.head.read(i).toString()) }
    }
    carr.free()
    return res.toArray()
}

enum CallbackType {
    | ParamArrStr
    | ParamChangeInfo
}

@C
struct RetStoreConfig {
    RetStoreConfig(
        let name: CString,
        let securityLevel: Int32,
        let encrypt: Bool,
        let dataGroupId: CString,
        let customDir: CString,
        let isSearchable: Bool,
        let autoCleanDirtyData: Bool
    ) {}

    static func create(storeConfig: StoreConfig): Option<RetStoreConfig> {
        unsafe {
            let name = mallocCString(storeConfig.name)
            let dataGroupId = mallocCString(storeConfig.dataGroupId)
            let customDir = mallocCString(storeConfig.customDir)
            if (name.isSome() && dataGroupId.isSome() && customDir.isSome()) {
                return RetStoreConfig(name.getOrThrow(), storeConfig.securityLevel.getValue(), storeConfig.encrypt,
                    dataGroupId.getOrThrow(), customDir.getOrThrow(), false, storeConfig.autoCleanDirtyData)
            } else {
                if (name.isSome()) {
                    LibC.free(name.getOrThrow())
                }
                if (dataGroupId.isSome()) {
                    LibC.free(dataGroupId.getOrThrow())
                }
                if (customDir.isSome()) {
                    LibC.free(customDir.getOrThrow())
                }
                return None
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(name)
            LibC.free(dataGroupId)
            LibC.free(customDir)
        }
    }
}

@C
struct RetAsset {
    RetAsset(
        let name: CPointer<UInt8>,
        let uri: CPointer<UInt8>,
        let path: CPointer<UInt8>,
        let createTime: CPointer<UInt8>,
        let modifyTime: CPointer<UInt8>,
        let size: CPointer<UInt8>,
        let status: Int32
    ) {}

    static func create(asset: Asset): Option<RetAsset> {
        unsafe {
            let name = mallocCString(asset.name)
            let uri = mallocCString(asset.uri)
            let path = mallocCString(asset.path)
            let createTime = mallocCString(asset.createTime)
            let modifyTime = mallocCString(asset.modifyTime)
            let size = mallocCString(asset.size)
            if (name.isSome() && uri.isSome() && path.isSome() && createTime.isSome() && modifyTime.isSome() &&
                size.isSome()) {
                return RetAsset(name.getOrThrow().getChars(), uri.getOrThrow().getChars(), path.getOrThrow().getChars(),
                    createTime.getOrThrow().getChars(), modifyTime.getOrThrow().getChars(), size.getOrThrow().getChars(),
                    asset.status.getValue())
            } else {
                if (name.isSome()) {
                    LibC.free(name.getOrThrow())
                }
                if (uri.isSome()) {
                    LibC.free(uri.getOrThrow())
                }
                if (path.isSome()) {
                    LibC.free(path.getOrThrow())
                }
                if (createTime.isSome()) {
                    LibC.free(createTime.getOrThrow())
                }
                if (modifyTime.isSome()) {
                    LibC.free(modifyTime.getOrThrow())
                }
                if (size.isSome()) {
                    LibC.free(size.getOrThrow())
                }
                return None
            }
        }
    }

    init() {
        this.name = CPointer<UInt8>()
        this.uri = CPointer<UInt8>()
        this.path = CPointer<UInt8>()
        this.createTime = CPointer<UInt8>()
        this.modifyTime = CPointer<UInt8>()
        this.size = CPointer<UInt8>()
        this.status = 0
    }

    func free() {
        unsafe {
            LibC.free<UInt8>(name)
            LibC.free<UInt8>(uri)
            LibC.free<UInt8>(path)
            LibC.free<UInt8>(createTime)
            LibC.free<UInt8>(modifyTime)
            LibC.free<UInt8>(size)
        }
    }
}

func convert(asset: RetAsset): Asset {
    let name = CString(asset.name).toString()
    let uri = CString(asset.uri).toString()
    let path = CString(asset.path).toString()
    let createTime = CString(asset.createTime).toString()
    let modifyTime = CString(asset.modifyTime).toString()
    let size = CString(asset.size).toString()
    let status = AssetStatus.parse(asset.status)
    return Asset(name, uri, path, createTime, modifyTime, size, status: status)
}

@C
struct CArrSyncResult {
    CArrSyncResult(
        let str: CPointer<CString>,
        let num: CPointer<Int32>,
        let size: Int64
    ) {}

    func free() {
        if (str.isNotNull()) {
            for (i in 0..size) {
                unsafe { LibC.free(str.read(i)) }
            }
        }
        unsafe { LibC.free(str) }
        unsafe { LibC.free(num) }
    }
}

func convert(carr: CArrSyncResult): Array<(String, Int32)> {
    if (carr.size <= 0 || carr.str.isNull() || carr.num.isNull()) {
        carr.free()
        return Array<(String, Int32)>()
    }
    let arr = Array<(String, Int32)>(carr.size, repeat: ("", 0))
    for (i in 0..carr.size) {
        unsafe { arr[i] = (carr.str.read(i).toString(), carr.num.read(i)) }
    }
    return arr
}

@C
struct RetAssets {
    let head: CPointer<RetAsset>
    let size: Int64

    init(head: CPointer<RetAsset>, size: Int64) {
        this.head = head
        this.size = size
    }
}

@C
struct RetValueType {
    RetValueType(
        var integer: Int64,
        var double: Float64,
        var string: CPointer<UInt8>,
        var boolean: Bool,
        var Uint8Array: CArrUI8,
        var asset: RetAsset,
        var assets: RetAssets,
        var tag: UInt8
    ) {}

    static func create(value: ValueType): Option<RetValueType> {
        var (integer, double, string, boolean, Uint8Array, asset, assets) = (0, 0.0, CPointer<UInt8>(), false, CArrUI8(
                CPointer<UInt8>(), 0), RetAsset(), RetAssets(CPointer<RetAsset>(), 0))
        var tag: UInt8 = 0
        match (value) {
            case null => tag = 0
            case integer(n) =>
                tag = 1
                integer = n
            case double(n) =>
                tag = 2
                double = n
            case string(str) =>
                tag = 3
                match (mallocCString(str)) {
                    case Some(v) => string = v.getChars()
                    case None => return None
                }
            case boolean(b) =>
                tag = 4
                boolean = b
            case Uint8Array(uint8Arr) =>
                tag = 5
                let uint8ArrSize = uint8Arr.size
                let uint8Array: CPointer<UInt8> = unsafe { calloc<UInt8>(count: uint8ArrSize) }
                if (uint8Array.isNull()) {
                    return None
                }
                unsafe {
                    let cp = acquireArrayRawData(uint8Arr)
                    memcpy_s(uint8Array, UIntNative(uint8ArrSize), cp.pointer, UIntNative(uint8ArrSize))
                    releaseArrayRawData(cp)
                }
                Uint8Array = CArrUI8(uint8Array, uint8ArrSize)
            case AssetEnum(a) =>
                tag = 6
                match (RetAsset.create(a)) {
                    case Some(v) => asset = v
                    case None => return None
                }
            case AssetsEnum(a) =>
                tag = 7
                let assetArray: CPointer<RetAsset> = unsafe { calloc<RetAsset>(count: a.size) }
                if (assetArray.isNull() || unsafe { !createAssets(a, assetArray, a.size) }) {
                    return None
                }
                assets = RetAssets(assetArray, a.size)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
        return RetValueType(integer, double, string, boolean, Uint8Array, asset, assets, tag)
    }

    unsafe static func createAssets(a: Array<Asset>, assetArray: CPointer<RetAsset>, assetsSize: Int64): Bool {
        if (assetArray.isNull()) {
            return false
        }
        for (i in 0..assetsSize) {
            let tmpAsset = RetAsset.create(a[i])
            if (tmpAsset.isNone()) {
                for (j in 0..assetsSize) {
                    assetArray.read(j).free()
                }
                LibC.free(assetArray)
                return false
            }
            assetArray.write(i, tmpAsset.getOrThrow())
        }
        return true
    }

    func free() {
        if (this.tag == 3) {
            unsafe { LibC.free<UInt8>(string) }
            return
        }
        if (this.tag == 5) {
            unsafe { LibC.free<UInt8>(Uint8Array.head) }
            return
        }
        if (this.tag == 6) {
            asset.free()
            return
        }
        if (this.tag == 7) {
            if (assets.head.isNull()) {
                return
            }
            for (i in 0..assets.size) {
                unsafe { assets.head.read(i).free() }
            }
            unsafe { LibC.free<RetAsset>(assets.head) }
        }
    }
}

func convert(value: RetValueType): ValueType {
    unsafe {
        let tag = value.tag
        let integer = value.integer
        let double = value.double
        let string = value.string
        let boolean = value.boolean
        let uint8Array = value.Uint8Array.head
        let uint8ArrSize = value.Uint8Array.size
        let asset = value.asset
        let assets = value.assets.head
        let assetsSize = value.assets.size
        match (tag) {
            case 0 => ValueType.null
            case 1 => ValueType.integer(integer)
            case 2 => ValueType.double(double)
            case 3 => ValueType.string(CString(string).toString())
            case 4 => ValueType.boolean(boolean)
            case 5 =>
                if (uint8Array.isNull()) {
                    return ValueType.Uint8Array(Array<UInt8>())
                }
                return ValueType.Uint8Array(Array<UInt8>(uint8ArrSize, {i => uint8Array.read(i)}))
            case 6 => ValueType.AssetEnum(convert(asset))
            case 7 =>
                if (assets.isNull()) {
                    return ValueType.AssetsEnum(Array<Asset>())
                }
                ValueType.AssetsEnum(Array<Asset>(assetsSize, {i => convert(assets.read(i))}))
            case _ => throw Exception("Unknown error.")
        }
    }
}


@C
struct CStatistic {
    CStatistic(
        let total: UInt32,
        let successful: UInt32,
        let failed: UInt32,
        let remained: UInt32
    ) {}
}

@C
struct ValuesBucket {
    ValuesBucket(
        let key: CPointer<CString>,
        let value: CPointer<RetValueType>,
        
        let size: Int64
    ) {}

    static func create(map: Map<String, ValueType>): Option<ValuesBucket> {
        unsafe {
            let size = map.size
            let key = calloc<CString>(count: size)
            let value = calloc<RetValueType>(count: size)
            if (key.isNull() || value.isNull()) {
                LibC.free(key)
                LibC.free(value)
                return None
            }
            var i = 0
            for ((k, v) in map) {
                let tmpKey = mallocCString(k)
                if (tmpKey.isNone()) {
                    freeKeyValue(key, value, i)
                    LibC.free(key)
                    LibC.free(value)
                    return None
                }
                let tmpValue = RetValueType.create(v)
                if (tmpValue.isNone()) {
                    freeKeyValue(key, value, i)
                    LibC.free(tmpKey.getOrThrow())
                    LibC.free(key)
                    LibC.free(value)
                    return None
                }
                key.write(i, tmpKey.getOrThrow())
                value.write(i, tmpValue.getOrThrow())
                i++
            }
            return ValuesBucket(key, value, size)
        }
    }

    static func freeKeyValue(key: CPointer<CString>, value: CPointer<RetValueType>, i: Int64): Unit {
        unsafe {
            for (j in 0..i) {
                LibC.free(key.read(j))
                value.read(j).free()
            }
        }
    }

    func free() {
        unsafe {
            if (key.isNotNull()) {
                for (i in 0..size) {
                    LibC.free(key.read(i))
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

func convert(value: ValuesBucket): HashMap<String, ValueType> {
    if (value.size < 0) {
        return HashMap<String, ValueType>()
    }
    unsafe {
        let map = HashMap<String, ValueType>()
        if (value.key.isNull() || value.value.isNull()) {
            return map
        }
        for (i in 0..value.size) {
            map.add(value.key.read(i).toString(), convert(value.value.read(i)))
        }
        return map
    }
}

@C
struct RetDistributedConfig {
    let autoSync: Bool

    init(autoSync: Bool) {
        this.autoSync = autoSync
    }
}
