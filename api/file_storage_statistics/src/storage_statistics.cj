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

package ohos.file_storage_statistics

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.HilogChannel
import ohos.labels.APILevel
import std.collection.HashMap

/**
 * Get the current bundle statistics.
 *
 * @throws { BusinessException } 13600001 - IPC error.
 * @throws { BusinessException } 13900042 - Unknown error.
 * @relation getCurrentBundleStats(): Promise<BundleStats>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.StorageService.SpatialStatistics"
]
public func getCurrentBundleStats(): BundleStats {
    var errCode: Int32 = 0
    var stats = NativeBundleStats(0, 0, 0)
    unsafe { FfiFileStorStatsGetCurrentBundleStats(inout stats, inout errCode) }
    throwIfNotSuccess(errCode)
    return stats.toObject()
}

/**
 * Get the total size.
 *
 * @throws { BusinessException } 13600001 - IPC error.
 * @throws { BusinessException } 13900042 - Unknown error.
 * @relation getTotalSize(): Promise<number>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.StorageService.SpatialStatistics"
]
public func getTotalSize(): Int64 {
    var errCode: Int32 = 0
    let size = unsafe { FfiFileStorStatsGetTotalSize(inout errCode) }
    throwIfNotSuccess(errCode)
    return size
}

/**
 * Get the free size.
 *
 * @throws { BusinessException } 13600001 - IPC error.
 * @throws { BusinessException } 13900042 - Unknown error.
 * @relation getFreeSize(): Promise<number>;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.StorageService.SpatialStatistics"
]
public func getFreeSize(): Int64 {
    var errCode: Int32 = 0
    let size = unsafe { FfiFileStorStatsGetFreeSize(inout errCode) }
    throwIfNotSuccess(errCode)
    return size
}

let LOG_DOMAIN: UInt32 = 0xD004301
let STORAGE_LOG_TAG = "CJ-StorageDaemon"
let Logger = HilogChannel(0, LOG_DOMAIN, STORAGE_LOG_TAG)
const E_IPCSS: Int32 = 13600001
const E_SUPPORTEDFS: Int32 = 13600002
const E_MOUNT_ERR: Int32 = 13600003
const E_UNMOUNT: Int32 = 13600004
const E_VOLUMESTATE: Int32 = 13600005
const E_PREPARE: Int32 = 13600006
const E_DELETE: Int32 = 13600007
const E_NOOBJECT: Int32 = 13600008
const E_OUTOFRANGE: Int32 = 13600009
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (E_IPCSS, "IPC error."),
        (E_SUPPORTEDFS, "File system not supported."),
        (E_MOUNT_ERR, "Mount failed"),
        (E_UNMOUNT, "Unmount failed."),
        (E_VOLUMESTATE, "Incorrect volume state."),
        (E_PREPARE, "Failed to create the directory or node."),
        (E_DELETE, "Failed to delete the directory or node."),
        (E_NOOBJECT, "No such object."),
        (E_OUTOFRANGE, "User ID out of range.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

func throwIfNotSuccess(code: Int32): Unit {
    if (code != SUCCESS_CODE) {
        if (code == ERR_PARAMETER_ERROR) {
            throw BusinessException(E_SUPPORTEDFS, getErrorMsg(E_SUPPORTEDFS))
        }
        throw BusinessException(code, getErrorMsg(code))
    }
}
