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

package ohos.settings

import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum DomainName <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DeviceShared
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    UserProperty
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DeviceShared => "global"
            case UserProperty => "system"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Date <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DateFormat
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    TimeFormat
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AutoGainTime
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AutoGainTimeZone
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DateFormat => "settings.date.date_format"
            case TimeFormat => "settings.date.time_format"
            case AutoGainTime => "settings.date.auto_gain_time"
            case AutoGainTimeZone => "settings.date.auto_gain_time_zone"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Display <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    FontScale
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ScreenBrightnessStatus
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AutoScreenBrightness
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ScreenOffTimeout
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DefaultScreenRotation
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    Animator_Duration_Scale
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    TransitionAnimationScale
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WindowAnimationScale
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DisplayInversionStatus
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case FontScale => "settings.display.font_scale"
            case ScreenBrightnessStatus => "settings.display.screen_brightness_status"
            case AutoScreenBrightness => "settings.display.auto_screen_brightness"
            case ScreenOffTimeout => "settings.display.screen_off_timeout"
            case DefaultScreenRotation => "settings.display.default_screen_rotation"
            case Animator_Duration_Scale => "settings.display.animator_duration_scale"
            case TransitionAnimationScale => "settings.display.transition_animation_scale"
            case WindowAnimationScale => "settings.display.window_animation_scale"
            case DisplayInversionStatus => "settings.display.display_inversion_status"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}