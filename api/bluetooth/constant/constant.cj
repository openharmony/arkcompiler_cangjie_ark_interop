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

package ohos.bluetooth.constant

import std.deriving.*
import ohos.labels.*

/**
 * The enum of profile id.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileId {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_A2DP_SOURCE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_HANDSFREE_AUDIO_GATEWAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_HID_HOST
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_PAN_NETWORK
    | ...

    protected func getValue(): Int32 {
        match (this) {
            case PROFILE_A2DP_SOURCE => 1i32
            case PROFILE_HANDSFREE_AUDIO_GATEWAY => 4i32
            case PROFILE_HID_HOST => 6i32
            case PROFILE_PAN_NETWORK => 7i32
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * The enum of profile connection state.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileConnectionState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_DISCONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_CONNECTING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_CONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    STATE_DISCONNECTING
    | ...

    protected static func parse(state: Int32): ProfileConnectionState {
        match (state) {
            case 0i32 => STATE_DISCONNECTED
            case 1i32 => STATE_CONNECTING
            case 2i32 => STATE_CONNECTED
            case 3i32 => STATE_DISCONNECTING
            case _ => throw NoneValueException("Value does not exist!")
        }
    }
}

/**
 * The enum of major class of a bluetooth device.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum MajorClass {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_MISC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_COMPUTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_PHONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_NETWORKING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_AUDIO_VIDEO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_PERIPHERAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_IMAGING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_WEARABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_TOY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_HEALTH
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    MAJOR_UNCATEGORIZED
    | ...
}

/**
 * The enum of major minor class of a bluetooth device.
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum MajorMinorClass {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_DESKTOP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_SERVER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_LAPTOP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_HANDHELD_PC_PDA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_PALM_SIZE_PC_PDA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_WEARABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    COMPUTER_TABLET
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_CELLULAR
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_CORDLESS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_SMART
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_MODEM_OR_GATEWAY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PHONE_ISDN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_FULLY_AVAILABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_1_TO_17_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_17_TO_33_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_33_TO_50_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_60_TO_67_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_67_TO_83_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_83_TO_99_UTILIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    NETWORK_NO_SERVICE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_WEARABLE_HEADSET
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_HANDSFREE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_MICROPHONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_LOUDSPEAKER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_HEADPHONES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_PORTABLE_AUDIO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_CAR_AUDIO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_SET_TOP_BOX
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_HIFI_AUDIO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VCR
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VIDEO_CAMERA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_CAMCORDER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VIDEO_MONITOR
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VIDEO_CONFERENCING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    AUDIO_VIDEO_VIDEO_GAMING_TOY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_NON_KEYBOARD_NON_POINTING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_KEYBOARD
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_POINTING_DEVICE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_KEYBOARD_POINTING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_UNCATEGORIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_JOYSTICK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_GAMEPAD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_REMOTE_CONTROL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_SENSING_DEVICE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_DIGITIZER_TABLET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_CARD_READER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_DIGITAL_PEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_SCANNER_RFID
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PERIPHERAL_GESTURAL_INPUT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    IMAGING_UNCATEGORIZED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    IMAGING_DISPLAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    IMAGING_CAMERA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    IMAGING_SCANNER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    IMAGING_PRINTER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_WRIST_WATCH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_PAGER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_JACKET
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_HELMET
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    WEARABLE_GLASSES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_ROBOT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_VEHICLE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_DOLL_ACTION_FIGURE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_CONTROLLER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    TOY_GAME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_UNCATEGORIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_BLOOD_PRESSURE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_THERMOMETER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_WEIGHING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_GLUCOSE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_PULSE_OXIMETER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_PULSE_RATE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_DATA_DISPLAY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_STEP_COUNTER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_BODY_COMPOSITION_ANALYZER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_PEAK_FLOW_MONITOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_MEDICATION_MONITOR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_KNEE_PROSTHESIS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_ANKLE_PROSTHESIS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_GENERIC_HEALTH_MANAGER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    HEALTH_PERSONAL_MOBILITY_DEVICE
    | ...
}

/**
 * Enum for the profile's uuid
 */
@Derive[Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum ProfileUuids <: ToString {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HFP_AG
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HFP_HF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HSP_AG
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HSP_HS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_A2DP_SRC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_A2DP_SINK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_AVRCP_CT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_AVRCP_TG
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_HOGP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    PROFILE_UUID_UNKNOWN
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public override func toString(): String {
        match (this) {
            case PROFILE_UUID_HFP_AG => "0000111F-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_HFP_HF => "0000111E-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_HSP_AG => "00001112-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_HSP_HS => "00001108-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_A2DP_SRC => "0000110A-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_A2DP_SINK => "0000110B-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_AVRCP_CT => "0000110E-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_AVRCP_TG => "0000110C-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_HID => "00001124-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_HOGP => "00001812-0000-1000-8000-00805F9B34FB"
            case PROFILE_UUID_UNKNOWN => "PROFILE_UUID_UNKNOWN"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
