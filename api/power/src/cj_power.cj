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

package ohos.power

import ohos.base.*
import ohos.ffi.*
import std.collection.HashMap
import ohos.labels.*

foreign {
    func FfiPowerIsActive(): Bool

    func FfiPowerGetPowerMode(): UInt32

    func FfiPowerIsStandby(code: CPointer<Int32>): Bool
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public enum DevicePowerMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    MODE_NORMAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    MODE_POWER_SAVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    MODE_PERFORMANCE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    MODE_EXTREME_POWER_SAVE
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.PowerManager.PowerManager.Core"
    ]
    public func getValue(): UInt32 {
        match (this) {
            case MODE_NORMAL => 600
            case MODE_POWER_SAVE => 601
            case MODE_PERFORMANCE => 602
            case MODE_EXTREME_POWER_SAVE => 603
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: UInt32): DevicePowerMode {
        match (val) {
            case 600 => MODE_NORMAL
            case 601 => MODE_POWER_SAVE
            case 602 => MODE_PERFORMANCE
            case 603 => MODE_EXTREME_POWER_SAVE
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }
}

/**
 * Checks whether the device is active.
 * The screen will be on if device is active, screen will be off otherwise.
 * @returns { Bool } Returns true if the device is active; returns false otherwise.
 * @throws { BusinessException } 4900101 - Failed to connect to the service.
 * @brief isActive(): boolean
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public func isActive(): Bool {
    unsafe {
        return FfiPowerIsActive()
    }
}

/**
 * Obtains the power mode of the current device. For details, see {@link DevicePowerMode}.
 *
 * @returns { DevicePowerMode } The power mode {@link DevicePowerMode} of current device .
 * @throws { BusinessException } 4900101 - Failed to connect to the service.
 * @brief getPowerMode(): DevicePowerMode
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public func getPowerMode(): DevicePowerMode {
    unsafe {
        let ret = FfiPowerGetPowerMode()
        return DevicePowerMode.parse(ret)
    }
}

/**
 * Returns true if the device is currently in idle mode.
 *
 * @returns { Bool } Returns true if the device is in idle mode; returns false otherwise.
 * @throws { BusinessException } 4900101 - Failed to connect to the service.
 * @brief isStandby(): boolean
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.PowerManager.PowerManager.Core"
]
public func isStandby(): Bool {
    unsafe {
        var code = 0i32
        let ret = FfiPowerIsStandby(inout code)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, getErrorMsg(code))
        }
        return ret
    }
}

const ERROR_CONNECTION_FAIL: String = " Failed to connect to the service."
const ERROR_SERVICE_CODE: Int32 = 4900101
let ERROR_CODE_MAP: HashMap<Int32, String> = HashMap<Int32, String>([(ERROR_SERVICE_CODE, ERROR_CONNECTION_FAIL)])

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}
