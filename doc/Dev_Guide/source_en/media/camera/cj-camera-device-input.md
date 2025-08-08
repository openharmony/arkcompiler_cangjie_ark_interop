# Device Input (Cangjie)

Camera applications can perform basic operations such as preview, photo capture, and video recording by invoking and controlling camera devices.

## Development Procedure

For detailed API descriptions, refer to the [Camera API Reference](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md).

1. Import the camera interface, which provides camera-related properties and methods. The import method is as follows:

    <!-- compile -->

    ```cangjie
    import kit.CameraKit.*
    import kit.BasicServicesKit.*
    import ohos.base.Callback1Argument
    import ohos.base.BussinessException
    ```

2. Create a camera input stream using the [createCameraInput](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-createcamerainputcameradevice) method in the [CameraManager](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#class-cameramanager) class.

    <!-- compile -->

    ```cangjie
    class ErrorCallBack <: Callback1Argument<BusinessException> {
        public open func invoke(error: BusinessException): Unit {
            AppLog.error("Camera input error code: ${error.code}")
        }
    }

    func createInput(cameraDevice: CameraDevice, cameraManager: CameraManager): CameraInput {
        // Create a camera input stream.
        let cameraInput: CameraInput = cameraManager.createCameraInput(cameraDevice)
        // Monitor cameraInput error messages.
        cameraInput.on(CameraCallbackType.CameraError, cameraDevice, ErrorCallBack())
        // Open the camera.
        cameraInput.open()
        return cameraInput
    }
    ```

3. Use the [getSupportedSceneModes](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-getsupportedscenemodescameradevice) method to obtain the list of supported modes for the current camera device. The list contains all supported [SceneMode](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#enum-scenemode) values.

    <!-- compile -->

    ```cangjie
    func getSupportedSceneMode(cameraDevice: CameraDevice, cameraManager: CameraManager): Array<SceneMode> {
        // Get the list of supported modes for the camera device.
        let sceneModeArray: Array<SceneMode> = cameraManager.getSupportedSceneModes(cameraDevice)
        if (sceneModeArray.size > 0) {
            for (index in 0..sceneModeArray.size) {
                AppLog.info("Camera SceneMode : ${sceneModeArray[index]}")
            }
            return sceneModeArray
        } else {
            AppLog.error("cameraManager.getSupportedSceneModes error")
            return []
        }
    }
    ```

4. Use the [getSupportedOutputCapability](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-getsupportedoutputcapabilitycameradevice-scenemode) method to obtain all supported output streams for the current camera device, such as preview streams, photo capture streams, and video recording streams. The output streams are contained in various profile fields of [CameraOutputCapability](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#struct-cameraoutputcapability). Depending on the specified [SceneMode](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#enum-scenemode) of the camera device, different types of output streams need to be added.

    <!-- compile -->

    ```cangjie
    func getSupportedOutputCapability(cameraDevice: CameraDevice, cameraManager: CameraManager, sceneMode: SceneMode): CameraOutputCapability {
        // Get the supported output stream capabilities of the camera device.
        let cameraOutputCapability: CameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, sceneMode)
        // Taking NORMAL_PHOTO mode as an example, preview streams and photo capture streams need to be added.
        // The previewProfiles property retrieves the supported preview output streams for the current device.
        let previewProfilesArray: Array<Profile> = cameraOutputCapability.previewProfiles
        if (!previewProfilesArray.size == 0) {
            AppLog.error("createOutput previewProfilesArray is empty")
        }
        // The photoProfiles property retrieves the supported photo capture output streams for the current device.
        let photoProfilesArray: Array<Profile> = cameraOutputCapability.photoProfiles
        if (photoProfilesArray.size == 0) {
            AppLog.error("createOutput photoProfilesArray is empty")
        }
        return cameraOutputCapability
    }
    ```