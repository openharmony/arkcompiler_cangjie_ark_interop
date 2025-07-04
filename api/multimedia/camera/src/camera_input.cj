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
 * Camera input object.
 *
 * @interface CameraInput
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CameraInput <: RemoteDataLite {
    let errorList = ArrayList<(CallbackObject, Int64)>()
    let errorMutex = Mutex()

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Open camera.
     *
     * @throws { BusinessException } 7400107 - Can not use camera cause of conflict.
     * @throws { BusinessException } 7400108 - Camera disabled cause of security reason.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func open(): Unit {
        unsafe {
            let errCode = FfiCameraInputOpen(this.getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Open camera.
     *
     * @param { Bool } isSecureEnabled - Enable secure camera.
     * @returns { UInt64 } Return the result.
     * @throws { BusinessException } 7400107 - Can not use camera cause of conflict.
     * @throws { BusinessException } 7400108 - Camera disabled cause of security reason.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func open(isSecureEnabled: Bool): UInt64 {
        var secureSeqId: UInt64 = 0
        let errCode = unsafe {
            FfiCameraInputOpenWithIsEnableSecureCamera(this.getID(), isSecureEnabled, inout secureSeqId)
        }
        successOrThrow(errCode)
        return secureSeqId
    }

    /**
     * Close camera.
     *
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func close(): Unit {
        unsafe {
            let errCode = FfiCameraInputClose(this.getID())
            successOrThrow(errCode)
        }
    }

    /**
     * Subscribes to error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { CameraDevice } camera - Camera device.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the camera input errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraInput on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("CameraInput on failed: ${paramError("callback object", "different")}")
                return
            }
            let wrapper = {
                value: CErrorCallback => callback.invoke(
                    BusinessException(value.errorType, getErrorMsg(value.errorType)))
            }
            let lambdaData = Callback1Param<CErrorCallback, Unit>(wrapper)
            let errCode = unsafe { FfiCameraInputOnError(getID(), lambdaData.getID()) }
            successOrThrow(errCode)
            callbackList.add((callback, lambdaData.getID()))
        }
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { CameraDevice } camera - Camera device.
     * @param { Callback1Argument<BusinessException> } callback - Callback used to get the camera input errors.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraInput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorList
            if (callbackList.size == 0) {
                CAMERA_LOG.error("CameraInput Off failed: The event is not registered")
                return
            }
            unsafe {
                callbackList.removeIf(
                    {
                        item => if (refEq(item[0], callback)) {
                            let errCode = FfiCameraInputOffError(this.getID(), item[1])
                            successOrThrow(errCode)
                            true
                        } else {
                            CAMERA_LOG.error("CameraInput Off failed: The callback is not registered")
                            false
                        }
                    })
            }
        }
    }

    /**
     * Unsubscribes from error events.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { CameraDevice } camera - Camera device.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, camera: CameraDevice): Unit {
        match (`type`) {
            case CameraCallbackType.CameraError => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraInput off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
        synchronized(errorMutex) {
            let callbackList = errorList
            if (callbackList.size == 0) {
                CAMERA_LOG.error("CameraInput off failed: The event is not registered")
                return
            }
            unsafe {
                let errCode = FfiCameraInputOffAllError(this.getID())
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                } else {
                    callbackList.clear()
                }
            }
        }
    }
}
