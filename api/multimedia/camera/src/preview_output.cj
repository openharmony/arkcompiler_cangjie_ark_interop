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
 * Preview output object.
 *
 * @interface PreviewOutput
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class PreviewOutput <: RemoteDataLite & CameraOutput {
    let frameStartCallbackList = ArrayList<(CallbackObject, Int64)>()
    let frameStartMutex = Mutex()
    let frameEndCallbackList = ArrayList<(CallbackObject, Int64)>()
    let frameEndMutex = Mutex()
    let errorCallbackList = ArrayList<(CallbackObject, Int64)>()
    let errorMutex = Mutex()

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiCameraPreviewOutputRelease(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Get supported frame rates which can be set during session running.
     *
     * @returns { Array<FrameRateRange> } The array of supported frame rate range.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedFrameRates(): Array<FrameRateRange> {
        var errCode: Int32 = 0
        let cArrFrameRateRange = unsafe { FfiCameraPreviewOutputGetSupportedFrameRates(getID(), inout errCode) }
        try {
            successOrThrow(errCode)
            return cArrFrameRateRange.toArray()
        } finally {
            cArrFrameRateRange.free()
        }
    }

    /**
     * Set a frame rate range.
     *
     * @param { Int32 } minFps - Minimum frame rate per second.
     * @param { Int32 } maxFps - Maximum frame rate per second.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400110 - Unresolved conflicts with current configurations.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func setFrameRate(minFps: Int32, maxFps: Int32): Unit {
        let errCode = unsafe { FfiCameraPreviewOutputSetFrameRate(getID(), minFps, maxFps) }
        successOrThrow(errCode)
    }

    /**
     * Get active frame rate range which has been set before.
     *
     * @returns { FrameRateRange } The active frame rate range.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getActiveFrameRate(): FrameRateRange {
        var errCode: Int32 = 0
        let cFrameRateRange = unsafe { FfiCameraPreviewOutputGetActiveFrameRate(getID(), inout errCode) }
        successOrThrow(errCode)
        return FrameRateRange(cFrameRateRange.min, cFrameRateRange.max)
    }

    /**
     * Gets the current preconfig type if you had already call preconfig interface.
     *
     * @returns { Profile } The current preconfig type.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getActiveProfile(): Profile {
        var errCode: Int32 = 0
        let cProfile = unsafe { FfiCameraPreviewOutputGetActiveProfile(getID(), inout errCode) }
        successOrThrow(errCode)
        return cProfile.toProfile()
    }

    /**
     * Gets the preview rotation angle.
     *
     * @param { Int32 } displayRotation - The current display rotation angle.
     * @returns { ImageRotation } The preview rotation angle.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getPreviewRotation(displayRotation: Int32): ImageRotation {
        var errCode: Int32 = 0
        let cImageRotation = unsafe { FfiCameraPreviewOutputGetPreviewRotation(getID(), displayRotation, inout errCode) }
        successOrThrow(errCode)
        return ImageRotation.parse(cImageRotation)
    }

    /**
     * Sets the preview rotation angle.
     *
     * @param { ImageRotation } previewRotation - Preview display rotation angle.
     * @param { Bool } isDisplayLocked - TRUE means the display is locked, if not set, the default is FALSE.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func setPreviewRotation(previewRotation: ImageRotation, isDisplayLocked!: Bool = false): Unit {
        let errCode = unsafe {
            FfiCameraPreviewOutputSetPreviewRotation(getID(), previewRotation.getValue(), isDisplayLocked)
        }
        successOrThrow(errCode)
    }

    /**
     * Subscribes frame start event callback.
     * Subscribes frame end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback0Argument } callback - Callback used to return the result.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => synchronized(frameStartMutex) {
                let callbackList = frameStartCallbackList
                if (findCallbackObject(callbackList, callback)) {
                    CAMERA_LOG.error("PreviewOutput on failed: ${paramError("callback object", "different")}")
                    return
                }
                let wrapper = {=> callback.invoke()}
                let lambdaData = Callback0Param(wrapper)
                let errCode = unsafe { FfiCameraPreviewOutputOnFrameStart(getID(), lambdaData.getID()) }
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
            case CameraCallbackType.FrameEnd => synchronized(frameEndMutex) {
                let callbackList = frameEndCallbackList
                if (findCallbackObject(callbackList, callback)) {
                    CAMERA_LOG.error("PreviewOutput on failed: ${paramError("callback object", "different")}")
                    return
                }
                let wrapper = {=> callback.invoke()}
                let lambdaData = Callback0Param(wrapper)
                let errCode = unsafe { FfiCameraPreviewOutputOnFrameEnd(getID(), lambdaData.getID()) }
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PreviewOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the preview output errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PreviewOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorCallbackList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("PreviewOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            let wrapper = {value: Int32 => callback.invoke(BusinessException(value, getErrorMsg(value)))}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            let errCode = unsafe { FfiCameraPreviewOutputOnError(getID(), lambdaData.getID()) }
            successOrThrow(errCode)
            callbackList.add((callback, lambdaData.getID()))
        }
    }

    /**
     * Unsubscribes from frame start event callback.
     * Unsubscribes from frame end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback0Argument } callback - Callback used to return the result.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => off(IdClassInfo(this.getID(), "PreviewOutput"), frameStartCallbackList,
                frameStartMutex, callback, FfiCameraPreviewOutputOffFrameStart)
            case CameraCallbackType.FrameEnd => off(IdClassInfo(this.getID(), "PreviewOutput"), frameEndCallbackList,
                frameEndMutex, callback, FfiCameraPreviewOutputOffFrameEnd)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PreviewOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the preview output errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => off(IdClassInfo(this.getID(), "PreviewOutput"), errorCallbackList,
                errorMutex, callback, FfiCameraPreviewOutputOffError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PreviewOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => offAll(IdClassInfo(this.getID(), "PreviewOutput"),
                frameStartCallbackList, frameStartMutex, FfiCameraPreviewOutputOffAllFrameStart)
            case CameraCallbackType.FrameEnd => offAll(IdClassInfo(this.getID(), "PreviewOutput"), frameEndCallbackList,
                frameEndMutex, FfiCameraPreviewOutputOffAllFrameEnd)
            case CameraCallbackType.CameraError => offAll(IdClassInfo(this.getID(), "PreviewOutput"), errorCallbackList,
                errorMutex, FfiCameraPreviewOutputOffAllError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "PreviewOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }
}
