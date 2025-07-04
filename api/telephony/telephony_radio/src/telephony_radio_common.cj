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

package ohos.telephony_radio

import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.labels.*
import ohos.base.*
import ohos.telephony_call.*

let TELEPHONY_RADIO_LOG = HilogChannel(0, 0xD001F04, "CJ-Telephony_Radio")

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RegState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    REG_STATE_NO_SERVICE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    REG_STATE_IN_SERVICE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    REG_STATE_EMERGENCY_CALL_ONLY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    REG_STATE_POWER_OFF
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case REG_STATE_NO_SERVICE => 0
            case REG_STATE_IN_SERVICE => 1
            case REG_STATE_EMERGENCY_CALL_ONLY => 2
            case REG_STATE_POWER_OFF => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): RegState {
        match (value) {
            case 0 => REG_STATE_NO_SERVICE
            case 1 => REG_STATE_IN_SERVICE
            case 2 => REG_STATE_EMERGENCY_CALL_ONLY
            case 3 => REG_STATE_POWER_OFF
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NsaState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_NOT_SUPPORT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_NO_DETECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_CONNECTED_DETECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_IDLE_DETECT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_DUAL_CONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NSA_STATE_SA_ATTACHED
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NSA_STATE_NOT_SUPPORT => 1
            case NSA_STATE_NO_DETECT => 2
            case NSA_STATE_CONNECTED_DETECT => 3
            case NSA_STATE_IDLE_DETECT => 4
            case NSA_STATE_DUAL_CONNECTED => 5
            case NSA_STATE_SA_ATTACHED => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): NsaState {
        match (value) {
            case 1 => NSA_STATE_NOT_SUPPORT
            case 2 => NSA_STATE_NO_DETECT
            case 3 => NSA_STATE_CONNECTED_DETECT
            case 4 => NSA_STATE_IDLE_DETECT
            case 5 => NSA_STATE_DUAL_CONNECTED
            case 6 => NSA_STATE_SA_ATTACHED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum RadioTechnology {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_GSM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_1XRTT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_WCDMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_HSPA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_HSPAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_TD_SCDMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_EVDO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_EHRPD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_LTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_LTE_CA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_IWLAN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    RADIO_TECHNOLOGY_NR
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case RADIO_TECHNOLOGY_UNKNOWN => 0
            case RADIO_TECHNOLOGY_GSM => 1
            case RADIO_TECHNOLOGY_1XRTT => 2
            case RADIO_TECHNOLOGY_WCDMA => 3
            case RADIO_TECHNOLOGY_HSPA => 4
            case RADIO_TECHNOLOGY_HSPAP => 5
            case RADIO_TECHNOLOGY_TD_SCDMA => 6
            case RADIO_TECHNOLOGY_EVDO => 7
            case RADIO_TECHNOLOGY_EHRPD => 8
            case RADIO_TECHNOLOGY_LTE => 9
            case RADIO_TECHNOLOGY_LTE_CA => 10
            case RADIO_TECHNOLOGY_IWLAN => 11
            case RADIO_TECHNOLOGY_NR => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): RadioTechnology {
        match (value) {
            case 0 => RADIO_TECHNOLOGY_UNKNOWN
            case 1 => RADIO_TECHNOLOGY_GSM
            case 2 => RADIO_TECHNOLOGY_1XRTT
            case 3 => RADIO_TECHNOLOGY_WCDMA
            case 4 => RADIO_TECHNOLOGY_HSPA
            case 5 => RADIO_TECHNOLOGY_HSPAP
            case 6 => RADIO_TECHNOLOGY_TD_SCDMA
            case 7 => RADIO_TECHNOLOGY_EVDO
            case 8 => RADIO_TECHNOLOGY_EHRPD
            case 9 => RADIO_TECHNOLOGY_LTE
            case 10 => RADIO_TECHNOLOGY_LTE_CA
            case 11 => RADIO_TECHNOLOGY_IWLAN
            case 12 => RADIO_TECHNOLOGY_NR
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NetworkType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_GSM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_CDMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_WCDMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_TDSCDMA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_LTE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_TYPE_NR
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NETWORK_TYPE_UNKNOWN => 0
            case NETWORK_TYPE_GSM => 1
            case NETWORK_TYPE_CDMA => 2
            case NETWORK_TYPE_WCDMA => 3
            case NETWORK_TYPE_TDSCDMA => 4
            case NETWORK_TYPE_LTE => 5
            case NETWORK_TYPE_NR => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): NetworkType {
        match (value) {
            case 0 => NETWORK_TYPE_UNKNOWN
            case 1 => NETWORK_TYPE_GSM
            case 2 => NETWORK_TYPE_CDMA
            case 3 => NETWORK_TYPE_WCDMA
            case 4 => NETWORK_TYPE_TDSCDMA
            case 5 => NETWORK_TYPE_LTE
            case 6 => NETWORK_TYPE_NR
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public class NetworkState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public NetworkState(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let longOperatorName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let shortOperatorName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let plmnNumeric: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let isRoaming: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let regState: RegState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let cfgTech: RadioTechnology,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let nsaState: NsaState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let isCaActive: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let isEmergency: Bool
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public class SignalInformation {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public SignalInformation(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let signalType: NetworkType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let signalLevel: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let dBm: Int32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public class NetworkRadioTech {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public NetworkRadioTech(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let psRadioTech: RadioTechnology,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.CoreService"
        ]
        public let csRadioTech: RadioTechnology
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.CoreService"
]
public enum NetworkSelectionMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_SELECTION_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_SELECTION_AUTOMATIC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    NETWORK_SELECTION_MANUAL
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.CoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case NETWORK_SELECTION_UNKNOWN => 0
            case NETWORK_SELECTION_AUTOMATIC => 1
            case NETWORK_SELECTION_MANUAL => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): NetworkSelectionMode {
        match (value) {
            case 0 => NETWORK_SELECTION_UNKNOWN
            case 1 => NETWORK_SELECTION_AUTOMATIC
            case 2 => NETWORK_SELECTION_MANUAL
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_RADIO_LOG.error("${funcName} failed: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
