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

package ohos.telephony_sim

import ohos.ffi.*
import ohos.hilog.*
import std.collection.*
import ohos.labels.*
import ohos.base.*
import ohos.telephony_call.*

let TELEPHONY_SIM_LOG = HilogChannel(0, 0xD001F04, "CJ-Telephony_Sim")

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.TelephonyCoreService"
]
public enum CardType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    UNKNOWN_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SINGLE_MODE_SIM_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SINGLE_MODE_USIM_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SINGLE_MODE_RUIM_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    DUAL_MODE_CG_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    CT_NATIONAL_ROAMING_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    CU_DUAL_MODE_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    DUAL_MODE_TELECOM_LTE_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    DUAL_MODE_UG_CARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SINGLE_MODE_ISIM_CARD
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case UNKNOWN_CARD => -1
            case SINGLE_MODE_SIM_CARD => 10
            case SINGLE_MODE_USIM_CARD => 20
            case SINGLE_MODE_RUIM_CARD => 30
            case DUAL_MODE_CG_CARD => 40
            case CT_NATIONAL_ROAMING_CARD => 41
            case CU_DUAL_MODE_CARD => 42
            case DUAL_MODE_TELECOM_LTE_CARD => 43
            case DUAL_MODE_UG_CARD => 50
            case SINGLE_MODE_ISIM_CARD => 60
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): CardType {
        match (value) {
            case -1 => UNKNOWN_CARD
            case 10 => SINGLE_MODE_SIM_CARD
            case 20 => SINGLE_MODE_USIM_CARD
            case 30 => SINGLE_MODE_RUIM_CARD
            case 40 => DUAL_MODE_CG_CARD
            case 41 => CT_NATIONAL_ROAMING_CARD
            case 42 => CU_DUAL_MODE_CARD
            case 43 => DUAL_MODE_TELECOM_LTE_CARD
            case 50 => DUAL_MODE_UG_CARD
            case 60 => SINGLE_MODE_ISIM_CARD
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.TelephonyCoreService"
]
public enum SimState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_NOT_PRESENT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_LOCKED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_NOT_READY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_READY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    SIM_STATE_LOADED
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.TelephonyCoreService"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SIM_STATE_UNKNOWN => 0
            case SIM_STATE_NOT_PRESENT => 1
            case SIM_STATE_LOCKED => 2
            case SIM_STATE_NOT_READY => 3
            case SIM_STATE_READY => 4
            case SIM_STATE_LOADED => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(value: Int32): SimState {
        match (value) {
            case 1 => SIM_STATE_NOT_PRESENT
            case 2 => SIM_STATE_LOCKED
            case 3 => SIM_STATE_NOT_READY
            case 4 => SIM_STATE_READY
            case 5 => SIM_STATE_LOADED
            case _ => SIM_STATE_UNKNOWN
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.TelephonyCoreService"
]
public class IccAccountInfo {
    protected IccAccountInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let simId: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let slotIndex: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let isEsim: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let isActive: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let iccId: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let showName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.TelephonyCoreService"
        ]
        public let showNumber: String
    ) {}
}

func throwIfNotSuccess(code: Int32, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        TELEPHONY_SIM_LOG.error("${funcName} failed: ${getErrorMsg(code)}")
        throw BusinessException(code, getErrorMsg(code))
    }
}
