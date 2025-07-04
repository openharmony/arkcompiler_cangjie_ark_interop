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

package ohos.telephony_data

import ohos.ffi.*
import ohos.base.*
import ohos.hilog.*
import ohos.labels.*
import ohos.telephony_call.*

let TELEPHONY_DATA_LOG = HilogChannel(0, 0xD001F03, "CJ-Telephony_Data")

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CellularData"
]
public enum DataFlowType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_FLOW_TYPE_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_FLOW_TYPE_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_FLOW_TYPE_UP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_FLOW_TYPE_UP_DOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_FLOW_TYPE_DORMANT
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DATA_FLOW_TYPE_NONE => 0
            case DATA_FLOW_TYPE_DOWN => 1
            case DATA_FLOW_TYPE_UP => 2
            case DATA_FLOW_TYPE_UP_DOWN => 3
            case DATA_FLOW_TYPE_DORMANT => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(val: Int32): DataFlowType {
        match (val) {
            case 0 => DATA_FLOW_TYPE_NONE
            case 1 => DATA_FLOW_TYPE_DOWN
            case 2 => DATA_FLOW_TYPE_UP
            case 3 => DATA_FLOW_TYPE_UP_DOWN
            case 4 => DATA_FLOW_TYPE_DORMANT
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CellularData"
]
public enum DataConnectState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_STATE_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_STATE_DISCONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_STATE_CONNECTING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_STATE_CONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    DATA_STATE_SUSPENDED
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CellularData"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DATA_STATE_UNKNOWN => -1
            case DATA_STATE_DISCONNECTED => 0
            case DATA_STATE_CONNECTING => 1
            case DATA_STATE_CONNECTED => 2
            case DATA_STATE_SUSPENDED => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(val: Int32): DataConnectState {
        match (val) {
            case -1 => DATA_STATE_UNKNOWN
            case 0 => DATA_STATE_DISCONNECTED
            case 1 => DATA_STATE_CONNECTING
            case 2 => DATA_STATE_CONNECTED
            case 3 => DATA_STATE_SUSPENDED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_DATA_LOG.info("${className}: ${funcName} failed: ${code}: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
