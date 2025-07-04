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

package ohos.webview

import std.deriving.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.web.net_error_list.*

public type CreateNativeMediaPlayerCallback = (handler: NativeMediaPlayerHandler, mediaInfo: MediaInfo) -> NativeMediaPlayerBridge

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum PlaybackStatus {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PAUSED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PLAYING
    | ...

    func getValue(): Int32 {
        match (this) {
            case PAUSED => 0
            case PLAYING => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32): PlaybackStatus {
        match (code) {
            case 0 => PAUSED
            case 1 => PLAYING
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum ReadyState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HAVE_NOTHING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HAVE_METADATA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HAVE_CURRENT_DATA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HAVE_FUTURE_DATA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HAVE_ENOUGH_DATA
    | ...

    func getValue(): Int32 {
        match (this) {
            case HAVE_NOTHING => 0
            case HAVE_METADATA => 1
            case HAVE_CURRENT_DATA => 2
            case HAVE_FUTURE_DATA => 3
            case HAVE_ENOUGH_DATA => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum MediaType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    AUDIO
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    VIDEO
    | ...

    func getValue(): Int32 {
        match (this) {
            case VIDEO => 0
            case AUDIO => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32): MediaType {
        match (code) {
            case 0 => VIDEO
            case 1 => AUDIO
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum MediaError {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FORMAT_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    DECODE_ERROR
    | ...

    func getValue(): Int32 {
        match (this) {
            case NETWORK_ERROR => 1
            case FORMAT_ERROR => 2
            case DECODE_ERROR => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum NetworkState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    EMPTY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    IDLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    LOADING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_ERROR
    | ...

    func getValue(): Int32 {
        match (this) {
            case EMPTY => 0
            case IDLE => 1
            case LOADING => 2
            case NETWORK_ERROR => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum Preload {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    METADATA
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    AUTO
    | ...

    func getValue(): Int32 {
        match (this) {
            case NONE => 0
            case METADATA => 1
            case AUTO => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32): Preload {
        match (code) {
            case 0 => NONE
            case 1 => METADATA
            case 2 => AUTO
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SourceType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    URL
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    MSE
    | ...

    func getValue(): Int32 {
        match (this) {
            case URL => 0
            case MSE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(code: Int32): SourceType {
        match (code) {
            case 0 => URL
            case 1 => MSE
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class MediaInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public MediaInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let embedID: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let mediaType: MediaType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let mediaSrcList: Array<MediaSourceInfo>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let surfaceInfo: NativeMediaPlayerSurfaceInfo,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let controlsShown: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let controlList: Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let muted: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let posterUrl: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let preload: Preload,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let headers: HashMap<String, String>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let attributes: HashMap<String, String>
    ) {}
}

@C
struct CMediaSourceInfo {
    let format: CString
    let source: CString
    let `type`: Int32

    init(mediaSourceInfo: MediaSourceInfo) {
        unsafe {
            this.`type` = mediaSourceInfo.`type`.getValue()
            this.format = LibC.mallocCString(mediaSourceInfo.format)
            try {
                this.source = LibC.mallocCString(mediaSourceInfo.source)
            } catch (e: Exception) {
                LibC.free(format)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(format)
            LibC.free(source)
        }
    }

    func toMediaSourceInfoAndFree(): MediaSourceInfo {
        unsafe {
            let _format = format.toString()
            LibC.free(format)
            let _source = source.toString()
            LibC.free(source)
            let _type = SourceType.parse(`type`)
            let mediaSourceInfo = MediaSourceInfo(_format, _source, _type)
            return mediaSourceInfo
        }
    }
}

@C
struct CArrMediaSourceInfo {
    CArrMediaSourceInfo(
        let head: CPointer<CMediaSourceInfo>,
        let size: Int64
    ) {}

    func toArrayAndFree(): Array<MediaSourceInfo> {
        var arrMediaSourceInfo = Array<MediaSourceInfo>()
        arrMediaSourceInfo = unsafe { Array<MediaSourceInfo>(size, {i => head.read(i).toMediaSourceInfoAndFree()}) }
        return arrMediaSourceInfo
    }
}

@C
struct MapItem {
    let key: CString
    let value: CString

    init(Key: String, Value: String) {
        unsafe {
            this.key = LibC.mallocCString(Key)
            try {
                this.value = LibC.mallocCString(Value)
            } catch (e: Exception) {
                LibC.free(key)
                throw e
            }
        }
    }

    func free(): Unit {
        unsafe {
            LibC.free(key)
            LibC.free(value)
        }
    }
}

@C
struct ArrMapItem {
    ArrMapItem(
        let head: CPointer<MapItem>,
        let size: Int64
    ) {}

    func toHashMapAndFree(): HashMap<String, String> {
        if (head.isNull() || size == 0) {
            return HashMap<String, String>(0)
        }
        let arrMediaSourceInfo = HashMap<String, String>(size)
        for (i in 0..size) {
            unsafe {
                arrMediaSourceInfo.add(head.read(i).key.toString(), head.read(i).value.toString())
                head.read(i).free()
            }
        }
        return arrMediaSourceInfo
    }
}

@C
struct CMediaInfo {
    CMediaInfo(
        let embedID: CString,
        let mediaType: Int32,
        let mediaSrcList: CArrMediaSourceInfo,
        let surfaceInfo: CNativeMediaPlayerSurfaceInfo,
        let controlsShown: Bool,
        let controlList: CArrString,
        let muted: Bool,
        let posterUrl: CString,
        let preload: Int32,
        let headers: ArrMapItem,
        let attributes: ArrMapItem
    ) {}

    func toMediaInfoAndFree(): MediaInfo {
        unsafe {
            let _embedID = embedID.toString()
            LibC.free(embedID)
            let _mediaType = MediaType.parse(mediaType)
            let _mediaSrcList = mediaSrcList.toArrayAndFree()
            let _surfaceInfo = surfaceInfo.toNativeMediaPlayerSurfaceInfoAndFree()
            let _controlsShown = controlsShown
            var _controlList = convertAndFreeControlList(controlList)
            let _muted = muted
            let _posterUrl = posterUrl.toString()
            LibC.free(posterUrl)
            let _preload = Preload.parse(preload)
            let _headers = headers.toHashMapAndFree()
            let _attributes = attributes.toHashMapAndFree()
            return MediaInfo(_embedID, _mediaType, _mediaSrcList, _surfaceInfo, _controlsShown, _controlList, _muted,
                _posterUrl, _preload, _headers, _attributes)
        }
    }

    func convertAndFreeControlList(controlList: CArrString): Array<String> {
        var ctrlList = Array<String>()
        if (controlList.head.isNotNull()) {
            let ptr = controlList.head
            let size = controlList.size
            ctrlList = unsafe { Array<String>(size, {i => ptr.read(i).toString()}) }
            for (i in 0..size) {
                unsafe { LibC.free(ptr.read(i)) }
            }
            unsafe { LibC.free<CString>(ptr) }
        }
        return ctrlList
    }
}

@C
struct CNativeMediaPlayerSurfaceInfo {
    CNativeMediaPlayerSurfaceInfo(
        let rect: CRectEvent,
        let id: CString
    ) {}

    func toNativeMediaPlayerSurfaceInfoAndFree(): NativeMediaPlayerSurfaceInfo {
        unsafe {
            let _rect = rect.toRectEvent()
            let _id = id.toString()
            LibC.free(id)
            let nativeMediaPlayerSurfaceInfo = NativeMediaPlayerSurfaceInfo(_id, _rect)
            return nativeMediaPlayerSurfaceInfo
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class MediaSourceInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public MediaSourceInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        let format: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        let source: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        let `type`: SourceType
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class NativeMediaPlayerSurfaceInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public NativeMediaPlayerSurfaceInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        let id: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        let rect: RectEvent
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class NativeMediaPlayerHandler <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super(unsafe { FfiOHOSNmphConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Handle size of video.
     *
     * @param { Float64 } width - Width of video.
     * @param { Float64 } height - Height of video.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleVideoSizeChanged(width: Float64, height: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleVideoSizeChanged(getID(), width, height)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleVideoSizeChanged")
        }
    }

    /**
     * Handle native media player error event.
     *
     * @param { MediaError } error - Error type of native media player.
     * @param { String } errorMessage - Description of current error.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleError(error: MediaError, errorMessage: String): Unit {
        unsafe {
            let errorMessageCStr = LibC.mallocCString(errorMessage)
            let errCode = FfiOHOSNmphhandleError(getID(), error.getValue(), errorMessageCStr)
            LibC.free(errorMessageCStr)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleError")
        }
    }

    /**
     * Handle native media player seek finished state.
     *
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleSeekFinished(): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleSeekFinished(getID())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleSeekFinished")
        }
    }

    /**
     * Handle native media player seeking state.
     *
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleSeeking(): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleSeeking(getID())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleSeeking")
        }
    }

    /**
     * Handle native media player fullscreen state changed event.
     *
     * @param { Bool } fullscreen - Fullscreen state of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleFullscreenChanged(fullscreen: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleFullscreenChanged(getID(), fullscreen)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleFullscreenChanged")
        }
    }

    /**
     * Handle ready state of native media player.
     *
     * @param { ReadyState } state - Ready state of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleReadyStateChanged(state: ReadyState): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleReadyStateChanged(getID(), state.getValue())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleReadyStateChanged")
        }
    }

    /**
     * Handle network state of native media player.
     *
     * @param { NetworkState } state - Network state of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleNetworkStateChanged(state: NetworkState): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleNetworkStateChanged(getID(), state.getValue())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleNetworkStateChanged")
        }
    }

    /**
     * Handle native player ended event.
     *
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleEnded(): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleEnded(getID())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleEnded")
        }
    }

    /**
     * Handle buffered end time of media.
     *  bufferedEndTime: float
     *   value range: [0 - duration]
     *
     * @param { Float64 } bufferedEndTime - Buffered end time (in seconds) of media.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleBufferedEndTimeChanged(bufferedEndTime: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleBufferedEndTimeChanged(getID(), bufferedEndTime)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleBufferedEndTimeChanged")
        }
    }

    /**
     * Handle current playing time of media.
     *  currentPlayTime: float
     *   value range: [0 - duration]
     *
     * @param { Float64 } currentPlayTime - Current playing time (in seconds) of media.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleTimeUpdate(currentPlayTime: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleTimeUpdate(getID(), currentPlayTime)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleTimeUpdate")
        }
    }

    /**
     * Handle duration time of media.
     *  duration: float
     *   value range: [0 - infinity]
     *
     * @param { Float64 } duration - Duration time (in seconds) of media.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleDurationChanged(duration: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleDurationChanged(getID(), duration)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleDurationChanged")
        }
    }

    /**
     * Handle playback rate of native media player.
     *  playbackRate: float
     *   value range: [0 - infinity]
     *
     * @param { Float64 } playbackRate - Current playback rate of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handlePlaybackRateChanged(playbackRate: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandlePlaybackRateChanged(getID(), playbackRate)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handlePlaybackRateChanged")
        }
    }

    /**
     * Handle native media player muted status.
     *
     * @param { Bool } muted - Current mute status of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleMutedChanged(muted: Bool): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleMutedChanged(getID(), muted)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleMutedChanged")
        }
    }

    /**
     * Handle native media player volume.
     *  volume: float
     *   value range: [0 - 1.0]
     *
     * @param { number } volume - Current volume of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleVolumeChanged(volume: Float64): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleVolumeChanged(getID(), volume)
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleVolumeChanged")
        }
    }

    /**
     * Handle native media player playback status.
     *
     * @param { PlaybackStatus } status - Playback status of native media player.
     * @syscap SystemCapability.Web.Webview.Core
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func handleStatusChanged(status: PlaybackStatus): Unit {
        unsafe {
            let errCode = FfiOHOSNmphhandleStatusChanged(getID(), status.getValue())
            throwIfNotSuccess(errCode, "NativeMediaPlayerHandler", "handleStatusChanged")
        }
    }
}
