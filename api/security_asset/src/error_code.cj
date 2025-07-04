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

package ohos.asset_store

import std.collection.HashMap
import ohos.labels.*

/**
 * An enum type containing the Asset error codes.
 *
 * @syscap SystemCapability.Security.Asset
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Security.Asset"
]
public struct ErrorCode {
    /**
     * The error code means success.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ASSET_SUCCESS: Int32 = 0
    /**
     * The error code indicates that the caller doesn't have the permission.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const PERMISSION_DENIED: Int32 = 201
    /**
     * The error code indicates that the caller is not a system application.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NOT_SYSTEM_APPLICATION: Int32 = 202
    /**
     * The error code indicates that the argument is invalid.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const INVALID_ARGUMENT: Int32 = 401
    /**
     * The error code indicates that the ASSET service is unavailable.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const SERVICE_UNAVAILABLE: Int32 = 24000001
    /**
     * The error code indicates that the asset is not found.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const NOT_FOUND: Int32 = 24000002
    /**
     * The error code indicates that the asset already exists.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DUPLICATED: Int32 = 24000003
    /**
     * The error code indicates that access to the asset is denied.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ACCESS_DENIED: Int32 = 24000004
    /**
     * The error code indicates that the screen lock status does not match.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const STATUS_MISMATCH: Int32 = 24000005
    /**
     * The error code indicates insufficient memory.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const OUT_OF_MEMORY: Int32 = 24000006
    /**
     * The error code indicates that the asset is corrupted.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATA_CORRUPTED: Int32 = 24000007
    /**
     * The error code indicates that the database operation failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const DATABASE_ERROR: Int32 = 24000008
    /**
     * The error code indicates that the cryptography operation failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const CRYPTO_ERROR: Int32 = 24000009
    /**
     * The error code indicates that the ipc failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const IPC_ERROR: Int32 = 24000010
    /**
     * The error code indicates that calling the Bundle Manager service failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const BMS_ERROR: Int32 = 24000011
    /**
     * The error code indicates that calling the OS Account service failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ACCOUNT_ERROR: Int32 = 24000012
    /**
     * The error code indicates that calling the Access Token service failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const ACCESS_TOKEN_ERROR: Int32 = 24000013
    /**
     * The error code indicates that the file operation failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const FILE_OPERATION_ERROR: Int32 = 24000014
    /**
     * The error code indicates that getting the system time failed.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const GET_SYSTEM_TIME_ERROR: Int32 = 24000015
    /**
     * The error code indicates that the cache exceeds the limit.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const LIMIT_EXCEEDED: Int32 = 24000016
    /**
     * The error code indicates that the capability is not supported.
     *
     * @syscap SystemCapability.Security.Asset
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Security.Asset"
    ]
    public static const UNSUPPORTED: Int32 = 24000017
}

let ASSET_RESULT_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (ErrorCode.PERMISSION_DENIED, "The caller doesn't have the permission."),
    (ErrorCode.NOT_SYSTEM_APPLICATION, "Non-system applications use system APIs."),
    (ErrorCode.INVALID_ARGUMENT, "Parameter error."),
    (ErrorCode.SERVICE_UNAVAILABLE, "The ASSET service is unavailable."),
    (ErrorCode.NOT_FOUND, "The asset is not found."),
    (ErrorCode.ACCESS_DENIED, "Access denied."),
    (ErrorCode.DUPLICATED, "The asset already exists."),
    (ErrorCode.STATUS_MISMATCH, "The screen lock status does not match."),
    (ErrorCode.OUT_OF_MEMORY, "Insufficient memory."),
    (ErrorCode.DATA_CORRUPTED, "The asset is corrupted."),
    (ErrorCode.DATABASE_ERROR, "The database operation failed."),
    (ErrorCode.CRYPTO_ERROR, "The cryptography operation failed."),
    (ErrorCode.IPC_ERROR, "IPC failed."),
    (ErrorCode.BMS_ERROR, "Calling the Bundle Manager service failed."),
    (ErrorCode.ACCOUNT_ERROR, "Calling the OS Account service failed."),
    (ErrorCode.ACCESS_TOKEN_ERROR, "Calling the Access Token service failed."),
    (ErrorCode.FILE_OPERATION_ERROR, "The file operation failed."),
    (ErrorCode.GET_SYSTEM_TIME_ERROR, "Getting the system time failed."),
    (ErrorCode.LIMIT_EXCEEDED, "The cache exceeds the limit."),
    (ErrorCode.UNSUPPORTED, "The capability is not supported.")
)

func getErrorInfo(code: Int32): String {
    return ASSET_RESULT_CODE_MAP.get(code).getOrDefault({=> "Unknown error"})
}
