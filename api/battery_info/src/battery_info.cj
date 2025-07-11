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

package ohos.battery_info

import std.deriving.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public class BatteryInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop batterySOC: Int32 {
        get() {
            unsafe { FfiBatteryInfoBatterySOC() }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop chargingStatus: BatteryChargeState {
        get() {
            let cStatus = unsafe { FfiBatteryInfoGetChargingState() }
            BatteryChargeState.parse(cStatus)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop healthStatus: BatteryHealthState {
        get() {
            let cStatus = unsafe { FfiBatteryInfoGetHealthState() }
            BatteryHealthState.parse(cStatus)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop pluggedType: BatteryPluggedType {
        get() {
            let cPlugged = unsafe { FfiBatteryInfoGetPluggedType() }
            BatteryPluggedType.parse(cPlugged)
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop voltage: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetVoltage() }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop nowCurrent: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetBatteryNowCurrent() }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop technology: String {
        get() {
            let cStr = unsafe { FfiBatteryInfoGetTechnology() }
            let str = cStr.toString()
            unsafe { LibC.free(cStr) }
            str
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop batteryTemperature: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetBatteryTemperature() }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop isBatteryPresent: Bool {
        get() {
            unsafe { FfiBatteryInfoGetBatteryPresent() }
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop batteryCapacityLevel: BatteryCapacityLevel {
        get() {
            let level = unsafe { FfiBatteryInfoGetCapacityLevel() }
            BatteryCapacityLevel.parse(level)
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryPluggedType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    None
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    AC
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    USB
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Wireless
    | ...

    static func parse(value: Int32): BatteryPluggedType {
        match (value) {
            case 0 => None
            case 1 => AC
            case 2 => USB
            case 3 => Wireless
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryChargeState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    None
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Enable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Disable
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Full
    | ...

    static func parse(value: Int32): BatteryChargeState {
        match (value) {
            case 0 => None
            case 1 => Enable
            case 2 => Disable
            case 3 => Full
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryHealthState {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Unknown
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Good
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Overheat
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Overvoltage
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    cold
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Dead
    | ...

    static func parse(value: Int32): BatteryHealthState {
        match (value) {
            case 0 => Unknown
            case 1 => Good
            case 2 => Overheat
            case 3 => Overvoltage
            case 4 => cold
            case 5 => Dead
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryCapacityLevel {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelFull
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelHigh
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelNormal
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelLow
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelWarning
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelCritical
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelShutdown
    | ...

    static func parse(value: Int32): BatteryCapacityLevel {
        match (value) {
            case 1 => LevelFull
            case 2 => LevelHigh
            case 3 => LevelNormal
            case 4 => LevelLow
            case 5 => LevelWarning
            case 6 => LevelCritical
            case 7 => LevelShutdown
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum CommonEventBatteryChangedKey {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraSoc
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraChargeState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraHealthState
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraPluggedType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraVoltage
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraTechnology
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraTemperature
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraPresent
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraCapacityLevel
    | ...
}
