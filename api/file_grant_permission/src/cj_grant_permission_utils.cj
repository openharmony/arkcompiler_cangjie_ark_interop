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

package ohos.file_grant_permission

import ohos.base.*
import std.collection.HashMap
import ohos.labels.APILevel
import std.deriving.Derive

/**
 * Enumerates the uri operate mode types.
 * @relation export enum OperationMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public enum OperationMode {
    /**
     * Indicates read permissions.
     *
     * @relation READ_MODE = 0b1
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    ReadMode
    |
        /**
         * Indicates write permissions.
         *
         * @relation WRITE_MODE = 0b10
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    WriteMode
    | ...

    prop value: UInt8 {
        get() {
            match (this) {
                case ReadMode => 0b1
                case WriteMode => 0b10
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates the error code of the permission policy for the URI operation.
 * @relation export enum PolicyErrorCode
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public enum PolicyErrorCode {
    /**
     * Indicates that the policy is not allowed to be persisted.
     *
     * @relation PERSISTENCE_FORBIDDEN = 1
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    PersistenceForbidden
    |
        /**
         * Indicates that the mode of this policy is invalid.
         *
         * @relation INVALID_MODE = 2
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    InvalidMode
    |
        /**
         * Indicates that the path of this policy is invalid.
         *
         * @relation INVALID_PATH = 3
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    InvalidPath
    |
        /**
         * Indicates that the permission is not persistent.
         *
         * @relation PERMISSION_NOT_PERSISTED = 4
         */
        @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    PermissionNotPersisted
    | ...

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public prop value: UInt8 {
        get() {
            match (this) {
                case PersistenceForbidden => 1
                case InvalidMode => 2
                case InvalidPath => 3
                case PermissionNotPersisted => 4
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(value: Int32): PolicyErrorCode {
        match (value) {
            case 1 => PersistenceForbidden
            case 2 => InvalidMode
            case 3 => InvalidPath
            case 4 => PermissionNotPersisted
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Policy information to manager permissions on a URI.
 *
 * @relation interface PolicyInfo
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public class PolicyInfo {
    /**
     * Indicates the uri of the policy information.
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let uri: String
    /**
     * Indicates the mode of operation for the URI, example { OperationMode.READ_MODE } or { OperationMode.READ_MODE | OperationMode.WRITE_MODE }
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let operationMode: OperationMode

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public init(uri: String, operationMode: OperationMode) {
        this.uri = uri
        this.operationMode = operationMode
    }
}

/**
 * Failed policy result on URI.
 *
 * @relation type PolicyErrorResult
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public class PolicyErrorResult {
    /**
     * Indicates the failed uri of the policy information.
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let uri: String
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let code: PolicyErrorCode
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let message: String

    init(uri: String, code: PolicyErrorCode, message: String) {
        this.uri = uri
        this.code = code
        this.message = message
    }
}

@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
]
public class ErrorResult {
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let code: Int32
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let message: String
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.AppFileService.FolderAuthorization"
    ]
    public let results: Array<PolicyErrorResult>

    init(code: Int32, message: String, results: Array<PolicyErrorResult>) {
        this.code = code
        this.message = message
        this.results = results
    }
}

const MAX_ARRAY_SIZE = 500
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>(
    (13900001, "Operation not permitted."),
    (13900042, "Unknown error.")
)

func getErrorInfo(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}
