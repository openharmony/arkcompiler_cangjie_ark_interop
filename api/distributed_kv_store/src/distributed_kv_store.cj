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

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*
import std.collection.*
import std.sync.*

let KV_STORE_LOG = HilogChannel(0, 0xD001650, "CJ-DistributedKVStore")

type StageContext = CPointer<Unit>

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class DistributedKVStore {
    /**
     * @brief  createKVManager(config: KVManagerConfig): KVManager
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public static func createKVManager(config: KVManagerConfig): KVManager {
        unsafe {
            let cBoudleName = LibC.mallocCString(config.bundleName)
            let codeId = FfiOHOSDistributedKVStoreCreateKVManager(cBoudleName, config.context)
            LibC.free(cBoudleName)
            return KVManager(codeId)
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class KVManager <: RemoteDataLite {
    private let callbackList = ArrayList<(CallbackObject, Int64)>()
    private let onOffMutex = Mutex()
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    private func getKVStoreId(storeId: String, options: Options, kVStoreType: KVStoreType): Int64 {
        unsafe {
            var codeId = 0
            try (
                cStoreId = LibC.mallocCString(storeId).asResource(),
                cOptions = COptions(options, kVStoreType).asResource()
            ) {
                var errCode: Int32 = 0
                codeId = FfiOHOSDistributedKVStoreGetKVStore(getID(), cStoreId.value, cOptions.value, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to getKVStore. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager getKVStore failed: ${getErrorMsg(errCode)}")
                }
            }
            return codeId
        }
    }

    /**
     * @brief  getKVStore<T>(storeId: string, options: Options, callback: AsyncCallback<T>): void
     * @brief  getKVStore<T>(storeId: string, options: Options): Promise<T>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getSingleKVStore(storeId: String, options: Options): SingleKVStore {
        SingleKVStore(getKVStoreId(storeId, options, SINGLE_VERSION))
    }

    /**
     * @brief  getKVStore<T>(storeId: string, options: Options, callback: AsyncCallback<T>): void
     * @brief  getKVStore<T>(storeId: string, options: Options): Promise<T>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getDeviceKVStore(storeId: String, options: Options): DeviceKVStore {
        return DeviceKVStore(getKVStoreId(storeId, options, DEVICE_COLLABORATION))
    }

    /**
     * @brief  closeKVStore(appId: string, storeId: string, callback: AsyncCallback<void>): void
     * @brief  closeKVStore(appId: string, storeId: string): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func closeKVStore(appId: String, storeId: String): Unit {
        unsafe {
            try (
                cAppId = LibC.mallocCString(appId).asResource(),
                cStoreId = LibC.mallocCString(storeId).asResource()
            ) {
                let errCode = FfiOHOSDistributedKVStoreCloseKVStore(getID(), cAppId.value, cStoreId.value)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to closeKVStore. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager closeKVStore failed: ${getErrorMsg(errCode)}")
                }
            }
        }
    }

    /**
     * @brief  deleteKVStore(appId: string, storeId: string, callback: AsyncCallback<void>): void
     * @brief  deleteKVStore(appId: string, storeId: string): Promise<void>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func deleteKVStore(appId: String, storeId: String): Unit {
        unsafe {
            try (
                cAppId = LibC.mallocCString(appId).asResource(),
                cStoreId = LibC.mallocCString(storeId).asResource()
            ) {
                let errCode = FfiOHOSDistributedKVStoreDeleteKVStore(getID(), cAppId.value, cStoreId.value)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to deleteKVStore. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager deleteKVStore failed: ${getErrorMsg(errCode)}")
                }
            }
        }
    }

    /**
     * @brief  getAllKVStoreId(appId: string, callback: AsyncCallback<string[]>): void
     * @brief  getAllKVStoreId(appId: string): Promise<string[]>
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func getAllKVStoreId(appId: String): Array<String> {
        unsafe {
            let cAppId = LibC.mallocCString(appId)
            var errCode: Int32 = 0
            let cArrString = FfiOHOSDistributedKVStoreGetAllKVStoreId(getID(), cAppId, inout errCode)
            LibC.free(cAppId)
            if (errCode != SUCCESS_CODE) {
                KV_STORE_LOG.info("Failed to getAllKVStoreId. code: ${errCode}")
                throw BusinessException(getErrorCode(errCode),
                    "KVManager getAllKVStoreId failed: ${getErrorMsg(errCode)}")
            }
            let ptr = cArrString.head
            let size = cArrString.size
            if (ptr.isNull()) {
                return Array<String>()
            }
            let result = Array<String>(size, {i => ptr.read(i).toString()})
            cArrString.free()
            return result
        }
    }

    /**
     * @brief on(event: 'distributedDataServiceDie', deathCallback: Callback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public func onDistributedDataServiceDie(callback: Callback0Argument): Unit {
        synchronized(onOffMutex) {
            for (item in callbackList) {
                if (refEq(callback, item[0])) {
                    KV_STORE_LOG.error("KVManager onDistributedDataServiceDie failed: The same function is registered.")
                    return
                }
            }
            unsafe {
                let wrapper = {=> callback.invoke()}
                let lambdaData = Callback0Param(wrapper)
                let errCode = FfiOHOSDistributedKVStoreOnDistributedDataServiceDie(getID(), lambdaData.getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to onDistributedDataServiceDie. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager onDistributedDataServiceDie failed: ${getErrorMsg(errCode)}")
                }
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * @brief off(event: 'distributedDataServiceDie', deathCallback?: Callback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public func offDistributedDataServiceDie(callback: Callback0Argument): Unit {
        synchronized(onOffMutex) {
            var funcId = 0
            var i = 0
            for (item in callbackList) {
                if (refEq(callback, item[0])) {
                    funcId = item[1]
                    break
                }
                i++
            }
            if (funcId == 0) {
                KV_STORE_LOG.error("KVManager offDistributedDataServiceDie failed: This function cannot be found.")
                return
            }
            unsafe {
                let errCode = FfiOHOSDistributedKVStoreOffDistributedDataServiceDie(getID(), funcId)
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to offDistributedDataServiceDie. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager offDistributedDataServiceDie failed: ${getErrorMsg(errCode)}")
                }
                callbackList.remove(at: i)
            }
        }
    }

    /**
     * @brief off(event: 'distributedDataServiceDie', deathCallback?: Callback<void>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public func offDistributedDataServiceDie(): Unit {
        synchronized(onOffMutex) {
            unsafe {
                let errCode = FfiOHOSDistributedKVStoreOffAllDistributedDataServiceDie(getID())
                if (errCode != SUCCESS_CODE) {
                    KV_STORE_LOG.info("Failed to offDistributedDataServiceDie. code: ${errCode}")
                    throw BusinessException(getErrorCode(errCode),
                        "KVManager offDistributedDataServiceDie failed: ${getErrorMsg(errCode)}")
                }
            }
            callbackList.clear()
        }
    }
}
