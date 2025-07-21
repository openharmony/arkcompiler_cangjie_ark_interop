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

package ohos.telephony.call

import ohos.hilog.*
import ohos.labels.*
import ohos.base.*

import std.collection.*
import std.deriving.Derive

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

/**
 * Indicates the option for determining if a number is an emergency number for specified slot.
 *
 * @relation export interface EmergencyNumberOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class EmergencyNumberOptions {
    /**
     * Indicates the card slot index number, ranging from 0 to the
     * maximum card slot index number supported by the device.
     *
     * @relation slotId?: number
     */    
    public var slotId: Int32

    /**
     * EmergencyNumberOptions constructor.
     *
     */     
    public init(slotId: Int32) {
        this.slotId = slotId
    }
}

/**
 * Indicates the states of call.
 *
 * @relation export enum CallState
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public enum CallState {
    /**
     * Indicates an invalid state, which is used when the call state fails to be obtained.
     *
     * @relation CALL_STATE_UNKNOWN = -1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CallStateUnknown
    |
    /**
     * Indicates that there is no ongoing call.
     *
     * @relation CALL_STATE_IDLE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CallStateIdle
    |
    /**
     * Indicates that an incoming call is ringing or waiting.
     *
     * @relation CALL_STATE_RINGING = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CallStateRinging
    |
    /**
     * Indicates that a least one call is in the dialing, active, or hold state, and there is no new
     * incoming call ringing or waiting.
     *
     * @relation CALL_STATE_OFFHOOK = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CallStateOffhook
    |
    /**
     * Indicates that call is answered
     *
     * @relation CALL_STATE_ANSWERED = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    CallStateAnswered
    | ...

    protected static func parse(val: Int32): CallState {
        match (val) {
            case -1 => CallStateUnknown
            case 0 => CallStateIdle
            case 1 => CallStateRinging
            case 2 => CallStateOffhook
            case 3 => CallStateAnswered
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Indicates the option for number formatting.
 *
 * @relation export interface NumberFormatOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CallManager"
]
public class NumberFormatOptions {
    /**
     * Indicates the country code.
     *
     * @relation countryCode?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public let countryCode: String

    /**
     * NumberFormatOptions constructor
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CallManager"
    ]
    public init(countryCode!: String = "CN") {
        this.countryCode = countryCode
    }
}
