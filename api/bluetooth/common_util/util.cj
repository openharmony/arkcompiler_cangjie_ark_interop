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

protected package ohos.bluetooth.common_util

import ohos.bluetooth.constant.*
import ohos.ffi.*
import std.collection.HashMap

protected interface ParseableInt32<T> {
    static func parse(state: Int32): T
}

protected interface ParseableString<T> {
    static func parse(state: String): T
}

let MAJOR_CLASS_MAP = HashMap<Int32, MajorClass>(
    [
        (0x0000, MAJOR_MISC),
        (0x0100, MAJOR_COMPUTER),
        (0x0200, MAJOR_PHONE),
        (0x0300, MAJOR_NETWORKING),
        (0x0400, MAJOR_AUDIO_VIDEO),
        (0x0500, MAJOR_PERIPHERAL),
        (0x0600, MAJOR_IMAGING),
        (0x0700, MAJOR_WEARABLE),
        (0x0800, MAJOR_TOY),
        (0x0900, MAJOR_HEALTH),
        (0x1F00, MAJOR_UNCATEGORIZED)
    ]
)

extend MajorClass <: ParseableInt32<MajorClass> {
    public static func parse(majorClass: Int32): MajorClass {
        MAJOR_CLASS_MAP.get(majorClass) ?? MAJOR_UNCATEGORIZED
    }
}

let MAJOR_MINOR_CLASS_MAP = HashMap<Int32, MajorMinorClass>(
    [
        (0x0100, COMPUTER_UNCATEGORIZED),
        (0x0104, COMPUTER_DESKTOP),
        (0x0108, COMPUTER_SERVER),
        (0x010C, COMPUTER_LAPTOP),
        (0x0110, COMPUTER_HANDHELD_PC_PDA),
        (0x0114, COMPUTER_PALM_SIZE_PC_PDA),
        (0x0118, COMPUTER_WEARABLE),
        (0x011C, COMPUTER_TABLET),
        (0x0200, PHONE_UNCATEGORIZED),
        (0x0204, PHONE_CELLULAR),
        (0x0208, PHONE_CORDLESS),
        (0x020C, PHONE_SMART),
        (0x0210, PHONE_MODEM_OR_GATEWAY),
        (0x0214, PHONE_ISDN),
        (0x0300, NETWORK_FULLY_AVAILABLE),
        (0x0320, NETWORK_1_TO_17_UTILIZED),
        (0x0340, NETWORK_17_TO_33_UTILIZED),
        (0x0360, NETWORK_33_TO_50_UTILIZED),
        (0x0380, NETWORK_60_TO_67_UTILIZED),
        (0x03A0, NETWORK_67_TO_83_UTILIZED),
        (0x03C0, NETWORK_83_TO_99_UTILIZED),
        (0x03E0, NETWORK_NO_SERVICE),
        (0x0400, AUDIO_VIDEO_UNCATEGORIZED),
        (0x0404, AUDIO_VIDEO_WEARABLE_HEADSET),
        (0x0408, AUDIO_VIDEO_HANDSFREE),
        (0x0410, AUDIO_VIDEO_MICROPHONE),
        (0x0414, AUDIO_VIDEO_LOUDSPEAKER),
        (0x0418, AUDIO_VIDEO_HEADPHONES),
        (0x041C, AUDIO_VIDEO_PORTABLE_AUDIO),
        (0x0420, AUDIO_VIDEO_CAR_AUDIO),
        (0x0424, AUDIO_VIDEO_SET_TOP_BOX),
        (0x0428, AUDIO_VIDEO_HIFI_AUDIO),
        (0x042C, AUDIO_VIDEO_VCR),
        (0x0430, AUDIO_VIDEO_VIDEO_CAMERA),
        (0x0434, AUDIO_VIDEO_CAMCORDER),
        (0x0438, AUDIO_VIDEO_VIDEO_MONITOR),
        (0x043C, AUDIO_VIDEO_VIDEO_DISPLAY_AND_LOUDSPEAKER),
        (0x0440, AUDIO_VIDEO_VIDEO_CONFERENCING),
        (0x0448, AUDIO_VIDEO_VIDEO_GAMING_TOY),
        (0x0500, PERIPHERAL_NON_KEYBOARD_NON_POINTING),
        (0x0540, PERIPHERAL_KEYBOARD),
        (0x0580, PERIPHERAL_POINTING_DEVICE),
        (0x05C0, PERIPHERAL_KEYBOARD_POINTING),
        (0x0500, PERIPHERAL_UNCATEGORIZED),
        (0x0504, PERIPHERAL_JOYSTICK),
        (0x0508, PERIPHERAL_GAMEPAD),
        (0x05C0, PERIPHERAL_REMOTE_CONTROL),
        (0x0510, PERIPHERAL_SENSING_DEVICE),
        (0x0514, PERIPHERAL_DIGITIZER_TABLET),
        (0x0518, PERIPHERAL_CARD_READER),
        (0x051C, PERIPHERAL_DIGITAL_PEN),
        (0x0520, PERIPHERAL_SCANNER_RFID),
        (0x0522, PERIPHERAL_GESTURAL_INPUT),
        (0x0600, IMAGING_UNCATEGORIZED),
        (0x0610, IMAGING_DISPLAY),
        (0x0620, IMAGING_CAMERA),
        (0x0640, IMAGING_SCANNER),
        (0x0680, IMAGING_PRINTER),
        (0x0700, WEARABLE_UNCATEGORIZED),
        (0x0704, WEARABLE_WRIST_WATCH),
        (0x0708, WEARABLE_PAGER),
        (0x070C, WEARABLE_JACKET),
        (0x0710, WEARABLE_HELMET),
        (0x0714, WEARABLE_GLASSES),
        (0x0800, TOY_UNCATEGORIZED),
        (0x0804, TOY_ROBOT),
        (0x0808, TOY_VEHICLE),
        (0x080C, TOY_DOLL_ACTION_FIGURE),
        (0x0810, TOY_CONTROLLER),
        (0x0814, TOY_GAME),
        (0x0900, HEALTH_UNCATEGORIZED),
        (0x0904, HEALTH_BLOOD_PRESSURE),
        (0x0908, HEALTH_THERMOMETER),
        (0x090C, HEALTH_WEIGHING),
        (0x0910, HEALTH_GLUCOSE),
        (0x0914, HEALTH_PULSE_OXIMETER),
        (0x0918, HEALTH_PULSE_RATE),
        (0x091C, HEALTH_DATA_DISPLAY),
        (0x0920, HEALTH_STEP_COUNTER),
        (0x0924, HEALTH_BODY_COMPOSITION_ANALYZER),
        (0x0928, HEALTH_PEAK_FLOW_MONITOR),
        (0x092C, HEALTH_MEDICATION_MONITOR),
        (0x0930, HEALTH_KNEE_PROSTHESIS),
        (0x0934, HEALTH_ANKLE_PROSTHESIS),
        (0x0938, HEALTH_GENERIC_HEALTH_MANAGER),
        (0x093C, HEALTH_PERSONAL_MOBILITY_DEVICE)
    ]
)

extend MajorMinorClass <: ParseableInt32<MajorMinorClass> {
    public static func parse(majorMinorClass: Int32): MajorMinorClass {
        MAJOR_MINOR_CLASS_MAP.get(majorMinorClass) ?? COMPUTER_UNCATEGORIZED
    }
}

let UUIDS_MAP = HashMap<String, ProfileUuids>(
    [
        ("0000111f-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HFP_AG),
        ("0000111e-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HFP_HF),
        ("00001112-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HSP_AG),
        ("00001108-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HSP_HS),
        ("0000110a-0000-1000-8000-00805f9b34fb", PROFILE_UUID_A2DP_SRC),
        ("0000110b-0000-1000-8000-00805f9b34fb", PROFILE_UUID_A2DP_SINK),
        ("0000110e-0000-1000-8000-00805f9b34fb", PROFILE_UUID_AVRCP_CT),
        ("0000110c-0000-1000-8000-00805f9b34fb", PROFILE_UUID_AVRCP_TG),
        ("00001124-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HID),
        ("00001812-0000-1000-8000-00805f9b34fb", PROFILE_UUID_HOGP)
    ]
)

extend ProfileUuids <: ParseableString<ProfileUuids> {
    public static func parse(uuid: String): ProfileUuids {
        UUIDS_MAP.get(uuid) ?? PROFILE_UUID_UNKNOWN
    }
}

protected unsafe func cArrString2ArrString(cArr: CArrString): Array<String> {
    let ptr = cArr.head
    if (ptr.isNull()) {
        return Array<String>()
    }
    let size = cArr.size
    let ret = Array<String>(
        size,
        {
            i =>
            let cString = ptr.read(i)
            let str = cString.toString()
            str
        }
    )
    return ret
}
