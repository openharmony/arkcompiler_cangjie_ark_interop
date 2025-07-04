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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * @brief  getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func getRdbStore(context: StageContext, config: StoreConfig): RdbStore {
    unsafe {
        let retStoreConfig = RetStoreConfig.create(config)
        var errCode: Int32 = 0
        throwIfOOM(retStoreConfig.isNone(), "getRdbStore")
        let id = FfiOHOSRelationalStoreGetRdbStore(context, retStoreConfig.getOrThrow(), inout errCode)
        retStoreConfig.getOrThrow().free()
        throwIfNotSuccess(errCode, "getRdbStore")
        return RdbStore(id)
    }
}

/**
 * @brief  deleteRdbStore(context: Context, name: string): Promise<void>
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func deleteRdbStore(context: StageContext, name: String): Unit {
    let cName = unsafe { LibC.mallocCString(name) }
    var errCode: Int32 = 0
    unsafe {
        FfiOHOSRelationalStoreDeleteRdbStore(context, cName, inout errCode)
        LibC.free(cName)
        throwIfNotSuccess(errCode, "deleteRdbStore")
    }
}

/**
 * @brief  deleteRdbStore(context: Context, config: StoreConfig): Promise<void>
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func deleteRdbStore(context: StageContext, config: StoreConfig): Unit {
    unsafe {
        let retStoreConfig = RetStoreConfig.create(config)
        var errCode: Int32 = 0
        throwIfOOM(retStoreConfig.isNone(), "deleteRdbStore")
        FfiOHOSRelationalStoreDeleteRdbStoreConfig(context, retStoreConfig.getOrThrow(), inout errCode)
        retStoreConfig.getOrThrow().free()
        throwIfNotSuccess(errCode, "deleteRdbStore")
    }
}
