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
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
/**
 * Enumerates the audio channel.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioChannel {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_3
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_4
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_5
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_6
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_7
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_8
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_9
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_10
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_12
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_14
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CHANNEL_16
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case CHANNEL_1 => 1i32
                case CHANNEL_2 => 2i32
                case CHANNEL_3 => 3i32
                case CHANNEL_4 => 4i32
                case CHANNEL_5 => 5i32
                case CHANNEL_6 => 6i32
                case CHANNEL_7 => 7i32
                case CHANNEL_8 => 8i32
                case CHANNEL_9 => 9i32
                case CHANNEL_10 => 10i32
                case CHANNEL_12 => 12i32
                case CHANNEL_14 => 14i32
                case CHANNEL_16 => 16i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(channelVal: Int32): AudioChannel {
        match (channelVal) {
            case 1i32 => CHANNEL_1
            case 2i32 => CHANNEL_2
            case 3i32 => CHANNEL_3
            case 4i32 => CHANNEL_4
            case 5i32 => CHANNEL_5
            case 6i32 => CHANNEL_6
            case 7i32 => CHANNEL_7
            case 8i32 => CHANNEL_8
            case 9i32 => CHANNEL_9
            case 10i32 => CHANNEL_10
            case 12i32 => CHANNEL_12
            case 14i32 => CHANNEL_14
            case 16i32 => CHANNEL_16
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Audio AudioChannel Layout
 * A 64-bit integer indicates that the appearance and order of the speakers for recording or playback.
 * @enum { Int64 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioChannelLayout {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_UNKNOWN
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_MONO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_STEREO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_STEREO_DOWNMIX
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_2POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_3POINT0
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_SURROUND
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_3POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_4POINT0
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_QUAD
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_QUAD_SIDE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_2POINT0POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER1_ACN_N3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER1_ACN_SN3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER1_FUMA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_4POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT0
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT0_BACK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_2POINT1POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_3POINT0POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT1_BACK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_6POINT0
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_HEXAGONAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_3POINT1POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_6POINT0_FRONT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_6POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_6POINT1_BACK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_6POINT1_FRONT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT0
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT0_FRONT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT1
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_OCTAGONAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT1POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT1_WIDE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT1_WIDE_BACK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER2_ACN_N3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER2_ACN_SN3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER2_FUMA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_5POINT1POINT4
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT1POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_7POINT1POINT4
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_10POINT2
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_9POINT1POINT4
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_9POINT1POINT6
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_HEXADECAGONAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER3_ACN_N3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER3_ACN_SN3D
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CH_LAYOUT_AMB_ORDER3_FUMA
    | ...

    prop value: Int64 {
        get() {
            match (this) {
                case CH_LAYOUT_UNKNOWN => 0x0i64
                case CH_LAYOUT_MONO => 0x4i64
                case CH_LAYOUT_STEREO => 0x3i64
                case CH_LAYOUT_STEREO_DOWNMIX => 0x60000000i64
                case CH_LAYOUT_2POINT1 => 0xBi64
                case CH_LAYOUT_3POINT0 => 0x103i64
                case CH_LAYOUT_SURROUND => 0x7i64
                case CH_LAYOUT_3POINT1 => 0xFi64
                case CH_LAYOUT_4POINT0 => 0x107i64
                case CH_LAYOUT_QUAD => 0x33i64
                case CH_LAYOUT_QUAD_SIDE => 0x603i64
                case CH_LAYOUT_2POINT0POINT2 => 0x3000000003i64
                case CH_LAYOUT_AMB_ORDER1_ACN_N3D => 0x100000000001i64
                case CH_LAYOUT_AMB_ORDER1_ACN_SN3D => 0x100000001001i64
                case CH_LAYOUT_AMB_ORDER1_FUMA => 0x100000000101i64
                case CH_LAYOUT_4POINT1 => 0x10Fi64
                case CH_LAYOUT_5POINT0 => 0x607i64
                case CH_LAYOUT_5POINT0_BACK => 0x37i64
                case CH_LAYOUT_2POINT1POINT2 => 0x300000000Bi64
                case CH_LAYOUT_3POINT0POINT2 => 0x3000000007i64
                case CH_LAYOUT_5POINT1 => 0x60Fi64
                case CH_LAYOUT_5POINT1_BACK => 0x3Fi64
                case CH_LAYOUT_6POINT0 => 0x707i64
                case CH_LAYOUT_HEXAGONAL => 0x137i64
                case CH_LAYOUT_3POINT1POINT2 => 0x500Fi64
                case CH_LAYOUT_6POINT0_FRONT => 0x6C3i64
                case CH_LAYOUT_6POINT1 => 0x70Fi64
                case CH_LAYOUT_6POINT1_BACK => 0x13Fi64
                case CH_LAYOUT_6POINT1_FRONT => 0x6CBi64
                case CH_LAYOUT_7POINT0 => 0x637i64
                case CH_LAYOUT_7POINT0_FRONT => 0x6C7i64
                case CH_LAYOUT_7POINT1 => 0x63Fi64
                case CH_LAYOUT_OCTAGONAL => 0x737i64
                case CH_LAYOUT_5POINT1POINT2 => 0x300000060Fi64
                case CH_LAYOUT_7POINT1_WIDE => 0x6CFi64
                case CH_LAYOUT_7POINT1_WIDE_BACK => 0xFFi64
                case CH_LAYOUT_AMB_ORDER2_ACN_N3D => 0x100000000002i64
                case CH_LAYOUT_AMB_ORDER2_ACN_SN3D => 0x100000001002i64
                case CH_LAYOUT_AMB_ORDER2_FUMA => 0x100000000102i64
                case CH_LAYOUT_5POINT1POINT4 => 0x2D60Fi64
                case CH_LAYOUT_7POINT1POINT2 => 0x300000063Fi64
                case CH_LAYOUT_7POINT1POINT4 => 0x2D63Fi64
                case CH_LAYOUT_10POINT2 => 0x180005737i64
                case CH_LAYOUT_9POINT1POINT4 => 0x18002D63Fi64
                case CH_LAYOUT_9POINT1POINT6 => 0x318002D63Fi64
                case CH_LAYOUT_HEXADECAGONAL => 0x18003F737i64
                case CH_LAYOUT_AMB_ORDER3_ACN_N3D => 0x100000000003i64
                case CH_LAYOUT_AMB_ORDER3_ACN_SN3D => 0x100000001003i64
                case CH_LAYOUT_AMB_ORDER3_FUMA => 0x100000000103i64
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(channelLayout: Int64): AudioChannelLayout {
        match (channelLayout) {
            case 0x0i64 => CH_LAYOUT_UNKNOWN
            case 0x4i64 => CH_LAYOUT_MONO
            case 0x3i64 => CH_LAYOUT_STEREO
            case 0x60000000i64 => CH_LAYOUT_STEREO_DOWNMIX
            case 0xBi64 => CH_LAYOUT_2POINT1
            case 0x103i64 => CH_LAYOUT_3POINT0
            case 0x7i64 => CH_LAYOUT_SURROUND
            case 0xFi64 => CH_LAYOUT_3POINT1
            case 0x107i64 => CH_LAYOUT_4POINT0
            case 0x33i64 => CH_LAYOUT_QUAD
            case 0x603i64 => CH_LAYOUT_QUAD_SIDE
            case 0x3000000003i64 => CH_LAYOUT_2POINT0POINT2
            case 0x100000000001i64 => CH_LAYOUT_AMB_ORDER1_ACN_N3D
            case 0x100000001001i64 => CH_LAYOUT_AMB_ORDER1_ACN_SN3D
            case 0x100000000101i64 => CH_LAYOUT_AMB_ORDER1_FUMA
            case 0x10Fi64 => CH_LAYOUT_4POINT1
            case 0x607i64 => CH_LAYOUT_5POINT0
            case 0x37i64 => CH_LAYOUT_5POINT0_BACK
            case 0x300000000Bi64 => CH_LAYOUT_2POINT1POINT2
            case 0x3000000007i64 => CH_LAYOUT_3POINT0POINT2
            case 0x60Fi64 => CH_LAYOUT_5POINT1
            case 0x3Fi64 => CH_LAYOUT_5POINT1_BACK
            case 0x707i64 => CH_LAYOUT_6POINT0
            case 0x137i64 => CH_LAYOUT_HEXAGONAL
            case 0x500Fi64 => CH_LAYOUT_3POINT1POINT2
            case 0x6C3i64 => CH_LAYOUT_6POINT0_FRONT
            case 0x70Fi64 => CH_LAYOUT_6POINT1
            case 0x13Fi64 => CH_LAYOUT_6POINT1_BACK
            case 0x6CBi64 => CH_LAYOUT_6POINT1_FRONT
            case 0x637i64 => CH_LAYOUT_7POINT0
            case 0x6C7i64 => CH_LAYOUT_7POINT0_FRONT
            case 0x63Fi64 => CH_LAYOUT_7POINT1
            case 0x737i64 => CH_LAYOUT_OCTAGONAL
            case 0x300000060Fi64 => CH_LAYOUT_5POINT1POINT2
            case 0x6CFi64 => CH_LAYOUT_7POINT1_WIDE
            case 0xFFi64 => CH_LAYOUT_7POINT1_WIDE_BACK
            case 0x100000000002i64 => CH_LAYOUT_AMB_ORDER2_ACN_N3D
            case 0x100000001002i64 => CH_LAYOUT_AMB_ORDER2_ACN_SN3D
            case 0x100000000102i64 => CH_LAYOUT_AMB_ORDER2_FUMA
            case 0x2D60Fi64 => CH_LAYOUT_5POINT1POINT4
            case 0x300000063Fi64 => CH_LAYOUT_7POINT1POINT2
            case 0x2D63Fi64 => CH_LAYOUT_7POINT1POINT4
            case 0x180005737i64 => CH_LAYOUT_10POINT2
            case 0x18002D63Fi64 => CH_LAYOUT_9POINT1POINT4
            case 0x318002D63Fi64 => CH_LAYOUT_9POINT1POINT6
            case 0x18003F737i64 => CH_LAYOUT_HEXADECAGONAL
            case 0x100000000003i64 => CH_LAYOUT_AMB_ORDER3_ACN_N3D
            case 0x100000001003i64 => CH_LAYOUT_AMB_ORDER3_ACN_SN3D
            case 0x100000000103i64 => CH_LAYOUT_AMB_ORDER3_FUMA
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates callback result.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioDataCallbackResult {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    INVALID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    VALID
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INVALID => -1i32
                case VALID => 0i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Describes an audio effect mode group.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioEffectMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    EFFECT_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    EFFECT_DEFAULT
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case EFFECT_NONE => 0i32
                case EFFECT_DEFAULT => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    protected static func parse(effectMode: Int32): AudioEffectMode {
        match (effectMode) {
            case 0i32 => EFFECT_NONE
            case 1i32 => EFFECT_DEFAULT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the audio encoding type.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioEncodingType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ENCODING_TYPE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ENCODING_TYPE_RAW
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ENCODING_TYPE_INVALID => -1i32
                case ENCODING_TYPE_RAW => 0i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(encodingType: Int32): AudioEncodingType {
        match (encodingType) {
            case -1i32 => ENCODING_TYPE_INVALID
            case 0i32 => ENCODING_TYPE_RAW
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates audio errors.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioErrors {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_INVALID_PARAM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_NO_MEMORY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_ILLEGAL_STATE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_UNSUPPORTED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_TIMEOUT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_STREAM_LIMIT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    ERROR_SYSTEM
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ERROR_INVALID_PARAM => 6800101i32
                case ERROR_NO_MEMORY => 6800102i32
                case ERROR_ILLEGAL_STATE => 6800103i32
                case ERROR_UNSUPPORTED => 6800104i32
                case ERROR_TIMEOUT => 6800105i32
                case ERROR_STREAM_LIMIT => 6800201i32
                case ERROR_SYSTEM => 6800301i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates audio stream privacy type for playback capture.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.PlaybackCapture
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.PlaybackCapture"
]
public enum AudioPrivacyType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.PlaybackCapture"
    ]
    PRIVACY_TYPE_PUBLIC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.PlaybackCapture"
    ]
    PRIVACY_TYPE_PRIVATE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PRIVACY_TYPE_PUBLIC => 0i32
                case PRIVACY_TYPE_PRIVATE => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates the audio renderer rates.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public enum AudioRendererRate {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    RENDER_RATE_NORMAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    RENDER_RATE_DOUBLE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    RENDER_RATE_HALF
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case RENDER_RATE_NORMAL => 0i32
                case RENDER_RATE_DOUBLE => 1i32
                case RENDER_RATE_HALF => 2i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates ringer modes.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Communication
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Communication"
]
public enum AudioRingMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    RINGER_MODE_SILENT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    RINGER_MODE_VIBRATE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    RINGER_MODE_NORMAL
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case RINGER_MODE_SILENT => 0i32
                case RINGER_MODE_VIBRATE => 1i32
                case RINGER_MODE_NORMAL => 2i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(audioRingMode: Int32): AudioRingMode {
        match (audioRingMode) {
            case 0i32 => RINGER_MODE_SILENT
            case 1i32 => RINGER_MODE_VIBRATE
            case 2i32 => RINGER_MODE_NORMAL
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the audio sample formats.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioSampleFormat {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_INVALID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_U8
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_S16LE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_S24LE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_S32LE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_FORMAT_F32LE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SAMPLE_FORMAT_INVALID => -1i32
                case SAMPLE_FORMAT_U8 => 0i32
                case SAMPLE_FORMAT_S16LE => 1i32
                case SAMPLE_FORMAT_S24LE => 2i32
                case SAMPLE_FORMAT_S32LE => 3i32
                case SAMPLE_FORMAT_F32LE => 4i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(sampleFormat: Int32): AudioSampleFormat {
        match (sampleFormat) {
            case -1i32 => SAMPLE_FORMAT_INVALID
            case 0i32 => SAMPLE_FORMAT_U8
            case 1i32 => SAMPLE_FORMAT_S16LE
            case 2i32 => SAMPLE_FORMAT_S24LE
            case 3i32 => SAMPLE_FORMAT_S32LE
            case 4i32 => SAMPLE_FORMAT_F32LE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the audio sampling rate.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioSamplingRate {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_8000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_11025
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_12000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_16000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_22050
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_24000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_32000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_44100
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_48000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_64000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_88200
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_96000
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_176400
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SAMPLE_RATE_192000
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SAMPLE_RATE_8000 => 8000i32
                case SAMPLE_RATE_11025 => 11025i32
                case SAMPLE_RATE_12000 => 12000i32
                case SAMPLE_RATE_16000 => 16000i32
                case SAMPLE_RATE_22050 => 22050i32
                case SAMPLE_RATE_24000 => 24000i32
                case SAMPLE_RATE_32000 => 32000i32
                case SAMPLE_RATE_44100 => 44100i32
                case SAMPLE_RATE_48000 => 48000i32
                case SAMPLE_RATE_64000 => 64000i32
                case SAMPLE_RATE_88200 => 88200i32
                case SAMPLE_RATE_96000 => 96000i32
                case SAMPLE_RATE_176400 => 176400i32
                case SAMPLE_RATE_192000 => 192000i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(sampleRate: Int32): AudioSamplingRate {
        match (sampleRate) {
            case 8000i32 => SAMPLE_RATE_8000
            case 11025i32 => SAMPLE_RATE_11025
            case 12000i32 => SAMPLE_RATE_12000
            case 16000i32 => SAMPLE_RATE_16000
            case 22050i32 => SAMPLE_RATE_22050
            case 24000i32 => SAMPLE_RATE_24000
            case 32000i32 => SAMPLE_RATE_32000
            case 44100i32 => SAMPLE_RATE_44100
            case 48000i32 => SAMPLE_RATE_48000
            case 64000i32 => SAMPLE_RATE_64000
            case 88200i32 => SAMPLE_RATE_88200
            case 96000i32 => SAMPLE_RATE_96000
            case 176400i32 => SAMPLE_RATE_176400
            case 192000i32 => SAMPLE_RATE_192000
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates audio scenes.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Communication
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Communication"
]
public enum AudioScene {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    AUDIO_SCENE_DEFAULT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    AUDIO_SCENE_RINGING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    AUDIO_SCENE_PHONE_CALL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    AUDIO_SCENE_VOICE_CHAT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AUDIO_SCENE_DEFAULT => 0i32
                case AUDIO_SCENE_RINGING => 1i32
                case AUDIO_SCENE_PHONE_CALL => 2i32
                case AUDIO_SCENE_VOICE_CHAT => 3i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(state: Int32): AudioScene {
        match (state) {
            case 0i32 => AUDIO_SCENE_DEFAULT
            case 1i32 => AUDIO_SCENE_RINGING
            case 2i32 => AUDIO_SCENE_PHONE_CALL
            case 3i32 => AUDIO_SCENE_VOICE_CHAT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the audio states.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioState {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_INVALID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_NEW
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_PREPARED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_RUNNING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_STOPPED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_RELEASED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STATE_PAUSED
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case STATE_INVALID => -1i32
                case STATE_NEW => 0i32
                case STATE_PREPARED => 1i32
                case STATE_RUNNING => 2i32
                case STATE_STOPPED => 3i32
                case STATE_RELEASED => 4i32
                case STATE_PAUSED => 5i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(state: Int32): AudioState {
        match (state) {
            case -1i32 => STATE_INVALID
            case 0i32 => STATE_NEW
            case 1i32 => STATE_PREPARED
            case 2i32 => STATE_RUNNING
            case 3i32 => STATE_STOPPED
            case 4i32 => STATE_RELEASED
            case 5i32 => STATE_PAUSED
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates audio stream device change reason.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum AudioStreamDeviceChangeReason {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    REASON_UNKNOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    REASON_NEW_DEVICE_AVAILABLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    REASON_OLD_DEVICE_UNAVAILABLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    REASON_OVERRODE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case REASON_UNKNOWN => 0i32
                case REASON_NEW_DEVICE_AVAILABLE => 1i32
                case REASON_OLD_DEVICE_UNAVAILABLE => 2i32
                case REASON_OVERRODE => 3i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): AudioStreamDeviceChangeReason {
        match (reason) {
            case 0i32 => REASON_UNKNOWN
            case 1i32 => REASON_NEW_DEVICE_AVAILABLE
            case 2i32 => REASON_OLD_DEVICE_UNAVAILABLE
            case 3i32 => REASON_OVERRODE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates audio stream types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Volume
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Volume"
]
public enum AudioVolumeType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    VOICE_CALL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    RINGTONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    MEDIA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    ALARM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    ACCESSIBILITY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Volume"
    ]
    VOICE_ASSISTANT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case VOICE_CALL => 0i32
                case RINGTONE => 2i32
                case MEDIA => 3i32
                case ALARM => 4i32
                case ACCESSIBILITY => 5i32
                case VOICE_ASSISTANT => 9i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(volumeType: Int32): AudioVolumeType {
        match (volumeType) {
            case 0i32 => VOICE_CALL
            case 2i32 => RINGTONE
            case 3i32 => MEDIA
            case 4i32 => ALARM
            case 5i32 => ACCESSIBILITY
            case 9i32 => VOICE_ASSISTANT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates channel blend mode.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum ChannelBlendMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    MODE_DEFAULT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    MODE_BLEND_LR
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    MODE_ALL_LEFT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    MODE_ALL_RIGHT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case MODE_DEFAULT => 0i32
                case MODE_BLEND_LR => 1i32
                case MODE_ALL_LEFT => 2i32
                case MODE_ALL_RIGHT => 3i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates the available device types for communication.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Communication
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Communication"
]
public enum CommunicationDeviceType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Communication"
    ]
    SPEAKER | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SPEAKER => 2i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates device change types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum DeviceChangeType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    CONNECT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    DISCONNECT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case CONNECT => 0i32
                case DISCONNECT => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(deviceChangeType: Int32): DeviceChangeType {
        match (deviceChangeType) {
            case 0i32 => CONNECT
            case 1i32 => DISCONNECT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates audio device flags.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum DeviceFlag {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    OUTPUT_DEVICES_FLAG
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    INPUT_DEVICES_FLAG
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    ALL_DEVICES_FLAG
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OUTPUT_DEVICES_FLAG => 1i32
                case INPUT_DEVICES_FLAG => 2i32
                case ALL_DEVICES_FLAG => 3i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates audio device usages.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum DeviceUsage {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    MEDIA_OUTPUT_DEVICES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    MEDIA_INPUT_DEVICES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    ALL_MEDIA_DEVICES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    CALL_OUTPUT_DEVICES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    CALL_INPUT_DEVICES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    ALL_CALL_DEVICES
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case MEDIA_OUTPUT_DEVICES => 1u32
                case MEDIA_INPUT_DEVICES => 2u32
                case ALL_MEDIA_DEVICES => 3u32
                case CALL_OUTPUT_DEVICES => 4u32
                case CALL_INPUT_DEVICES => 8u32
                case ALL_CALL_DEVICES => 12u32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(deviceUsage: UInt32): DeviceUsage {
        match (deviceUsage) {
            case 1u32 => MEDIA_OUTPUT_DEVICES
            case 2u32 => MEDIA_INPUT_DEVICES
            case 3u32 => ALL_MEDIA_DEVICES
            case 4u32 => CALL_OUTPUT_DEVICES
            case 8u32 => CALL_INPUT_DEVICES
            case 12u32 => ALL_CALL_DEVICES
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates device roles.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum DeviceRole {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    INPUT_DEVICE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    OUTPUT_DEVICE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INPUT_DEVICE => 1i32
                case OUTPUT_DEVICE => 2i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(deviceRole: Int32): DeviceRole {
        match (deviceRole) {
            case 1i32 => INPUT_DEVICE
            case 2i32 => OUTPUT_DEVICE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates device types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Device
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Device"
]
public enum DeviceType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    EARPIECE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    SPEAKER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    WIRED_HEADSET
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    WIRED_HEADPHONES
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    BLUETOOTH_SCO
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    BLUETOOTH_A2DP
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    MIC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    USB_HEADSET
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    DISPLAY_PORT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    REMOTE_CAST
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Device"
    ]
    DEFAULT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INVALID => 0i32
                case EARPIECE => 1i32
                case SPEAKER => 2i32
                case WIRED_HEADSET => 3i32
                case WIRED_HEADPHONES => 4i32
                case BLUETOOTH_SCO => 7i32
                case BLUETOOTH_A2DP => 8i32
                case MIC => 15i32
                case USB_HEADSET => 22i32
                case DISPLAY_PORT => 23i32
                case REMOTE_CAST => 24i32
                case DEFAULT => 1000i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(deviceType: Int32): DeviceType {
        match (deviceType) {
            case 0i32 => INVALID
            case 1i32 => EARPIECE
            case 2i32 => SPEAKER
            case 3i32 => WIRED_HEADSET
            case 4i32 => WIRED_HEADPHONES
            case 7i32 => BLUETOOTH_SCO
            case 8i32 => BLUETOOTH_A2DP
            case 15i32 => MIC
            case 22i32 => USB_HEADSET
            case 23i32 => DISPLAY_PORT
            case 24i32 => REMOTE_CAST
            case 1000i32 => DEFAULT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the interrupt force types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public enum InterruptForceType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_FORCE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_SHARE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INTERRUPT_FORCE => 0i32
                case INTERRUPT_SHARE => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): InterruptForceType {
        match (reason) {
            case 0i32 => INTERRUPT_FORCE
            case 1i32 => INTERRUPT_SHARE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the interrupt hints.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public enum InterruptHint {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_NONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_RESUME
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_PAUSE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_STOP
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_DUCK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_HINT_UNDUCK
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INTERRUPT_HINT_NONE => 0i32
                case INTERRUPT_HINT_RESUME => 1i32
                case INTERRUPT_HINT_PAUSE => 2i32
                case INTERRUPT_HINT_STOP => 3i32
                case INTERRUPT_HINT_DUCK => 4i32
                case INTERRUPT_HINT_UNDUCK => 5i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): InterruptHint {
        match (reason) {
            case 0i32 => INTERRUPT_HINT_NONE
            case 1i32 => INTERRUPT_HINT_RESUME
            case 2i32 => INTERRUPT_HINT_PAUSE
            case 3i32 => INTERRUPT_HINT_STOP
            case 4i32 => INTERRUPT_HINT_DUCK
            case 5i32 => INTERRUPT_HINT_UNDUCK
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the interrupt modes.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Interrupt
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Interrupt"
]
public enum InterruptMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    SHARE_MODE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Interrupt"
    ]
    INDEPENDENT_MODE
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case SHARE_MODE => 0i32
                case INDEPENDENT_MODE => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    protected static func parse(value: Int32) {
        match (value) {
            case 0 => SHARE_MODE
            case 1 => INDEPENDENT_MODE
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the interrupt types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Renderer
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Renderer"
]
public enum InterruptType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_TYPE_BEGIN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Renderer"
    ]
    INTERRUPT_TYPE_END
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case INTERRUPT_TYPE_BEGIN => 1i32
                case INTERRUPT_TYPE_END => 2i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): InterruptType {
        match (reason) {
            case 1i32 => INTERRUPT_TYPE_BEGIN
            case 2i32 => INTERRUPT_TYPE_END
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates source types.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum SourceType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_INVALID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_MIC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_VOICE_RECOGNITION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_VOICE_COMMUNICATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_VOICE_MESSAGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    SOURCE_TYPE_CAMCORDER
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SOURCE_TYPE_INVALID => -1i32
                case SOURCE_TYPE_MIC => 0i32
                case SOURCE_TYPE_VOICE_RECOGNITION => 1i32
                case SOURCE_TYPE_VOICE_COMMUNICATION => 7i32
                case SOURCE_TYPE_VOICE_MESSAGE => 10i32
                case SOURCE_TYPE_CAMCORDER => 13i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(sourceType: Int32): SourceType {
        match (sourceType) {
            case -1i32 => SOURCE_TYPE_INVALID
            case 0i32 => SOURCE_TYPE_MIC
            case 1i32 => SOURCE_TYPE_VOICE_RECOGNITION
            case 7i32 => SOURCE_TYPE_VOICE_COMMUNICATION
            case 10i32 => SOURCE_TYPE_VOICE_MESSAGE
            case 13i32 => SOURCE_TYPE_CAMCORDER
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates the stream usage.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum StreamUsage {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_UNKNOWN
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_MUSIC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_VOICE_COMMUNICATION
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_VOICE_ASSISTANT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_ALARM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_VOICE_MESSAGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_RINGTONE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_NOTIFICATION
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_ACCESSIBILITY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_MOVIE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_GAME
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_AUDIOBOOK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_NAVIGATION
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    STREAM_USAGE_VIDEO_COMMUNICATION
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case STREAM_USAGE_UNKNOWN => 0i32
                case STREAM_USAGE_MUSIC => 1i32
                case STREAM_USAGE_VOICE_COMMUNICATION => 2i32
                case STREAM_USAGE_VOICE_ASSISTANT => 3i32
                case STREAM_USAGE_ALARM => 4i32
                case STREAM_USAGE_VOICE_MESSAGE => 5i32
                case STREAM_USAGE_RINGTONE => 6i32
                case STREAM_USAGE_NOTIFICATION => 7i32
                case STREAM_USAGE_ACCESSIBILITY => 8i32
                case STREAM_USAGE_MOVIE => 10i32
                case STREAM_USAGE_GAME => 11i32
                case STREAM_USAGE_AUDIOBOOK => 12i32
                case STREAM_USAGE_NAVIGATION => 13i32
                case STREAM_USAGE_VIDEO_COMMUNICATION => 17i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(usage: Int32): StreamUsage {
        match (usage) {
            case 0i32 => STREAM_USAGE_UNKNOWN
            case 1i32 => STREAM_USAGE_MUSIC
            case 2i32 => STREAM_USAGE_VOICE_COMMUNICATION
            case 3i32 => STREAM_USAGE_VOICE_ASSISTANT
            case 4i32 => STREAM_USAGE_ALARM
            case 5i32 => STREAM_USAGE_VOICE_MESSAGE
            case 6i32 => STREAM_USAGE_RINGTONE
            case 7i32 => STREAM_USAGE_NOTIFICATION
            case 8i32 => STREAM_USAGE_ACCESSIBILITY
            case 10i32 => STREAM_USAGE_MOVIE
            case 11i32 => STREAM_USAGE_GAME
            case 12i32 => STREAM_USAGE_AUDIOBOOK
            case 13i32 => STREAM_USAGE_NAVIGATION
            case 17i32 => STREAM_USAGE_VIDEO_COMMUNICATION
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Audio concurrency mode.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioConcurrencyMode {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CONCURRENCY_DEFAULT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CONCURRENCY_MIX_WITH_OTHERS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CONCURRENCY_DUCK_OTHERS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    CONCURRENCY_PAUSE_OTHERS
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case CONCURRENCY_DEFAULT => 0i32
                case CONCURRENCY_MIX_WITH_OTHERS => 1i32
                case CONCURRENCY_DUCK_OTHERS => 2i32
                case CONCURRENCY_PAUSE_OTHERS => 3i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): AudioConcurrencyMode {
        match (reason) {
            case 0i32 => CONCURRENCY_DEFAULT
            case 1i32 => CONCURRENCY_MIX_WITH_OTHERS
            case 2i32 => CONCURRENCY_DUCK_OTHERS
            case 3i32 => CONCURRENCY_PAUSE_OTHERS
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Audio session deactivated reason.
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Audio.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Audio.Core"
]
public enum AudioSessionDeactivatedReason {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEACTIVATED_LOWER_PRIORITY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Audio.Core"
    ]
    DEACTIVATED_TIMEOUT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case DEACTIVATED_LOWER_PRIORITY => 0i32
                case DEACTIVATED_TIMEOUT => 1i32
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }

    static func parse(reason: Int32): AudioSessionDeactivatedReason {
        match (reason) {
            case 0i32 => DEACTIVATED_LOWER_PRIORITY
            case 1i32 => DEACTIVATED_TIMEOUT
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}
