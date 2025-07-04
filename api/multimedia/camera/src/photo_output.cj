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

package ohos.multimedia.camera

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.sync.*

/**
 * Photo output object.
 *
 * @interface PhotoOutput
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class PhotoOutput <: RemoteDataLite & CameraOutput {
    let captureStartWithInfoList = ArrayList<(CallbackObject, Int64)>()
    let captureStartWithInfoMutex = Mutex()
    let frameShutterList = ArrayList<(CallbackObject, Int64)>()
    let frameShutterMutex = Mutex()
    let captureEndList = ArrayList<(CallbackObject, Int64)>()
    let captureEndMutex = Mutex()
    let frameShutterEndList = ArrayList<(CallbackObject, Int64)>()
    let frameShutterEndMutex = Mutex()
    let captureReadyList = ArrayList<(CallbackObject, Int64)>()
    let captureReadyMutex = Mutex()
    let estimatedCaptureDurationList = ArrayList<(CallbackObject, Int64)>()
    let estimatedCaptureDurationMutex = Mutex()
    let errorList = ArrayList<(CallbackObject, Int64)>()
    let errorMutex = Mutex()

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputRelease(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Start capture output.
     *
     * @throws { BusinessException } 7400104 - Session not running.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func capture(): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputCapture(getID()) }
        successOrThrow(errCode)
    }

    /**
     * Start capture output.
     *
     * @param { PhotoCaptureSetting } setting - Photo capture settings.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400104 - Session not running.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func capture(setting: PhotoCaptureSetting): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputCaptureWithSetting(getID(), CPhotoCaptureSetting(setting)) }
        successOrThrow(errCode)
    }

    /**
     * Confirm if moving photo supported.
     *
     * @returns { Bool } TRUE if the moving photo is supported.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func isMovingPhotoSupported(): Bool {
        var errCode: Int32 = 0
        let result = unsafe { FfiCameraPhotoOutputIsMovingPhotoSupported(getID(), inout errCode) }
        successOrThrow(errCode)
        return result
    }

    /**
     * Enable moving photo.
     *
     * @permission ohos.permission.MICROPHONE
     * @param { Bool } enabled - Target state for moving photo.
     * @throws { BusinessException } 201 - permission denied.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        permission: "ohos.permission.MICROPHONE",
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func enableMovingPhoto(enabled: Bool): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputEnableMovingPhoto(getID(), enabled) }
        successOrThrow(errCode)
    }

    /**
     * Check whether to support mirror photo.
     *
     * @returns { Bool } Is the mirror supported.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func isMirrorSupported(): Bool {
        var errCode: Int32 = 0
        let result = unsafe { FfiCameraPhotoOutputIsMirrorSupported(getID(), inout errCode) }
        successOrThrow(errCode)
        return result
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func enableMirror(enabled: Bool): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputEnableMirror(getID(), enabled) }
        successOrThrow(errCode)
    }

    /**
     * Get supported moving photo video codec types.
     *
     * @returns { Array<VideoCodecType> } An array of supported video codec types for moving photo.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedMovingPhotoVideoCodecTypes(): Array<VideoCodecType> {
        return [VideoCodecType.AVC, VideoCodecType.HEVC]
    }

    /**
     * Sets codec type for moving photo, default to AVC.
     *
     * @param { VideoCodecType } codecType - Codec type for moving photo.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func setMovingPhotoVideoCodecType(codecType: VideoCodecType): Unit {
        let errCode = unsafe { FfiCameraPhotoOutputSetMovingPhotoVideoCodecType(getID(), codecType.getValue()) }
        successOrThrow(errCode)
    }

    /**
     * Gets the current preconfig type if you had already call preconfig interface.
     *
     * @returns { Profile } The current preconfig type.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getActiveProfile(): Profile {
        var errCode: Int32 = 0
        let cProfile = unsafe { FfiCameraPhotoOutputGetActiveProfile(getID(), inout errCode) }
        successOrThrow(errCode)
        return cProfile.toProfile()
    }

    /**
     * Gets the photo rotation angle.
     *
     * @param { Int32 } deviceDegree - The current device rotation degree.
     * @returns { ImageRotation } The photo rotation angle.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getPhotoRotation(deviceDegree: Int32): ImageRotation {
        var errCode: Int32 = 0
        let cImageRotation = unsafe { FfiCameraPhotoOutputGetPhotoRotation(getID(), deviceDegree, inout errCode) }
        successOrThrow(errCode)
        return ImageRotation.parse(cImageRotation)
    }

    /**
     * Subscribes capture start event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CaptureStartInfo> } callback - Callback used to get the capture start info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<CaptureStartInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureStartWithInfo => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(captureStartWithInfoMutex) {
            let callbackList = captureStartWithInfoList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CCaptureStartInfo => callback.invoke(value.toCaptureStartInfo())}
                let lambdaData = Callback1Param<CCaptureStartInfo, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnCaptureStartWithInfo(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes frame shutter event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FrameShutterInfo> } callback - Callback used to get the frame shutter information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FrameShutter => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(frameShutterMutex) {
            let callbackList = frameShutterList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CFrameShutterInfo => callback.invoke(value.toFrameShutterInfo())}
                let lambdaData = Callback1Param<CFrameShutterInfo, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnFrameShutter(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes capture end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CaptureEndInfo> } callback - Callback used to get the capture end information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<CaptureEndInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureEnd => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(captureEndMutex) {
            let callbackList = captureEndList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CCaptureEndInfo => callback.invoke(value.toCaptureEndInfo())}
                let lambdaData = Callback1Param<CCaptureEndInfo, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnCaptureEnd(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes frame shutter end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FrameShutterEndInfo> } callback - Callback used to get the frame shutter end information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterEndInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FrameShutterEnd => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(frameShutterEndMutex) {
            let callbackList = frameShutterEndList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: Int32 => callback.invoke(FrameShutterEndInfo(value))}
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnFrameShutterEnd(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes capture ready event callback. After receiving the callback, can proceed to the next capture
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback0Argument } callback - Callback used to notice capture ready.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureReady => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(captureReadyMutex) {
            let callbackList = captureReadyList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {=> callback.invoke()}
                let lambdaData = Callback0Param(wrapper)
                let errCode = FfiCameraPhotoOutputOnCaptureReady(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes estimated capture duration event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<Int32> } callback - Callback used to notify the estimated capture duration (in milliseconds).
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<Int32>): Unit {
        match (`type`) {
            case CameraCallbackType.EstimatedCaptureDuration => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(estimatedCaptureDurationMutex) {
            let callbackList = estimatedCaptureDurationList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: Int32 => callback.invoke(value)}
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnEstimatedCaptureDuration(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the photo output errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PhotoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: Int32 => callback.invoke(BusinessException(value, getErrorMsg(value)))}
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                let errCode = FfiCameraPhotoOutputOnError(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Unsubscribes from capture start event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CaptureStartInfo> } callback - Callback used to get the capture start info.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<CaptureStartInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureStartWithInfo => off(IdClassInfo(this.getID(), "PhotoOutput"),
                captureStartWithInfoList, captureStartWithInfoMutex, callback,
                FfiCameraPhotoOutputOffCaptureStartWithInfo)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from frame shutter event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FrameShutterInfo> } callback - Callback used to get the frame shutter information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FrameShutter => off(IdClassInfo(this.getID(), "PhotoOutput"), frameShutterList,
                frameShutterMutex, callback, FfiCameraPhotoOutputOffFrameShutter)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from capture end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CaptureEndInfo> } callback - Callback used to get the capture end information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<CaptureEndInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureEnd => off(IdClassInfo(this.getID(), "PhotoOutput"), captureEndList,
                captureEndMutex, callback, FfiCameraPhotoOutputOffCaptureEnd)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from frame shutter end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FrameShutterEndInfo> } callback - Callback used to get the frame shutter end information.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterEndInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FrameShutterEnd => off(IdClassInfo(this.getID(), "PhotoOutput"), frameShutterEndList,
                frameShutterEndMutex, callback, FfiCameraPhotoOutputOffFrameShutterEnd)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from capture ready event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback0Argument } callback - Callback used to notice capture ready.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureReady => off(IdClassInfo(this.getID(), "PhotoOutput"), captureReadyList,
                captureReadyMutex, callback, FfiCameraPhotoOutputOffCaptureReady)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from estimated capture duration event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<Int32> } callback - Callback used to notify the estimated capture duration (in milliseconds).
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<Int32>): Unit {
        match (`type`) {
            case CameraCallbackType.EstimatedCaptureDuration => off(IdClassInfo(this.getID(), "PhotoOutput"),
                estimatedCaptureDurationList, estimatedCaptureDurationMutex, callback,
                FfiCameraPhotoOutputOffEstimatedCaptureDuration)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the photo output errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => off(IdClassInfo(this.getID(), "PhotoOutput"), errorList, errorMutex,
                callback, FfiCameraPhotoOutputOffError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        match (`type`) {
            case CameraCallbackType.CaptureStartWithInfo => offAll(IdClassInfo(this.getID(), "PhotoOutput"),
                captureStartWithInfoList, captureStartWithInfoMutex, FfiCameraPhotoOutputOffAllCaptureStartWithInfo)
            case CameraCallbackType.FrameShutter => offAll(IdClassInfo(this.getID(), "PhotoOutput"), frameShutterList,
                frameShutterMutex, FfiCameraPhotoOutputOffAllFrameShutter)
            case CameraCallbackType.CaptureEnd => offAll(IdClassInfo(this.getID(), "PhotoOutput"), captureEndList,
                captureEndMutex, FfiCameraPhotoOutputOffAllCaptureEnd)
            case CameraCallbackType.FrameShutterEnd => offAll(IdClassInfo(this.getID(), "PhotoOutput"),
                frameShutterEndList, frameShutterEndMutex, FfiCameraPhotoOutputOffAllFrameShutterEnd)
            case CameraCallbackType.CaptureReady => offAll(IdClassInfo(this.getID(), "PhotoOutput"), captureReadyList,
                captureReadyMutex, FfiCameraPhotoOutputOffAllCaptureReady)
            case CameraCallbackType.EstimatedCaptureDuration => offAll(IdClassInfo(this.getID(), "PhotoOutput"),
                estimatedCaptureDurationList, estimatedCaptureDurationMutex,
                FfiCameraPhotoOutputOffAllEstimatedCaptureDuration)
            case CameraCallbackType.CameraError => offAll(IdClassInfo(this.getID(), "PhotoOutput"), errorList,
                errorMutex, FfiCameraPhotoOutputOffAllError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PhotoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }
}
