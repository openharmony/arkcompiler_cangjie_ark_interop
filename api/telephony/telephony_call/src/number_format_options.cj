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

package ohos.telephony_call

import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.labels.*
import ohos.base.*

let TELEPHONY_CALL_LOG = HilogChannel(0, 0xD002B25, "CJ-Telephony_Call")
const ERROR_CELLUAR_DATA_SERVICE_UNAVAILABLE: Int32 = -2
protected let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (8300001, "Invalid parameter value."),
        (8300002, "Operation failed. Cannot connect to service."),
        (8300003, "System internal error."),
        (8300004, "Do not have sim card."),
        (8300005, "Airplane mode is on."),
        (8300006, "Network not in service."),
        (8300999, "Unknown error code."),
        (8301001, "SIM card is not activated."),
        (8301002, "SIM card operation error."),
        (8301003, "Operator config error."),
        (8401001, "UT is not connected.")
    ]
)

func getErrorCode(code: Int32): Int32 {
    if (code == ERROR_CELLUAR_DATA_SERVICE_UNAVAILABLE) {
        8300003
    } else {
        code
    }
}

protected func getErrorMsg(code: Int32): String {
    let errCode = getErrorCode(code)
    if (let Some(v) <- getUniversalErrorMsg(errCode)) {
        return v
    } else if (ERROR_CODE_MAP.contains(errCode)) {
        return ERROR_CODE_MAP[errCode]
    } else {
        return "Unknown error code: ${errCode}"
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public enum EmergencyNumberOptions {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    SLOT_ID_ONE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    SLOT_ID_TWO
    | ...

    func getValue(): Int32 {
        match (this) {
            case SLOT_ID_ONE => 0
            case SLOT_ID_TWO => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public enum CallState {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CALL_STATE_UNKNOWN
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CALL_STATE_IDLE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CALL_STATE_RINGING
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CALL_STATE_OFFHOOK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CALL_STATE_ANSWERED
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case CALL_STATE_UNKNOWN => -1
            case CALL_STATE_IDLE => 0
            case CALL_STATE_RINGING => 1
            case CALL_STATE_OFFHOOK => 2
            case CALL_STATE_ANSWERED => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(val: Int32): CallState {
        match (val) {
            case -1 => CALL_STATE_UNKNOWN
            case 0 => CALL_STATE_IDLE
            case 1 => CALL_STATE_RINGING
            case 2 => CALL_STATE_OFFHOOK
            case 3 => CALL_STATE_ANSWERED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class NumberFormatOptions {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public let countryCode: String

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public init(countryCode: String) {
        this.countryCode = countryCode
    }
}
