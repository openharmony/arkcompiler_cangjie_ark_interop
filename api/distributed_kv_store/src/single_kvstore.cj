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

import std.sync.*
import ohos.labels.*
import std.collection.*
import ohos.base.*
import ohos.ffi.*

class SingleKVStoreFinalizer {
    SingleKVStoreFinalizer(let id: Int64) {}
    ~init() {
        releaseFFIData(id)
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public open class SingleKVStore <: RemoteDataLite {
    private let callbackList_d = ArrayList<(CallbackObject, Int64)>()
    private let callbackList_s = ArrayList<(CallbackObject, Int64)>()
    private let onOffMutex = Mutex()
    private let finalizer: SingleKVStoreFinalizer

    init(id: Int64) {
        super(id)
        finalizer = SingleKVStoreFinalizer(id)
    }

    /**
     * @brief  put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback<void>): void
     * @brief  put(key: string, value: Uint8Array | string | number | boolean): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func put(key: String, value: ValueType): Unit {
        unsafe {
            try (
                cKey = LibC.mallocCString(key).asResource(),
                cValue = CKVValueType(value).asResource()
            ) {
                let errCode = FfiOHOSDistributedKVStoreSingleKVStorePut(getID(), cKey.value, cValue.value)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to put. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode), "KVStore put failed: ${getErrorMsg(errCode)}")
                }
            }
        }
    }

    /**
     * @brief  putBatch(entries: Entry[], callback: AsyncCallback<void>): void
     * @brief  putBatch(entries: Entry[]): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func putBatch(entries: ArrayList<Entry>): Unit {
        unsafe {
            let cArrEntry = CArrEntry(entries)
            let errCode = FfiOHOSDistributedKVStoreSingleKVStorePutBatch(getID(), cArrEntry)
            cArrEntry.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to putBatch. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore putBatch failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  delete(key: string, callback: AsyncCallback<void>): void
     * @brief  delete(key: string): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func delete(key: String): Unit {
        unsafe {
            let cKey = LibC.mallocCString(key)
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreDelete(getID(), cKey)
            LibC.free(cKey)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to delete. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore delete failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  deleteBatch(keys: string[], callback: AsyncCallback<void>): void
     * @brief  deleteBatch(keys: string[]): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func deleteBatch(keys: ArrayList<String>): Unit {
        unsafe {
            let cArrString = toArrayCString(keys.toArray())
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreDeleteBatch(getID(), cArrString)
            cArrString.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to deleteBatch. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore deleteBatch failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void
     * @brief  get(key: string): Promise<boolean | string | number | Uint8Array>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func get(key: String): ValueType {
        unsafe {
            let cKey = LibC.mallocCString(key)
            var errCode: Int32 = 0
            let cValue = FfiOHOSDistributedKVStoreSingleKVStoreGet(getID(), cKey, inout errCode)
            LibC.free(cKey)
            let result = cValue.toValueType()
            cValue.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to get. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore get failed: ${getErrorMsg(errCode)}")
            }
            return result
        }
    }

    /**
     * @brief  getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(keyPrefix: string): Promise<Entry[]>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getEntries(keyPrefix: String): ArrayList<Entry> {
        unsafe {
            let cKeyPrefix = LibC.mallocCString(keyPrefix)
            var errCode = 0i32
            let cEntries = FfiOHOSDistributedKVStoreSingleKVStoreGetEntriesByString(getID(), cKeyPrefix, inout errCode)
            LibC.free(cKeyPrefix)
            let entries = cEntries.toArray()
            cEntries.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getEntries. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getEntries failed: ${getErrorMsg(errCode)}")
            }
            return entries
        }
    }

    /**
     * @brief  getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(query: Query): Promise<Entry[]>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getEntries(query: Query): ArrayList<Entry> {
        unsafe {
            var errCode = 0i32
            let cEntries = FfiOHOSDistributedKVStoreSingleKVStoreGetEntriesByQuery(
                getID(),
                query.getID(),
                inout errCode
            )
            let entries = cEntries.toArray()
            cEntries.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getEntries. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getEntries failed: ${getErrorMsg(errCode)}")
            }
            return entries
        }
    }

    /**
     * @brief  getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getResultSet(keyPrefix: String): KVStoreResultSet {
        unsafe {
            let cKeyPrefix = LibC.mallocCString(keyPrefix)
            var errCode = 0i32
            let resultSetId = FfiOHOSDistributedKVStoreSingleKVStoreGetResultSetByString(getID(), cKeyPrefix,
                inout errCode)
            LibC.free(cKeyPrefix)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getResultSet. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getResultSet failed: ${getErrorMsg(errCode)}")
            }
            return KVStoreResultSet(resultSetId)
        }
    }

    /**
     * @brief  getResultSet(query: Query, callback: AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(query: Query): Promise<KVStoreResultSet>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getResultSet(query: Query): KVStoreResultSet {
        unsafe {
            var errCode = 0i32
            let resultSetId = FfiOHOSDistributedKVStoreSingleKVStoreGetResultSetByQuery(getID(), query.getID(),
                inout errCode)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getResultSet. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getResultSet failed: ${getErrorMsg(errCode)}")
            }
            return KVStoreResultSet(resultSetId)
        }
    }

    /**
     * @brief  closeResultSet(resultSet: KVStoreResultSet, callback: AsyncCallback<void>): void
     * @brief  closeResultSet(resultSet: KVStoreResultSet): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func closeResultSet(resultSet: KVStoreResultSet): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreCloseResultSet(getID(), resultSet.getID())
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to closeResultSet. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore closeResultSet failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  getResultSize(query: Query, callback: AsyncCallback<number>): void
     * @brief  getResultSize(query: Query): Promise<number>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getResultSize(query: Query): Int32 {
        unsafe {
            var errCode = 0i32
            let result = FfiOHOSDistributedKVStoreSingleKVStoreGetResultSize(getID(), query.getID(), inout errCode)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getResultSize. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getResultSize failed: ${getErrorMsg(errCode)}")
            }
            return result
        }
    }

    /**
     * @brief  backup(file:string, callback: AsyncCallback<void>):void
     * @brief  backup(file:string): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func backup(file: String): Unit {
        unsafe {
            let cFile = LibC.mallocCString(file)
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreBackup(getID(), cFile)
            LibC.free(cFile)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to backup. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore backup failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  restore(file:string, callback: AsyncCallback<void>):void
     * @brief  restore(file:string): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func restore(file: String): Unit {
        unsafe {
            let cFile = LibC.mallocCString(file)
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreRestore(getID(), cFile)
            LibC.free(cFile)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to restore. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore restore failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  deleteBackup(files:Array<string>, callback: AsyncCallback<Array<[string, number]>>):void
     * @brief  deleteBackup(files:Array<string>): Promise<Array<[string, number]>>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func deleteBackup(files: ArrayList<String>): ArrayList<(String, Int32)> {
        unsafe {
            let cFiles = toArrayCString(files.toArray())
            var errCode = 0i32
            let cArrayList = FfiOHOSDistributedKVStoreSingleKVStoreDeleteBackup(getID(), cFiles, inout errCode)
            cFiles.free()
            let result = cArrayList.toArrayAndFree()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to deleteBackup. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore deleteBackup failed: ${getErrorMsg(errCode)}")
            }
            return result
        }
    }

    /**
     * @brief  startTransaction(callback: AsyncCallback<void>): void
     * @brief  startTransaction(): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func startTransaction(): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreStartTransaction(getID())
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to startTransaction. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode),
                    "KVStore startTransaction failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  commit(callback: AsyncCallback<void>): void
     * @brief  commit(): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func commit(): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreCommit(getID())
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to commit. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore commit failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  rollback(callback: AsyncCallback<void>): void
     * @brief  rollback(): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func rollback(): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreRollback(getID())
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to rollback. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore rollback failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  enableSync(enabled: boolean, callback: AsyncCallback<void>): void
     * @brief  enableSync(enabled: boolean): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func enableSync(enabled: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreEnableSync(getID(), enabled)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to enableSync. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore enableSync failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback<void>): void
     * @brief  setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func setSyncRange(localLabels: ArrayList<String>, remoteSupportLabels: ArrayList<String>): Unit {
        unsafe {
            let cLocalLabels = toArrayCString(localLabels.toArray())
            var cRemoteSupportLabels: CArrString
            try {
                cRemoteSupportLabels = toArrayCString(remoteSupportLabels.toArray())
            } catch (e: Exception) {
                cLocalLabels.free()
                throw e
            }
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreSetSyncRange(
                getID(),
                cLocalLabels,
                cRemoteSupportLabels
            )
            cLocalLabels.free()
            cRemoteSupportLabels.free()
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.error("Failed to setSyncRange. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore setSyncRange failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief  setSyncParam(defaultAllowedDelayMs: number, callback: AsyncCallback<void>): void
     * @brief  setSyncParam(defaultAllowedDelayMs: number): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func setSyncParam(defaultAllowedDelayMs: UInt32): Unit {
        unsafe {
            let errCode = FfiOHOSDistributedKVStoreSingleKVStoreSetSyncParam(getID(), defaultAllowedDelayMs)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to setSyncParam. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore setSyncParam failed: ${getErrorMsg(errCode)}")
            }
        }
    }

    /**
     * @brief on(event: 'dataChange', type: SubscribeType, listener: Callback<ChangeNotification>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func onDataChange(`type`: SubscribeType, callback: Callback1Argument<ChangeNotification>): Unit {
        synchronized(onOffMutex) {
            for (item in callbackList_d) {
                if (refEq(callback, item[0])) {
                    KV_STORE_LOG.error("KVStore onDataChange failed: The same function is registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {value: CChangeNotification => callback.invoke(value.toChangeNotificationAndFree())}
                let lambdaData = Callback1Param<CChangeNotification, Unit>(wrapper)
                let errCode = FfiOHOSDistributedKVStoreSingleKVStoreOnDataChange(getID(), `type`.getValue(),
                    lambdaData.getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to onDataChange. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore onDataChange failed: ${getErrorMsg(errCode)}")
                }
                callbackList_d.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief on(event: 'syncComplete', syncCallback: Callback<Array<[string, number]>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func onSyncComplete(callback: Callback1Argument<ArrayList<(String, Int32)>>): Unit {
        synchronized(onOffMutex) {
            for (item in callbackList_s) {
                if (refEq(callback, item[0])) {
                    KV_STORE_LOG.error("KVStore onSyncComplete failed: The same function is registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {value: CStringNum => callback.invoke(value.toArrayAndFree())}
                let lambdaData = Callback1Param<CStringNum, Unit>(wrapper)
                let errCode = FfiOHOSDistributedKVStoreSingleKVStoreOnSyncComplete(getID(), lambdaData.getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to onSyncComplete. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore onSyncComplete failed: ${getErrorMsg(errCode)}")
                }
                callbackList_s.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief off(event:'dataChange', listener?: Callback<ChangeNotification>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func offDataChange(callback: Callback1Argument<ChangeNotification>): Unit {
        synchronized(onOffMutex) {
            var funcId = 0
            var i = 0
            for (item in callbackList_d) {
                if (refEq(callback, item[0])) {
                    funcId = item[1]
                    break
                }
                i++
            }
            if (funcId == 0) {
                KV_STORE_LOG.error("KVStore offDataChange failed: This function cannot be found.")
                return
            }
            unsafe {
                let errCode = FfiOHOSDistributedKVStoreSingleKVStoreOffDataChange(getID(), funcId)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to offDataChange. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore offDataChange failed: ${getErrorMsg(errCode)}")
                }
                callbackList_d.remove(at: i)
            }
        }
    }

    /**
     * @brief off(event:'dataChange', listener?: Callback<ChangeNotification>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func offDataChange(): Unit {
        synchronized(onOffMutex) {
            unsafe {
                let errCode = FfiOHOSDistributedKVStoreSingleKVStoreOffAllDataChange(getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to offDataChange. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore offDataChange failed: ${getErrorMsg(errCode)}")
                }
                callbackList_d.clear()
            }
        }
    }

    /**
     * @brief off(event: 'syncComplete', syncCallback?: Callback<Array<[string, number]>>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func offSyncComplete(): Unit {
        synchronized(onOffMutex) {
            unsafe {
                let errCode = FfiOHOSDistributedKVStoreSingleKVStoreOffAllSyncComplete(getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to offSyncComplete. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore offSyncComplete failed: ${getErrorMsg(errCode)}")
                }
                callbackList_s.clear()
            }
        }
    }

    /**
     * @brief  getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void
     * @brief  getSecurityLevel(): Promise<SecurityLevel>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public open func getSecurityLevel(): SecurityLevel {
        unsafe {
            var errCode = 0i32
            let securityLevel = FfiOHOSDistributedKVStoreSingleKVStoreGetSecurityLevel(getID(), inout errCode)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getSecurityLevel. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode),
                    "KVStore getSecurityLevel failed: ${getErrorMsg(errCode)}")
            }
            return SecurityLevel.parse(securityLevel)
        }
    }
}
