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

package ohos.data.distributed_kv_store

import ohos.labels.*
import ohos.base.*

import std.collection.*

/**
 * Max key length is 1024.
 *
 * @relation readonly MAX_KEY_LENGTH: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_KEY_LENGTH: Int64 = 1024

/**
 * Max value length is 4194303.
 *
 * @relation readonly MAX_VALUE_LENGTH: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_VALUE_LENGTH: Int64 = 4194303

/**
 * Max device coordinate key length is 896.
 *
 * @relation readonly MAX_KEY_LENGTH_DEVICE: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_KEY_LENGTH_DEVICE: Int64 = 896


/**
 * Max store id length is 128.
 *
 * @relation readonly MAX_STORE_ID_LENGTH: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_STORE_ID_LENGTH: Int64 = 128

/**
 * Max query length is 512000.
 *
 * @relation readonly MAX_QUERY_LENGTH: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_QUERY_LENGTH: Int64 = 512000


/**
 * Max batch operation size is 128.
 *
 * @relation readonly MAX_BATCH_SIZE: number;
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public const MAX_BATCH_SIZE: Int64 = 128


/**
 * Indicates the {@code ValueType}.
 *
 * @relation enum ValueType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public enum ValueType <: ToString {
    /**
     * Indicates that the value type is string.
     *
     * @relation STRING,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    StringValue(String)
    |
    /**
     * Indicates that the value type is int.
     *
     * @relation INTEGER,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    Integer(Int32)
    |
    /**
     * Indicates that the value type is float.
     *
     * @relation FLOAT,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    Float(Float32)
    |
    /**
     * Indicates that the value type is byte array.
     *
     * @relation BYTE_ARRAY,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    ByteArray(Array<Byte>)
    |
    /**
     * Indicates that the value type is boolean.
     *
     * @relation BOOLEAN,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    Boolean(Bool)
    |
    /**
     * Indicates that the value type is double.
     *
     * @relation DOUBLE
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    Double(Float64)
    | ...

    /**
     * Return a string of enumeration values.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func toString(): String {
        return match (this) {
            case StringValue(v) => v
            case Integer(v) => v.toString()
            case Float(v) => v.toString()
            case ByteArray(v) => v.toString()
            case Boolean(v) => v.toString()
            case Double(v) => v.toString()
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Provides configuration information to create a {@link KVManager} instance,
 * which includes the caller's package name and ability or hap context.
 *
 * @relation interface KVManagerConfig
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class KVManagerConfig {
    public var context: StageContext
    public var bundleName: String

    /**
     * KVManagerConfig constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public init(context: StageContext, bundleName: String) {
        this.context = context
        this.bundleName = bundleName
    }
}

enum KVStoreType {
    | DEVICE_COLLABORATION
    | SINGLE_VERSION

    func getValue(): Int32 {
        match (this) {
            case DEVICE_COLLABORATION => 0
            case SINGLE_VERSION => 1
        }
    }
}

/**
 * Describes the KVStore security level.
 *
 * @relation enum SecurityLevel
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public enum SecurityLevel {
    /**
     * S1: means the db is in the low security level
     * There are some low impact when the data is leaked.
     *
     * @relation S1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S1
    |
    /**
     * S2: means the db is in the middle security level
     * There are some major impact when the data is leaked.
     *
     * @relation S2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S2
    |
    /**
     * S3: means the db is in the high security level
     * There are some severity impact when the data is leaked.
     *
     * @relation S3,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S3
    |
    /**
     * S4: means the db is in the critical security level
     * There are some critical impact when the data is leaked.
     *
     * @relation S4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S4
    | ...

    static func parse(securityLevel: Int32): SecurityLevel {
        match (securityLevel) {
            case 2 => S1
            case 3 => S2
            case 5 => S3
            case 6 => S4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case S1 => 2
            case S2 => 3
            case S3 => 5
            case S4 => 6
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}


/**
 * Represents a node of a {@link Schema} instance.
 * <p>With a {@link Schema} instance, you can define the value fields which stored in the database.
 * <p>A FieldNode of the {@link Schema} instance is either a leaf or a non-leaf node.
 * <p>The leaf node must have a value; the non-leaf node must have a child {@code FieldNode}.
 *
 * @relation class FieldNode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class FieldNode {
    /**
     * Indicates the nullable of database field.
     *
     * @relation nullable: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var nullable: Bool = true

    /**
     * Indicates the default value of field node.
     *
     * @relation default: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var default: String

    /**
     * Indicates the type of value.
     *
     * @relation type: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var type_: Int32 = 0

    /**
     * FieldNode constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public init(name: String) {
        this.default = name
    }
}

/**
 * Represents the database schema.
 * You can set the schema object in options when create or open the database.
 *
 * @relation class Schema
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class Schema {
    /**
     * Indicates the root json object.
     *
     * @relation root: FieldNode;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var root: FieldNode = FieldNode("undefined")

    /**
     * Indicates the string array of json.
     *
     * @relation indexes: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var indexes: Array<String> = []

    /**
     * Indicates the mode of schema.
     *
     * @relation mode: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var mode: Int32 = 0

    /**
     * Indicates the skip size of schema.
     *
     * @relation skip: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var skip: Int32 = 0

    /**
     * Schema constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public init() {}
}

/**
 * Provides configuration options to create a {@code SingleKVStore} or {@code DeviceKVStore}.
 *
 * @relation interface Options
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class Options {
    public var createIfMissing: Bool
    public var encrypt: Bool
    public var backup: Bool
    public var autoSync: Bool
    public var securityLevel: SecurityLevel
    public var schema: Schema

    /**
     * Options constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public init(securityLevel: SecurityLevel, createIfMissing!: Bool = true, encrypt!: Bool = false,
        backup!: Bool = true, autoSync!: Bool = false, schema!: Schema = Schema()) {
        this.createIfMissing = createIfMissing
        this.encrypt = encrypt
        this.backup = backup
        this.autoSync = autoSync
        this.securityLevel = securityLevel
        this.schema = schema
    }
}

/**
 * Provides key-value pairs stored in the distributedKVStore.
 *
 * @relation interface Entry
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class Entry <: ToString {
    /**
     * Indicates the key.
     *
     * @relation key: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public var key: String

    /**
     * Indicates the value.
     *
     * @relation value: Value;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public var value: ValueType

    /**
     * Entry constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public init(key: String, value: ValueType) {
        this.key = key
        this.value = value
    }

    /**
     * Return a string of enumeration values.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func toString(): String {
        return "{key = ${key}, value = ${value}}"
    }
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (15100001, "Over max limits."),
        (15100002, "Open existed database with changed options."),
        (15100003, "Database corrupted."),
        (15100004, "Not found."),
        (15100005, "Database or result set already closed.")
    ]
)

func getErrorCode(code: Int32): Int32 {
    if (code == -1) {
        15100003
    } else {
        code
    }
}

func getErrorMsg(code: Int32): String {
    let errCode = getErrorCode(code)
    if (let Some(v) <- getUniversalErrorMsg(errCode)) {
        return v
    } else if (ERROR_CODE_MAP.contains(errCode)) {
        return ERROR_CODE_MAP[errCode]
    } else {
        return "Unknown error code ${errCode}"
    }
}
