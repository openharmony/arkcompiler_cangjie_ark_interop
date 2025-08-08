# Camera Management (Cangjie)

Before developing a camera application, you need to create an independent camera device by calling the camera interface.

## Development Steps

For detailed API documentation, refer to [Camera API Reference](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md).

1. Import the camera interface, which provides camera-related properties and methods. The import method is as follows:

    <!-- compile -->

    ```cangjie
    import kit.CameraKit.*
    import ohos.base.*
    import kit.AbilityKit.*
    ```

2. Obtain the cameraManager object through the [getCameraManager](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-getcameramanagerabilitycontext) method.

    For how to obtain Context, refer to: [Obtaining UIAbility Context Information](../../application-models/cj-uiability-usage.md#obtaining-context-information-of-uiability).

    <!-- compile -->

    ```cangjie
    func createCameraManager(context: UIAbilityContext): CameraManager {
        let cameraManager: CameraManager = getCameraManager(context)
        return cameraManager
    }
    ```

    > **Note:**
    >
    > If the object cannot be obtained, it may indicate that the camera is occupied or unavailable. If occupied, you must wait until the camera is released before attempting to obtain it again.

3. Use the [getSupportedCameras](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#func-getsupportedcameras) method in the [CameraManager](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#class-cameramanager) class to obtain the list of cameras supported by the current device. The list contains all camera IDs supported by the device. If the list is not empty, each ID in the list can independently create a camera object; otherwise, it indicates that no cameras are available on the current device, and subsequent operations cannot proceed.

    <!-- compile -->

    ```cangjie
    func getCameraDevices(cameraManager: CameraManager): Array<CameraDevice> {
        let cameraArray: Array<CameraDevice> = cameraManager.getSupportedCameras()
        if (cameraArray.size > 0) {
            for (index in 0..cameraArray.size) {
                AppLog.info("cameraId : ${cameraArray[index].cameraId}")  // Obtain the camera ID.
                AppLog.info("cameraPosition : ${cameraArray[index].cameraPosition}")  // Obtain the camera position.
                AppLog.info("cameraType : ${cameraArray[index].cameraType}")  // Obtain the camera type.
                AppLog.info("connectionType : ${cameraArray[index].connectionType}")  // Obtain the camera connection type.
            }
            return cameraArray
        } else {
            AppLog.error("cameraManager.getSupportedCameras error")
            return []
        }
    }
    ```

## Status Monitoring

During camera application development, you can monitor the camera status at any time, including the appearance of new cameras, removal of cameras, and camera availability. In the callback function, monitoring is performed using the camera ID and camera status as parameters. For example, when a new camera appears, it can be added to the application's backup camera list.

Register the cameraStatus event to receive monitoring results through callbacks. The callback returns the CameraStatusInfo parameter. For specific details of the parameter, refer to the camera manager callback interface instance [CameraStatusInfo](../../../../API_Reference/source_en/apis/CameraKit/cj-apis-multimedia-camera.md#struct-camerastatusinfo).

<!-- compile -->

```cangjie
class CameraStatusCallBack <: Callback1Argument<CameraStatusInfo> {
    public open func invoke(cameraStatusInfo: CameraStatusInfo): Unit {
        // When a camera device is connected via USB, the callback function returns the new camera appearance status.
        if (cameraStatusInfo.status == CameraStatus.CAMERA_STATUS_APPEAR) {
            AppLog.info("New Camera device appear.")
        }
        // When the camera device USB connection is disconnected, the callback function returns the camera removal status.
        if (cameraStatusInfo.status == CameraStatus.CAMERA_STATUS_DISAPPEAR) {
            AppLog.info("Camera device has been removed.")
        }
        // When the camera is turned off, the callback function returns the camera available status.
        if (cameraStatusInfo.status == CameraStatus.CAMERA_STATUS_AVAILABLE) {
            AppLog.info("Current Camera is available.")
        }
        // When the camera is opened/occupied, the callback function returns the camera unavailable status.
        if (cameraStatusInfo.status == CameraStatus.CAMERA_STATUS_UNAVAILABL) {
            AppLog.info("Current Camera has been occupied.")
        }
        AppLog.info("camera: ${cameraStatusInfo.camera.cameraId}")
        AppLog.info("status: ${cameraStatusInfo.status}")
    }
}

func onCameraStatusChange(cameraManager: CameraManager): Unit {
    cameraManager.on(CameraCallbackType.CameraStatus, CameraStatusCallBack())
}
```