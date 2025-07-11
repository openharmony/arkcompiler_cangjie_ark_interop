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
    21,
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
        21,
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
        21,
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
        21,
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
        21,
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
        21,
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
     * @brief  backup(file:string, callback: AsyncCallback<void>):void
     * @brief  backup(file:string): Promise<void>
     */
    @!APILevel[
        21,
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
        21,
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
     * @brief  startTransaction(callback: AsyncCallback<void>): void
     * @brief  startTransaction(): Promise<void>
     */
    @!APILevel[
        21,
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
        21,
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
        21,
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
        21,
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
     * @brief  setSyncParam(defaultAllowedDelayMs: number, callback: AsyncCallback<void>): void
     * @brief  setSyncParam(defaultAllowedDelayMs: number): Promise<void>
     */
    @!APILevel[
        21,
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
}
