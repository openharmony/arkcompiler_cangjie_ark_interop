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

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*
import std.collection.*

const UINT64_MAX: UInt64 = 0xffff_ffff_ffff_ffff
let RELATIONAL_STORE_LOG = HilogChannel(0, 0xD001650, "CJ-Relational_Store")

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SecurityLevel {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S1
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S2
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S3
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S4
    | ...

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case S1 => 1
            case S2 => 2
            case S3 => 3
            case S4 => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ChangeType {
    @!APILevel[
        12,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DATA_CHANGE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_CHANGE
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DATA_CHANGE => 0
            case ASSET_CHANGE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ChangeType {
        match (val) {
            case 0 => DATA_CHANGE
            case 1 => ASSET_CHANGE
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class StoreConfig {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let name: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let securityLevel: SecurityLevel
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let encrypt: Bool
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let dataGroupId: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let customDir: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public let autoCleanDirtyData: Bool

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public init(name: String, securityLevel: SecurityLevel, encrypt!: Bool = false, dataGroupId!: String = "",
        customDir!: String = "", autoCleanDirtyData!: Bool = true) {
        this.name = name
        this.securityLevel = securityLevel
        this.encrypt = encrypt
        this.dataGroupId = dataGroupId
        this.customDir = customDir
        this.autoCleanDirtyData = autoCleanDirtyData
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum AssetStatus {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_NORMAL
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_INSERT
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_UPDATE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_DELETE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_ABNORMAL
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ASSET_DOWNLOADING
    | ...

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case ASSET_NORMAL => 1
            case ASSET_INSERT => 2
            case ASSET_UPDATE => 3
            case ASSET_DELETE => 4
            case ASSET_ABNORMAL => 5
            case ASSET_DOWNLOADING => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): AssetStatus {
        match (val) {
            case 1 => ASSET_NORMAL
            case 2 => ASSET_INSERT
            case 3 => ASSET_UPDATE
            case 4 => ASSET_DELETE
            case 5 => ASSET_ABNORMAL
            case 6 => ASSET_DOWNLOADING
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.CloudSync.Client"
]
public enum Field {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    CURSOR_FIELD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    ORIGIN_FIELD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    DELETED_FLAG_FIELD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    OWNER_FIELD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    PRIVILEGE_FIELD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SHARING_RESOURCE_FIELD
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func getValue(): String {
        match (this) {
            case CURSOR_FIELD => "#_cursor"
            case ORIGIN_FIELD => "#_origin"
            case DELETED_FLAG_FIELD => "#_deleted_flag"
            case OWNER_FIELD => "#_cloud_owner"
            case PRIVILEGE_FIELD => "#_cloud_privilege"
            case SHARING_RESOURCE_FIELD => "#_sharing_resource_field"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ConflictResolution {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_NONE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_ROLLBACK
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_ABORT
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_FAIL
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_IGNORE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    ON_CONFLICT_REPLACE
    | ...

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case ON_CONFLICT_NONE => 0
            case ON_CONFLICT_ROLLBACK => 1
            case ON_CONFLICT_ABORT => 2
            case ON_CONFLICT_FAIL => 3
            case ON_CONFLICT_IGNORE => 4
            case ON_CONFLICT_REPLACE => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public struct Asset {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let name: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let uri: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let path: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let createTime: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let modifyTime: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let size: String
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public let status: AssetStatus

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public init(name: String, uri: String, path: String, createTime: String, modifyTime: String, size: String,
        status!: AssetStatus = AssetStatus.ASSET_NORMAL) {
        this.name = name
        this.uri = uri
        this.path = path
        this.createTime = createTime
        this.modifyTime = modifyTime
        this.size = size
        this.status = status
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ValueType {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    null
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    integer(Int64)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    double(Float64)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    string(String)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    boolean(Bool)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Uint8Array(Array<UInt8>)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetEnum(Asset)
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetsEnum(Array<Asset>)
    | ...
}

enum DataPosition {
    | StringArray(Array<String>)
    | Int64Array(Array<Int64>)
    | Float64Array(Array<Float64>)
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum DistributedType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DISTRIBUTED_DEVICE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    DISTRIBUTED_CLOUD
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DISTRIBUTED_DEVICE => 0
            case DISTRIBUTED_CLOUD => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SyncMode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SYNC_MODE_PUSH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SYNC_MODE_PULL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SYNC_MODE_TIME_FIRST
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SYNC_MODE_NATIVE_FIRST
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SYNC_MODE_CLOUD_FIRST
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SYNC_MODE_PUSH => 0
            case SYNC_MODE_PULL => 1
            case SYNC_MODE_TIME_FIRST => 4
            case SYNC_MODE_NATIVE_FIRST => 5
            case SYNC_MODE_CLOUD_FIRST => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Progress {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SYNC_BEGIN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SYNC_IN_PROGRESS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SYNC_FINISH
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SYNC_BEGIN => 0
            case SYNC_IN_PROGRESS => 1
            case SYNC_FINISH => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): Progress {
        match (val) {
            case 0 => SYNC_BEGIN
            case 1 => SYNC_IN_PROGRESS
            case 2 => SYNC_FINISH
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ProgressCode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SUCCESS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    UNKNOWN_ERROR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NETWORK_ERROR
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    CLOUD_DISABLED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    LOCKED_BY_OTHERS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    RECORD_LIMIT_EXCEEDED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NO_SPACE_FOR_ASSET
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SUCCESS => 0
            case UNKNOWN_ERROR => 1
            case NETWORK_ERROR => 2
            case CLOUD_DISABLED => 3
            case LOCKED_BY_OTHERS => 4
            case RECORD_LIMIT_EXCEEDED => 5
            case NO_SPACE_FOR_ASSET => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ProgressCode {
        match (val) {
            case 0 => SUCCESS
            case 1 => UNKNOWN_ERROR
            case 2 => NETWORK_ERROR
            case 3 => CLOUD_DISABLED
            case 4 => LOCKED_BY_OTHERS
            case 5 => RECORD_LIMIT_EXCEEDED
            case 6 => NO_SPACE_FOR_ASSET
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SubscribeType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SUBSCRIBE_TYPE_REMOTE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SUBSCRIBE_TYPE_CLOUD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SUBSCRIBE_TYPE_CLOUD_DETAILS
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SUBSCRIBE_TYPE_REMOTE => 0
            case SUBSCRIBE_TYPE_CLOUD => 1
            case SUBSCRIBE_TYPE_CLOUD_DETAILS => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Origin {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    LOCAL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    CLOUD
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    REMOTE
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case LOCAL => 0
            case CLOUD => 1
            case REMOTE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

const E_INNER_ERROR: Int32 = 14800000
const E_BASE: Int32 = 27394048
const E_NOT_SELECT: Int32 = (E_BASE + 7)
const E_COLUMN_OUT_RANGE: Int32 = (E_BASE + 8)
const E_INVALID_FILE_PATH: Int32 = (E_BASE + 11)
const E_ROW_OUT_RANGE: Int32 = (E_BASE + 13)
const E_NO_ROW_IN_QUERY: Int32 = (E_BASE + 18)
const E_ALREADY_CLOSED: Int32 = (E_BASE + 30)
const E_DATABASE_BUSY: Int32 = (E_BASE + 34)
const E_WAL_SIZE_OVER_LIMIT: Int32 = (E_BASE + 47)
const E_GET_DATAOBSMGRCLIENT_FAIL: Int32 = (E_BASE + 50)
const E_TYPE_MISMATCH: Int32 = (E_BASE + 51)
const E_SQLITE_FULL: Int32 = (E_BASE + 52)
const E_ATTACHED_DATABASE_EXIST: Int32 = (E_BASE + 54)
const E_SQLITE_ERROR: Int32 = (E_BASE + 55)
const E_SQLITE_CORRUPT: Int32 = (E_BASE + 56)
const E_SQLITE_ABORT: Int32 = (E_BASE + 58)
const E_SQLITE_PERM: Int32 = (E_BASE + 59)
const E_SQLITE_BUSY: Int32 = (E_BASE + 60)
const E_SQLITE_LOCKED: Int32 = (E_BASE + 61)
const E_SQLITE_NOMEM: Int32 = (E_BASE + 62)
const E_SQLITE_READONLY: Int32 = (E_BASE + 63)
const E_SQLITE_IOERR: Int32 = (E_BASE + 64)
const E_SQLITE_CANTOPEN: Int32 = (E_BASE + 65)
const E_SQLITE_TOOBIG: Int32 = (E_BASE + 66)
const E_SQLITE_CONSTRAINT: Int32 = (E_BASE + 67)
const E_SQLITE_MISMATCH: Int32 = (E_BASE + 68)
const E_SQLITE_MISUSE: Int32 = (E_BASE + 69)
const E_CONFIG_INVALID_CHANGE: Int32 = (E_BASE + 70)
const MEMORY_ERROR: Int32 = -1
let ERROR_CODE_MAP = HashMap<Int32, (Int32, String)>(
    [
        (14801001, (14801001, "Only supported in stage mode.")),
        (14801002, (14801002, "The data group id is invalid.")),
        (E_NOT_SELECT, (14800019, "The SQL must be a query statement.")),
        (E_COLUMN_OUT_RANGE, (14800013, "Column out of bounds.")),
        (E_INVALID_FILE_PATH, (14800010, "Invalid database path.")),
        (E_ROW_OUT_RANGE, (14800012, "Row out of bounds.")),
        (E_NO_ROW_IN_QUERY, (14800012, "No data meets the condition.")),
        (E_ALREADY_CLOSED, (14800014, "Already closed.")),
        (E_DATABASE_BUSY, (14800015, "The database does not respond.")),
        (E_WAL_SIZE_OVER_LIMIT, (14800047, "The WAL file size over default limit.")),
        (E_GET_DATAOBSMGRCLIENT_FAIL, (14801050, "Failed to get DataObsMgrClient.")),
        (E_TYPE_MISMATCH, (14800051, "The type of the distributed table does not match.")),
        (E_SQLITE_FULL, (14800029, "SQLite: The database is full.")),
        (E_ATTACHED_DATABASE_EXIST, (14800016, "The database is already attached.")),
        (E_SQLITE_ERROR, (14800021, "SQLite: Generic error.")),
        (E_SQLITE_CORRUPT, (14800011, "Database corrupted.")),
        (E_SQLITE_ABORT, (14800022, "SQLite: Callback routine requested an abort.")),
        (E_SQLITE_PERM, (14800023, "SQLite: Access permission denied.")),
        (E_SQLITE_BUSY, (14800024, "SQLite: The database file is locked.")),
        (E_SQLITE_LOCKED, (14800025, "SQLite: A table in the database is locked.")),
        (E_SQLITE_NOMEM, (14800026, "SQLite: The database is out of memory.")),
        (E_SQLITE_READONLY, (14800027, "SQLite: Attempt to write a readonly database.")),
        (E_SQLITE_IOERR, (14800028, "SQLite: Some kind of disk I/O error occurred.")),
        (E_SQLITE_CANTOPEN, (14800030, "SQLite: Unable to open the database file.")),
        (E_SQLITE_TOOBIG, (14800031, "SQLite: TEXT or BLOB exceeds size limit.")),
        (E_SQLITE_CONSTRAINT, (14800032, "SQLite: Abort due to constraint violation.")),
        (E_SQLITE_MISMATCH, (14800033, "SQLite: Data type mismatch.")),
        (E_SQLITE_MISUSE, (14800034, "SQLite: Library used incorrectly.")),
        (E_CONFIG_INVALID_CHANGE, (14800017, "Config changed.")),
        (MEMORY_ERROR, (E_INNER_ERROR, "Instance invalid."))
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code][1]
    } else {
        return "Inner error. Inner code is ${code % E_INNER_ERROR}"
    }
}

func getErrorCode(code: Int32): Int32 {
    if (UNIVERSAL_ERROR_MAP.contains(code)) {
        return code
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code][0]
    } else {
        return E_INNER_ERROR
    }
}

func freeCStringArray(columnsArray: CPointer<CString>, i: Int64): Unit {
    if (columnsArray.isNull()) {
        return
    }
    for (j in 0..i) {
        unsafe { LibC.free(columnsArray.read(j)) }
    }
}

func freeValuesArray(valuesArray: CPointer<RetValueType>, i: Int64): Unit {
    if (valuesArray.isNull()) {
        return
    }
    for (j in 0..i) {
        unsafe { valuesArray.read(j).free() }
    }
}

func freeValuesBucketArray(arr: CPointer<ValuesBucket>, i: Int64): Unit {
    if (arr.isNull()) {
        return
    }
    for (j in 0..i) {
        unsafe { arr.read(j).free() }
    }
}

func createFieldValue(field: String, value: String, funcName: String): (CString, CString) {
    let cfield = mallocCString(field)
    let cvalue = mallocCString(value)
    if (let Some(cFieldStr) <- cfield && let Some(cValueStr) <- cvalue) {
        return (cFieldStr, cValueStr)
    }
    if (let Some(cFieldStr) <- cfield) {
        unsafe { LibC.free(cFieldStr) }
    }
    if (let Some(cValueStr) <- cvalue) {
        unsafe { LibC.free(cValueStr) }
    }
    RELATIONAL_STORE_LOG.error("RdbPredicates ${funcName} failed: ${getErrorMsg(MEMORY_ERROR)}")
    throw BusinessException(getErrorCode(MEMORY_ERROR), "RdbPredicates ${funcName} failed: ${getErrorMsg(MEMORY_ERROR)}")
}

func paramError(needed: String, mustbe: String): String {
    return "Parameter error. The " + needed + " must be " + mustbe + "."
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), "${className} ${funcName} failed: ${getErrorMsg(code)}")
    }
}

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(getErrorCode(code), "${funcName} failed: ${getErrorMsg(code)}")
    }
}

func throwIfOOM(isOOM: Bool, funcName: String): Unit {
    if (isOOM) {
        throw BusinessException(getErrorCode(MEMORY_ERROR), "${funcName} failed: ${getErrorMsg(MEMORY_ERROR)}")
    }
}

func throwIfOOM(isOOM: Bool, className: String, funcName: String): Unit {
    if (isOOM) {
        throw BusinessException(getErrorCode(MEMORY_ERROR),
            "${className} ${funcName} failed: ${getErrorMsg(MEMORY_ERROR)}")
    }
}

func throwIfOOM(isOOM: Bool, className: String, funcName: String, handler: () -> Unit): Unit {
    if (isOOM) {
        handler()
        throw BusinessException(getErrorCode(MEMORY_ERROR),
            "${className} ${funcName} failed: ${getErrorMsg(MEMORY_ERROR)}")
    }
}
