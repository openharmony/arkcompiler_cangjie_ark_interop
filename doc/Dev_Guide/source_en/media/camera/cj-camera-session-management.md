# Session Management (Cangjie)

Before using camera functions such as preview, photo capture, video recording, or metadata, a camera session must be created.

Within a session, the following functionalities can be achieved:

- Configure camera input and output streams. The camera must complete input/output stream configuration before shooting.
  Configuring input streams involves adding device inputs, which for users means selecting a specific camera device for shooting. Configuring output streams determines the format in which data will be output. When an application requires photo capture functionality, the output streams should be configured as preview streams and photo capture streams. Preview stream data will be displayed on XComponent, while photo capture stream data will be saved to the album via the ImageReceiver interface capability.

- Add configurations such as flash mode or focus adjustment. For specific supported configurations and interface descriptions, refer to the [Camera API Reference](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md).

- Session switching control. Applications can switch camera modes by removing and adding output streams. For example, if the current session's output stream is a photo capture stream, the application can remove it and add a video stream as the output stream, thereby switching from photo mode to video mode.

After completing session configuration, the application can submit and start the session to begin calling camera-related functions.

## Development Steps

1. Import relevant interfaces as follows:

    <!-- compile -->

    ```cangjie
    import kit.CameraKit.*
    import kit.BasicServicesKit.*
    import ohos.base.BussinessException
    ```

2. Call the [createSession](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-createsessionscenemode) method in the cameraManager class to create a session.

    <!-- compile -->

    ```cangjie
    func getSession(cameraManager: CameraManager): Session {
        let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
        return session.getOrThrow()
    }
    ```

3. Call the [beginConfig](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-beginconfig) method in the PhotoSession class to configure the session.

    <!-- compile -->

    ```cangjie
    func beginConfig(photoSession: PhotoSession): Unit {
        try {
            photoSession.beginConfig()
        } catch (error: BusinessException) {
            AppLog.error("Failed to beginConfig. error: ${error.message}")
        }
    }
    ```

4. Enable functionality. Add camera input and output streams to the session by calling [addInput](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-addinputcamerainput) to add camera input streams and [addOutput](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-addoutputcameraoutput) to add camera output streams. The following example demonstrates adding a preview stream (previewOutput) and photo capture stream (photoOutput), meaning the current mode supports both preview and photo capture.

    Call the [commitConfig](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-commitconfig) and [start](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-start) methods in the PhotoSession class to submit configurations and start the session.

    <!-- compile -->

    ```cangjie
    func startSession(photoSession: PhotoSession, cameraInput: CameraInput, previewOutput: PreviewOutput, photoOutput: PhotoOutput): Unit {
        try {
            photoSession.addInput(cameraInput)
        } catch (error: BusinessException) {
            AppLog.error("Failed to addInput. error: ${error.message}")
        }
        try {
            photoSession.addOutput(previewOutput)
        } catch (error: BusinessException) {
            AppLog.error("Failed to add previewOutput. error: ${error.message}")
        }
        try {
            photoSession.addOutput(photoOutput)
        } catch (error: BusinessException) {
            AppLog.error("Failed to add photoOutput. error: ${error.message}")
        }
        try {
            photoSession.commitConfig()
        } catch (error: BusinessException) {
            AppLog.error("Failed to commitConfig. error: ${error.message}")
        }

        try {
            photoSession.start()
        } catch (error: BusinessException) {
            AppLog.error("Failed to start. error: ${error.message}")
        }
    }
    ```

5. Session control. Call the [stop](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-stop) method in the PhotoSession class to stop the current session. Use [removeOutput](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-removeoutputcameraoutput) and [addOutput](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-addoutputcameraoutput) methods to implement session switching control. The following example demonstrates removing the photo capture stream (photoOutput) and adding a video stream (videoOutput) to switch from photo mode to video mode.

    <!-- compile -->

    ```cangjie
    func switchOutput(photoSession: PhotoSession, videoOutput: VideoOutput, photoOutput: PhotoOutput): Unit {
        try {
            photoSession.stop()
        } catch (error: BusinessException) {
            AppLog.error("Failed to stop. error: ${error.message}")
        }

        try {
            photoSession.beginConfig()
        } catch (error: BusinessException) {
            AppLog.error("Failed to beginConfig. error: ${error.message}")
        }
        // Remove photo output stream from the session.
        try {
            photoSession.removeOutput(photoOutput)
        } catch (error: BusinessException) {
            AppLog.error("Failed to remove photoOutput. error: ${error.message}")
        }
        // Add video output stream to the session.
        try {
            photoSession.addOutput(videoOutput)
        } catch (error: BusinessException) {
            AppLog.error("Failed to add videoOutput. error: ${error.message}")
        }
    }
    ```