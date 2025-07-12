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

/**
 * Obtains battery information of a device.
 * Battery information includes the remaining battery power,
 * voltage, temperature, model, and charger type.
 *
 * @relation declare namespace batteryInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public class BatteryInfo {
    /**
     * Battery state of charge (SoC) of the current device, in percent.
     *
     * @relation const batterySOC: number;
     */
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

    /**
     * Battery charging status of the current device.
     *
     * @relation const chargingStatus: BatteryChargeState;
     */
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

    /**
     * Battery health state of the current device.
     *
     * @relation const healthStatus: BatteryHealthState;
     */
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

    /**
     * Charger type of the current device.
     *
     * @relation const pluggedType: BatteryPluggedType;
     */
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

    /**
     * Battery voltage of the current device, in µV.
     *
     * @relation const voltage: number;
     */
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

    /**
     * Battery immediate current of the current device, in mA.
     *
     * @relation const nowCurrent: number;
     */
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

    /**
     * Battery total energy of the current device, in mAh.
     *
     * @relation const totalEnergy: number;
     */
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

    /**
     * Battery temperature of the current device, in 0.1℃.
     *
     * @relation const batteryTemperature: number;
     */
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

    /**
     * Battery present state of the current device.
     *
     * @relation const isBatteryPresent: boolean;
     */
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

    /**
     * Battery capacity level of the current device.
     *
     * @relation const batteryCapacityLevel: BatteryCapacityLevel;
     */
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

/**
 * Charger type of a device.
 *
 * @relation export enum BatteryPluggedType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryPluggedType {
    /**
     * Unknown type
     *
     * @relation NONE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    None
    /**
     * AC charger
     *
     * @relation AC,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    AC
    /**
     * USB charger
     *
     * @relation USB,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    USB
    /**
     * Wireless charger
     *
     * @relation WIRELESS
     */
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

/**
 * Battery charging status of a device.
 *
 * @relation export enum BatteryChargeState
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryChargeState {
    /**
     * Unknown state.
     *
     * @relation NONE,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    None
    /**
     * The battery is being charged.
     *
     * @relation ENABLE,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Enable
    /**
     * The battery is not being charged.
     *
     * @relation DISABLE,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Disable
    /**
     * The battery is fully charged.
     *
     * @relation FULL
     */
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

/**
 * Battery health status of a device.
 *
 * @relation export enum BatteryHealthState
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryHealthState {
    /**
     * Unknown state.
     *
     * @relation UNKNOWN,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Unknown
    /**
     * The battery is in healthy state.
     *
     * @relation GOOD,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Good
    /**
     * The battery is overheated.
     *
     * @relation OVERHEAT,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Overheat
    /**
     * The battery voltage is over high.
     *
     * @relation OVERVOLTAGE,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    Overvoltage
    /**
     * The battery temperature is low.
     *
     * @relation COLD,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    cold
    /**
     * The battery is dead.
     *
     * @relation DEAD
     */
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

/**
 * Battery capacity level of a device.
 *
 * @relation export enum BatteryCapacityLevel
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum BatteryCapacityLevel {
    /**
     * The battery is in full capacity level.
     *
     * @relation LEVEL_FULL,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelFull
    /**
     * The battery is in high capacity level.
     *
     * @relation LEVEL_HIGH,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelHigh
    /**
     * The battery is in normal capacity level.
     *
     * @relation LEVEL_NORMAL,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelNormal
    /**
     * The battery is in low capacity level.
     *
     * @relation LEVEL_LOW,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelLow
    /**
     * The battery is in warning low capacity level.
     *
     * @relation LEVEL_WARNING,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelWarning
    /**
     * The battery is in critical low capacity level.
     *
     * @relation LEVEL_CRITICAL,
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    LevelCritical
    /**
     * The battery is in the lowest capacity level, system will shut down automatically in a few seconds.
     *
     * @relation LEVEL_SHUTDOWN
     */
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

/**
 * Extra key of common event COMMON_EVENT_BATTERY_CHANGED.
 *
 * @relation export enum CommonEventBatteryChangedKey
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.BatteryManager.Core"
]
public enum CommonEventBatteryChangedKey {
    /**
     * Extra code of batterySOC.
     *
     * @relation EXTRA_SOC = 'soc',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraSoc
    /**
     * Extra code of chargingStatus.
     *
     * @relation EXTRA_CHARGE_STATE = 'chargeState',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraChargeState
    /**
     * Extra code of healthStatus.
     *
     * @relation EXTRA_HEALTH_STATE = 'healthState',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraHealthState
    /**
     * Extra code of pluggedType.
     *
     * @relation EXTRA_PLUGGED_TYPE = 'pluggedType',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraPluggedType
    /**
     * Extra code of voltage.
     *
     * @relation EXTRA_VOLTAGE = 'voltage',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraVoltage
    /**
     * Extra code of technology.
     *
     * @relation EXTRA_TECHNOLOGY = 'technology',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraTechnology
    /**
     * Extra code of batteryTemperature.
     *
     * @relation EXTRA_TEMPERATURE = 'temperature',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraTemperature
    /**
     * Extra code of isBatteryPresent.
     *
     * @relation EXTRA_PRESENT = 'present',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraPresent
    /**
     * Extra code of batteryCapacityLevel.
     *
     * @relation EXTRA_CAPACITY_LEVEL = 'capacityLevel'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.BatteryManager.Core"
    ]
    ExtraCapacityLevel
    | ...
}
