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
import std.math.*
import std.time.*
import std.sync.*
import ohos.labels.*
import ohos.base.*

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class RdbStore <: RemoteDataLite {
    let eventCallbackMaps = HashMap<String, ArrayList<(CallbackObject, Int64)>>()
    let observers_ = ArrayList<(CallbackObject, Int64)>()
    let syncObservers_ = ArrayList<(CallbackObject, Int64)>()
    let onOffMutex = Mutex()
    var versionValue: Int32 = 0

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public mut prop version: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                versionValue = FfiOHOSRelationalStoreGetVersion(getID(), inout errCode)
                throwIfNotSuccess(errCode, "RdbStore", "get version")
                return versionValue
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiOHOSRelationalStoreSetVersion(getID(), value, inout errCode)
                throwIfNotSuccess(errCode, "RdbStore", "set version")
                versionValue = value
            }
        }
    }

    /**
     * @brief  query(predicates: RdbPredicates, columns?: Array<string>):Promise<ResultSet>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func query(predicates: RdbPredicates, columns: Array<String>): ResultSet {
        var errCode: Int32 = 0
        let columnsSize = columns.size
        var columnsArray: CPointer<CString> = CPointer<CString>()
        if (columnsSize > 0) {
            columnsArray = unsafe { LibC.malloc<CString>(count: columnsSize) }
            throwIfOOM(columnsArray.isNull(), "RdbStore", "query")
        }
        for (i in 0..columnsSize) {
            unsafe {
                try {
                    columnsArray.write(i, LibC.mallocCString(columns[i]))
                } catch (_: Exception) {
                    freeCStringArray(columnsArray, i)
                    LibC.free<CString>(columnsArray)
                    RELATIONAL_STORE_LOG.error("RdbStore query failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore query failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
        }

        var id: Int64
        unsafe {
            id = FfiOHOSRelationalStoreQuery(getID(), predicates.getID(), columnsArray, columnsSize, inout errCode)
        }
        for (i in 0..columnsSize) {
            unsafe { LibC.free(columnsArray.read(i)) }
        }
        unsafe { LibC.free<CString>(columnsArray) }
        throwIfNotSuccess(errCode, "RdbStore", "query")
        return ResultSet(id)
    }

    /**
     * @brief delete(predicates: RdbPredicates, callback: AsyncCallback<number>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func delete(predicates: RdbPredicates): Int64 {
        var num: Int64
        unsafe {
            var errCode: Int32 = 0
            num = FfiOHOSRelationalStoreDelete(getID(), predicates.getID(), inout errCode)
            throwIfNotSuccess(errCode, "RdbStore", "delete")
        }
        return num
    }

    /**
     * @brief backup(destName:string, callback: AsyncCallback<void>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func backup(destName: String): Unit {
        unsafe {
            if (destName.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore backup failed: ${paramError("destName", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore backup failed: ${paramError("destName", "not empty string")}")
            }
            let cDestName: CString = LibC.mallocCString(destName)
            let code = FfiOHOSRelationalStoreBackUp(getID(), cDestName)
            LibC.free(cDestName)
            throwIfNotSuccess(code, "RdbStore", "backup")
        }
    }

    /**
     * @brief restore(srcName:string, callback: AsyncCallback<void>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func restore(srcName: String): Unit {
        unsafe {
            if (srcName.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore restore failed: ${paramError("srcName", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore restore failed: ${paramError("srcName", "not empty string")}")
            }
            let cSrcName: CString = LibC.mallocCString(srcName)
            let code = FfiOHOSRelationalStoreReStore(getID(), cSrcName)
            LibC.free(cSrcName)
            throwIfNotSuccess(code, "RdbStore", "restore")
        }
    }

    /**
     * @brief commit():void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func commit(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreCommit(getID()) }
        throwIfNotSuccess(code, "RdbStore", "commit")
    }

    /**
     * @brief rollBack():void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func rollBack(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreRollBack(getID()) }
        throwIfNotSuccess(code, "RdbStore", "rollBack")
    }

    /**
     * @brief beginTransaction():void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func beginTransaction(): Unit {
        let code = unsafe { FfiOHOSRelationalStoreBeginTransaction(getID()) }
        throwIfNotSuccess(code, "RdbStore", "beginTransaction")
    }

    /**
     * @brief executeSql(sql: string, callback: AsyncCallback<void>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func executeSql(sql: String): Unit {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
            }
            let cSql: CString = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            FfiOHOSRelationalStoreExecuteSql(getID(), cSql, inout errCode)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "beginTransaction")
        }
    }

    /**
     * @brief  insert(table: string, values: ValuesBucket):Promise<number>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func insert(table: String, values: Map<String, ValueType>): Int64 {
        if (table.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore insert failed: ${paramError("table", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore insert failed: ${paramError("table", "not empty string")}")
        }
        return insert(table, values, ConflictResolution.ON_CONFLICT_NONE)
    }

    /**
     * @brief  insert(table: string, values: ValuesBucket, conflict: ConflictResolution,
     *  callback: AsyncCallback<number>): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func insert(table: String, values: Map<String, ValueType>, conflict: ConflictResolution): Int64 {
        if (table.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore insert failed: ${paramError("table", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore insert failed: ${paramError("table", "not empty string")}")
        }
        let cTable = unsafe { LibC.mallocCString(table) }
        let cValue = ValuesBucket.create(values)
        var errCode: Int32 = 0
        throwIfOOM(cValue.isNone(), "RdbStore", "insert") {
            unsafe { LibC.free(cTable) }
        }
        let result = unsafe {
            FfiOHOSRelationalStoreInsert(getID(), cTable, cValue.getOrThrow(), conflict.getValue(), inout errCode)
        }
        unsafe {
            LibC.free(cTable)
            cValue.getOrThrow().free()
            throwIfNotSuccess(errCode, "RdbStore", "insert")
        }
        return result
    }

    /**
     * @brief  update(values: ValuesBucket, predicates: RdbPredicates):Promise<number>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func update(values: Map<String, ValueType>, predicates: RdbPredicates): Int64 {
        return update(values, predicates, ConflictResolution.ON_CONFLICT_NONE)
    }

    /**
     * @brief  update(values: ValuesBucket, predicates: RdbPredicates, conflict: ConflictResolution,
     *  callback: AsyncCallback<number>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func update(values: Map<String, ValueType>, predicates: RdbPredicates, conflict: ConflictResolution): Int64 {
        let cValueBucket = ValuesBucket.create(values)
        var errCode: Int32 = 0
        throwIfOOM(cValueBucket.isNone(), "RdbStore", "update")
        let affectedRows = unsafe {
            FfiOHOSRelationalStoreUpdate(getID(), cValueBucket.getOrThrow(), predicates.getID(), conflict.getValue(),
                inout errCode)
        }
        unsafe {
            cValueBucket.getOrThrow().free()
            throwIfNotSuccess(errCode, "RdbStore", "update")
        }
        return affectedRows
    }

    /**
     * @brief batchInsert(table: string, values: Array<ValuesBucket>, callback: AsyncCallback<number>):void
     * @brief batchInsert(table: string, values: Array<ValuesBucket>):Promise<number>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func batchInsert(table: String, values: Array<Map<String, ValueType>>): Int64 {
        unsafe {
            if (table.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore batchInsert failed: ${paramError("table", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore batchInsert failed: ${paramError("table", "not empty string")}")
            }
            let valuesSize = values.size
            if (valuesSize == 0) {
                return 0
            }
            let valuesBucketArray: CPointer<ValuesBucket> = calloc<ValuesBucket>(count: valuesSize)
            throwIfOOM(valuesBucketArray.isNull(), "RdbStore", "batchInsert")
            for (i in 0..valuesSize) {
                let cVlaueBucket = ValuesBucket.create(values[i])
                throwIfOOM(cVlaueBucket.isNone(), "RdbStore", "batchInsert") {
                    freeValuesBucketArray(valuesBucketArray, i)
                    LibC.free(valuesBucketArray)
                }
                valuesBucketArray.write(i, cVlaueBucket.getOrThrow())
            }
            let tableNameC = mallocCString(table)
            var insertNum: Int64 = 0
            throwIfOOM(tableNameC.isNone(), "RdbStore", "batchInsert") {
                for (i in 0..valuesSize) {
                    valuesBucketArray.read(i).free()
                }
                LibC.free(valuesBucketArray)
            }
            let rtnCode = FfiOHOSRelationalStoreBatchInsert(getID(), tableNameC.getOrThrow(), valuesBucketArray,
                valuesSize, inout insertNum)
            LibC.free(tableNameC.getOrThrow())
            for (i in 0..valuesSize) {
                valuesBucketArray.read(i).free()
            }
            LibC.free(valuesBucketArray)
            throwIfNotSuccess(rtnCode, "RdbStore", "batchInsert")
            return insertNum
        }
    }

    /**
     * @brief  querySql(sql: string, bindArgs?: Array<ValueType>):Promise<ResultSet>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func querySql(sql: String, bindArgs!: Array<ValueType> = Array<ValueType>()): ResultSet {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore querySql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore querySql failed: ${paramError("sql", "not empty string")}")
            }
            let size = bindArgs.size
            let cSql = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            let cBindArgs = if (size != 0) {
                LibC.malloc<RetValueType>(count: size)
            } else {
                CPointer<RetValueType>()
            }
            throwIfOOM(cBindArgs.isNull() && size != 0, "RdbStore", "querySql") {
                LibC.free(cSql)
            }
            for (i in 0..size) {
                let arg = RetValueType.create(bindArgs[i])
                throwIfOOM(arg.isNone(), "RdbStore", "querySql") {
                    LibC.free(cSql)
                    freeValuesArray(cBindArgs, i)
                    LibC.free<RetValueType>(cBindArgs)
                }
                cBindArgs.write(i, arg.getOrThrow())
            }
            let id = FfiOHOSRelationalStoreQuerySql(getID(), cSql, cBindArgs, size, inout errCode)
            for (i in 0..size) {
                cBindArgs.read(i).free()
            }
            LibC.free(cBindArgs)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "querySql")
            return ResultSet(id)
        }
    }

    /**
     * @brief executeSql(sql: string, bindArgs: Array<ValueType>, callback: AsyncCallback<void>):void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func executeSql(sql: String, bindArgs: Array<ValueType>): Unit {
        unsafe {
            if (sql.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore executeSql failed: ${paramError("sql", "not empty string")}")
            }
            let cSql: CString = LibC.mallocCString(sql)
            var errCode: Int32 = 0
            let size = bindArgs.size
            let cBindArgs: CPointer<RetValueType> = if (size != 0) {
                LibC.malloc<RetValueType>(count: size)
            } else {
                CPointer<RetValueType>()
            }
            throwIfOOM(cBindArgs.isNull() && size != 0, "RdbStore", "executeSql") {
                LibC.free(cSql)
            }
            for (i in 0..size) {
                let arg = RetValueType.create(bindArgs[i])
                throwIfOOM(arg.isNone(), "RdbStore", "executeSql") {
                    LibC.free(cSql)
                    freeValuesArray(cBindArgs, i)
                    LibC.free<RetValueType>(cBindArgs)
                }
                cBindArgs.write(i, arg.getOrThrow())
            }

            FfiOHOSRelationalStoreExecuteSqlBindArgs(getID(), cSql, cBindArgs, size, inout errCode)
            for (i in 0..size) {
                cBindArgs.read(i).free()
            }
            LibC.free<RetValueType>(cBindArgs)
            LibC.free(cSql)
            throwIfNotSuccess(errCode, "RdbStore", "executeSql")
        }
    }

    func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Bool {
        for (item in list) {
            if (refEq(callback, item[0])) {
                return true
            }
        }
        false
    }

    /**
     * @brief on(event: string, interProcess: boolean, observer: Callback<void>): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func on(event: String, interProcess: Bool, callback: Callback0Argument): Unit {
        if (event.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("event", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore on failed: ${paramError("event", "not empty string")}")
        }
        var v = eventCallbackMaps.entryView(event)
        let callbackList = if (v.value.isNone()) {
            let list = ArrayList<(CallbackObject, Int64)>()
            eventCallbackMaps.add(event, list)
            list
        } else {
            v.value.getOrThrow()
        }
        if (findCallbackObject(callbackList, callback)) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("callback object", "different")}")
            return
        }
        unsafe {
            let wrapper = {=> callback.invoke()}
            let lambdaData = Callback0Param<Unit>(wrapper)
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreOn(
                getID(),
                cEvent,
                interProcess,
                lambdaData.getID(),
                lambdaData.getID()
            )
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "on")
            callbackList.add((callback, lambdaData.getID()))
        }
    }

    /**
     * @brief on(event: 'dataChange', type: SubscribeType, observer: Callback<Array<string>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func onDataChange(`type`: SubscribeType, callback: Callback1Argument<Array<String>>): Unit {
        synchronized(onOffMutex) {
            let callbackList = observers_
            if (findCallbackObject(callbackList, callback)) {
                RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CArrString => callback.invoke(cArrStringtoArrayStringAndFree(value))}
                let lambdaData = Callback1Param<CArrString, Unit>(wrapper)
                let errCode = FfiOHOSRelationalStoreOnArrStr(getID(), `type`.getValue(), lambdaData.getID())
                throwIfNotSuccess(errCode, "RdbStore", "onDataChange")
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief on(event: 'dataChange', type: SubscribeType, observer: Callback<Array<string>>| Callback<Array<ChangeInfo>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func onDataChange(`type`: SubscribeType, callback: Callback1Argument<Array<ChangeInfo>>): Unit {
        synchronized(onOffMutex) {
            let callbackList = observers_
            if (findCallbackObject(callbackList, callback)) {
                RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CArrRetChangeInfo => callback.invoke(convertAndFree(value))}
                let lambdaData = Callback1Param<CArrRetChangeInfo, Unit>(wrapper)
                let errCode = FfiOHOSRelationalStoreOnChangeInfo(getID(), `type`.getValue(), lambdaData.getID())
                throwIfNotSuccess(errCode, "RdbStore", "onDataChange")
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief on(event: 'autoSyncProgress', progress: Callback<ProgressDetails>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func onAutoSyncProgress(callback: Callback1Argument<ProgressDetails>): Unit {
        synchronized(onOffMutex) {
            let callbackList = syncObservers_
            if (findCallbackObject(callbackList, callback)) {
                RELATIONAL_STORE_LOG.error("RdbStore on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CProgressDetails => callback.invoke(convertAndFree(value))}
                let lambdaData = Callback1Param<CProgressDetails, Unit>(wrapper)
                let errCode = FfiOHOSRelationalStoreOnProgressDetails(getID(), lambdaData.getID())
                throwIfNotSuccess(errCode, "RdbStore", "onAutoSyncProgress")
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief off(event: string, interProcess: boolean, observer?: Callback<void>): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func off(event: String, interProcess: Bool): Unit {
        var v = eventCallbackMaps.entryView(event)
        if (v.value.isNone() || v.value.getOrThrow().size == 0) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: The event is not registered")
            return
        }
        unsafe {
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreOffAll(getID(), cEvent, interProcess)
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "off")
            v.value.getOrThrow().clear()
        }
    }

    /**
     * @brief off(event: string, interProcess: boolean, observer?: Callback<void>): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func off(event: String, interProcess: Bool, callback: Callback0Argument): Unit {
        var v = eventCallbackMaps.entryView(event)
        if (v.value.isNone() || v.value.getOrThrow().size == 0) {
            RELATIONAL_STORE_LOG.error("RdbStore on failed: The event is not registered")
            return
        }
        unsafe {
            v.value.getOrThrow().removeIf(
                {
                    item =>
                    if (refEq(item[0], callback)) {
                        let cEvent = LibC.mallocCString(event)
                        let errCode = FfiOHOSRelationalStoreOff(getID(), cEvent, interProcess, item[1])
                        LibC.free(cEvent)
                        throwIfNotSuccess(errCode, "RdbStore", "off")
                        return true
                    }
                    return false
                }
            )
        }
    }

    func offDataChangeCommon(`type`: SubscribeType, callback: CallbackObject): Unit {
        synchronized(onOffMutex) {
            let callbackList = observers_
            if (callbackList.size == 0) {
                RELATIONAL_STORE_LOG.error("RdbStore off failed: The event is not registered")
                return
            }
            unsafe {
                callbackList.removeIf(
                    {
                        item =>
                        if (refEq(item[0], callback)) {
                            let errCode = FfiOHOSRelationalStoreOffArrStrChangeInfo(getID(), `type`.getValue(), item[1])
                            throwIfNotSuccess(errCode, "RdbStore", "offDataChange")
                            return true
                        }
                        return false
                    }
                )
            }
        }
    }

    /**
     * @brief off(event:'dataChange', type: SubscribeType, observer: Callback<Array<string>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offDataChange(`type`: SubscribeType, callback: Callback1Argument<Array<String>>): Unit {
        offDataChangeCommon(`type`, callback)
    }

    /**
     * @brief off(event:'dataChange', type: SubscribeType, observer?: Callback<Array<string>>| Callback<Array<ChangeInfo>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offDataChange(`type`: SubscribeType, callback: Callback1Argument<Array<ChangeInfo>>): Unit {
        offDataChangeCommon(`type`, callback)
    }

    /**
     * @brief off(event:'dataChange', type: SubscribeType, observer?: Callback<Array<string>>| Callback<Array<ChangeInfo>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offDataChange(`type`: SubscribeType): Unit {
        synchronized(onOffMutex) {
            let callbackList = observers_
            if (callbackList.size == 0) {
                RELATIONAL_STORE_LOG.error("RdbStore off failed: The event is not registered")
                return
            }
            unsafe {
                let errCode = FfiOHOSRelationalStoreOffArrStrChangeInfoAll(getID(), `type`.getValue())
                throwIfNotSuccess(errCode, "RdbStore", "offDataChange")
                callbackList.clear()
            }
        }
    }

    /**
     * @brief off(event: 'autoSyncProgress', progress?: Callback<ProgressDetails>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offAutoSyncProgress(callback: Callback1Argument<ProgressDetails>): Unit {
        synchronized(onOffMutex) {
            let callbackList = syncObservers_
            if (callbackList.size == 0) {
                RELATIONAL_STORE_LOG.error("RdbStore off failed: The event is not registered")
                return
            }
            unsafe {
                callbackList.removeIf(
                    {
                        item =>
                        if (refEq(item[0], callback)) {
                            let errCode = FfiOHOSRelationalStoreOffProgressDetails(getID(), item[1])
                            throwIfNotSuccess(errCode, "RdbStore", "offAutoSyncProgress")
                            return true
                        }
                        return false
                    }
                )
            }
        }
    }

    /**
     * @brief off(event: 'autoSyncProgress', progress?: Callback<ProgressDetails>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func offAutoSyncProgress(): Unit {
        synchronized(onOffMutex) {
            let callbackList = syncObservers_
            if (callbackList.size == 0) {
                RELATIONAL_STORE_LOG.error("RdbStore off failed: The event is not registered")
                return
            }
            unsafe {
                let errCode = FfiOHOSRelationalStoreOffProgressDetailsAll(getID())
                throwIfNotSuccess(errCode, "RdbStore", "offAutoSyncProgress")
                callbackList.clear()
            }
        }
    }

    /**
     * @brief emit(event: string): void
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func emit(event: String): Unit {
        unsafe {
            let cEvent = LibC.mallocCString(event)
            let errCode = FfiOHOSRelationalStoreEmit(getID(), cEvent)
            LibC.free(cEvent)
            throwIfNotSuccess(errCode, "RdbStore", "emit")
        }
    }

    /**
     * @brief cloudSync(mode: SyncMode, progress: Callback<ProgressDetails>): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func cloudSync(mode: SyncMode, callback: Callback1Argument<ProgressDetails>): Unit {
        cloudSync(mode, Array<String>(), callback)
    }

    /**
     * @brief cloudSync(mode: SyncMode, tables: string[], progress: Callback<ProgressDetails>): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func cloudSync(mode: SyncMode, tables: Array<String>, callback: Callback1Argument<ProgressDetails>): Unit {
        unsafe {
            let tablesSize = tables.size
            var cTables: CPointer<CString> = CPointer<CString>()
            if (tablesSize > 0) {
                cTables = safeMalloc<CString>(count: tablesSize)
            }
            for (i in 0..tablesSize) {
                try {
                    cTables.write(i, LibC.mallocCString(tables[i]))
                } catch (_: Exception) {
                    freeCStringArray(cTables, i)
                    LibC.free<CString>(cTables)
                    RELATIONAL_STORE_LOG.error("RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
            let wrapper = {value: CProgressDetails => callback.invoke(convertAndFree(value))}
            let lambdaData = Callback1Param<CProgressDetails, Unit>(wrapper)
            let errCode = FfiOHOSRelationalStoreCloudSync(getID(), mode.getValue(), CArrString(cTables, tablesSize),
                lambdaData.getID())
            freeCStringArray(cTables, tablesSize)
            LibC.free<CString>(cTables)
            throwIfNotSuccess(errCode, "RdbStore", "cloudSync")
        }
    }

    /**
     * @brief setDistributedTables(tables: Array<string>): Promise<void>
     */
    @!APILevel[
        19,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func setDistributedTables(tables: Array<String>): Unit {
        unsafe {
            let tablesSize = tables.size
            var cTables: CPointer<CString> = CPointer<CString>()
            if (tablesSize > 0) {
                cTables = safeMalloc<CString>(count: tablesSize)
            }
            for (i in 0..tablesSize) {
                try {
                    cTables.write(i, LibC.mallocCString(tables[i]))
                } catch (_: Exception) {
                    freeCStringArray(cTables, i)
                    LibC.free<CString>(cTables)
                    RELATIONAL_STORE_LOG.error("RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
            let errCode = FfiOHOSRelationalStoreSetDistributedTables(getID(), cTables, tablesSize)
            freeCStringArray(cTables, tablesSize)
            LibC.free<CString>(cTables)
            throwIfNotSuccess(errCode, "RdbStore", "setDistributedTables")
        }
    }

    /**
     * @brief setDistributedTables(tables: Array<string>, type: DistributedType, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func setDistributedTables(tables: Array<String>, `type`: DistributedType): Unit {
        unsafe {
            let tablesSize = tables.size
            var cTables: CPointer<CString> = CPointer<CString>()
            if (tablesSize > 0) {
                cTables = safeMalloc<CString>(count: tablesSize)
            }
            for (i in 0..tablesSize) {
                try {
                    cTables.write(i, LibC.mallocCString(tables[i]))
                } catch (_: Exception) {
                    freeCStringArray(cTables, i)
                    LibC.free<CString>(cTables)
                    RELATIONAL_STORE_LOG.error("RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
            let errCode = FfiOHOSRelationalStoreSetDistributedTablesType(
                getID(),
                cTables,
                tablesSize,
                `type`.getValue()
            )
            freeCStringArray(cTables, tablesSize)
            LibC.free<CString>(cTables)
            throwIfNotSuccess(errCode, "RdbStore", "setDistributedTables")
        }
    }

    /**
     * @brief setDistributedTables(tables: Array<string>, type: DistributedType, config: DistributedConfig, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func setDistributedTables(tables: Array<String>, `type`: DistributedType, config: DistributedConfig): Unit {
        unsafe {
            let tablesSize = tables.size
            var cTables: CPointer<CString> = CPointer<CString>()
            if (tablesSize > 0) {
                cTables = safeMalloc<CString>(count: tablesSize)
            }
            for (i in 0..tablesSize) {
                try {
                    cTables.write(i, LibC.mallocCString(tables[i]))
                } catch (_: Exception) {
                    freeCStringArray(cTables, i)
                    LibC.free<CString>(cTables)
                    RELATIONAL_STORE_LOG.error("RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                    throw BusinessException(getErrorCode(MEMORY_ERROR),
                        "RdbStore setDistributedTables failed: ${getErrorMsg(MEMORY_ERROR)}")
                }
            }
            let errCode = FfiOHOSRelationalStoreSetDistributedTablesConfig(getID(), cTables, tablesSize,
                `type`.getValue(), RetDistributedConfig(config.autoSync))
            freeCStringArray(cTables, tablesSize)
            LibC.free<CString>(cTables)
            throwIfNotSuccess(errCode, "RdbStore", "setDistributedTables")
        }
    }

    /**
     * @brief cleanDirtyData(table: string, cursor: number, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func cleanDirtyData(table: String, cursor: UInt64): Unit {
        unsafe {
            if (table.isEmpty()) {
                RELATIONAL_STORE_LOG.error("RdbStore cleanDirtyData failed: ${paramError("table", "not empty string")}")
                throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                    "RdbStore cleanDirtyData failed: ${paramError("table", "not empty string")}")
            }
            try (cTable = LibC.mallocCString(table).asResource()) {
                let errCode = FfiOHOSRelationalStoreCleanDirtyData(getID(), cTable.value, cursor)
                throwIfNotSuccess(errCode, "RdbStore", "cleanDirtyData")
            }
        }
    }

    /**
     * @brief cleanDirtyData(table: string, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func cleanDirtyData(table: String): Unit {
        cleanDirtyData(table, UINT64_MAX)
    }

    /**
     * @brief getModifyTime(table: string, columnName: string, primaryKeys: PRIKeyType[]): Promise<ModifyTime>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getModifyTime(table: String, columnName: String, primaryKeys: Array<PRIKeyType>): HashMap<PRIKeyType,
        DateTime> {
        if (table.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore getModifyTime failed: ${paramError("table", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore getModifyTime failed: ${paramError("table", "not empty string")}")
        }
        if (columnName.isEmpty()) {
            RELATIONAL_STORE_LOG.error("RdbStore getModifyTime failed: ${paramError("columnName", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore getModifyTime failed: ${paramError("columnName", "not empty string")}")
        }
        if (primaryKeys.size == 0) {
            RELATIONAL_STORE_LOG.error(
                "RdbStore getModifyTime failed: ${paramError("primaryKeys", "not empty string")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore getModifyTime failed: ${paramError("primaryKeys", "not empty string")}")
        }
        var time = HashMap<PRIKeyType, DateTime>()
        unsafe {
            try (
                cTable = LibC.mallocCString(table).asResource(),
                cColumnName = LibC.mallocCString(columnName).asResource(),
                cPrimaryKeys = CArrPRIKeyType(primaryKeys).asResource()
            ) {
                var errCode: Int32 = 0
                let cModifyTime = FfiOHOSRelationalStoreGetModifyTime(getID(), cTable.value, cColumnName.value,
                    cPrimaryKeys.value, inout errCode)
                throwIfNotSuccess(errCode, "RdbStore", "getModifyTime")
                time = convert(cModifyTime)
                cModifyTime.free()
            }
        }
        return time
    }

    /**
     * @brief sync(mode: SyncMode, predicates: RdbPredicates): Promise<Array<[string, number]>>
     */
    @!APILevel[
        19,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func sync(mode: SyncMode, predicates: RdbPredicates): Array<(String, Int32)> {
        if (mode.getValue() != 0 && mode.getValue() != 1) {
            RELATIONAL_STORE_LOG.error("RdbStore sync failed: ${paramError("mode", "a SyncMode of device.")}")
            throw BusinessException(getErrorCode(ERR_PARAMETER_ERROR),
                "RdbStore sync failed: ${paramError("mode", "a SyncMode of device.")}")
        }
        var errCode: Int32 = 0
        let CArrSyncResult = unsafe {
            FfiOHOSRelationalStoreSync(getID(), mode.getValue(), predicates.getID(), inout errCode)
        }
        let res = convert(CArrSyncResult)
        CArrSyncResult.free()
        throwIfNotSuccess(errCode, "RdbStore", "sync")
        return res
    }
}
