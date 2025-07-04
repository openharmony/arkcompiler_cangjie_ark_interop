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

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SuspendType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ENTER_BACK_FORWARD_CACHE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ENTER_BACKGROUND
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    AUTO_CLEANUP
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case ENTER_BACK_FORWARD_CACHE => 0
            case ENTER_BACKGROUND => 1
            case AUTO_CLEANUP => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(value: Int32): SuspendType {
        match (value) {
            case 0 => ENTER_BACK_FORWARD_CACHE
            case 1 => ENTER_BACKGROUND
            case 2 => AUTO_CLEANUP
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class RectEvent {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public RectEvent(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let x: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let y: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let width: Float64,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let height: Float64
    ) {}
}

@C
struct CRectEvent {
    CRectEvent(
        let x: Float64,
        let y: Float64,
        let width: Float64,
        let height: Float64
    ) {}

    func toRectEvent(): RectEvent {
        return RectEvent(x, y, width, height)
    }
}

/**
 * AtCMediaPlayer holds all the @C functions defined by framework, that would be passed to native when initialize CJEntry.
 *
 *  when native side call cj @C functions, native must have the address of the cj function, the brutal way is using
 *  dlsym to find the address by function name, that is not convenient and not effective. so we packed all @C functions
 *  and pass them to native, then native can visit those functions both conveniently and effectively.
 */
@C
struct AtCMediaPlayer {
    let resumePlayer: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgeResumePlayer
    let suspendPlayer: CFunc<(Int64, Int32) -> Unit> = OHOSNativeMediaPlayerBridgeSuspendPlayer
    let exitFullscreen: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgeExitFullscreen
    let enterFullscreen: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgeEnterFullscreen
    let release: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgeRelease
    let setPlaybackRate: CFunc<(Int64, Float64) -> Unit> = OHOSNativeMediaPlayerBridgeSetPlaybackRate
    let setMuted: CFunc<(Int64, Bool) -> Unit> = OHOSNativeMediaPlayerBridgeSetMuted
    let setVolume: CFunc<(Int64, Float64) -> Unit> = OHOSNativeMediaPlayerBridgeSetVolume
    let seek: CFunc<(Int64, Float64) -> Unit> = OHOSNativeMediaPlayerBridgeSeek
    let pause: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgePause
    let play: CFunc<(Int64) -> Unit> = OHOSNativeMediaPlayerBridgePlay
    let updateRect: CFunc<(Int64, CRectEvent) -> Unit> = OHOSNativeMediaPlayerBridgeUpdateRect
}

func injectMediaPlayerCJFuncs(): Unit {
    WEBVIEW_LOG.info("MediaPlayerCJFuncs init begin.")
    unsafe { FfiOHOSNativeMediaPlayerBridgeRegisterCJFuncs(AtCMediaPlayer()) }
    WEBVIEW_LOG.info("MediaPlayerCJFuncs init finished.")
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public abstract class NativeMediaPlayerBridge <: FFIData {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init() {
        super()
    }
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func resumePlayer(): Unit {}
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func suspendPlayer(`type`: SuspendType): Unit {} /*cjlint-ignore !G.FUNc.02 */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func exitFullscreen(): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func enterFullscreen(): Unit {}
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func release(): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func setPlaybackRate(playbackRate: Float64): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func setMuted(muted: Bool): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func setVolume(volume: Float64): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func seek(targetTime: Float64): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func pause(): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func play(): Unit {}
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public open func updateRect(x: Float64, y: Float64, width: Float64, height: Float64): Unit {}
}

func getNmpbOrThrow(id: Int64): NativeMediaPlayerBridge {
    let mediaPlayer = FFIDataManager.getInstance().getData<NativeMediaPlayerBridge>(id)
    match (mediaPlayer) {
        case None =>
            throwNativeError("NativeMediaPlayerBridge of " + id.toString() + " does not exist!\n")
            throw NoneValueException("NativeMediaPlayerBridge of " + id.toString() + " does not exist!")
        case Some(player) => player
    }
}

@C
func OHOSNativeMediaPlayerBridgeResumePlayer(id: Int64) {
    getNmpbOrThrow(id).resumePlayer()
}

@C
func OHOSNativeMediaPlayerBridgeSuspendPlayer(id: Int64, ctype: Int32) {
    let cjType = SuspendType.parse(ctype)
    getNmpbOrThrow(id).suspendPlayer(cjType)
}

@C
func OHOSNativeMediaPlayerBridgeExitFullscreen(id: Int64) {
    getNmpbOrThrow(id).exitFullscreen()
}

@C
func OHOSNativeMediaPlayerBridgeEnterFullscreen(id: Int64) {
    getNmpbOrThrow(id).enterFullscreen()
}

@C
func OHOSNativeMediaPlayerBridgeRelease(id: Int64) {
    getNmpbOrThrow(id).release()
}

@C
func OHOSNativeMediaPlayerBridgeSetPlaybackRate(id: Int64, rate: Float64) {
    getNmpbOrThrow(id).setPlaybackRate(rate)
}

@C
func OHOSNativeMediaPlayerBridgeSetMuted(id: Int64, muted: Bool) {
    getNmpbOrThrow(id).setMuted(muted)
}

@C
func OHOSNativeMediaPlayerBridgeSetVolume(id: Int64, volume: Float64) {
    getNmpbOrThrow(id).setVolume(volume)
}

@C
func OHOSNativeMediaPlayerBridgeSeek(id: Int64, targetTime: Float64) {
    getNmpbOrThrow(id).seek(targetTime)
}

@C
func OHOSNativeMediaPlayerBridgePause(id: Int64) {
    getNmpbOrThrow(id).pause()
}

@C
func OHOSNativeMediaPlayerBridgePlay(id: Int64) {
    getNmpbOrThrow(id).play()
}

@C
func OHOSNativeMediaPlayerBridgeUpdateRect(id: Int64, cRectEvent: CRectEvent) {
    let rectEvent = cRectEvent.toRectEvent()
    getNmpbOrThrow(id).updateRect(rectEvent.x, rectEvent.y, rectEvent.width, rectEvent.height)
}
