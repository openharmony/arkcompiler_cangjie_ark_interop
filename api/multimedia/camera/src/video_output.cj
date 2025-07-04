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
 * Video output object.
 *
 * @interface VideoOutput
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class VideoOutput <: RemoteDataLite & CameraOutput {
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
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiCameraVideoOutputRelease(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Start video output.
     *
     * @throws { BusinessException } 7400103 - Session not config.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func start(): Unit {
        unsafe {
            let errCode = FfiCameraVideoOutputStart(this.getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Stop video output.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func stop(): Unit {
        unsafe {
            let errCode = FfiCameraVideoOutputStop(this.getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Get supported frame rates which can be set during session running.
     *
     * @returns { Array<FrameRateRange> } The array of supported frame rate range.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedFrameRates(): Array<FrameRateRange> {
        unsafe {
            var errCode: Int32 = 0
            let cArrFrameRateRange = FfiCameraVideoOutputGetSupportedFrameRates(getID(), inout errCode)
            try {
                successOrThrow(errCode)
                return cArrFrameRateRange.toArray()
            } finally {
                cArrFrameRateRange.free()
            }
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
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func setFrameRate(minFps: Int32, maxFps: Int32): Unit {
        let errCode = unsafe { FfiCameraVideoOutputSetFrameRate(getID(), minFps, maxFps) }
        successOrThrow(errCode)
    }

    /**
     * Get active frame rate range which has been set before.
     *
     * @returns { FrameRateRange } The active frame rate range.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getActiveFrameRate(): FrameRateRange {
        unsafe {
            var errCode: Int32 = 0
            let cFrameRateRange = FfiCameraVideoOutputGetActiveFrameRate(getID(), inout errCode)
            successOrThrow(errCode)
            return FrameRateRange(cFrameRateRange.min, cFrameRateRange.max)
        }
    }

    /**
     * Gets the current preconfig type if you had already call preconfig interface.
     *
     * @returns { VideoProfile } The current preconfig type.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getActiveProfile(): VideoProfile {
        unsafe {
            var errCode: Int32 = 0
            let cVideoProfile = FfiCameraVideoOutputGetActiveProfile(getID(), inout errCode)
            successOrThrow(errCode)
            return cVideoProfile.toVideoProfile()
        }
    }

    /**
     * Gets the video rotation angle.
     *
     * @param { Int32 } deviceDegree - The current device rotation degree.
     * @returns { ImageRotation } The video rotation angle.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getVideoRotation(deviceDegree: Int32): ImageRotation {
        unsafe {
            var errCode: Int32 = 0
            let rotation = FfiCameraVideoOutputGetVideoRotation(getID(), deviceDegree, inout errCode)
            successOrThrow(errCode)
            return ImageRotation.parse(rotation)
        }
    }

    /**
     * Subscribes frame start event callback.
     * Unsubscribes from frame end event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback0Argument } callback - Callback used to return the result.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => synchronized(frameStartMutex) {
                let callbackList = frameStartCallbackList
                if (findCallbackObject(callbackList, callback)) {
                    CAMERA_LOG.error("VideoOutput on failed: ${paramError("callback object", "different")}")
                    return
                }
                unsafe {
                    let wrapper = {=> callback.invoke()}
                    let lambdaData = Callback0Param(wrapper)
                    let errCode = FfiCameraVideoOutputOnFrameStart(getID(), lambdaData.getID())
                    successOrThrow(errCode)
                    callbackList.add((callback, lambdaData.getID()))
                }
            }
            case CameraCallbackType.FrameEnd => synchronized(frameEndMutex) {
                let callbackList = frameEndCallbackList
                if (findCallbackObject(callbackList, callback)) {
                    CAMERA_LOG.error("VideoOutput on failed: ${paramError("callback object", "different")}")
                    return
                }
                unsafe {
                    let wrapper = {=> callback.invoke()}
                    let lambdaData = Callback0Param(wrapper)
                    let errCode = FfiCameraVideoOutputOnFrameEnd(getID(), lambdaData.getID())
                    successOrThrow(errCode)
                    callbackList.add((callback, lambdaData.getID()))
                }
            }
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "VideoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the video output errors.
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
                "VideoOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorCallbackList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("VideoOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: Int32 => callback.invoke(BusinessException(value, getErrorMsg(value)))}
                let lambdaData = Callback1Param<Int32, Unit>(wrapper)
                let errCode = FfiCameraVideoOutputOnError(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
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
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => off(IdClassInfo(this.getID(), "VideoOutput"), frameStartCallbackList,
                frameStartMutex, callback, FfiCameraVideoOutputOffFrameStart)
            case CameraCallbackType.FrameEnd => off(IdClassInfo(this.getID(), "VideoOutput"), frameEndCallbackList,
                frameEndMutex, callback, FfiCameraVideoOutputOffFrameEnd)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "VideoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the video output errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => off(IdClassInfo(this.getID(), "VideoOutput"), errorCallbackList,
                errorMutex, callback, FfiCameraVideoOutputOffError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "VideoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        match (`type`) {
            case CameraCallbackType.FrameStart => offAll(IdClassInfo(this.getID(), "VideoOutput"),
                frameStartCallbackList, frameStartMutex, FfiCameraVideoOutputOffAllFrameStart)
            case CameraCallbackType.FrameEnd => offAll(IdClassInfo(this.getID(), "VideoOutput"), frameEndCallbackList,
                frameEndMutex, FfiCameraVideoOutputOffAllFrameEnd)
            case CameraCallbackType.CameraError => offAll(IdClassInfo(this.getID(), "VideoOutput"), errorCallbackList,
                errorMutex, FfiCameraVideoOutputOffAllError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "VideoOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }
}
