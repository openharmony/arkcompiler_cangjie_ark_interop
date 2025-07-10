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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum DomainName <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEVICE_SHARED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    USER_PROPERTY
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DEVICE_SHARED => "global"
            case USER_PROPERTY => "system"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Date <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DATE_FORMAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    TIME_FORMAT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_GAIN_TIME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_GAIN_TIME_ZONE
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DATE_FORMAT => "settings.date.date_format"
            case TIME_FORMAT => "settings.date.time_format"
            case AUTO_GAIN_TIME => "settings.date.auto_gain_time"
            case AUTO_GAIN_TIME_ZONE => "settings.date.auto_gain_time_zone"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Display <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    FONT_SCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SCREEN_BRIGHTNESS_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_SCREEN_BRIGHTNESS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SCREEN_OFF_TIMEOUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_SCREEN_ROTATION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ANIMATOR_DURATION_SCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    TRANSITION_ANIMATION_SCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WINDOW_ANIMATION_SCALE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DISPLAY_INVERSION_STATUS
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case FONT_SCALE => "settings.display.font_scale"
            case SCREEN_BRIGHTNESS_STATUS => "settings.display.screen_brightness_status"
            case AUTO_SCREEN_BRIGHTNESS => "settings.display.auto_screen_brightness"
            case SCREEN_OFF_TIMEOUT => "settings.display.screen_off_timeout"
            case DEFAULT_SCREEN_ROTATION => "settings.display.default_screen_rotation"
            case ANIMATOR_DURATION_SCALE => "settings.display.animator_duration_scale"
            case TRANSITION_ANIMATION_SCALE => "settings.display.transition_animation_scale"
            case WINDOW_ANIMATION_SCALE => "settings.display.window_animation_scale"
            case DISPLAY_INVERSION_STATUS => "settings.display.display_inversion_status"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}