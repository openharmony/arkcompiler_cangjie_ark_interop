# Camera Recovery Practice (Cangjie)

This example provides a complete workflow for camera application recovery when switching from background to foreground, helping developers understand the full sequence of interface calls.

Explanation of camera application state changes during background/foreground switching:

- When the camera application moves to the background, it will be forcibly disconnected due to security policies. At this time, the camera status callback returns an available state, indicating the camera device has been closed and is idle.
- When the camera application switches from background to foreground, the camera status callback returns an unavailable state, indicating the camera device is being opened and is busy.
- When switching from background to foreground, the camera application needs to restart the preview stream, capture stream, and camera session management.

Before referring to this example, developers are advised to understand individual operations such as [Camera Management](./cj-camera-device-management.md), [Device Input](./cj-camera-device-input.md), and [Session Management](./cj-camera-session-management.md).

## Development Process

The recommended call flow for camera application recovery when switching from background to foreground:

![Camera Background recovery processing](./figures/camera-background-recovery.png)

## Complete Example

For context acquisition methods, refer to: [Obtaining UIAbility Context Information](../../application-models/cj-uiability-usage.md#obtaining-context-information-of-uiability).

Camera application recovery when switching from background to foreground should be called in the onPageShow lifecycle callback function to reinitialize the camera device.

<!-- compile -->

```cangjie
package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.component.FontWeight
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r
import kit.AbilityKit.*
import kit.CameraKit.*
import ohos.base.BusinessException
import ohos.base.Callback1Argument

var ctx = None<UIAbilityContext>

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello World"

    let context = ctx.getOrThrow()
    let surfaceId: String = ''
    protected override func onPageShow() {
        // When the application switches from background to foreground and the page is displayed, reinitialize the camera device.
        initCamera(context, surfaceId)
    }

    func initCamera(baseContext: UIAbilityContext, surfaceId: String): Unit {
        AppLog.info('onForeGround recovery begin.')
        let cameraManager: CameraManager = getCameraManager(context)
        // Monitor camera status changes.
        cameraManager.on(CameraCallbackType.CameraStatus, Cb1())

        // Get camera list.
        let cameraArray: Array<CameraDevice> = cameraManager.getSupportedCameras()
        if (cameraArray.size <= 0) {
            AppLog.error("cameraManager.getSupportedCameras error")
            return
        }

        for (index in 0..cameraArray.size) {
            AppLog.info('cameraId : ' + cameraArray[index].cameraId) // Get camera ID.
            AppLog.info('cameraPosition : ' + cameraArray[index]
                .cameraPosition
                .toString()) // Get camera position.
            AppLog.info('cameraType : ' + cameraArray[index]
                .cameraType
                .toString()) // Get camera type.
            AppLog.info('connectionType : ' + cameraArray[index]
                .connectionType
                .toString()) // Get camera connection type.
        }

        // Create camera input stream.
        var cameraInput: ?CameraInput = None
        try {
            cameraInput = cameraManager.createCameraInput(cameraArray[0])
        } catch (err: BusinessException) {
            AppLog.error('Failed to createCameraInput errorCode = ${err.code}')
        }
        if (cameraInput.isNone()) {
            return
        }

        // Monitor cameraInput error messages.
        let cameraDevice: CameraDevice = cameraArray[0]
        cameraInput?.on(CameraCallbackType.CameraError, cameraDevice, Cb2())

        // Open camera.
        cameraInput?.open()

        // Get supported mode types.
        let sceneModes: Array<SceneMode> = cameraManager.getSupportedSceneModes(cameraArray[0])
        let isSupportPhotoMode: Bool = sceneModes
            .indexOf(SceneMode.NORMAL_PHOTO)
            .getOrThrow() >= 0
        if (!isSupportPhotoMode) {
            AppLog.error('photo mode not support')
            return
        }
        // Get camera device supported output capabilities.
        let cameraOutputCap: CameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraArray[0],
            SceneMode.NORMAL_PHOTO)
        AppLog.info("outputCapability: ")

        let previewProfilesArray: Array<Profile> = cameraOutputCap.previewProfiles

        let photoProfilesArray: Array<Profile> = cameraOutputCap.photoProfiles

        // Create preview output stream, where the surfaceId parameter refers to the XComponent mentioned above, with the preview stream being the surface provided by the XComponent.
        var previewOutput: ?PreviewOutput = None
        try {
            previewOutput = cameraManager.createPreviewOutput(previewProfilesArray[0], surfaceId)
        } catch (err: BusinessException) {
            AppLog.error('Failed to create the PreviewOutput instance. error code: ${err.code}')
        }
        if (previewOutput.isNone()) {
            return
        }
        // Monitor preview output error messages.
        previewOutput?.on(CameraCallbackType.CameraError, Cb3())

        // Create photo output stream.
        var photoOutput: ?PhotoOutput = None
        try {
            photoOutput = cameraManager.createPhotoOutput(photoProfilesArray[0])
        } catch (err: BusinessException) {
            AppLog.error('Failed to createPhotoOutput errorCode = ${err.code}')
        }
        if (photoOutput.isNone()) {
            return
        }

        // Create session.
        var photoSession: ?PhotoSession = None
        try {
            photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
        } catch (err: BusinessException) {
            AppLog.error('Failed to create the session instance. errorCode = ${err.code}')
        }
        if (photoSession.isNone()) {
            return
        }
        // Monitor session error messages.
        photoSession?.on(CameraCallbackType.CameraError, Cb4())

        // Start configuring session.
        try {
            photoSession?.beginConfig()
        } catch (err: BusinessException) {
            AppLog.error('Failed to beginConfig. errorCode = ')
        }

        // Add camera input stream to session.
        try {
            photoSession?.addInput(cameraInput.getOrThrow())
        } catch (err: BusinessException) {
            AppLog.error('Failed to addInput. errorCode = ${err.code}')
        }

        // Add preview output stream to session.
        try {
            photoSession?.addOutput(previewOutput.getOrThrow())
        } catch (err: BusinessException) {
            AppLog.error('Failed to addOutput(previewOutput). errorCode = ${err.code}')
        }

        // Add photo output stream to session.
        try {
            photoSession?.addOutput(photoOutput.getOrThrow())
        } catch (err: BusinessException) {
            AppLog.error('Failed to addOutput(photoOutput). errorCode = ${err.code}')
        }

        // Commit session configuration.
        photoSession?.commitConfig()

        // Start session.
        photoSession?.start()
        // Check if device supports flash.
        var flashStatus: Bool = false
        try {
            flashStatus = photoSession
                .getOrThrow()
                .hasFlash()
        } catch (err: BusinessException) {
            AppLog.error('Failed to hasFlash. errorCode = ${err.code}')
        }
        AppLog.info('Returned with the flash light support status: ${flashStatus}')

        if (flashStatus) {
            // Check if auto flash mode is supported.
            var flashModeStatus: Bool = false
            try {
                let status: Bool = photoSession
                    .getOrThrow()
                    .isFlashModeSupported(FlashMode.FLASH_MODE_AUTO)
                flashModeStatus = status
            } catch (err: BusinessException) {
                AppLog.error('Failed to check whether the flash mode is supported. errorCode = ${err.code}')
            }
            if (flashModeStatus) {
                // Set auto flash mode.
                try {
                    photoSession?.setFlashMode(FlashMode.FLASH_MODE_AUTO)
                } catch (err: BusinessException) {
                    AppLog.error('Failed to set the flash mode. errorCode = ${err.code}')
                }
            }
        }

        // Check if continuous auto focus mode is supported.
        var focusModeStatus: Bool = false
        try {
            let status: Bool = photoSession
                .getOrThrow()
                .isFocusModeSupported(FocusMode.FOCOS_MODE_CONTINUOUS_AUTO)
            focusModeStatus = status
        } catch (err: BusinessException) {
            AppLog.error('Failed to check whether the focus mode is supported. errorCode = ${err.code}')
        }

        if (focusModeStatus) {
            // Set continuous auto focus mode.
            try {
                photoSession?.setFocusMode(FocusMode.FOCOS_MODE_CONTINUOUS_AUTO)
            } catch (err: BusinessException) {
                AppLog.error('Failed to set the focus mode. errorCode = ${err.code}')
            }
        }

        // Get supported zoom ratio range.
        var zoomRatioRange: Array<Float32> = []
        try {
            zoomRatioRange = photoSession
                .getOrThrow()
                .getZoomRatioRange()
        } catch (err: BusinessException) {
            AppLog.error('Failed to get the zoom ratio range. errorCode = ${err.code}')
        }
        if (zoomRatioRange.size <= 0) {
            return
        }
        // Set zoom ratio.
        try {
            photoSession?.setZoomRatio(zoomRatioRange[0])
        } catch (err: BusinessException) {
            AppLog.error('Failed to set the zoom ratio value. errorCode = ${err.code}')
        }
        let photoCaptureSetting: PhotoCaptureSetting = PhotoCaptureSetting(
            quality: QualityLevel.QUALITY_LEVEL_HIGH, // Set high image quality.
            rotation: ImageRotation.ROTATION_0 // Set image rotation angle to 0.
        )
        // Capture photo with current settings.
        photoOutput?.capture(photoCaptureSetting)

        AppLog.info('onForeGround recovery end.')
    }

    func build() {
        Row {
            Column {
                Text(this.message)
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                    .onClick {
                        evt =>
                    }
            }.width(100.percent)
        }.height(100.percent)
    }
}

class Cb1 <: Callback1Argument<CameraStatusInfo> {
    public func invoke(cameraStatusInfo: CameraStatusInfo): Unit {
        AppLog.info('camera : ${cameraStatusInfo.camera.cameraId}')
        AppLog.info('status: ${cameraStatusInfo.status}')
    }
}

class Cb2 <: Callback1Argument<BusinessException> {
    public func invoke(error: BusinessException): Unit {
        AppLog.error('Camera input error code: ${error.code}')
``````kotlin
    }
}

class Cb3 <: Callback1Argument<BusinessException> {
    public func invoke(error: BusinessException): Unit {
        AppLog.error('Preview output error code: ${error.code}')
    }
}

class Cb4 <: Callback1Argument<BusinessException> {
    public func invoke(error: BusinessException): Unit {
        AppLog.error('Capture session error code: ${error.code}')
    }
}
```