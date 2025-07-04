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

package ohos.multimedia.audio_haptic

import std.deriving.*
import std.collection.*
import ohos.base.*
import ohos.labels.*

/**
 * Audio Latency mode.
 * @enum {Int32}
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public enum AudioLatencyMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AUDIO_LATENCY_MODE_NORMAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AUDIO_LATENCY_MODE_FAST
    | ...

    func get(): Int32 {
        match (this) {
            case AUDIO_LATENCY_MODE_NORMAL => 0
            case AUDIO_LATENCY_MODE_FAST => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Type of audio haptic.
 * @enum {Int32}
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public enum AudioHapticType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AUDIO_HAPTIC_TYPE_AUDIO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AUDIO_HAPTIC_TYPE_HAPTIC
    | ...

    func get(): Int32 {
        match (this) {
            case AUDIO_HAPTIC_TYPE_AUDIO => 0
            case AUDIO_HAPTIC_TYPE_HAPTIC => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Audio haptic player options object.
 * @typedef AudioHapticPlayerOptions
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 */
@Derive[ToString]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public class AudioHapticPlayerOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    public AudioHapticPlayerOptions(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
        ]
        public var muteAudio!: Bool = false,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
        ]
        public var muteHaptics!: Bool = false
    ) {}
}

/**
 * Audio haptic player object.
 * @typedef AudioHapticPlayer
 * @syscap SystemCapability.Multimedia.AudioHaptic.Core
 */
@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
]
public enum AudioHapticPlayerCallBackType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AHP_END_OF_STREAM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AudioHaptic.Core"
    ]
    AHP_AUDIO_INTERRRUPT
    | ...

    func get(): UInt8 {
        match (this) {
            case AHP_END_OF_STREAM => 0
            case AHP_AUDIO_INTERRRUPT => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    func toString(): String {
        match (this) {
            case AHP_END_OF_STREAM => "endOfStream"
            case AHP_AUDIO_INTERRRUPT => "audioInterrupt"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

const ERR_OPERATE_NOT_ALLOWED_INFO = "operate not allowed."
const ERR_IO_ERROR_INFO = "input or output error."
const ERR_SERVICE_DIED_INFO = "service died."
const ERR_UNSUPPORTED_FORMAT_INFO = "unsupport format."
const ERR_CODE_SERVICE_DIED_INFO: Int32 = 5400105
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (5400102, ERR_OPERATE_NOT_ALLOWED_INFO),
        (5400103, ERR_IO_ERROR_INFO),
        (5400105, ERR_SERVICE_DIED_INFO),
        (5400106, ERR_UNSUPPORTED_FORMAT_INFO)
    ]
)

func getErrMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return ERR_OPERATE_NOT_ALLOWED_INFO
    }
}
