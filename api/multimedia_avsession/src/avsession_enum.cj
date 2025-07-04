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

package ohos.multimedia_avsession

import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum LoopMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    LOOP_MODE_SEQUENCE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    LOOP_MODE_SINGLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    LOOP_MODE_LIST
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    LOOP_MODE_SHUFFLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    LOOP_MODE_CUSTOM
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case LOOP_MODE_SEQUENCE => 0
                case LOOP_MODE_SINGLE => 1
                case LOOP_MODE_LIST => 2
                case LOOP_MODE_SHUFFLE => 3
                case LOOP_MODE_CUSTOM => 4
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): LoopMode {
        match (value) {
            case 0 => LOOP_MODE_SEQUENCE
            case 1 => LOOP_MODE_SINGLE
            case 2 => LOOP_MODE_LIST
            case 3 => LOOP_MODE_SHUFFLE
            case 4 => LOOP_MODE_CUSTOM
            case _ => throw IllegalArgumentException("Unsupported LoopMode")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum SkipIntervals {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SECONDS_10
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SECONDS_15
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SECONDS_30
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case SECONDS_10 => 10
                case SECONDS_15 => 15
                case SECONDS_30 => 30
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): SkipIntervals {
        match (value) {
            case 10 => SECONDS_10
            case 15 => SECONDS_15
            case 30 => SECONDS_30
            case _ => throw IllegalArgumentException("Unsupported SkipIntervals")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
]
public enum CastDisplayState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
    ]
    STATE_ON
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.ExtendedDisplayCast"
    ]
    STATE_OFF
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case STATE_OFF => 1
                case STATE_ON => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): CastDisplayState {
        match (value) {
            case 1 => STATE_OFF
            case 2 => STATE_ON
            case _ => throw IllegalArgumentException("Unsupported CastDisplayState")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum DisplayTag {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    TAG_AUDIO_VIVID | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case TAG_AUDIO_VIVID => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): DisplayTag {
        match (value) {
            case 1 => TAG_AUDIO_VIVID
            case _ => throw IllegalArgumentException("Unsupported DisplayTag")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.Bluetooth.Core"
]
public enum DeviceType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_TYPE_LOCAL
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_TYPE_TV
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_TYPE_SMART_SPEAKER
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    DEVICE_TYPE_BLUETOOTH
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case DEVICE_TYPE_LOCAL => 0
                case DEVICE_TYPE_TV => 2
                case DEVICE_TYPE_SMART_SPEAKER => 3
                case DEVICE_TYPE_BLUETOOTH => 10
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): DeviceType {
        match (value) {
            case 0 => DEVICE_TYPE_LOCAL
            case 2 => DEVICE_TYPE_TV
            case 3 => DEVICE_TYPE_SMART_SPEAKER
            case 10 => DEVICE_TYPE_BLUETOOTH
            case _ => throw IllegalArgumentException("Unsupported DeviceType")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVCastCategory {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CATEGORY_LOCAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CATEGORY_REMOTE
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case CATEGORY_LOCAL => 0
                case CATEGORY_REMOTE => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): AVCastCategory {
        match (value) {
            case 0 => CATEGORY_LOCAL
            case 1 => CATEGORY_REMOTE
            case _ => throw IllegalArgumentException("Unsupported AVCastCategory")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum ConnectionState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    STATE_CONNECTING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    STATE_CONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    STATE_DISCONNECTED
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case STATE_CONNECTING => 0
                case STATE_CONNECTED => 1
                case STATE_DISCONNECTED => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): ConnectionState {
        match (value) {
            case 0 => STATE_CONNECTING
            case 1 => STATE_CONNECTED
            case 2 => STATE_DISCONNECTED
            case _ => throw IllegalArgumentException("Unsupported ConnectionState")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum AVSessionType <: ToString {
    /**
     * @brief audio session type.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SESSION_TYPE_AUDIO
    |

        /**
         * @brief video session type.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SESSION_TYPE_VIDEO
    |

        /**
         * @brief voice call session type.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SESSION_TYPE_VOICE_CALL
    |

        /**
         * @brief video call session type.
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SESSION_TYPE_VIDEO_CALL
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case SESSION_TYPE_AUDIO => 0
                case SESSION_TYPE_VIDEO => 1
                case SESSION_TYPE_VOICE_CALL => 2
                case SESSION_TYPE_VIDEO_CALL => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func toString(): String {
        match (this) {
            case SESSION_TYPE_AUDIO => "audio"
            case SESSION_TYPE_VIDEO => "video"
            case SESSION_TYPE_VOICE_CALL => "voice_call"
            case SESSION_TYPE_VIDEO_CALL => "video_call"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum ProtocolType {
    /**
     * The default cast type "local", media can be routed on the same device,
     * including internal speakers or audio jacks on the device itself, A2DP devices.
     * @syscap SystemCapability.Multimedia.AVSession.AVCast
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    TYPE_LOCAL
    |

        /**
         * The Cast+ Stream indicating the media is presenting on a different device
         * the application need get an AVCastController to control remote playback.
         * @syscap SystemCapability.Multimedia.AVSession.AVCast
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    TYPE_CAST_PLUS_STREAM
    |

        /**
         * The DLNA type indicates the device supports DLNA protocol,
         * the application needs to get an AVCastController to control remote playback.
         * @syscap SystemCapability.Multimedia.AVSession.AVCast
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    TYPE_DLNA
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case TYPE_LOCAL => 0
                case TYPE_CAST_PLUS_STREAM => 2
                case TYPE_DLNA => 4
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected static func parse(value: Int32): ProtocolType {
        match (value) {
            case 0 => TYPE_LOCAL
            case 2 => TYPE_CAST_PLUS_STREAM
            case 4 => TYPE_DLNA
            case _ =>
                LOGGER.debug("Unsupported ProtocolType value:" + value.toString())
                throw IllegalArgumentException("Unsupported ProtocolType")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVPlaybackStateFilter <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_STATE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_SPEED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_POSITION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_BUFFERED_TIME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_LOOP_MODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_IS_FAVORITE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_ACTIVE_ITEM_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_VOLUME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_MAX_VOLUME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_MUTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_DURATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_VIDEO_WIDTH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_VIDEO_HEIGHT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_KEY_EXTRAS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    FILTER_ALL
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case FILTER_KEY_STATE => 0
                case FILTER_KEY_SPEED => 1
                case FILTER_KEY_POSITION => 2
                case FILTER_KEY_BUFFERED_TIME => 3
                case FILTER_KEY_LOOP_MODE => 4
                case FILTER_KEY_IS_FAVORITE => 5
                case FILTER_KEY_ACTIVE_ITEM_ID => 6
                case FILTER_KEY_VOLUME => 7
                case FILTER_KEY_MAX_VOLUME => 8
                case FILTER_KEY_MUTED => 10
                case FILTER_KEY_DURATION => 11
                case FILTER_KEY_VIDEO_WIDTH => 12
                case FILTER_KEY_VIDEO_HEIGHT => 13
                case FILTER_KEY_EXTRAS => 14
                case FILTER_ALL => 15
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func toString(): String {
        match (this) {
            case FILTER_KEY_STATE => "state"
            case FILTER_KEY_SPEED => "speed"
            case FILTER_KEY_POSITION => "position"
            case FILTER_KEY_BUFFERED_TIME => "bufferedTime"
            case FILTER_KEY_LOOP_MODE => "loopMode"
            case FILTER_KEY_IS_FAVORITE => "isFavorite"
            case FILTER_KEY_ACTIVE_ITEM_ID => "activeItemId"
            case FILTER_KEY_VOLUME => "volume"
            case FILTER_KEY_MAX_VOLUME => "maxVolume"
            case FILTER_KEY_MUTED => "muted"
            case FILTER_KEY_DURATION => "duration"
            case FILTER_KEY_VIDEO_WIDTH => "videoWidth"
            case FILTER_KEY_VIDEO_HEIGHT => "videoHeight"
            case FILTER_KEY_EXTRAS => "extras"
            case FILTER_ALL => "all"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum AVSessionEventType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Play
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Pause
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Stop
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PlayNext
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PlayPrevious
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    FastForward
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Rewind
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PlayFromAssetId
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Seek
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SetSpeed
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SetLoopMode
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    ToggleFavorite
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    SkipToQueueItem
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    HandleKeyEvent
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    OutputDeviceChange
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    CommonCommand
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    Answer
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    HangUp
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    ToggleCallMute
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    CastDisplayChange
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public override func toString(): String {
        return match (this) {
            case Play => "play"
            case Pause => "pause"
            case Stop => "stop"
            case PlayNext => "playNext"
            case PlayPrevious => "playPrevious"
            case FastForward => "fastForward"
            case Rewind => "rewind"
            case PlayFromAssetId => "playFromAssetId"
            case Seek => "seek"
            case SetSpeed => "setSpeed"
            case SetLoopMode => "setLoopMode"
            case ToggleFavorite => "toggleFavorite"
            case SkipToQueueItem => "skipToQueueItem"
            case HandleKeyEvent => "handleKeyEvent"
            case OutputDeviceChange => "outputDeviceChange"
            case CommonCommand => "commonCommand"
            case Answer => "answer"
            case HangUp => "hangUp"
            case ToggleCallMute => "toggleCallMute"
            case CastDisplayChange => "castDisplayChange"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true
]
public enum AVCastControllerEventType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_PLAYBACK_STATE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_MEDIA_ITEM_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    CAST_CONTROLLER_PLAY_NEXT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    CAST_CONTROLLER_PLAY_PREVIOUS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_REQUEST_PLAY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_END_OF_STREAM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_SEEK_DONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_VALID_COMMAND_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    CAST_CONTROLLER_KEY_REQUEST
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    public override func toString(): String {
        match (this) {
            case CAST_CONTROLLER_PLAYBACK_STATE_CHANGE => "playbackStateChange"
            case CAST_CONTROLLER_MEDIA_ITEM_CHANGE => "mediaItemChange"
            case CAST_CONTROLLER_PLAY_NEXT => "playNext"
            case CAST_CONTROLLER_PLAY_PREVIOUS => "playPrevious"
            case CAST_CONTROLLER_REQUEST_PLAY => "requestPlay"
            case CAST_CONTROLLER_END_OF_STREAM => "endOfStream"
            case CAST_CONTROLLER_SEEK_DONE => "seekDone"
            case CAST_CONTROLLER_VALID_COMMAND_CHANGE => "validCommandChange"
            case CAST_CONTROLLER_ERROR => "error"
            case CAST_CONTROLLER_KEY_REQUEST => "keyRequest"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true
]
public enum AVSessionControllerEventType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_SESSION_DESTROY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_PLAYBACK_STATE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_META_DATA_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_ACTIVE_STATE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    EVENT_VALID_COMMAND_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_OUTPUT_DEVICE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_SESSION_EVENT_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_QUEUE_ITEMS_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_QUEUE_TITLE_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_EXTRAS_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    EVENT_AVCALL_META_DATA_CHANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    EVENT_AVCALL_STATE_CHANGE
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true
    ]
    public override func toString(): String {
        return match (this) {
            case EVENT_SESSION_DESTROY => "sessionDestroy"
            case EVENT_PLAYBACK_STATE_CHANGE => "playbackStateChange"
            case EVENT_META_DATA_CHANGE => "metaDataChange"
            case EVENT_ACTIVE_STATE_CHANGE => "activeStateChange"
            case EVENT_VALID_COMMAND_CHANGE => "validCommandChange"
            case EVENT_OUTPUT_DEVICE_CHANGE => "outputDeviceChange"
            case EVENT_SESSION_EVENT_CHANGE => "sessionEventChange"
            case EVENT_QUEUE_ITEMS_CHANGE => "queueItemsChange"
            case EVENT_QUEUE_TITLE_CHANGE => "queueTitleChange"
            case EVENT_EXTRAS_CHANGE => "extrasChange"
            case EVENT_AVCALL_META_DATA_CHANGE => "avcallMetaDataChange"
            case EVENT_AVCALL_STATE_CHANGE => "avcallStateChange"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum KeyOfCallMetadata {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    KEY_OF_CALLMETADATA_NAME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    KEY_OF_CALLMETADATA_PHONENUMBER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    KEY_OF_CALLMETADATA_AVATAR
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func toString(): String {
        return match (this) {
            case KEY_OF_CALLMETADATA_NAME => "keyOfCallMetadataName"
            case KEY_OF_CALLMETADATA_PHONENUMBER => "keyOfCallmetadataPhonenumber"
            case KEY_OF_CALLMETADATA_AVATAR => "keyOfCallmetadataAvatar"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected func getValue(): Int32 {
        return match (this) {
            case KEY_OF_CALLMETADATA_NAME => CALLMETADATA_NAME
            case KEY_OF_CALLMETADATA_PHONENUMBER => CALLMETADATA_PHONENUMBER
            case KEY_OF_CALLMETADATA_AVATAR => CALLMETADATA_AVATAR
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum KeyOfCallState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    KEY_OF_CALLSTATE_STATE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    KEY_OF_CALLSTATE_MUTED
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func toString(): String {
        return match (this) {
            case KEY_OF_CALLSTATE_STATE => "keyOfCallStateState"
            case KEY_OF_CALLSTATE_MUTED => "keyOfCallStateMuted"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected func getValue(): Int32 {
        return match (this) {
            case KEY_OF_CALLSTATE_STATE => 0
            case KEY_OF_CALLSTATE_MUTED => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.AVCast"
]
public enum KeyOfPlaybackState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_STATE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_SPEED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_POSITION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_BUFFERED_TIME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_LOOP_MODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_IS_FAVORITE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_ACTIVE_ITEM_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_VOLUME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_MAX_VOLUME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_MUTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_DURATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_VIDEO_WIDTH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_VIDEO_HEIGHT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    PLAYBACK_KEY_EXTRAS
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.AVCast"
    ]
    public func toString(): String {
        return match (this) {
            case PLAYBACK_KEY_STATE => "playbackKeyState"
            case PLAYBACK_KEY_SPEED => "playbackKeySpeed"
            case PLAYBACK_KEY_POSITION => "playbackKeyPosition"
            case PLAYBACK_KEY_BUFFERED_TIME => "playbackKeyBufferedTime"
            case PLAYBACK_KEY_LOOP_MODE => "playbackKeyLoopMode"
            case PLAYBACK_KEY_IS_FAVORITE => "playbackKeyIsFavorite"
            case PLAYBACK_KEY_ACTIVE_ITEM_ID => "playbackKeyActiveItemId"
            case PLAYBACK_KEY_VOLUME => "playbackKeyVolume"
            case PLAYBACK_KEY_MAX_VOLUME => "playbackKeyMaxVolume"
            case PLAYBACK_KEY_MUTED => "playbackKeyMuted"
            case PLAYBACK_KEY_DURATION => "playbackKeyDuration"
            case PLAYBACK_KEY_VIDEO_WIDTH => "playbackKeyVideoWidth"
            case PLAYBACK_KEY_VIDEO_HEIGHT => "playbackKeyVideoHeight"
            case PLAYBACK_KEY_EXTRAS => "playbackKeyExtras"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected func getValue(): Int32 {
        return match (this) {
            case PLAYBACK_KEY_STATE => 0
            case PLAYBACK_KEY_SPEED => 1
            case PLAYBACK_KEY_POSITION => 2
            case PLAYBACK_KEY_BUFFERED_TIME => 3
            case PLAYBACK_KEY_LOOP_MODE => 4
            case PLAYBACK_KEY_IS_FAVORITE => 5
            case PLAYBACK_KEY_ACTIVE_ITEM_ID => 6
            case PLAYBACK_KEY_VOLUME => 7
            case PLAYBACK_KEY_MAX_VOLUME => 8
            case PLAYBACK_KEY_MUTED => 9
            case PLAYBACK_KEY_DURATION => 10
            case PLAYBACK_KEY_VIDEO_WIDTH => 11
            case PLAYBACK_KEY_VIDEO_HEIGHT => 12
            case PLAYBACK_KEY_EXTRAS => 13
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum KeyOfMetaData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_ASSET_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_TITLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_ARTIST
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_AUTHOR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_AVQUEUE_NAME
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_AVQUEUE_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_AVQUEUE_IMAGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_AVQUEUE_IMAGE_URI
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_ALBUM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_WRITER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_COMPOSER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_DURATION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_MEDIA_IMAGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_MEDIA_IMAGE_URI
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_PUBLISH_DATE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_SUBTITLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_DESCRIPTION
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_LYRIC
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_PREVIOUS_ASSET_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_NEXT_ASSET_ID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_SKIP_INTERVALS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_FILTER
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_DISPLAY_TAGS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    META_KEY_DRM_SCHEMES
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public func toString(): String {
        return match (this) {
            case META_KEY_ASSET_ID => "metaKeyAssetId"
            case META_KEY_TITLE => "metaKeyTitle"
            case META_KEY_ARTIST => "metaKeyArtist"
            case META_KEY_AUTHOR => "metaKeyAuthor"
            case META_KEY_AVQUEUE_NAME => "metaKeyAvqueueName"
            case META_KEY_AVQUEUE_ID => "metaKeyAvqueueId"
            case META_KEY_AVQUEUE_IMAGE => "metaKeyAvqueueImage"
            case META_KEY_AVQUEUE_IMAGE_URI => "metaKeyAvqueueImageUri"
            case META_KEY_ALBUM => "metaKeyAlbum"
            case META_KEY_WRITER => "metaKeyWriter"
            case META_KEY_COMPOSER => "metaKeyComposer"
            case META_KEY_DURATION => "metaKeyDuration"
            case META_KEY_MEDIA_IMAGE => "metaKeyMediaImage"
            case META_KEY_MEDIA_IMAGE_URI => "metaKeyMediaImageUri"
            case META_KEY_PUBLISH_DATE => "metaKeyPublishDate"
            case META_KEY_SUBTITLE => "metaKeySubtitle"
            case META_KEY_DESCRIPTION => "metaKeyDescription"
            case META_KEY_LYRIC => "metaKeyLyric"
            case META_KEY_PREVIOUS_ASSET_ID => "metaKeyPreviousAssetId"
            case META_KEY_NEXT_ASSET_ID => "metaKeyNextAssetId"
            case META_KEY_SKIP_INTERVALS => "metaKeySkipIntervals"
            case META_KEY_FILTER => "metaKeyFilter"
            case META_KEY_DISPLAY_TAGS => "metaKeyDisplayTags"
            case META_KEY_DRM_SCHEMES => "metaKeyDrmSchemes"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected func getValue(): Int32 {
        return match (this) {
            case META_KEY_ASSET_ID => 0
            case META_KEY_TITLE => 1
            case META_KEY_ARTIST => 2
            case META_KEY_AUTHOR => 3
            case META_KEY_AVQUEUE_NAME => 4
            case META_KEY_AVQUEUE_ID => 5
            case META_KEY_AVQUEUE_IMAGE => 6
            case META_KEY_AVQUEUE_IMAGE_URI => 7
            case META_KEY_ALBUM => 8
            case META_KEY_WRITER => 9
            case META_KEY_COMPOSER => 10
            case META_KEY_DURATION => 11
            case META_KEY_MEDIA_IMAGE => 12
            case META_KEY_MEDIA_IMAGE_URI => 13
            case META_KEY_PUBLISH_DATE => 14
            case META_KEY_SUBTITLE => 15
            case META_KEY_DESCRIPTION => 16
            case META_KEY_LYRIC => 17
            case META_KEY_PREVIOUS_ASSET_ID => 18
            case META_KEY_NEXT_ASSET_ID => 19
            case META_KEY_SKIP_INTERVALS => 20
            case META_KEY_FILTER => 21
            case META_KEY_DISPLAY_TAGS => 22
            case META_KEY_DRM_SCHEMES => 23
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
