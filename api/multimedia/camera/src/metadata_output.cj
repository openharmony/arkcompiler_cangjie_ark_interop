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
 * Metadata Output object
 *
 * @interface MetadataOutput
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class MetadataOutput <: RemoteDataLite & CameraOutput {
    let metadataObjectsAvailableCallbackList = ArrayList<(CallbackObject, Int64)>()
    let metadataObjectsAvailableMutex = Mutex()
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
        let errCode = unsafe { FfiCameraMetadataOutputRelease(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Start output metadata
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
        let errCode = unsafe { FfiCameraMetadataOutputStart(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Stop output metadata
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func stop(): Unit {
        let errCode = unsafe { FfiCameraMetadataOutputStop(this.getID()) }
        successOrThrow(errCode)
    }

    /**
     * Subscribes to metadata objects available event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<Array<MetadataObject>> } callback - Callback used to get the available metadata objects.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<Array<MetadataObject>>): Unit {
        match (`type`) {
            case CameraCallbackType.MetadataObjectsAvailable => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "MetadataOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(metadataObjectsAvailableMutex) {
            let callbackList = metadataObjectsAvailableCallbackList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("MetadataOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            let wrapper = {value: CArrCMetadataObject => callback.invoke(value.toArray())}
            let lambdaData = Callback1Param<CArrCMetadataObject, Unit>(wrapper)
            let errCode = unsafe { FfiCameraMetadataOutputOnMetadataObjectsAvailable(getID(), lambdaData.getID()) }
            successOrThrow(errCode)
            callbackList.add((callback, lambdaData.getID()))
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
                "MetadataOutput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorCallbackList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("MetadataOutput on failed: ${paramError("callback object", "different")}")
                return
            }
            let wrapper = {value: Int32 => callback.invoke(BusinessException(value, getErrorMsg(value)))}
            let lambdaData = Callback1Param<Int32, Unit>(wrapper)
            let errCode = unsafe { FfiCameraMetadataOutputOnError(getID(), lambdaData.getID()) }
            successOrThrow(errCode)
            callbackList.add((callback, lambdaData.getID()))
        }
    }

    /**
     * Unsubscribes from metadata objects available event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<Array<MetadataObject>> } callback - Callback used to get the available metadata objects.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<Array<MetadataObject>>): Unit {
        match (`type`) {
            case CameraCallbackType.MetadataObjectsAvailable => off(IdClassInfo(this.getID(), "MetadataOutput"),
                metadataObjectsAvailableCallbackList, metadataObjectsAvailableMutex, callback,
                FfiCameraMetadataOutputOffMetadataObjectsAvailable)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "MetadataOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
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
            case CameraCallbackType.CameraError => off(IdClassInfo(this.getID(), "MetadataOutput"), errorCallbackList,
                errorMutex, callback, FfiCameraMetadataOutputOffError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "MetadataOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        match (`type`) {
            case CameraCallbackType.MetadataObjectsAvailable => offAll(IdClassInfo(this.getID(), "MetadataOutput"),
                metadataObjectsAvailableCallbackList, metadataObjectsAvailableMutex,
                FfiCameraMetadataOutputOffAllMetadataObjectsAvailable)
            case CameraCallbackType.CameraError => offAll(IdClassInfo(this.getID(), "MetadataOutput"), errorCallbackList,
                errorMutex, FfiCameraMetadataOutputOffAllError)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "MetadataOutput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }
}
