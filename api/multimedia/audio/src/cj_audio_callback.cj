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

package ohos.multimedia.audio

import std.deriving.*
import std.sync.Mutex
import std.deriving.*
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true
]
public enum AudioCapturerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    AUDIO_CAPTURER_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    AUDIO_INTERRUPT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    INPUT_DEVICE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    MARK_REACH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    PERIOD_REACH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    READ_DATA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    STATE_CHANGE
    | ...

    func getValue(): Int32 {
        match (this) {
            case AUDIO_CAPTURER_CHANGE => 0i32
            case AUDIO_INTERRUPT => 1i32
            case INPUT_DEVICE_CHANGE => 2i32
            case MARK_REACH => 3i32
            case PERIOD_REACH => 4i32
            case READ_DATA => 5i32
            case STATE_CHANGE => 6i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true
]
public enum AudioStreamManagerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Capturer"
    ]
    CAPTURER_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    RENDERER_CHANGE
    | ...

    func getValue(): Int32 {
        match (this) {
            case CAPTURER_CHANGE => 0i32
            case RENDERER_CHANGE => 1i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum AudioRoutingManagerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    DEVICE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    AVAILABLE_DEVICE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    PREFERRED_INPUT_DEVICE_CHANGE_FOR_CAPTURER_INFO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    PREFERR_OUTPUT_DEVICE_CHANGE_FOR_RENDERER_INFO
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEVICE_CHANGE => 0i32
            case AVAILABLE_DEVICE_CHANGE => 1i32
            case PREFERRED_INPUT_DEVICE_CHANGE_FOR_CAPTURER_INFO => 2i32
            case PREFERR_OUTPUT_DEVICE_CHANGE_FOR_RENDERER_INFO => 3i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public enum AudioVolumeManagerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    VOLUME_CHANGE | ...

    func getValue(): Int32 {
        match (this) {
            case VOLUME_CHANGE => 0i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Hashable, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public enum AudioVolumeGroupManagerCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    RING_MODE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    MICSTATE_CHANGE
    | ...

    func getValue(): Int32 {
        match (this) {
            case RING_MODE_CHANGE => 0i32
            case MICSTATE_CHANGE => 1i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true
]
public enum AudioRendererCallbackType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    AR_AUDIO_INTERRUPT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    AR_MARK_PEACH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    AR_PERIOD_REACH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    AR_STATE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    AR_OUTPUT_DEVICE_CHANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    AR_OUTPUT_DEVICE_CHANGE_WITH_INFO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    AR_WRITE_DATA
    | ...

    func getValue(): Int32 {
        match (this) {
            case AR_AUDIO_INTERRUPT => 0i32
            case AR_MARK_PEACH => 1i32
            case AR_PERIOD_REACH => 2i32
            case AR_STATE_CHANGE => 3i32
            case AR_OUTPUT_DEVICE_CHANGE => 4i32
            case AR_OUTPUT_DEVICE_CHANGE_WITH_INFO => 5i32
            case AR_WRITE_DATA => 6i32
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Equatable, Hashable]
@!APILevel[
    20,
    crossplatform: true,
    stagemodelonly: true
]
public enum AudioSessionManagerCallbackType {
    @!APILevel[
        20,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    AudioSessionDeactivated |
    ...

    func getValue(): String {
        match (this) {
            case AudioSessionDeactivated => "audioSessionDeactivated"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
