# ohos.multimedia.camera (Camera Management)

This module provides developers with a set of simple and easy-to-understand camera service interfaces. By calling these interfaces, developers can create camera applications. Applications can access and operate camera hardware to perform basic operations such as preview, photo capture, and video recording. Additionally, more operations can be achieved by combining interfaces, such as controlling the flash, adjusting exposure time, focusing, or zooming.

## Import Module

```cangjie
import kit.CameraKit.*
```

## Permission List

ohos.permission.CAMERA

ohos.permission.MICROPHONE

## Usage Instructions

API sample code usage instructions:

- If the first line of the sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Description](../../cj-development-intro.md#Cangjie-Sample-Code-Description).

## func getCameraManager(UIAbilityContext)

```cangjie
public func getCameraManager(context: UIAbilityContext): CameraManager
```

**Function:** Obtains an instance of the camera manager.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [CameraManager](#class-cameramanager) | Camera manager. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Requires obtaining the Context application context. For details, see the Usage Instructions.
let cameraManager = getCameraManager(ctx)
```

## interface AutoExposure

```cangjie
sealed interface AutoExposure <: AutoExposureQuery {
    func getExposureMode(): ExposureMode
    func setExposureMode(aeMode: ExposureMode): Unit
    func getMeteringPoint(): Point
    func setMeteringPoint(point: Point): Unit
    func setExposureBias(exposureBias: Float32): Unit
    func getExposureValue(): Float32
}
```

**Function:** Device auto-exposure (AE) operations.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [AutoExposureQuery](#interface-autoexposurequery)

### func getExposureMode()

```cangjie
func getExposureMode(): ExposureMode
```

**Function:** Obtains the current exposure mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ExposureMode](#enum-exposuremode) | Current exposure mode. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Requires obtaining the Context application context. For details, see the Usage Instructions.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
AppLog.info(photoSession.getOrThrow().getExposureMode())
```

### func getExposureValue()

```cangjie
func getExposureValue(): Float32
```

**Function:** Queries the current exposure value.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float32 | Exposure value. Exposure compensation has a step size. For example, if the step size is 0.5, setting 1.2 will result in an actual effective exposure compensation of 1.0. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Requires obtaining the Context application context. For details, see the Usage Instructions.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
AppLog.info(photoSession.getOrThrow().getExposureValue())
```

### func getMeteringPoint()

```cangjie
func getMeteringPoint(): Point
```

**Function:** Queries the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Point](#struct-point) | Current exposure point. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Requires obtaining the Context application context. For details, see the Usage Instructions.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
let point = photoSession.getOrThrow().getMeteringPoint()
```

### func setExposureBias(Float32)

```cangjie
func setExposureBias(exposureBias: Float32): Unit
```

**Function:** Sets the exposure compensation value (EV).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| exposureBias | Float32 | Yes | - | Exposure compensation. Use [getExposureBiasRange](#func-getexposurebiasrange) to query the supported range. If the set value exceeds the supported range, it will automatically adjust to the nearest boundary. Exposure compensation has a step size. For example, if the step size is 0.5, setting 1.2 will result in an actual effective exposure compensation of 1.0. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Requires obtaining the Context application context. For details, see the Usage Instructions.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let exposureBias: Float32 = 1.2
photoSession.setExposureBias(exposureBias)
```

### func setExposureMode(ExposureMode)

```cangjie
func setExposureMode(aeMode: ExposureMode): Unit
```

**Function:** Sets the exposure mode. Before setting, check whether the device supports the specified exposure mode using the method [isExposureModeSupported](#func-isexposuremodesupportedexposuremode).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| aeMode | [ExposureMode](#enum-exposuremode) | Yes | - | Exposure mode. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj
import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let aeMode = ExposureMode.EXPOSURE_MODE_AUTO
photoSession.setExposureMode(aeMode)
```

### func setMeteringPoint(Point)

```cangjie
func setMeteringPoint(point: Point): Unit
```

**Function:** Queries the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| point | [Point](#struct-point) | Yes | - | Current exposure point. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400103|Session not config.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let point = Point(1.0, 1.0)
try {
    photoSession.setMeteringPoint(point)
} catch (_) {}
```

## interface AutoExposureQuery

```cangjie
sealed interface AutoExposureQuery {
    func isExposureModeSupported(aeMode: ExposureMode): Bool
    func getExposureBiasRange(): Array<Float32>
}
```

**Function:** Provides device auto-exposure feature query functionality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func getExposureBiasRange()

```cangjie
func getExposureBiasRange(): Array<Float32>
```

**Function:** Queries the exposure compensation range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float32> | Array of compensation range. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let range = photoSession.getExposureBiasRange()
```

### func isExposureModeSupported(ExposureMode)

```cangjie
func isExposureModeSupported(aeMode: ExposureMode): Bool
```

**Function:** Checks whether the exposure mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| aeMode | [ExposureMode](#enum-exposuremode) | Yes | - | Exposure mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the exposure mode is supported. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let aeMode = ExposureMode.EXPOSURE_MODE_AUTO
AppLog.info(photoSession.isExposureModeSupported(aeMode))
```

## interface CameraOutput

```cangjie
sealed interface CameraOutput {
    func release(): Unit
}
```

**Function:** Base class for output information used by Session in a session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func release()

```cangjie
func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :-------------- | :-------------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
previewOutput.release()
```

## interface ColorManagement

```cangjie
sealed interface ColorManagement <: ColorManagementQuery {
    func setColorSpace(colorSpace: ColorSpace): Unit
    func getActiveColorSpace(): ColorSpace
}
```

**Function:** Manages color space parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [ColorManagementQuery](#interface-colormanagementquery)

### func getActiveColorSpace()

```cangjie
func getActiveColorSpace(): ColorSpace
```

**Function:** Gets the currently set color space.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace) | Currently set color space. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400103|Session not config.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let colorSpace = photoSession.getActiveColorSpace()
```

### func setColorSpace(ColorSpace)

```cangjie
func setColorSpace(colorSpace: ColorSpace): Unit
```

**Function:** Sets the color space. You can first obtain the supported ColorSpaces for the current device via [getSupportedColorSpaces](#func-getsupportedcolorspaces).

Applications can issue different color space ([ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)) parameters to support P3 wide color gamut and HDR high dynamic range imaging.

When the application does not actively set the color space, the default for photo and video modes is HDR shooting effect.

Setting HDR high-display effect in photo mode directly supports P3 color gamut.

Applications can refer to the following table for enabling HDR effects and setting color spaces in different modes.Table 1: Video Recording Modes  

| SDR/HDR Shooting | CameraFormat | ColorSpace |  
|:---|:---|:---|  
| SDR | CAMERA_FORMAT_YUV_420_SP | BT709_LIMIT |  
| HDR_VIVID (Default) | CAMERA_FORMAT_YCRCB_P010 | BT2020_HLG_LIMIT |  

Table 2: Photo Capture Modes  

| SDR/HDR Shooting | ColorSpace |  
|:---|:---|  
| SDR | SRGB |  
| HDR_VIVID (Default) | DISPLAY_P3 |  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| colorSpace | [ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace) | Yes | - | Color space, obtained via the [getSupportedColorSpaces](#func-getsupportedcolorspaces) interface. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400101 | Parameter missing or parameter type incorrect. |  
  | 7400102 | The colorSpace does not match the format. |  
  | 7400103 | Session not config. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let colorSpace = photoSession.getSupportedColorSpaces()[0]  
photoSession.setColorSpace(colorSpace)  
```  

## interface ColorManagementQuery  

```cangjie  
sealed interface ColorManagementQuery {  
    func getSupportedColorSpaces(): Array<ColorSpace>  
}  
```  

**Description:** Used to query color space parameters.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

### func getSupportedColorSpaces()  

```cangjie  
func getSupportedColorSpaces(): Array<ColorSpace>  
```  

**Description:** Retrieves the list of supported color spaces.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)> | List of supported color spaces. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config, only throw in session usage. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let colorSpaces = photoSession.getSupportedColorSpaces()  
```  

## interface Flash  

```cangjie  
sealed interface Flash <: FlashQuery {  
    func setFlashMode(flashMode: FlashMode): Unit  
    func getFlashMode(): FlashMode  
}  
```  

**Description:** Operations for device flash.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Parent Type:**  

- [FlashQuery](#interface-flashquery)  

### func getFlashMode()  

```cangjie  
func getFlashMode(): FlashMode  
```  

**Description:** Retrieves the current flash mode of the device.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [FlashMode](#enum-flashmode) | Current flash mode of the device. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let flashMode = photoSession.getFlashMode()  
```  

### func setFlashMode(FlashMode)  

```cangjie  
func setFlashMode(flashMode: FlashMode): Unit  
```  

**Description:** Sets the flash mode.  

Before setting, ensure:  

1. The device supports flash (check using [hasFlash](#func-hasflash)).  
2. The device supports the specified flash mode (check using [isFlashModeSupported](#func-isflashmodesupportedflashmode)).  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| flashMode | [FlashMode](#enum-flashmode) | Yes | - | Specified flash mode. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let flashMode = FlashMode.FLASH_MODE_ALWAYS_OPEN  
photoSession.setFlashMode(flashMode)  
```  

## interface FlashQuery  

```cangjie  
sealed interface FlashQuery {  
    func hasFlash(): Bool  
    func isFlashModeSupported(flashMode: FlashMode): Bool  
}  
```  

**Description:** Provides the capability to query the device's flash status and modes.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

### func hasFlash()  

```cangjie  
func hasFlash(): Bool  
```  

**Description:** Checks whether the device has a flash.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the device supports flash, otherwise `false`. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config, only throw in session usage. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
AppLog.info(photoSession.hasFlash())  
```  

### func isFlashModeSupported(FlashMode)  

```cangjie  
func isFlashModeSupported(flashMode: FlashMode): Bool  
```  

**Description:** Checks whether the specified flash mode is supported.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Since:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| flashMode | [FlashMode](#enum-flashmode) | Yes | - | Specified flash mode. |  

**Return Value:**
| Type | Description |
|:----|:----|
| Bool | Returns `true` if the flash mode is supported, `false` otherwise. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
photoSession.isFlashModeSupported(FlashMode.FLASH_MODE_ALWAYS_OPEN)
```

## interface Focus

```cangjie
sealed interface Focus <: FocusQuery {
    func setFocusMode(afMode: FocusMode): Unit
    func getFocusMode(): FocusMode
    func setFocusPoint(point: Point): Unit
    func getFocusPoint(): Point
    func getFocalLength(): Float32
}
```

**Functionality:** Device focus operations.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [FocusQuery](#interface-focusquery)

### func getFocalLength()

```cangjie
func getFocalLength(): Float32
```

**Functionality:** Queries the focal length value.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float32 | Returns the current focal length in millimeters (mm). |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
AppLog.info(photoSession.getFocalLength())
```

### func getFocusMode()

```cangjie
func getFocusMode(): FocusMode
```

**Functionality:** Gets the current focus mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [FocusMode](#enum-focusmode) | The current focus mode of the device. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
AppLog.info(photoSession.getFocusMode())
```

### func getFocusPoint()

```cangjie
func getFocusPoint(): Point
```

**Functionality:** Queries the focus point.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Point](#struct-point) | The current focus point. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let point = photoSession.getFocusPoint()
```

### func setFocusMode(FocusMode)

```cangjie
func setFocusMode(afMode: FocusMode): Unit
```

**Functionality:** Sets the focus mode.

Before setting, check if the device supports the specified focus mode using the method [isFocusModeSupported](#func-isfocusmodesupportedfocusmode).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| afMode | [FocusMode](#enum-focusmode) | Yes | - | The specified focus mode. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let afMode = FocusMode.FOCOS_MODE_MANUAL
photoSession.setFocusMode(afMode)
```

### func setFocusPoint(Point)

```cangjie
func setFocusPoint(point: Point): Unit
```

**Functionality:** Sets the focus point, which should be within the 0-1 coordinate system where the top-left corner is {0.0, 0.0} and the bottom-right corner is {1.0, 1.0}.

This coordinate system is based on the horizontal device orientation with the charging port on the right. For example, if the application's preview interface layout is based on the vertical orientation with the charging port at the bottom, and the layout dimensions are {w, h} with a touch point at {x, y}, the converted coordinate point would be {y/h, 1-x/w}.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| point | [Point](#struct-point) | Yes | - | The focus point. The x and y values should be within [0.0, 1.0]. Values outside this range will be clamped to 0.0 if less than 0.0 or 1.0 if greater than 1.0. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
try {
    photoSession.setFocusPoint(Point(0.5, 0.5))
} catch (_) {}
```

## interface FocusQuery

```cangjie
sealed interface FocusQuery {
    func isFocusModeSupported(afMode: FocusMode): Bool
}
```

**Functionality:** Provides methods to check if a specified focus mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func isFocusModeSupported(FocusMode)

```cangjie
func isFocusModeSupported(afMode: FocusMode): Bool
```

**Functionality:** Checks if a focus mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21
**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| afMode | [FocusMode](#enum-focusmode) | Yes | - | Specified focus mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the focus mode is supported, `false` otherwise. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let afMode = FocusMode.FOCOS_MODE_MANUAL
AppLog.info(photoSession.isFocusModeSupported(afMode))
```

## interface Session

```cangjie
sealed interface Session {
    func beginConfig(): Unit
    func commitConfig(): Unit
    func canAddInput(cameraInput: CameraInput): Bool
    func addInput(cameraInput: CameraInput): Unit
    func removeInput(cameraInput: CameraInput): Unit
    func canAddOutput(cameraOutput: CameraOutput): Bool
    func addOutput(cameraOutput: CameraOutput): Unit
    func removeOutput(cameraOutput: CameraOutput): Unit
    func start(): Unit
    func stop(): Unit
    func release(): Unit
}
```

**Functionality:** A session type that holds all resources ([CameraInput](#class-camerainput), [CameraOutput](#interface-cameraoutput)) required for a single camera operation and requests camera functionalities (recording, photo capture) from the camera device.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func addInput(CameraInput)

```cangjie
func addInput(cameraInput: CameraInput): Unit
```

**Functionality:** Adds a [CameraInput](#class-camerainput) to the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| cameraInput | [CameraInput](#class-camerainput) | Yes | - | The CameraInput instance to be added. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:--------------|:--------------|
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
session.addInput(cameraInput)
```

### func addOutput(CameraOutput)

```cangjie
func addOutput(cameraOutput: CameraOutput): Unit
```

**Functionality:** Adds a [CameraOutput](#interface-cameraoutput) to the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| cameraOutput | [CameraOutput](#interface-cameraoutput) | Yes | - | The CameraOutput instance to be added. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:--------------|:--------------|
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let cameraOutput = cameraManager.createPhotoOutput(ability.photoProfiles[0])
session.addOutput(cameraOutput)
```

### func beginConfig()

```cangjie
func beginConfig(): Unit
```

**Functionality:** Starts configuring the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:--------------|:--------------|
  | 7400105 | Session config locked. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.beginConfig()
```

### func canAddInput(CameraInput)

```cangjie
func canAddInput(cameraInput: CameraInput): Bool
```

**Functionality:** Determines whether the current `cameraInput` can be added to the session.

This method must be called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig) to take effect.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| cameraInput | [CameraInput](#class-camerainput) | Yes | - | The CameraInput instance to be checked. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the `cameraInput` can be added, `false` otherwise. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
AppLog.info(session.canAddInput(cameraInput))
```

### func canAddOutput(CameraOutput)

```cangjie
func canAddOutput(cameraOutput: CameraOutput): Bool
```

**Functionality:** Determines whether the current `cameraOutput` can be added to the session.

This method must be called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig) to take effect.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| cameraOutput | [CameraOutput](#interface-cameraoutput) | Yes | - | The CameraOutput instance to be checked. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the `cameraOutput` can be added, `false` otherwise. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let cameraOutput = cameraManager.createPhotoOutput(ability.photoProfiles[0])
AppLog.info(session.canAddOutput(cameraOutput))
```

### func commitConfig()

```cangjie
func commitConfig(): Unit
```

**Functionality:** Commits the configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  
  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400102                |  Operation not allowed.                                  |
  | 7400201                |  Camera service fatal error.                           |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.commitConfig()
```

### func release()

```cangjie
func release(): Unit
```

**Function:** Releases session resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.release()
```

### func removeInput(CameraInput)

```cangjie
func removeInput(cameraInput: CameraInput): Unit
```

**Function:** Removes the specified CameraInput from the session.

This method must be called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig) to take effect.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|Yes|-|The CameraInput instance to be removed.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
session.removeInput(cameraInput)
```

### func removeOutput(CameraOutput)

```cangjie
func removeOutput(cameraOutput: CameraOutput): Unit
```

**Function:** Removes the specified CameraOutput from the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|Yes|-|The CameraOutput instance to be removed.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
session.removeOutput(previewOutput)
```

### func start()

```cangjie
func start(): Unit
```

**Function:** Starts the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400102                |  Operation not allowed.                                |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                           |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.start()
```

### func stop()

```cangjie
func stop(): Unit
```

**Function:** Stops the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID         | Error Message        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.stop()
```

## interface Stabilization

```cangjie
sealed interface Stabilization <: StabilizationQuery {
    func getActiveVideoStabilizationMode(): VideoStabilizationMode
    func setVideoStabilizationMode(mode: VideoStabilizationMode): Unit
}
```

**Function:** Provides operations related to video stabilization in video recording mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [StabilizationQuery](#interface-stabilizationquery)

### func getActiveVideoStabilizationMode()

```cangjie
func getActiveVideoStabilizationMode(): VideoStabilizationMode
```

**Function:** Queries the currently active video stabilization mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[VideoStabilizationMode](#enum-videostabilizationmode)|Whether video stabilization is currently active.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400103|Session not config.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_VIDEO)
var videoSessionOption = session as VideoSession
let videoSession = videoSessionOption.getOrThrow()
AppLog.info(videoSession.getActiveVideoStabilizationMode())
```

### func setVideoStabilizationMode(VideoStabilizationMode)

```cangjie
func setVideoStabilizationMode(mode: VideoStabilizationMode): Unit
```

**Function:** Sets the video stabilization mode. Check whether the device supports the specified stabilization mode first using the [isVideoStabilizationModeSupported](#func-isvideostabilizationmodesupportedvideostabilizationmode) method.

**System Capability:** SystemCapability.Multimedia.Camera.Core**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| mode | [VideoStabilizationMode](#enum-videostabilizationmode) | Yes | - | The video stabilization mode to be set. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_VIDEO)  
var videoSessionOption = session as VideoSession  
let videoSession = videoSessionOption.getOrThrow()  
let vsMode = VideoStabilizationMode.OFF  
videoSession.setVideoStabilizationMode(vsMode)  
```  

## interface StabilizationQuery  

```cangjie  
sealed interface StabilizationQuery {  
    func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool  
}  
```  

**Function:** Provides the capability to query whether the device supports the specified video stabilization mode in video recording mode.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

### func isVideoStabilizationModeSupported(VideoStabilizationMode)  

```cangjie  
func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool  
```  

**Function:** Queries whether the specified video stabilization mode is supported.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| vsMode | [VideoStabilizationMode](#enum-videostabilizationmode) | Yes | - | The video stabilization mode. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns whether the video stabilization mode is supported; `true` means supported, `false` means not supported. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config, only throw in session usage. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_VIDEO)  
var videoSessionOption = session as VideoSession  
let videoSession = videoSessionOption.getOrThrow()  
let vsMode = VideoStabilizationMode.OFF  
videoSession.isVideoStabilizationModeSupported(vsMode)  
```  

## interface Zoom  

```cangjie  
sealed interface Zoom <: ZoomQuery {  
    func setZoomRatio(zoomRatio: Float32): Unit  
    func getZoomRatio(): Float32  
    func setSmoothZoom(targetRatio: Float32, mode: SmoothZoomMode): Unit  
    func setSmoothZoom(targetRatio: Float32): Unit  
}  
```  

**Function:** Device zoom (scaling) operations.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Type:**  

- [ZoomQuery](#interface-zoomquery)  

### func getZoomRatio()  

```cangjie  
func getZoomRatio(): Float32  
```  

**Function:** Gets the current zoom ratio.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Float32 | The current zoom ratio result. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
AppLog.info(photoSession.getZoomRatio())  
```  

### func setSmoothZoom(Float32, SmoothZoomMode)  

```cangjie  
func setSmoothZoom(targetRatio: Float32, mode: SmoothZoomMode): Unit  
```  

**Function:** Triggers smooth zoom.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| targetRatio | Float32 | Yes | - | Target value. |  
| mode | [SmoothZoomMode](#enum-smoothzoommode) | Yes | - | Mode. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let targetRatio: Float32 = 0.3  
photoSession.setSmoothZoom(targetRatio, SmoothZoomMode.NORMAL)  
```  

### func setSmoothZoom(Float32)  

```cangjie  
func setSmoothZoom(targetRatio: Float32): Unit  
```  

**Function:** Triggers smooth zoom.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| targetRatio | Float32 | Yes | - | Target value. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let targetRatio: Float32 = 0.3  
photoSession.setSmoothZoom(targetRatio)  
```  

### func setZoomRatio(Float32)  

```cangjie  
func setZoomRatio(zoomRatio: Float32): Unit  
```  

**Function:** Sets the zoom ratio. The maximum precision for zoom ratio is two decimal places. If a value exceeds the supported precision range, only the value within the precision range will be retained.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| zoomRatio | Float32 | Yes | - | The zoom ratio. Use [getZoomRatioRange](#func-getzoomratiorange) to obtain the supported zoom range. If a value exceeds the supported range, only the value within the precision range will be retained. It takes some time for the zoom ratio to take effect at the underlying layer. To obtain the correctly set zoom ratio, wait for 1-2 frames. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400103 | Session not config. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)  
var photoSessionOption = session as PhotoSession  
let photoSession = photoSessionOption.getOrThrow()  
let zoomRatio: Float32 = 0.5  
photoSession.setZoomRatio(zoomRatio)  
```  

## interface ZoomQuery  

```cangjie
sealed interface ZoomQuery {
    func getZoomRatioRange(): Array<Float32>
}
```

**Description:** Provides query capabilities related to device zoom functionality, including retrieving the supported zoom ratio range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func getZoomRatioRange()

```cangjie
func getZoomRatioRange(): Array<Float32>
```

**Description:** Retrieves the supported zoom range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float32> | Used to obtain the variable focal length ratio range. The returned array includes its minimum and maximum values. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let zoomRatio: Float32 = 0.5
AppLog.info(photoSession.getZoomRatioRange())
```

## class CameraDevice

```cangjie
public class CameraDevice {
    public let cameraId: String
    public let cameraPosition: CameraPosition
    public let cameraType: CameraType
    public let connectionType: ConnectionType
    public let cameraOrientation: UInt32
}
```

**Description:** Camera device information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraId

```cangjie
public let cameraId: String
```

**Description:** Camera ID.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraOrientation

```cangjie
public let cameraOrientation: UInt32
```

**Description:** The installation angle of the lens, which does not change with screen rotation. Value range: 0-360.

**Type:** UInt32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraPosition

```cangjie
public let cameraPosition: CameraPosition
```

**Description:** Camera position.

**Type:** [CameraPosition](#enum-cameraposition)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraType

```cangjie
public let cameraType: CameraType
```

**Description:** Camera type.

**Type:** [CameraType](#enum-cameratype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let connectionType

```cangjie
public let connectionType: ConnectionType
```

**Description:** Camera connection type.

**Type:** [ConnectionType](#enum-connectiontype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class CameraInput

```cangjie
public class CameraInput {}
```

**Description:** Camera device input object. Contains camera information used by the Session in a session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Description:** Closes the camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :-------------- | :-------------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.close()
```

### func off(CameraCallbackType, CameraDevice, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit
```

**Description:** Unregisters the listener for CameraInput error events.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be 'error'. Can be listened to after successful creation of CameraInput object. Triggers this event and returns results when camera device encounters errors (e.g., device unavailable or conflicts). |
| camera | [CameraDevice](#struct-cameradevice) | Yes | - | CameraDevice object. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
let testCallbackError = TestCallbackError()
cameraInput.off(CameraCallbackType.CameraError, cameraDevice, testCallbackError)
```

### func off(CameraCallbackType, CameraDevice)

```cangjie
public func off(`type`: CameraCallbackType, camera: CameraDevice): Unit
```

**Description:** Unregisters all callbacks for the specified event type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type. |
| camera | [CameraDevice](#struct-cameradevice) | Yes | - | CameraDevice object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.off(CameraCallbackType.CameraError, cameraDevice)
```

### func on(CameraCallbackType, CameraDevice, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit
```

**Description:** Listens for CameraInput error events and retrieves results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be 'error'. Can be listened to upon successful creation of CameraInput object. Triggers when camera device encounters errors (e.g., device unavailable or conflicts), returning corresponding error messages. |
| camera | [CameraDevice](#struct-cameradevice) | Yes | - | CameraDevice object. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to retrieve results. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// Code can be added in the dependency definition section
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
let testCallbackError = TestCallbackError()
return cameraInput.on(CameraCallbackType.CameraError, cameraDevice, testCallbackError)
```

### func open()

```cangjie
public func open(): Unit
```

**Function:** Opens the camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400107      | Cannot use camera due to conflict. |
  | 7400108      | Camera disabled for security reasons. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.open()
```

### func open(Bool)

```cangjie
public func open(isSecureEnabled: Bool): UInt64
```

**Function:** Opens the camera and retrieves the handle for a secure camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| isSecureEnabled | Bool | Yes | - | Whether to open the camera in secure mode. |

**Return Value:**

| Type | Description |
|:----|:-----------|
| UInt64 | Handle of the opened camera. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400107      | Cannot use camera due to conflict. |
  | 7400108      | Camera disabled for security reasons. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
let isSecureEnabled = false
let handle = cameraInput.open(isSecureEnabled)
```

## class CameraManager

```cangjie
public class CameraManager {}
```

**Function:** Camera manager class. An instance must be obtained via [getCameraManager](#func-getcameramanagerabilitycontext) before use.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func createCameraInput(CameraDevice)

```cangjie
public func createCameraInput(camera: CameraDevice): CameraInput
```

**Function:** Creates a CameraInput instance using a CameraDevice object.

**Required Permission:** ohos.permission.CAMERA

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| camera | [CameraDevice](#struct-cameradevice) | Yes | - | CameraDevice object, obtained via [getSupportedCameras](#func-getsupportedcameras). |

**Return Value:**

| Type | Description |
|:----|:-----------|
| [CameraInput](#class-camerainput) | CameraInput instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101      | Parameter missing or incorrect parameter type. |
  | 7400102      | Operation not allowed. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraInput = cameraManager.createCameraInput(cameraDevices[0])
```

### func createCameraInput(CameraPosition, CameraType)

```cangjie
public func createCameraInput(position: CameraPosition, `type`: CameraType): CameraInput
```

**Function:** Creates a CameraInput instance based on camera position and type.

**Required Permission:** ohos.permission.CAMERA

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| position | [CameraPosition](#enum-cameraposition) | Yes | - | Camera position, obtained via [getSupportedCameras](#func-getsupportedcameras) to retrieve device information. |
| `type` | [CameraType](#enum-cameratype) | Yes | - | Camera type, obtained via [getSupportedCameras](#func-getsupportedcameras) to retrieve device information. |

**Return Value:**

| Type | Description |
|:----|:-----------|
| [CameraInput](#class-camerainput) | CameraInput instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101      | Parameter missing or incorrect parameter type. |
  | 7400102      | Operation not allowed. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraDevice0 = cameraDevices[0]
let position = cameraDevice0.cameraPosition
let `type` = cameraDevice0.cameraType
let cameraInput = cameraManager.createCameraInput(position , `type`)
```

### func createMetadataOutput(Array\<MetadataObjectType>)

```cangjie
public func createMetadataOutput(metadataObjectTypes: Array<MetadataObjectType>): MetadataOutput
```

**Function:** Creates a metadata stream output object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| metadataObjectTypes | Array\<[MetadataObjectType](#enum-metadataobjecttype)> | Yes | - | Metadata stream type information, obtained via [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode). |

**Return Value:**

| Type | Description |
|:----|:-----------|
| [MetadataOutput](#class-metadataoutput) | MetadataOutput instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101      | Parameter missing or incorrect parameter type. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let metadataObjectTypes = [MetadataObjectType.FACE_DETECTION]
let metadataOutput = cameraManager.createMetadataOutput(metadataObjectTypes)
```

### func createPhotoOutput()

```cangjie
public func createPhotoOutput(): PhotoOutput
```

**Function:** Creates a photo output object.

**System Capability:** SystemCapability.Multimedia.Camera.Core**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PhotoOutput](#class-photooutput) | PhotoOutput instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:---------|:-----------------------------------------------|  
  | 7400101  | Parameter missing or parameter type incorrect. |  
  | 7400201  | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let cameraDevices = cameraManager.getSupportedCameras()  
let cameraInput = cameraManager.createCameraInput(cameraDevices[0])  
let photoOutput = cameraManager.createPhotoOutput()  
```  

### func createPhotoOutput(Profile)  

```cangjie  
public func createPhotoOutput(profile: Profile): PhotoOutput  
```  

**Function:** Creates a photo output object.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| profile | [Profile](#class-profile) | Yes | - | Supported photo configuration information, obtained via the [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PhotoOutput](#class-photooutput) | PhotoOutput instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:---------|:-----------------------------------------------|  
  | 7400101  | Parameter missing or parameter type incorrect. |  
  | 7400201  | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let cameraDevices = cameraManager.getSupportedCameras()  
let camera = cameraDevices[0]  
let mode = cameraManager.getSupportedSceneModes(camera)[0]  
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(camera, mode)  
let profile = cameraOutputCapability.photoProfiles[0]  
let photoOutput = cameraManager.createPhotoOutput(profile)  
```  

### func createPreviewOutput(Profile, String)  

```cangjie  
public func createPreviewOutput(profile: Profile, surfaceId: String): PreviewOutput  
```  

**Function:** Creates a preview output object.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| profile | [Profile](#class-profile) | Yes | - | Supported preview configuration information, obtained via the [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface. |  
| surfaceId | String | Yes | - | surfaceId obtained from the XComponent or [ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver) component. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PreviewOutput](#class-previewoutput) | PreviewOutput instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:--------------|:--------------|  
  | 7400101 | Parameter missing or parameter type incorrect. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.image.createImageReceiver  
import ohos.image.ImageFormat  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let cameraDevice = cameraManager.getSupportedCameras()[0]  
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]  
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)  
let profile = cameraOutputCapability.previewProfiles[0]  
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)  
let surfaceId: String = receiver.getReceivingSurfaceId()  
let previewOutput = cameraManager.createPreviewOutput(profile, surfaceId)  
```  

### func createPreviewOutput(String)  

```cangjie  
public func createPreviewOutput(surfaceId: String): PreviewOutput  
```  

**Function:** Creates a preview output object without configuration information. This interface must be used in conjunction with [preconfig](#func-preconfigpreconfigtype-preconfigratio).  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| surfaceId | String | Yes | - | surfaceId obtained from the XComponent or [ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver) component. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PreviewOutput](#class-previewoutput) | PreviewOutput instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:--------|:-----------------------------------------------|  
  | 7400101 | Parameter missing or parameter type incorrect. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.image.createImageReceiver  
import ohos.image.ImageFormat  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)  
let surfaceId: String = receiver.getReceivingSurfaceId()  
let previewOutput = cameraManager.createPreviewOutput(surfaceId)  
```  

### func createSession(SceneMode)  

```cangjie  
public func createSession(mode: SceneMode): Session  
```  

**Function:** Creates a Session instance with the specified SceneMode.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| mode | [SceneMode](#enum-scenemode) | Yes | - | Camera-supported mode. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [Session](#interface-session) | Session instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:--------------|:----------------------------------------------------------------------------------------|  
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let cameraDevices = cameraManager.getSupportedCameras()  
let camera = cameraDevices[0]  
let mode = cameraManager.getSupportedSceneModes(camera)[0]  
let session = cameraManager.createSession(mode)  
```  

### func createVideoOutput(VideoProfile, String)  

```cangjie  
public func createVideoOutput(profile: VideoProfile, surfaceId: String): VideoOutput  
```  

**Function:** Creates a video output object.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| profile | [VideoProfile](#class-videoprofile) | Yes | - | Supported video configuration information, obtained via the [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface. |  
| surfaceId | String | Yes | - | surfaceId obtained from AVRecorder. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [VideoOutput](#class-videooutput) | VideoOutput instance. |  

**Exceptions:**  

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:--------------|:--------------|  
  | 7400101 | Parameter missing or parameter type incorrect. |  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.image.createImageReceiver  
import ohos.image.ImageFormat  

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document  
let cameraManager = getCameraManager(ctx)  
let cameraDevice = cameraManager.getSupportedCameras()[0]  
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[1]  
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)  
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)  
let surfaceId: String = receiver.getReceivingSurfaceId()  
let videoOutput = cameraManager.createVideoOutput(cameraOutputCapability.videoProfiles[0], surfaceId)  
```  

### func createVideoOutput(String)
```cangjie
public func createVideoOutput(surfaceId: String): VideoOutput
```

**Function:** Creates a video output object without configuration information. This interface must be used in conjunction with the [preconfig](#func-preconfigpreconfigtype-preconfigratio) feature.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type   | Mandatory | Default Value | Description                     |
|:--------------|:-------|:----------|:--------------|:--------------------------------|
| surfaceId     | String | Yes       | -             | The surfaceId obtained from AVRecorder. |

**Return Value:**

| Type                     | Description             |
|:-------------------------|:------------------------|
| [VideoOutput](#class-videooutput) | VideoOutput instance.   |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message                                      |
  |:-------------|:--------------------------------------------------|
  | 7400101      | Parameter missing or parameter type incorrect.    |
  | 7400201      | Camera service fatal error.                       |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let videoOutput = cameraManager.createVideoOutput(surfaceId)
```

### func getSupportedCameras()

```cangjie
public func getSupportedCameras(): Array<CameraDevice>
```

**Function:** Retrieves the supported camera device objects.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type                          | Description             |
|:------------------------------|:------------------------|
| Array\<[CameraDevice](#struct-cameradevice)> | List of camera devices. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
```

### func getSupportedOutputCapability(CameraDevice, SceneMode)

```cangjie
public func getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability
```

**Function:** Queries the supported output capabilities of the camera device under the specified mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                          | Mandatory | Default Value | Description                                                                 |
|:--------------|:------------------------------|:----------|:--------------|:----------------------------------------------------------------------------|
| camera        | [CameraDevice](#struct-cameradevice) | Yes       | -             | Camera device obtained via [getSupportedCameras](#func-getsupportedcameras). |
| mode          | [SceneMode](#enum-scenemode)   | Yes       | -             | Camera mode obtained via [getSupportedSceneModes](#func-getsupportedscenemodescameradevice). |

**Return Value:**

| Type                                | Description             |
|:------------------------------------|:------------------------|
| [CameraOutputCapability](#struct-cameraoutputcapability) | Camera output capability. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)[0]
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(camera, mode)
```

### func getSupportedSceneModes(CameraDevice)

```cangjie
public func getSupportedSceneModes(camera: CameraDevice): Array<SceneMode>
```

**Function:** Retrieves the supported modes of the specified camera device object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                          | Mandatory | Default Value | Description                                                                 |
|:--------------|:------------------------------|:----------|:--------------|:----------------------------------------------------------------------------|
| camera        | [CameraDevice](#struct-cameradevice) | Yes       | -             | Camera device obtained via [getSupportedCameras](#func-getsupportedcameras). |

**Return Value:**

| Type                          | Description             |
|:------------------------------|:------------------------|
| Array\<[SceneMode](#enum-scenemode)> | List of supported camera modes. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)
```

### func getTorchMode()

```cangjie
public func getTorchMode(): TorchMode
```

**Function:** Retrieves the current torch mode of the device.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type                  | Description             |
|:----------------------|:------------------------|
| [TorchMode](#enum-torchmode) | Current torch mode of the device. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
```

### func isCameraMuted()

```cangjie
public func isCameraMuted(): Bool
```

**Function:** Queries the current disabled status of the camera (disabled/enabled).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description                                                                 |
|:-----|:----------------------------------------------------------------------------|
| Bool | Returns `true` if the camera is disabled, `false` if the camera is enabled. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
AppLog.info(cameraManager.isCameraMuted())
```

### func isTorchModeSupported(TorchMode)

```cangjie
public func isTorchModeSupported(torchMode: TorchMode): Bool
```

**Function:** Checks whether the specified torch mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                  | Mandatory | Default Value | Description       |
|:--------------|:----------------------|:----------|:--------------|:------------------|
| torchMode     | [TorchMode](#enum-torchmode) | Yes       | -             | Torch mode to check. |

**Return Value:**

| Type | Description                                                                 |
|:-----|:----------------------------------------------------------------------------|
| Bool | Returns `true` if the device supports the specified torch mode.             |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
AppLog.info(cameraManager.isTorchModeSupported(torchMode))
```

### func isTorchSupported()

```cangjie
public func isTorchSupported(): Bool
```

**Function:** Checks whether the device supports torch functionality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description                                                                 |
|:-----|:----------------------------------------------------------------------------|
| Bool | Returns `true` if the device supports torch functionality.                  |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
AppLog.info(cameraManager.isTorchSupported())
```
### func off(CameraCallbackType, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**Function:** Unregisters the camera device status callback to stop receiving camera state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `cameraStatus`. Can be monitored after successfully obtaining the cameraManager object. Currently only supports triggering this event when the device is opened or closed, returning corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#struct-camerastatusinfo)> | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackCameraStatus <: Callback1Argument<CameraStatusInfo> {
    public init() {}
    public open func invoke(res: CameraStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CameraStatus. CameraDevice: ${res.camera.cameraId}, CameraStatus: ${res.status}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackCameraStatus = TestCallbackCameraStatus()
cameraManager.off(CameraCallbackType.CameraStatus, testCallbackCameraStatus)
```

### func off(CameraCallbackType, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**Function:** Stops listening for fold status changes on foldable devices.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `foldStatusChange`. Indicates fold status changes on foldable devices. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#struct-foldstatusinfo)> | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackFoldStatusChange <: Callback1Argument<FoldStatusInfo> {
    public init() {}
    public open func invoke(res: FoldStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FoldStatusChange.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackFoldStatusChange = TestCallbackFoldStatusChange()
cameraManager.off(CameraCallbackType.FoldStatusChange, testCallbackFoldStatusChange)
```

### func off(CameraCallbackType, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**Function:** Unregisters the torch status callback to stop receiving torch state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `torchStatusChange`. Can be monitored after successfully obtaining the cameraManager object. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#struct-torchstatusinfo)> | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in dependency definitions
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.off(CameraCallbackType.TorchStatusChange, testCallbackTorchStatusChange)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Unregisters all callbacks for the specified event type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type to unregister. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraCallbackType.TorchStatusChange)
```

### func on(CameraCallbackType, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**Function:** Registers a callback to monitor camera device status changes.

> **Note:**
>
> Do not call `off` to unregister the callback within the `on` callback method.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `cameraStatus`. Can be monitored after successfully obtaining the cameraManager object. Currently only supports triggering this event when the device is opened or closed, returning corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#struct-camerastatusinfo)> | Yes | - | Callback function to receive camera status change information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in dependency definitions
class TestCallbackCameraStatus <: Callback1Argument<CameraStatusInfo> {
    public init() {}
    public open func invoke(res: CameraStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CameraStatus. CameraDevice: ${res.camera.cameraId}, CameraStatus: ${res.status}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackCameraStatus = TestCallbackCameraStatus()
cameraManager.on(CameraCallbackType.CameraStatus, testCallbackCameraStatus)
```

### func on(CameraCallbackType, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**Function:** Starts listening for fold status changes on foldable devices.

> **Note:**
>
> Do not call `off` to unregister the callback within the `on` callback method.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `foldStatusChange`. Indicates fold status changes on foldable devices. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#struct-foldstatusinfo)> | Yes | - | Callback function to receive fold status information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in dependency definitions
class TestCallbackFoldStatusChange <: Callback1Argument<FoldStatusInfo> {
    public init() {}
    public open func invoke(res: FoldStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FoldStatusChange.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackFoldStatusChange = TestCallbackFoldStatusChange()
cameraManager.on(CameraCallbackType.FoldStatusChange, testCallbackFoldStatusChange)
```

### func on(CameraCallbackType, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**Function:** Registers a callback to monitor torch status changes.

> **Note:**
>
> Do not call `off` to unregister the callback within the `on` callback method.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be `torchStatusChange`. Can be monitored after successfully obtaining the cameraManager object. Currently supports triggering this event when the torch is turned on/off, becomes unavailable, or becomes available again, returning corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#struct-torchstatusinfo)> | Yes | - | Callback function to receive torch status change information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in dependency definitions
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.on(CameraCallbackType.TorchStatusChange, testCallbackTorchStatusChange)
```

### func setTorchMode(TorchMode)

```cangjie
public func setTorchMode(torchMode: TorchMode): Unit
```

**Function:** Sets the device flashlight mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| torchMode | [TorchMode](#enum-torchmode) | Yes | - | Flashlight mode. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this article
let cameraManager = getCameraManager(ctx)
cameraManager.setTorchMode(TorchMode.ON)
cameraManager.setTorchMode(TorchMode.OFF)
```

## class CameraOutputCapability

```cangjie
public class CameraOutputCapability {
    public let previewProfiles: Array<Profile>
    public let photoProfiles: Array<Profile>
    public let videoProfiles: Array<VideoProfile>
    public let supportedMetadataObjectTypes: Array<MetadataObjectType>
}
```

**Function:** Camera output capability items.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let photoProfiles

```cangjie
public let photoProfiles: Array<Profile>
```

**Function:** Collection of supported photo configuration information.

**Type:** Array\<[Profile](#class-profile)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let previewProfiles

```cangjie
public let previewProfiles: Array<Profile>
```

**Function:** Collection of supported preview configuration information.

**Type:** Array\<[Profile](#class-profile)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let supportedMetadataObjectTypes

```cangjie
public let supportedMetadataObjectTypes: Array<MetadataObjectType>
```

**Function:** Collection of supported metadata stream type information.

**Type:** Array\<[MetadataObjectType](#enum-metadataobjecttype)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let videoProfiles

```cangjie
public let videoProfiles: Array<VideoProfile>
```

**Function:** Collection of supported video recording configuration information.

**Type:** Array\<[VideoProfile](#class-videoprofile)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

## class MetadataObject

```cangjie
public class MetadataObject {
    public let `type`: MetadataObjectType
    public let timestamp: Int32
    public let boundingBox: Rect
}
```

**Function:** Camera metadata capability information, data source in CameraInput camera information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let \`type\`

```cangjie
public let `type`: MetadataObjectType
```

**Function:** Metadata type.

**Type:** [MetadataObjectType](#enum-metadataobjecttype)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let boundingBox

```cangjie
public let boundingBox: Rect
```

**Function:** Metadata bounding box.

**Type:** [Rect](#struct-rect)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let timestamp

```cangjie
public let timestamp: Int32
```

**Function:** Current timestamp (milliseconds).

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

## class MetadataOutput

```cangjie
public class MetadataOutput <: CameraOutput {}
```

**Function:** Metadata stream.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func off(CameraCallbackType, Callback1Argument\<Array\<MetadataObject>>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<Array<MetadataObject>>): Unit
```

**Function:** Unregisters the listener for detected metadata objects.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be metadataObjectsAvailable, can be listened to after metadataOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[MetadataObject](#class-metadataobject)>> | Yes | - | Callback function, cancels the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added in dependency definitions
class TestCallback <: Callback1Argument<Array<MetadataObject>> {
    public init() {}
    public open func invoke(res: Array<MetadataObject>): Unit {
        Hilog.info(0, "Camera", "Call invoke error.")
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this article
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
let testCallback = TestCallback()
metadataOutput.off(CameraCallbackType.MetadataObjectsAvailable, testCallback)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregisters the listener for metadata stream errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be error, can be listened to after metadataOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function, cancels the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added in dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this article
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
let testCallbackError = TestCallbackError()
metadataOutput.off(CameraCallbackType.CameraError, testCallbackError)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Unregisters all callbacks for the specified listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The listening event. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
metadataOutput.off(CameraCallbackType.CameraError)
```

### func on(CameraCallbackType, Callback1Argument\<Array\<MetadataObject>>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<Array<MetadataObject>>): Unit
```

**Function:** Listens for detected metadata objects and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The listening event, which must be `metadataObjectsAvailable`. This can be listened to after the `metadataOutput` is successfully created. The event is triggered when valid metadata is detected, and the corresponding metadata data is returned. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[MetadataObject](#class-metadataobject)>> | Yes | - | The callback function used to obtain metadata data. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added to the dependency definitions
class TestCallback <: Callback1Argument<Array<MetadataObject>> {
    public init() {}
    public open func invoke(res: Array<MetadataObject>): Unit {
        Hilog.info(0, "Camera", "Call invoke error.")
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
let testCallback = TestCallback()
metadataOutput.on(CameraCallbackType.MetadataObjectsAvailable, testCallback)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Listens for errors in the metadata stream and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The listening event, which must be `error`. This can be listened to after the `metadataOutput` is successfully created. The event is triggered when errors occur in metadata interface usage, returning corresponding error codes. For example, errors returned when calling `start` or `CameraOutput.release` will provide corresponding error information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | The callback function used to obtain error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added to the dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
let testCallbackError = TestCallbackError()
metadataOutput.on(CameraCallbackType.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed descriptions of error codes, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
metadataOutput.release()
```

### func start()

```cangjie
public func start(): Unit
```

**Function:** Starts metadata output.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed descriptions of error codes, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400103      | Session not config. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
metadataOutput.start()
```

### func stop()

```cangjie
public func stop(): Unit
```

**Function:** Stops metadata output.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let metadataOutput = cameraManager.createMetadataOutput(ability.supportedMetadataObjectTypes[0])
metadataOutput.stop()
```

## class PhotoOutput

```cangjie
public class PhotoOutput <: CameraOutput {}
```

**Function:** Output information used in photo capture sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func capture()

```cangjie
public func capture(): Unit
```

**Function:** Triggers a single photo capture with default settings.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed descriptions of error codes, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400104      | Session not running. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained. See the usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let photoOutput = cameraManager.createPhotoOutput(ability.supportedPhotoProfiles[0])
photoOutput.capture()
import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
output.capture()
```

### func capture(PhotoCaptureSetting)

```cangjie
public func capture(setting: PhotoCaptureSetting): Unit
```

**Function:** Triggers a single photo capture with specified parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| setting | [PhotoCaptureSetting](#struct-photocapturesetting) | Yes | - | Photo capture settings. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400104 | Session not running. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
output.capture(PhotoCaptureSetting())
```

### func enableMirror(Bool)

```cangjie
public func enableMirror(enabled: Bool): Unit
```

**Function:** Enables or disables mirror photo capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | Bool | Yes | - | `true` to enable mirror photo capture, `false` to disable it. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let enabled = true
output.enableMirror(enabled)
```

### func enableMovingPhoto(Bool)

```cangjie
public func enableMovingPhoto(enabled: Bool): Unit
```

**Function:** Enables or disables moving photo capture.

**Required Permission:** ohos.permission.MICROPHONE

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enabled | Bool | Yes | - | `true` to enable moving photo, `false` to disable it. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 201 | Permission denied. |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let enabled = true
output.enableMovingPhoto(enabled)
```

### func getActiveProfile()

```cangjie
public func getActiveProfile(): Profile
```

**Function:** Retrieves the currently active configuration information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Profile](#class-profile) | The currently active configuration information. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let profile = output.getActiveProfile()
```

### func getPhotoRotation(Int32)

```cangjie
public func getPhotoRotation(deviceDegree: Int32): ImageRotation
```

**Function:** Retrieves the rotation angle for photo capture.

- Device natural orientation: The default orientation of the device, which is portrait for mobile phones (charging port facing downward).
- Camera lens angle: The value equals the angle by which the camera image is rotated clockwise to align with the device's natural orientation. For example, the rear camera sensor of a mobile phone is installed in portrait mode, so it needs to be rotated 90 degrees clockwise to match the device's natural orientation.
- Screen display orientation: The image displayed on the screen should have its top-left corner as the origin of the coordinate system. When the screen is locked, it aligns with the natural orientation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| deviceDegree | Int32 | Yes | - | The rotation angle of the device. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageRotation](#enum-imagerotation) | The rotation angle for photo capture. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let deviceDegree: Int32 = 0
let imageRotation = output.getPhotoRotation(deviceDegree)
```

### func getSupportedMovingPhotoVideoCodecTypes()

```cangjie
public func getSupportedMovingPhotoVideoCodecTypes(): Array<VideoCodecType>
```

**Function:** Queries the supported video codec types for moving photos.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[VideoCodecType](#enum-videocodectype)> | A list of supported video codec types for moving photos. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let videoCodecTypes = output.getSupportedMovingPhotoVideoCodecTypes()
```

### func isMirrorSupported()

```cangjie
public func isMirrorSupported(): Bool
```

**Function:** Queries whether mirror photography is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns whether mirror photography is supported. true indicates support, false indicates no support.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
AppLog.info(output.isMirrorSupported())
```

### func isMovingPhotoSupported()

```cangjie
public func isMovingPhotoSupported(): Bool
```

**Function:** Queries whether moving photo capture is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns whether moving photo capture is supported. true indicates support, false indicates no support.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :------------- | :-------------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
AppLog.info(output.isMovingPhotoSupported())
```

### func off(CameraCallbackType, Callback1Argument\<CaptureStartInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<CaptureStartInfo>): Unit
```

**Function:** Unregisters the listener for photo capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Listening event, must be captureStartWithInfo. Can be listened to after photoOutput is successfully created.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#struct-capturestartinfo)>|Yes|-|Callback function to be unregistered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackCaptureStartWithInfo <: Callback1Argument<CaptureStartInfo> {
    public init() {}
    public open func invoke(res: CaptureStartInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureStartWithInfo. captureId: ${res.captureId}, time： ${res.time}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureStartWithInfo = TestCallbackCaptureStartWithInfo()
output.off(CameraCallbackType.CaptureStartWithInfo, testCallbackCaptureStartWithInfo)
```

### func off(CameraCallbackType, Callback1Argument\<FrameShutterInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterInfo>): Unit
```

**Function:** Unregisters the listener for photo frame output capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Listening event, must be frameShutter. Can be listened to after photoOutput is successfully created.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#struct-frameshutterinfo)>|Yes|-|Callback function to be unregistered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackFrameShutter <: Callback1Argument<FrameShutterInfo> {
    public init() {}
    public open func invoke(res: FrameShutterInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutter. captureId: ${res.captureId}, timestamp： ${res.timestamp}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackFrameShutter = TestCallbackFrameShutter()
output.off(CameraCallbackType.FrameShutter, testCallbackFrameShutter)
```

### func off(CameraCallbackType, Callback1Argument\<CaptureEndInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<CaptureEndInfo>): Unit
```

**Function:** Unregisters the listener for photo capture end.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Listening event, must be captureEnd. Can be listened to after photoOutput is successfully created.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#struct-captureendinfo)>|Yes|-|Callback function to be unregistered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackCaptureEnd <: Callback1Argument<CaptureEndInfo> {
    public init() {}
    public open func invoke(res: CaptureEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureEnd. captureId: ${res.captureId}, frameCount： ${res.frameCount}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureEnd = TestCallbackCaptureEnd()
output.off(CameraCallbackType.CaptureEnd, testCallbackCaptureEnd)
```

### func off(CameraCallbackType, Callback1Argument\<FrameShutterEndInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterEndInfo>): Unit
```

**Function:** Unregisters the listener for photo frame output capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Listening event, must be frameShutterEnd. Can be listened to after photoOutput is successfully created.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#struct-frameshutterendinfo)>|Yes|-|Callback function to be unregistered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
class TestCallbackFrameShutterEnd <: Callback1Argument<FrameShutterEndInfo> {
    public init() {}
    public open func invoke(res: FrameShutterEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutterEnd. captureId: ${res.captureId}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackFrameShutterEnd = TestCallbackFrameShutterEnd()
output.off(CameraCallbackType.FrameShutterEnd, testCallbackFrameShutterEnd)
```

### func off(CameraCallbackType, Callback0Argument)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener for readiness to capture next photo.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Listening event, must be captureReady. Can be listened to after photoOutput is successfully created.|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|Yes|-|Callback function to be unregistered.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog
// This code can be added in the dependency definition
class TestCallbackCaptureReady <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureReady.")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureReady = TestCallbackCaptureReady()
output.off(CameraCallbackType.CaptureReady, testCallbackCaptureReady)
```

### func off(CameraCallbackType, Callback1Argument\<Int32>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<Int32>): Unit
```

**Function:** Unregisters the listener for estimated capture duration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be estimatedCaptureDuration, can be listened after photoOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Int32> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in the dependency definition
class TestCallbackEstimatedCaptureDuration <: Callback1Argument<Int32> {
    public init() {}
    public open func invoke(res: Int32): Unit {
        Hilog.info(0, "Camera", "Call invoke EstimatedCaptureDuration. time: ${res}")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackEstimatedCaptureDuration = TestCallbackEstimatedCaptureDuration()
output.off(CameraCallbackType.EstimatedCaptureDuration, testCallbackEstimatedCaptureDuration)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregisters the listener for photo output errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be error, can be listened after photoOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added in the dependency definition
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.off(CameraCallbackType.CameraError, testCallbackError)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Cancels all callbacks for the corresponding listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
output.off(CameraCallbackType.CaptureStartWithInfo)
```

### func on(CameraCallbackType, Callback1Argument\<CaptureStartInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<CaptureStartInfo>): Unit
```

**Function:** Listens for photo capture start, obtaining [CaptureStartInfo](#struct-capturestartinfo) through the registered callback function.

> **Note:**
>
> Calling off to unregister the callback within the on listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be captureStartWithInfo, can be listened after photoOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#struct-capturestartinfo)> | Yes | - | Callback function to obtain related information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in the dependency definition
class TestCallbackCaptureStartWithInfo <: Callback1Argument<CaptureStartInfo> {
    public init() {}
    public open func invoke(res: CaptureStartInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureStartWithInfo. captureId: ${res.captureId}, time： ${res.time}")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureStartWithInfo = TestCallbackCaptureStartWithInfo()
output.on(CameraCallbackType.CaptureStartWithInfo, testCallbackCaptureStartWithInfo)
```

### func on(CameraCallbackType, Callback1Argument\<FrameShutterInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterInfo>): Unit
```

**Function:** Listens for photo frame output capture, obtaining results through the registered callback function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be frameShutter, can be listened after photoOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#struct-frameshutterinfo)> | Yes | - | Callback function to obtain related information. This callback return means the capture request can be issued again. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in the dependency definition
class TestCallbackFrameShutter <: Callback1Argument<FrameShutterInfo> {
    public init() {}
    public open func invoke(res: FrameShutterInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutter. captureId: ${res.captureId}, timestamp： ${res.timestamp}")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackFrameShutter = TestCallbackFrameShutter()
output.on(CameraCallbackType.FrameShutter, testCallbackFrameShutter)
```

### func on(CameraCallbackType, Callback1Argument\<CaptureEndInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<CaptureEndInfo>): Unit
```

**Function:** Listens for photo capture end, obtaining results through the registered callback function.

> **Note:**
>
> Calling off to unregister the callback within the on listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be captureEnd, can be listened after photoOutput is successfully created. The event is triggered when photo capture is completely finished, returning corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#struct-captureendinfo)> | Yes | - | Callback function to obtain related information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added in the dependency definition
class TestCallbackCaptureEnd <: Callback1Argument<CaptureEndInfo> {
    public init() {}
    public open func invoke(res: CaptureEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureEnd. captureId: ${res.captureId}, frameCount： ${res.frameCount}")
    }
}

let ctx = Global.getAbilityContext() // Need to obtain Context application context, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureEnd = TestCallbackCaptureEnd()
output.on(CameraCallbackType.CaptureEnd, testCallbackCaptureEnd)
```

### func on(CameraCallbackType, Callback1Argument\<FrameShutterEndInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FrameShutterEndInfo>): Unit
```

**Function:** Listens for the end of photo exposure capture by registering a callback function to obtain results.

> **Note:**
>
> Calling `off` to unregister the callback within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be `frameShutterEnd`. Can be listened to after successful creation of `photoOutput`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#struct-frameshutterendinfo)> | Yes | - | Callback function to obtain relevant information. This callback indicates the end of photo exposure. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added to dependency definitions
class TestCallbackFrameShutterEnd <: Callback1Argument<FrameShutterEndInfo> {
    public init() {}
    public open func invoke(res: FrameShutterEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutterEnd. captureId: ${res.captureId}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackFrameShutterEnd = TestCallbackFrameShutterEnd()
output.on(CameraCallbackType.FrameShutterEnd, testCallbackFrameShutterEnd)
```

### func on(CameraCallbackType, Callback0Argument)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Listens for readiness to capture the next photo by registering a callback function to obtain results.

> **Note:**
>
> Calling `off` to unregister the callback within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be `captureReady`. Can be listened to after successful creation of `photoOutput`. Triggers when the next photo can be captured. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added to dependency definitions
class TestCallbackCaptureReady <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureReady.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackCaptureReady = TestCallbackCaptureReady()
output.on(CameraCallbackType.CaptureReady, testCallbackCaptureReady)
```

### func on(CameraCallbackType, Callback1Argument\<Int32>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<Int32>): Unit
```

**Function:** Listens for the estimated photo capture time.

> **Note:**
>
> Calling `off` to unregister the callback within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be `estimatedCaptureDuration`. Can be listened to after successful creation of `photoOutput`. Triggers when photo capture is fully completed. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Int32> | Yes | - | Callback function to obtain the estimated single photo capture time from the sensor frame. Returns -1 if no estimate is available. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added to dependency definitions
class TestCallbackEstimatedCaptureDuration <: Callback1Argument<Int32> {
    public init() {}
    public open func invoke(res: Int32): Unit {
        Hilog.info(0, "Camera", "Call invoke EstimatedCaptureDuration. time: ${res}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackEstimatedCaptureDuration = TestCallbackEstimatedCaptureDuration()
output.on(CameraCallbackType.EstimatedCaptureDuration, testCallbackEstimatedCaptureDuration)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Listens for photo output errors by registering a callback function to obtain results.

> **Note:**
>
> Calling `off` to unregister the callback within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be `error`. Can be listened to after successful creation of `photoOutput`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to obtain error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraCallbackType.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message                  |
  |:-------------|:------------------------------|
  | 7400201      | Camera service fatal error.    |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
output.release()
```

### func setMovingPhotoVideoCodecType(VideoCodecType)

```cangjie
public func setMovingPhotoVideoCodecType(codecType: VideoCodecType): Unit
```

**Function:** Sets the video codec type for moving photos.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| codecType | [VideoCodecType](#enum-videocodectype) | Yes | - | The video codec type for moving photos. |

**Exceptions:**

- BusinessException: For detailed error codes, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message                  |
  |:-------------|:------------------------------|
  | 7400201      | Camera service fatal error.    |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(ability.photoProfiles[0])
output.setMovingPhotoVideoCodecType(VideoCodecType.AVC)
```

## class PhotoSession

```cangjie
public class PhotoSession <: Session & Flash & AutoExposure & Focus & Zoom & ColorManagement {}
```

**Function:** A session class for standard photo capture mode, providing operations for flash, exposure, focus, zoom, and color space.
**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Types:**  

- [Session](#interface-session)  
- [Flash](#interface-flash)  
- [AutoExposure](#interface-autoexposure)  
- [Focus](#interface-focus)  
- [Zoom](#interface-zoom)  
- [ColorManagement](#interface-colormanagement)  

### func canPreconfig(PreconfigType, PreconfigRatio)  

```cangjie  
public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PRECONFIG_RATIO_4_3): Bool  
```  

**Description:** Queries whether the current Session supports the specified preconfiguration type.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |  
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PRECONFIG_RATIO_4_3 | **Named parameter.** Optional aspect ratio. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | true: The specified preconfiguration type is supported. false: The specified preconfiguration type is not supported. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).  

  | Error Code ID | Error Message |  
  |:----|:----|  
  | 7400201 | Camera service fatal error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
AppLog.info(session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9))  
```  

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)  

```cangjie  
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit  
```  

**Description:** Unregisters the listener for error events in a normal photo session. Results are obtained via the registered callback function.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error. This interface can be listened to after the session is successfully created. |  
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to be unregistered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.hilog.Hilog  
import ohos.base.*  

// This code can be added to dependency definitions  
class TestCallbackError <: Callback1Argument<BusinessException> {  
    public init() {}  
    public open func invoke(res: BusinessException): Unit {  
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")  
    }  
}  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
let callback = TestCallbackError()  
session.off(CameraCallbackType.CameraError, callback)  
```  

### func off(CameraCallbackType, Callback1Argument\<FocusState>)  

```cangjie  
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit  
```  

**Description:** Unregisters the listener for camera focus state changes.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.focusStateChange. This interface can be listened to after the session is successfully created. |  
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to be unregistered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

// This code can be added to dependency definitions  
class FocusStateChangeCallback <: Callback1Argument<FocusState> {  
    public static var invoked = false  

    public func invoke(state: FocusState) {  
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")  

        invoked = true  
    }  
}  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
let callback = FocusStateChangeCallback()  
session.off(CameraCallbackType.FocusStateChange, callback)  
```  

### func off(CameraCallbackType, Callback1Argument\<SmoothZoomInfo>)  

```cangjie  
public func off(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit  
```  

**Description:** Unregisters the listener for camera smooth zoom state changes.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.smoothZoomInfoAvailable. This interface can be listened to after the session is successfully created. |  
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)> | Yes | - | Callback function to be unregistered. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

// This code can be added to dependency definitions  
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {  
    public static var invoked = false  

    public func invoke(info: SmoothZoomInfo) {  
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")  

        invoked = true  
    }  
}  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
let callback = SmoothZoomInfoAvailableCallback()  
session.off(CameraCallbackType.SmoothZoomInfoAvailable, callback)  
```  

### func off(CameraCallbackType)  

```cangjie  
public func off(`type`: CameraCallbackType): Unit  
```  

**Description:** Unregisters the listener for error events in a normal photo session/camera focus state changes/camera smooth zoom state changes.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error or CameraCallbackType.focusStateChange or CameraCallbackType.smoothZoomInfoAvailable. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
session.off(CameraCallbackType.FocusStateChange)  
```  

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)  

```cangjie  
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit  
```  

**Description:** Listens for error events in a normal photo session. Results are obtained via the registered callback function.  

> **Note:**  
>  
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error. This interface can be listened to after the session is successfully created. The event is triggered when errors occur in session-related interfaces, such as `beginConfig`, `commitConfig`, or `addInput`, returning error information. |  
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to obtain error information. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.CameraKit.*  
import ohos.base.*  

// This code can be added to dependency definitions  
class TestCallbackError <: Callback1Argument<BusinessException> {  
    public init() {}  
    public open func invoke(res: BusinessException): Unit {  
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")  
    }  
}  

let ctx = Global.getAbilityContext() // Context application context required. See usage instructions.  
let cameraManager = getCameraManager(ctx)  
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession  
let session = photoSession.getOrThrow()  
let callback = TestCallbackError()  
session.on(CameraCallbackType.CameraError, callback)  
```  

### func on(CameraCallbackType, Callback1Argument\<FocusState>)  

```cangjie  
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit  
```  

**Description:** Listens for camera focus state changes. Results are obtained via the registered callback function.  

> **Note:**  
>  
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be CameraCallbackType.focusStateChange. Can be listened to after session creation succeeds. Triggered only in auto-focus mode when the camera's focus state changes. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to retrieve the current focus state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
let callback = FocusStateChangeCallback()
session.on(CameraCallbackType.FocusStateChange, callback)
```

### func on(CameraCallbackType, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Description:** Listens for changes in the camera's smooth zoom state and retrieves results via a registered callback function.

> **Note:**
>
> Do not call `off` to unregister the callback within the callback method of `on`.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be CameraCallbackType.smoothZoomInfoAvailable. Can be listened to after session creation succeeds. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)> | Yes | - | Callback function to retrieve the current smooth zoom state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraCallbackType.SmoothZoomInfoAvailable, callback)
```

### func preconfig(PreconfigType, PreconfigRatio)

```cangjie
public func preconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PreconfigRatio.PRECONFIG_RATIO_4_3): Unit
```

**Description:** Preconfigures the current Session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PreconfigRatio.PRECONFIG_RATIO_4_3 | **Named parameter.** Optional aspect ratio. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400201|Camera service fatal error.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
session.preconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

## class PreviewOutput

```cangjie
public class PreviewOutput <: CameraOutput {}
```

**Description:** Preview output class.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**Description:** Retrieves the currently set frame rate range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[FrameRateRange](#struct-frameraterange)|Frame rate range.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let range = output.getActiveFrameRate()
```

### func getActiveProfile()

```cangjie
public func getActiveProfile(): Profile
```

**Description:** Retrieves the currently active configuration information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[Profile](#class-profile)|Currently active configuration information.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400201|Camera service fatal error.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let profile = output.getActiveProfile()
```

### func getPreviewRotation(Int32)

```cangjie
public func getPreviewRotation(displayRotation: Int32): ImageRotation
```

**Description:** Retrieves the preview rotation angle.

- Device natural orientation: Default usage orientation of the device, e.g., portrait for phones (charging port downward).
- Camera lens angle: Value equals the angle by which the camera image is rotated clockwise to align with the device's natural orientation. For example, the rear camera sensor on a phone is installed in portrait mode, requiring a 90-degree clockwise rotation to match the natural orientation.
- Screen display orientation: The image's top-left corner should be the origin (first pixel point). When locked, it aligns with the natural orientation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| displayRotation | Int32 | Yes | - | Screen rotation angle of the display device, obtained via [getDefaultDisplaySync](../../arkui-cj/cj-apis-display.md#func-getdefaultdisplaysync). |

**Return Value:**

| Type | Description |
|:----|:----|
|[ImageRotation](#enum-imagerotation)|Preview rotation angle.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400101|Parameter missing or parameter type incorrect.|
  |7400201|Camera service fatal error.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let imageRotation = output.getPreviewRotation(0)
```

### func getSupportedFrameRates()
```cangjie
public func getSupportedFrameRates(): Array<FrameRateRange>
```

**Function:** Query supported frame rate ranges.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[FrameRateRange](#struct-frameraterange)> | List of supported frame rate ranges. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let frameRateRanges = output.getSupportedFrameRates()
```

### func off(CameraCallbackType, Callback0Argument)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Unregister listeners for preview frame start or preview frame end events.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be frameStart or frameEnd. Can be listened to after previewOutput is successfully created. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallback = TestCallback()
output.off(CameraCallbackType.FrameStart, testCallback)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregister listeners for preview output error events.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be error. Can be listened to after previewOutput is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to be unregistered. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.base.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.off(CameraCallbackType.CameraError, testCallbackError)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Unregister all callbacks for the specified event type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.off(CameraCallbackType.CameraError)
```

### func on(CameraCallbackType, Callback0Argument)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Register listeners for preview frame start or preview frame end events.

> **Note:**
>
> Calling off to unregister callbacks within the on callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be frameStart or frameEnd. Can be listened to after previewOutput is successfully created. Triggered when the underlying system starts exposure for the first time. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added to dependency definitions
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallback = TestCallback()
output.on(CameraCallbackType.FrameStart, testCallback)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Register listeners for preview output error events, obtaining results through callback functions.

> **Note:**
>
> Calling off to unregister callbacks within the on callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Event type, must be error. Can be listened to after previewOutput is successfully created. Triggered when errors occur during preview interface usage, such as calling Session.start, CameraOutput.release, etc., returning corresponding error information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function for obtaining error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// This code can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraCallbackType.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```
**Function:** Release output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID      | Error Message       |
  | :---------------- | :------------------ |
  | 7400201           | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.release()
```

### func setFrameRate(Int32, Int32)

```cangjie
public func setFrameRate(minFps: Int32, maxFps: Int32): Unit
```

**Function:** Set the frame rate range for the preview stream. The specified range must be within the supported frame rate range. Before setting, you can query the supported frame rate range via [getSupportedFrameRates](#func-getsupportedframerates).

> **Note:**
>
> Only supported in [PhotoSession](#class-photosession) or [VideoSession](#class-videosession) modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description |
| :------------ | :----- | :------- | :------------ | :---------- |
| minFps        | Int32  | Yes      | -             | Minimum frame rate. |
| maxFps        | Int32  | Yes      | -             | Maximum frame rate. If the minimum value passed is greater than the maximum value, the parameter is invalid, and the interface will not take effect. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID      | Error Message       |
  | :---------------- | :------------------ |
  | 7400101           | Parameter missing or parameter type incorrect. |
  | 7400110           | Unresolved conflicts with current configurations. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.setFrameRate(30, 60)
```

### func setPreviewRotation(ImageRotation, Bool)

```cangjie
public func setPreviewRotation(previewRotation: ImageRotation, isDisplayLocked!: Bool = false): Unit
```

**Function:** Set the preview rotation angle.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name    | Type               | Required | Default Value | Description |
| :--------------- | :---------------- | :------- | :------------ | :---------- |
| previewRotation  | [ImageRotation](#enum-imagerotation) | Yes      | -             | Preview rotation angle. |
| isDisplayLocked  | Bool              | No       | false         | **Named parameter.** Whether rotation is locked. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID      | Error Message       |
  | :---------------- | :------------------ |
  | 7400101           | Parameter missing or parameter type incorrect. |
  | 7400201           | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.setPreviewRotation(ROTATION_90)
```

## class Profile

```cangjie
public open class Profile {
    public let format: CameraFormat
    public let size: Size
}
```

**Function:** Camera configuration item.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

### let format

```cangjie
public let format: CameraFormat
```

**Function:** Output format.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Type:** [CameraFormat](#enum-cameraformat)

**Read/Write Capability:** Read-only

**Initial Version:** 21

### let size

```cangjie
public let size: Size
```

**Function:** Resolution. Sets the camera resolution width and height, not the actual output image dimensions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Type:** [Size](#struct-size)

**Read/Write Capability:** Read-only

**Initial Version:** 21

## class SecureSession

```cangjie
public class SecureSession <: Session & Flash & AutoExposure & Focus & Zoom {}
```
**Function:** Secure mode session class, providing operations for flash, exposure, focus, and zoom.

**System Capability:** SystemCapability.Multimedia.Camera.Core

> **Note:**
>
> - A secure mode session is created via the [createSession](#func-createsessionscenemode) interface by passing [SceneMode](#enum-scenemode) as SECURE_PHOTO. This mode is intended for applications with security requirements such as facial recognition and banking, requiring the use of a secure TA. It supports scenarios where both regular preview streams and secure streams are output simultaneously.
>
> - The secure TA can be used for image processing, including capabilities such as verifying server-issued data signatures, image signing, parsing and assembling TLV logic, as well as key reading, creation, and manipulation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- [Session](#interface-session)
- [Flash](#interface-flash)
- [AutoExposure](#interface-autoexposure)
- [Focus](#interface-focus)
- [Zoom](#interface-zoom)

### func addSecureOutput(PreviewOutput)

```cangjie
public func addSecureOutput(previewOutput: PreviewOutput): Unit
```

**Function:** Mark one of the [PreviewOutput](#class-previewoutput) streams as a secure output.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                   | Required | Default Value | Description |
| :------------ | :--------------------- | :------- | :------------ | :---------- |
| previewOutput | [PreviewOutput](#class-previewoutput) | Yes      | -             | The preview stream to be marked as a secure output. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101      | Parameter missing or parameter type incorrect. |
  | 7400102      | Operation not allowed. |
  | 7400103      | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
session.addSecureOutput(previewOutput)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregister the listener for error events in a regular photo session. Results are obtained via the registered callback function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                                                                 | Required | Default Value | Description |
| :------------ | :------------------------------------------------------------------ | :------- | :------------ | :---------- |
| \`type\`      | [CameraCallbackType](#enum-cameracallbacktype)                      | Yes      | -             | Listening event, must be CameraCallbackType.error. This interface can be listened to after the session is successfully created. |
| callback      | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes      | -             | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to the dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
let callback = TestCallbackError()
session.off(CameraCallbackType.CameraError, callback)
```

### func off(CameraCallbackType, Callback1Argument\<FocusState>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit
```

**Function:** Unregisters the listener for camera focus state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.focusStateChange. This interface can be monitored after session creation. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
let callback = FocusStateChangeCallback()
session.off(CameraCallbackType.FocusStateChange, callback)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Unregisters the listener for normal photo session error events/camera focus state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error or CameraCallbackType.focusStateChange. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
session.off(CameraCallbackType.CameraError)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Listens for normal photo session error events and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error. This interface can be monitored after session creation. The event is triggered when errors occur in session-related interfaces, such as beginConfig, commitConfig, addInput, etc., returning error information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to obtain error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class ErrorCallback <: Callback1Argument<BusinessException> {
    public static var invoked = false

    public func invoke(exception: BusinessException) {
        AppLog.info("[multimedia_camera | Error Callback]: exception: ${exception.message}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
let callback = ErrorCallback()
session.on(CameraCallbackType.CameraError, callback)
```

### func on(CameraCallbackType, Callback1Argument\<FocusState>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit
```

**Function:** Listens for camera focus state changes and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.focusStateChange. Can be monitored after session creation. This event is triggered only in auto-focus mode when the camera focus state changes. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to obtain the current focus state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
let callback = FocusStateChangeCallback()
session.on(CameraCallbackType.FocusStateChange, callback)
```

## class VideoOutput

```cangjie
public class VideoOutput <: CameraOutput {}
```

**Function:** Output information used in video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**Function:** Obtains the set frame rate range. Can be queried after setting the frame rate for the video stream using setFrameRate.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [FrameRateRange](#struct-frameraterange) | Frame rate range. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let frameRateRange = output.getActiveFrameRate()
```

### func getActiveProfile()

```cangjie
public func getActiveProfile(): VideoProfile
```

**Function:** Obtains the currently active configuration information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [VideoProfile](#class-videoprofile) | Currently active configuration information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions in this document
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let videoProfile = output.getActiveProfile()
```

### func getSupportedFrameRates()

```cangjie
public func getSupportedFrameRates(): Array<FrameRateRange>
```

**Function:** Queries supported frame rate ranges.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[FrameRateRange](#struct-frameraterange)> | List of supported frame rate ranges. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let frameRateRanges = output.getSupportedFrameRates()
```

### func getVideoRotation(Int32)

```cangjie
public func getVideoRotation(deviceDegree: Int32): ImageRotation
```

**Function:** Obtains video recording rotation angle.

- Device natural orientation: Default usage direction of the device, portrait for mobile phones (charging port downward).
- Camera lens angle: Value equals the angle by which the camera image is rotated clockwise to align with the device's natural orientation. Rear camera sensors in mobile phones are installed vertically, requiring a 90-degree clockwise rotation to match the natural orientation.
- Screen display orientation: Requires the image's top-left corner pixel as the coordinate origin. Matches natural orientation when locked.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| deviceDegree | Int32 | Yes | - | Device rotation angle. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageRotation](#enum-imagerotation) | Video recording rotation angle. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :-------------- | :-------------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let imageRotation = output.getVideoRotation(0)
```

### func off(CameraCallbackType, Callback0Argument)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Unregisters listener for video recording start or end.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be frameStart or frameEnd. Can be listened after videoOutput creation. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to cancel corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// Code can be added in dependency definitions
class TestCallbackFrameStart <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackFrameStart = TestCallbackFrameStart()
output.off(CameraCallbackType.FrameStart, testCallbackFrameStart)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregisters listener for video output errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be error. Can be listened after videoOutput creation. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to cancel corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// Code can be added in dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.off(CameraCallbackType.CameraError, testCallbackError)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Cancels all callbacks for the specified listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.off(CameraCallbackType.CameraError)
```

### func on(CameraCallbackType, Callback0Argument)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback0Argument): Unit
```

**Function:** Listens for video recording start or end.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be frameStart or frameEnd. Can be listened after videoOutput creation. Triggered and returned upon first exposure at the underlying layer. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to obtain results. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// Code can be added in dependency definitions
class TestCallbackFrameStart <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, refer to usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackFrameStart = TestCallbackFrameStart()
output.on(CameraCallbackType.FrameStart, testCallbackFrameStart)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)
```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Listens for errors during video recording output and retrieves results by registering a callback function.

> **Note:**
>
> Calling `off` to unregister a callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be `error`. Can be monitored after successful creation of `videoOutput`. Triggers when errors occur during video interface calls (e.g., `start`, `CameraOutput.release`) and returns corresponding error codes and messages. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function for retrieving error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// Code here can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraCallbackType.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.release()
```

### func setFrameRate(Int32, Int32)

```cangjie
public func setFrameRate(minFps: Int32, maxFps: Int32): Unit
```

**Function:** Sets the frame rate range for video streaming. The specified range must be within the supported frame rate range. Use [getSupportedFrameRates](#func-getsupportedframerates) to query supported ranges before setting.

> **Note:**
>
> Only supported in [PhotoSession](#class-photosession) or [VideoSession](#class-videosession) modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| minFps | Int32 | Yes | - | Minimum frame rate. |
| maxFps | Int32 | Yes | - | Maximum frame rate. If the minimum value exceeds the maximum, the parameters are invalid, and the interface will not take effect. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400110 | Unresolved conflicts with current configurations. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.setFrameRate(30, 60)
```

### func start()

```cangjie
public func start(): Unit
```

**Function:** Starts recording.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :----------- |
  | 7400103 | Session not configured. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.start()
```

### func stop()

```cangjie
public func stop(): Unit
```

**Function:** Stops recording.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // Context application context required; see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.stop()
```

## class VideoProfile

```cangjie
public class VideoProfile <: Profile {
    public let frameRateRange: FrameRateRange
}
```

**Function:** Video configuration item.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- [Profile](#class-profile)

### let frameRateRange

```cangjie
public let frameRateRange: FrameRateRange
```

**Function:** Frame rate range, fps (frames per second).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Type:** [FrameRateRange](#struct-frameraterange)

**Read/Write Capability:** Read-only

**Initial Version:** 21

## class VideoSession

```cangjie
public class VideoSession <: Session & Flash & AutoExposure & Focus & Zoom & Stabilization & ColorManagement {}
```
**Function:** Video recording session class in standard mode, providing operations for flash, exposure, focus, zoom, video stabilization, and color space.

> **Note:**
>
> Default video recording mode suitable for general scenarios. Supports various resolutions (e.g., 720P, 1080p) and frame rates (e.g., 30fps, 60fps).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- [Session](#interface-session)
- [Flash](#interface-flash)
- [AutoExposure](#interface-autoexposure)
- [Focus](#interface-focus)
- [Zoom](#interface-zoom)
- [Stabilization](#interface-stabilization)
- [ColorManagement](#interface-colormanagement)

### func canPreconfig(PreconfigType, PreconfigRatio)

```cangjie
public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PRECONFIG_RATIO_16_9): Bool
```

**Function:** Queries whether the current Session supports the specified preconfiguration type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PRECONFIG_RATIO_16_9 | **Named parameter.** Optional aspect ratio. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Supports the specified preconfiguration value type. false: Does not support the specified preconfiguration value type. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Unregisters the listener for error events in normal photo sessions, obtaining results through the registered callback function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = TestCallbackError()
session.off(CameraCallbackType.CameraError, callback)
```

### func off(CameraCallbackType, Callback1Argument\<FocusState>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit
```

**Function:** Unregisters the listener for camera focus state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.focusStateChange. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to dependency definitions
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = FocusStateChangeCallback()
session.off(CameraCallbackType.FocusStateChange, callback)
```

### func off(CameraCallbackType, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Function:** Unregisters the listener for camera smooth zoom state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.smoothZoomInfoAvailable. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)> | Yes | - | Callback function to cancel the corresponding callback. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.off(CameraCallbackType.SmoothZoomInfoAvailable, callback)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**Function:** Unregisters the listener for error events in normal photo sessions/camera focus state changes/camera smooth zoom state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error or CameraCallbackType.focusStateChange or CameraCallbackType.smoothZoomInfoAvailable. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraCallbackType.SmoothZoomInfoAvailable)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**Function:** Listens for error events in normal photo sessions, obtaining results through the registered callback function.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.error. This interface can be listened to after the session is successfully created. This event is triggered when errors occur in session-related interfaces, such as `beginConfig`, `commitConfig`, `addInput`, etc., returning error information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)> | Yes | - | Callback function to obtain error information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to dependency definitions
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // Context application context required, see usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = TestCallbackError()
session.on(CameraCallbackType.CameraError, callback)
```

### func on(CameraCallbackType, Callback1Argument\<FocusState>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FocusState>): Unit
```

**Function:** Listens for camera focus state changes, obtaining results through the registered callback function.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| \`type\` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Listening event, must be CameraCallbackType.focusStateChange. This interface can be listened to after the session is successfully created. This event is triggered only in auto-focus mode when the camera focus state changes. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to obtain the current focus state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// This code can be added to dependency definitions
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")
        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = FocusStateChangeCallback()
session.on(CameraCallbackType.FocusStateChange, callback)
```

### func on(CameraCallbackType, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Function:** Listens for camera smooth zoom state changes and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method registered via `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | The event to listen for, must be CameraCallbackType.smoothZoomInfoAvailable. Can be listened to after session creation succeeds. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)> | Yes | - | Callback function for obtaining the current smooth zoom state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// Code here can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraCallbackType.SmoothZoomInfoAvailable, callback)
```

### func preconfig(PreconfigType, PreconfigRatio)

```cangjie
public func preconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PreconfigRatio.PRECONFIG_RATIO_16_9): Unit
```

**Function:** Preconfigures the current Session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PreconfigRatio.PRECONFIG_RATIO_16_9 | **Named parameter.** Optional aspect ratio. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |:----|:----|
  |7400201|Camera service fatal error.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // Context application context needs to be obtained, refer to the usage instructions in this document
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
session.preconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

## struct CameraStatusInfo

```cangjie
public struct CameraStatusInfo {
    public var camera: CameraDevice
    public var status: CameraStatus
    public init(camera: CameraDevice, status: CameraStatus)
}
```

**Function:** The interface instance returned by the camera manager callback, representing camera status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var camera

```cangjie
public var camera: CameraDevice
```

**Function:** Camera information.

**Type:** [CameraDevice](#struct-cameradevice)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var status

```cangjie
public var status: CameraStatus
```

**Function:** Camera status.

**Type:** [CameraStatus](#enum-camerastatus)

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(CameraDevice, CameraStatus)

```cangjie
public init(camera: CameraDevice, status: CameraStatus)
```

**Function:** Creates a CameraStatusInfo object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| camera | [CameraDevice](#struct-cameradevice) | Yes | - | Camera information. |
| status | [CameraStatus](#enum-camerastatus) | Yes | - | Camera status. |

## struct CaptureEndInfo

```cangjie
public struct CaptureEndInfo {
    public var captureId: Int32
    public var frameCount: Int32
}
```

**Function:** Capture stop information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Function:** Capture ID.

**Type:** Int32

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var frameCount

```cangjie
public var frameCount: Int32
```

**Function:** Frame count.

**Type:** Int32

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct CaptureStartInfo

```cangjie
public struct CaptureStartInfo {
    public var captureId: Int32
    public var time: UInt32
}
```

**Function:** Capture start information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Function:** Capture ID.

**Type:** Int32

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var time

```cangjie
public var time: UInt32
```

**Function:** Estimated single capture frame collection time at the sensor level.

**Type:** UInt32

**Read/Write:** Read-Write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct FoldStatusInfo

```cangjie
public struct FoldStatusInfo {
    public let supportedCameras: Array<CameraDevice>
    public let foldStatus: FoldStatus
    public init(supportedCameras: Array<CameraDevice>, foldStatus: FoldStatus)
}
```

**Function:** The interface instance returned by the camera manager callback, representing foldable device fold status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let foldStatus

```cangjie
public let foldStatus: FoldStatus
```

**Function:** Foldable screen fold status.

**Type:** [FoldStatus](#enum-foldstatus)

**Read/Write:** Read-Only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let supportedCameras

```cangjie
public let supportedCameras: Array<CameraDevice>
```

**Function:** List of supported camera information for the current fold state.

**Type:** Array\<[CameraDevice](#struct-cameradevice)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(Array\<CameraDevice>, FoldStatus)

```cangjie
public init(supportedCameras: Array<CameraDevice>, foldStatus: FoldStatus)
```

**Function:** Creates a FoldStatusInfo object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| supportedCameras | Array\<[CameraDevice](#struct-cameradevice)> | Yes | - | List of supported camera information for the current fold state. |
| foldStatus | [FoldStatus](#enum-foldstatus) | Yes | - | Foldable screen fold status. |

## struct FrameRateRange

```cangjie
public struct FrameRateRange {
    public let min: Int32
    public let max: Int32
}
```

**Function:** Frame rate range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let max

```cangjie
public let max: Int32
```

**Function:** Maximum frame rate.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let min

```cangjie
public let min: Int32
```

**Function:** Minimum frame rate.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct FrameShutterEndInfo

```cangjie
public struct FrameShutterEndInfo {
    public var captureId: Int32
}
```

**Function:** Photo exposure end information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Function:** Photo capture ID.

**Type:** Int32

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct FrameShutterInfo

```cangjie
public struct FrameShutterInfo {
    public var captureId: Int32
    public var timestamp: UInt64
}
```

**Function:** Photo frame output information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Function:** Photo capture ID.

**Type:** Int32

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var timestamp

```cangjie
public var timestamp: UInt64
```

**Function:** Shutter timestamp.

**Type:** UInt64

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct Location

```cangjie
public struct Location {
    public var latitude: Float64
    public var longtitude: Float64
    public var altitude: Float64
    public init(latitude: Float64, longtitude: Float64, altitude: Float64)
}
```

**Function:** Image geographic location information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var altitude

```cangjie
public var altitude: Float64
```

**Function:** Altitude (meters).

**Type:** Float64

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var latitude

```cangjie
public var latitude: Float64
```

**Function:** Latitude (degrees).

**Type:** Float64

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var longtitude

```cangjie
public var longtitude: Float64
```

**Function:** Longitude (degrees).

**Type:** Float64

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(Float64, Float64, Float64)

```cangjie
public init(latitude: Float64, longtitude: Float64, altitude: Float64)
```

**Function:** Creates a Location object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| latitude | Float64 | Yes | - | Latitude (degrees). |
| longtitude | Float64 | Yes | - | Longitude (degrees). |
| altitude | Float64 | Yes | - | Altitude (meters). |

## struct PhotoCaptureSetting

```cangjie
public struct PhotoCaptureSetting {
    public var quality: QualityLevel
    public var rotation: ImageRotation
    public var location: Location
    public var mirror: Bool
    public init(
        quality!: QualityLevel = QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation!: ImageRotation = ImageRotation.ROTATION_0,
        location!: Location = Location(-1.0, -1.0, -1.0),
        mirror!: Bool = false
    )
}
```

**Function:** Settings for capturing photos.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var location

```cangjie
public var location: Location
```

**Function:** Image geographic location information (defaults to device hardware information).

**Type:** [Location](#struct-location)

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var mirror

```cangjie
public var mirror: Bool
```

**Function:** Mirror enable switch (default off). Use isMirrorSupported to check support before enabling.

**Type:** Bool

**Read/Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var quality
```cangjie
public var quality: QualityLevel
```

**Function:** Image quality (default: low).

**Type:** [QualityLevel](#enum-qualitylevel)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var rotation

```cangjie
public var rotation: ImageRotation
```

**Function:** Image rotation angle (default: 0 degrees, clockwise rotation).

**Type:** [ImageRotation](#enum-imagerotation)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(QualityLevel, ImageRotation, Location, Bool)

```cangjie
public init(
    quality!: QualityLevel = QualityLevel.QUALITY_LEVEL_MEDIUM,
    rotation!: ImageRotation = ImageRotation.ROTATION_0,
    location!: Location = Location(-1.0, -1.0, -1.0),
    mirror!: Bool = false
)
```

**Function:** Creates a PhotoCaptureSetting object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| quality | [QualityLevel](#enum-qualitylevel) | No | QualityLevel.QUALITY_LEVEL_MEDIUM | **Named parameter.** Image quality (default: medium). |
| rotation | [ImageRotation](#enum-imagerotation) | No | ImageRotation.ROTATION_0 | **Named parameter.** Image quality (default: low). |
| location | [Location](#struct-location) | No | Location(-1.0, -1.0, -1.0) | **Named parameter.** Geographic location information of the image (default: based on device hardware information). |
| mirror | Bool | No | false | **Named parameter.** Mirror enable switch (default: off). Use [isMirrorSupported](#func-ismirrorsupported) to check support before using. |

## struct Point

```cangjie
public struct Point {
    public var x: Float32
    public var y: Float32
    public init(x: Float32, y: Float32)
}
```

**Function:** Point coordinates for focus and exposure configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var x

```cangjie
public var x: Float32
```

**Function:** The x-coordinate of the point.

**Type:** Float32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var y

```cangjie
public var y: Float32
```

**Function:** The y-coordinate of the point.

**Type:** Float32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(Float32, Float32)

```cangjie
public init(x: Float32, y: Float32)
```

**Function:** Creates a Point object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | Yes | - | The x-coordinate of the point. |
| y | Float32 | Yes | - | The y-coordinate of the point. |

## struct Rect

```cangjie
public struct Rect {
    public var topLeftX: Float64
    public var topLeftY: Float64
    public var width: Float64
    public var height: Float64
}
```

**Function:** Rectangle definition.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var height

```cangjie
public var height: Float64
```

**Function:** Rectangle height, relative value, range [0.0, 1.0].

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var topLeftX

```cangjie
public var topLeftX: Float64
```

**Function:** The x-coordinate of the top-left corner of the rectangle.

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var topLeftY

```cangjie
public var topLeftY: Float64
```

**Function:** The y-coordinate of the top-left corner of the rectangle.

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var width

```cangjie
public var width: Float64
```

**Function:** Rectangle width, relative value, range [0.0, 1.0].

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct Size

```cangjie
public struct Size {
    public var width: UInt32
    public var height: UInt32
}
```

**Function:** Output capability query.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var height

```cangjie
public var height: UInt32
```

**Function:** Image height (in pixels).

**Type:** UInt32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var width

```cangjie
public var width: UInt32
```

**Function:** Image width (in pixels).

**Type:** UInt32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## struct SmoothZoomInfo

```cangjie
public struct SmoothZoomInfo {
    public SmoothZoomInfo(public var duration: Int32)
}
```

**Function:** Smooth zoom parameter information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var duration

```cangjie
public var duration: Int32
```

**Function:** Total duration of smooth zoom, in milliseconds.

**Type:** Int32

**Access:** Read-write

**Since:** 21

### SmoothZoomInfo(Int32)

```cangjie
public SmoothZoomInfo(public var duration: Int32)
```

**Function:** Creates a SmoothZoomInfo object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| duration | Int32 | Yes | - | Total duration of smooth zoom, in milliseconds. |

## struct TorchStatusInfo
```cangjie
public struct TorchStatusInfo {
    public let isTorchAvailable: Bool
    public let isTorchActive: Bool
    public let torchLevel: Float32
}
```

**Function:** An interface instance returned by the torch callback, representing torch status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let isTorchActive

```cangjie
public let isTorchActive: Bool
```

**Function:** Indicates whether the torch is activated.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let isTorchAvailable

```cangjie
public let isTorchAvailable: Bool
```

**Function:** Indicates whether the torch is available.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let torchLevel

```cangjie
public let torchLevel: Float32
```

**Function:** Torch brightness level. The value ranges from [0.0,1.0], where values closer to 1 indicate higher brightness.

**Type:** Float32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## enum CameraCallbackType

```cangjie
public enum CameraCallbackType <: ToString & Equatable<CameraCallbackType> {
    | CameraError
    | CameraStatus
    | FoldStatusChange
    | TorchStatusChange
    | FrameStart
    | FrameEnd
    | CaptureStartWithInfo
    | FrameShutter
    | CaptureEnd
    | FrameShutterEnd
    | CaptureReady
    | EstimatedCaptureDuration
    | MetadataObjectsAvailable
    | FocusStateChange
    | SmoothZoomInfoAvailable
    | ...
}
```

**Function:** Event names for monitoring.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<CameraCallbackType>

### CameraError

```cangjie
CameraError
```

**Function:** Error event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraStatus

```cangjie
CameraStatus
```

**Function:** Camera status change.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CaptureEnd

```cangjie
CaptureEnd
```

**Function:** Capture ended.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CaptureReady

```cangjie
CaptureReady
```

**Function:** Ready for next capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CaptureStartWithInfo

```cangjie
CaptureStartWithInfo
```

**Function:** Capture started.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### EstimatedCaptureDuration

```cangjie
EstimatedCaptureDuration
```

**Function:** Estimated capture duration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusStateChange

```cangjie
FocusStateChange
```

**Function:** Camera focus state change.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FoldStatusChange

```cangjie
FoldStatusChange
```

**Function:** Foldable device fold status change.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameEnd

```cangjie
FrameEnd
```

**Function:** Preview frame ended.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameShutter

```cangjie
FrameShutter
```

**Function:** Capture frame output.
**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameShutterEnd

```cangjie
FrameShutterEnd
```

**Function:** Capture exposure ended.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameStart

```cangjie
FrameStart
```

**Function:** Preview frame started.

**Since:** 21

### MetadataObjectsAvailable

```cangjie
MetadataObjectsAvailable
```

**Function:** Metadata objects detected.

**Since:** 21

### SmoothZoomInfoAvailable

```cangjie
SmoothZoomInfoAvailable
```

**Function:** Camera smooth zoom state change.

**Since:** 21

### TorchStatusChange

```cangjie
TorchStatusChange
```

**Function:** Torch status change.

**Since:** 21

### func !=(CameraCallbackType)

```cangjie
public operator func !=(other: CameraCallbackType): Bool
```

**Function:** Determines whether two enum values are unequal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[CameraCallbackType](#enum-cameracallbacktype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(CameraCallbackType)

```cangjie
public operator func ==(other: CameraCallbackType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraCallbackType](#enum-cameracallbacktype) | Yes | - | Another enumeration value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Gets the value of the enumeration.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The description of the enumeration. |  

## enum CameraErrorCode  

```cangjie  
public enum CameraErrorCode <: Equatable<CameraErrorCode> & ToString {  
    | INVALID_ARGUMENT  
    | OPERATION_NOT_ALLOWED  
    | SESSION_NOT_CONFIG  
    | SESSION_NOT_RUNNING  
    | SESSION_CONFIG_LOCKED  
    | DEVICE_SETTING_LOCKED  
    | CONFLICT_CAMERA  
    | DEVICE_DISABLED  
    | DEVICE_PREEMPTED  
    | UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS  
    | SERVICE_FATAL_ERROR  
    | ...  
}  
```  

**Function:** Camera error codes.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Types:**  

- Equatable\<CameraErrorCode>  
- ToString  

| Name | Value | Description |  
| :------------------------ | :--- | :----------- |  
| INVALID_ARGUMENT | 7400101 | Missing parameter or incorrect parameter type. |  
| OPERATION_NOT_ALLOWED | 7400102 | Incorrect operation flow, not allowed. |  
| SESSION_NOT_CONFIG | 7400103 | Session not configured. |  
| SESSION_NOT_RUNNING | 7400104 | Session not running. |  
| SESSION_CONFIG_LOCKED | 7400105 | Session configuration locked. |  
| DEVICE_SETTING_LOCKED | 7400106 | Device settings locked. |  
| CONFLICT_CAMERA | 7400107 | Device opened repeatedly. |  
| DEVICE_DISABLED | 7400108 | Camera disabled for security reasons. |  
| DEVICE_PREEMPTED | 7400109 | Camera preempted and unavailable. |  
| UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS | 7400110 | Conflicts with current configurations. |  
| SERVICE_FATAL_ERROR | 7400201 | Camera service error. |  

### CONFLICT_CAMERA  

```cangjie  
CONFLICT_CAMERA  
```  

**Function:** Device opened repeatedly.  

**Initial Version:** 21  

### DEVICE_DISABLED  

```cangjie  
DEVICE_DISABLED  
```  

**Function:** Camera disabled for security reasons.  

**Initial Version:** 21  

### DEVICE_PREEMPTED  

```cangjie  
DEVICE_PREEMPTED  
```  

**Function:** Camera preempted and unavailable.  

**Initial Version:** 21  

### DEVICE_SETTING_LOCKED  

```cangjie  
DEVICE_SETTING_LOCKED  
```  

**Function:** Device settings locked.  

**Initial Version:** 21  

### INVALID_ARGUMENT  

```cangjie  
INVALID_ARGUMENT  
```  

**Function:** Missing parameter or incorrect parameter type.  

**Initial Version:** 21  

### OPERATION_NOT_ALLOWED  

```cangjie  
OPERATION_NOT_ALLOWED  
```  

**Function:** Incorrect operation flow, not allowed.  

**Initial Version:** 21  

### SERVICE_FATAL_ERROR  

```cangjie  
SERVICE_FATAL_ERROR  
```  

**Function:** Camera service error.  

**Initial Version:** 21  

### SESSION_CONFIG_LOCKED  

```cangjie  
SESSION_CONFIG_LOCKED  
```  

**Function:** Session configuration locked.  

**Initial Version:** 21  

### SESSION_NOT_CONFIG  

```cangjie  
SESSION_NOT_CONFIG  
```  

**Function:** Session not configured.  

**Initial Version:** 21  

### SESSION_NOT_RUNNING  

```cangjie  
SESSION_NOT_RUNNING  
```  

**Function:** Session not running.  

**Initial Version:** 21  

### UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS  

```cangjie  
UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS  
```  

**Function:** Conflicts with current configurations.  

**Initial Version:** 21  

### func !=(CameraErrorCode)  

```cangjie  
public operator func !=(other: CameraErrorCode): Bool  
```  

**Function:** Determines whether two enumeration values are not equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraErrorCode](#enum-cameraerrorcode) | Yes | - | Another enumeration value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |  

### func ==(CameraErrorCode)  

```cangjie  
public operator func ==(other: CameraErrorCode): Bool  
```  

**Function:** Determines whether two enumeration values are equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraErrorCode](#enum-cameraerrorcode) | Yes | - | Another enumeration value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Gets the value of CameraErrorCode.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | The value of CameraErrorCode. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Gets the value of the enumeration.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The description of the enumeration. |  

## enum CameraFormat  

```cangjie  
public enum CameraFormat <: Equatable<CameraFormat> & ToString {  
    | CAMERA_FORMAT_YCRCB_P010  
    | CAMERA_FORMAT_YCBCR_P010  
    | CAMERA_FORMAT_HEIC  
    | CAMERA_FORMAT_JPEG  
    | CAMERA_FORMAT_YUV_420_SP  
    | CAMERA_FORMAT_RGBA_8888  
    | ...  
}  
```  

**Function:** Output formats.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Types:**  

- Equatable\<CameraFormat>  
- ToString  

### CAMERA_FORMAT_HEIC  

```cangjie  
CAMERA_FORMAT_HEIC  
```

**Function:** Images in HEIF format.

**Initial Version:** 21

### CAMERA_FORMAT_JPEG

```cangjie
CAMERA_FORMAT_JPEG
```

**Function:** Images in JPEG format.

**Initial Version:** 21

### CAMERA_FORMAT_RGBA_8888

```cangjie
CAMERA_FORMAT_RGBA_8888
```

**Function:** Images in RGBA_888 format.

**Initial Version:** 21

### CAMERA_FORMAT_YCBCR_P010

```cangjie
CAMERA_FORMAT_YCBCR_P010
```

**Function:** Images in YCBCR_P010 format.

**Initial Version:** 21

### CAMERA_FORMAT_YCRCB_P010

```cangjie
CAMERA_FORMAT_YCRCB_P010
```

**Function:** Images in YCRCB_P010 format.

**Initial Version:** 21

### CAMERA_FORMAT_YUV_420_SP

```cangjie
CAMERA_FORMAT_YUV_420_SP
```

**Function:** Images in YUV_420_SP format.

**Initial Version:** 21

### func !=(CameraFormat)

```cangjie
public operator func !=(other: CameraFormat): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [CameraFormat](#enum-cameraformat) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(CameraFormat)

```cangjie
public operator func ==(other: CameraFormat): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [CameraFormat](#enum-cameraformat) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum CameraPosition

```cangjie
public enum CameraPosition <: Equatable<CameraPosition> & ToString {
    | CAMERA_POSITION_UNSPECIFIED
    | CAMERA_POSITION_BACK
    | CAMERA_POSITION_FRONT
    | ...
}
```

**Function:** Camera position.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<CameraPosition>
- ToString

### CAMERA_POSITION_BACK

```cangjie
CAMERA_POSITION_BACK
```

**Function:** Rear camera.

**Initial Version:** 21

### CAMERA_POSITION_FRONT

```cangjie
CAMERA_POSITION_FRONT
```

**Function:** Front camera.

**Initial Version:** 21

### CAMERA_POSITION_UNSPECIFIED

```cangjie
CAMERA_POSITION_UNSPECIFIED
```

**Function:** Camera position unspecified.

**Initial Version:** 21

### func !=(CameraPosition)

```cangjie
public operator func !=(other: CameraPosition): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [CameraPosition](#enum-cameraposition) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(CameraPosition)

```cangjie
public operator func ==(other: CameraPosition): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [CameraPosition](#enum-cameraposition) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum CameraStatus

```cangjie
public enum CameraStatus <: Equatable<CameraStatus> & ToString {
    | CAMERA_STATUS_APPEAR
    | CAMERA_STATUS_DISAPPEAR
    | CAMERA_STATUS_AVAILABLE
    | CAMERA_STATUS_UNAVAILABL
    | ...
}
```

**Function:** Camera status.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<CameraStatus>
- ToString

### CAMERA_STATUS_APPEAR

```cangjie
CAMERA_STATUS_APPEAR
```

**Function:** New camera appears.

**Initial Version:** 21

### CAMERA_STATUS_AVAILABLE

```cangjie
CAMERA_STATUS_AVAILABLE
```

**Function:** Camera is available.

**Initial Version:** 21

### CAMERA_STATUS_DISAPPEAR

```cangjie
CAMERA_STATUS_DISAPPEAR
```

**Function:** Camera is removed.

**Initial Version:** 21

### CAMERA_STATUS_UNAVAILABL

```cangjie
CAMERA_STATUS_UNAVAILABL
```

**Function:** Camera is unavailable.**Initial Version:** 21  

### func !=(CameraStatus)  

```cangjie  
public operator func !=(other: CameraStatus): Bool  
```  

**Function:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraStatus](#enum-camerastatus) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |  

### func ==(CameraStatus)  

```cangjie  
public operator func ==(other: CameraStatus): Bool  
```  

**Function:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraStatus](#enum-camerastatus) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Retrieves the value of the enum.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The description of the enum. |  

## enum CameraType  

```cangjie  
public enum CameraType <: Equatable<CameraType> & ToString {  
    | CAMERA_TYPE_DEFAULT  
    | CAMERA_TYPE_WIDE_ANGLE  
    | CAMERA_TYPE_ULTRA_WIDE  
    | CAMERA_TYPE_TELEPHOTO  
    | CAMERA_TYPE_TRUE_DEPTH  
    | ...  
}  
```  

**Function:** Camera type.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Types:**  

- Equatable\<CameraType>  
- ToString  

### CAMERA_TYPE_DEFAULT  

```cangjie  
CAMERA_TYPE_DEFAULT  
```  

**Function:** Camera type is unspecified.  

**Initial Version:** 21  

### CAMERA_TYPE_TELEPHOTO  

```cangjie  
CAMERA_TYPE_TELEPHOTO  
```  

**Function:** Telephoto camera.  

**Initial Version:** 21  

### CAMERA_TYPE_TRUE_DEPTH  

```cangjie  
CAMERA_TYPE_TRUE_DEPTH  
```  

**Function:** Camera with depth information.  

**Initial Version:** 21  

### CAMERA_TYPE_ULTRA_WIDE  

```cangjie  
CAMERA_TYPE_ULTRA_WIDE  
```  

**Function:** Ultra-wide-angle camera.  

**Initial Version:** 21  

### CAMERA_TYPE_WIDE_ANGLE  

```cangjie  
CAMERA_TYPE_WIDE_ANGLE  
```  

**Function:** Wide-angle camera.  

**Initial Version:** 21  

### func !=(CameraType)  

```cangjie  
public operator func !=(other: CameraType): Bool  
```  

**Function:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraType](#enum-cameratype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |  

### func ==(CameraType)  

```cangjie  
public operator func ==(other: CameraType): Bool  
```  

**Function:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [CameraType](#enum-cameratype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Retrieves the value of the enum.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The description of the enum. |  

## enum ConnectionType  

```cangjie  
public enum ConnectionType <: Equatable<ConnectionType> & ToString {  
    | CAMERA_CONNECTION_BUILT_IN  
    | CAMERA_CONNECTION_USB_PLUGIN  
    | CAMERA_CONNECTION_REMOTE  
    | ...  
}  
```  

**Function:** Camera connection type.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parent Types:**  

- Equatable\<ConnectionType>  
- ToString  

### CAMERA_CONNECTION_BUILT_IN  

```cangjie  
CAMERA_CONNECTION_BUILT_IN  
```  

**Function:** Built-in camera.  

**Initial Version:** 21  

### CAMERA_CONNECTION_REMOTE  

```cangjie  
CAMERA_CONNECTION_REMOTE  
```  

**Function:** Remotely connected camera.  

**Initial Version:** 21  

### CAMERA_CONNECTION_USB_PLUGIN  

```cangjie  
CAMERA_CONNECTION_USB_PLUGIN  
```  

**Function:** USB-connected camera.  

**Initial Version:** 21  

### func !=(ConnectionType)  

```cangjie  
public operator func !=(other: ConnectionType): Bool  
```  

**Function:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [ConnectionType](#enum-connectiontype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |  

### func ==(ConnectionType)  

```cangjie  
public operator func ==(other: ConnectionType): Bool  
```  

**Function:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Multimedia.Camera.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| other | [ConnectionType](#enum-connectiontype) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. ||:---|:---|:---|:---|:---|
|other|[ConnectionType](#enum-connectiontype)|Yes|-|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enumeration.|

## enum ExposureMode

```cangjie
public enum ExposureMode <: Equatable<ExposureMode> & ToString {
    | EXPOSURE_MODE_LOCKED
    | EXPOSURE_MODE_AUTO
    | EXPOSURE_MODE_CONTINUOUS_AUTO
    | ...
}
```

**Function:** Exposure mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<ExposureMode>
- ToString

### EXPOSURE_MODE_AUTO

```cangjie
EXPOSURE_MODE_AUTO
```

**Function:** Auto exposure mode. Supports setting the center point of the exposure area, which can be set using [AutoExposure.setMeteringPoint](#func-setmeteringpointpoint).

**Since:** 21

### EXPOSURE_MODE_CONTINUOUS_AUTO

```cangjie
EXPOSURE_MODE_CONTINUOUS_AUTO
```

**Function:** Continuous auto exposure. Does not support setting the center point of the exposure area.

**Since:** 21

### EXPOSURE_MODE_LOCKED

```cangjie
EXPOSURE_MODE_LOCKED
```

**Function:** Locked exposure mode. Does not support setting the center point of the exposure area.

**Since:** 21

### func !=(ExposureMode)

```cangjie
public operator func !=(other: ExposureMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ExposureMode](#enum-exposuremode)|Yes|-|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

### func ==(ExposureMode)

```cangjie
public operator func ==(other: ExposureMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ExposureMode](#enum-exposuremode)|Yes|-|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enumeration.|

## enum FlashMode

```cangjie
public enum FlashMode <: Equatable<FlashMode> & ToString {
    | FLASH_MODE_CLOSE
    | FLASH_MODE_OPEN
    | FLASH_MODE_AUTO
    | FLASH_MODE_ALWAYS_OPEN
    | ...
}
```

**Function:** Flash mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FlashMode>
- ToString

### FLASH_MODE_ALWAYS_OPEN

```cangjie
FLASH_MODE_ALWAYS_OPEN
```

**Function:** Flash always on.

**Since:** 21

### FLASH_MODE_AUTO

```cangjie
FLASH_MODE_AUTO
```

**Function:** Auto flash.

**Since:** 21

### FLASH_MODE_CLOSE

```cangjie
FLASH_MODE_CLOSE
```

**Function:** Flash off.

**Since:** 21

### FLASH_MODE_OPEN

```cangjie
FLASH_MODE_OPEN
```

**Function:** Flash on.

**Since:** 21

### func !=(FlashMode)

```cangjie
public operator func !=(other: FlashMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlashMode](#enum-flashmode)|Yes|-|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are not equal, otherwise returns false.|

### func ==(FlashMode)

```cangjie
public operator func ==(other: FlashMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[FlashMode](#enum-flashmode)|Yes|-|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enumeration values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enumeration.|

## enum FocusMode

```cangjie
public enum FocusMode <: Equatable<FocusMode> & ToString {
    | FOCOS_MODE_MANUAL
    | FOCOS_MODE_CONTINUOUS_AUTO
    | FOCOS_MODE_AUTO
    | FOCUS_MODE_LOCKED
    | ...
}
```

**Function:** Focus mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FocusMode>
- ToString

### FOCOS_MODE_AUTO

```cangjie
FOCOS_MODE_AUTO
public operator func ==(other: FoldStatus): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |

## enum FocusMode

```cangjie
public enum FocusMode <: Equatable<FocusMode> & ToString {
    | FOCUS_MODE_AUTO
    | FOCUS_MODE_CONTINUOUS_AUTO
    | FOCUS_MODE_MANUAL
    | FOCUS_MODE_LOCKED
    | ...
}
```

**Function:** Focus mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<FocusMode>
- ToString

### FOCUS_MODE_AUTO

```cangjie
FOCUS_MODE_AUTO
```

**Function:** Auto-focus. Supports focus point settings. You can use [setFocusPoint](#func-setfocuspointpoint) to set the focus point and perform a single auto-focus based on the focus point.

**Initial Version:** 21

### FOCUS_MODE_CONTINUOUS_AUTO

```cangjie
FOCUS_MODE_CONTINUOUS_AUTO
```

**Function:** Continuous auto-focus. Does not support focus point settings.

**Initial Version:** 21

### FOCUS_MODE_MANUAL

```cangjie
FOCUS_MODE_MANUAL
```

**Function:** Manual focus. Changes the focus position by manually adjusting the camera's focal length. Does not support focus point settings.

**Initial Version:** 21

### FOCUS_MODE_LOCKED

```cangjie
FOCUS_MODE_LOCKED
```

**Function:** Focus lock. Does not support focus point settings.

**Initial Version:** 21

### func !=(FocusMode)

```cangjie
public operator func !=(other: FocusMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FocusMode](#enum-focusmode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(FocusMode)

```cangjie
public operator func ==(other: FocusMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FocusMode](#enum-focusmode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |

## enum FocusState

```cangjie
public enum FocusState <: Equatable<FocusState> & ToString {
    | FOCUS_STATE_SCAN
    | FOCUS_STATE_FOCUSED
    | FOCUS_STATE_UNFOCUSED
    | ...
}
```

**Function:** Focus state.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<FocusState>
- ToString

### FOCUS_STATE_FOCUSED

```cangjie
FOCUS_STATE_FOCUSED
```

**Function:** Focus successful.

**Initial Version:** 21

### FOCUS_STATE_SCAN

```cangjie
FOCUS_STATE_SCAN
```

**Function:** Trigger focus.

**Initial Version:** 21

### FOCUS_STATE_UNFOCUSED

```cangjie
FOCUS_STATE_UNFOCUSED
```

**Function:** Focus not completed.

**Initial Version:** 21

### func !=(FocusState)

```cangjie
public operator func !=(other: FocusState): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FocusState](#enum-focusstate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(FocusState)

```cangjie
public operator func ==(other: FocusState): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FocusState](#enum-focusstate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |

## enum FoldStatus

```cangjie
public enum FoldStatus <: Equatable<FoldStatus> & ToString {
    | NON_FOLDABLE
    | EXPANDED
    | FOLDED
    | ...
}
```

**Function:** Foldable device fold status.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<FoldStatus>
- ToString

### EXPANDED

```cangjie
EXPANDED
```

**Function:** Indicates that the current device is fully unfolded.

**Initial Version:** 21

### FOLDED

```cangjie
FOLDED
```

**Function:** Indicates that the current device is folded.

**Initial Version:** 21

### NON_FOLDABLE

```cangjie
NON_FOLDABLE
```

**Function:** Indicates that the current device is non-foldable.

**Initial Version:** 21

### func !=(FoldStatus)

```cangjie
public operator func !=(other: FoldStatus): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal, otherwise returns `false`. |

### func ==(FoldStatus)

```cangjie
public operator func ==(other: FoldStatus): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |
public operator func ==(other: FoldStatus): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum ImageRotation

```cangjie
public enum ImageRotation <: Equatable<ImageRotation> & ToString {
    | ROTATION_0
    | ROTATION_90
    | ROTATION_180
    | ROTATION_270
    | ...
}
```

**Function:** Image rotation angle.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<ImageRotation>
- ToString

### ROTATION_0

```cangjie
ROTATION_0
```

**Function:** Rotates the image by 0 degrees.

**Initial Version:** 21

### ROTATION_180

```cangjie
ROTATION_180
```

**Function:** Rotates the image by 180 degrees.

**Initial Version:** 21

### ROTATION_270

```cangjie
ROTATION_270
```

**Function:** Rotates the image by 270 degrees.

**Initial Version:** 21

### ROTATION_90

```cangjie
ROTATION_90
```

**Function:** Rotates the image by 90 degrees.

**Initial Version:** 21

### func !=(ImageRotation)

```cangjie
public operator func !=(other: ImageRotation): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ImageRotation](#enum-imagerotation) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(ImageRotation)

```cangjie
public operator func ==(other: ImageRotation): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ImageRotation](#enum-imagerotation) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum MetadataObjectType

```cangjie
public enum MetadataObjectType <: Equatable<MetadataObjectType> & ToString {
    | FACE_DETECTION
    | ...
}
```

**Function:** Metadata stream.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<MetadataObjectType>
- ToString

### FACE_DETECTION

```cangjie
FACE_DETECTION
```

**Function:** Metadata object type for face detection. Detection points should be within the 0-1 coordinate system, where the top-left corner is (0.0, 0.0) and the bottom-right corner is (1.0, 1.0). This coordinate system is based on the horizontal device orientation when the charging port is on the right side. For example, if the application's preview interface layout is based on the vertical orientation when the charging port is at the bottom, with layout dimensions (w, h), and the returned point is (x, y), the converted coordinate point would be (1.0 - y, x).

**Initial Version:** 21

### func !=(MetadataObjectType)

```cangjie
public operator func !=(other: MetadataObjectType): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [MetadataObjectType](#enum-metadataobjecttype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(MetadataObjectType)

```cangjie
public operator func ==(other: MetadataObjectType): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [MetadataObjectType](#enum-metadataobjecttype) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum PreconfigRatio

```cangjie
public enum PreconfigRatio <: Equatable<PreconfigRatio> & ToString {
    | PRECONFIG_RATIO_1_1
    | PRECONFIG_RATIO_4_3
    | PRECONFIG_RATIO_16_9
    | ...
}
```

**Function:** Provides preconfigured resolution ratios.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<PreconfigRatio>
- ToString

### PRECONFIG_RATIO_16_9

```cangjie
PRECONFIG_RATIO_16_9
```

**Function:** 16:9 aspect ratio.

**Initial Version:** 21

### PRECONFIG_RATIO_1_1

```cangjie
PRECONFIG_RATIO_1_1
```

**Function:** 1:1 Aspect Ratio.

**Initial Version:** 21

### PRECONFIG_RATIO_4_3

```cangjie
PRECONFIG_RATIO_4_3
```

**Function:** 4:3 Aspect Ratio.

**Initial Version:** 21

### func !=(PreconfigRatio)

```cangjie
public operator func !=(other: PreconfigRatio): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PreconfigRatio](#enum-preconfigratio) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(PreconfigRatio)

```cangjie
public operator func ==(other: PreconfigRatio): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PreconfigRatio](#enum-preconfigratio) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum PreconfigType

```cangjie
public enum PreconfigType <: Equatable<PreconfigType> & ToString {
    | PRECONFIG_720P
    | PRECONFIG_1080P
    | PRECONFIG_4K
    | PRECONFIG_HIGH_QUALITY
    | ...
}
```

**Function:** Provides preconfigured types.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<PreconfigType>
- ToString

### PRECONFIG_1080P

```cangjie
PRECONFIG_1080P
```

**Function:** 1080P preconfiguration.

**Initial Version:** 21

### PRECONFIG_4K

```cangjie
PRECONFIG_4K
```

**Function:** 4K preconfiguration.

**Initial Version:** 21

### PRECONFIG_720P

```cangjie
PRECONFIG_720P
```

**Function:** 720P preconfiguration.

**Initial Version:** 21

### PRECONFIG_HIGH_QUALITY

```cangjie
PRECONFIG_HIGH_QUALITY
```

**Function:** High-quality preconfiguration.

**Initial Version:** 21

### func !=(PreconfigType)

```cangjie
public operator func !=(other: PreconfigType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PreconfigType](#enum-preconfigtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(PreconfigType)

```cangjie
public operator func ==(other: PreconfigType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PreconfigType](#enum-preconfigtype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum QualityLevel

```cangjie
public enum QualityLevel <: Equatable<QualityLevel> & ToString {
    | QUALITY_LEVEL_HIGH
    | QUALITY_LEVEL_MEDIUM
    | QUALITY_LEVEL_LOW
    | ...
}
```

**Function:** Image quality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parent Types:**

- Equatable\<QualityLevel>
- ToString

### QUALITY_LEVEL_HIGH

```cangjie
QUALITY_LEVEL_HIGH
```

**Function:** High image quality.

**Initial Version:** 21

### QUALITY_LEVEL_LOW

```cangjie
QUALITY_LEVEL_LOW
```

**Function:** Low image quality.

**Initial Version:** 21

### QUALITY_LEVEL_MEDIUM

```cangjie
QUALITY_LEVEL_MEDIUM
```

**Function:** Medium image quality.

**Initial Version:** 21

### func !=(QualityLevel)

```cangjie
public operator func !=(other: QualityLevel): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [QualityLevel](#enum-qualitylevel) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(QualityLevel)

```cangjie
public operator func ==(other: QualityLevel): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [QualityLevel](#enum-qualitylevel) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum SceneMode

```cangjie
public enum SceneMode <: Equatable<SceneMode> & ToString {
    | NORMAL_PHOTO
    | NORMAL_VIDEO
    | SECURE_PHOTO
    | ...
}
```

**Function:** Camera-supported modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<SceneMode>
- ToString

### NORMAL_PHOTO

```cangjie
NORMAL_PHOTO
```

**Function:** Normal photo mode. For details, see [PhotoSession](#class-photosession).

**Since:** 21

### NORMAL_VIDEO

```cangjie
NORMAL_VIDEO
```

**Function:** Normal video mode. For details, see [VideoSession](#class-videosession).

**Since:** 21

### SECURE_PHOTO

```cangjie
SECURE_PHOTO
```

**Function:** Secure camera mode. For details, see [SecureSession](#class-securesession).

**Since:** 21

### func !=(SceneMode)

```cangjie
public operator func !=(other: SceneMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SceneMode](#enum-scenemode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(SceneMode)

```cangjie
public operator func ==(other: SceneMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SceneMode](#enum-scenemode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum SmoothZoomMode

```cangjie
public enum SmoothZoomMode <: Equatable<SmoothZoomMode> & ToString {
    | NORMAL
    | ...
}
```

**Function:** Smooth zoom modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<SmoothZoomMode>
- ToString

### NORMAL

```cangjie
NORMAL
```

**Function:** Bezier curve mode.

**Since:** 21

### func !=(SmoothZoomMode)

```cangjie
public operator func !=(other: SmoothZoomMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SmoothZoomMode](#enum-smoothzoommode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(SmoothZoomMode)

```cangjie
public operator func ==(other: SmoothZoomMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [SmoothZoomMode](#enum-smoothzoommode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum TorchMode

```cangjie
public enum TorchMode <: Equatable<TorchMode> & ToString {
    | OFF
    | ON
    | AUTO
    | ...
}
```

**Function:** Torch modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<TorchMode>
- ToString

### AUTO

```cangjie
AUTO
```

**Function:** Auto mode.

**Since:** 21

### OFF

```cangjie
OFF
```

**Function:** Always-off mode.

**Since:** 21

### ON

```cangjie
ON
```

**Function:** Always-on mode.

**Since:** 21

### func !=(TorchMode)

```cangjie
public operator func !=(other: TorchMode): Bool
```
**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TorchMode](#enum-torchmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(TorchMode)

```cangjie
public operator func ==(other: TorchMode): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [TorchMode](#enum-torchmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum VideoCodecType

```cangjie
public enum VideoCodecType <: Equatable<VideoCodecType> & ToString {
    | AVC
    | HEVC
    | ...
}
```

**Function:** Video encoding type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<VideoCodecType>
- ToString

### AVC

```cangjie
AVC
```

**Function:** Video encoding type AVC.

**Since:** 21

### HEVC

```cangjie
HEVC
```

**Function:** Video encoding type HEVC.

**Since:** 21

### func !=(VideoCodecType)

```cangjie
public operator func !=(other: VideoCodecType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [VideoCodecType](#enum-videocodectype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(VideoCodecType)

```cangjie
public operator func ==(other: VideoCodecType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [VideoCodecType](#enum-videocodectype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum VideoStabilizationMode

```cangjie
public enum VideoStabilizationMode <: Equatable<VideoStabilizationMode> & ToString {
    | OFF
    | LOW
    | MIDDLE
    | HIGH
    | AUTO
    | ...
}
```

**Function:** Video stabilization mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<VideoStabilizationMode>
- ToString

### AUTO

```cangjie
AUTO
```

**Function:** Automatically selects the stabilization mode.

**Since:** 21

### HIGH

```cangjie
HIGH
```

**Function:** Uses the stabilization algorithm with the best effect, superior to the `MIDDLE` type.

**Since:** 21

### LOW

```cangjie
LOW
```

**Function:** Disables video stabilization.

**Since:** 21

### MIDDLE

```cangjie
MIDDLE
```

**Function:** Uses a stabilization algorithm with moderate effect, superior to the `LOW` type.

**Since:** 21

### OFF

```cangjie
OFF
```

**Function:** Disables video stabilization.

**Since:** 21

### func !=(VideoStabilizationMode)

```cangjie
public operator func !=(other: VideoStabilizationMode): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [VideoStabilizationMode](#enum-videostabilizationmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(VideoStabilizationMode)

```cangjie
public operator func ==(other: VideoStabilizationMode): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [VideoStabilizationMode](#enum-videostabilizationmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |**Starting Version:** 21  

**Return Value:**  

| Type   | Description               |  
|:-------|:--------------------------|  
| String | Description of the enumeration. |