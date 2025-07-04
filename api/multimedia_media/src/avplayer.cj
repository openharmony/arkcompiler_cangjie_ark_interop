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

import std.deriving.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.multimedia.audio.*

foreign {
    func FfiMediaCreateAVPlayer(errCode: CPointer<Int32>): Int64

    func FfiMediaAVPlayerGetUrl(id: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAVPlayerSetUrl(id: Int64, value: CString, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetAVFileDescriptor(id: Int64, errCode: CPointer<Int32>): CAVFileDescriptor

    func FfiMediaAVPlayerSetAVFileDescriptor(id: Int64, fileDescriptor: CAVFileDescriptor, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetDataSrc(id: Int64, errCode: CPointer<Int32>): CAVDataSrcDescriptor

    func FfiMediaAVPlayerSetDataSrc(id: Int64, dataSrcDescriptor: CAVDataSrcDescriptor, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetSurfaceID(id: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAVPlayerSetSurfaceID(id: Int64, surfaceId: CString, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetLoop(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiMediaAVPlayerSetLoop(id: Int64, loop: Bool, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetVideoScaleType(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerSetVideoScaleType(id: Int64, videoScaleType: Int32, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetAudioInterruptMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerSetAudioInterruptMode(id: Int64, interruptMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetAudioRendererInfo(id: Int64, errCode: CPointer<Int32>): CAudioRendererInfo

    func FfiMediaAVPlayerSetAudioRendererInfo(id: Int64, info: CAudioRendererInfo, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetAudioEffectMode(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerSetAudioEffectMode(id: Int64, effectMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiMediaAVPlayerGetState(id: Int64, errCode: CPointer<Int32>): CString

    func FfiMediaAVPlayerGetCurrentTime(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerGetDuration(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerGetWidth(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerGetHeight(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiMediaAVPlayerPrepare(id: Int64): Int32

    func FfiMediaAVPlayerPlay(id: Int64): Int32

    func FfiMediaAVPlayerPause(id: Int64): Int32

    func FfiMediaAVPlayerStop(id: Int64): Int32

    func FfiMediaAVPlayerReset(id: Int64): Int32

    func FfiMediaAVPlayerRelease(id: Int64): Int32

    func FfiMediaAVPlayerSeek(id: Int64, time: Int32, mode: Int32): Int32

    func FfiMediaAVPlayerOnStateChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffStateChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffStateChangeAll(id: Int64): Int32

    func FfiMediaAVPlayerOnError(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffError(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffErrorAll(id: Int64): Int32

    func FfiMediaAVPlayerOnSeekDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSeekDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSeekDoneAll(id: Int64): Int32

    func FfiMediaAVPlayerOnSpeedDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSpeedDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSpeedDoneAll(id: Int64): Int32

    func FfiMediaAVPlayerOnBitRateDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffBitRateDone(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffBitRateDoneAll(id: Int64): Int32

    func FfiMediaAVPlayerOnAvailableBitrates(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAvailableBitrates(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAvailableBitratesAll(id: Int64): Int32

    func FfiMediaAVPlayerOnMediaKeySystemInfoUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffMediaKeySystemInfoUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffMediaKeySystemInfoUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnVolumeChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffVolumeChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffVolumeChangeAll(id: Int64): Int32

    func FfiMediaAVPlayerOnEndOfStream(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffEndOfStream(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffEndOfStreamAll(id: Int64): Int32

    func FfiMediaAVPlayerOnTimeUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTimeUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTimeUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnDurationUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffDurationUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffDurationUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnBufferingUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffBufferingUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffBufferingUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnStartRenderFrame(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffStartRenderFrame(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffStartRenderFrameAll(id: Int64): Int32

    func FfiMediaAVPlayerOnVideoSizeChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffVideoSizeChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffVideoSizeChangeAll(id: Int64): Int32

    func FfiMediaAVPlayerOnAudioInterrupt(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAudioInterrupt(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAudioInterruptAll(id: Int64): Int32

    func FfiMediaAVPlayerOnAudioDeviceChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAudioDeviceChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAudioDeviceChangeAll(id: Int64): Int32

    func FfiMediaAVPlayerOnSubtitleUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSubtitleUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffSubtitleUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnTrackChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTrackChange(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTrackChangeAll(id: Int64): Int32

    func FfiMediaAVPlayerOnTrackInfoUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTrackInfoUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffTrackInfoUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerOnAmplitudeUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAmplitudeUpdate(id: Int64, callbackId: Int64): Int32

    func FfiMediaAVPlayerOffAmplitudeUpdateAll(id: Int64): Int32

    func FfiMediaAVPlayerSetMediaSource(id: Int64, srcId: Int64, strategy: CPlaybackStrategy): Int32

    func FfiMediaAVPlayerSetPlaybackStrategy(id: Int64, strategy: CPlaybackStrategy): Int32

    func FfiMediaAVPlayerSetMediaMuted(id: Int64, mediaType: Int32, muted: Bool): Int32

    func FfiMediaAVPlayerGetSelectedTracks(id: Int64, errCode: CPointer<Int32>): CArrI32

    func FfiMediaAVPlayerSelectTrack(id: Int64, index: Int32, mode: Int32): Int32

    func FfiMediaAVPlayerDeselectTrack(id: Int64, index: Int32): Int32

    func FfiMediaAVPlayerSetSpeed(id: Int64, speed: Int32): Unit

    func FfiMediaAVPlayerSetBitrate(id: Int64, bitrate: Int32): Unit

    func FfiMediaAVPlayerSetVolume(id: Int64, volume: Float64): Unit

    func FfiMediaAVPlayerAddSubtitleFromFd(id: Int64, fd: Int32, offset: Int64, length: Int64): Int32

    func FfiMediaAVPlayerAddSubtitleFromUrl(id: Int64, url: CString): Int32

    func FfiMediaAVPlayerGetPlaybackInfo(id: Int64, errCode: CPointer<Int32>): CArrCPlaybackInfo

    func FfiMediaAVPlayerGetTrackDescription(id: Int64, errCode: CPointer<Int32>): CArrCMediaDescription
}

/**
 * Creates an AVPlayer instance.
 * @param { AVPlayer } callback - used to return AVPlayer instance if the operation is successful; returns null otherwise.
 * @throws { BusinessException } 5400101 - No memory. Return by callback.
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVPlayer"
]
public func createAVPlayer(): AVPlayer {
    unsafe {
        var errCode: Int32 = 0
        let id = FfiMediaCreateAVPlayer(inout errCode)
        throwIfNotSuccess(errCode, "media", "createAVPlayer")
        return AVPlayer(id)
    }
}

/**
 * Manages and plays media. Before calling an AVPlayer method, you must use createAVPlayer()
 * to create an AVPlayer instance.
 *
 * @typedef AVPlayer
 * @syscap SystemCapability.Multimedia.Media.AVPlayer
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVPlayer"
]
public class AVPlayer <: RemoteDataLite {
    let callBackMap: HashMap<String, (CallbackObject, Int64)> = HashMap<String, (CallbackObject, Int64)>()
    var dataSrcCb: Option<Callback3ArgumentWithReturn<Array<UInt8>, UInt32, Int64, Int32>> = None
    var dataSrcCbId: Int64 = 0

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Media URI. Mainstream media formats are supported.
     * Network:http://xxx
     * @type { String }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop url: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetUrl(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get url")
                let url_ = result.toString()
                LibC.free(result)
                return url_
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                let cstr = LibC.mallocCString(value)
                FfiMediaAVPlayerSetUrl(getID(), cstr, inout errCode)
                LibC.free(cstr)
                throwIfNotSuccess(errCode, "AVPlayer", "set url")
            }
        }
    }

    /**
     * Media file descriptor. Mainstream media formats are supported.
     * @type { AVFileDescriptor }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop fdSrc: AVFileDescriptor {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let fdSrc_ = FfiMediaAVPlayerGetAVFileDescriptor(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get fdSrc")
                let result = fdSrc_.toCJObject()
                return result
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                let fdSrc_ = CAVFileDescriptor(value)
                FfiMediaAVPlayerSetAVFileDescriptor(getID(), fdSrc_, inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set fdSrc")
            }
        }
    }

    /**
     * DataSource descriptor. Supports mainstream media formats.
     * @type { AVDataSrcDescriptor }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop dataSrc: AVDataSrcDescriptor {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let dataSrc_ = FfiMediaAVPlayerGetDataSrc(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get dataSrc")
                if (this.dataSrcCbId != dataSrc_.callback || this.dataSrcCb.isNone()) {
                    throw BusinessException(MEDIA_MEMORY_ERROR, "Get dataSrc failed.")
                }
                AVDataSrcDescriptor(dataSrc_.fileSize, this.dataSrcCb.getOrThrow())
            }
        }
        set(value) {
            unsafe {
                let wrapper = {
                    buffer: CArrUI8, length: UInt32, pos: Int64 =>
                    let arr = Array<UInt8>(Int64(length), repeat: 0)
                    let res = value.callback.invoke(arr, length, pos)
                    AV_PLAYER_LOG.error("setDataSrc invoke called.")
                    for (i in 0..length) {
                        buffer.head.write(Int64(i), arr[Int64(i)])
                    }
                    res
                }
                let lambdaData = Callback3Param<CArrUI8, UInt32, Int64, Int32>(wrapper)
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetDataSrc(getID(), CAVDataSrcDescriptor(value.fileSize, lambdaData.getID()),
                    inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set dataSrc")
                dataSrcCb = value.callback
                dataSrcCbId = lambdaData.getID()
            }
        }
    }

    /**
     * Video player will use this id get a surface instance.
     * @type { String }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop surfaceId: String {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetSurfaceID(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get surfaceId")
                let surfaceId_ = result.toString()
                LibC.free(result)
                return surfaceId_
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                let cstr = LibC.mallocCString(value)
                FfiMediaAVPlayerSetSurfaceID(getID(), cstr, inout errCode)
                LibC.free(cstr)
                throwIfNotSuccess(errCode, "AVPlayer", "set surfaceId")
            }
        }
    }

    /**
     * Whether to loop media playback.
     * @type { Bool }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop loop: Bool {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetLoop(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get loop")
                return result
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetLoop(getID(), value, inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set loop")
            }
        }
    }

    /**
     * Video scale type. By default, the {@link #VIDEO_SCALE_TYPE_FIT} will be used, for more
     * information, refer to {@link #VideoScaleType} .
     * @type { VideoScaleType }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop videoScaleType: VideoScaleType {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetVideoScaleType(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get videoScaleType")
                return VideoScaleType.parse(result)
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetVideoScaleType(getID(), value.getValue(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set videoScaleType")
            }
        }
    }

    /**
     * Describes audio interrupt mode, refer to {@link #audio.InterruptMode}. If it is not
     * set, the default mode will be used. Set it before calling the {@link #play()} in the
     * first time in order for the interrupt mode to become effective thereafter.
     * @type { InterruptMode }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop audioInterruptMode: InterruptMode {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetAudioInterruptMode(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get videoScaleType")
                return InterruptMode.parse(result)
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetAudioInterruptMode(getID(), value.value, inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set videoScaleType")
            }
        }
    }

    /**
     * Describes audio renderer info, refer to {@link #audio.AudioRendererInfo}. Set it before
     * calling the {@link #prepare()} in the first time in order for the audio renderer info to
     * become effective thereafter.
     * @type { AudioRendererInfo }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop audioRendererInfo: AudioRendererInfo {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetAudioRendererInfo(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get audioRendererInfo")
                return AudioRendererInfo(result)
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetAudioRendererInfo(getID(), value.toCAudioRendererInfo(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set audioRendererInfo")
            }
        }
    }

    /**
     * Obtains the current audio effect mode, refer to {@link #audio.AudioEffectMode}.
     * @type { AudioEffectMode }
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public mut prop audioEffectMode: AudioEffectMode {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetAudioEffectMode(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get audioEffectMode")
                return AudioEffectMode.parse(result)
            }
        }
        set(value) {
            unsafe {
                var errCode: Int32 = 0
                FfiMediaAVPlayerSetAudioEffectMode(getID(), value.value, inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "set audioEffectMode")
            }
        }
    }

    /**
     * Playback state.
     * @type { AVPlayerState }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public prop state: AVPlayerState {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let cstr = FfiMediaAVPlayerGetState(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get state")
                let result = cstr.toString()
                LibC.free(cstr)
                return AVPlayerState.parse(result)
            }
        }
    }

    /**
     * Current playback position.
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public prop currentTime: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetCurrentTime(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get currentTime")
                return result
            }
        }
    }

    /**
     * Playback duration, When the data source does not support seek, it returns - 1, such as a live broadcast scenario.
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public prop duration: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetDuration(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get duration")
                return result
            }
        }
    }

    /**
     * Video width, valid after prepared.
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public prop width: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetWidth(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get width")
                return result
            }
        }
    }

    /**
     * Video height, valid after prepared.
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public prop height: Int32 {
        get() {
            unsafe {
                var errCode: Int32 = 0
                let result = FfiMediaAVPlayerGetHeight(getID(), inout errCode)
                throwIfNotSuccess(errCode, "AVPlayer", "get height")
                return result
            }
        }
    }

    /**
     * Prepare audio/video playback, it will request resource for playing.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @throws { BusinessException } 5400106 - Unsupported format. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func prepare(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerPrepare(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "prepare")
    }

    /**
     * Play audio/video playback.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func play(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerPlay(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "play")
    }

    /**
     * Pause audio/video playback.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func pause(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerPause(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "pause")
    }

    /**
     * Stop audio/video playback.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func stop(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerStop(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "stop")
    }

    /**
     * Reset AVPlayer, it will to idle state and can set src again.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func reset(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerReset(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "reset")
        this.dataSrcCb = None
        this.dataSrcCbId = 0
    }

    /**
     * Releases resources used for AVPlayer.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by callback.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiMediaAVPlayerRelease(getID()) }
        throwIfNotSuccess(errCode, "AVPlayer", "release")
        this.dataSrcCb = None
        this.dataSrcCbId = 0
    }

    /**
     * Jumps to the specified playback position.
     * @param { Int32 } timeMs - Playback position to jump, should be in [0, duration].
     * @param { SeekMode } mode - See @SeekMode .
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func seek(timeMs: Int32, mode!: SeekMode = SeekMode.SEEK_PREV_SYNC): Unit {
        let errCode = unsafe { FfiMediaAVPlayerSeek(getID(), timeMs, mode.getValue()) }
        throwIfNotSuccess(errCode, "AVPlayer", "seek")
    }

    /**
     * Register listens for media playback stateChange event.
     * @param { stateChange } type - Type of the playback event to listen for.
     * @param { OnAVPlayerStateChangeHandle } callback - Callback used to listen for the playback stateChange event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: OnAVPlayerStateChangeHandle): Unit {
        match (`type`) {
            case AVPlayerCallbackType.StateChange =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        stateStr: CString, reason: Int32 => callback.invoke(AVPlayerState.parse(stateStr.toString()),
                            StateChangeReason.parse(reason))
                    }
                    let lambdaData = Callback2Param<CString, Int32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnStateChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Register listens for playback error events.
     * @param { error } type - Type of the playback error event to listen for.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to listen for the playback error event.
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 801 - Capability not supported.
     * @throws { BusinessException } 5400101 - No memory.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @throws { BusinessException } 5400104 - Time out.
     * @throws { BusinessException } 5400105 - Service died.
     * @throws { BusinessException } 5400106 - Unsupported format.
     * @throws { BusinessException } 5411001 - IO can not find host.
     * @throws { BusinessException } 5411002 - IO connection timeout.
     * @throws { BusinessException } 5411003 - IO network abnormal.
     * @throws { BusinessException } 5411004 - IO network unavailable.
     * @throws { BusinessException } 5411005 - IO no permission.
     * @throws { BusinessException } 5411006 - IO request denied.
     * @throws { BusinessException } 5411007 - IO resource not found.
     * @throws { BusinessException } 5411008 - IO SSL client cert needed.
     * @throws { BusinessException } 5411009 - IO SSL connect fail.
     * @throws { BusinessException } 5411010 - IO SSL server cert untrusted.
     * @throws { BusinessException } 5411011 - IO unsupported request.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.AVError =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {code: Int32, msg: CString => callback.invoke(BusinessException(code, msg.toString()))}
                    let lambdaData = Callback2Param<Int32, CString, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnError(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Register listens for media playback seekDone event.
     * @param { seekDone } type - Type of the playback event to listen for.
     * @param { speedDone } type - Type of the playback event to listen for.
     * @param { bitrateDone } type - Type of the playback event to listen for.
     * @param { timeUpdate } type - Type of the playback event to listen for.
     * @param { durationUpdate } type - Type of the playback event to listen for.
     * @param { Callback<Int32> } callback - Callback used to listen for the playback event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<Int32>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.SeekDone => on(`type`.toString(), callback, FfiMediaAVPlayerOnSeekDone)
            case AVPlayerCallbackType.SpeedDone => on(`type`.toString(), callback, FfiMediaAVPlayerOnSpeedDone)
            case AVPlayerCallbackType.BitrateDone => on(`type`.toString(), callback, FfiMediaAVPlayerOnBitRateDone)
            case AVPlayerCallbackType.TimeUpdate => on(`type`.toString(), callback, FfiMediaAVPlayerOnTimeUpdate)
            case AVPlayerCallbackType.DurationUpdate => on(
                `type`.toString(),
                callback,
                FfiMediaAVPlayerOnDurationUpdate
            )
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    func on(`type`: String, callback: Callback1Argument<Int32>, onFunc: CFunc<(Int64, Int64) -> Int32>) {
        if (let Some(cb) <- callBackMap.get(`type`)) {
            if (refEq(callback, cb[0])) {
                AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                return
            }
        }
        unsafe {
            let wrapper = {value: Int32 => callback.invoke(value)}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            let errCode = onFunc(getID(), lambdaData.getID())
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            callBackMap.add(`type`, (callback, lambdaData.getID()))
        }
    }

    /**
     * Register listens for available bitrate list collect completed events for HLS protocol stream playback.
     * This event will be reported after the {@link #prepare} called.
     * @param { availableBitrates } type - Type of the playback event to listen for.
     * @param { Callback<Array<Int32>> } callback - Callback used to listen for the playback event return available bitrate list.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<Array<Int32>>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.AvailableBitrates =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        arr: CArrI32 => callback.invoke(cArr2cjArr<Int32, Int32>(arr.size, arr.head) {
                            item => item
                        })
                    }
                    let lambdaData = Callback1Param<CArrI32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnAvailableBitrates(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Register listens for media playback volumeChange event.
     * @param { volumeChange } type - Type of the playback event to listen for.
     * @param { Callback<Float32> } callback - Callback used to listen for the playback volume event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<Float32>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.VolumeChange =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {volumeLevel: Float32 => callback.invoke(volumeLevel)}
                    let lambdaData = Callback1Param<Float32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnVolumeChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Register listens for media playback event.
     * @param { endOfStream } type - Type of the playback event to listen for.
     * @param { startRenderFrame } type - Type of the playback event to listen for.
     * @param { Callback0Argument } callback - Callback used to listen for the playback event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case AVPlayerCallbackType.EndOfStream => on(`type`.toString(), callback, FfiMediaAVPlayerOnEndOfStream)
            case AVPlayerCallbackType.StartRenderFrame => on(`type`.toString(), callback,
                FfiMediaAVPlayerOnStartRenderFrame)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    func on(`type`: String, callback: Callback0Argument, onFunc: CFunc<(Int64, Int64) -> Int32>) {
        if (let Some(cb) <- callBackMap.get(`type`)) {
            if (refEq(callback, cb[0])) {
                AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                return
            }
        }
        unsafe {
            let wrapper = {=> callback.invoke()}
            let lambdaData = Callback0Param<Unit>(wrapper)
            let errCode = onFunc(getID(), lambdaData.getID())
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            callBackMap.add(`type`, (callback, lambdaData.getID()))
        }
    }

    /**
     * Register listens for video playback buffering events.
     * @param { bufferingUpdate } type - Type of the playback buffering update event to listen for.
     * @param { OnBufferingUpdateHandler } callback - Callback used to listen for the buffering update event,
     * return BufferingInfoType and the value.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: OnBufferingUpdateHandler): Unit {
        match (`type`) {
            case AVPlayerCallbackType.BufferingUpdate =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        bufferingType: Int32, val: Int32 => callback.invoke(BufferingInfoType.parse(bufferingType), val)
                    }
                    let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnBufferingUpdate(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Unregister listens for video size change event.
     * @param { videoSizeChange } type - Type of the playback event to listen for.
     * @param { OnVideoSizeChangeHandler } callback - Callback used to listen for the playback event return video size.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: OnVideoSizeChangeHandler): Unit {
        match (`type`) {
            case AVPlayerCallbackType.VideoSizeChange =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {width: Int32, height: Int32 => callback.invoke(width, height)}
                    let lambdaData = Callback2Param<Int32, Int32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnVideoSizeChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Register listens for audio interrupt event, refer to {@link #audio.InterruptEvent}
     * @param { audioInterrupt } type - Type of the playback event to listen for.
     * @param { Callback1Argument<InterruptEvent> } callback - Callback used to listen for the playback event return audio interrupt info.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<InterruptEvent>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.AudioInterrupt =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        eventType: Int32, forceType: Int32, hintType: Int32 => callback.invoke(
                            InterruptEvent(eventType, forceType, hintType))
                    }
                    let lambdaData = Callback3Param<Int32, Int32, Int32, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnAudioInterrupt(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Subscribes output device change event callback.
     * The event is triggered when output device change for this stream.
     * @param { audioOutputDeviceChangeWithInfo } type - Type of the event to listen for.
     * @param { Callback1Argument<AudioStreamDeviceChangeInfo> } callback - Callback used to listen device change event.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<AudioStreamDeviceChangeInfo>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.AudioOutputDeviceChangeWithInfo =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        info: CAudioStreamDeviceChangeInfo => callback.invoke(AudioStreamDeviceChangeInfo(info))
                    }
                    let lambdaData = Callback1Param<CAudioStreamDeviceChangeInfo, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnAudioDeviceChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Subscribes listener for subtitle update event.
     * @param { subtitleUpdate } type - Type of the event to listen for.
     * @param { Callback1Argument<SubtitleInfo> } callback - Callback used to listen subtitle update event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<SubtitleInfo>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.SubtitleUpdate =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {info: CSubtitleInfo => callback.invoke(info.toSubtitleInfo())}
                    let lambdaData = Callback1Param<CSubtitleInfo, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnSubtitleUpdate(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Subscribes listener for track change event.
     * @param { trackChange } type - Type of the event to listen for.
     * @param { OnTrackChangeHandler } callback - Callback used to listen track change event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: OnTrackChangeHandler): Unit {
        match (`type`) {
            case AVPlayerCallbackType.TrackChange =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {index: Int32, isSelected: Bool => callback.invoke(index, isSelected)}
                    let lambdaData = Callback2Param<Int32, Bool, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnTrackChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Subscribes listener for trackinfo update event.
     * @param { trackInfoUpdate } type - Type of the event to listen for.
     * @param { Callback1Argument<Array<MediaDescription>> } callback - Callback used to listen trackinfo update event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<Array<MediaDescription>>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.TrackInfoUpdate =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        arr: CArrCMediaDescription => callback.invoke(
                            cArr2cjArr<CMediaDescription, MediaDescription>(arr.size, arr.head) {
                                item => item.toHashMap()
                            })
                    }
                    let lambdaData = Callback1Param<CArrCMediaDescription, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnTrackInfoUpdate(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Subscrips listener for audio playback amplitude update event.
     * In each event, an array of amplitude is reported, large index indicates closer to current time.
     * @param { amplitudeUpdate } type - Type of the event to listen for.
     * @param { Callback1Argument<Array<Float32>> } callback - Callback used to listen amplitude update event.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func on(`type`: AVPlayerCallbackType, callback: Callback1Argument<Array<Float32>>): Unit {
        match (`type`) {
            case AVPlayerCallbackType.AmplitudeUpdate =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_PLAYER_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {
                        arr: CArrFloat => callback.invoke(
                            cArr2cjArr<Float32, Float32>(arr.size, arr.head) {
                                item => item
                            })
                    }
                    let lambdaData = Callback1Param<CArrFloat, Unit>(wrapper)
                    let errCode = FfiMediaAVPlayerOnAmplitudeUpdate(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Unregister listens for media playback stateChange event.
     * @param { stateChange } type - Type of the playback event to listen for.
     * @param { error } type - Type of the playback error event to listen for.
     * @param { seekDone } type - Type of the playback event to listen for.
     * @param { speedDone } type - Type of the playback event to listen for.
     * @param { bitrateDone } type - Type of the playback event to listen for.
     * @param { availableBitrates } type - Type of the playback event to listen for.
     * @param { volumeChange } type - Type of the playback event to listen for.
     * @param { endOfStream } type - Type of the playback event to listen for.
     * @param { timeUpdate } type - Type of the playback event to listen for.
     * @param { durationUpdate } type - Type of the playback event to listen for.
     * @param { bufferingUpdate } type - Type of the playback buffering update event to listen for.
     * @param { startRenderFrame } type - Type of the playback event to listen for.
     * @param { videoSizeChange } type - Type of the playback event to listen for.
     * @param { audioInterrupt } type - Type of the playback event to listen for.
     * @param { audioOutputDeviceChangeWithInfo } type - Type of the event to listen for.
     * @param { subtitleUpdate } type - Type of the event to listen for.
     * @param { trackChange } type - Type of the event to listen for.
     * @param { trackInfoUpdate } type - Type of the event to listen for.
     * @param { amplitudeUpdate } type - Type of the event to listen for.
     * @param { CallbackObject } callback - Callback used to listen for event
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func off(`type`: AVPlayerCallbackType, callback: CallbackObject): Unit {
        match (`type`) {
            case AVPlayerCallbackType.StateChange => off(`type`.toString(), callback, FfiMediaAVPlayerOffStateChange)
            case AVPlayerCallbackType.AVError => off(`type`.toString(), callback, FfiMediaAVPlayerOffError)
            case AVPlayerCallbackType.SeekDone => off(`type`.toString(), callback, FfiMediaAVPlayerOffSeekDone)
            case AVPlayerCallbackType.SpeedDone => off(`type`.toString(), callback, FfiMediaAVPlayerOffSpeedDone)
            case AVPlayerCallbackType.BitrateDone => off(`type`.toString(), callback, FfiMediaAVPlayerOffBitRateDone)
            case AVPlayerCallbackType.AvailableBitrates => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffAvailableBitrates)
            case AVPlayerCallbackType.VolumeChange => off(`type`.toString(), callback, FfiMediaAVPlayerOffVolumeChange)
            case AVPlayerCallbackType.EndOfStream => off(`type`.toString(), callback, FfiMediaAVPlayerOffEndOfStream)
            case AVPlayerCallbackType.TimeUpdate => off(`type`.toString(), callback, FfiMediaAVPlayerOffTimeUpdate)
            case AVPlayerCallbackType.DurationUpdate => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffDurationUpdate)
            case AVPlayerCallbackType.BufferingUpdate => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffBufferingUpdate)
            case AVPlayerCallbackType.StartRenderFrame => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffStartRenderFrame)
            case AVPlayerCallbackType.VideoSizeChange => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffVideoSizeChange)
            case AVPlayerCallbackType.AudioInterrupt => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffAudioInterrupt)
            case AVPlayerCallbackType.AudioOutputDeviceChangeWithInfo => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffAudioDeviceChange)
            case AVPlayerCallbackType.SubtitleUpdate => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffSubtitleUpdate)
            case AVPlayerCallbackType.TrackChange => off(`type`.toString(), callback, FfiMediaAVPlayerOffTrackChange)
            case AVPlayerCallbackType.TrackInfoUpdate => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffTrackInfoUpdate)
            case AVPlayerCallbackType.AmplitudeUpdate => off(`type`.toString(), callback,
                FfiMediaAVPlayerOffAmplitudeUpdate)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func off(`type`: String, callbackObj: CallbackObject, offFunc: CFunc<(Int64, Int64) -> Int32>) {
        if (let Some(cb) <- callBackMap.get(`type`)) {
            if (refEq(callbackObj, cb[0])) {
                let errCode = unsafe { offFunc(getID(), cb[1]) }
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                callBackMap.remove(`type`)
            }
        } else {
            AV_PLAYER_LOG.error("AVPlayer off failed: The event is not registered")
            return
        }
    }

    /**
     * Unregister listens for media playback stateChange event.
     * @param { stateChange } type - Type of the playback event to listen for.
     * @param { error } type - Type of the playback error event to listen for.
     * @param { seekDone } type - Type of the playback event to listen for.
     * @param { speedDone } type - Type of the playback event to listen for.
     * @param { bitrateDone } type - Type of the playback event to listen for.
     * @param { availableBitrates } type - Type of the playback event to listen for.
     * @param { volumeChange } type - Type of the playback event to listen for.
     * @param { endOfStream } type - Type of the playback event to listen for.
     * @param { timeUpdate } type - Type of the playback event to listen for.
     * @param { durationUpdate } type - Type of the playback event to listen for.
     * @param { bufferingUpdate } type - Type of the playback buffering update event to listen for.
     * @param { startRenderFrame } type - Type of the playback event to listen for.
     * @param { videoSizeChange } type - Type of the playback event to listen for.
     * @param { audioInterrupt } type - Type of the playback event to listen for.
     * @param { audioOutputDeviceChangeWithInfo } type - Type of the event to listen for.
     * @param { subtitleUpdate } type - Type of the event to listen for.
     * @param { trackChange } type - Type of the event to listen for.
     * @param { trackInfoUpdate } type - Type of the event to listen for.
     * @param { amplitudeUpdate } type - Type of the event to listen for.
     * @param { CallbackObject } callback - Callback used to listen for event
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func off(`type`: AVPlayerCallbackType): Unit {
        match (`type`) {
            case AVPlayerCallbackType.StateChange => off(`type`.toString(), FfiMediaAVPlayerOffStateChangeAll)
            case AVPlayerCallbackType.AVError => off(`type`.toString(), FfiMediaAVPlayerOffErrorAll)
            case AVPlayerCallbackType.SeekDone => off(`type`.toString(), FfiMediaAVPlayerOffSeekDoneAll)
            case AVPlayerCallbackType.SpeedDone => off(`type`.toString(), FfiMediaAVPlayerOffSpeedDoneAll)
            case AVPlayerCallbackType.BitrateDone => off(`type`.toString(), FfiMediaAVPlayerOffBitRateDoneAll)
            case AVPlayerCallbackType.AvailableBitrates => off(`type`.toString(),
                FfiMediaAVPlayerOffAvailableBitratesAll)
            case AVPlayerCallbackType.VolumeChange => off(`type`.toString(), FfiMediaAVPlayerOffVolumeChangeAll)
            case AVPlayerCallbackType.EndOfStream => off(`type`.toString(), FfiMediaAVPlayerOffEndOfStreamAll)
            case AVPlayerCallbackType.TimeUpdate => off(`type`.toString(), FfiMediaAVPlayerOffTimeUpdateAll)
            case AVPlayerCallbackType.DurationUpdate => off(`type`.toString(), FfiMediaAVPlayerOffDurationUpdateAll)
            case AVPlayerCallbackType.BufferingUpdate => off(`type`.toString(), FfiMediaAVPlayerOffBufferingUpdateAll)
            case AVPlayerCallbackType.StartRenderFrame => off(`type`.toString(), FfiMediaAVPlayerOffStartRenderFrameAll)
            case AVPlayerCallbackType.VideoSizeChange => off(`type`.toString(), FfiMediaAVPlayerOffVideoSizeChangeAll)
            case AVPlayerCallbackType.AudioInterrupt => off(`type`.toString(), FfiMediaAVPlayerOffAudioInterruptAll)
            case AVPlayerCallbackType.AudioOutputDeviceChangeWithInfo => off(`type`.toString(),
                FfiMediaAVPlayerOffAudioDeviceChangeAll)
            case AVPlayerCallbackType.SubtitleUpdate => off(`type`.toString(), FfiMediaAVPlayerOffSubtitleUpdateAll)
            case AVPlayerCallbackType.TrackChange => off(`type`.toString(), FfiMediaAVPlayerOffTrackChangeAll)
            case AVPlayerCallbackType.TrackInfoUpdate => off(`type`.toString(), FfiMediaAVPlayerOffTrackInfoUpdateAll)
            case AVPlayerCallbackType.AmplitudeUpdate => off(`type`.toString(), FfiMediaAVPlayerOffAmplitudeUpdateAll)
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func off(`type`: String, offFuncAll: CFunc<(Int64) -> Int32>) {
        if (let Some(cb) <- callBackMap.get(`type`)) {
            let errCode = unsafe { offFuncAll(getID()) }
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            callBackMap.remove(`type`)
        } else {
            AV_PLAYER_LOG.error("AVPlayer off failed: The event is not registered")
            return
        }
    }

    /**
     * Set MediaSource to AVPlayer, this interface is exclusive with fd/url/dataSrc assign.
     * @param { MediaSource } src : MediaSource instance to be set to the avplayer instance.
     * @param { PlaybackStrategy } strategy : Play strategy of the media source.
     * @returns { Unit } return when setMediaSource completed.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Mandatory parameters are left unspecified.
     * <br>2. Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setMediaSource(src: MediaSource, strategy!: ?PlaybackStrategy = None): Unit {
        let cStrategy = if (let Some(v) <- strategy) {
            unsafe { v.toCPlaybackStrategy() }
        } else {
            CPlaybackStrategy.DEFAULT
        }
        let errCode = unsafe { FfiMediaAVPlayerSetMediaSource(getID(), src.getID(), cStrategy) }
        cStrategy.free()
        throwIfNotSuccess(errCode, "AVPlayer", "setMediaSource")
    }

    /**
     * Set playback strategy to AVPlayer.
     * @param { PlaybackStrategy } strategy : specified strategy of the AVPlayer.
     * @returns { Unit } return when setPlaybackStrategy completed.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Incorrect parameter types. 2. Parameter verification failed.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setPlaybackStrategy(strategy: PlaybackStrategy): Unit {
        unsafe {
            let cStrategy = strategy.toCPlaybackStrategy()
            let errCode = FfiMediaAVPlayerSetPlaybackStrategy(getID(), cStrategy)
            cStrategy.free()
            throwIfNotSuccess(errCode, "AVPlayer", "setPlaybackStrategy")
        }
    }

    /**
     * Mute specified media stream.
     * @param { MediaType } mediaType - specified media Type, see @MediaType..
     * @param { Bool } muted - true for mute, false for unmute.
     * @returns { Unit } return when setMediaMuted completed.
     * @throws { BusinessException } 401 - The parameter check failed. Return by promise.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setMediaMuted(mediaType: MediaType, muted: Bool): Unit {
        let errCode = unsafe { FfiMediaAVPlayerSetMediaMuted(getID(), mediaType.get(), muted) }
        throwIfNotSuccess(errCode, "AVPlayer", "setMediaMuted")
    }

    /**
     * Get all track infos in MediaDescription, should be called after data loaded callback.
     * @returns { Array<MediaDescription> } return the track info in MediaDescription.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func getTrackDescription(): Array<MediaDescription> {
        var errCode = SUCCESS_CODE
        let cArrCMediaDescription = unsafe { FfiMediaAVPlayerGetTrackDescription(getID(), inout errCode) }
        if (errCode != SUCCESS_CODE) {
            cArrCMediaDescription.free()
            throw BusinessException(errCode, "AVPlayer getTrackDescription failed: ${getErrorMsg(errCode)}")
        }
        let arr = cArrCMediaDescription.toArrayMediaDescription()
        cArrCMediaDescription.free()
        return arr
    }

    /**
     * Get selected tracks, should be called after prepared state.
     * @returns { Array<Int32> } A Promise instance used to return selected track index.
     * @throws { BusinessException } 5400102 - Operation not allowed.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func getSelectedTracks(): Array<Int32> {
        var errCode = SUCCESS_CODE
        let selectedTracks = unsafe { FfiMediaAVPlayerGetSelectedTracks(getID(), inout errCode) }
        let data = selectedTracks.head
        throwIfNotSuccess(errCode, "AVPlayer", "getSelectedTracks")
        if (data.isNull()) {
            return Array<Int32>()
        }
        let arr = unsafe { Array<Int32>(selectedTracks.size, {i => data.read(i)}) }
        unsafe { LibC.free(selectedTracks.head) }
        return arr
    }

    /**
     * Get statistic infos of current player.
     * @returns { PlaybackInfo } Statistic infos of current player.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func getPlaybackInfo(): PlaybackInfo {
        var errCode = SUCCESS_CODE
        let cPlaybackInfo = unsafe { FfiMediaAVPlayerGetPlaybackInfo(getID(), inout errCode) }
        throwIfNotSuccess(errCode, "AVPlayer", "getPlaybackInfo")
        let playbackInfo = cPlaybackInfo.toPlaybackInfo()
        cPlaybackInfo.free()
        return playbackInfo
    }

    /**
     * Select specific track to play.
     * @param { Int32 } index - Track index returned by getTrackDescription#MD_KEY_TRACK_INDEX
     * @param { SwitchMode } mode - set switchmode for track select behavior.
     * @returns { Unit } A Promise instance used to return when select track completed.
     * @throws { BusinessException } 401 - The parameter check failed. Return by promise.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func selectTrack(index: Int32, mode!: SwitchMode = SwitchMode.SMOOTH): Unit {
        let errCode = unsafe { FfiMediaAVPlayerSelectTrack(getID(), index, mode.get()) }
        throwIfNotSuccess(errCode, "AVPlayer", "selectTrack")
    }

    /**
     * Deselect specific track to play.
     * @param { Int32 } index : Track index returned by getTrackDescription#MD_KEY_TRACK_INDEX
     * @returns { Unit } A Promise instance used to return when deselect track completed.
     * @throws { BusinessException } 401 - The parameter check failed. Return by promise.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func deselectTrack(index: Int32): Unit {
        let errCode = unsafe { FfiMediaAVPlayerDeselectTrack(getID(), index) }
        throwIfNotSuccess(errCode, "AVPlayer", "selectTrack")
    }

    /**
     * Set payback speed.
     * @param { PlaybackSpeed } speed - playback speed, see @PlaybackSpeed .
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setSpeed(speed: PlaybackSpeed): Unit {
        unsafe { FfiMediaAVPlayerSetSpeed(getID(), speed.value) }
    }

    /**
     * select a specified bitrate to playback, only valid for HLS protocol network stream. By default, the
     * player will select the appropriate bitrate according to the network connection speed. The
     * available bitrate list reported by {@link #on('availableBitrates')}. Set it to select
     * a specified bitrate. If the specified bitrate is not in the list of available bitrate, the player
     * will select the minimal and closest one from the available bitrate list.
     * @param { Int32 } bitrate - the playback bitrate must be expressed in bits per second.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setBitrate(bitrate: Int32): Unit {
        unsafe { FfiMediaAVPlayerSetBitrate(getID(), bitrate) }
    }

    /**
     * Sets the volume.
     * @param { Float32 } volume - Relative volume. The value ranges from 0.00 to 1.00. The value 1 indicates the maximum volume (100%).
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @crossplatform
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func setVolume(volume: Float32): Unit {
        unsafe { FfiMediaAVPlayerSetVolume(getID(), Float64(volume)) }
    }

    /**
     * Add subtitle resource represented by FD to the player.
     * @param { Int32 } fd : The file descriptor of subtitle source from file system.
     * The caller is responsible to close the file descriptor.
     * @param { Int64 } offset : The offset into the file where the data to be read, in bytes.
     * By default, the offset is zero.
     * @param { Int64 } length : The length in bytes of the data to be read.
     * By default, the length is the rest of bytes in the file from the offset.
     * @returns { Unit } return the result.
     * @throws { BusinessException } 401 - The parameter check failed. Return by promise.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func addSubtitleFromFd(fd: Int32, offset!: Int64 = 0, length!: Int64 = 0): Unit {
        let errCode = unsafe { FfiMediaAVPlayerAddSubtitleFromFd(getID(), fd, offset, length) }
        throwIfNotSuccess(errCode, "AVPlayer", "addSubtitleFromFd")
    }

    /**
     * Add subtitle resource represented by url to the player. After the Promise returns,
     * subtitle info can be obtained by @getTrackDescription
     * @param { String } url : Address of external subtitle file.
     * @returns { Unit } Promise used to return the result.
     * @throws { BusinessException } 401 - The parameter check failed. Return by promise.
     * @throws { BusinessException } 5400102 - Operation not allowed. Return by promise.
     * @syscap SystemCapability.Multimedia.Media.AVPlayer
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVPlayer"
    ]
    public func addSubtitleFromUrl(url: String): Unit {
        unsafe {
            let cUrl = LibC.mallocCString(url)
            let errCode = FfiMediaAVPlayerAddSubtitleFromUrl(getID(), cUrl)
            LibC.free(cUrl)
            throwIfNotSuccess(errCode, "AVPlayer", "addSubtitleFromUrl")
        }
    }
}
