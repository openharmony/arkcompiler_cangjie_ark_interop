# Preview (Cangjie)

When developing a camera application, you need to first refer to the [Development Preparation](./cj-camera-preparation.md) to apply for relevant permissions.

Preview refers to the live view displayed after starting the camera, typically executed before taking photos or recording videos.

## Development Steps

For detailed API documentation, please refer to the [Camera API Reference](../../../../API_Reference/source_zh_cn/apis/CameraKit/cj-apis-multimedia-camera.md).

1. Import the camera interfaces, which provide camera-related properties and methods. The import method is as follows:

    <!-- compile -->

    ```cangjie
    import kit.CameraKit.*
    import kit.BasicServicesKit.*
    ```

2. Create a Surface.

    The XComponent provides the Surface for the preview stream (to obtain the surfaceId, see [getXcomponentSurfaceId](../../../../Dev_Guide/source_zh_cn/arkui-cj/cj-common-components-xcomponent.md)). The capabilities of XComponent are provided by the UI. For more details, refer to [XComponent Reference](../../../../Dev_Guide/source_zh_cn/arkui-cj/cj-common-components-xcomponent.md).

    > **Note:**
    > The aspect ratio of the preview stream and the video output stream resolutions must remain consistent. If the Surface display area aspect ratio in the XComponent is set to 1920:1080 (16:9), the preview stream resolution must also maintain a 16:9 aspect ratio, such as 640:360, 960:540, or 1920:1080, and so on.

3. Use the `previewProfiles` property in the [CameraOutputCapability](../../../../API_Reference/source_zh_cn/apis/CameraKit/cj-apis-multimedia-camera.md#struct-cameraoutputcapability) class to obtain the supported preview capabilities of the current device, which returns a `previewProfilesArray`. Then, use the [createPreviewOutput](../../../../API_Reference/source_zh_cn/apis/CameraKit/cj-apis-multimedia-camera.md#func-createpreviewoutputprofile-string) method to create a preview output stream. The two parameters of this method are the first item in the `previewProfilesArray` and the `surfaceId` obtained in Step 2.

    <!-- compile -->

    ```cangjie
    func getPreviewOutput(cameraManager: CameraManager, cameraOutputCapability: CameraOutputCapability, surfaceId: String): PreviewOutput {
        let previewProfilesArray: Array<Profile> = cameraOutputCapability.previewProfiles
        let previewOutput: PreviewOutput = cameraManager.createPreviewOutput(previewProfilesArray[0], surfaceId)
        return previewOutput
    }
    ```

4. Enable the preview. Use the [Session.start](../../../../API_Reference/source_zh_cn/apis/CameraKit/cj-apis-multimedia-camera.md#func-start) method to output the preview stream. If the API call fails, it returns an error code. For error code types, refer to [Camera Error Codes](../../../../API_Reference/source_zh_cn/errorcodes/cj-errorcode-multimedia-camera.md).

    <!-- compile -->

    ```cangjie
    func startPreviewOutput(cameraManager: CameraManager, previewOutput: PreviewOutput): Unit {
        let cameraArray: Array<CameraDevice> = cameraManager.getSupportedCameras()
        if (cameraArray.size == 0) {
            AppLog.error('no camera.')
            return
        }
        // Get supported scene modes.
        let sceneModes: Array<SceneMode> = cameraManager.getSupportedSceneModes(cameraArray[0])
        let isSupportPhotoMode: Bool = sceneModes.indexOf(SceneMode.NormalPhoto).isSome()
        if (!isSupportPhotoMode) {
            AppLog.error('photo mode not support')
            return
        }
        let cameraInput: CameraInput = cameraManager.createCameraInput(cameraArray[0])
        // Open the camera.
        cameraInput.open()
        let session: PhotoSession = (cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession).getOrThrow()
        session.beginConfig()
        session.addInput(cameraInput)
        session.addOutput(previewOutput)
        session.commitConfig()
        session.start()
    }
    ```

## State Monitoring

During camera application development, you can monitor the preview output stream status at any time, including preview stream start, preview stream end, and preview stream output errors.

- Register a fixed `frameStart` callback function to monitor the preview start result. This can be monitored once the `previewOutput` is successfully created. It triggers upon the first exposure of the preview, and receiving this event indicates the preview stream has started.

    <!-- compile -->

    ```cangjie
    class FrameStartCallBack <: Callback0Argument {
        public open func invoke(): Unit {
            AppLog.info("Preview frame started")
        }
    }

    func onPreviewOutputFrameStart(previewOutput: PreviewOutput): Unit {
        previewOutput.on(CameraEvents.FrameStart, FrameStartCallBack())
    }
    ```

- Register a fixed `frameEnd` callback function to monitor the preview end result. This can be monitored once the `previewOutput` is successfully created. It triggers upon the completion of the last frame, and receiving this event indicates the preview stream has ended.

    <!-- compile -->

    ```cangjie
    class FrameEndCallBack <: Callback0Argument {
        public open func invoke(): Unit {
            AppLog.info("Preview frame ended")
        }
    }

    func onPreviewOutputFrameEnd(previewOutput: PreviewOutput): Unit {
        previewOutput.on(CameraEvents.FrameEnd, FrameEndCallBack())
    }
    ```

- Register a fixed `error` callback function to monitor preview output errors. The callback returns the error code corresponding to issues encountered during preview output usage. For error code types, refer to [Camera Error Codes](../../../../API_Reference/source_zh_cn/errorcodes/cj-errorcode-multimedia-camera.md).

    <!-- compile -->

    ```cangjie
    class ErrorCallBack <: Callback1Argument<BusinessException> {
        public open func invoke(error: BusinessException): Unit {
            AppLog.error("Preview output error code: ${error.code}")
        }
    }

    func onPreviewOutputError(previewOutput: PreviewOutput): Unit {
        previewOutput.on(CameraEvents.CameraError, ErrorCallBack())
    }
    ```