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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public class DisplayAutoScreenBrightnessMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let AUTO_SCREEN_BRIGHTNESS_MODE: String = "1"
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let MANUAL_SCREEN_BRIGHTNESS_MODE: String = "0"
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum General <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SETUP_WIZARD_FINISHED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    END_BUTTON_ACTION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AIRPLANE_MODE_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ACCELEROMETER_ROTATION_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEVICE_PROVISION_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    HDC_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    BOOT_COUNTING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CONTACT_METADATA_SYNC_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEVELOPMENT_SETTINGS_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEVICE_NAME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    USB_STORAGE_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEBUGGER_WAITING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEBUG_APP_PACKAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ACCESSIBILITY_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ACTIVATED_ACCESSIBILITY_SERVICES
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    GEOLOCATION_ORIGINS_ALLOWED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SKIP_USE_HINTS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    TOUCH_EXPLORATION_STATUS
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case SETUP_WIZARD_FINISHED => "settings.general.setup_wizard_finished"
            case END_BUTTON_ACTION => "settings.general.end_button_action"
            case AIRPLANE_MODE_STATUS => "settings.general.airplane_mode_status"
            case ACCELEROMETER_ROTATION_STATUS => "settings.general.accelerometer_rotation_status"
            case DEVICE_PROVISION_STATUS => "settings.general.device_provision_status"
            case HDC_STATUS => "settings.general.hdc_status"
            case BOOT_COUNTING => "settings.general.boot_counting"
            case CONTACT_METADATA_SYNC_STATUS => "settings.general.contact_metadata_sync_status"
            case DEVELOPMENT_SETTINGS_STATUS => "settings.general.development_settings_status"
            case DEVICE_NAME => "settings.general.device_name"
            case USB_STORAGE_STATUS => "settings.general.usb_storage_status"
            case DEBUGGER_WAITING => "settings.general.debugger_waiting"
            case DEBUG_APP_PACKAGE => "settings.general.debug_app_package"
            case ACCESSIBILITY_STATUS => "settings.general.accessibility_status"
            case ACTIVATED_ACCESSIBILITY_SERVICES => "settings.general.activated_accessibility_services"
            case GEOLOCATION_ORIGINS_ALLOWED => "settings.general.geolocation_origins_allowed"
            case SKIP_USE_HINTS => "settings.general.skip_use_hints"
            case TOUCH_EXPLORATION_STATUS => "settings.general.touch_exploration_status"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Input <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_INPUT_METHOD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ACTIVATED_INPUT_METHOD_SUB_MODE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ACTIVATED_INPUT_METHODS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SELECTOR_VISIBILITY_FOR_INPUT_METHOD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_CAPS_TEXT_INPUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_PUNCTUATE_TEXT_INPUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AUTO_REPLACE_TEXT_INPUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SHOW_PASSWORD_TEXT_INPUT
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DEFAULT_INPUT_METHOD => "settings.input.default_input_method"
            case ACTIVATED_INPUT_METHOD_SUB_MODE => "settings.input.activated_input_method_submode"
            case ACTIVATED_INPUT_METHODS => "settings.input.activated_input_methods"
            case SELECTOR_VISIBILITY_FOR_INPUT_METHOD => "settings.input.selector_visibility_for_input_method"
            case AUTO_CAPS_TEXT_INPUT => "settings.input.auto_caps_text_input"
            case AUTO_PUNCTUATE_TEXT_INPUT => "settings.input.auto_punctuate_text_input"
            case AUTO_REPLACE_TEXT_INPUT => "settings.input.auto_replace_text_input"
            case SHOW_PASSWORD_TEXT_INPUT => "settings.input.show_password_text_input"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Network <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DATA_ROAMING_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    HTTP_PROXY_CFG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    NETWORK_PREFERENCE_USAGE
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DATA_ROAMING_STATUS => "settings.network.data_roaming_status"
            case HTTP_PROXY_CFG => "settings.network.http_proxy_cfg"
            case NETWORK_PREFERENCE_USAGE => "settings.network.network_preference_usage"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Phone <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    RTT_CALLING_STATUS | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case RTT_CALLING_STATUS => "settings.phone.rtt_calling_status"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Sound <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    VIBRATE_WHILE_RINGING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_ALARM_ALERT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DTMF_TONE_TYPE_WHILE_DIALING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DTMF_TONE_WHILE_DIALING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    HAPTIC_FEEDBACK_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AFFECTED_MODE_RINGER_STREAMS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AFFECTED_MUTE_STREAMS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_NOTIFICATION_SOUND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_RINGTONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOUND_EFFECTS_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    VIBRATE_STATUS
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case VIBRATE_WHILE_RINGING => "settings.sound.vibrate_while_ringing"
            case DEFAULT_ALARM_ALERT => "settings.sound.default_alarm_alert"
            case DTMF_TONE_TYPE_WHILE_DIALING => "settings.sound.dtmf_tone_type_while_dialing"
            case DTMF_TONE_WHILE_DIALING => "settings.sound.dtmf_tone_while_dialing"
            case HAPTIC_FEEDBACK_STATUS => "settings.sound.haptic_feedback_status"
            case AFFECTED_MODE_RINGER_STREAMS => "settings.sound.affected_mode_ringer_streams"
            case AFFECTED_MUTE_STREAMS => "settings.sound.affected_mute_streams"
            case DEFAULT_NOTIFICATION_SOUND => "settings.sound.default_notification_sound"
            case DEFAULT_RINGTONE => "settings.sound.default_ringtone"
            case SOUND_EFFECTS_STATUS => "settings.sound.sound_effects_status"
            case VIBRATE_STATUS => "settings.sound.vibrate_status"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum TTS <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_TTS_PITCH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_TTS_RATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEFAULT_TTS_SYNTH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ENABLED_TTS_PLUGINS
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case DEFAULT_TTS_PITCH => "settings.tts.default_tts_pitch"
            case DEFAULT_TTS_RATE => "settings.tts.default_tts_rate"
            case DEFAULT_TTS_SYNTH => "settings.tts.default_tts_synth"
            case ENABLED_TTS_PLUGINS => "settings.tts.enabled_tts_plugins"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public enum Wireless <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    AIRPLANE_MODE_RADIOS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    BLUETOOTH_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    BLUETOOTH_DISCOVER_ABILITY_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    BLUETOOTH_DISCOVER_TIMEOUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WIFI_DHCP_MAX_RETRY_COUNT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WIFI_TO_MOBILE_DATA_AWAKE_TIMEOUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WIFI_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    WIFI_WATCHDOG_STATUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    OWNER_LOCKDOWN_WIFI_CFG
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public override func toString(): String {
        match (this) {
            case AIRPLANE_MODE_RADIOS => "settings.wireless.airplane_mode_radios"
            case BLUETOOTH_STATUS => "settings.wireless.bluetooth_status"
            case BLUETOOTH_DISCOVER_ABILITY_STATUS => "settings.wireless.bluetooth_discoverability_status"
            case BLUETOOTH_DISCOVER_TIMEOUT => "settings.wireless.bluetooth_discover_timeout"
            case WIFI_DHCP_MAX_RETRY_COUNT => "settings.wireless.wifi_dhcp_max_retry_count"
            case WIFI_TO_MOBILE_DATA_AWAKE_TIMEOUT => "settings.wireless.wifi_to_mobile_data_awake_timeout"
            case WIFI_STATUS => "settings.wireless.wifi_status"
            case WIFI_WATCHDOG_STATUS => "settings.wireless.wifi_watchdog_status"
            case OWNER_LOCKDOWN_WIFI_CFG => "settings.wireless.owner_lockdown_wifi_cfg"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Applications.Settings.Core"
]
public class WirelessAirplantMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let BLUETOOTH_RADIO: String = "settings.wireless.bluetooth_radio"
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let CELL_RADIO: String = "settings.wireless.cell_radio"
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let NFC_RADIO: String = "settings.wireless.nfc_radio"
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Applications.Settings.Core"
    ]
    public static let WIFI_RADIO: String = "settings.wireless.wifi_radio"
}
