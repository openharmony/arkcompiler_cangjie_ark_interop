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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SecurityLevel {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S1
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S2
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S3
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S4
    | ...

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ChangeType {
    @!APILevel[
        21,
        permission: "ohos.DISTRIBUTED_DATASYNC",
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DataChange
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetChange
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DataChange => 0
            case AssetChange => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ChangeType {
        match (val) {
            case 0 => DataChange
            case 1 => AssetChange
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class StoreConfig {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var securityLevel: SecurityLevel
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var encrypt: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var dataGroupId: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var customDir: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public var autoCleanDirtyData: Bool

    @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum AssetStatus {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetNormal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetInsert
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetDelete
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetAbnormal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetDownloading
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case AssetNormal => 1
            case AssetInsert => 2
            case AssetUpdate => 3
            case AssetDelete => 4
            case AssetAbnormal => 5
            case AssetDownloading => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): AssetStatus {
        match (val) {
            case 1 => AssetNormal
            case 2 => AssetInsert
            case 3 => AssetUpdate
            case 4 => AssetDelete
            case 5 => AssetAbnormal
            case 6 => AssetDownloading
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.CloudSync.Client"
]
public enum Field {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    CursorField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    OriginField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    DeletedFlagField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    OwnerField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    PrivilegeField
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SharingResourceField
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    public func getValue(): String {
        match (this) {
            case CursorField => "#_cursor"
            case OriginField => "#_origin"
            case DeletedFlagField => "#_deleted_flag"
            case OwnerField => "#_cloud_owner"
            case PrivilegeField => "#_cloud_privilege"
            case SharingResourceField => "#_sharing_resource_field"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ConflictResolution {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictNone
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictRollback
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictAbort
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictFail
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictIgnore
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictReplace
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case OnConflictNone => 0
            case OnConflictRollback => 1
            case OnConflictAbort => 2
            case OnConflictFail => 3
            case OnConflictIgnore => 4
            case OnConflictReplace => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class Asset {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var name: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var uri: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var path: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var createTime: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var modifyTime: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var size: String
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var status: AssetStatus

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public init(name: String, uri: String, path: String, createTime: String, modifyTime: String, size: String,
        status!: AssetStatus = AssetStatus.AssetNormal) {
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ValueType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Null
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Integer(Int64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Double(Float64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    StringValue(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Boolean(Bool)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Uint8Array(Array<UInt8>)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetEnum(Asset)
    | @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum DistributedType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DistributedDevice
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    DistributedCloud
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DistributedDevice => 0
            case DistributedCloud => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SyncMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncModePush
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncModePull
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SyncModeTimeFirst
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SyncModeNativeFirst
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SyncModeCloudFirst
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SyncModePush => 0
            case SyncModePull => 1
            case SyncModeTimeFirst => 4
            case SyncModeNativeFirst => 5
            case SyncModeCloudFirst => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Progress {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncBegin
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncInProgress
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncInFinish
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SyncBegin => 0
            case SyncInProgress => 1
            case SyncInFinish => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): Progress {
        match (val) {
            case 0 => SyncBegin
            case 1 => SyncInProgress
            case 2 => SyncInFinish
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ProgressCode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Success
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    UnknownError
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NetworkError
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    CloudDisabled
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    LockedByOthers
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    RecordLimitExceeded
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NoSpaceForAsset
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Success => 0
            case UnknownError => 1
            case NetworkError => 2
            case CloudDisabled => 3
            case LockedByOthers => 4
            case RecordLimitExceeded => 5
            case NoSpaceForAsset => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ProgressCode {
        match (val) {
            case 0 => Success
            case 1 => UnknownError
            case 2 => NetworkError
            case 3 => CloudDisabled
            case 4 => LockedByOthers
            case 5 => RecordLimitExceeded
            case 6 => NoSpaceForAsset
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SubscribeType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SubscribeTypeRemote
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SubscribeTypeCloud
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.CloudSync.Client"
    ]
    SubscribeTypeCloudDetails
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SubscribeTypeRemote => 0
            case SubscribeTypeCloud => 1
            case SubscribeTypeCloudDetails => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Origin {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Local
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Cloud
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Remote
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case Local => 0
            case Cloud => 1
            case Remote => 2
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
