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

package ohos.multimedia_media

import ohos.ffi.*
import ohos.hilog.HilogChannel
import ohos.base.*
import ohos.multimedia.audio.*
import std.deriving.*
import std.collection.*
import ohos.image.PixelMap
import ohos.labels.APILevel

const LOG_CORE: UInt32 = 3
const LOG_DOMAIN_PLAYER: UInt32 = 0xD002B2B
const MEDIA_MEMORY_ERROR: Int32 = 5400101
let AV_PLAYER_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_PLAYER, "CJ-AVPlayer")
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (5400101, "No memory."),
        (5400102, "Operation not allowed."),
        (5400103, "I/O error."),
        (5400104, "Operation timeout."),
        (5400105, "Service died."),
        (5400106, "Unsupported format."),
        (5400107, "Audio interrupted."),
        (5411001, "Can not find host."),
        (5411002, "Connection time out."),
        (5411003, "NetWork abnormal."),
        (5411004, "NetWork unavailable."),
        (5411005, "No permission."),
        (5411006, "Network access denied."),
        (5411007, "Cannot find available network resources."),
        (5411008, "SSL client cert needed."),
        (5411009, "SSL connection failed."),
        (5411010, "SSL server cert needed."),
        (5411011, "Unsupportted request.")
    ]
)

/**
 * Provides the container definition for media description key-value pairs.
 *
 * @typedef MediaDescription
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
public type MediaDescription = HashMap<String, ValueType>

/**
 * Provides player statistic info.
 *
 * @typedef PlaybackInfo
 * @syscap SystemCapability.Multimedia.Media.Core
 */
public type PlaybackInfo = HashMap<PlaybackInfoKey, ValueType>

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error"
    }
}

func throwIfNotSuccess(code: Int32, className: String, funcName: String): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(code, "${className} ${funcName} failed: ${getErrorMsg(code)}")
    }
}

/**
 * Media file descriptor. The caller needs to ensure that the fd is valid and
 * the offset and length are correct.
 *
 * @typedef AVFileDescriptor
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class AVFileDescriptor {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public AVFileDescriptor(
        /**
         * The file descriptor of audio or video source from file system. The caller
         * is responsible to close the file descriptor.
         * @type { Int32 }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var fd: Int32,
        /**
         * The offset into the file where the data to be read, in bytes. By default,
         * the offset is zero.
         * @type { ?Int64 }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var offset: ?Int64,
        /**
         * The length in bytes of the data to be read. By default, the length is the
         * rest of bytes in the file from the offset.
         * @type { ?Int64 }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var length: ?Int64
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public init(fd: Int32) {
        this.fd = fd
        this.offset = None
        this.length = None
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public class PixelMapParams {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public PixelMapParams(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
        ]
        public var width: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
        ]
        public var height: Int32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVPlayer"
]
public enum AVPlayerCallbackType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    StateChange
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AVError
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    SeekDone
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    SpeedDone
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    BitrateDone
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AvailableBitrates
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    VolumeChange
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    EndOfStream
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    TimeUpdate
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    DurationUpdate
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    BufferingUpdate
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    StartRenderFrame
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    VideoSizeChange
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AudioInterrupt
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AudioOutputDeviceChangeWithInfo
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    SubtitleUpdate
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    TrackChange
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    TrackInfoUpdate
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AmplitudeUpdate
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func toString(): String {
        match (this) {
            case StateChange => "stateChange"
            case AVError => "error"
            case SeekDone => "seekDone"
            case SpeedDone => "speedDone"
            case BitrateDone => "bitrateDone"
            case AvailableBitrates => "availableBitrates"
            case VolumeChange => "volumeChange"
            case EndOfStream => "endOfStream"
            case TimeUpdate => "timeUpdate"
            case DurationUpdate => "durationUpdate"
            case BufferingUpdate => "bufferingUpdate"
            case StartRenderFrame => "startRenderFrame"
            case VideoSizeChange => "videoSizeChange"
            case AudioInterrupt => "audioInterrupt"
            case AudioOutputDeviceChangeWithInfo => "audioOutputDeviceChangeWithInfo"
            case SubtitleUpdate => "subtitleUpdate"
            case TrackChange => "trackChange"
            case TrackInfoUpdate => "trackInfoUpdate"
            case AmplitudeUpdate => "amplitudeUpdate"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the OnStateChange callback.
 *
 * @typedef { function } OnAVPlayerStateChangeHandle
 * @param { AVPlayerState } state - state for AVPlayer.
 * @param { StateChangeReason } reason - reason for state change.
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
public type OnAVPlayerStateChangeHandle = Callback2Argument<AVPlayerState, StateChangeReason>

/**
 * Defines the OnBufferingUpdateHandler callback.
 *
 * @typedef { function } OnBufferingUpdateHandler
 * @param { BufferingInfoType } infoType - define the Buffering info Type.
 * @param { Int32 } value - define the value of buffering info type if exist.
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
public type OnBufferingUpdateHandler = Callback2Argument<BufferingInfoType, Int32>

/**
 * Defines the OnVideoSizeChangeHandler callback.
 *
 * @typedef { function } OnVideoSizeChangeHandler
 * @param { Int32 } width - Value of video Width.
 * @param { Int32 } height - Value of video Height.
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
public type OnVideoSizeChangeHandler = Callback2Argument<Int32, Int32>

/**
 * Define the TrackChange Event callback.
 * @typedef { function } OnTrackChangeHandler
 * @param { Int32 } index - index number for change Track.
 * @param { Bool } isSelected - Target index number for moving elements.
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @atomicservice
 */
public type OnTrackChangeHandler = Callback2Argument<Int32, Bool>

/**
 * Enumerates buffering info type, for network playback.
 *
 * @enum { BufferingInfoType }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum BufferingInfoType {
    /**
     * begin to buffering
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BUFFERING_START
    |
        /**
         * end to buffering
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BUFFERING_END
    |
        /**
         * buffering percent
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BUFFERING_PERCENT
    |
        /**
         * cached duration in milliseconds
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CACHED_DURATION
    | ...

    static func parse(value: Int32) {
        match (value) {
            case 1 => BUFFERING_START
            case 2 => BUFFERING_END
            case 3 => BUFFERING_PERCENT
            case 4 => CACHED_DURATION
            case _ => throw IllegalArgumentException("BufferingInfoType: unknown value ${value}")
        }
    }
}

/**
 * Describes AVPlayer states.
 * @typedef {'idle' | 'initialized' | 'prepared' | 'playing' | 'paused' | 'completed' | 'stopped' | 'released' | 'error'}
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVPlayer"
]
public enum AVPlayerState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Idle
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Initialized
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Prepared
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Playing
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Paused
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Completed
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Stopped
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    Released
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    AVError
    | ...

    static func parse(value: String) {
        match (value) {
            case "idle" => Idle
            case "initialized" => Initialized
            case "prepared" => Prepared
            case "playing" => Playing
            case "paused" => Paused
            case "completed" => Completed
            case "stopped" => Stopped
            case "released" => Released
            case "error" => AVError
            case _ => throw IllegalArgumentException("AVPlayerState: unknown value ${value}.")
        }
    }
}

/**
 * Enumerates state change reason.
 *
 * @enum { StateChangeReason }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum StateChangeReason {
    /**
     * State changed by user operation.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    USER
    |
        /**
         * State changed by background action.
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BACKGROUND
    | ...

    static func parse(value: Int32) {
        match (value) {
            case 1 => USER
            case 2 => BACKGROUND
            case _ => throw IllegalArgumentException("StateChangeReason: unknown value ${value}.")
        }
    }
}

/**
 * Provides subtitle information.
 * Can be synchronized to the time reported by AVPlayer#timeUpdate event
 *
 * @typedef SubtitleInfo
 * @syscap SystemCapability.Multimedia.Media.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class SubtitleInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public SubtitleInfo(
        /**
         * Duration of the text to be displayed, as milliseconds.
         * @type { Int32 }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var duration!: Int32 = -1,
        /**
         * Display start time of the text, as milliseconds.
         * @type { Int32 }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var startTime!: Int32 = -1,
        /**
         * Text information of current update event.
         * @type { String }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var text!: String = ""
    ) {}
}

/**
 * Enumerates seek mode.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum SeekMode {
    /**
     * seek to the next sync frame of the given timestamp
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SEEK_NEXT_SYNC
    |
        /**
         * seek to the previous sync frame of the given timestamp
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SEEK_PREV_SYNC
    |
        /**
         * Seek to the closest frame of the given timestamp.
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SEEK_CLOSEST
    | ...

    func getValue(): Int32 {
        match (this) {
            case SEEK_NEXT_SYNC => 0
            case SEEK_PREV_SYNC => 1
            case SEEK_CLOSEST => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates video scale type.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.VideoPlayer
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
]
public enum VideoScaleType {
    /**
     * The content is stretched to the fit the display surface rendering area. When
     * the aspect ratio of the content is not same as the display surface, the aspect
     * of the content is not maintained. This is the default scale type.
     * @syscap SystemCapability.Multimedia.Media.VideoPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    VIDEO_SCALE_TYPE_FIT
    |
        /**
         * The content is stretched to the fit the display surface rendering area. When
         * the aspect ratio of the content is not the same as the display surface, content's
         * aspect ratio is maintained and the content is cropped to fit the display surface.
         * @syscap SystemCapability.Multimedia.Media.VideoPlayer
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    VIDEO_SCALE_TYPE_FIT_CROP
    | ...

    static func parse(value: Int32) {
        match (value) {
            case 0 => VIDEO_SCALE_TYPE_FIT
            case 1 => VIDEO_SCALE_TYPE_FIT_CROP
            case _ => throw IllegalArgumentException("VideoScaleType: unknown value ${value}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case VIDEO_SCALE_TYPE_FIT => 0
            case VIDEO_SCALE_TYPE_FIT_CROP => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true
]
public enum ValueType {
    @!APILevel[
        19,
        stagemodelonly: true
    ]
    INT(Int32)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    INT64(Int64)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    DOUBLE(Float64)
    | @!APILevel[
        19,
        stagemodelonly: true
    ]
    STRING(String)
    | ...
}

/**
 * Enumerates media data type.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum MediaType <: ToString {
    /**
     * track is audio.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    MEDIA_TYPE_AUD
    |
        /**
         * track is video.
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    MEDIA_TYPE_VID
    |
        /**
         * Track is subtitle.
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    MEDIA_TYPE_SUBTITLE
    | ...

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func get(): Int32 {
        match (this) {
            case MEDIA_TYPE_AUD => 0
            case MEDIA_TYPE_VID => 1
            case MEDIA_TYPE_SUBTITLE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): MediaType {
        match (val) {
            case 0 => MEDIA_TYPE_AUD
            case 1 => MEDIA_TYPE_VID
            case 2 => MEDIA_TYPE_SUBTITLE
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?Int32): ?MediaType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case MEDIA_TYPE_AUD => "MEDIA_TYPE_AUD"
            case MEDIA_TYPE_VID => "MEDIA_TYPE_VID"
            case MEDIA_TYPE_SUBTITLE => "MEDIA_TYPE_SUBTITLE"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Provides preferred playback settings for player.
 *
 * @typedef PlaybackStrategy
 * @syscap SystemCapability.Multimedia.Media.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class PlaybackStrategy {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public PlaybackStrategy(
        /**
         * Choose a stream with width close to it.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredWidth!: UInt32 = 0,
        /**
         * Choose a stream with height close to it.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredHeight!: UInt32 = 0,
        /**
         * Choose a preferred buffer duration.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredBufferDuration!: UInt32 = 0,
        /**
         * If true, the player should choose HDR stream if exist.
         * @type { ?boolean }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredHdr!: Bool = false,
        /**
         * mute the specified media stream when playing.
         * @type { ?MediaType }
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var mutedMediaType!: ?MediaType = None, // will pass 3 to C
        /**
         * Audio language.
         * @type { ?string }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredAudioLanguage!: String = "",
        /**
         * Subtitle language.
         * @type { ?string }
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var preferredSubtitleLanguage!: String = ""
    ) {}

    unsafe func toCPlaybackStrategy(): CPlaybackStrategy {
        var cPlaybackStrategy = CPlaybackStrategy.DEFAULT
        cPlaybackStrategy.preferredWidth = preferredWidth
        cPlaybackStrategy.preferredHeight = preferredHeight
        cPlaybackStrategy.preferredBufferDuration = preferredBufferDuration
        cPlaybackStrategy.preferredHdr = preferredHdr
        if (let Some(v) <- mutedMediaType) {
            cPlaybackStrategy.mutedMediaType = v.get()
        }
        try {
            cPlaybackStrategy.preferredAudioLanguage = LibC.mallocCString(preferredAudioLanguage)
            cPlaybackStrategy.preferredSubtitleLanguage = LibC.mallocCString(preferredAudioLanguage)
        } catch (e: Exception) {
            cPlaybackStrategy.free()
            throw e
        }
        return cPlaybackStrategy
    }
}
/**
 * Enumerates media description key.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class MediaDescriptionKey {
    MediaDescriptionKey(let key: String) {}
    /**
     * key for track index, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_TRACK_INDEX: String = "track_index"
    /**
     * key for track type, value type is number, see @MediaType.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_TRACK_TYPE: String = "track_type"
    /**
     * key for codec mime type, value type is string.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_CODEC_MIME: String = "codec_mime"
    /**
     * key for duration, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_DURATION: String = "duration"
    /**
     * key for bitrate, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_BITRATE: String = "bitrate"
    /**
     * key for video width, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_WIDTH: String = "width"
    /**
     * key for video height, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_HEIGHT: String = "height"
    /**
     * key for video frame rate, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_FRAME_RATE: String = "frame_rate"
    /**
     * key for audio channel count, value type is number
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_AUD_CHANNEL_COUNT: String = "channel_count"
    /**
     * key for audio sample rate, value type is number
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_AUD_SAMPLE_RATE: String = "sample_rate"
    /**
     * key for audio bit depth, value type is number
     * @syscap SystemCapability.Multimedia.Media.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_AUD_SAMPLE_DEPTH: String = "sample_depth"
    /**
     * Key for language.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_LANGUAGE: String = "language"
    /**
     * Key for track name, value is string.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_TRACK_NAME: String = "track_name"
    /**
     * Key for video hdr type, value type is number.
     * @syscap SystemCapability.Multimedia.Media.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public static const MD_KEY_HDR_TYPE: String = "hdr_type"
}

/**
 * Enumerates statistics info keys for player.
 *
 * @enum { string }
 * @syscap SystemCapability.Multimedia.Media.Core
 */
@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum PlaybackInfoKey <: ToString & Hashable {
    /**
     * IP address of current network stream.
     * @syscap SystemCapability.Multimedia.Media.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SERVER_IP_ADDRESS
    |
        /**
         * Average download rate during playing except for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AVG_DOWNLOAD_RATE
    |
        /**
         * Current download rate of the last second except for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    DOWNLOAD_RATE
    |
        /**
         * Boolean value, true for current is downloading, false for suspend downloading.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    IS_DOWNLOADING
    |
        /**
         * Cached duration in milliseconds.
         * @syscap SystemCapability.Multimedia.Media.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    BUFFER_DURATION
    | ...

    static func parse(val: Int32): PlaybackInfoKey {
        match (val) {
            case 0 => SERVER_IP_ADDRESS
            case 1 => AVG_DOWNLOAD_RATE
            case 2 => DOWNLOAD_RATE
            case 3 => IS_DOWNLOADING
            case 4 => BUFFER_DURATION
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case SERVER_IP_ADDRESS => "server_ip_address"
            case AVG_DOWNLOAD_RATE => "average_download_rate"
            case DOWNLOAD_RATE => "download_rate"
            case IS_DOWNLOADING => "is_downloading"
            case BUFFER_DURATION => "buffer_duration"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func hashCode(): Int64 {
        return this.toString().hashCode()
    }
}

/**
 * Enumerates switch mode.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum SwitchMode <: ToString {
    /**
     * switch to the next sync frame of the given timestamp
     * @syscap SystemCapability.Multimedia.Media.Core
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SMOOTH
    |
        /**
         * switch to the previous sync frame of the given timestamp
         * @syscap SystemCapability.Multimedia.Media.Core
         * @crossplatform
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    SEGMENT
    |
        /**
         * switch to the closest frame of the given timestamp.
         * @syscap SystemCapability.Multimedia.Media.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CLOSEST
    | ...

    func get(): Int32 {
        match (this) {
            case SMOOTH => 0
            case SEGMENT => 1
            case CLOSEST => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): SwitchMode {
        match (val) {
            case 0 => SMOOTH
            case 1 => SEGMENT
            case 2 => CLOSEST
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case SMOOTH => "SMOOTH"
            case SEGMENT => "SEGMENT"
            case CLOSEST => "CLOSEST"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@C
struct CUInt8Arr {
    CUInt8Arr(
        let head: CPointer<UInt8>,
        let size: Int64
    ) {}

    func toArray(): Array<UInt8> {
        let arr = ArrayList<UInt8>()
        unsafe {
            for (i in 0..size) {
                arr.add(head.read(i))
            }
        }
        arr.toArray()
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVPlayer"
]
public class AVDataSrcDescriptor {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public AVDataSrcDescriptor(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVPlayer"
        ]
        public var fileSize: Int64,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVPlayer"
        ]
        public var callback: Callback3ArgumentWithReturn<Array<UInt8>, UInt32, Int64, Int32>
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
]
public enum PlaybackSpeed {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_0_75_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_1_00_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_1_25_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_1_75_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_2_00_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_0_50_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_1_50_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_0_25_X
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.VideoPlayer"
    ]
    SPEED_FORWARD_0_125_X
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case SPEED_FORWARD_0_75_X => 0
                case SPEED_FORWARD_1_00_X => 1
                case SPEED_FORWARD_1_25_X => 2
                case SPEED_FORWARD_1_75_X => 3
                case SPEED_FORWARD_2_00_X => 4
                case SPEED_FORWARD_0_50_X => 5
                case SPEED_FORWARD_1_50_X => 6
                case SPEED_FORWARD_0_25_X => 8
                case SPEED_FORWARD_0_125_X => 9
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    protected func parse(value: Int32): PlaybackSpeed {
        match (value) {
            case 0 => SPEED_FORWARD_0_75_X
            case 1 => SPEED_FORWARD_1_00_X
            case 2 => SPEED_FORWARD_1_25_X
            case 3 => SPEED_FORWARD_1_75_X
            case 4 => SPEED_FORWARD_2_00_X
            case 5 => SPEED_FORWARD_0_50_X
            case 6 => SPEED_FORWARD_1_50_X
            case 8 => SPEED_FORWARD_0_25_X
            case 9 => SPEED_FORWARD_0_125_X
            case _ => throw IllegalArgumentException("Unsupported ValueType")
        }
    }
}

/**
 * Provides the media recorder profile definitions.
 *
 * @typedef AVRecorderProfile
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class AVRecorderProfile {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public AVRecorderProfile(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var fileFormat: ContainerFormatType,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var audioBitrate!: ?Int32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var audioChannels!: ?Int32 = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var audioCodec!: ?CodecMimeType = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var audioSampleRate!: ?Int32 = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoBitrate!: ?Int32 = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoCodec!: ?CodecMimeType = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoFrameWidth!: ?Int32 = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoFrameHeight!: ?Int32 = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoFrameRate!: ?Int32 = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var isHdr!: ?Bool = false,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var enableTemporalScale!: ?Bool = false
    ) {}
}

/**
 * Provides the media recorder configuration definitions.
 *
 * @typedef AVRecorderConfig
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public class AVRecorderConfig {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public AVRecorderConfig(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var profile: AVRecorderProfile,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var url: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var audioSourceType!: ?AudioSourceType = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var videoSourceType!: ?VideoSourceType = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var fileGenerationMode!: ?FileGenerationMode = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var metadata!: ?AVMetadata = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVRecorder"
        ]
        public var maxDuration!: ?Int32 = None
    ) {}
}

/**
 * Enumerates container format type(The abbreviation for 'container format type' is CFT).
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum ContainerFormatType <: ToString & Equatable<ContainerFormatType> {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CFT_MPEG_4
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CFT_MPEG_4A
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CFT_MP3
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    CFT_WAV
    | ...

    protected func get(): String {
        match (this) {
            case CFT_MPEG_4 => "mp4"
            case CFT_MPEG_4A => "m4a"
            case CFT_MP3 => "mp3"
            case CFT_WAV => "wav"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: String): ContainerFormatType {
        match (val) {
            case "mp4" => CFT_MPEG_4
            case "m4a" => CFT_MPEG_4A
            case "mp3" => CFT_MP3
            case "wav" => CFT_WAV
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?String): ?ContainerFormatType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        get()
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func ==(that: ContainerFormatType): Bool {
        match ((this, that)) {
            case (CFT_MPEG_4, CFT_MPEG_4) => true
            case (CFT_MPEG_4A, CFT_MPEG_4A) => true
            case (CFT_MP3, CFT_MP3) => true
            case (CFT_WAV, CFT_WAV) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func !=(that: ContainerFormatType): Bool {
        !(this == that)
    }
}

/**
 * Enumerates Codec MIME types.
 *
 * @enum { string }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum CodecMimeType <: ToString & Equatable<CodecMimeType> {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_H263
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_AVC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_MPEG2
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_MPEG4
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_VP8
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AUDIO_AAC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AUDIO_VORBIS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AUDIO_FLAC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    VIDEO_HEVC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AUDIO_MP3
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AUDIO_G711MU
    | ...

    protected func get(): String {
        match (this) {
            case VIDEO_H263 => "video/h263"
            case VIDEO_AVC => "video/avc"
            case VIDEO_MPEG2 => "video/mpeg2"
            case VIDEO_MPEG4 => "video/mp4v-es"
            case VIDEO_VP8 => "video/x-vnd.on2.vp8"
            case AUDIO_AAC => "audio/mp4a-latm"
            case AUDIO_VORBIS => "audio/vorbis"
            case AUDIO_FLAC => "audio/flac"
            case VIDEO_HEVC => "video/hevc"
            case AUDIO_MP3 => "audio/mpeg"
            case AUDIO_G711MU => "audio/g711mu"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: String): CodecMimeType {
        match (val) {
            case "video/h263" => VIDEO_H263
            case "video/avc" => VIDEO_AVC
            case "video/mpeg2" => VIDEO_MPEG2
            case "video/mp4v-es" => VIDEO_MPEG4
            case "video/x-vnd.on2.vp8" => VIDEO_VP8
            case "audio/mp4a-latm" => AUDIO_AAC
            case "audio/vorbis" => AUDIO_VORBIS
            case "audio/flac" => AUDIO_FLAC
            case "video/hevc" => VIDEO_HEVC
            case "audio/mpeg" => AUDIO_MP3
            case "audio/g711mu" => AUDIO_G711MU
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?String): ?CodecMimeType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        get()
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func ==(that: CodecMimeType): Bool {
        match ((this, that)) {
            case (VIDEO_H263, VIDEO_H263) => true
            case (VIDEO_AVC, VIDEO_AVC) => true
            case (VIDEO_MPEG2, VIDEO_MPEG2) => true
            case (VIDEO_MPEG4, VIDEO_MPEG4) => true
            case (VIDEO_VP8, VIDEO_VP8) => true
            case (AUDIO_AAC, AUDIO_AAC) => true
            case (AUDIO_VORBIS, AUDIO_VORBIS) => true
            case (AUDIO_FLAC, AUDIO_FLAC) => true
            case (VIDEO_HEVC, VIDEO_HEVC) => true
            case (AUDIO_MP3, AUDIO_MP3) => true
            case (AUDIO_G711MU, AUDIO_G711MU) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func !=(that: CodecMimeType): Bool {
        !(this == that)
    }
}

/**
 * Enumerates audio source type for recorder.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public enum AudioSourceType <: ToString & Equatable<AudioSourceType> {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_MIC
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_VOICE_RECOGNITION
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_VOICE_MESSAGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUDIO_SOURCE_TYPE_CAMCORDER
    | ...

    protected func get(): Int32 {
        match (this) {
            case AUDIO_SOURCE_TYPE_DEFAULT => 0
            case AUDIO_SOURCE_TYPE_MIC => 1
            case AUDIO_SOURCE_TYPE_VOICE_RECOGNITION => 2
            case AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION => 7
            case AUDIO_SOURCE_TYPE_VOICE_MESSAGE => 10
            case AUDIO_SOURCE_TYPE_CAMCORDER => 13
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): AudioSourceType {
        match (val) {
            case 0 => AUDIO_SOURCE_TYPE_DEFAULT
            case 1 => AUDIO_SOURCE_TYPE_MIC
            case 2 => AUDIO_SOURCE_TYPE_VOICE_RECOGNITION
            case 7 => AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION
            case 10 => AUDIO_SOURCE_TYPE_VOICE_MESSAGE
            case 13 => AUDIO_SOURCE_TYPE_CAMCORDER
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?Int32): ?AudioSourceType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func toString(): String {
        match (this) {
            case AUDIO_SOURCE_TYPE_DEFAULT => "AUDIO_SOURCE_TYPE_DEFAULT"
            case AUDIO_SOURCE_TYPE_MIC => "AUDIO_SOURCE_TYPE_MIC"
            case AUDIO_SOURCE_TYPE_VOICE_RECOGNITION => "AUDIO_SOURCE_TYPE_VOICE_RECOGNITION"
            case AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION => "AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION"
            case AUDIO_SOURCE_TYPE_VOICE_MESSAGE => "AUDIO_SOURCE_TYPE_VOICE_MESSAGE"
            case AUDIO_SOURCE_TYPE_CAMCORDER => "AUDIO_SOURCE_TYPE_CAMCORDER"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func ==(that: AudioSourceType): Bool {
        match ((this, that)) {
            case (AUDIO_SOURCE_TYPE_DEFAULT, AUDIO_SOURCE_TYPE_DEFAULT) => true
            case (AUDIO_SOURCE_TYPE_MIC, AUDIO_SOURCE_TYPE_MIC) => true
            case (AUDIO_SOURCE_TYPE_VOICE_RECOGNITION, AUDIO_SOURCE_TYPE_VOICE_RECOGNITION) => true
            case (AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION, AUDIO_SOURCE_TYPE_VOICE_COMMUNICATION) => true
            case (AUDIO_SOURCE_TYPE_VOICE_MESSAGE, AUDIO_SOURCE_TYPE_VOICE_MESSAGE) => true
            case (AUDIO_SOURCE_TYPE_CAMCORDER, AUDIO_SOURCE_TYPE_CAMCORDER) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func !=(that: AudioSourceType): Bool {
        !(this == that)
    }
}

/**
 * Enumerates video source type for recorder.
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public enum VideoSourceType <: ToString & Equatable<VideoSourceType> {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    VIDEO_SOURCE_TYPE_SURFACE_YUV
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    VIDEO_SOURCE_TYPE_SURFACE_ES
    | ...

    protected func get(): Int32 {
        match (this) {
            case VIDEO_SOURCE_TYPE_SURFACE_YUV => 0
            case VIDEO_SOURCE_TYPE_SURFACE_ES => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): VideoSourceType {
        match (val) {
            case 0 => VIDEO_SOURCE_TYPE_SURFACE_YUV
            case 1 => VIDEO_SOURCE_TYPE_SURFACE_ES
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?Int32): ?VideoSourceType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func toString(): String {
        match (this) {
            case VIDEO_SOURCE_TYPE_SURFACE_YUV => "VIDEO_SOURCE_TYPE_SURFACE_YUV"
            case VIDEO_SOURCE_TYPE_SURFACE_ES => "VIDEO_SOURCE_TYPE_SURFACE_ES"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func ==(that: VideoSourceType): Bool {
        match ((this, that)) {
            case (VIDEO_SOURCE_TYPE_SURFACE_YUV, VIDEO_SOURCE_TYPE_SURFACE_YUV) => true
            case (VIDEO_SOURCE_TYPE_SURFACE_ES, VIDEO_SOURCE_TYPE_SURFACE_ES) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func !=(that: VideoSourceType): Bool {
        !(this == that)
    }
}

/**
 * Enumerates mode of creating recorder file
 *
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.AVRecorder
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVRecorder"
]
public enum FileGenerationMode <: ToString & Equatable<FileGenerationMode> {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    APP_CREATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    AUTO_CREATE_CAMERA_SCENE
    | ...

    protected func get(): Int32 {
        match (this) {
            case APP_CREATE => 0
            case AUTO_CREATE_CAMERA_SCENE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): FileGenerationMode {
        match (val) {
            case 0 => APP_CREATE
            case 1 => AUTO_CREATE_CAMERA_SCENE
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?Int32): ?FileGenerationMode {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public func toString(): String {
        match (this) {
            case APP_CREATE => "APP_CREATE"
            case AUTO_CREATE_CAMERA_SCENE => "AUTO_CREATE_CAMERA_SCENE"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func ==(that: FileGenerationMode): Bool {
        match ((this, that)) {
            case (APP_CREATE, APP_CREATE) => true
            case (AUTO_CREATE_CAMERA_SCENE, AUTO_CREATE_CAMERA_SCENE) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVRecorder"
    ]
    public operator override func !=(that: FileGenerationMode): Bool {
        !(this == that)
    }
}

/**
 * Provides the container definition for media meta data.
 * @typedef AVMetadata
 * @syscap SystemCapability.Multimedia.Media.AVMetadataExtractor
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
]
public class AVMetadata {
    protected AVMetadata(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var album!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var albumArtist!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var artist!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var author!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var dateTime!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var dateTimeFormat!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var composer!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var duration!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var genre!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var hasAudio!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var hasVideo!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var mimeType!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var trackCount!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var sampleRate!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var title!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var videoHeight!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var videoWidth!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var videoOrientation!: ?String = None,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var hdrType!: ?HdrType = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var location!: ?Location = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
        ]
        public var customInfo!: ?HashMap<String, String> = None
    ) {}
}

/**
 * Enumerates options about the HDR Type of the video.
 * @enum { number }
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum HdrType <: ToString & Equatable<HdrType> {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AV_HDR_TYPE_NONE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AV_HDR_TYPE_VIVID
    | ...

    protected func get(): Int32 {
        match (this) {
            case AV_HDR_TYPE_NONE => 0
            case AV_HDR_TYPE_VIVID => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): HdrType {
        match (val) {
            case 0 => AV_HDR_TYPE_NONE
            case 1 => AV_HDR_TYPE_VIVID
            case _ => throw IllegalArgumentException("Unknown value")
        }
    }

    static func tryParse(val: ?Int32): ?HdrType {
        match (val) {
            case Some(v) => parse(v)
            case None => None
        }
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case AV_HDR_TYPE_NONE => "AV_HDR_TYPE_NONE"
            case AV_HDR_TYPE_VIVID => "AV_HDR_TYPE_VIVID"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func ==(that: HdrType): Bool {
        match ((this, that)) {
            case (AV_HDR_TYPE_NONE, AV_HDR_TYPE_NONE) => true
            case (AV_HDR_TYPE_VIVID, AV_HDR_TYPE_VIVID) => true
            case _ => false
        }
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func !=(that: HdrType): Bool {
        !(this == that)
    }
}

/**
 * Provides the geographical location definitions for media resources.
 *
 * @typedef Location
 * @syscap SystemCapability.Multimedia.Media.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public class Location {
    protected Location(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var latitude: Float64,
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Media.Core"
        ]
        public var longitude: Float64
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public enum AVImageQueryOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AV_IMAGE_QUERY_NEXT_SYNC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AV_IMAGE_QUERY_PREVIOUS_SYNC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AV_IMAGE_QUERY_CLOSEST_SYNC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    AV_IMAGE_QUERY_CLOSEST
    | ...

    func getValue(): Int32 {
        match (this) {
            case AV_IMAGE_QUERY_NEXT_SYNC => 0
            case AV_IMAGE_QUERY_PREVIOUS_SYNC => 1
            case AV_IMAGE_QUERY_CLOSEST_SYNC => 2
            case AV_IMAGE_QUERY_CLOSEST => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates Media Mime types, used for MediaSource define;
 * @relation enum AVMimeTypes
 */
@!APILevel[
    20,
    atomicservice: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum AVMimeTypes <: ToString & Equatable<AVMimeTypes> {
    /**
     * Indicate current file is index file for hls Media.
     * @relation APPLICATION_M3U8 = 'application/m3u8'
     */
    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    ApplicationM3U8 | ...

    protected func get(): String {
        match (this) {
            case ApplicationM3U8 => "application/m3u8"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        get()
    }

    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func ==(that: AVMimeTypes): Bool {
        match ((this, that)) {
            case (ApplicationM3U8, ApplicationM3U8) => true
            case _ => false
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public operator override func !=(that: AVMimeTypes): Bool {
        !(this == that)
    }
}

/**
 * Enumerates ErrorCode types, return in BusinessError::code.
 * @relation enum AVErrorCode
 */
@Derive[Equatable]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    syscap: "SystemCapability.Multimedia.Media.Core"
]
public enum AVErrorCode <: ToString {
    /**
     * Operation success.
     * @relation AVERR_OK = 0
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrOk
    |
        /**
         * Permission denied.
         * @relation AVERR_NO_PERMISSION = 201
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrNoPremission
    |
        /**
         * Invalid parameter.
         * @relation AVERR_INVALID_PARAMETER = 401
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrInvalidParameter
    |
        /**
         * The api is not supported in the current version.
         * @relation AVERR_UNSUPPORT_CAPABILITY = 801
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrUnsupportCapability
    |
        /**
         * The system memory is insufficient or the number of services reaches the upper limit.
         * @relation AVERR_NO_MEMORY = 5400101
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrNoMemory
    |
        /**
         * Current status does not allow or do not have permission to perform this operation.
         * @relation AVERR_OPERATE_NOT_PERMIT = 5400102
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrOperateNotPermit
    |
        /**
         * Data flow exception information.
         * @relation AVERR_IO = 5400103
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrIo
    |
        /**
         * System or network response timeout.
         * @relation AVERR_TIMEOUT = 5400104
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrTimeout
    |
        /**
         * Service process died.
         * @relation AVERR_SERVICE_DIED = 5400105
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrServiceDied
    |
        /**
         * Unsupported media format.
         * @relation AVERR_UNSUPPORT_FORMAT = 5400106
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrUnsupportFormat
    |
        /**
         * Audio interrupted.
         * @relation AVERR_AUDIO_INTERRUPTED = 5400107
         */
        @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    AvErrAudioInterrupted
    | ...

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func get(): Int32 {
        match (this) {
            case AvErrOk => 0
            case AvErrNoPremission => 201
            case AvErrInvalidParameter => 401
            case AvErrUnsupportCapability => 801
            case AvErrNoMemory => 5400101
            case AvErrOperateNotPermit => 5400102
            case AvErrIo => 5400103
            case AvErrTimeout => 5400104
            case AvErrServiceDied => 5400105
            case AvErrUnsupportFormat => 5400106
            case AvErrAudioInterrupted => 5400107
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        syscap: "SystemCapability.Multimedia.Media.Core"
    ]
    public func toString(): String {
        match (this) {
            case AvErrOk => "AvErrOk"
            case AvErrNoPremission => "AvErrNoPremission"
            case AvErrInvalidParameter => "AvErrInvalidParameter"
            case AvErrUnsupportCapability => "AvErrUnsupportCapability"
            case AvErrNoMemory => "AvErrNoMemory"
            case AvErrOperateNotPermit => "AvErrOperateNotPermit"
            case AvErrIo => "AvErrIo"
            case AvErrTimeout => "AvErrTimeout"
            case AvErrServiceDied => "AvErrServiceDied"
            case AvErrUnsupportFormat => "AvErrUnsupportFormat"
            case AvErrAudioInterrupted => "AvErrAudioInterrupted"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
