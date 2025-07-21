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

import ohos.ffi.*

foreign {
    // CameraManager
    func FfiCameraManagerConstructor(): Int64

    func FfiCameraManagerGetSupportedCameras(id: Int64, errCode: CPointer<Int32>): CArrCCameraDevice

    func FfiCameraManagerGetSupportedSceneModes(id: Int64, cameraDevice: CCameraDevice, errCode: CPointer<Int32>): CArrI32

    func FfiCameraManagerGetSupportedOutputCapability(id: Int64, cameraDevice: CCameraDevice, modeType: Int32,
        errCode: CPointer<Int32>): CCameraOutputCapability

    func FfiCameraManagerIsCameraMuted(): Bool

    func FfiCameraManagerCreateCameraInputWithCameraDevice(id: Int64, cameraDevice: CCameraDevice,
        errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreateCameraInputWithCameraDeviceInfo(id: Int64, cameraPosition: Int32, cameraType: Int32,
        errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreatePreviewOutput(profile: CProfile, surfaceId: CString, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreatePreviewOutputWithoutProfile(surfaceId: CString, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreatePhotoOutput(errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreatePhotoOutputWithProfile(profile: CProfile, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreateVideoOutput(profile: CVideoProfile, surfaceId: CString, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreateVideoOutputWithOutProfile(surfaceId: CString, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreateMetadataOutput(metadataObjectTypes: CArrI32, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerCreateSession(mode: Int32, errCode: CPointer<Int32>): Int64

    func FfiCameraManagerIsTorchSupported(): Bool

    func FfiCameraManagerIsTorchModeSupported(torchMode: Int32): Bool

    func FfiCameraManagerGetTorchMode(): Int32

    func FfiCameraManagerSetTorchMode(torchMode: Int32): Int32

    func FfiCameraManagerOnCameraStatusChanged(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffCameraStatusChanged(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffAllCameraStatusChanged(id: Int64): Int32

    func FfiCameraManagerOnFoldStatusChanged(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffFoldStatusChanged(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffAllFoldStatusChanged(id: Int64): Int32

    func FfiCameraManagerOnTorchStatusChange(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffTorchStatusChange(id: Int64, callbackId: Int64): Int32

    func FfiCameraManagerOffAllTorchStatusChange(id: Int64): Int32

    // // MetadataOutput
    func FfiCameraMetadataOutputStart(id: Int64): Int32

    func FfiCameraMetadataOutputStop(id: Int64): Int32

    func FfiCameraMetadataOutputOnMetadataObjectsAvailable(id: Int64, callbackId: Int64): Int32

    func FfiCameraMetadataOutputOffMetadataObjectsAvailable(id: Int64, callbackId: Int64): Int32

    func FfiCameraMetadataOutputOffAllMetadataObjectsAvailable(id: Int64): Int32

    func FfiCameraMetadataOutputOnError(id: Int64, callbackId: Int64): Int32

    func FfiCameraMetadataOutputOffError(id: Int64, callbackId: Int64): Int32

    func FfiCameraMetadataOutputOffAllError(id: Int64): Int32

    func FfiCameraMetadataOutputRelease(id: Int64): Int32

    // PhotoOutput
    func FfiCameraPhotoOutputCapture(id: Int64): Int32

    func FfiCameraPhotoOutputCaptureWithSetting(id: Int64, setting: CPhotoCaptureSetting): Int32

    func FfiCameraPhotoOutputIsMovingPhotoSupported(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiCameraPhotoOutputEnableMovingPhoto(id: Int64, enabled: Bool): Int32

    func FfiCameraPhotoOutputIsMirrorSupported(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiCameraPhotoOutputEnableMirror(id: Int64, isMirror: Bool): Int32

    func FfiCameraPhotoOutputSetMovingPhotoVideoCodecType(id: Int64, codecType: Int32): Int32

    func FfiCameraPhotoOutputGetActiveProfile(id: Int64, errCode: CPointer<Int32>): CProfile

    func FfiCameraPhotoOutputGetPhotoRotation(id: Int64, deviceDegree: Int32, errCode: CPointer<Int32>): Int32

    func FfiCameraPhotoOutputOnCaptureStartWithInfo(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffCaptureStartWithInfo(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllCaptureStartWithInfo(id: Int64): Int32

    func FfiCameraPhotoOutputOnFrameShutter(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffFrameShutter(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllFrameShutter(id: Int64): Int32

    func FfiCameraPhotoOutputOnCaptureEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffCaptureEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllCaptureEnd(id: Int64): Int32

    func FfiCameraPhotoOutputOnFrameShutterEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffFrameShutterEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllFrameShutterEnd(id: Int64): Int32

    func FfiCameraPhotoOutputOnCaptureReady(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffCaptureReady(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllCaptureReady(id: Int64): Int32

    func FfiCameraPhotoOutputOnEstimatedCaptureDuration(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffEstimatedCaptureDuration(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllEstimatedCaptureDuration(id: Int64): Int32

    func FfiCameraPhotoOutputOnError(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffError(id: Int64, callbackId: Int64): Int32

    func FfiCameraPhotoOutputOffAllError(id: Int64): Int32

    func FfiCameraPhotoOutputRelease(id: Int64): Int32

    // // PreviewOutput
    func FfiCameraPreviewOutputGetSupportedFrameRates(id: Int64, errCode: CPointer<Int32>): CArrFrameRateRange

    func FfiCameraPreviewOutputSetFrameRate(id: Int64, min: Int32, max: Int32): Int32

    func FfiCameraPreviewOutputGetActiveFrameRate(id: Int64, errCode: CPointer<Int32>): CFrameRateRange

    func FfiCameraPreviewOutputGetActiveProfile(id: Int64, errCode: CPointer<Int32>): CProfile

    func FfiCameraPreviewOutputGetPreviewRotation(id: Int64, value: Int32, errCode: CPointer<Int32>): Int32

    func FfiCameraPreviewOutputSetPreviewRotation(id: Int64, imageRotation: Int32, isDisplayLocked: Bool): Int32

    func FfiCameraPreviewOutputOnFrameStart(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOnFrameEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOnError(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOffFrameStart(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOffFrameEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOffError(id: Int64, callbackId: Int64): Int32

    func FfiCameraPreviewOutputOffAllFrameStart(id: Int64): Int32

    func FfiCameraPreviewOutputOffAllFrameEnd(id: Int64): Int32

    func FfiCameraPreviewOutputOffAllError(id: Int64): Int32

    func FfiCameraPreviewOutputRelease(id: Int64): Int32

    // CameraInput
    func FfiCameraInputOpen(id: Int64): Int32

    func FfiCameraInputOpenWithIsEnableSecureCamera(id: Int64, isEnableSecureCamera: Bool, secureSeqId: CPointer<UInt64>): Int32

    func FfiCameraInputClose(id: Int64): Int32

    func FfiCameraInputOnError(id: Int64, callbackId: Int64): Int32

    func FfiCameraInputOffError(id: Int64, callbackId: Int64): Int32

    func FfiCameraInputOffAllError(id: Int64): Int32

    // VideoOutput
    func FfiCameraVideoOutputStart(id: Int64): Int32

    func FfiCameraVideoOutputStop(id: Int64): Int32

    func FfiCameraVideoOutputOnFrameStart(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffFrameStart(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffAllFrameStart(id: Int64): Int32

    func FfiCameraVideoOutputOnFrameEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffFrameEnd(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffAllFrameEnd(id: Int64): Int32

    func FfiCameraVideoOutputOnError(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffError(id: Int64, callbackId: Int64): Int32

    func FfiCameraVideoOutputOffAllError(id: Int64): Int32

    func FfiCameraVideoOutputGetSupportedFrameRates(id: Int64, errCode: CPointer<Int32>): CArrFrameRateRange

    func FfiCameraVideoOutputSetFrameRate(id: Int64, minFps: Int32, maxFps: Int32): Int32

    func FfiCameraVideoOutputGetActiveFrameRate(id: Int64, errCode: CPointer<Int32>): CFrameRateRange

    func FfiCameraVideoOutputGetActiveProfile(id: Int64, errCode: CPointer<Int32>): CVideoProfile

    func FfiCameraVideoOutputGetVideoRotation(id: Int64, imageRotation: Int32, errCode: CPointer<Int32>): Int32

    func FfiCameraVideoOutputRelease(id: Int64): Int32

    func FfiCameraSessionBeginConfig(id: Int64): Int32

    func FfiCameraSessionCommitConfig(id: Int64): Int32

    func FfiCameraSessionCanAddInput(id: Int64, cameraInputId: Int64, errCode: CPointer<Int32>): Bool

    func FfiCameraSessionAddInput(id: Int64, cameraInputId: Int64): Int32

    func FfiCameraSessionRemoveInput(id: Int64, cameraInputId: Int64): Int32

    func FfiCameraSessionCanAddOutput(id: Int64, cameraOutputId: Int64, outputType: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraSessionAddOutput(id: Int64, cameraOutputId: Int64, outputType: Int32): Int32

    func FfiCameraSessionRemoveOutput(id: Int64, cameraOutputId: Int64, outputType: Int32): Int32

    func FfiCameraSessionStart(id: Int64): Int32

    func FfiCameraSessionStop(id: Int64): Int32

    func FfiCameraSessionRelease(id: Int64): Int32

    func FfiCameraSessionCanPreconfig(id: Int64, preconfigType: Int32, preconfigRatio: Int32, errCode: CPointer<Int32>): Bool

    func FfiCameraSessionPreconfig(id: Int64, preconfigType: Int32, preconfigRatio: Int32, errCode: CPointer<Int32>): Unit

    func FfiCameraSessionAddSecureOutput(id: Int64, cameraOutputId: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOnError(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffError(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffAllError(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOnFocusStateChange(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffFocusStateChange(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffAllFocusStateChange(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOnSmoothZoomInfoAvailable(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffSmoothZoomInfoAvailable(id: Int64, callback: Int64, errCode: CPointer<Int32>): Unit

    func FfiCameraOffAllSmoothZoomInfoAvailable(id: Int64, errCode: CPointer<Int32>): Unit
}

@C
struct CArrFrameRateRange {
    CArrFrameRateRange(
        let head: CPointer<CFrameRateRange>,
        let size: Int64
    ) {}

    func toArray(): Array<FrameRateRange> {
        unsafe {
            cArr2cjArr<CFrameRateRange, FrameRateRange>(size, head) {
                item => FrameRateRange(item.min, item.max)
            }
        }
    }

    func free() {
        unsafe { LibC.free(head) }
    }
}

@C
struct CCameraDevice {
    CCameraDevice(
        let cameraId: CString,
        let cameraPosition: Int32,
        let cameraType: Int32,
        let connectionType: Int32,
        let cameraOrientation: UInt32
    ) {}

    init(cameraDevice: CameraDevice) {
        this.cameraId = unsafe { LibC.mallocCString(cameraDevice.cameraId) }
        this.cameraPosition = cameraDevice.cameraPosition.getValue()
        this.cameraType = cameraDevice.cameraType.getValue()
        this.connectionType = cameraDevice.connectionType.getValue()
        this.cameraOrientation = cameraDevice.cameraOrientation
    }

    func toCameraDevice(): CameraDevice {
        return CameraDevice(cameraId.toString(), CameraPosition.parse(cameraPosition), CameraType.parse(cameraType),
            ConnectionType.parse(connectionType), cameraOrientation)
    }

    func free(): Unit {
        unsafe { LibC.free(cameraId) }
    }
}

@C
struct CArrCCameraDevice {
    CArrCCameraDevice(
        let head: CPointer<CCameraDevice>,
        let size: Int64
    ) {}

    func toArray(): Array<CameraDevice> {
        unsafe {
            cArr2cjArr<CCameraDevice, CameraDevice>(size, head) {
                item => item.toCameraDevice()
            }
        }
    }

    func free(): Unit {
        if (head.isNull()) {
            return
        }
        for (i in 0..size) {
            unsafe { head.read(i).free() }
        }
        unsafe { LibC.free<CCameraDevice>(head) }
    }
}

@C
struct CCameraOutputCapability {
    CCameraOutputCapability(
        let previewProfiles: CArrCProfile,
        let photoProfiles: CArrCProfile,
        let videoProfiles: CArrCVideoProfile,
        let supportedMetadataObjectTypes: CArrI32
    ) {}

    func toCameraOutputCapability(): CameraOutputCapability {
        let supportedMetadataObjectTypesArr = unsafe {
            Array<MetadataObjectType>(supportedMetadataObjectTypes.size,
                {i => MetadataObjectType.parse(supportedMetadataObjectTypes.head.read(i))})
        }
        let result = CameraOutputCapability(previewProfiles.toArray(), photoProfiles.toArray(), videoProfiles.toArray(),
            supportedMetadataObjectTypesArr)
        return result
    }

    func free() {
        unsafe {
            LibC.free(previewProfiles.head)
            LibC.free(photoProfiles.head)
            LibC.free(videoProfiles.head)
            LibC.free(supportedMetadataObjectTypes.head)
        }
    }
}

@C
struct CArrCProfile {
    CArrCProfile(
        let head: CPointer<CProfile>,
        let size: Int64
    ) {}

    func toArray(): Array<Profile> {
        unsafe {
            cArr2cjArr<CProfile, Profile>(size, head) {
                item => item.toProfile()
            }
        }
    }
}

@C
struct CProfile {
    CProfile(
        let format: Int32,
        let width: UInt32,
        let height: UInt32
    ) {}

    init(profile: Profile) {
        this.format = profile.format.getValue()
        this.width = profile.size.width
        this.height = profile.size.height
    }

    func toProfile(): Profile {
        return Profile(format, width, height)
    }
}

@C
struct CVideoProfile {
    CVideoProfile(
        let format: Int32,
        let width: UInt32,
        let height: UInt32,
        let frameRateRange: CFrameRateRange
    ) {}

    func toVideoProfile(): VideoProfile {
        return VideoProfile(format, width, height, frameRateRange.min, frameRateRange.max)
    }
}

@C
struct CArrCVideoProfile {
    CArrCVideoProfile(
        let head: CPointer<CVideoProfile>,
        let size: Int64
    ) {}

    func toArray(): Array<VideoProfile> {
        unsafe {
            cArr2cjArr<CVideoProfile, VideoProfile>(size, head) {
                item => item.toVideoProfile()
            }
        }
    }
}

@C
struct CFrameRateRange {
    CFrameRateRange(
        let min: Int32,
        let max: Int32
    ) {}
}

@C
struct CLocation {
    CLocation(
        let latitude: Float64,
        let longitude: Float64,
        let altitude: Float64
    ) {}

    init(location: Location) {
        this.latitude = location.latitude
        this.longitude = location.longitude
        this.altitude = location.altitude
    }

    func toLocation(): Location {
        return Location(latitude, longitude, altitude)
    }
}

@C
struct CPhotoCaptureSetting {
    CPhotoCaptureSetting(
        let quality: Int32,
        let rotation: Int32,
        let location: CLocation,
        let mirror: Bool
    ) {}

    init(setting: PhotoCaptureSetting) {
        this.quality = setting.quality.getValue()
        this.rotation = setting.rotation.getValue()
        this.location = CLocation(setting.location)
        this.mirror = setting.mirror
    }
}

@C
struct CCameraStatusInfo {
    CCameraStatusInfo(
        let camera: CCameraDevice,
        let status: Int32
    ) {}

    func toCameraStatusInfo(): CameraStatusInfo {
        let device = CameraDevice(camera.cameraId.toString(), CameraPosition.parse(camera.cameraPosition),
            CameraType.parse(camera.cameraType), ConnectionType.parse(camera.connectionType), camera.cameraOrientation)
        return CameraStatusInfo(device, CameraStatus.parse(status))
    }
}

@C
struct CFoldStatusInfo {
    CFoldStatusInfo(
        let supportedCameras: CArrCCameraDevice,
        let foldStatus: Int32
    ) {}

    func toFoldStatusInfo(): FoldStatusInfo {
        return FoldStatusInfo(supportedCameras.toArray(), FoldStatus.parse(foldStatus))
    }
}

@C
struct CTorchStatusInfo {
    CTorchStatusInfo(
        let isTorchAvailable: Bool,
        let isTorchActive: Bool,
        let torchLevel: Float32
    ) {}

    func toTorchStatusInfo(): TorchStatusInfo {
        return TorchStatusInfo(isTorchAvailable, isTorchActive, torchLevel)
    }
}

@C
struct CErrorCallback {
    CErrorCallback(
        let errorType: Int32,
        let errorMsg: Int32
    ) {}
}

@C
struct CCaptureStartInfo {
    CCaptureStartInfo(
        let captureId: Int32,
        let time: UInt32
    ) {}

    func toCaptureStartInfo() {
        return CaptureStartInfo(captureId, time)
    }
}

@C
struct CFrameShutterInfo {
    CFrameShutterInfo(
        let captureId: Int32,
        let timestamp: UInt64
    ) {}

    func toFrameShutterInfo() {
        return FrameShutterInfo(captureId, timestamp)
    }
}

@C
struct CCaptureEndInfo {
    CCaptureEndInfo(
        let captureId: Int32,
        let frameCount: Int32
    ) {}

    func toCaptureEndInfo() {
        return CaptureEndInfo(captureId, frameCount)
    }
}

@C
struct CRect {
    CRect(
        let topLeftX: Float64,
        let topLeftY: Float64,
        let width: Float64,
        let height: Float64
    ) {}

    func toRect(): Rect {
        return Rect(topLeftX, topLeftY, width, height)
    }
}

@C
struct CMetadataObject {
    CMetadataObject(
        let objType: Int32,
        let timestamp: Int32,
        let boundingBox: CRect
    ) {}
}

@C
struct CArrCMetadataObject {
    CArrCMetadataObject(
        let head: CPointer<CMetadataObject>,
        let size: Int64
    ) {}
}
