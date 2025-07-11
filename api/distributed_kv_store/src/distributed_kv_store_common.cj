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

import std.collection.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_KEY_LENGTH: Int64 = 1024

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_VALUE_LENGTH: Int64 = 4194303

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_KEY_LENGTH_DEVICE: Int64 = 896

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_STORE_ID_LENGTH: Int64 = 128

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_QUERY_LENGTH: Int64 = 512000

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public let MAX_BATCH_SIZE: Int64 = 128

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public enum ValueType <: ToString {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    STRING(String)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    INTEGER(Int32)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    FLOAT(Float32)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    BYTE_ARRAY(Array<Byte>)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    BOOLEAN(Bool)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    DOUBLE(Float64)
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public func toString(): String {
        return match (this) {
            case STRING(v) => v
            case INTEGER(v) => v.toString()
            case FLOAT(v) => v.toString()
            case BYTE_ARRAY(v) => v.toString()
            case BOOLEAN(v) => v.toString()
            case DOUBLE(v) => v.toString()
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class KVManagerConfig {
    let context: StageContext
    let bundleName: String

    @!APILevel[
        12,
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public enum SecurityLevel {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S1
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S2
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    S3
    | @!APILevel[
        12,
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

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class FieldNode {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var nullable: Bool = true
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var default: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var type_: Int32 = 0
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public init(name: String) {
        this.default = name
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
]
public class Schema {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var root: FieldNode = FieldNode("undefined")
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var indexes: Array<String> = []
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var mode: Int32 = 0
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.DistributedKVStore"
    ]
    public var skip: Int32 = 0
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class Options {
    let createIfMissing: Bool
    let encrypt: Bool
    let backup: Bool
    let autoSync: Bool
    let securityLevel: SecurityLevel
    let schema: Schema
    @!APILevel[
        12,
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
]
public class Entry <: ToString {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public var key: String
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public var value: ValueType
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.KVStore.Core"
    ]
    public init(key: String, value: ValueType) {
        this.key = key
        this.value = value
    }
    @!APILevel[
        19,
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
