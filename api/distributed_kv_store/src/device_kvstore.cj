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

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*

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
     * @brief  get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void
     * @brief  get(key: string): Promise<boolean | string | number | Uint8Array>
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
     * @brief  get(deviceId: string, key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void
     * @brief  get(deviceId: string, key: string): Promise<boolean | string | number | Uint8Array>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    func get(deviceId: String, key: String): ValueType {
        unsafe {
            var result = ValueType.INTEGER(0)
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
     * @brief  getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(keyPrefix: string): Promise<Entry[]>
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
     * @brief  getEntries(deviceId: string, keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(deviceId: string, keyPrefix: string): Promise<Entry[]>
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
     * @brief  getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(query: Query): Promise<Entry[]>
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
     * @brief  getEntries(deviceId: string, query: Query, callback: AsyncCallback<Entry[]>): void
     * @brief  getEntries(deviceId: string, query: Query): Promise<Entry[]>
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
     * @brief  getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
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
     * @brief  getResultSet(deviceId: string, keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(deviceId: string, keyPrefix: string): Promise<KVStoreResultSet>
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
     * @brief  getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(query: Query): Promise<KVStoreResultSet>
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
     * @brief  getResultSet(deviceId: string, query: Query, callback: AsyncCallback<KVStoreResultSet>): void
     * @brief  getResultSet(deviceId: string, query: Query): Promise<KVStoreResultSet>
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
     * @brief  getResultSize(query: Query, callback: AsyncCallback<number>): void
     * @brief  getResultSize(query: Query): Promise<number>
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
     * @brief  getResultSize(deviceId: string, query: Query, callback: AsyncCallback<number>): void
     * @brief  getResultSize(deviceId: string, query: Query): Promise<number>
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
