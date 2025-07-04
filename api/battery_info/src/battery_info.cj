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
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public class BatteryInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop batterySOC: Int32 {
        get() {
            unsafe { FfiBatteryInfoBatterySOC() }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
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
        19,
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
        19,
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
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop voltage: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetVoltage() }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop nowCurrent: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetBatteryNowCurrent() }
        }
    }

    @!APILevel[
        19,
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
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop batteryTemperature: Int32 {
        get() {
            unsafe { FfiBatteryInfoGetBatteryTemperature() }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    public static prop isBatteryPresent: Bool {
        get() {
            unsafe { FfiBatteryInfoGetBatteryPresent() }
        }
    }

    @!APILevel[
        19,
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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryPluggedType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    AC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    USB
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    WIRELESS
    | ...

    static func parse(value: Int32): BatteryPluggedType {
        match (value) {
            case 0 => NONE
            case 1 => AC
            case 2 => USB
            case 3 => WIRELESS
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryChargeState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ENABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    DISABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    FULL
    | ...

    static func parse(value: Int32): BatteryChargeState {
        match (value) {
            case 0 => NONE
            case 1 => ENABLE
            case 2 => DISABLE
            case 3 => FULL
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryHealthState {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    UNKNOWN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    GOOD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    OVERHEAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    OVERVOLTAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    COLD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    DEAD
    | ...

    static func parse(value: Int32): BatteryHealthState {
        match (value) {
            case 0 => UNKNOWN
            case 1 => GOOD
            case 2 => OVERHEAT
            case 3 => OVERVOLTAGE
            case 4 => COLD
            case 5 => DEAD
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryCapacityLevel {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_FULL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_HIGH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_NORMAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_LOW
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_WARNING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_CRITICAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LEVEL_SHUTDOWN
    | ...

    static func parse(value: Int32): BatteryCapacityLevel {
        match (value) {
            case 1 => LEVEL_FULL
            case 2 => LEVEL_HIGH
            case 3 => LEVEL_NORMAL
            case 4 => LEVEL_LOW
            case 5 => LEVEL_WARNING
            case 6 => LEVEL_CRITICAL
            case 7 => LEVEL_SHUTDOWN
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum CommonEventBatteryChangedKey {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_SOC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_CHARGE_STATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_HEALTH_STATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_PLUGGED_TYPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_VOLTAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_TECHNOLOGY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_TEMPERATURE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_PRESENT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    EXTRA_CAPACITY_LEVEL
    | ...
}
