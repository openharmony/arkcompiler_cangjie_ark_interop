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

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.labels.*
import std.collection.*

const UINT64_MAX: UInt64 = 0xffff_ffff_ffff_ffff
let RELATIONAL_STORE_LOG = HilogChannel(0, 0xD001650, "CJ-Relational_Store")

/**
 * Describes the {@code RdbStore} type.
 *
 * @relation enum SecurityLevel
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SecurityLevel {
    /**
     * S1: means the db is low level security
     * There are some low impact, when the data is leaked.
     *
     * @relation S1 = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S1
    |
    /**
     * S2: means the db is middle level security
     * There are some major impact, when the data is leaked.
     *
     * @relation S2 = 2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S2
    |
    /**
     * S3: means the db is high level security
     * There are some severity impact, when the data is leaked.
     *
     * @relation S3 = 3,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S3
    |
    /**
     * S4: means the db is critical level security
     * There are some critical impact, when the data is leaked.
     *
     * @relation S4 = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    S4
    | ...

    func getValue(): Int32 {
        match (this) {
            case S1 => 1
            case S2 => 2
            case S3 => 3
            case S4 => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Describes the change type.
 *
 * @relation enum ChangeType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ChangeType {
    /**
     * Means the change type is data change.
     *
     * @relation DATA_CHANGE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DataChange
    |
    /**
     * Means the change type is asset change.
     *
     * @relation ASSET_CHANGE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetChange
    | ...

    func getValue(): Int32 {
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

/**
 * Manages relational database configurations.
 *
 * @relation interface StoreConfig
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class StoreConfig {
    /**
     * The database name.
     *
     * @relation name: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var name: String

    /**
     * Specifies the security level of the database.
     *
     * @relation securityLevel: SecurityLevel;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var securityLevel: SecurityLevel

    /**
     * Specifies whether the database is encrypted.
     *
     * @relation encrypt?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var encrypt: Bool

    /**
     * The data group id of application.
     *
     * @relation dataGroupId?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var dataGroupId: String

    /**
     * Specifies the directory relative to the database directory obtained from context.
     *
     * @relation customDir?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var customDir: String


    /**
     * Specifies whether to clean up dirty data that is synchronized to
     * the local but deleted in the cloud.
     *
     * @relation autoCleanDirtyData?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    public var autoCleanDirtyData: Bool

    /**
     * StoreConfig constructor.
     * 
     */
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

/**
 * Describes the status of asset
 *
 * @relation enum AssetStatus
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum AssetStatus {
    /**
     * ASSET_NORMAL: means the status of asset is normal.
     *
     * @relation ASSET_NORMAL,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetNormal
    |
    /**
     * ASSET_INSERT: means the asset needs to be inserted.
     *
     * @relation ASSET_INSERT,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetInsert
    |
    /**
     * ASSET_UPDATE: means the asset needs to be updated.
     *
     * @relation ASSET_UPDATE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetUpdate
    |
    /**
     * ASSET_DELETE: means the asset needs to be deleted.
     *
     * @relation ASSET_DELETE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetDelete
    |
    /**
     * ASSET_ABNORMAL: means the status of asset is abnormal.
     *
     * @relation ASSET_ABNORMAL,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetAbnormal
    |
    /**
     * ASSET_DOWNLOADING: means the status of asset is downloading.
     *
     * @relation ASSET_DOWNLOADING
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetDownloading
    | ...

    func getValue(): Int32 {
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

/**
 * Enumerates the field.
 *
 * @relation enum Field
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
]
public enum Field {
    /**
     * Cursor field.
     *
     * @relation CURSOR_FIELD = '#_cursor',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    CursorField
    |
    /**
     * Origin field. For details, see {@link Origin}.
     *
     * @relation ORIGIN_FIELD = '#_origin',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    OriginField
    |
    /**
     * Deleted flag field.
     * Indicates whether data has deleted in cloud.
     *
     * @relation DELETED_FLAG_FIELD = '#_deleted_flag',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    DeletedFlagField
    |
    /**
     * Owner field.
     *
     * @relation OWNER_FIELD = '#_cloud_owner',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    OwnerField
    |
    /**
     * Privilege field.
     *
     * @relation PRIVILEGE_FIELD = '#_cloud_privilege',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    PrivilegeField
    |
    /**
     * Sharing resource field.
     *
     * @relation SHARING_RESOURCE_FIELD = '#_sharing_resource_field'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SharingResourceField
    | ...

    func getValue(): String {
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

/**
 * Describes the conflict resolutions to insert data into the table.
 *
 * @relation enum ConflictResolution
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ConflictResolution {
    /**
     * Implements no action when conflict occurs.
     *
     * @relation ON_CONFLICT_NONE = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictNone
    |
    /**
     * Implements rollback operation when conflict occurs.
     *
     * @relation ON_CONFLICT_ROLLBACK = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictRollback
    |
    /**
     * Implements abort operation when conflict occurs.
     *
     * @relation ON_CONFLICT_ABORT = 2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictAbort
    |
    /**
     * Implements fail operation when conflict occurs.
     *
     * @relation ON_CONFLICT_FAIL = 3,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictFail
    |
    /**
     * Implements ignore operation when conflict occurs.
     *
     * @relation ON_CONFLICT_IGNORE = 4,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictIgnore
    |
    /**
     * Implements replace operation operator when conflict occurs.
     *
     * @relation ON_CONFLICT_REPLACE = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    OnConflictReplace
    | ...

    func getValue(): Int32 {
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

/**
 * Records information of the asset.
 *
 * @relation interface Asset
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public class Asset {
    /**
     * The name of asset.
     *
     * @relation name: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var name: String

    /**
     * The uri of asset.
     *
     * @relation uri: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var uri: String

    /**
     * The path of asset.
     *
     * @relation path: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var path: String

    /**
     * The create time of asset.
     *
     * @relation createTime: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var createTime: String

    /**
     * The modify time of asset.
     *
     * @relation modifyTime: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var modifyTime: String

    /**
     * The size of asset.
     *
     * @relation size: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var size: String

    /**
     * The status of asset.
     *
     * @relation status?: AssetStatus;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    public var status: AssetStatus

    /**
     * Asset constructor.
     * 
     */
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

/**
 * Indicates possible value types.
 *
 * @relation type ValueType = null | number | string | boolean | Uint8Array | Asset | Assets | Float32Array | bigint;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ValueType {
    /**
     * Indicates null.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Null
    |
    /**
     * Indicates Int64.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Integer(Int64)
    |
    /**
     * Indicates Float64.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Double(Float64)
    |
    /**
     * Indicates String.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    StringValue(String)
    |
    /**
     * Indicates Bool.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Boolean(Bool)
    |
    /**
     * Indicates Array<UInt8>.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Uint8Array(Array<UInt8>)
    |
    /**
     * Indicates Asset.
     * 
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    AssetEnum(Asset)
    |
    /**
     * Indicates Array<Asset>.
     * 
     */
    @!APILevel[
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

/**
 * Describes the distribution type of the tables.
 *
 * @relation enum DistributedType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum DistributedType {
    /**
     * Indicates the table is distributed among the devices.
     *
     * @relation DISTRIBUTED_DEVICE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DistributedDevice
    |
    /**
     * Indicates the table is distributed between the cloud and the devices.
     *
     * @relation DISTRIBUTED_CLOUD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    DistributedCloud
    | ...

    func getValue(): Int32 {
        match (this) {
            case DistributedDevice => 0
            case DistributedCloud => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Indicates the database synchronization mode.
 *
 * @relation enum SyncMode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SyncMode {
    /**
     * Indicates the data is pushed to remote device from local device.
     *
     * @relation SYNC_MODE_PUSH = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncModePush
    |
    /**
     * Indicates the data is pulled from remote device to local device.
     *
     * @relation SYNC_MODE_PULL = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncModePull
    |
    /**
     * Indicates the data is pulled from remote device to local device.
     *
     * @relation SYNC_MODE_TIME_FIRST,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SyncModeTimeFirst
    | 
    /**
     * Indicates force push the native data to the cloud.
     *
     * @relation SYNC_MODE_NATIVE_FIRST,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SyncModeNativeFirst
    |
    /**
     * Indicates the data is pulled from cloud to local device.
     *
     * @relation SYNC_MODE_CLOUD_FIRST
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SyncModeCloudFirst
    | ...

    func getValue(): Int32 {
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

/**
 * The cloud sync progress.
 *
 * @relation enum Progress
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Progress {
    /**
     * ISYNC_BEGIN: means the sync process begin.
     *
     * @relation SYNC_BEGIN,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncBegin
    |
    /**
     * SYNC_BEGIN: means the sync process is in progress.
     *
     * @relation SYNC_IN_PROGRESS,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncInProgress
    |
    /**
     * SYNC_BEGIN: means the sync process is finished.
     *
     * @relation SYNC_FINISH
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SyncInFinish
    | ...

    func getValue(): Int32 {
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

/**
 * Describes the status of {@code Progress}.
 *
 * @relation enum ProgressCode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum ProgressCode {
    /**
     * SUCCESS: means the status of progress is success.
     *
     * @relation SUCCESS,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Success
    |
    /**
     * UNKNOWN_ERROR: means the progress meets unknown error.
     *
     * @relation UNKNOWN_ERROR,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    UnknownError
    |
    /**
     * NETWORK_ERROR: means the progress meets network error.
     *
     * @relation NETWORK_ERROR,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NetworkError
    |
    /**
     * CLOUD_DISABLED: means cloud is disabled.
     *
     * @relation CLOUD_DISABLED,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    CloudDisabled
    |
    /**
     * LOCKED_BY_OTHERS: means the progress is locked by others.
     *
     * @relation LOCKED_BY_OTHERS,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    LockedByOthers
    |
    /**
     * RECORD_LIMIT_EXCEEDED: means the record exceeds the limit.
     *
     * @relation RECORD_LIMIT_EXCEEDED,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    RecordLimitExceeded
    |
    /**
     * NO_SPACE_FOR_ASSET: means the cloud has no space for the asset.
     *
     * @relation NO_SPACE_FOR_ASSET,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    NoSpaceForAsset
    | ...

    func getValue(): Int32 {
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

/**
 * Describes the subscription type.
 *
 * @relation enum SubscribeType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum SubscribeType {
    /**
     * Subscription to remote data changes.
     *
     * @relation SUBSCRIBE_TYPE_REMOTE = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    SubscribeTypeRemote
    |
    /**
     * Subscription to cloud data changes.
     *
     * @relation SUBSCRIBE_TYPE_CLOUD,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SubscribeTypeCloud
    |
    /**
     * Subscription to cloud data changes details.
     *
     * @relation SUBSCRIBE_TYPE_CLOUD_DETAILS,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.CloudSync.Client"
    ]
    SubscribeTypeCloudDetails
    | ...

    func getValue(): Int32 {
        match (this) {
            case SubscribeTypeRemote => 0
            case SubscribeTypeCloud => 1
            case SubscribeTypeCloudDetails => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Describes the data origin sources.
 *
 * @relation enum Origin
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
]
public enum Origin {
    /**
     * Indicates the data source is local.
     *
     * @relation LOCAL,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Local
    |
    /**
     * Indicates the data source is cloud.
     *
     * @relation CLOUD,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Cloud
    |
    /**
     * Indicates the data source is remote.
     *
     * @relation REMOTE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.RelationalStore.Core"
    ]
    Remote
    | ...

    func getValue(): Int32 {
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
