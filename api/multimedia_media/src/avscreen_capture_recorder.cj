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

import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import std.collection.*
import ohos.hilog.*

foreign {
    func FfiAVScreenCaptureCreateAVScreenCaptureRecorder(code: CPointer<Int32>): Int64

    func FfiAVScreenCaptureinit(id: Int64, config: CAVScreenCaptureConfig): Int32

    func FfiAVScreenCaptureStartRecording(id: Int64): Int32

    func FfiAVScreenCaptureStopRecording(id: Int64): Int32

    func FfiAVScreenCaptureSkipPrivacyMode(id: Int64, windowIDsVec: CArrUnit): Int32

    func FfiAVScreenCaptureSetMicEnabled(id: Int64, enable: Bool): Int32

    func FfiAVScreenCaptureRelease(id: Int64): Int32

    func FfiAVScreenCaptureOnStateChange(id: Int64, callbackId: Int64): Int32

    func FfiAVScreenCaptureOffStateChange(id: Int64): Int32

    func FfiAVScreenCaptureOnError(id: Int64, callbackId: Int64): Int32

    func FfiAVScreenCaptureOffError(id: Int64): Int32
}

const LOG_DOMAIN_SCREENCAPTURE: UInt32 = 0xD002B2E
let AV_SCREEN_CAPTURE_LOG = HilogChannel(LOG_CORE, LOG_DOMAIN_SCREENCAPTURE, "CJ-AVScreenCaptureRecorder")
const MSERR_EXT_API9_INVALID_PARAMETER = 401i32

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public func createAVScreenCaptureRecorder(): ?AVScreenCaptureRecorder {
    var code = 0i32
    var id = unsafe { FfiAVScreenCaptureCreateAVScreenCaptureRecorder(inout code) }
    if (code != SUCCESS_CODE) {
        if (code == -1) {
            return None
        } else {
            throw BusinessException(code, getErrorMsg(code))
        }
    }
    return AVScreenCaptureRecorder(id)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
]
public class AVScreenCaptureRecorder <: RemoteDataLite {
    let callBackMap: HashMap<String, (CallbackObject, Int64)> = HashMap<String, (CallbackObject, Int64)>()

    protected init(id: Int64) {
        super(id)
        AV_SCREEN_CAPTURE_LOG.info("[AVScreenCaptureRecorder] construct success")
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func initialize(config: AVScreenCaptureRecordConfig): Unit {
        unsafe {
            let ai = AudioInfo(
                AudioCaptureInfo(config.audioSampleRate, config.audioChannelCount, AudioCaptureSourceType.MIC,
                    AVScreenCaptureParamValidationState.VALIDATION_IGNORE),
                AudioCaptureInfo(config.audioSampleRate, config.audioChannelCount, AudioCaptureSourceType.ALL_PLAYBACK,
                    AVScreenCaptureParamValidationState.VALIDATION_IGNORE),
                AudioEncInfo(config.audioBitrate, AudioCodecFormat.AAC_LC,
                    AVScreenCaptureParamValidationState.VALIDATION_IGNORE)
            )
            let vi: VideoInfo
            let frame_rate = Int32(60)
            let bit_rate = Int32(10000000)
            if (config.preset.toInt32() == 0) {
                vi = VideoInfo(
                    VideoCaptureInfo(0, [], config.frameWidth, config.frameHeight,
                        VideoCaptureSourceType.VIDEO_SOURCE_SURFACE_RGBA,
                        AVScreenCaptureParamValidationState.VALIDATION_IGNORE),
                    VideoEncInfo(VideoCodecFormat.H264, bit_rate, frame_rate,
                        AVScreenCaptureParamValidationState.VALIDATION_IGNORE))
            } else {
                vi = VideoInfo(
                    VideoCaptureInfo(0, [], config.frameWidth, config.frameHeight,
                        VideoCaptureSourceType.VIDEO_SOURCE_SURFACE_RGBA,
                        AVScreenCaptureParamValidationState.VALIDATION_IGNORE),
                    VideoEncInfo(VideoCodecFormat.H265, bit_rate, frame_rate,
                        AVScreenCaptureParamValidationState.VALIDATION_IGNORE))
            }

            let ri = RecorderInfo("fd://${config.fd}", "mp4")
            var fconfig = AVScreenCaptureConfig(CaptureMode.CAPTURE_HOME_SCREEN, DataType.CAPTURE_FILE, ai, vi, ri)

            var cconfig: CAVScreenCaptureConfig = fconfig.toNative()
            var errCode = 0i32
            errCode = FfiAVScreenCaptureinit(getID(), cconfig)
            cconfig.free()
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
        }
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func startRecording(): Unit {
        var errorcode = SUCCESS_CODE
        errorcode = unsafe { FfiAVScreenCaptureStartRecording(getID()) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func stopRecording(): Unit {
        var errorcode = SUCCESS_CODE
        errorcode = unsafe { FfiAVScreenCaptureStopRecording(getID()) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func skipPrivacyMode(windowIDsVec: Array<UInt64>): Unit {
        let ptr = unsafe { cjArr2CArr(windowIDsVec) {i: UInt64 => i} }
        let cTags = CArrUnit(CPointer<Unit>(ptr), windowIDsVec.size)
        var errorcode = SUCCESS_CODE
        errorcode = unsafe { FfiAVScreenCaptureSkipPrivacyMode(getID(), cTags) }
        unsafe { LibC.free(ptr) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func setMicEnabled(enable: Bool): Unit {
        var errorcode = SUCCESS_CODE
        errorcode = unsafe { FfiAVScreenCaptureSetMicEnabled(getID(), enable) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func release(): Unit {
        var errorcode = SUCCESS_CODE
        errorcode = unsafe { FfiAVScreenCaptureRelease(getID()) }
        if (errorcode != SUCCESS_CODE) {
            throw BusinessException(errorcode, getErrorMsg(errorcode))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func on(`type`: ProfileCallbackType, callback: Callback1Argument<AVScreenCaptureStateCode>): Unit {
        match (`type`) {
            case ProfileCallbackType.CONNECTION_STATE_CHANGE =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_SCREEN_CAPTURE_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {param: Int32 => callback.invoke(AVScreenCaptureStateCode.parse(param))}
                    let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                    let errCode = FfiAVScreenCaptureOnStateChange(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func on(`type`: ProfileCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case ProfileCallbackType.CONNECTION_ERROR =>
                if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                    if (refEq(callback, cb[0])) {
                        AV_SCREEN_CAPTURE_LOG.error("AVPlayer on failed: This request already exists")
                        return
                    }
                }
                unsafe {
                    let wrapper = {code: Int32, msg: CString => callback.invoke(BusinessException(code, msg.toString()))}
                    let lambdaData = Callback2Param<Int32, CString, Unit>(wrapper)
                    let errCode = FfiAVScreenCaptureOnError(getID(), lambdaData.getID())
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, getErrorMsg(errCode))
                    }
                    callBackMap.add(`type`.toString(), (callback, lambdaData.getID()))
                }
            case _ => throw BusinessException(MSERR_EXT_API9_INVALID_PARAMETER,
                getErrorMsg(MSERR_EXT_API9_INVALID_PARAMETER))
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVScreenCapture"
    ]
    public func off(`type`: ProfileCallbackType, callback!: ?CallbackObject = None): Unit {
        AV_SCREEN_CAPTURE_LOG.debug("unsubscribe StateChange or error")
        if (!callBackMap.contains(`type`.toString())) {
            return
        }
        var errorCode: Int32 = 0
        unsafe {
            if (`type` == CONNECTION_STATE_CHANGE) {
                errorCode = FfiAVScreenCaptureOffStateChange(getID())
            } else {
                errorCode = FfiAVScreenCaptureOffError(getID())
            }
        }
        if (errorCode != SUCCESS_CODE) {
            throw BusinessException(errorCode, getErrorMsg(errorCode))
        }
        if (let Some(v) <- callback) {
            if (let Some(cb) <- callBackMap.get(`type`.toString())) {
                if (refEq(v, cb[0])) {
                    callBackMap.remove(`type`.toString())
                }
            }
            return
        }
        callBackMap.remove(`type`.toString())
    }
}
