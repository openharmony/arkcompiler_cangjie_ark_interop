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

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*

/**
 * Provides methods related to device-collaboration distributed databases.
 * <p>To create a {@code DeviceKVStore} database, you can use the
 * {@link data.distributed.common.KVManager.getKVStore(Options, String)}
 * method with {@code KVStoreType} set to {@code DEVICE_COLLABORATION} for the input parameter Options.
 * This database manages distributed
 * data by device, and cannot modify data synchronized from remote devices. When an application writes a
 * key-value pair entry
 * into the database, the system automatically adds the ID of the device running the application to the key.
 *
 * @relation interface DeviceKVStore extends SingleKVStore
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class DeviceKVStore <: SingleKVStore {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the value matching the local device ID and specified key.
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
    public func get(key: String): ValueType {
        return get("", key)
    }

    /**
     * Obtains the value matching a specified device ID and key.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types;
     * <br>3.Parameter verification failed.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100004 - Not found.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func get(deviceId: String, key: String): ValueType {
        unsafe {
            var result = ValueType.Integer(0)
            try (
                cDeviceId = LibC.mallocCString(deviceId).asResource(),
                cKey = LibC.mallocCString(key).asResource()
            ) {
                var errCode: Int32 = 0
                let cValue = FfiOHOSDistributedKVStoreDeviceKVStoreGet(getID(), cDeviceId.value, cKey.value,
                    inout errCode)
                result = cValue.toValueType()
                cValue.free()
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to get. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode), "KVStore get failed: ${getErrorMsg(errCode)}")
                }
            }
            return result
        }
    }

    /**
     * Obtains all key-value pairs that match the local device ID and specified key prefix.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getEntries(keyPrefix: string): Promise<Entry[]>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getEntries(keyPrefix: String): ArrayList<Entry> {
        return getEntries("", keyPrefix)
    }

    /**
     * Obtains all key-value pairs matching a specified device ID and key prefix.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func getEntries(deviceId: String, keyPrefix: String): ArrayList<Entry> {
        unsafe {
            var entries = ArrayList<Entry>()
            try (
                cDeviceId = LibC.mallocCString(deviceId).asResource(),
                cKeyPrefix = LibC.mallocCString(keyPrefix).asResource()
            ) {
                var errCode: Int32 = 0
                let cEntries = FfiOHOSDistributedKVStoreDeviceKVStoreGetEntries(getID(), cDeviceId.value,
                    cKeyPrefix.value, inout errCode)
                entries = cEntries.toArray()
                cEntries.free()
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to getEntries. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode), "KVStore getEntries failed: ${getErrorMsg(errCode)}")
                }
            }
            return entries
        }
    }

    /**
     * Obtains the list of key-value pairs matching the local device ID and specified {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getEntries(query: Query): Promise<Entry[]>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getEntries(query: Query): ArrayList<Entry> {
        return getEntries("", query)
    }

    /**
     * Obtains the list of key-value pairs matching a specified device ID and {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getEntries(deviceId: string, query: Query): Promise<Entry[]>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func getEntries(deviceId: String, query: Query): ArrayList<Entry> {
        unsafe {
            let cDeviceId = LibC.mallocCString(deviceId)
            var errCode: Int32 = 0
            let cEntries = FfiOHOSDistributedKVStoreDeviceKVStoreGetEntriesQuery(getID(), cDeviceId, query.getID(),
                inout errCode)
            LibC.free(cDeviceId)
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
     * Obtains the result set with the local device ID and specified prefix from a {@code DeviceKVStore} database.
     * The {@code KVStoreResultSet} object can be used to query all key-value pairs that meet the search criteria.
     * Each {@code DeviceKVStore} instance can have a maximum of four {@code KVStoreResultSet} objects at the
     * same time.
     * If you have created four objects, calling this method will return a failure. Therefore, you are advised to
     * call the closeResultSet method to close unnecessary {@code KVStoreResultSet} objects in a timely manner.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100001 - Over max limits.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getResultSet(keyPrefix: String): KVStoreResultSet {
        return getResultSet("", keyPrefix)
    }

    /**
     * Obtains the {@code KVStoreResultSet} object matching the specified device ID and key prefix.
     * <p>The {@code KVStoreResultSet} object can be used to query all key-value pairs that meet the search criteria.
     * Each {@code DeviceKVStore}
     * instance can have a maximum of four {@code KVStoreResultSet} objects at the same time. If you have created four
     * objects, calling this method will return a failure. Therefore, you are advised to call the closeResultSet method to close
     * unnecessary {@code KVStoreResultSet} objects in a timely manner.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100001 - Over max limits.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func getResultSet(deviceId: String, keyPrefix: String): KVStoreResultSet {
        unsafe {
            var resultSetId = 0
            try (
                cDeviceId = LibC.mallocCString(deviceId).asResource(),
                cKeyPrefix = LibC.mallocCString(keyPrefix).asResource()
            ) {
                var errCode: Int32 = 0
                resultSetId = FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSet(getID(), cDeviceId.value,
                    cKeyPrefix.value, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to getResultSet. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVStore getResultSet failed: ${getErrorMsg(errCode)}")
                }
            }
            return KVStoreResultSet(resultSetId)
        }
    }

    /**
     * Obtains the {@code KVStoreResultSet} object matching the local device ID and specified {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100001 - Over max limits.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSet(query: Query): Promise<KVStoreResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getResultSet(query: Query): KVStoreResultSet {
        return getResultSet("", query)
    }

    /**
     * Obtains the {@code KVStoreResultSet} object matching a specified device ID and {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100001 - Over max limits.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSet(deviceId: string, query: Query): Promise<KVStoreResultSet>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func getResultSet(deviceId: String, query: Query): KVStoreResultSet {
        unsafe {
            let cDeviceId = LibC.mallocCString(deviceId)
            var errCode: Int32 = 0
            let resultSetId = FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSetQuery(getID(), cDeviceId, query.getID(),
                inout errCode)
            LibC.free(cDeviceId)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getResultSet. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getResultSet failed: ${getErrorMsg(errCode)}")
            }
            return KVStoreResultSet(resultSetId)
        }
    }

    /**
     * Obtains the number of results matching the local device ID and specified {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSize(query: Query): Promise<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getResultSize(query: Query): Int32 {
        return getResultSize("", query)
    }

    /**
     * Obtains the number of results matching a specified device ID and {@code Query} object.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes:1.Mandatory parameters are left unspecified;
     * <br>2.Incorrect parameters types.
     * @throws { BusinessException } 15100003 - Database corrupted.
     * @throws { BusinessException } 15100005 - Database or result set already closed.
     * @relation getResultSize(deviceId: string, query: Query): Promise<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func getResultSize(deviceId: String, query: Query): Int32 {
        unsafe {
            let cDeviceId = LibC.mallocCString(deviceId)
            var errCode: Int32 = 0
            let result = FfiOHOSDistributedKVStoreDeviceKVStoreGetResultSize(getID(), cDeviceId, query.getID(),
                inout errCode)
            LibC.free(cDeviceId)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getResultSize. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode), "KVStore getResultSize failed: ${getErrorMsg(errCode)}")
            }
            return result
        }
    }
}
