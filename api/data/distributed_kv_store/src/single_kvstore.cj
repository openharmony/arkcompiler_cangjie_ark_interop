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

package ohos.data.distributed_kv_store

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

class SingleKVStoreImpl {}

/**
 * Provides methods related to single-version distributed databases.
 * <p>To create a {@code SingleKVStore} database,
 * you can use the {@link data.distributed.common.KVManager#getKVStore​(Options, String)} method
 * with {@code KVStoreType} set to {@code SINGLE_VERSION} for the input parameter {@code Options}.
 * This database synchronizes data to other databases in time sequence.
 * The {@code SingleKVStore} database does not support
 * synchronous transactions, or data search using snapshots.
 *
 * @relation interface SingleKVStore
 */
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
    private let impl: SingleKVStoreImpl = SingleKVStoreImpl()

    init(id: Int64) {
        super(id)
        finalizer = SingleKVStoreFinalizer(id)
    }

    /**
     * Writes a key-value pair of the string type into the {@code SingleKVStore} database.
     * <p>If you do not want to synchronize this key-value pair to other devices, set the write option in the local
     * database.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types;
     * <br>3.Parameter verification failed.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @throws { BusinessException } 14800047 - The WAL file size exceeds the default limit.
     * @relation put(key: string, value: Uint8Array | string | number | boolean): Promise<void>
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
     * Inserts key-value pairs into the {@code SingleKVStore} database in batches.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation putBatch(entries: Entry[]): Promise<void>
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
     * Deletes the key-value pair based on a specified key.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types;
     * <br>3.Parameter verification failed.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @throws { BusinessException } 14800047 - The WAL file size exceeds the default limit.
     * @relation delete(key: string): Promise<void>
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
     * Deletes key-value pairs in batches from the {@code SingleKVStore} database.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types;
     * <br>3.Parameter verification failed.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @throws { BusinessException } 14800047 - The WAL file size exceeds the default limit.
     * @relation deleteBatch(keys: string[]): Promise<void>
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
     * Obtains the value of a specified key.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types;
     * <br>3.Parameter verification failed.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100004 - Not found.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation get(key: string): Promise<boolean | string | number | Uint8Array>
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
     * Backs up a database in the specified filename.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Parameter verification failed.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation backup(file:string): Promise<void>
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
     * Restores a database from a specified database file.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Parameter verification failed.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation restore(file:string): Promise<void>
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
     * Starts a transaction operation in the {@code SingleKVStore} database.
     * <p>After the database transaction is started, you can submit or roll back the operation.
     *
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation startTransaction(): Promise<void>
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
     * Submits a transaction operation in the {@code SingleKVStore} database.
     *
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation commit(): Promise<void>
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
     * Rolls back a transaction operation in the {@code SingleKVStore} database.
     *
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation rollback(): Promise<void>
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
     * Sets whether to enable synchronization.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @relation enableSync(enabled: boolean): Promise<void>
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
     * Sets synchronization range labels.
     * <p>The labels determine the devices with which data will be synchronized.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @relation setSyncParam(defaultAllowedDelayMs: number): Promise<void>
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
