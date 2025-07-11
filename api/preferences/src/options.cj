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

package ohos.preferences

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
]
public enum ValueType {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    integer(Int64)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    double(Float64)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    string(String)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    bool(Bool)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    boolArray(Array<Bool>)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    doubleArray(Array<Float64>)
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    stringArray(Array<String>)
    | ...
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
]
public let MAX_KEY_LENGTH: Int64 = 1024

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
]
public let MAX_VALUE_LENGTH: Int64 = 16 * 1024 * 1024

let MESSAGE_TPYE_ERROR = "The type should be change or multiProcessChange."

// The error code for common exceptions.
const ERROR_BASE = 27656192i32
const E_INNER_ERROR = 15500000i32
const E_DATA_GROUP_ID_INVALID = 15501002i32
const E_GET_DATAOBSMGRCLIENT_FAIL = 15500019i32
const E_DELETE_FILE_FAIL = 15500010i32
let NATIVE_ERROR_MSG = HashMap<Int32, String>(
    [
        (ERROR_BASE + 5, "The key is empty."),
        (ERROR_BASE + 6, "The key string length exceeds the max length (1024)."),
        (ERROR_BASE + 10, "Delete a file fails."),
        (ERROR_BASE + 11, "The file name is empty."),
        (ERROR_BASE + 13, "The file path exceeds the max length."),
        (ERROR_BASE + 14, "Value exceeds the max length (16 * 1024 * 1024)."),
        (ERROR_BASE + 19, "Failed to get DataObsMgrClient."),
        (ERROR_BASE + 801, "The capability not supported."),
        (E_DATA_GROUP_ID_INVALID, "The data group id is not valid.")
    ]
)
let CJ_ERROR_MSG = HashMap<Int32, String>(
    [
        (E_INNER_ERROR, "Inner error."),
        (E_DELETE_FILE_FAIL, "Failed to delete preferences file."),
        (E_GET_DATAOBSMGRCLIENT_FAIL, "Failed to obtain subscription service."),
        (E_DATA_GROUP_ID_INVALID, "The data group id is not valid.")
    ]
)
let NATIVE_ERR_TO_CJ_ERR_MAP = HashMap<Int32, Int32>(
    [
        (ERROR_BASE + 5, ERR_PARAMETER_ERROR),
        (ERROR_BASE + 6, ERR_PARAMETER_ERROR),
        (ERROR_BASE + 10, E_DELETE_FILE_FAIL),
        (ERROR_BASE + 11, E_INNER_ERROR),
        (ERROR_BASE + 13, E_INNER_ERROR),
        (ERROR_BASE + 14, ERR_PARAMETER_ERROR),
        (ERROR_BASE + 19, E_GET_DATAOBSMGRCLIENT_FAIL),
        (ERROR_BASE + 801, ERR_NOT_SUPPOERTED),
        (E_DATA_GROUP_ID_INVALID, E_DATA_GROUP_ID_INVALID)
    ]
)

func getNativeErrorMsg(code: Int32): String {
    match (NATIVE_ERROR_MSG.get(code)) {
        case Some(v) => v
        case None => String.empty
    }
}

func getCJErrorMsg(code: Int32): String {
    let realCode = getCJErrorCode(code)
    if (let Some(v) <- getUniversalErrorMsg(realCode)) {
        return v
    } else if (CJ_ERROR_MSG.contains(realCode)) {
        return CJ_ERROR_MSG[realCode]
    } else {
        return "Inner error."
    }
}

func getCJErrorCode(code: Int32): Int32 {
    match (NATIVE_ERR_TO_CJ_ERR_MAP.get(code)) {
        case Some(v) => v
        case None => code
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
]
public class Options {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public let name: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public let dataGroupId: String

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public init(name: String) {
        this.name = name
        this.dataGroupId = String.empty
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.DistributedDataManager.Preferences.Core"
    ]
    public init(name: String, dataGroupId: String) {
        this.name = name
        this.dataGroupId = dataGroupId
    }
}
