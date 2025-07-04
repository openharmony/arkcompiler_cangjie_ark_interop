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

package ohos.vibrator

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import std.collection.HashMap
import ohos.file_fs.FileFs
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public interface VibrateEffect {
    prop effectType: String
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibrateTime <: VibrateEffect {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var timeType: String
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var duration: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public prop effectType: String {
        get() {
            return timeType
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(timeType: String, duration: Int32) {
        this.timeType = timeType
        this.duration = duration
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibratePreset <: VibrateEffect {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var presetType: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var effectId: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var count: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var intensity: Int32

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public prop effectType: String {
        get() {
            return presetType
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(presetType: String, effectId: String, count!: Int32 = 1, intensity!: Int32 = 100) {
        this.presetType = presetType
        this.effectId = effectId
        this.count = count
        this.intensity = intensity
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibrateFromFile <: VibrateEffect {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var fileType: String
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var hapticFd: HapticFileDescriptor

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public prop effectType: String {
        get() {
            return fileType
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(fileType: String, hapticFd: HapticFileDescriptor) {
        this.fileType = fileType
        this.hapticFd = hapticFd
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class HapticFileDescriptor {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var fd: Int32
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var offSet: Int64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var length: Int64

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(fd: Int32, offSet!: Int64 = 0, length!: Int64 = FileFs.stat(fd).size - offSet) {
        this.fd = fd
        this.offSet = offSet
        this.length = length
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public class VibrateAttribute {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var usage: Usage
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public var id: Int32

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public init(usage: Usage, id!: Int32 = 0) {
        this.usage = usage
        this.id = id
    }
}

/**
 * Enum for the use of vibration.
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum Usage <: ToString & Equatable<Usage> {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    UNKNOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    ALARM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    RING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    NOTIFICATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    COMMUNICATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    TOUCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    MEDIA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    PHYSICALFEEDBACK
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    SIMULATEREALITY
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public override func toString(): String {
        match (this) {
            case UNKNOWN => "unknown"
            case ALARM => "alarm"
            case RING => "ring"
            case NOTIFICATION => "notification"
            case COMMUNICATION => "communication"
            case TOUCH => "touch"
            case MEDIA => "media"
            case PHYSICALFEEDBACK => "physicalFeedback"
            case SIMULATEREALITY => "simulateReality"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func ==(that: Usage): Bool {
        return this.toString() == that.toString()
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func !=(that: Usage): Bool {
        return this.toString() != that.toString()
    }
}

/**
 * Enum for Preset vibration effect string.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum EffectId <: ToString & Equatable<EffectId> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    EFFECT_CLOCK_TIMER | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public override func toString(): String {
        match (this) {
            case EFFECT_CLOCK_TIMER => "haptic.clock.timer"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func ==(that: EffectId): Bool {
        return this.toString() == that.toString()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func !=(that: EffectId): Bool {
        return this.toString() != that.toString()
    }
}

/**
 * Enum for Vibrator vibration stop mode.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum VibratorStopMode <: ToString & Equatable<VibratorStopMode> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    VIBRATOR_STOP_MODE_TIME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    VIBRATOR_STOP_MODE_PRESET
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public override func toString(): String {
        match (this) {
            case VIBRATOR_STOP_MODE_TIME => "time"
            case VIBRATOR_STOP_MODE_PRESET => "preset"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func ==(that: VibratorStopMode): Bool {
        return this.toString() == that.toString()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func !=(that: VibratorStopMode): Bool {
        return this.toString() != that.toString()
    }
}

/**
 * Enum for Simple and universal vibration effects.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public enum HapticFeedback <: ToString & Equatable<HapticFeedback> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    EFFECT_SOFT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    EFFECT_HARD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    EFFECT_SHARP
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public override func toString(): String {
        match (this) {
            case EFFECT_SOFT => "haptic.effect.soft"
            case EFFECT_HARD => "haptic.effect.hard"
            case EFFECT_SHARP => "haptic.effect.sharp"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func ==(that: HapticFeedback): Bool {
        return this.toString() == that.toString()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Sensors.MiscDevice"
    ]
    public operator func !=(that: HapticFeedback): Bool {
        return this.toString() != that.toString()
    }
}

const SERVICE_STATUS_ERROR = 14600101i32
let ERROR_CODE_MAP = HashMap<Int32, String>([(SERVICE_STATUS_ERROR, " Device operation failed.")])

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}

/**
 * Trigger vibrator vibration.
 *
 * @permission ohos.permission.VIBRATE
 * @param { VibrateTime } VibrateEffect - Indicate vibrate effect.
 * @param { VibrateAttribute } attribute - Indicate vibrate attribute.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessError } 801 - Capability not supported.
 * @throws { BusinessError } 14600101 - Device operation failed.
 */
@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.permission.VIBRATE",
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public func startVibration(effect: VibrateEffect, attribute: VibrateAttribute): Unit {
    if (effect.effectType != "time" && effect.effectType != "preset" && effect.effectType != "file") {
        throw BusinessException(ERR_PARAMETER_ERROR, "startVibration failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}.")
    }
    unsafe {
        let cAttribute = RetVibrateAttribute(attribute)
        var code = 0i32
        match (effect) {
            case v: VibrateTime =>
                let cEffectTime = RetVibrateTime(v)
                FfiVibratorStartVibrationTime(cEffectTime, cAttribute, inout code)
                cEffectTime.free()
            case v: VibratePreset =>
                let cEffectPreset = RetVibratePreset(v)
                FfiVibratorStartVibrationPreset(cEffectPreset, cAttribute, inout code)
                cEffectPreset.free()
            case v: VibrateFromFile =>
                if (v.hapticFd.offSet < 0 || v.hapticFd.offSet > FileFs.stat(v.hapticFd.fd).size || v.hapticFd.length > FileFs
                    .stat(v.hapticFd.fd).size) {
                    cAttribute.free()
                    throw BusinessException(ERR_PARAMETER_ERROR,
                        "startVibration failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
                }
                let cEffectFile = RetVibrateFromFile(v)
                FfiVibratorStartVibrationFile(cEffectFile, cAttribute, inout code)
                cEffectFile.free()
            case _ =>
                cAttribute.free()
                throw IllegalArgumentException("Unknown value.")
        }
        cAttribute.free()
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, "startVibration failed: ${getErrorMsg(code)}")
        }
    }
}

/**
 * Stop the vibrator from vibrating.
 *
 * @permission ohos.permission.VIBRATE
 * @param { VibratorStopMode } stopMode - Indicate the stop mode in which the motor vibrates, {@code VibratorStopMode}.
 * @returns { Promise<void> } Promise used to return the result.
 * @throws { BusinessError } 201 - Permission denied.
 * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 */
@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.permission.VIBRATE",
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public func stopVibration(stopMode: Option<VibratorStopMode>): Unit {
    unsafe {
        var code = 0i32
        if (let Some(v) <- stopMode) {
            let cStr = LibC.mallocCString(v.toString())
            FfiVibratorStopVibrationMode(cStr, inout code)
            LibC.free(cStr)
        } else {
            FfiVibratorStopVibration(inout code)
        }
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, "stopVibration failed: ${getErrorMsg(code)}")
        }
    }
}

/**
 * Whether the preset vibration effect is supported.
 *
 * @param { EffectId } effectId Indicate the specified effect of the preset, {@code EffectId}.
 * @returns { Bool } Returns whether the effect is supported.
 * @throws { BusinessError } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;
 * <br> 2. Incorrect parameter types; 3. Parameter verification failed.
 * @throws { BusinessError } 14600101 - Device operation failed.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public func isSupportEffect(effectId: EffectId): Bool {
    unsafe {
        let cStr = LibC.mallocCString(effectId.toString())
        var code = 0i32
        let ret = FfiVibratorSupportEffect(cStr, inout code)
        LibC.free(cStr)
        if (code != SUCCESS_CODE) {
            throw BusinessException(code, "isSupportEffect failed: ${getErrorMsg(code)}")
        }
        return ret
    }
}

/**
 * Whether the high-definition haptic is supported.
 *
 * @returns { Bool } Returns whether the high-definition haptic is supported.
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Sensors.MiscDevice"
]
public func isHdHapticSupported(): Bool {
    unsafe {
        return FfiVibratorIsHdHapticSupported()
    }
}
