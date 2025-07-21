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
 * Camera manager object.
 *
 * @relation interface CameraManager
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CameraManager <: RemoteDataLite {
    let cameraStatusList = ArrayList<(CallbackObject, Int64)>()
    let cameraStatusMutex = Mutex()
    let foldStatusList = ArrayList<(CallbackObject, Int64)>()
    let foldStatusMutex = Mutex()
    let torchStatusList = ArrayList<(CallbackObject, Int64)>()
    let torchStatusMutex = Mutex()

    init() {
        super(unsafe { FfiCameraManagerConstructor() })
    }

    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Queries whether the current camera is muted.
     *
     * @returns { Bool } Is camera muted.
     * @relation isCameraMuted(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func isCameraMuted(): Bool {
        return unsafe { FfiCameraManagerIsCameraMuted() }
    }

    /**
     * Check if a specifies torch mode is supported.
     * @param { TorchMode } mode - torch mode.
     * @returns { Bool } is torch mode supported.
     * @relation isTorchModeSupported(mode: TorchMode): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func isTorchModeSupported(torchMode: TorchMode): Bool {
        return unsafe { FfiCameraManagerIsTorchModeSupported(torchMode.getValue()) }
    }

    /**
     * Check if the device has a torch.
     *
     * @returns { Bool } this value that specifies whether the device has a torch.
     * @relation isTorchSupported(): boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func isTorchSupported(): Bool {
        return unsafe { FfiCameraManagerIsTorchSupported() }
    }

    /**
     * Get current torch mode.
     *
     * @returns { TorchMode } torch mode.
     * @relation getTorchMode(): TorchMode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getTorchMode(): TorchMode {
        let mode: Int32 = unsafe { FfiCameraManagerGetTorchMode() }
        return TorchMode.parse(mode)
    }

    /**
     * Set torch mode to the device.
     *
     * @param { TorchMode } mode - torch mode.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation setTorchMode(mode: TorchMode): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func setTorchMode(torchMode: TorchMode): Unit {
        let errCode = unsafe { FfiCameraManagerSetTorchMode(torchMode.getValue()) }
        successOrThrow(errCode)
    }

    /**
     * Gets the supported camera device objects and return the results synchronously.
     *
     * @returns { Array<CameraDevice> } An array of supported cameras.
     * @relation getSupportedCameras(): Array<CameraDevice>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedCameras(): Array<CameraDevice> {
        var errCode: Int32 = 0
        let carr: CArrCCameraDevice = unsafe { FfiCameraManagerGetSupportedCameras(getID(), inout errCode) }
        let res = carr.toArray()
        carr.free()
        successOrThrow(errCode)
        return res
    }

    /**
     * Gets supported scene mode for specific camera.
     *
     * @param { CameraDevice } camera - Camera device.
     * @returns { Array<SceneMode> } An array of supported scene mode of camera.
     * @relation getSupportedSceneModes(camera: CameraDevice): Array<SceneMode>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedSceneModes(camera: CameraDevice): Array<SceneMode> {
        unsafe {
            var errCode: Int32 = 0
            let ret = FfiCameraManagerGetSupportedSceneModes(getID(), CCameraDevice(camera), inout errCode)
            let head = ret.head
            let size = ret.size
            try {
                successOrThrow(errCode)
                return Array<SceneMode>(size, {i => SceneMode.parse(head.read(i))})
            } finally {
                LibC.free<Int32>(head)
            }
        }
    }

    /**
     * Gets supported output capability for specific camera.
     *
     * @param { CameraDevice } camera - Camera device, obtained through the getSupportedCameras interface.
     * @param { SceneMode } mode - Scene mode, obtained through the getSupportedSceneModes interface.
     * @returns { CameraOutputCapability } The camera output capability.
     * @relation getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability {
        var errCode: Int32 = 0
        let ret = unsafe {
            FfiCameraManagerGetSupportedOutputCapability(getID(), CCameraDevice(camera), mode.getValue(), inout errCode)
        }
        try {
            successOrThrow(errCode)
            return ret.toCameraOutputCapability()
        } finally {
            ret.free()
        }
    }

    /**
     * Creates a CameraInput instance by camera.
     *
     * Before using this interface, first through the getSupportedCameras interface to query the current list of camera
     * devices supported by the device, the developer needs to be based on specific scenarios to choose the camera device
     * that meets the needs of the developer, and then use this interface to create a CameraInput instance.
     *
     * @permission ohos.permission.CAMERA
     * @param { CameraDevice } camera - Camera device used to create the instance.
     * @returns { CameraInput } Returns a CameraInput instance. Failure of an interface call returns the corresponding
     * error code, which is of type CameraErrorCode.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createCameraInput(camera: CameraDevice): CameraInput
     */
    @!APILevel[
        21,
        permission: "ohos.permission.CAMERA",
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createCameraInput(camera: CameraDevice): CameraInput {
        unsafe {
            var errCode: Int32 = 0
            let cameraInputId = FfiCameraManagerCreateCameraInputWithCameraDevice(getID(), CCameraDevice(camera),
                inout errCode)
            successOrThrow(errCode)
            return CameraInput(cameraInputId)
        }
    }

    /**
     * Creates a CameraInput instance by camera position and type.
     *
     * @permission ohos.permission.CAMERA
     * @param { CameraPosition } position - Camera position, first get the supported camera device
     * objects through the getSupportedCameras interface, and then get the device position information
     * based on the returned camera device objects.
     * @param { CameraType } type - camera type, first get the supported camera device object through
     * the getSupportedCameras interface, then get the device type information based on the returned
     * camera device object.
     * @returns { CameraInput } Returns a CameraInput instance. Failure of an interface call returns
     * the corresponding error code, which is of type CameraErrorCode.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createCameraInput(position: CameraPosition, type: CameraType): CameraInput
     */
    @!APILevel[
        21,
        permission: "ohos.permission.CAMERA",
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createCameraInput(position: CameraPosition, cameraType: CameraType): CameraInput {
        unsafe {
            var errCode: Int32 = 0
            let cameraInputId = FfiCameraManagerCreateCameraInputWithCameraDeviceInfo(getID(), position.getValue(),
                cameraType.getValue(), inout errCode)
            successOrThrow(errCode)
            return CameraInput(cameraInputId)
        }
    }

    /**
     * Creates a PreviewOutput instance.
     *
     * @param { Profile } profile - Supported preview configuration information,
     * obtained through the getSupportedOutputCapability API.
     * @param { String } surfaceId - Surface object id used in camera photo output.
     * @returns { PreviewOutput } The PreviewOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createPreviewOutput(profile: Profile, surfaceId: string): PreviewOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createPreviewOutput(profile: Profile, surfaceId: String): PreviewOutput {
        unsafe {
            var id: Int64 = 0
            try (cSurfaceId = LibC.mallocCString(surfaceId).asResource()) {
                var errCode: Int32 = 0
                id = FfiCameraManagerCreatePreviewOutput(CProfile(profile), cSurfaceId.value, inout errCode)
                successOrThrow(errCode)
            }
            return PreviewOutput(id)
        }
    }

    /**
     * Creates a PreviewOutput instance without profile.
     * You can use this method to create a preview output instance without a profile, This instance can
     * only be used in a preconfiged session.
     *
     * @param { String } surfaceId - Surface object id used in camera preview output.
     * @returns { PreviewOutput } The PreviewOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createPreviewOutput(surfaceId: string): PreviewOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createPreviewOutput(surfaceId: String): PreviewOutput {
        unsafe {
            var id: Int64 = 0
            try (cSurfaceId = LibC.mallocCString(surfaceId).asResource()) {
                var errCode: Int32 = 0
                id = FfiCameraManagerCreatePreviewOutputWithoutProfile(cSurfaceId.value, inout errCode)
                successOrThrow(errCode)
            }
            return PreviewOutput(id)
        }
    }

    /**
     * Creates a PhotoOutput instance without surfaceId.
     * Call PhotoOutput capture interface will give a callback,
     * {@link on(type: 'photoAvailable', callback: AsyncCallback<Photo>)}
     * You can use this method to create a photo output instance without a profile, This instance can
     * only be used in a preconfiged session.
     *
     * @returns { PhotoOutput } The PhotoOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createPhotoOutput(profile?: Profile): PhotoOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createPhotoOutput(): PhotoOutput {
        unsafe {
            var errCode: Int32 = 0
            let id = FfiCameraManagerCreatePhotoOutput(inout errCode)
            successOrThrow(errCode)
            return PhotoOutput(id)
        }
    }

    /**
     * Creates a PhotoOutput instance without surfaceId.
     * Call PhotoOutput capture interface will give a callback,
     * {@link on(type: 'photoAvailable', callback: AsyncCallback<Photo>)}
     * You can use this method to create a photo output instance without a profile, This instance can
     * only be used in a preconfiged session.
     *
     * @param { Profile } profile - Photo output profile.
     * @returns { PhotoOutput } The PhotoOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createPhotoOutput(profile?: Profile): PhotoOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createPhotoOutput(profile: Profile): PhotoOutput {
        unsafe {
            var errCode: Int32 = 0
            let id = FfiCameraManagerCreatePhotoOutputWithProfile(CProfile(profile), inout errCode)
            successOrThrow(errCode)
            return PhotoOutput(id)
        }
    }

    /**
     * Creates a VideoOutput instance.
     *
     * @param { VideoProfile } profile - Video profile.
     * @param { String } surfaceId - Surface object id used in camera video output.
     * @returns { VideoOutput } The VideoOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createVideoOutput(profile: VideoProfile, surfaceId: string): VideoOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createVideoOutput(profile: VideoProfile, surfaceId: String): VideoOutput {
        unsafe {
            var errCode: Int32 = 0
            var videoOutputId: Int64 = 0
            try (cSurfaceId = LibC.mallocCString(surfaceId).asResource()) {
                let cVideoProfile = CVideoProfile(profile.format.getValue(), profile.size.width, profile.size.height,
                    CFrameRateRange(profile.frameRateRange.min, profile.frameRateRange.max))
                videoOutputId = FfiCameraManagerCreateVideoOutput(cVideoProfile, cSurfaceId.value, inout errCode)
                successOrThrow(errCode)
            }
            return VideoOutput(videoOutputId)
        }
    }

    /**
     * Creates a VideoOutput instance without profile.
     * You can use this method to create a video output instance without a profile, This instance can
     * only be used in a preconfiged session.
     *
     * @param { String } surfaceId - Surface object id used in camera video output.
     * @returns { VideoOutput } The VideoOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createVideoOutput(surfaceId: string): VideoOutput
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createVideoOutput(surfaceId: String): VideoOutput {
        unsafe {
            var errCode: Int32 = 0
            var videoOutputId: Int64 = 0
            try (cSurfaceId = LibC.mallocCString(surfaceId).asResource()) {
                videoOutputId = FfiCameraManagerCreateVideoOutputWithOutProfile(cSurfaceId.value, inout errCode)
                successOrThrow(errCode)
            }
            return VideoOutput(videoOutputId)
        }
    }

    /**
     * Gets a Session instance by specific scene mode.
     *
     * @param { SceneMode } mode - The modes supported by the camera. If the passed parameters are
     * abnormal (e.g. out of range, passed null or undefined, etc.), the actual interface will not take effect.
     * @returns { Session } Session instance. Failure of an interface call returns the appropriate error code,
     * which is of type CameraErrorCode.
     * @throws { BusinessException } 7400101 - Parameter error. Possible causes:
     * 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types;
     * 3. Parameter verification failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation createSession<T extends Session>(mode: SceneMode): T
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createSession(mode: SceneMode): Session {
        var errCode: Int32 = 0
        let id = unsafe { FfiCameraManagerCreateSession(mode.getValue(), inout errCode) }
        successOrThrow(errCode)
        match (mode) {
            case SceneMode.NormalPhoto => return PhotoSession(id)
            case SceneMode.NormalVideo => return VideoSession(id)
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }

    /**
     * Camera state callback to get the state change of the camera by registering a callback
     * function. This API uses an asynchronous callback to return the result.
     *
     * Description: Currently, it is not allowed to use off() to unregister the callback
     * within the callback method of on().
     *
     * @param { CameraEvents } event - Event type.
     * @param { Callback1Argument<CameraStatusInfo> } callback - Callback used to get the camera status change.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation on(type: 'cameraStatus', callback: AsyncCallback<CameraStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(event: CameraEvents, callback: Callback1Argument<CameraStatusInfo>): Unit {
        match (event) {
            case CameraEvents.CameraStatus => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        synchronized(cameraStatusMutex) {
            let callbackList = cameraStatusList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("CameraManager on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CCameraStatusInfo => callback.invoke(value.toCameraStatusInfo())}
                let lambdaData = Callback1Param<CCameraStatusInfo, Unit>(wrapper)
                let errCode = FfiCameraManagerOnCameraStatusChanged(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Registers a listener for fold state changes. This API uses an asynchronous callback to return the result.
     *
     * Description: Currently, it is not allowed to use off() to unregister the callback
     * within the callback method of on().
     *
     * @param { CameraEvents } event - Event type.
     * @param { Callback1Argument<FoldStatusInfo> } callback - Callback used to get the fold status change.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation on(type: 'foldStatusChange', callback: AsyncCallback<FoldStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(event: CameraEvents, callback: Callback1Argument<FoldStatusInfo>): Unit {
        match (event) {
            case CameraEvents.FoldStatusChange => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        synchronized(foldStatusMutex) {
            let callbackList = foldStatusList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("CameraManager on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CFoldStatusInfo => callback.invoke(value.toFoldStatusInfo())}
                let lambdaData = Callback1Param<CFoldStatusInfo, Unit>(wrapper)
                let errCode = FfiCameraManagerOnFoldStatusChanged(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Registers a listener for flashlight state changes to get flashlight state change by registering
     * a callback function. This API uses an asynchronous callback to return the result.
     *
     * Description: Currently, it is not allowed to use off() to unregister the callback
     * within the callback method of on().
     *
     * @param { CameraEvents } event - Event type
     * @param { Callback1Argument<TorchStatusInfo> } callback - Callback used to return the torch status change
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation on(type: 'torchStatusChange', callback: AsyncCallback<TorchStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(event: CameraEvents, callback: Callback1Argument<TorchStatusInfo>): Unit {
        match (event) {
            case CameraEvents.TorchStatusChange => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
        synchronized(torchStatusMutex) {
            let callbackList = torchStatusList
            if (findCallbackObject(callbackList, callback)) {
                CAMERA_LOG.error("CameraManager on failed: ${paramError("callback object", "different")}")
                return
            }
            unsafe {
                let wrapper = {value: CTorchStatusInfo => callback.invoke(value.toTorchStatusInfo())}
                let lambdaData = Callback1Param<CTorchStatusInfo, Unit>(wrapper)
                let errCode = FfiCameraManagerOnTorchStatusChange(getID(), lambdaData.getID())
                successOrThrow(errCode)
                callbackList.add((callback, lambdaData.getID()))
            }
        }
    }

    /**
     * Unsubscribes from camera status change event callback.
     *
     * @param { CameraEvents } event - Event type.
     * @param { Callback1Argument<CameraStatusInfo> } callback - Callback used to get the camera status change.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation off(type: 'cameraStatus', callback?: AsyncCallback<CameraStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(event: CameraEvents, callback: Callback1Argument<CameraStatusInfo>): Unit {
        match (event) {
            case CameraEvents.CameraStatus => off(IdClassInfo(this.getID(), "CameraManager"), cameraStatusList,
                cameraStatusMutex, callback, FfiCameraManagerOffCameraStatusChanged)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Unsubscribes from fold status change event callback.
     *
     * @param { CameraEvents } event - Event type.
     * @param { Callback1Argument<FoldStatusInfo> } callback - Callback used to get the fold status change.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation off(type: 'foldStatusChange', callback?: AsyncCallback<FoldStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(event: CameraEvents, callback: Callback1Argument<FoldStatusInfo>): Unit {
        match (event) {
            case CameraEvents.FoldStatusChange => off(IdClassInfo(this.getID(), "CameraManager"), foldStatusList,
                foldStatusMutex, callback, FfiCameraManagerOffFoldStatusChanged)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Unsubscribes torch status change event callback.
     *
     * @param { CameraEvents } event - Event type
     * @param { Callback1Argument<TorchStatusInfo> } callback - Callback used to return the torch status change
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation off(type: 'torchStatusChange', callback?: AsyncCallback<TorchStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(event: CameraEvents, callback: Callback1Argument<TorchStatusInfo>): Unit {
        match (event) {
            case CameraEvents.TorchStatusChange => off(IdClassInfo(this.getID(), "CameraManager"), torchStatusList,
                torchStatusMutex, callback, FfiCameraManagerOffTorchStatusChange)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }

    /**
     * Unsubscribes callback.
     *
     * @param { CameraEvents } event - Event type
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @relation off(type: 'torchStatusChange', callback?: AsyncCallback<TorchStatusInfo>): void
     * @relation off(type: 'foldStatusChange', callback?: AsyncCallback<FoldStatusInfo>): void
     * @relation off(type: 'torchStatusChange', callback?: AsyncCallback<TorchStatusInfo>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(event: CameraEvents): Unit {
        match (event) {
            case CameraEvents.CameraStatus => offAll(IdClassInfo(this.getID(), "CameraManager"), cameraStatusList,
                cameraStatusMutex, FfiCameraManagerOffAllCameraStatusChanged)
            case CameraEvents.FoldStatusChange => offAll(IdClassInfo(this.getID(), "CameraManager"),
                foldStatusList, foldStatusMutex, FfiCameraManagerOffAllFoldStatusChanged)
            case CameraEvents.TorchStatusChange => offAll(IdClassInfo(this.getID(), "CameraManager"),
                torchStatusList, torchStatusMutex, FfiCameraManagerOffAllTorchStatusChange)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }
    }
}
