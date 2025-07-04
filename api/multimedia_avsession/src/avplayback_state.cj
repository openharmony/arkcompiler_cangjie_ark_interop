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

import std.collection.*
import std.deriving.*
import ohos.labels.*

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public enum PlaybackState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_INITIAL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_PREPARE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_PLAY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_PAUSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_FAST_FORWARD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_REWIND
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_STOP
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_COMPLETED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_RELEASED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_IDLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    PLAYBACK_STATE_BUFFERING
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PLAYBACK_STATE_INITIAL => 0
                case PLAYBACK_STATE_PREPARE => 1
                case PLAYBACK_STATE_PLAY => 2
                case PLAYBACK_STATE_PAUSE => 3
                case PLAYBACK_STATE_FAST_FORWARD => 4
                case PLAYBACK_STATE_REWIND => 5
                case PLAYBACK_STATE_STOP => 6
                case PLAYBACK_STATE_COMPLETED => 7
                case PLAYBACK_STATE_RELEASED => 8
                case PLAYBACK_STATE_ERROR => 9
                case PLAYBACK_STATE_IDLE => 10
                case PLAYBACK_STATE_BUFFERING => 11
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): PlaybackState {
        match (value) {
            case 0 => PLAYBACK_STATE_INITIAL
            case 1 => PLAYBACK_STATE_PREPARE
            case 2 => PLAYBACK_STATE_PLAY
            case 3 => PLAYBACK_STATE_PAUSE
            case 4 => PLAYBACK_STATE_FAST_FORWARD
            case 5 => PLAYBACK_STATE_REWIND
            case 6 => PLAYBACK_STATE_STOP
            case 7 => PLAYBACK_STATE_COMPLETED
            case 8 => PLAYBACK_STATE_RELEASED
            case 9 => PLAYBACK_STATE_ERROR
            case 10 => PLAYBACK_STATE_IDLE
            case 11 => PLAYBACK_STATE_BUFFERING
            case _ => throw IllegalArgumentException("Unsupported PlaybackState")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class PlaybackPosition {
    /**
     * @brief Elapsed time(position) of this media set by the app.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public var elapsedTime: Int64

    /**
     * @brief Record the system time when elapsedTime is set.
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public var updateTime: Int64

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init(elapsedTime: Int64, updateTime: Int64) {
        this.elapsedTime = elapsedTime
        this.updateTime = updateTime
    }
}

@C
protected struct CPlaybackPosition {
    protected let elapsedTime: Int64
    protected let updateTime: Int64

    protected init(playbackPos: PlaybackPosition) {
        this(playbackPos.elapsedTime, playbackPos.updateTime)
    }

    protected init(elapsedTime: Int64, updateTime: Int64) {
        this.elapsedTime = elapsedTime
        this.updateTime = updateTime
    }

    protected func toCJObject(): PlaybackPosition {
        PlaybackPosition(elapsedTime, updateTime)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.AVSession.Core"
]
public class AVPlaybackState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public AVPlaybackState(
        /**
         * Current playback state. See {@link PlaybackState}
         * @type { ?PlaybackState }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var state: ?PlaybackState,
        /**
         * Current playback state. See {@link PlaybackState}
         * @type { ?PlaybackState }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var speed: ?Float64,
        /**
         * Current playback position of this media. See {@link PlaybackPosition}
         * @type { ?PlaybackPosition }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var position: ?PlaybackPosition,
        /**
         * The current buffered time, the maximum playable position
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var bufferedTime: ?Int64,
        /**
         * Current playback loop mode. See {@link LoopMode}
         * @type { ?LoopMode }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var loopMode: ?LoopMode,
        /**
         * Current Favorite Status
         * @type { ?boolean }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var isFavorite: ?Bool,
        /**
         * Current active item id
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var activeItemId: ?Int32,
        /**
         * Current player volume
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var volume: ?Int32,
        /**
         * maximum  volume
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var maxVolume: ?Int32,
        /**
         * Current muted status
         * @type { ?boolean }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var muted: ?Bool,
        /**
         * The duration of this media asset.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var duration: ?Int32,
        /**
         * The video width of this media asset.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var videoWidth: ?Int32,
        /**
         * The video height of this media asset.
         * @type { ?number }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var videoHeight: ?Int32,
        /**
         * Current custom media packets
         * @type { ?object }
         * @syscap SystemCapability.Multimedia.AVSession.Core
         * @atomicservice
         */
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.AVSession.Core"
        ]
        public var extras: ?HashMap<String, ValueType>
    ) {}

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.AVSession.Core"
    ]
    public init() {
        this.state = None
        this.speed = None
        this.position = None
        this.bufferedTime = None
        this.loopMode = None
        this.isFavorite = None
        this.activeItemId = None
        this.volume = None
        this.maxVolume = None
        this.muted = None
        this.duration = None
        this.videoWidth = None
        this.videoHeight = None
        this.extras = None
    }
}

@C
protected struct CAVPlaybackState {
    private var state_: Int32
    protected var speed: Float64
    protected var position: CPlaybackPosition
    protected var bufferedTime: Int64
    private var loopMode_: Int32
    protected var isFavorite: Bool
    protected var activeItemId: Int32
    protected var volume: Int32
    protected var maxVolume: Int32
    protected var muted: Bool
    protected var duration: Int32
    protected var videoWidth: Int32
    protected var videoHeight: Int32
    private var extras_: CArrParameters

    init() {
        this.state_ = PlaybackState.PLAYBACK_STATE_INITIAL.value
        this.speed = 1.0
        this.position = CPlaybackPosition(PlaybackPosition(0, 0))
        this.bufferedTime = 0
        this.loopMode_ = 0
        this.isFavorite = false
        this.activeItemId = 0
        this.volume = 0
        this.maxVolume = 0
        this.muted = false
        this.duration = 0
        this.videoWidth = 0
        this.videoHeight = 0
        this.extras_ = CArrParameters(HashMap())
    }

    protected init(avPlaybackState: AVPlaybackState) {
        this(
            avPlaybackState.state,
            avPlaybackState.speed,
            avPlaybackState.position,
            avPlaybackState.bufferedTime,
            avPlaybackState.loopMode,
            avPlaybackState.isFavorite,
            avPlaybackState.activeItemId,
            avPlaybackState.volume,
            avPlaybackState.maxVolume,
            avPlaybackState.muted,
            avPlaybackState.duration,
            avPlaybackState.videoWidth,
            avPlaybackState.videoHeight,
            avPlaybackState.extras
        )
    }

    protected init(
        state: ?PlaybackState,
        speed: ?Float64,
        position: ?PlaybackPosition,
        bufferedTime: ?Int64,
        loopMode: ?LoopMode,
        isFavorite: ?Bool,
        activeItemId: ?Int32,
        volume: ?Int32,
        maxVolume: ?Int32,
        muted: ?Bool,
        duration: ?Int32,
        videoWidth: ?Int32,
        videoHeight: ?Int32,
        extras: ?HashMap<String, ValueType>
    ) {
        state_ = state?.value ?? PlaybackState.PLAYBACK_STATE_INITIAL.value
        this.speed = speed ?? 1.0
        this.position = CPlaybackPosition(position ?? PlaybackPosition(0, 0))
        this.bufferedTime = bufferedTime ?? 0
        loopMode_ = loopMode?.value ?? 0
        this.isFavorite = isFavorite ?? false
        this.activeItemId = activeItemId ?? 0
        this.volume = volume ?? 0
        this.maxVolume = maxVolume ?? 0
        this.muted = muted ?? false
        this.duration = duration ?? 0
        this.videoWidth = videoWidth ?? 0
        this.videoHeight = videoHeight ?? 0
        extras_ = CArrParameters(extras ?? HashMap())
    }

    protected func free() {
        extras_.free()
    }

    protected mut prop state: PlaybackState {
        get() {
            PlaybackState.parse(state_)
        }
        set(value) {
            state_ = value.value
        }
    }

    protected mut prop loopMode: LoopMode {
        get() {
            LoopMode.parse(loopMode_)
        }
        set(value) {
            loopMode_ = value.value
        }
    }

    protected mut prop extras: HashMap<String, ValueType> {
        get() {
            extras_.toHashMap()
        }
        set(value) {
            extras_.free()
            extras_ = CArrParameters(value)
        }
    }

    protected func toCJObjectAndFree(): AVPlaybackState {
        try {
            AVPlaybackState(
                this.state,
                this.speed,
                this.position.toCJObject(),
                this.bufferedTime,
                this.loopMode,
                this.isFavorite,
                this.activeItemId,
                this.volume,
                this.maxVolume,
                this.muted,
                this.duration,
                this.videoWidth,
                this.videoHeight,
                this.extras,
            )
        } finally {
            free()
        }
    }

    protected func toCJObject(): AVPlaybackState {
        try {
            AVPlaybackState(
                this.state,
                this.speed,
                this.position.toCJObject(),
                this.bufferedTime,
                this.loopMode,
                this.isFavorite,
                this.activeItemId,
                this.volume,
                this.maxVolume,
                this.muted,
                this.duration,
                this.videoWidth,
                this.videoHeight,
                this.extras,
            )
        } catch (e: Exception) {
            free()
            throw e
        }
    }
}
