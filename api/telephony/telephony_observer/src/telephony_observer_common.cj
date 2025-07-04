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

package ohos.telephony_observer

import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.labels.*
import ohos.base.*
import ohos.telephony_call.*
import ohos.telephony_data.*
import ohos.telephony_radio.*
import ohos.telephony_sim.*

let TELEPHONY_OBSERVER_LOG = HilogChannel(0, 0xD001F07, "CJ-Telephony_Observer")

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class CallStateInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public CallStateInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let state: CallState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let number: String
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class DataConnectionStateInfo {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public DataConnectionStateInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let state: DataConnectState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let network: RadioTechnology
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public enum LockReason {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PUK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PN_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PN_PUK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PU_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PU_PUK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PP_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PP_PUK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PC_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_PC_PUK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_SIM_PIN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SIM_SIM_PUK
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SIM_NONE => 0
            case SIM_PIN => 1
            case SIM_PUK => 2
            case SIM_PN_PIN => 3
            case SIM_PN_PUK => 4
            case SIM_PU_PIN => 5
            case SIM_PU_PUK => 6
            case SIM_PP_PIN => 7
            case SIM_PP_PUK => 8
            case SIM_PC_PIN => 9
            case SIM_PC_PUK => 10
            case SIM_SIM_PIN => 11
            case SIM_SIM_PUK => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): LockReason {
        match (value) {
            case 0 => SIM_NONE
            case 1 => SIM_PIN
            case 2 => SIM_PUK
            case 3 => SIM_PN_PIN
            case 4 => SIM_PN_PUK
            case 5 => SIM_PU_PIN
            case 6 => SIM_PU_PUK
            case 7 => SIM_PP_PIN
            case 8 => SIM_PP_PUK
            case 9 => SIM_PC_PIN
            case 10 => SIM_PC_PUK
            case 11 => SIM_SIM_PIN
            case 12 => SIM_SIM_PUK
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class SimStateData {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public SimStateData(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let cardType: CardType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let state: SimState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Telephony.StateRegistry"
        ]
        public let reason: LockReason
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public enum ObserverEventType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    NetworkStateChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SignalInfoChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    CallStateChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    CellularDataConnectionStateChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    CellularDataFlowChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    SimStateChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    IccAccountInfoChange
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public func toString(): String {
        match (this) {
            case NetworkStateChange => "NetworkStateChange"
            case SignalInfoChange => "SignalInfoChange"
            case CallStateChange => "CallStateChange"
            case CellularDataConnectionStateChange => "CellularDataConnectionStateChange"
            case CellularDataFlowChange => "CellularDataFlowChange"
            case SimStateChange => "SimStateChange"
            case IccAccountInfoChange => "IccAccountInfoChange"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Telephony.StateRegistry"
]
public class ObserverOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Telephony.StateRegistry"
    ]
    public ObserverOptions(public var slotId!: Int32 = 0) {}

    func toCObserverOptions(): CObserverOptions {
        CObserverOptions(this.slotId)
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_OBSERVER_LOG.info("${className}: ${funcName} failed: ${code}: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
