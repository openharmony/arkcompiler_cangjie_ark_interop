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
 * @interface CameraManager
 * @syscap SystemCapability.Multimedia.Camera.Core
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
     * Determine whether camera is muted.
     *
     * @returns { Bool } Is camera muted.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * Gets supported camera descriptions.
     *
     * @returns { Array<CameraDevice> } An array of supported cameras.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @param { CameraDevice } camera - Camera device.
     * @param { SceneMode } mode - Scene mode.
     * @returns { CameraOutputCapability } The camera output capability.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @permission ohos.permission.CAMERA
     * @param { CameraDevice } camera - Camera device used to create the instance.
     * @returns { CameraInput } The CameraInput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @param { CameraPosition } position - Target camera position.
     * @param { CameraType } type - Target camera type.
     * @returns { CameraInput } The CameraInput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400102 - Operation not allowed.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        permission: "ohos.permission.CAMERA",
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createCameraInput(position: CameraPosition, `type`: CameraType): CameraInput {
        unsafe {
            var errCode: Int32 = 0
            let cameraInputId = FfiCameraManagerCreateCameraInputWithCameraDeviceInfo(getID(), position.getValue(),
                `type`.getValue(), inout errCode)
            successOrThrow(errCode)
            return CameraInput(cameraInputId)
        }
    }

    /**
     * Creates a PreviewOutput instance.
     *
     * @param { Profile } profile - Preview output profile.
     * @param { String } surfaceId - Surface object id used in camera photo output.
     * @returns { PreviewOutput } The PreviewOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * @syscap SystemCapability.Multimedia.Camera.Core
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
     * Creates a MetadataOutput instance.
     *
     * @param { Array<MetadataObjectType> } metadataObjectTypes - Array of MetadataObjectType.
     * @returns { MetadataOutput } The MetadataOutput instance.
     * @throws { BusinessException } 7400101 - Parameter missing or parameter type incorrect.
     * @throws { BusinessException } 7400201 - Camera service fatal error.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func createMetadataOutput(metadataObjectTypes: Array<MetadataObjectType>): MetadataOutput {
        unsafe {
            let size = metadataObjectTypes.size
            let ptr = safeMalloc<Int32>(count: size)
            for (i in 0..size) {
                ptr.write(i, metadataObjectTypes[i].getValue())
            }
            let typesArrI32 = CArrI32(ptr, size)
            var errCode: Int32 = 0
            let metadataOutputId = FfiCameraManagerCreateMetadataOutput(typesArrI32, inout errCode)
            LibC.free(ptr)
            successOrThrow(errCode)
            return MetadataOutput(metadataOutputId)
        }
    }

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
            case SceneMode.NORMAL_PHOTO => return PhotoSession(id)
            case SceneMode.NORMAL_VIDEO => return VideoSession(id)
            case SceneMode.SECURE_PHOTO => return SecureSession(id)
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }

    /**
     * Subscribes camera status change event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CameraStatusInfo> } callback - Callback used to get the camera status change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraStatus => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
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
     * Subscribes fold status change event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FoldStatusInfo> } callback - Callback used to get the fold status change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FoldStatusChange => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
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
     * Subscribes torch status change event callback.
     *
     * @param { CameraCallbackType } type - Event type
     * @param { Callback1Argument<TorchStatusInfo> } callback - Callback used to return the torch status change
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func on(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.TorchStatusChange => ()
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager on failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
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
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<CameraStatusInfo> } callback - Callback used to get the camera status change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.CameraStatus => off(IdClassInfo(this.getID(), "CameraManager"), cameraStatusList,
                cameraStatusMutex, callback, FfiCameraManagerOffCameraStatusChanged)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes from fold status change event callback.
     *
     * @param { CameraCallbackType } type - Event type.
     * @param { Callback1Argument<FoldStatusInfo> } callback - Callback used to get the fold status change.
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.FoldStatusChange => off(IdClassInfo(this.getID(), "CameraManager"), foldStatusList,
                foldStatusMutex, callback, FfiCameraManagerOffFoldStatusChanged)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    /**
     * Unsubscribes torch status change event callback.
     *
     * @param { CameraCallbackType } type - Event type
     * @param { Callback1Argument<TorchStatusInfo> } callback - Callback used to return the torch status change
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit {
        match (`type`) {
            case CameraCallbackType.TorchStatusChange => off(IdClassInfo(this.getID(), "CameraManager"), torchStatusList,
                torchStatusMutex, callback, FfiCameraManagerOffTorchStatusChange)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func off(`type`: CameraCallbackType): Unit {
        match (`type`) {
            case CameraCallbackType.CameraStatus => offAll(IdClassInfo(this.getID(), "CameraManager"), cameraStatusList,
                cameraStatusMutex, FfiCameraManagerOffAllCameraStatusChanged)
            case CameraCallbackType.FoldStatusChange => offAll(IdClassInfo(this.getID(), "CameraManager"),
                foldStatusList, foldStatusMutex, FfiCameraManagerOffAllFoldStatusChanged)
            case CameraCallbackType.TorchStatusChange => offAll(IdClassInfo(this.getID(), "CameraManager"),
                torchStatusList, torchStatusMutex, FfiCameraManagerOffAllTorchStatusChange)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR,
                "CameraManager off failed: ${getErrorMsg(ERR_PARAMETER_ERROR)}")
        }
    }
}
