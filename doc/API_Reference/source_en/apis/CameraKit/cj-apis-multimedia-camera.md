# ohos.multimedia.camera (Camera Management)

This module provides developers with a set of simple and easy-to-understand camera service interfaces, enabling them to develop camera applications. By accessing and operating camera hardware, applications can perform basic operations such as preview, photo capture, and video recording. Additionally, more advanced operations can be achieved through interface combinations, such as controlling flash, exposure time, focus or zoom adjustments.

## Import Module

```cangjie
import kit.CameraKit.*
```

## Permission List

ohos.permission.CAMERA

ohos.permission.MICROPHONE

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func getCameraManager(UIAbilityContext)

```cangjie
public func getCameraManager(context: UIAbilityContext): CameraManager
```

**Description:** Obtains a camera manager instance.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [CameraManager](#class-cameramanager) | Camera manager. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
```

## interface AutoExposure

```cangjie
public interface AutoExposure <: AutoExposureQuery {
    func getExposureMode(): ExposureMode
    func setExposureMode(aeMode: ExposureMode): Unit
    func getMeteringPoint(): Point
    func setMeteringPoint(point: Point): Unit
    func setExposureBias(exposureBias: Float64): Unit
    func getExposureValue(): Float64
}
```

**Description:** Device auto exposure (AE) operations.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [AutoExposureQuery](#interface-autoexposurequery)

### func getExposureMode()

```cangjie
func getExposureMode(): ExposureMode
```

**Description:** Obtains the current exposure mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ExposureMode](#enum-exposuremode) | Current exposure mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end
import kit.PerformanceAnalysisKit.Hilog

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let photoSession = session as PhotoSession
Hilog.info(0, "AppLogCj", photoSession.getOrThrow().getExposureMode())
```

### func getExposureValue()

```cangjie
func getExposureValue(): Float64
```

**Description:** Queries the current exposure value.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | Exposure value. Exposure compensation has a step size. For example, if the step size is 0.5, setting 1.2 will result in an actual effective exposure compensation of 1.0. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let photoSession = session as PhotoSession
Hilog.info(0, "AppLogCj", photoSession.getOrThrow().getExposureValue())
```

### func getMeteringPoint()

```cangjie
func getMeteringPoint(): Point
```

**Description:** Queries the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Point](#class-point) | Current exposure point. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let photoSession = session as PhotoSession
let point = photoSession.getOrThrow().getMeteringPoint()
```

### func setExposureBias(Float64)

```cangjie
func setExposureBias(exposureBias: Float64): Unit
```

**Description:** Sets the exposure compensation value (EV).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| exposureBias | Float64 | Yes | - | Exposure compensation. Use [getExposureBiasRange](#func-getexposurebiasrange) to query the supported range. If the set value exceeds the supported range, it will automatically match to the nearest boundary point. Exposure compensation has a step size. For example, if the step size is 0.5, setting 1.2 will result in an actual effective exposure compensation of 1.0. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let exposureBias: Float32 = 1.2
photoSession.setExposureBias(exposureBias)
```

### func setExposureMode(ExposureMode)

```cangjie
func setExposureMode(aeMode: ExposureMode): Unit
```

**Description:** Sets the exposure mode. Before setting, check whether the device supports the specified exposure mode using the method [isExposureModeSupported](#func-isexposuremodesupportedexposuremode).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| aeMode | [ExposureMode](#enum-exposuremode) | Yes | - | Exposure mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let aeMode = ExposureMode.ExposureModeAuto
photoSession.setExposureMode(aeMode)
```

### func setMeteringPoint(Point)

```cangjie
func setMeteringPoint(point: Point): Unit
```

**Description:** Queries the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| point | [Point](#class-point) | Yes | - | Current exposure point. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let point = Point(1.0, 1.0)
photoSession.setMeteringPoint(point)
```

## interface AutoExposureQuery

```cangjie
public interface AutoExposureQuery {
    func isExposureModeSupported(aeMode: ExposureMode): Bool
    func getExposureBiasRange(): Array<Float64>
}
```

**Description:** Provides device auto exposure feature query functionality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func getExposureBiasRange()

```cangjie
func getExposureBiasRange(): Array<Float64>
```

**Description:** Queries the exposure compensation range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Float64> | Array of compensation range. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let range = photoSession.getExposureBiasRange()
```

### func isExposureModeSupported(ExposureMode)

```cangjie
func isExposureModeSupported(aeMode: ExposureMode): Bool
```

**Description:** Checks whether the exposure mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| aeMode | [ExposureMode](#enum-exposuremode) | Yes | - | Exposure mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the exposure mode is supported. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See Usage Instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let aeMode = ExposureMode.ExposureModeAuto
Hilog.info(0, "AppLogCj", photoSession.isExposureModeSupported(aeMode))
``````markdown
## interface CameraOutput

```cangjie
public interface CameraOutput {
    func release(): Unit
}
```

**Description:** Base class for output information used by Session in a session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func release()

```cangjie
func release(): Unit
```

**Description:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
previewOutput.release()
```

## interface ColorManagement

```cangjie
public interface ColorManagement <: ColorManagementQuery {
    func setColorSpace(colorSpace: ColorSpace): Unit
    func getActiveColorSpace(): ColorSpace
}
```

**Description:** Manages color space parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [ColorManagementQuery](#interface-colormanagementquery)

### func getActiveColorSpace()

```cangjie
func getActiveColorSpace(): ColorSpace
```

**Description:** Gets the currently set color space.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace) | Currently set color space. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let colorSpace = photoSession.getActiveColorSpace()
```

### func setColorSpace(ColorSpace)

```cangjie
func setColorSpace(colorSpace: ColorSpace): Unit
```

**Description:** Sets the color space. You can first obtain the supported ColorSpaces for the current device via [getSupportedColorSpaces](#func-getsupportedcolorspaces).

Applications can configure different color space parameters ([ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)) to support P3 wide color gamut and HDR high dynamic range imaging.

When no color space is explicitly set by the application, the default for photo and video modes is HDR imaging effect.

In photo mode, setting the HDR display effect directly supports the P3 color gamut.

Refer to the following tables for enabling HDR effects and setting color spaces in different modes.

Table 1: Video Mode

| SDR/HDR Shooting | CameraFormat | ColorSpace |
| :--- | :--- | :--- |
| SDR | CAMERA_FORMAT_YUV_420_SP | BT709_LIMIT |
| HDR_VIVID (Default) | CAMERA_FORMAT_YCRCB_P010 | BT2020_HLG_LIMIT |

Table 2: Photo Mode

| SDR/HDR Shooting | ColorSpace |
| :--- | :--- |
| SDR | Srgb |
| HDR_VIVID (Default) | DisplayP3 |

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| colorSpace | [ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace) | Yes | - | Color space, obtained via [getSupportedColorSpaces](#func-getsupportedcolorspaces). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | The colorSpace does not match the format. |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let colorSpace = photoSession.getSupportedColorSpaces()[0]
photoSession.setColorSpace(colorSpace)
```

## interface ColorManagementQuery

```cangjie
public interface ColorManagementQuery {
    func getSupportedColorSpaces(): Array<ColorSpace>
}
```

**Description:** Queries color space parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func getSupportedColorSpaces()

```cangjie
func getSupportedColorSpaces(): Array<ColorSpace>
```

**Description:** Gets the list of supported color spaces.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)> | List of supported color spaces. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let colorSpaces = photoSession.getSupportedColorSpaces()
```

## interface Flash

```cangjie
public interface Flash <: FlashQuery {
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

**Description:** Gets the current flash mode of the device.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [FlashMode](#enum-flashmode) | Current flash mode of the device. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let flashMode = photoSession.getFlashMode()
```

### func setFlashMode(FlashMode)

```cangjie
func setFlashMode(flashMode: FlashMode): Unit
```

**Description:** Sets the flash mode.

Before setting, check:

1. Whether the device supports flash, using [hasFlash](#func-hasflash).
2. Whether the device supports the specified flash mode, using [isFlashModeSupported](#func-isflashmodesupportedflashmode).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| flashMode | [FlashMode](#enum-flashmode) | Yes | - | Specified flash mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let flashMode = FlashMode.FlashModeAlwaysOpen
photoSession.setFlashMode(flashMode)
```

## interface FlashQuery

```cangjie
public interface FlashQuery {
    func hasFlash(): Bool
    func isFlashModeSupported(flashMode: FlashMode): Bool
}
```

**Description:** Provides capabilities to query device flash status and modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func hasFlash()

```cangjie
func hasFlash(): Bool
```

**Description:** Checks whether flash is available.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if the device supports flash, false otherwise. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
Hilog.info(0, "AppLogCj", photoSession.hasFlash())
```

### func isFlashModeSupported(FlashMode)

```cangjie
func isFlashModeSupported(flashMode: FlashMode): Bool
```

**Description:** Checks whether the specified flash mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| flashMode | [FlashMode](#enum-flashmode) | Yes | - | Specified flash mode. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if the flash mode is supported, false otherwise. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
photoSession.isFlashModeSupported(FlashMode.FlashModeAlwaysOpen)
```## interface Focus

```cangjie
public interface Focus <: FocusQuery {
    func setFocusMode(afMode: FocusMode): Unit
    func getFocusMode(): FocusMode
    func setFocusPoint(point: Point): Unit
    func getFocusPoint(): Point
    func getFocalLength(): Float64
}
```

**Functionality:** Device focus operations.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [FocusQuery](#interface-focusquery)

### func getFocalLength()

```cangjie
func getFocalLength(): Float64
```

**Functionality:** Queries the focal length value.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Float64|Used to obtain the current focal length, in millimeters (mm).|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
Hilog.info(0, "AppLogCj", photoSession.getFocalLength())
```

### func getFocusMode()

```cangjie
func getFocusMode(): FocusMode
```

**Functionality:** Retrieves the current focus mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[FocusMode](#enum-focusmode)|The current device's focus mode.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
Hilog.info(0, "AppLogCj", photoSession.getFocusMode())
```

### func getFocusPoint()

```cangjie
func getFocusPoint(): Point
```

**Functionality:** Queries the focus point.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[Point](#class-point)|The current focus point.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let point = photoSession.getFocusPoint()
```

### func setFocusMode(FocusMode)

```cangjie
func setFocusMode(afMode: FocusMode): Unit
```

**Functionality:** Sets the focus mode.

Before setting, check whether the device supports the specified focus mode using the method [isFocusModeSupported](#func-isfocusmodesupportedfocusmode).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|afMode|[FocusMode](#enum-focusmode)|Yes|-|The specified focus mode.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let afMode = FocusMode.FocusModeManual
photoSession.setFocusMode(afMode)
```

### func setFocusPoint(Point)

```cangjie
func setFocusPoint(point: Point): Unit
```

**Functionality:** Sets the focus point. The focus point should be within the 0-1 coordinate system, where the top-left corner is {0.0, 0.0} and the bottom-right corner is {1.0, 1.0}.

This coordinate system is based on the horizontal device orientation with the charging port on the right. For example, if the application's preview interface layout is based on the vertical orientation with the charging port at the bottom, and the layout dimensions are {w, h} with a touch point at {x, y}, the converted coordinate point is {y/h, 1-x/w}.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|point|[Point](#class-point)|Yes|-|Focus point. The x and y values should be within [0.0, 1.0]. Values outside this range will be clamped to 0.0 if less than 0.0 or 1.0 if greater than 1.0.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
photoSession.setFocusPoint(Point(0.5, 0.5))
```

## interface FocusQuery

```cangjie
public interface FocusQuery {
    func isFocusModeSupported(afMode: FocusMode): Bool
}
```

**Functionality:** Provides methods to check whether a specified focus mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func isFocusModeSupported(FocusMode)

```cangjie
func isFocusModeSupported(afMode: FocusMode): Bool
```

**Functionality:** Checks whether a focus mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|afMode|[FocusMode](#enum-focusmode)|Yes|-|The specified focus mode.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the focus mode is supported, false otherwise.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let afMode = FocusMode.FocusModeManual
Hilog.info(0, "AppLogCj", photoSession.isFocusModeSupported(afMode))
```

## interface Session

```cangjie
public interface Session {
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

**Functionality:** Session type that holds all resources required for a camera operation ([CameraInput](#class-camerainput), [CameraOutput](#interface-cameraoutput)) and requests camera functionality (recording, photography) from the camera device.

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

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|Yes|-|The CameraInput instance to be added.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
session.addInput(cameraInput)
```### func addOutput(CameraOutput)

```cangjie
func addOutput(cameraOutput: CameraOutput): Unit
```

**Function:** Adds a [CameraOutput](#interface-cameraoutput) to the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|Yes|-|The CameraOutput instance to be added.|

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let cameraOutput = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
session.addOutput(cameraOutput)
```

### func beginConfig()

```cangjie
func beginConfig(): Unit
```

**Function:** Starts session configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400105 | Session config locked. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
session.beginConfig()
```

### func canAddInput(CameraInput)

```cangjie
func canAddInput(cameraInput: CameraInput): Bool
```

**Function:** Checks whether the current cameraInput can be added to the session.

This method takes effect only when called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|Yes|-|The CameraInput instance to be added.|

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|Returns true if the current cameraInput can be added; otherwise, returns false.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
Hilog.info(0, "AppLogCj", session.canAddInput(cameraInput))
```

### func canAddOutput(CameraOutput)

```cangjie
func canAddOutput(cameraOutput: CameraOutput): Bool
```

**Function:** Checks whether the current cameraOutput can be added to the session.

This method takes effect only when called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|Yes|-|The CameraOutput instance to be added.|

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|Returns true if the current cameraOutput can be added; otherwise, returns false.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let cameraOutput = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
Hilog.info(0, "AppLogCj", session.canAddOutput(cameraOutput))
```

### func commitConfig()

```cangjie
func commitConfig(): Unit
```

**Function:** Commits the configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
session.commitConfig()
```

### func release()

```cangjie
func release(): Unit
```

**Function:** Releases session resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
session.release()
```

### func removeInput(CameraInput)

```cangjie
func removeInput(cameraInput: CameraInput): Unit
```

**Function:** Removes the specified CameraInput from the session.

This method takes effect only when called between [beginConfig](#func-beginconfig) and [commitConfig](#func-commitconfig).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|Yes|-|The CameraInput instance to be removed.|

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
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

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|Yes|-|The CameraOutput instance to be removed.|

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[0]
let ability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
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

**Initial Version:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
session.start()
```

### func stop()

```cangjie
func stop(): Unit
```

**Function:** Stops the session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
session.stop()
```## interface Stabilization

```cangjie
public interface Stabilization <: StabilizationQuery {
    func getActiveVideoStabilizationMode(): VideoStabilizationMode
    func setVideoStabilizationMode(mode: VideoStabilizationMode): Unit
}
```

**Functionality:** Provides operations related to video stabilization in device recording mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [StabilizationQuery](#interface-stabilizationquery)

### func getActiveVideoStabilizationMode()

```cangjie
func getActiveVideoStabilizationMode(): VideoStabilizationMode
```

**Functionality:** Queries the currently active video stabilization mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[VideoStabilizationMode](#enum-videostabilizationmode)|Indicates whether video stabilization is currently active.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalVideo)
var videoSessionOption = session as VideoSession
let videoSession = videoSessionOption.getOrThrow()
Hilog.info(0, "AppLogCj", videoSession.getActiveVideoStabilizationMode())
```

### func setVideoStabilizationMode(VideoStabilizationMode)

```cangjie
func setVideoStabilizationMode(mode: VideoStabilizationMode): Unit
```

**Functionality:** Sets the video stabilization mode. First check whether the device supports the specified stabilization mode using the [isVideoStabilizationModeSupported](#func-isvideostabilizationmodesupportedvideostabilizationmode) method.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|mode|[VideoStabilizationMode](#enum-videostabilizationmode)|Yes|-|The video stabilization mode to set.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalVideo)
var videoSessionOption = session as VideoSession
let videoSession = videoSessionOption.getOrThrow()
let vsMode = VideoStabilizationMode.Off
videoSession.setVideoStabilizationMode(vsMode)
```

## interface StabilizationQuery

```cangjie
public interface StabilizationQuery {
    func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool
}
```

**Functionality:** Provides the capability to query whether the device supports the specified video stabilization mode in recording mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func isVideoStabilizationModeSupported(VideoStabilizationMode)

```cangjie
func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool
```

**Functionality:** Queries whether the specified video stabilization mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|vsMode|[VideoStabilizationMode](#enum-videostabilizationmode)|Yes|-|The video stabilization mode.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns whether the video stabilization mode is supported: true for supported, false for unsupported.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalVideo)
var videoSessionOption = session as VideoSession
let videoSession = videoSessionOption.getOrThrow()
let vsMode = VideoStabilizationMode.Off
videoSession.isVideoStabilizationModeSupported(vsMode)
```

## interface Zoom

```cangjie
public interface Zoom <: ZoomQuery {
    func setZoomRatio(zoomRatio: Float64): Unit
    func getZoomRatio(): Float64
    func setSmoothZoom(targetRatio: Float32, mode: SmoothZoomMode): Unit
    func setSmoothZoom(targetRatio: Float32): Unit
}
```

**Functionality:** Device zoom (scaling) operations.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [ZoomQuery](#interface-zoomquery)

### func getZoomRatio()

```cangjie
func getZoomRatio(): Float64
```

**Functionality:** Gets the current zoom ratio.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Float64|The current zoom ratio result.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
Hilog.info(0, "AppLogCj", photoSession.getZoomRatio())
```

### func setSmoothZoom(Float32, SmoothZoomMode)

```cangjie
func setSmoothZoom(targetRatio: Float32, mode: SmoothZoomMode): Unit
```

**Functionality:** Triggers smooth zoom.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|targetRatio|Float32|Yes|-|Target value.|
|mode|[SmoothZoomMode](#enum-smoothzoommode)|Yes|-|Mode.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let targetRatio: Float32 = 0.3
photoSession.setSmoothZoom(targetRatio, SmoothZoomMode.Normal)
```

### func setSmoothZoom(Float32)

```cangjie
func setSmoothZoom(targetRatio: Float32): Unit
```

**Functionality:** Triggers smooth zoom.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|targetRatio|Float32|Yes|-|Target value.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let targetRatio: Float32 = 0.3
photoSession.setSmoothZoom(targetRatio)
```

### func setZoomRatio(Float64)

```cangjie
func setZoomRatio(zoomRatio: Float64): Unit
```

**Functionality:** Sets the zoom ratio. The maximum precision for zoom is two decimal places. If the set value exceeds the supported precision range, only the value within the precision range will be retained.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|zoomRatio|Float64|Yes|-|The zoom ratio. Use [getZoomRatioRange](#func-getzoomratiorange) to obtain the supported zoom range. If the set value exceeds the supported range, only the value within the precision range will be retained. It takes some time for the zoom ratio to take effect at the underlying layer. To obtain the correctly set zoom ratio, wait for 1-2 frames.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let zoomRatio: Float32 = 0.5
photoSession.setZoomRatio(zoomRatio)
```

## interface ZoomQuery

```cangjie
public interface ZoomQuery {
    func getZoomRatioRange(): Array<Float64>
}
```

**Functionality:** Provides query capabilities related to device zoom, including obtaining the supported zoom ratio range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func getZoomRatioRange()

```cangjie
func getZoomRatioRange(): Array<Float64>
```

**Functionality:** Gets the supported zoom range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Float64>|Used to obtain the zoom ratio range. The returned array includes the minimum and maximum values.|

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400103 | Session not config, only throw in session usage. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NormalPhoto)
var photoSessionOption = session as PhotoSession
let photoSession = photoSessionOption.getOrThrow()
let zoomRatio: Float32 = 0.5
Hilog.info(0, "AppLogCj", photoSession.getZoomRatioRange())
```## class CameraDevice

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

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraOrientation

```cangjie
public let cameraOrientation: UInt32
```

**Description:** The installation angle of the lens, which does not change with screen rotation. Value range: 0-360.

**Type:** UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraPosition

```cangjie
public let cameraPosition: CameraPosition
```

**Description:** Camera position.

**Type:** [CameraPosition](#enum-cameraposition)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let cameraType

```cangjie
public let cameraType: CameraType
```

**Description:** Camera type.

**Type:** [CameraType](#enum-cameratype)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let connectionType

```cangjie
public let connectionType: ConnectionType
```

**Description:** Camera connection type.

**Type:** [ConnectionType](#enum-connectiontype)

**Access:** Read-only

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

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.close()
```

### func off(CameraEvents, CameraDevice, Callback0Argument)

```cangjie
public func off(event: CameraEvents, camera: CameraDevice, callback: Callback0Argument): Unit
```

**Description:** Unregisters the specified callback for the specified event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Event to unregister. |
| camera | [CameraDevice](#class-cameradevice) | Yes | - | CameraDevice object. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.off(CameraEvents.CameraError, cameraDevice)
```

### func off(CameraEvents, CameraDevice)

```cangjie
public func off(event: CameraEvents, camera: CameraDevice): Unit
```

**Description:** Unregisters all callbacks for the specified event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Event to unregister. |
| camera | [CameraDevice](#class-cameradevice) | Yes | - | CameraDevice object. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.off(CameraEvents.CameraError, cameraDevice)
```

### func on(CameraEvents, CameraDevice, Callback0Argument)

```cangjie
public func on(event: CameraEvents, camera: CameraDevice, callback: Callback0Argument): Unit
```

**Description:** Listens for CameraInput error events and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Event to listen for. Must be CameraError. Can be listened to after the CameraInput object is successfully created. This event is triggered when the camera device encounters an error (e.g., device unavailable or conflict) and returns corresponding error information. |
| camera | [CameraDevice](#class-cameradevice) | Yes | - | CameraDevice object. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function for obtaining results. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
let testCallbackError = TestCallbackError()
return cameraInput.on(CameraEvents.CameraError, cameraDevice, testCallbackError)
```

### func open()

```cangjie
public func open(): Unit
```

**Description:** Opens the camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400107 | Can not use camera cause of conflict. |
  | 7400108 | Camera disabled cause of security reason. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.open()
```

### func open(Bool)

```cangjie
public func open(isSecureEnabled: Bool): UInt64
```

**Description:** Opens the camera and obtains the handle for a secure camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isSecureEnabled | Bool | Yes | - | Whether to open the camera in secure mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt64 | Handle of the opened camera. |

**Exceptions:**

- BusinessException: Error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400107 | Can not use camera cause of conflict. |
  | 7400108 | Camera disabled cause of security reason. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
let isSecureEnabled = false
let handle = cameraInput.open(isSecureEnabled)
```## class CameraManager

```cangjie
public class CameraManager {}
```

**Description:** Camera manager class. Must obtain a camera manager instance via [getCameraManager](#func-getcameramanageruiabilitycontext) before use.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func createCameraInput(CameraDevice)

```cangjie
public func createCameraInput(camera: CameraDevice): CameraInput
```

**Description:** Creates a CameraInput instance based on camera position and type.

**Required Permission:** ohos.permission.CAMERA

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|camera|[CameraDevice](#class-cameradevice)|Yes|-|CameraDevice object obtained via [getSupportedCameras](#func-getsupportedcameras) interface.|

**Return Value:**

| Type | Description |
|:----|:----|
|[CameraInput](#class-camerainput)|CameraInput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraDevice0 = cameraDevices[0]
let position = cameraDevice0.cameraPosition
let `type` = cameraDevice0.cameraType
let cameraInput = cameraManager.createCameraInput(position , `type`)
```

### func createCameraInput(CameraPosition, CameraType)

```cangjie
public func createCameraInput(position: CameraPosition, cameraType: CameraType): CameraInput
```

**Description:** Creates a CameraInput instance based on camera position and type.

**Required Permission:** ohos.permission.CAMERA

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|position|[CameraPosition](#enum-cameraposition)|Yes|-|Camera position obtained by getting device info via [getSupportedCameras](#func-getsupportedcameras).|
|cameraType|[CameraType](#enum-cameratype)|Yes|-|Camera type obtained by getting device info via [getSupportedCameras](#func-getsupportedcameras).|

**Return Value:**

| Type | Description |
|:----|:----|
|[CameraInput](#class-camerainput)|CameraInput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraDevice0 = cameraDevices[0]
let position = cameraDevice0.cameraPosition
let `type` = cameraDevice0.cameraType
let cameraInput = cameraManager.createCameraInput(position , `type`)
```

### func createPhotoOutput(profile:?Profile)

```cangjie
public func createPhotoOutput(profile:profile!: ?Profile = None): PhotoOutput
```

**Description:** Creates a photo output object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|profile|?[Profile](#class-profile)|No|None|Supported photo configuration obtained via [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface.|

**Return Value:**

| Type | Description |
|:----|:----|
|[PhotoOutput](#class-photooutput)|PhotoOutput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)[0]
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(camera, mode)
let profile = cameraOutputCapability.photoProfiles[0]
let photoOutput  = cameraManager.createPhotoOutput(profile:profile)
```

### func createPreviewOutput(Profile, String)

```cangjie
public func createPreviewOutput(profile: Profile, surfaceId: String): PreviewOutput
```

**Description:** Creates a preview output object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|profile|[Profile](#class-profile)|Yes|-|Supported preview configuration obtained via [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface.|
|surfaceId|String|Yes|-|surfaceId obtained from XComponent or [ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver) component.|

**Return Value:**

| Type | Description |
|:----|:----|
|[PreviewOutput](#class-previewoutput)|PreviewOutput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(surfaceId)
```

### func createPreviewOutput(String)

```cangjie
public func createPreviewOutput(surfaceId: String): PreviewOutput
```

**Description:** Creates a preview output object without configuration. Must be used with [preconfig](#func-preconfigpreconfigtype-preconfigratio).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|surfaceId|String|Yes|-|surfaceId obtained from XComponent or [ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver) component.|

**Return Value:**

| Type | Description |
|:----|:----|
|[PreviewOutput](#class-previewoutput)|PreviewOutput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(surfaceId)
```

### func createSession(SceneMode)

```cangjie
public func createSession(mode: SceneMode): Session
```

**Description:** Creates a Session instance with specified SceneMode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|mode|[SceneMode](#enum-scenemode)|Yes|-|Camera supported mode.|

**Return Value:**

| Type | Description |
|:----|:----|
|[Session](#interface-session)|Session instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter error. Possible causes:1. Mandatory parameters are left unspecified; 2. Incorrect parameter types;3. Parameter verification failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
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

**Description:** Creates a video output object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
|profile|[VideoProfile](#class-videoprofile)|Yes|-|Supported video configuration obtained via [getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode) interface.|
|surfaceId|String|Yes|-|surfaceId obtained from AVRecorder.|

**Return Value:**

| Type | Description |
|:----|:----|
|[VideoOutput](#class-videooutput)|VideoOutput instance.|

**Exceptions:**

- BusinessException: Error codes as listed below. See [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let videoOutput = cameraManager.createVideoOutput(surfaceId)
```### func createVideoOutput(String)

```cangjie
public func createVideoOutput(surfaceId: String): VideoOutput
```

**Function:** Creates a video output object without configuration information. This interface must be used in conjunction with the [preconfig](#func-preconfigpreconfigtype-preconfigratio) feature.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description |
|:--------------|:-------|:---------|:-------------|:------------|
| surfaceId     | String | Yes      | -            | The surfaceId obtained from AVRecorder. |

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| [VideoOutput](#class-videooutput) | VideoOutput instance. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 7400101      | Parameter missing or parameter type incorrect. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let videoOutput = cameraManager.createVideoOutput(surfaceId)
```

### func getSupportedCameras()

```cangjie
public func getSupportedCameras(): Array<CameraDevice>
```

**Function:** Obtains the supported camera device objects.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| Array\<[CameraDevice](#class-cameradevice)> | List of camera devices. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
```

### func getSupportedOutputCapability(CameraDevice, SceneMode)

```cangjie
public func getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability
```

**Function:** Queries the output capabilities supported by the camera device in the specified mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:--------------|:------------------------|:---------|:-------------|:------------|
| camera        | [CameraDevice](#class-cameradevice) | Yes      | -            | Camera device, obtained via the [getSupportedCameras](#func-getsupportedcameras) interface. |
| mode          | [SceneMode](#enum-scenemode) | Yes      | -            | Camera mode, obtained via the [getSupportedSceneModes](#func-getsupportedscenemodescameradevice) interface. |

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| [CameraOutputCapability](#class-cameraoutputcapability) | Camera output capability. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
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

**Function:** Obtains the modes supported by the specified camera device object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:--------------|:------------------------|:---------|:-------------|:------------|
| camera        | [CameraDevice](#class-cameradevice) | Yes      | -            | Camera device, obtained via the [getSupportedCameras](#func-getsupportedcameras) interface. |

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| Array\<[SceneMode](#enum-scenemode)> | List of modes supported by the camera. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)
```

### func getTorchMode()

```cangjie
public func getTorchMode(): TorchMode
```

**Function:** Obtains the current torch mode of the device.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| [TorchMode](#enum-torchmode) | Returns the current torch mode of the device. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
```

### func isCameraMuted()

```cangjie
public func isCameraMuted(): Bool
```

**Function:** Queries the current disabled state of the camera (disabled/not disabled).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| Bool                    | Returns true if the camera is disabled, false otherwise. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
Hilog.info(0, "AppLogCj", cameraManager.isCameraMuted())
```

### func isTorchModeSupported(TorchMode)

```cangjie
public func isTorchModeSupported(mode: TorchMode): Bool
```

**Function:** Checks whether the specified torch mode is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:--------------|:------------------------|:---------|:-------------|:------------|
| mode          | [TorchMode](#enum-torchmode) | Yes      | -            | Torch mode. |

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| Bool                    | Returns true if the device supports the specified torch mode. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
Hilog.info(0, "AppLogCj", cameraManager.isTorchModeSupported(torchMode))
```

### func isTorchSupported()

```cangjie
public func isTorchSupported(): Bool
```

**Function:** Checks whether the device supports the torch.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Return Value:**

| Type                     | Description |
|:------------------------|:------------|
| Bool                    | Returns true if the device supports the torch. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
Hilog.info(0, "AppLogCj", cameraManager.isTorchSupported())
```

### func off(CameraEvents, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**Function:** Unregisters the callback for camera device status changes, canceling the receipt of camera status updates.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:--------------|:------------------------|:---------|:-------------|:------------|
| event         | [CameraEvents](#enum-cameraevents) | Yes      | -            | Listening event, must be CameraStatus. Can be monitored after the CameraManager object is successfully obtained. Currently, only device opening or closing triggers this event and returns corresponding information. |
| callback      | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#class-camerastatusinfo)> | Yes      | -            | Callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 401          | The parameter check failed. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraEvents.TorchStatusChange)
```

### func off(CameraEvents, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**Function:** Unregisters the callback for foldable device status changes, canceling the receipt of fold status updates.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:--------------|:------------------------|:---------|:-------------|:------------|
| event         | [CameraEvents](#enum-cameraevents) | Yes      | -            | Listening event, must be FoldStatusChange. Indicates that the fold status of the foldable device has changed. |
| callback      | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#class-foldstatusinfo)> | Yes      | -            | Callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :----------- | :------------ |
  | 401          | The parameter check failed. |
  | 7400201      | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context is required. For details, see the usage instructions in this document.
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraEvents.TorchStatusChange)
```### func off(CameraEvents, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**Function:** Unregisters the callback for torch status changes by removing the callback function to stop receiving torch status updates.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be TorchStatusChange. Can be monitored after CameraManager object is successfully obtained. Currently only supports torch on, torch off, torch unavailable, and torch available events which will trigger this callback and return corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#class-torchstatusinfo)> | Yes | - | Callback function. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraEvents.TorchStatusChange)
```

### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Function:** Cancels all callbacks for the specified listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraEvents.TorchStatusChange)
```

### func on(CameraEvents, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**Function:** Registers a callback for camera device status changes to receive camera state updates. Uses callback for asynchronous notification.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraStatus. Can be monitored after CameraManager object is successfully obtained. Currently only supports device open or close events which will trigger this callback and return corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#class-camerastatusinfo)> | Yes | - | Callback function to receive camera status change information. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.on(CameraEvents.TorchStatusChange, testCallbackTorchStatusChange)
```

### func on(CameraEvents, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**Function:** Registers a listener for foldable device folding status changes.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FoldStatusChange. Indicates foldable device folding status changes. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#class-foldstatusinfo)> | Yes | - | Callback function. Returns foldable device folding information. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.on(CameraEvents.TorchStatusChange, testCallbackTorchStatusChange)
```

### func on(CameraEvents, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**Function:** Registers a callback for torch status changes to receive torch state updates.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be TorchStatusChange. Can be monitored after cameraManager object is successfully obtained. Currently only supports torch on, torch off, torch unavailable, and torch available events which will trigger this callback and return corresponding information. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#class-torchstatusinfo)> | Yes | - | Callback function to receive torch status change information. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.on(CameraEvents.TorchStatusChange, testCallbackTorchStatusChange)
```

### func setTorchMode(TorchMode)

```cangjie
public func setTorchMode(mode: TorchMode): Unit
```

**Function:** Sets the device's torch mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| mode | [TorchMode](#enum-torchmode) | Yes | - | Torch mode. |

**Exceptions:**

- BusinessException: Error codes are as follows, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md) for details.

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions for details
let cameraManager = getCameraManager(ctx)
cameraManager.setTorchMode(TorchMode.On)
cameraManager.setTorchMode(TorchMode.Off)
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

**Since:** 21

### let photoProfiles

```cangjie
public let photoProfiles: Array<Profile>
```

**Function:** Supported photo configuration information collection.

**Type:** Array\<[Profile](#class-profile)>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let previewProfiles

```cangjie
public let previewProfiles: Array<Profile>
```

**Function:** Supported preview configuration information collection.

**Type:** Array\<[Profile](#class-profile)>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let supportedMetadataObjectTypes

```cangjie
public let supportedMetadataObjectTypes: Array<MetadataObjectType>
```

**Function:** Supported metadata stream type information collection.

**Type:** Array\<[MetadataObjectType](#enum-metadataobjecttype)>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let videoProfiles

```cangjie
public let videoProfiles: Array<VideoProfile>
```

**Function:** Supported video recording configuration information collection.

**Type:** Array\<[VideoProfile](#class-videoprofile)>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21## class CameraStatusInfo

```cangjie
public class CameraStatusInfo {
    public var camera: CameraDevice
    public var status: CameraStatus
}
```

**Description:** An interface instance returned by the camera manager callback, representing camera status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var camera

```cangjie
public var camera: CameraDevice
```

**Description:** Camera information.

**Type:** [CameraDevice](#class-cameradevice)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var status

```cangjie
public var status: CameraStatus
```

**Description:** Camera status.

**Type:** [CameraStatus](#enum-camerastatus)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class CaptureEndInfo

```cangjie
public class CaptureEndInfo {
    public var captureId: Int32
    public var frameCount: Int32
}
```

**Description:** Photo capture stop information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Description:** Capture ID.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var frameCount

```cangjie
public var frameCount: Int32
```

**Description:** Frame count.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class CaptureStartInfo

```cangjie
public class CaptureStartInfo {
    public var captureId: Int32
    public var time: Int64
}
```

**Description:** Photo capture start information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Description:** Capture ID.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var time

```cangjie
public var time: Int64
```

**Description:** Estimated sensor frame capture time for a single photo at the underlying layer.

**Type:** Int64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class FoldStatusInfo

```cangjie
public class FoldStatusInfo {
    public let supportedCameras: Array<CameraDevice>
    public let foldStatus: FoldStatus
}
```

**Description:** An interface instance returned by the camera manager callback, representing foldable device folding status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let foldStatus

```cangjie
public let foldStatus: FoldStatus
```

**Description:** Foldable screen folding status.

**Type:** [FoldStatus](#enum-foldstatus)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let supportedCameras

```cangjie
public let supportedCameras: Array<CameraDevice>
```

**Description:** List of supported camera information for the current folding status.

**Type:** Array\<[CameraDevice](#class-cameradevice)>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class FrameRateRange

```cangjie
public class FrameRateRange {
    public let min: Int32
    public let max: Int32
}
```

**Description:** Frame rate range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let max

```cangjie
public let max: Int32
```

**Description:** Maximum frame rate.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let min

```cangjie
public let min: Int32
```

**Description:** Minimum frame rate.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class FrameShutterEndInfo

```cangjie
public class FrameShutterEndInfo {
    public var captureId: Int32
}
```

**Description:** Photo exposure end information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Description:** Capture ID.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class FrameShutterInfo

```cangjie
public class FrameShutterInfo {
    public var captureId: Int32
    public var timestamp: Int64
}
```

**Description:** Photo frame output information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var captureId

```cangjie
public var captureId: Int32
```

**Description:** Capture ID.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var timestamp

```cangjie
public var timestamp: Int64
```

**Description:** Shutter timestamp.

**Type:** Int64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class Location

```cangjie
public class Location {
    public var latitude: Float64
    public var longitude: Float64
    public var altitude: Float64
    public init(latitude: Float64, longitude: Float64, altitude: Float64)
}
```

**Description:** Image geographic location information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var altitude

```cangjie
public var altitude: Float64
```

**Description:** Altitude (meters).

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var latitude

```cangjie
public var latitude: Float64
```

**Description:** Latitude (degrees).

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var longitude

```cangjie
public var longitude: Float64
```

**Description:** Longitude (degrees).

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(Float64, Float64, Float64)

```cangjie
public init(latitude: Float64, longitude: Float64, altitude: Float64)
```

**Description:** Creates a Location object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description            |
|-----------|--------|-----------|---------|------------------------|
| latitude  | Float64| Yes       | -       | Latitude (degrees).    |
| longitude | Float64| Yes       | -       | Longitude (degrees).   |
| altitude  | Float64| Yes       | -       | Altitude (meters).     |

## class PhotoCaptureSetting

```cangjie
public class PhotoCaptureSetting {
    public var quality: QualityLevel
    public var rotation: ImageRotation
    public var location:?Location
    public var mirror: Bool
    public init(
        quality!: QualityLevel = QualityLevel.QualityLevelLow,
        rotation!: ImageRotation = ImageRotation.Rotation0,
        location!: ?Location = None,
        mirror!: Bool = false
    )
}
```

**Description:** Settings for capturing photos.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var location

```cangjie
public var location:?Location
```

**Description:** Image geographic location information (defaults to device hardware information).

**Type:** ?[Location](#class-location)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var mirror

```cangjie
public var mirror: Bool
```

**Description:** Mirror enable switch (default off). Use [isMirrorSupported](#func-ismirrorsupported) to check support before enabling.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var quality

```cangjie
public var quality: QualityLevel
```

**Description:** Image quality (default low).

**Type:** [QualityLevel](#enum-qualitylevel)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var rotation

```cangjie
public var rotation: ImageRotation
```

**Description:** Image rotation angle (default 0 degrees, clockwise rotation).

**Type:** [ImageRotation](#enum-imagerotation)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(QualityLevel, ImageRotation, ?Location, Bool)

```cangjie
public init(
    quality!: QualityLevel = QualityLevel.QualityLevelLow,
    rotation!: ImageRotation = ImageRotation.Rotation0,
    location!: ?Location = None,
    mirror!: Bool = false
)
```

**Description:** Creates a PhotoCaptureSetting object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type                      | Mandatory | Default                     | Description                                                                 |
|-----------|---------------------------|-----------|-----------------------------|-----------------------------------------------------------------------------|
| quality   | [QualityLevel](#enum-qualitylevel) | No        | QualityLevel.QualityLevelLow | **Named parameter.** Image quality (default low).                          |
| rotation  | [ImageRotation](#enum-imagerotation) | No        | ImageRotation.Rotation0     | **Named parameter.** Image rotation angle (default 0 degrees).              |
| location  | ?[Location](#class-location)        | No        | None                        | **Named parameter.** Image geographic location information (defaults to device hardware). |
| mirror    | Bool                      | No        | false                       | **Named parameter.** Mirror enable switch (default off). Check support with [isMirrorSupported](#func-ismirrorsupported). |## class PhotoOutput

```cangjie
public class PhotoOutput <: CameraOutput {}
```

**Description:** Output information used in photo capture sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func capture()

```cangjie
public func capture(): Unit
```

**Description:** Triggers a single photo capture with specified parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400104 | Session not running. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.capture(PhotoCaptureSetting())
```

### func capture(PhotoCaptureSetting)

```cangjie
public func capture(setting: PhotoCaptureSetting): Unit
```

**Description:** Triggers a single photo capture with specified parameters.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| setting | [PhotoCaptureSetting](#class-photocapturesetting) | Yes | - | Photo capture settings. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400104 | Session not running. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.capture(PhotoCaptureSetting())
```

### func enableMirror(Bool)

```cangjie
public func enableMirror(enabled: Bool): Unit
```

**Description:** Enables or disables mirror photo capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| enabled | Bool | Yes | - | `true` to enable mirror photo capture, `false` to disable. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let enabled = true
output.enableMirror(enabled)
```

### func enableMovingPhoto(Bool)

```cangjie
public func enableMovingPhoto(enabled: Bool): Unit
```

**Description:** Enables or disables moving photo capture.

**Required Permission:** ohos.permission.MICROPHONE

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| enabled | Bool | Yes | - | `true` to enable moving photo, `false` to disable. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | permission denied. |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let enabled = true
output.enableMovingPhoto(enabled)
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
| :---- | :---- |
| [Profile](#class-profile) | Currently active configuration information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let profile = output.getActiveProfile()
```

### func getPhotoRotation(Int32)

```cangjie
public func getPhotoRotation(deviceDegree: Int32): ImageRotation
```

**Description:** Retrieves the rotation angle for photo capture.

- Device natural orientation: Default orientation of the device, typically portrait for phones (charging port facing down).
- Camera lens angle: Value equals the clockwise rotation angle from the camera image to the device's natural orientation. For example, rear camera sensors on phones are installed in portrait mode, requiring a 90-degree clockwise rotation to align with the device's natural orientation.
- Screen display orientation: Requires the top-left corner of the displayed image to be the origin point (0,0). When locked, it matches the natural orientation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| deviceDegree | Int32 | Yes | - | Device rotation angle. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageRotation](#enum-imagerotation) | Rotation angle for photo capture. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let deviceDegree: Int32 = 0
let imageRotation = output.getPhotoRotation(deviceDegree)
```

### func getSupportedMovingPhotoVideoCodecTypes()

```cangjie
public func getSupportedMovingPhotoVideoCodecTypes(): Array<VideoCodecType>
```

**Description:** Queries supported video codec types for moving photos.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Array\<[VideoCodecType](#enum-videocodectype)> | List of supported video codec types for moving photos. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let videoCodecTypes = output.getSupportedMovingPhotoVideoCodecTypes()
```

### func isMirrorSupported()

```cangjie
public func isMirrorSupported(): Bool
```

**Description:** Checks whether mirror photo capture is supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns `true` if mirror photo capture is supported, `false` otherwise. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
Hilog.info(0, "AppLogCj", output.isMirrorSupported())
```### func isMovingPhotoSupported()

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

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
Hilog.info(0, "AppLogCj", output.isMovingPhotoSupported())
```

### func off(CameraEvents, Callback1Argument\<CaptureStartInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<CaptureStartInfo>): Unit
```

**Function:** Unregisters the listener for photo capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be CaptureStartWithInfo.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#class-capturestartinfo)>|Yes|-|Callback function for handling [CaptureStartInfo](#class-capturestartinfo).|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback1Argument\<FrameShutterInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<FrameShutterInfo>): Unit
```

**Function:** Unregisters the listener for photo frame output capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be FrameShutter.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#class-frameshutterinfo)>|Yes|-|Callback function for handling [FrameShutterInfo](#class-frameshutterinfo).|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback1Argument\<CaptureEndInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<CaptureEndInfo>): Unit
```

**Function:** Unregisters the listener for photo capture end.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be CaptureEnd.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#class-captureendinfo)>|Yes|-|Callback function for handling [CaptureEndInfo](#class-captureendinfo).|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback1Argument\<FrameShutterEndInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<FrameShutterEndInfo>): Unit
```

**Function:** Unregisters the listener for photo frame output capture.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be FrameShutterEnd.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#class-frameshutterendinfo)>|Yes|-|Callback function for handling [FrameShutterEndInfo](#class-frameshutterendinfo).|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener for readiness to capture next photo.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be CaptureReady.|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|Yes|-|Callback function.|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback1Argument\<Float64>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<Float64>): Unit
```

**Function:** Unregisters the listener for estimated photo capture duration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be EstimatedCaptureDuration.|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Float64>|Yes|-|Callback function for obtaining estimated photo capture duration (milliseconds).|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener for photo output errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be CameraError.|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|Yes|-|Callback function for obtaining error information.|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```

### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Function:** Cancels all callbacks for the specified listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event.|

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context needs to be obtained. See usage instructions in this document.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
output.off(CameraEvents.CaptureStartWithInfo)
```### func on(CameraEvents, Callback1Argument\<CaptureStartInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<CaptureStartInfo>): Unit
```

**Function:** Listens for photo capture start events by registering a callback function to obtain CaptureStartInfo. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `CaptureStartWithInfo`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#class-capturestartinfo)> | Yes | - | Callback function for processing [CaptureStartInfo](#class-capturestartinfo). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback1Argument\<FrameShutterInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<FrameShutterInfo>): Unit
```

**Function:** Listens for photo frame capture events by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `FrameShutter`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#class-frameshutterinfo)> | Yes | - | Callback function for processing [FrameShutterInfo](#class-frameshutterinfo). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback1Argument\<CaptureEndInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<CaptureEndInfo>): Unit
```

**Function:** Listens for photo capture end events by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `CaptureEnd`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#class-captureendinfo)> | Yes | - | Callback function for processing [CaptureEndInfo](#class-captureendinfo). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback1Argument\<FrameShutterEndInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<FrameShutterEndInfo>): Unit
```

**Function:** Listens for photo frame capture events by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `FrameShutterEnd`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#class-frameshutterendinfo)> | Yes | - | Callback function for processing [FrameShutterEndInfo](#class-frameshutterendinfo). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listens for readiness to capture the next photo by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `CaptureReady`. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback1Argument\<Float64>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<Float64>): Unit
```

**Function:** Listens for estimated photo capture duration by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `EstimatedCaptureDuration`. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Float64> | Yes | - | Callback function for obtaining estimated photo capture duration (in milliseconds). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listens for photo output errors by registering a callback function to obtain results. Uses asynchronous callback via `callback`.

> **Note:**
>
> Calling `off` to unregister the callback within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `CameraError`. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function for processing [BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception). |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let output = cameraManager.createPhotoOutput(profile:ability.photoProfiles[0])
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  |## class PhotoSession

```cangjie
public class PhotoSession <: Session & Flash & AutoExposure & Focus & Zoom & ColorManagement {}
```

**Description:** Standard photo capture session class, providing operations for flash, exposure, focus, zoom, and color space management.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- [Session](#interface-session)
- [Flash](#interface-flash)
- [AutoExposure](#interface-autoexposure)
- [Focus](#interface-focus)
- [Zoom](#interface-zoom)
- [ColorManagement](#interface-colormanagement)

### func canPreconfig(PreconfigType, PreconfigRatio)

```cangjie
public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PreconfigRatio_4_3): Bool
```

**Description:** Queries whether the current session supports the specified preconfiguration type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PreconfigRatio_4_3 | **Named parameter.** Optional aspect ratio. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Supports the specified preconfiguration type. false: Does not support the specified preconfiguration type. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
Hilog.info(0, "AppLogCj", session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9))
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Description:** Unregisters the listener for error events in the standard photo capture session. Results are obtained through the registered callback function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function for handling [BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
session.off(CameraEvents.FocusStateChange)
```

### func off(CameraEvents, Callback1Argument\<FocusState>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<FocusState>): Unit
```

**Description:** Unregisters the listener for camera focus state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FocusStateChange. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function for handling [FocusState](#enum-focusstate). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
session.off(CameraEvents.FocusStateChange)
```

### func off(CameraEvents, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Description:** Unregisters the listener for camera smooth zoom state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be SmoothZoomInfoAvailable. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#class-smoothzoominfo)> | Yes | - | Callback function for handling [SmoothZoomInfo](#class-smoothzoominfo). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
session.off(CameraEvents.FocusStateChange)
```

### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Description:** Unregisters the listener for error events in the standard photo capture session/camera focus state changes/camera smooth zoom state changes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraEvents.focusStateChange. This interface can be listened to after the session is successfully created. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
session.off(CameraEvents.FocusStateChange)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Description:** Listens for error events in the standard photo capture session. Results are obtained through the registered callback function. Uses callback for asynchronous results.

> **Note:**
>
> Calling off to unregister the callback within the on listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function for handling [BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func on(CameraEvents, Callback1Argument\<FocusState>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<FocusState>): Unit
```

**Description:** Listens for camera focus state changes. Results are obtained through the registered callback function. Uses callback for asynchronous results.

> **Note:**
>
> Calling off to unregister the callback within the on listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FocusStateChange. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function for obtaining the current focus state. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func on(CameraEvents, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Description:** Listens for camera smooth zoom state changes. Results are obtained through the registered callback function. Uses callback for asynchronous results.

> **Note:**
>
> Calling off to unregister the callback within the on listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be SmoothZoomInfoAvailable. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#class-smoothzoominfo)> | Yes | - | Callback function for handling [SmoothZoomInfo](#class-smoothzoominfo). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func preconfig(PreconfigType, PreconfigRatio)

```cangjie
public func preconfig(
    preconfigType: PreconfigType,
    preconfigRatio!: PreconfigRatio = PreconfigRatio.PreconfigRatio_4_3
): Unit
```

**Description:** Preconfigures the current session.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PreconfigRatio.PreconfigRatio_4_3 | **Named parameter.** Optional aspect ratio. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NormalPhoto) as PhotoSession
let session = photoSession.getOrThrow()
session.preconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```## class Point

```cangjie
public class Point {
    public var x: Float64
    public var y: Float64
    public init(x: Float64, y: Float64)
}
```

**Function:** Point coordinates used for focus and exposure configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var x

```cangjie
public var x: Float64
```

**Function:** The x-coordinate of the point.

**Type:** Float64

**Read-Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var y

```cangjie
public var y: Float64
```

**Function:** The y-coordinate of the point.

**Type:** Float64

**Read-Write Permission:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### init(Float64, Float64)

```cangjie
public init(x: Float64, y: Float64)
```

**Function:** Creates a Point object.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|x|Float64|Yes|-|The x-coordinate of the point.|
|y|Float64|Yes|-|The y-coordinate of the point.|

## class PreviewOutput

```cangjie
public class PreviewOutput <:  CameraOutput {}
```

**Function:** Preview output class.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**Function:** Gets the configured frame rate range.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[FrameRateRange](#class-frameraterange)|Frame rate range.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let range = output.getActiveFrameRate()
```

### func getActiveProfile()

```cangjie
public func getActiveProfile(): Profile
```

**Function:** Gets the currently active configuration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|[Profile](#class-profile)|Currently active configuration.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let profile = output.getActiveProfile()
```

### func getPreviewRotation(Int32)

```cangjie
public func getPreviewRotation(displayRotation: Int32): ImageRotation
```

**Function:** Gets the preview rotation angle.

- Device natural orientation: Default device orientation, portrait for mobile phones (charging port facing downward).
- Camera lens angle: Value equals the angle by which the camera image is rotated clockwise to align with the device's natural orientation. For mobile phone rear cameras, the sensor is installed in portrait mode, requiring a 90-degree clockwise rotation to match the natural orientation.
- Screen display orientation: Requires the top-left corner of the displayed image to be the coordinate origin (first pixel point). Matches natural orientation when locked.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|displayRotation|Int32|Yes|-|Screen rotation angle of the display device, obtained via [getDefaultDisplaySync](../../arkui-cj/cj-apis-display.md#func-getdefaultdisplaysync).|

**Return Value:**

| Type | Description |
|:----|:----|
|[ImageRotation](#enum-imagerotation)|Preview rotation angle.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let imageRotation = output.getPreviewRotation(0)
```

### func getSupportedFrameRates()

```cangjie
public func getSupportedFrameRates(): Array<FrameRateRange>
```

**Function:** Queries the supported frame rate ranges.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
|Array\<[FrameRateRange](#class-frameraterange)>|List of supported frame rate ranges.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let frameRateRanges = output.getSupportedFrameRates()
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener for preview frame start.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be FrameStart.|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|Yes|-|Callback function.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener for preview output errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|event|[CameraEvents](#enum-cameraevents)|Yes|-|Listening event, must be CameraError.|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|Yes|-|Callback function for retrieving error information.|

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Function:** Unregisters all callbacks for the specified event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to unregister. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listens for preview frame start events and obtains results through registered callback functions. Uses callback for asynchronous notification.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `FrameStart`. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | The callback function. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listens for preview output errors and obtains results through registered callback functions. Uses callback for asynchronous notification.

> **Note:**
>
> Calling `off` to unregister callbacks within the callback method of `on` is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | The event to listen for, must be `CameraError`. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | The callback function to obtain error information. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.release()
```

### func setFrameRate(Int32, Int32)

```cangjie
public func setFrameRate(minFps: Int32, maxFps: Int32): Unit
```

**Function:** Sets the frame rate range for the preview stream. The specified range must be within the supported frame rate range. Before setting, query supported frame rate ranges via [getSupportedFrameRates](#func-getsupportedframerates).

> **Note:**
>
> Only supported in [PhotoSession](#class-photosession) or [VideoSession](#class-videosession) modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| minFps | Int32 | Yes | - | Minimum frame rate. |
| maxFps | Int32 | Yes | - | Maximum frame rate. If the minimum value exceeds the maximum, the parameter is invalid, and the interface takes no effect. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400110 | Unresolved conflicts with current configurations. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createPreviewOutput(ability.previewProfiles[0], surfaceId)
output.setFrameRate(30, 60)
```

### func setPreviewRotation(ImageRotation, Bool)

```cangjie
public func setPreviewRotation(previewRotation: ImageRotation, isDisplayLocked!: Bool = false): Unit
```

**Function:** Sets the preview rotation angle.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| previewRotation | [ImageRotation](#enum-imagerotation) | Yes | - | The preview rotation angle. |
| isDisplayLocked | Bool | No | false | **Named parameter.** Whether rotation is locked. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[0]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
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

**Function:** Camera configuration information item.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let format

```cangjie
public let format: CameraFormat
```

**Function:** Output format.

**Type:** [CameraFormat](#enum-cameraformat)

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let size

```cangjie
public let size: Size
```

**Function:** Resolution. Sets the camera resolution width and height, not the actual output image dimensions.

**Type:** [Size](#class-size)

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21## class Rect

```cangjie
public class Rect {
    public var topLeftX: Float64
    public var topLeftY: Float64
    public var width: Float64
    public var height: Float64
}
```

**Description:** Rectangle definition.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var height

```cangjie
public var height: Float64
```

**Description:** Rectangle height, relative value ranging [0.0, 1.0].

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var topLeftX

```cangjie
public var topLeftX: Float64
```

**Description:** X-coordinate of the top-left corner of the rectangle area.

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var topLeftY

```cangjie
public var topLeftY: Float64
```

**Description:** Y-coordinate of the top-left corner of the rectangle area.

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var width

```cangjie
public var width: Float64
```

**Description:** Rectangle width, relative value ranging [0.0, 1.0].

**Type:** Float64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class Size

```cangjie
public class Size {
    public var width: UInt32
    public var height: UInt32
}
```

**Description:** Output capability query.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var height

```cangjie
public var height: UInt32
```

**Description:** Image height in pixels.

**Type:** UInt32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var width

```cangjie
public var width: UInt32
```

**Description:** Image width in pixels.

**Type:** UInt32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class SmoothZoomInfo

```cangjie
public class SmoothZoomInfo {
    public var duration: Int32
}
```

**Description:** Smooth zoom parameter information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### var duration

```cangjie
public var duration: Int32
```

**Description:** Total duration of smooth zoom in milliseconds.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class TorchStatusInfo

```cangjie
public class TorchStatusInfo {
    public let isTorchAvailable: Bool
    public let isTorchActive: Bool
    public let torchLevel: Float64
}
```

**Description:** Interface instance returned by torch callback, representing torch status information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let isTorchActive

```cangjie
public let isTorchActive: Bool
```

**Description:** Whether the torch is activated.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let isTorchAvailable

```cangjie
public let isTorchAvailable: Bool
```

**Description:** Whether the torch is available.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### let torchLevel

```cangjie
public let torchLevel: Float64
```

**Description:** Torch brightness level. Value range [0.0,1.0], where values closer to 1 indicate higher brightness.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class VideoOutput

```cangjie
public class VideoOutput <:  CameraOutput {}
```

**Description:** Output information used in video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**Description:** Gets the configured frame rate range. Can be queried after setting frame rate for video stream using setFrameRate.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[FrameRateRange](#class-frameraterange)|Frame rate range.|

**Exceptions:**

- BusinessException: Error codes as shown below, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let frameRateRange = output.getActiveFrameRate()
```

### func getActiveProfile()

```cangjie
public func getActiveProfile(): VideoProfile
```

**Description:** Gets the currently active configuration information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[VideoProfile](#class-videoprofile)|Currently active configuration information.|

**Exceptions:**

- BusinessException: Error codes as shown below, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let videoProfile = output.getActiveProfile()
```

### func getSupportedFrameRates()

```cangjie
public func getSupportedFrameRates(): Array<FrameRateRange>
```

**Description:** Queries supported frame rate ranges.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<[FrameRateRange](#class-frameraterange)>|List of supported frame rate ranges.|

**Exceptions:**

- BusinessException: Error codes as shown below, refer to [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required, see usage instructions
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let frameRateRanges = output.getSupportedFrameRates()
```### func getVideoRotation(Int32)

```cangjie
public func getVideoRotation(deviceDegree: Int32): ImageRotation
```

**Function:** Get video rotation angle.

- **Device Natural Orientation:** Default usage orientation of the device. For mobile phones, this is portrait mode (charging port facing downward).
- **Camera Lens Angle:** The value equals the clockwise rotation angle required to align the camera image with the device's natural orientation. The rear camera sensor on mobile phones is installed in portrait mode, so it needs to be rotated 90 degrees clockwise to match the device's natural orientation.
- **Screen Display Orientation:** The displayed image should have its top-left corner as the coordinate origin (first pixel point). When the screen is locked, it aligns with the natural orientation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| deviceDegree | Int32 | Yes | - | Device rotation angle. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageRotation](#enum-imagerotation) | Video rotation angle. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let imageRotation = output.getVideoRotation(0)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregister the listener for preview frame start.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FrameStart. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Unregister the listener for video output errors.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. Can be listened to after videoOutput is successfully created. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to remove the corresponding callback. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```

### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Function:** Remove all callbacks for the specified listening event.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.off(CameraEvents.CameraError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listen for preview frame start events and obtain results via registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FrameStart. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Function:** Listen for video output errors and obtain results via registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. Can be listened to after videoOutput is successfully created. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to obtain error information. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Code can be added in dependency definitions
class TestCallbackError <: Callback0Argument {
    public init() {}
    public open func invoke(res: ?BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res?.code}, msg: ${res?.message}", [])
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
let testCallbackError = TestCallbackError()
output.on(CameraEvents.CameraError, testCallbackError)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Release output resources.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.release()
```

### func setFrameRate(Int32, Int32)

```cangjie
public func setFrameRate(minFps: Int32, maxFps: Int32): Unit
```

**Function:** Set the frame rate range for video streaming. The specified range must fall within the supported frame rate range. Before setting, query the supported frame rate range via [getSupportedFrameRates](#func-getsupportedframerates).

> **Note:**
>
> Only supported in [PhotoSession](#class-photosession) or [VideoSession](#class-videosession) modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| minFps | Int32 | Yes | - | Minimum frame rate. |
| maxFps | Int32 | Yes | - | Maximum frame rate. If the minimum value exceeds the maximum value, the parameters are invalid, and the interface will not take effect. |

**Exceptions:**

- **BusinessException:** Corresponding error codes are listed below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400110 | Unresolved conflicts with current configurations. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import kit.ImageKit.createImageReceiver
import kit.ImageKit.Size as ImageSize
import kit.ImageKit.ImageFormat
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let device = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(device)[1]
let ability = cameraManager.getSupportedOutputCapability(device, mode)
let size = ImageSize(8, 8192)
let receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let output = cameraManager.createVideoOutput(ability.videoProfiles[0], surfaceId)
output.setFrameRate(30, 60)
```

### func start()

```cangjie
public func start(): Unit
```

**Function:** Start recording.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Initial Version:** 21

**Exceptions:**

-## class VideoProfile

```cangjie
public class VideoProfile <: Profile {
    public let frameRateRange: FrameRateRange
}
```

**Description:** Video configuration item.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Type:**

- [Profile](#class-profile)

### let frameRateRange

```cangjie
public let frameRateRange: FrameRateRange
```

**Description:** Frame rate range, fps (frames per second).

**Type:** [FrameRateRange](#class-frameraterange)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

## class VideoSession

```cangjie
public class VideoSession <:  Session & Flash & AutoExposure & Focus & Zoom & Stabilization & ColorManagement {}
```

**Description:** Video recording session class in normal mode, providing operations for flash, exposure, focus, zoom, video stabilization, and color space.

> **Note:**
>
> Default video recording mode suitable for general scenarios. Supports recording at various resolutions like 720P, 1080p, with selectable frame rates (e.g., 30fps, 60fps).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

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
public func canPreconfig(preconfigType: PreconfigType, preconfigRatio!: PreconfigRatio = PreconfigRatio_16_9): Bool
```

**Description:** Queries whether the current Session supports the specified preconfiguration type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| preconfigType | [PreconfigType](#enum-preconfigtype) | Yes | - | Specifies the expected resolution configuration. |
| preconfigRatio | [PreconfigRatio](#enum-preconfigratio) | No | PreconfigRatio_16_9 | **Named parameter.** Optional aspect ratio. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: Supports the specified preconfiguration type. false: Does not support the specified preconfiguration type. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

### func off(CameraEvents, Callback0Argument)

```cangjie
public func off(event: CameraEvents, callback: Callback0Argument): Unit
```

**Description:** Unregisters the listener for error events in normal video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. This interface can be listened to after the session is successfully created. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to be unregistered. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraEvents.SmoothZoomInfoAvailable)
```

### func off(CameraEvents, Callback1Argument\<FocusState>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<FocusState>): Unit
```

**Description:** Unregisters the listener for focus state changes in normal video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FocusStateChange. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to be unregistered. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraEvents.SmoothZoomInfoAvailable)
```

### func off(CameraEvents, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func off(event: CameraEvents, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Description:** Unregisters the listener for smooth zoom state changes in normal video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be SmoothZoomInfoAvailable. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#class-smoothzoominfo)> | Yes | - | Callback function to be unregistered. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraEvents.SmoothZoomInfoAvailable)
```

### func off(CameraEvents)

```cangjie
public func off(event: CameraEvents): Unit
```

**Description:** Unregisters the listener for error events in normal video recording sessions.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraEvents.SmoothZoomInfoAvailable)
```

### func on(CameraEvents, Callback0Argument)

```cangjie
public func on(event: CameraEvents, callback: Callback0Argument): Unit
```

**Description:** Listens for error events in normal video recording sessions and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be CameraError. This interface can be listened to after the session is successfully created. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function to obtain error information. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func on(CameraEvents, Callback1Argument\<FocusState>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<FocusState>): Unit
```

**Description:** Listens for focus state changes in normal video recording sessions and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be FocusStateChange. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)> | Yes | - | Callback function to obtain focus state change information. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func on(CameraEvents, Callback1Argument\<SmoothZoomInfo>)

```cangjie
public func on(event: CameraEvents, callback: Callback1Argument<SmoothZoomInfo>): Unit
```

**Description:** Listens for smooth zoom state changes in normal video recording sessions and obtains results through registered callback functions.

> **Note:**
>
> Calling `off` to unregister callbacks within the `on` listener callback method is not supported.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [CameraEvents](#enum-cameraevents) | Yes | - | Listening event, must be SmoothZoomInfoAvailable. This interface can be listened to after the session is successfully created. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#class-smoothzoominfo)> | Yes | - | Callback function to obtain smooth zoom state change information. |

**Exceptions:**

- BusinessException: Corresponding error codes as shown below. For details, see [Camera Error Codes](../../errorcodes/cj-errorcode-multimedia-camera.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 7400201 | Camera service fatal error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// This code can be added to dependency definitions
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(err: ?BusinessException, info: SmoothZoomInfo) {
        Hilog.info(0, "AppLogCj", "[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow() // Context application context required. See usage instructions for details.
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NormalVideo) as VideoSession
let session = videoSession.getOrThrow()
let callback = SmoothZoomInfoAvailableCallback()
session.on(CameraEvents.SmoothZoomInfoAvailable, callback)
```

### func preconfig(PreconfigType, PreconfigRatio)

```cangjie
public func preconfig(
    preconfigType: PreconfigType,
    preconfigRatio!:## enum CameraEvents

```cangjie
public enum CameraEvents <: Equatable<CameraEvents> {
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

**Parent Type:**

- Equatable\<CameraEvents>

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

**Function:** Photo capture completed.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CaptureReady

```cangjie
CaptureReady
```

**Function:** Ready to capture next photo.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CaptureStartWithInfo

```cangjie
CaptureStartWithInfo
```

**Function:** Photo capture started.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### EstimatedCaptureDuration

```cangjie
EstimatedCaptureDuration
```

**Function:** Estimated photo capture duration.

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

**Function:** Foldable device folding status change.

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

**Function:** Photo frame output captured.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameShutterEnd

```cangjie
FrameShutterEnd
```

**Function:** Photo exposure completed.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FrameStart

```cangjie
FrameStart
```

**Function:** Preview frame started.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### MetadataObjectsAvailable

```cangjie
MetadataObjectsAvailable
```

**Function:** Metadata objects detected.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### SmoothZoomInfoAvailable

```cangjie
SmoothZoomInfoAvailable
```

**Function:** Camera smooth zoom state change.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### TorchStatusChange

```cangjie
TorchStatusChange
```

**Function:** Torch/flashlight status change.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(CameraEvents)

```cangjie
public operator func !=(other: CameraEvents): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CameraEvents](#enum-cameraevents) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true indicates unequal, false indicates equal. |

### func ==(CameraEvents)

```cangjie
public operator func ==(other: CameraEvents): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CameraEvents](#enum-cameraevents) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true indicates unequal, false indicates equal. |

## enum CameraFormat

```cangjie
public enum CameraFormat <: Equatable<CameraFormat> & ToString {
    | CameraFormatYcbcrP010
    | CameraFormatYcrcbP010
    | CameraFormatHeic
    | CameraFormatJpeg
    | CameraFormatYuv420Sp
    | CameraFormatRgba8888
    | ...
}
```

**Function:** Output formats.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<CameraFormat>
- ToString

### CameraFormatHeic

```cangjie
CameraFormatHeic
```

**Function:** HEIF format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraFormatJpeg

```cangjie
CameraFormatJpeg
```

**Function:** JPEG format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraFormatRgba8888

```cangjie
CameraFormatRgba8888
```

**Function:** RGBA_8888 format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraFormatYcbcrP010

```cangjie
CameraFormatYcbcrP010
```

**Function:** YCBCR_P010 format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraFormatYcrcbP010

```cangjie
CameraFormatYcrcbP010
```

**Function:** YCRCB_P010 format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraFormatYuv420Sp

```cangjie
CameraFormatYuv420Sp
```

**Function:** YUV_420_SP format image.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(CameraFormat)

```cangjie
public operator func !=(other: CameraFormat): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CameraFormat](#enum-cameraformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if unequal, otherwise false. |

### func ==(CameraFormat)

```cangjie
public operator func ==(other: CameraFormat): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [CameraFormat](#enum-cameraformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if unequal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value description.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Enum description. |## enum CameraPosition

```cangjie
public enum CameraPosition <: Equatable<CameraPosition> & ToString {
    | CameraPositionUnspecified
    | CameraPositionBack
    | CameraPositionFront
    | ...
}
```

**Description:** Camera position.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<CameraPosition>
- ToString

### CameraPositionBack

```cangjie
CameraPositionBack
```

**Description:** Rear camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraPositionFront

```cangjie
CameraPositionFront
```

**Description:** Front camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraPositionUnspecified

```cangjie
CameraPositionUnspecified
```

**Description:** Camera position unspecified.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(CameraPosition)

```cangjie
public operator func !=(other: CameraPosition): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraPosition](#enum-cameraposition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(CameraPosition)

```cangjie
public operator func ==(other: CameraPosition): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraPosition](#enum-cameraposition)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum CameraStatus

```cangjie
public enum CameraStatus <: Equatable<CameraStatus> & ToString {
    | CameraStatusAppear
    | CameraStatusDisappear
    | CameraStatusAvailable
    | CameraStatusUnavailable
    | ...
}
```

**Description:** Camera status.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<CameraStatus>
- ToString

### CameraStatusAppear

```cangjie
CameraStatusAppear
```

**Description:** New camera appears.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraStatusAvailable

```cangjie
CameraStatusAvailable
```

**Description:** Camera is available.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraStatusDisappear

```cangjie
CameraStatusDisappear
```

**Description:** Camera is removed.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraStatusUnavailable

```cangjie
CameraStatusUnavailable
```

**Description:** Camera is unavailable.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(CameraStatus)

```cangjie
public operator func !=(other: CameraStatus): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraStatus](#enum-camerastatus)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(CameraStatus)

```cangjie
public operator func ==(other: CameraStatus): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraStatus](#enum-camerastatus)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum CameraType

```cangjie
public enum CameraType <: Equatable<CameraType> & ToString {
    | CameraTypeDefault
    | CameraTypeWideAngle
    | CameraTypeUltraWide
    | CameraTypeTelephoto
    | CameraTypeTrueDepth
    | ...
}
```

**Description:** Camera type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<CameraType>
- ToString

### CameraTypeDefault

```cangjie
CameraTypeDefault
```

**Description:** Camera type unspecified.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraTypeTelephoto

```cangjie
CameraTypeTelephoto
```

**Description:** Telephoto camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraTypeTrueDepth

```cangjie
CameraTypeTrueDepth
```

**Description:** Camera with depth information.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraTypeUltraWide

```cangjie
CameraTypeUltraWide
```

**Description:** Ultra-wide camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraTypeWideAngle

```cangjie
CameraTypeWideAngle
```

**Description:** Wide-angle camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(CameraType)

```cangjie
public operator func !=(other: CameraType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraType](#enum-cameratype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(CameraType)

```cangjie
public operator func ==(other: CameraType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[CameraType](#enum-cameratype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum ConnectionType

```cangjie
public enum ConnectionType <: Equatable<ConnectionType> & ToString {
    | CameraConnectionBuiltIn
    | CameraConnectionUsbPlugin
    | CameraConnectionRemote
    | ...
}
```

**Description:** Camera connection type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<ConnectionType>
- ToString

### CameraConnectionBuiltIn

```cangjie
CameraConnectionBuiltIn
```

**Description:** Built-in camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraConnectionRemote

```cangjie
CameraConnectionRemote
```

**Description:** Remotely connected camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### CameraConnectionUsbPlugin

```cangjie
CameraConnectionUsbPlugin
```

**Description:** USB-connected camera.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(ConnectionType)

```cangjie
public operator func !=(other: ConnectionType): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ConnectionType](#enum-connectiontype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal, otherwise returns false.|

### func ==(ConnectionType)

```cangjie
public operator func ==(other: ConnectionType): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[ConnectionType](#enum-connectiontype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|## enum ExposureMode

```cangjie
public enum ExposureMode <: Equatable<ExposureMode> & ToString {
    | ExposureModeLocked
    | ExposureModeAuto
    | ExposureModeContinuousAuto
    | ...
}
```

**Description:** Exposure mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<ExposureMode>
- ToString

### ExposureModeAuto

```cangjie
ExposureModeAuto
```

**Description:** Auto exposure mode. Supports setting the center point of the exposure area using [AutoExposure.setMeteringPoint](#func-setmeteringpointpoint).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### ExposureModeContinuousAuto

```cangjie
ExposureModeContinuousAuto
```

**Description:** Continuous auto exposure. Does not support setting the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### ExposureModeLocked

```cangjie
ExposureModeLocked
```

**Description:** Locked exposure mode. Does not support setting the center point of the exposure area.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(ExposureMode)

```cangjie
public operator func !=(other: ExposureMode): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ExposureMode](#enum-exposuremode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(ExposureMode)

```cangjie
public operator func ==(other: ExposureMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ExposureMode](#enum-exposuremode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum FlashMode

```cangjie
public enum FlashMode <: Equatable<FlashMode> & ToString {
    | FlashModeClose
    | FlashModeOpen
    | FlashModeAuto
    | FlashModeAlwaysOpen
    | ...
}
```

**Description:** Flash mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FlashMode>
- ToString

### FlashModeAlwaysOpen

```cangjie
FlashModeAlwaysOpen
```

**Description:** Flash always on.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FlashModeAuto

```cangjie
FlashModeAuto
```

**Description:** Auto flash.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FlashModeClose

```cangjie
FlashModeClose
```

**Description:** Flash off.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FlashModeOpen

```cangjie
FlashModeOpen
```

**Description:** Flash on.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(FlashMode)

```cangjie
public operator func !=(other: FlashMode): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FlashMode](#enum-flashmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(FlashMode)

```cangjie
public operator func ==(other: FlashMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FlashMode](#enum-flashmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum FocusMode

```cangjie
public enum FocusMode <: Equatable<FocusMode> & ToString {
    | FocusModeManual
    | FocusModeContinuousAuto
    | FocusModeAuto
    | FocusModeLocked
    | ...
}
```

**Description:** Focus mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FocusMode>
- ToString

### FocusModeAuto

```cangjie
FocusModeAuto
```

**Description:** Auto focus. Supports setting the focus point using [setFocusPoint](#func-setfocuspointpoint) to perform a single auto focus operation.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusModeContinuousAuto

```cangjie
FocusModeContinuousAuto
```

**Description:** Continuous auto focus. Does not support setting the focus point.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusModeLocked

```cangjie
FocusModeLocked
```

**Description:** Focus locked. Does not support setting the focus point.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusModeManual

```cangjie
FocusModeManual
```

**Description:** Manual focus. Changes the focus position by manually adjusting the camera's focal length. Does not support setting the focus point.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(FocusMode)

```cangjie
public operator func !=(other: FocusMode): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FocusMode](#enum-focusmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(FocusMode)

```cangjie
public operator func ==(other: FocusMode): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FocusMode](#enum-focusmode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum FocusState

```cangjie
public enum FocusState <: Equatable<FocusState> & ToString {
    | FocusStateScan
    | FocusStateFocused
    | FocusStateUnfocused
    | ...
}
```

**Description:** Focus state.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FocusState>
- ToString

### FocusStateFocused

```cangjie
FocusStateFocused
```

**Description:** Focus succeeded.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusStateScan

```cangjie
FocusStateScan
```

**Description:** Trigger focus.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### FocusStateUnfocused

```cangjie
FocusStateUnfocused
```

**Description:** Focus not completed.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(FocusState)

```cangjie
public operator func !=(other: FocusState): Bool
```

**Description:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FocusState](#enum-focusstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(FocusState)

```cangjie
public operator func ==(other: FocusState): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FocusState](#enum-focusstate) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |## enum FoldStatus

```cangjie
public enum FoldStatus <: Equatable<FoldStatus> & ToString {
    | NonFoldable
    | Expanded
    | Folded
    | ...
}
```

**Function:** Folding device fold status.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<FoldStatus>
- ToString

### Expanded

```cangjie
Expanded
```

**Function:** Indicates the device is in fully expanded state.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Folded

```cangjie
Folded
```

**Function:** Indicates the device is in folded state.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### NonFoldable

```cangjie
NonFoldable
```

**Function:** Indicates the device is non-foldable.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(FoldStatus)

```cangjie
public operator func !=(other: FoldStatus): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(FoldStatus)

```cangjie
public operator func ==(other: FoldStatus): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [FoldStatus](#enum-foldstatus) | Yes | - | Another enum value. |

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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum ImageRotation

```cangjie
public enum ImageRotation <: Equatable<ImageRotation> & ToString {
    | Rotation0
    | Rotation90
    | Rotation180
    | Rotation270
    | ...
}
```

**Function:** Image rotation angle.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<ImageRotation>
- ToString

### Rotation0

```cangjie
Rotation0
```

**Function:** Rotates the image by 0 degrees.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Rotation180

```cangjie
Rotation180
```

**Function:** Rotates the image by 180 degrees.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Rotation270

```cangjie
Rotation270
```

**Function:** Rotates the image by 270 degrees.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Rotation90

```cangjie
Rotation90
```

**Function:** Rotates the image by 90 degrees.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(ImageRotation)

```cangjie
public operator func !=(other: ImageRotation): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ImageRotation](#enum-imagerotation) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(ImageRotation)

```cangjie
public operator func ==(other: ImageRotation): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ImageRotation](#enum-imagerotation) | Yes | - | Another enum value. |

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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum MetadataObjectType

```cangjie
public enum MetadataObjectType <: Equatable<MetadataObjectType> & ToString {
    | FaceDetection
    | ...
}
```

**Function:** Metadata stream.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<MetadataObjectType>
- ToString

### FaceDetection

```cangjie
FaceDetection
```

**Function:** Metadata object type for face detection. Detection points should be within the 0-1 coordinate system, where the top-left corner is (0.0, 0.0) and the bottom-right corner is (1.0, 1.0). This coordinate system is based on the horizontal device orientation when the charging port is on the right side. For example, if the application's preview interface layout is based on the vertical orientation when the charging port is at the bottom, with layout dimensions (w, h), and the returned point is (x, y), the converted coordinate point would be (1.0-y, x).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(MetadataObjectType)

```cangjie
public operator func !=(other: MetadataObjectType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MetadataObjectType](#enum-metadataobjecttype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(MetadataObjectType)

```cangjie
public operator func ==(other: MetadataObjectType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MetadataObjectType](#enum-metadataobjecttype) | Yes | - | Another enum value. |

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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum PreconfigRatio

```cangjie
public enum PreconfigRatio <: Equatable<PreconfigRatio> & ToString {
    | PreconfigRatio_1_1
    | PreconfigRatio_4_3
    | PreconfigRatio_16_9
    | ...
}
```

**Function:** Provides preconfigured resolution ratios.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<PreconfigRatio>
- ToString

### PreconfigRatio_16_9

```cangjie
PreconfigRatio_16_9
```

**Function:** 16:9 aspect ratio.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### PreconfigRatio_1_1

```cangjie
PreconfigRatio_1_1
```

**Function:** 1:1 aspect ratio.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### PreconfigRatio_4_3

```cangjie
PreconfigRatio_4_3
```

**Function:** 4:3 aspect ratio.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(PreconfigRatio)

```cangjie
public operator func !=(other: PreconfigRatio): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PreconfigRatio](#enum-preconfigratio) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are unequal, otherwise returns false. |

### func ==(PreconfigRatio)

```cangjie
public operator func ==(other: PreconfigRatio): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |## enum PreconfigType

```cangjie
public enum PreconfigType <: Equatable<PreconfigType> & ToString {
    | Preconfig720p
    | Preconfig1080p
    | Preconfig4k
    | PreconfigHighQuality
    | ...
}
```

**Function:** Provides preconfiguration types.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<PreconfigType>
- ToString

### Preconfig1080p

```cangjie
Preconfig1080p
```

**Function:** 1080P preconfiguration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Preconfig4k

```cangjie
Preconfig4k
```

**Function:** 4K preconfiguration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Preconfig720p

```cangjie
Preconfig720p
```

**Function:** 720P preconfiguration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### PreconfigHighQuality

```cangjie
PreconfigHighQuality
```

**Function:** High-quality preconfiguration.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(PreconfigType)

```cangjie
public operator func !=(other: PreconfigType): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
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

**Parameters:**

| Parameter | Type | Required | Default | Description |
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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum QualityLevel

```cangjie
public enum QualityLevel <: Equatable<QualityLevel> & ToString {
    | QualityLevelHigh
    | QualityLevelMedium
    | QualityLevelLow
    | ...
}
```

**Function:** Image quality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<QualityLevel>
- ToString

### QualityLevelHigh

```cangjie
QualityLevelHigh
```

**Function:** High image quality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### QualityLevelLow

```cangjie
QualityLevelLow
```

**Function:** Poor image quality.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### QualityLevelMedium

```cangjie
QualityLevelMedium
```

**Function:** Medium image quality.

**System Capability:** SystemCapability.MMultimedia.Camera.Core

**Since:** 21

### func !=(QualityLevel)

```cangjie
public operator func !=(other: QualityLevel): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
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

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [QualityLevel](#enum-qualitylevel) | Yes | - | Another enum value. |

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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

9

```cangjie
public enum SceneMode <: Equatable<SceneMode> & ToString {
    | NormalPhoto
    | NormalVideo
    | SecurePhoto
    | ...
}
```

**Function:** Camera-supported modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<SceneMode>
- ToString

### NormalPhoto

```cangjie
NormalPhoto
```

**Function:** Normal photo mode. For details, see [PhotoSession](#class-photosession).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### NormalVideo

```cangjie
NormalVideo
```

**Function:** Normal video mode. For details, see [VideoSession](#class-videosession).

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### SecurePhoto

```cangjie
SecurePhoto
```

**Function:** Secure camera mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(SceneMode)

```cangjie
public operator func !=(other: SceneMode): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SceneMode](#enum-scenemode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(SceneMode)

```cangjie
public operator func ==(other: SceneMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SceneMode](#enum-scenemode) | Yes | - | Another enum value. |

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

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum SmoothZoomMode

```cangjie
public enum SmoothZoomMode <: Equatable<SmoothZoomMode> & ToString {
    | Normal
    | ...
}
```

**Function:** Smooth zoom modes.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<SmoothZoomMode>
- ToString

### Normal

```cangjie
Normal
```

**Function:** Bezier curve mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(SmoothZoomMode)

```cangjie
public operator func !=(other: SmoothZoomMode): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SmoothZoomMode](#enum-smoothzoommode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(SmoothZoomMode)

```cangjie
public operator func ==(other: SmoothZoomMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [SmoothZoomMode](#enum-smoothzoommode) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |## enum TorchMode

```cangjie
public enum TorchMode <: Equatable<TorchMode> & ToString {
    | Off
    | On
    | Auto
    | ...
}
```

**Description:** Flashlight mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<TorchMode>
- ToString

### Auto

```cangjie
Auto
```

**Description:** Automatic mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Off

```cangjie
Off
```

**Description:** Always-off mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### On

```cangjie
On
```

**Description:** Always-on mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(TorchMode)

```cangjie
public operator func !=(other: TorchMode): Bool
```

**Description:** Checks whether two enum values are unequal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[TorchMode](#enum-torchmode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal; returns false otherwise.|

### func ==(TorchMode)

```cangjie
public operator func ==(other: TorchMode): Bool
```

**Description:** Checks whether two enum values are equal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[TorchMode](#enum-torchmode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal; returns false otherwise.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Obtains the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum VideoCodecType

```cangjie
public enum VideoCodecType <: Equatable<VideoCodecType> & ToString {
    | Avc
    | Hevc
    | ...
}
```

**Description:** Video encoding type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<VideoCodecType>
- ToString

### Avc

```cangjie
Avc
```

**Description:** AVC video encoding type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Hevc

```cangjie
Hevc
```

**Description:** HEVC video encoding type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(VideoCodecType)

```cangjie
public operator func !=(other: VideoCodecType): Bool
```

**Description:** Checks whether two enum values are unequal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[VideoCodecType](#enum-videocodectype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal; returns false otherwise.|

### func ==(VideoCodecType)

```cangjie
public operator func ==(other: VideoCodecType): Bool
```

**Description:** Checks whether two enum values are equal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[VideoCodecType](#enum-videocodectype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal; returns false otherwise.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Obtains the value of the enum.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum VideoStabilizationMode

```cangjie
public enum VideoStabilizationMode <: Equatable<VideoStabilizationMode> & ToString {
    | Off
    | Low
    | Middle
    | High
    | Auto
    | ...
}
```

**Description:** Video stabilization mode.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

**Parent Types:**

- Equatable\<VideoStabilizationMode>
- ToString

### Auto

```cangjie
Auto
```

**Description:** Automatic selection.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### High

```cangjie
High
```

**Description:** Uses the stabilization algorithm with the best stabilization effect, which is better than the MIDDLE type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Low

```cangjie
Low
```

**Description:** Disables the video stabilization function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Middle

```cangjie
Middle
```

**Description:** Uses the stabilization algorithm with moderate stabilization effect, which is better than the LOW type.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### Off

```cangjie
Off
```

**Description:** Disables the video stabilization function.

**System Capability:** SystemCapability.Multimedia.Camera.Core

**Since:** 21

### func !=(VideoStabilizationMode)

```cangjie
public operator func !=(other: VideoStabilizationMode): Bool
```

**Description:** Checks whether two enum values are unequal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[VideoStabilizationMode](#enum-videostabilizationmode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are unequal; returns false otherwise.|

### func ==(VideoStabilizationMode)

```cangjie
public operator func ==(other: VideoStabilizationMode): Bool
```

**Description:** Checks whether two enum values are equal.

**Parameters:**

|Name|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[VideoStabilizationMode](#enum-videostabilizationmode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the two enum values are equal; returns false otherwise.|

### func toString()

```cangjie
public func toString(): String
```

**Description:** Obtains the value of the enum.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|