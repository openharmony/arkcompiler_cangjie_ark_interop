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

package ohos.data.relational_store

import ohos.app.ability.ui_ability.{UIAbilityContext, getStageContext}
import ohos.base.{BusinessException, ERR_PARAMETER_ERROR}
import ohos.labels.*

/**
 * Obtains a RDB store.
 * You can set parameters of the RDB store as required. In general, this method is recommended
 * to obtain a rdb store.
 *
 * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types; 3. Parameter verification failed. 
 * @throws { BusinessException  } 14800000 - Inner error.
 * @throws { BusinessException  } 14800010 - Failed to open or delete the database by an invalid database path.
 * @throws { BusinessException  } 14800011 - Failed to open the database because it is corrupted.
 * @throws { BusinessException  } 14801001 - The operation is supported in the stage model only.
 * @throws { BusinessException  } 14801002 - Invalid data group ID.
 * @throws { BusinessException  } 14800017 - StoreConfig is changed.
 * @throws { BusinessException  } 14800020 - The secret key is corrupted or lost.
 * @throws { BusinessException  } 14800021 - SQLite: Generic error.
 * Possible causes: Insert failed or the updated data does not exist.
 * @throws { BusinessException  } 14800022 - SQLite: Callback routine requested an abort.
 * @throws { BusinessException  } 14800023 - SQLite: Access permission denied.
 * @throws { BusinessException  } 14800027 - SQLite: Attempt to write a readonly database.
 * @throws { BusinessException  } 14800028 - SQLite: Some kind of disk I/O error occurred.
 * @throws { BusinessException  } 14800029 - SQLite: The database is full.
 * @throws { BusinessException  } 14800030 - SQLite: Unable to open the database file.
 * @relation function getRdbStore(context: Context, config: StoreConfig): Promise<RdbStore>;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func getRdbStore(context: UIAbilityContext, config: StoreConfig): RdbStore {
    let stageContext = getStageContext(context)
    if (stageContext.isNull()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    unsafe {
        let retStoreConfig = RetStoreConfig.create(config)
        var errCode: Int32 = 0
        throwIfOOM(retStoreConfig.isNone(), "getRdbStore")
        let id = FfiOHOSRelationalStoreGetRdbStore(stageContext, retStoreConfig.getOrThrow(), inout errCode)
        retStoreConfig.getOrThrow().free()
        throwIfNotSuccess(errCode, "getRdbStore")
        return RdbStore(id)
    }
}

/**
 * Deletes the database with a specified store config.
 * When specify custom directory, this function should be called.
 *
 * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException  } 14800000 - Inner error.
 * @throws { BusinessException  } 14800010 - Failed to open or delete the database by an invalid database path.
 * @relation function deleteRdbStore(context: Context, name: string): Promise<void>;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func deleteRdbStore(context: UIAbilityContext, name: String): Unit {
    let stageContext = getStageContext(context)
    if (stageContext.isNull()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    let cName = unsafe { LibC.mallocCString(name) }
    var errCode: Int32 = 0
    unsafe {
        FfiOHOSRelationalStoreDeleteRdbStore(stageContext, cName, inout errCode)
        LibC.free(cName)
        throwIfNotSuccess(errCode, "deleteRdbStore")
    }
}

/**
 * Deletes the database with a specified store config.
 * When specify custom directory, this function should be called.
 *
 * @throws { BusinessException  } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br>2. Incorrect parameter types.
 * @throws { BusinessException  } 14800000 - Inner error.
 * @throws { BusinessException  } 14800010 - Failed to open or delete the database by an invalid database path.
 * @throws { BusinessException  } 14801001 - The operation is supported in the stage model only.
 * @throws { BusinessException  } 14801002 - Invalid data group ID.
 * @relation function deleteRdbStore(context: Context, config: StoreConfig): Promise<void>;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public func deleteRdbStore(context: UIAbilityContext, config: StoreConfig): Unit {
    let stageContext = getStageContext(context)
    if (stageContext.isNull()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    unsafe {
        let retStoreConfig = RetStoreConfig.create(config)
        var errCode: Int32 = 0
        throwIfOOM(retStoreConfig.isNone(), "deleteRdbStore")
        FfiOHOSRelationalStoreDeleteRdbStoreConfig(stageContext, retStoreConfig.getOrThrow(), inout errCode)
        retStoreConfig.getOrThrow().free()
        throwIfNotSuccess(errCode, "deleteRdbStore")
    }
}
