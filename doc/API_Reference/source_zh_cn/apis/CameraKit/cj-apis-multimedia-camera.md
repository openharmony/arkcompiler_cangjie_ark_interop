# ohos.multimedia.camera（相机管理）

本模块为开发者提供一套简单且易于理解的相机服务接口，开发者通过调用接口可以开发相机应用。应用通过访问和操作相机硬件，实现基础操作，如预览、拍照和录像；还可以通过接口组合完成更多操作，如控制闪光灯和曝光时间、对焦或调焦等。

## 导入模块

```cangjie
import kit.CameraKit.*
```

## 权限列表

ohos.permission.CAMERA

ohos.permission.MICROPHONE

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getCameraManager(UIAbilityContext)

```cangjie
public func getCameraManager(context: UIAbilityContext): CameraManager
```

**功能：** 获取相机管理器实例。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext)|是|-|应用上下文。|

**返回值：**

|类型|说明|
|:----|:----|
|[CameraManager](#class-cameramanager)|相机管理器。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  |:---|:---|
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400201                |  Camera service fatal error.                                  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设备自动曝光（AE）操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [AutoExposureQuery](#interface-autoexposurequery)

### func getExposureMode()

```cangjie
func getExposureMode(): ExposureMode
```

**功能：** 获取当前曝光模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ExposureMode](#enum-exposuremode)|当前曝光模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
AppLog.info(photoSession.getOrThrow().getExposureMode())
```

### func getExposureValue()

```cangjie
func getExposureValue(): Float32
```

**功能：** 查询当前曝光值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float32|曝光值。曝光补偿存在步长，如步长为0.5。则设置1.2时，获取到实际生效曝光补偿为1.0。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
AppLog.info(photoSession.getOrThrow().getExposureValue())
```

### func getMeteringPoint()

```cangjie
func getMeteringPoint(): Point
```

**功能：** 查询曝光区域中心点。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Point](#struct-point)|当前曝光点。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
let photoSession = session as PhotoSession
let point = photoSession.getOrThrow().getMeteringPoint()
```

### func setExposureBias(Float32)

```cangjie
func setExposureBias(exposureBias: Float32): Unit
```

**功能：** 设置曝光补偿，曝光补偿值（EV）。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|exposureBias|Float32|是|-|曝光补偿，[getExposureBiasRange](#func-getexposurebiasrange)查询支持的范围，如果设置超过支持范围的值，自动匹配到就近临界点。曝光补偿存在步长，如步长为0.5。则设置1.2时，获取到实际生效曝光补偿为1.0。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400102|Operation not allowed.|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置曝光模式。进行设置之前，需要先检查设备是否支持指定的曝光模式，可使用方法[isExposureModeSupported](#func-isexposuremodesupportedexposuremode)。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|aeMode|[ExposureMode](#enum-exposuremode)|是|-|曝光模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询曝光区域中心点。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|point|[Point](#struct-point)|是|-|当前曝光点。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供了设备自动曝光特性查询功能。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func getExposureBiasRange()

```cangjie
func getExposureBiasRange(): Array<Float32>
```

**功能：** 查询曝光补偿范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float32>|补偿范围的数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 检测是否支持曝光模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|aeMode|[ExposureMode](#enum-exposuremode)|是|-|曝光模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|是否支持曝光模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 会话中Session使用的输出信息，output的基类。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func release()

```cangjie
func release(): Unit
```

**功能：** 释放输出资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 用于管理色彩空间参数。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [ColorManagementQuery](#interface-colormanagementquery)

### func getActiveColorSpace()

```cangjie
func getActiveColorSpace(): ColorSpace
```

**功能：** 获取当前设置的色彩空间。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)|当前设置的色彩空间。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置色彩空间。可以先通过[getSupportedColorSpaces](#func-getsupportedcolorspaces)获取当前设备所支持的ColorSpaces。

应用可以下发不同的色彩空间（[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)）参数来支持P3广色域以及HDR高动态范围成像的功能。

当应用不主动设置色彩空间时，拍照以及录像模式默认为HDR拍摄效果。

在拍照模式下设置HDR高显效果可直接支持P3色域。

应用针对不同模式使能HDR效果以及设置的色彩空间可参考下表。

表1：录像模式

|SDR/HRD拍摄|CameraFormat|ColorSpace|
|:---|:---|:---|
|SDR|CAMERA_FORMAT_YUV_420_SP|BT709_LIMIT|
|HDR_VIVID(Default)|CAMERA_FORMAT_YCRCB_P010|BT2020_HLG_LIMIT|

表2：拍照模式

|SDR/HRD拍摄|ColorSpace|
|:---|:---|
|SDR|SRGB|
|HDR_VIVID(Default)|DISPLAY_P3|

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorSpace|[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)|是|-|色彩空间，通过[getSupportedColorSpaces](#func-getsupportedcolorspaces)接口获取。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400101|Parameter missing or parameter type incorrect.|
  |7400102|The colorSpace does not match the format.|
  |7400103|Session not config.|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 用于查询色彩空间参数。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func getSupportedColorSpaces()

```cangjie
func getSupportedColorSpaces(): Array<ColorSpace>
```

**功能：** 获取支持的色彩空间列表。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[ColorSpace](../ArkGraphics2D/cj-apis-color_manager.md#enum-colorspace)>|支持的色彩空间列表。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设备闪光灯操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [FlashQuery](#interface-flashquery)

### func getFlashMode()

```cangjie
func getFlashMode(): FlashMode
```

**功能：** 获取当前设备的闪光灯模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FlashMode](#enum-flashmode)|当前设备的闪光灯模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置闪光灯模式。

进行设置之前，需要先检查：

1. 设备是否支持闪光灯，可使用方法[hasFlash](#func-hasflash)判断。
2. 设备是否支持指定的闪光灯模式，可使用方法[isFlashModeSupported](#func-isflashmodesupportedflashmode)判断。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|flashMode|[FlashMode](#enum-flashmode)|是|-|指定闪光灯模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供了查询设备的闪光灯状态和模式的能力。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func hasFlash()

```cangjie
func hasFlash(): Bool
```

**功能：** 检测是否有闪光灯。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示设备支持闪光灯，false表示不支持。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 检测是否支持指定的闪光灯模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|flashMode|[FlashMode](#enum-flashmode)|是|-|指定闪光灯模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示支持该闪光灯模式，false表示不支持。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设备对焦操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [FocusQuery](#interface-focusquery)

### func getFocalLength()

```cangjie
func getFocalLength(): Float32
```

**功能：** 查询焦距值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float32|用于获取当前焦距，单位mm。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前的对焦模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FocusMode](#enum-focusmode)|当前设备的焦距模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询焦点。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Point](#struct-point)|当前焦点。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置对焦模式。

进行设置之前，需要先检查设备是否支持指定的焦距模式，可使用方法[isFocusModeSupported](#func-isfocusmodesupportedfocusmode)。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|afMode|[FocusMode](#enum-focusmode)|是|-|指定的焦距模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置焦点，焦点应在0-1坐标系内，该坐标系左上角为{0.0，0.0}，右下角为{1.0，1.0}。

此坐标系是以设备充电口在右侧时的横向设备方向为基准的，例如应用的预览界面布局以设备充电口在下侧时的竖向方向为基准，布局宽高为{w，h}，且触碰点为{x，y}，则转换后的坐标点为{y/h，1-x/w}。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|point|[Point](#struct-point)|是|-|焦点。x、y设置范围应在[0.0, 1.0]之内，超过范围，如果小于0.0设置0.0，大于1.0设置1.0。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供了查询是否支持指定对焦模式的方法。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func isFocusModeSupported(FocusMode)

```cangjie
func isFocusModeSupported(afMode: FocusMode): Bool
```

**功能：** 检测对焦模式是否支持。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|afMode|[FocusMode](#enum-focusmode)|是|-|指定的焦距模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示支持该焦距模式，false表示不支持。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 会话类型，保存一次相机运行所需要的所有资源[CameraInput](#class-camerainput)、[CameraOutput](#interface-cameraoutput)，并向相机设备申请完成相机功能（录像，拍照）。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func addInput(CameraInput)

```cangjie
func addInput(cameraInput: CameraInput): Unit
```

**功能：** 把[CameraInput](#class-camerainput)加入到会话。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|是|-|需要添加的CameraInput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 把[CameraOutput](#interface-cameraoutput)加入到会话。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|是|-|需要添加的CameraOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 开始配置会话。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400105                |  Session config locked.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.beginConfig()
```

### func canAddInput(CameraInput)

```cangjie
func canAddInput(cameraInput: CameraInput): Bool
```

**功能：** 判断当前cameraInput是否可以添加到session中

该方法在[beginConfig](#func-beginconfig)和[commitConfig](#func-commitconfig)之间调用才能生效。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|是|-|需要添加的CameraInput实例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示支持添加当前cameraInput，返回false表示不支持添加。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 判断当前cameraOutput是否可以添加到session中。

该方法在[beginConfig](#func-beginconfig)和[commitConfig](#func-commitconfig)之间调用才能生效。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|是|-|需要添加的CameraOutput实例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|是否可以添加当前cameraOutput到session中。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提交配置信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400102                |  Operation not allowed.                                  |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.commitConfig()
```

### func release()

```cangjie
func release(): Unit
```

**功能：** 释放会话资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.release()
```

### func removeInput(CameraInput)

```cangjie
func removeInput(cameraInput: CameraInput): Unit
```

**功能：** 从会话中移除指定的CameraInput。

该方法在[beginConfig](#func-beginconfig)和[commitConfig](#func-commitconfig)之间调用才能生效。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraInput|[CameraInput](#class-camerainput)|是|-|需要移除的CameraInput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 从会话中移除指定的CameraOutput。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cameraOutput|[CameraOutput](#interface-cameraoutput)|是|-|需要移除的CameraOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400102                |  Operation not allowed.                                  |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 开始会话工作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400102                |  Operation not allowed.                                |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let session = cameraManager.createSession(SceneMode.NORMAL_PHOTO)
session.start()
```

### func stop()

```cangjie
func stop(): Unit
```

**功能：** 停止会话工作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供设备在录像模式下视频防抖的相关操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [StabilizationQuery](#interface-stabilizationquery)

### func getActiveVideoStabilizationMode()

```cangjie
func getActiveVideoStabilizationMode(): VideoStabilizationMode
```

**功能：** 查询当前正在使用的视频防抖模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[VideoStabilizationMode](#enum-videostabilizationmode)|视频防抖是否正在使用。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置视频防抖模式。需要先检查设备是否支持对应的防抖模式，可以通过[isVideoStabilizationModeSupported](#func-isvideostabilizationmodesupportedvideostabilizationmode)方法判断所设置的模式是否支持。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mode|[VideoStabilizationMode](#enum-videostabilizationmode)|是|-|需要设置的视频防抖模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供查询设备在录像模式下是否支持对应的视频防抖模式的能力。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func isVideoStabilizationModeSupported(VideoStabilizationMode)

```cangjie
func isVideoStabilizationModeSupported(vsMode: VideoStabilizationMode): Bool
```

**功能：** 查询是否支持指定的视频防抖模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|vsMode|[VideoStabilizationMode](#enum-videostabilizationmode)|是|-|视频防抖模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回视频防抖模式是否支持，true表示支持，false表示不支持。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config, only throw in session usage.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设备变焦（缩放）操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [ZoomQuery](#interface-zoomquery)

### func getZoomRatio()

```cangjie
func getZoomRatio(): Float32
```

**功能：** 获取当前的变焦比。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float32|当前的变焦比结果。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 触发平滑变焦。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|targetRatio|Float32|是|-|目标值。|
|mode|[SmoothZoomMode](#enum-smoothzoommode)|是|-|模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 触发平滑变焦。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|targetRatio|Float32|是|-|目标值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置变焦比，变焦精度最高为小数点后两位，如果设置超过支持的精度范围，则只保留精度范围内数值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|zoomRatio|Float32|是|-|可变焦距比，通过[getZoomRatioRange](#func-getzoomratiorange)获取支持的变焦范围，如果设置超过支持范围的值，则只保留精度范围内数值。设置可变焦距比到底层生效需要一定时间，获取正确设置的可变焦距比需要等待1~2帧的时间。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供了与设备缩放能力相关的查询功能，包括获取支持的缩放比例范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func getZoomRatioRange()

```cangjie
func getZoomRatioRange(): Array<Float32>
```

**功能：** 获取支持的变焦范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Float32>|用于获取可变焦距比范围，返回的数组包括其最小值和最大值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相机设备信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let cameraId

```cangjie
public let cameraId: String
```

**功能：** 相机id。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let cameraOrientation

```cangjie
public let cameraOrientation: UInt32
```

**功能：** 镜头的安装角度，不会随着屏幕旋转而改变，取值范围为0-360。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let cameraPosition

```cangjie
public let cameraPosition: CameraPosition
```

**功能：** 相机位置。

**类型：** [CameraPosition](#enum-cameraposition)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let cameraType

```cangjie
public let cameraType: CameraType
```

**功能：** 相机类型。

**类型：** [CameraType](#enum-cameratype)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let connectionType

```cangjie
public let connectionType: ConnectionType
```

**功能：** 相机连接类型。

**类型：** [ConnectionType](#enum-connectiontype)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## class CameraInput

```cangjie
public class CameraInput {}
```

**功能：** 相机设备输入对象。会话中Session使用的相机信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 关闭相机。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                                  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.close()
```

### func off(CameraCallbackType, CameraDevice, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 注销监听CameraInput的错误事件。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，CameraInput对象创建成功可监听。相机设备出错情况下可触发该事件并返回结果，比如设备不可用或者冲突等返回对应错误信息。|
|camera|[CameraDevice](#struct-cameradevice)|是|-|CameraDevice对象。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|
|camera|[CameraDevice](#struct-cameradevice)|是|-|CameraDevice对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.off(CameraCallbackType.CameraError, cameraDevice)
```

### func on(CameraCallbackType, CameraDevice, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, camera: CameraDevice, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 监听CameraInput的错误事件，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，CameraInput对象创建成功可监听。相机设备出错情况下可触发该事件并返回结果，比如设备不可用或者冲突等返回对应错误信息。|
|camera|[CameraDevice](#struct-cameradevice)|是|-|CameraDevice对象。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取结果。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 打开相机。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400107                |  Can not use camera cause of conflict.               |
  | 7400108                |  Camera disabled cause of security reason.                                  |
  | 7400201                |  Camera service fatal error.                                  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let cameraInput = cameraManager.createCameraInput(cameraDevice)
cameraInput.open()
```

### func open(Bool)

```cangjie
public func open(isSecureEnabled: Bool): UInt64
```

**功能：** 打开相机，获取安全相机的句柄。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isSecureEnabled|Bool|是|-|是否以安全的方式打开相机。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt64|打开相机的句柄。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400107                |  Can not use camera cause of conflict.               |
  | 7400108                |  Camera disabled cause of security reason.                                  |
  | 7400201                |  Camera service fatal error.                                  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相机管理器类，使用前需要通过[getCameraManager](#func-getcameramanagerabilitycontext)获取相机管理实例。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### func createCameraInput(CameraDevice)

```cangjie
public func createCameraInput(camera: CameraDevice): CameraInput
```

**功能：** 使用CameraDevice对象创建CameraInput实例。

**需要权限：** ohos.permission.CAMERA

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|camera|[CameraDevice](#struct-cameradevice)|是|-|CameraDevice对象，通过[getSupportedCameras](#func-getsupportedcameras)接口获取。|

**返回值：**

|类型|说明|
|:----|:----|
|[CameraInput](#class-camerainput)|CameraInput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400102                |  Operation not allowed.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraInput = cameraManager.createCameraInput(cameraDevices[0])
```

### func createCameraInput(CameraPosition, CameraType)

```cangjie
public func createCameraInput(position: CameraPosition, `type`: CameraType): CameraInput
```

**功能：** 根据相机位置和类型创建CameraInput实例。

**需要权限：** ohos.permission.CAMERA

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|position|[CameraPosition](#enum-cameraposition)|是|-|相机位置，通过[getSupportedCameras](#func-getsupportedcameras)接口获取设备，然后获取设备位置信息。|
|\`type\`|[CameraType](#enum-cameratype)|是|-|相机类型，通过[getSupportedCameras](#func-getsupportedcameras)接口获取设备，然后获取设备类型信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[CameraInput](#class-camerainput)|CameraInput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400102                |  Operation not allowed.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 创建metadata流输出对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|metadataObjectTypes|Array\<[MetadataObjectType](#enum-metadataobjecttype)>|是|-|metadata流类型信息，通过[getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode)接口获取。|

**返回值：**

|类型|说明|
|:----|:----|
|[MetadataOutput](#class-metadataoutput)|MetadataOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let metadataObjectTypes = [MetadataObjectType.FACE_DETECTION]
let metadataOutput = cameraManager.createMetadataOutput(metadataObjectTypes)
```

### func createPhotoOutput()

```cangjie
public func createPhotoOutput(): PhotoOutput
```

**功能：** 创建拍照输出对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoOutput](#class-photooutput)|PhotoOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID    | 错误信息                                           |
  |:---------|:-----------------------------------------------|
  | 7400101  | Parameter missing or parameter type incorrect. |
  | 7400201  | Camera service fatal error.                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let cameraInput = cameraManager.createCameraInput(cameraDevices[0])
let photoOutput = cameraManager.createPhotoOutput()
```

### func createPhotoOutput(Profile)

```cangjie
public func createPhotoOutput(profile: Profile): PhotoOutput
```

**功能：** 创建拍照输出对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|profile|[Profile](#class-profile)|是|-|支持的拍照配置信息，通过[getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode)接口获取。|

**返回值：**

|类型|说明|
|:----|:----|
|[PhotoOutput](#class-photooutput)|PhotoOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID    | 错误信息                                           |
  |:---------|:-----------------------------------------------|
  | 7400101  | Parameter missing or parameter type incorrect. |
  | 7400201  | Camera service fatal error.                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)[0]
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(camera, mode)
let profile = cameraOutputCapability.photoProfiles[0]
let photoOutput  = cameraManager.createPhotoOutput(profile)
```

### func createPreviewOutput(Profile, String)

```cangjie
public func createPreviewOutput(profile: Profile, surfaceId: String): PreviewOutput
```

**功能：** 创建预览输出对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|profile|[Profile](#class-profile)|是|-|支持的预览配置信息，通过[getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode)接口获取。|
|surfaceId|String|是|-|从XComponent或者[ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver)组件获取的surfaceId。|

**返回值：**

|类型|说明|
|:----|:----|
|[PreviewOutput](#class-previewoutput)|PreviewOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 创建无配置信息的预览输出对象。该接口需配合[preconfig](#func-preconfigpreconfigtype-preconfigratio)一起使用。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|surfaceId|String|是|-|从XComponent或者[ImageReceiver](../ImageKit/cj-apis-image.md#class-imagereceiver)组件获取的surfaceId。|

**返回值：**

|类型|说明|
|:----|:----|
|[PreviewOutput](#class-previewoutput)|PreviewOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID   | 错误信息                                           |
  |:--------|:-----------------------------------------------|
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400201 | Camera service fatal error.                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let previewOutput = cameraManager.createPreviewOutput(surfaceId)
```

### func createSession(SceneMode)

```cangjie
public func createSession(mode: SceneMode): Session
```

**功能：** 创建指定SceneMode的Session实例。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mode|[SceneMode](#enum-scenemode)|是|-|相机支持的模式。|

**返回值：**

|类型|说明|
|:----|:----|
|[Session](#interface-session)|Session实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息                                                                                 |
  | :-------------- |:----------------------------------------------------------------------------------------|
  | 401     | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3.Parameter verification failed. |
  | 7400201                | Camera service fatal error.                                                                                                                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 创建录像输出对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|profile|[VideoProfile](#class-videoprofile)|是|-|支持的录像配置信息，通过[getSupportedOutputCapability](#func-getsupportedoutputcapabilitycameradevice-scenemode)接口获取。|
|surfaceId|String|是|-|从AVRecorder获取的surfaceId。|

**返回值：**

|类型|说明|
|:----|:----|
|[VideoOutput](#class-videooutput)|VideoOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.               |
  | 7400201                |  Camera service fatal error.               |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevice = cameraManager.getSupportedCameras()[0]
let mode = cameraManager.getSupportedSceneModes(cameraDevice)[1]
let cameraOutputCapability = cameraManager.getSupportedOutputCapability(cameraDevice, mode)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let videoOutput = cameraManager.createVideoOutput(cameraOutputCapability.videoProfiles[0],
    surfaceId)
```

### func createVideoOutput(String)

```cangjie
public func createVideoOutput(surfaceId: String): VideoOutput
```

**功能：** 创建无配置信息的录像输出对象。该接口需配合[preconfig](#func-preconfigpreconfigtype-preconfigratio)功能一起使用。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|surfaceId|String|是|-|从AVRecorder获取的surfaceId。|

**返回值：**

|类型|说明|
|:----|:----|
|[VideoOutput](#class-videooutput)|VideoOutput实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID    | 错误信息                                           |
  |:---------|:-----------------------------------------------|
  | 7400101  | Parameter missing or parameter type incorrect. |
  | 7400201  | Camera service fatal error.                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let surfaceId: String = receiver.getReceivingSurfaceId()
let videoOutput = cameraManager.createVideoOutput(surfaceId)
```

### func getSupportedCameras()

```cangjie
public func getSupportedCameras(): Array<CameraDevice>
```

**功能：** 获取支持指定的相机设备对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[CameraDevice](#struct-cameradevice)>|相机设备列表。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
```

### func getSupportedOutputCapability(CameraDevice, SceneMode)

```cangjie
public func getSupportedOutputCapability(camera: CameraDevice, mode: SceneMode): CameraOutputCapability
```

**功能：** 查询相机设备在模式下支持的输出能力。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|camera|[CameraDevice](#struct-cameradevice)|是|-|相机设备，通过[getSupportedCameras](#func-getsupportedcameras)接口获取。|
|mode|[SceneMode](#enum-scenemode)|是|-|相机模式，通过[getSupportedSceneModes](#func-getsupportedscenemodescameradevice)接口获取。|

**返回值：**

|类型|说明|
|:----|:----|
|[CameraOutputCapability](#struct-cameraoutputcapability)|相机输出能力。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取指定的相机设备对象支持的模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|camera|[CameraDevice](#struct-cameradevice)|是|-|相机设备，通过[getSupportedCameras](#func-getsupportedcameras)接口获取。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[SceneMode](#enum-scenemode)>|相机支持的模式列表。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let cameraDevices = cameraManager.getSupportedCameras()
let camera = cameraDevices[0]
let mode = cameraManager.getSupportedSceneModes(camera)
```

### func getTorchMode()

```cangjie
public func getTorchMode(): TorchMode
```

**功能：** 获取当前设备手电筒模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[TorchMode](#enum-torchmode)|返回设备当前手电筒模式。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
```

### func isCameraMuted()

```cangjie
public func isCameraMuted(): Bool
```

**功能：** 查询相机当前的禁用状态（禁用/未禁用）。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示相机被禁用，返回false表示相机未被禁用。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
AppLog.info(cameraManager.isCameraMuted())
```

### func isTorchModeSupported(TorchMode)

```cangjie
public func isTorchModeSupported(torchMode: TorchMode): Bool
```

**功能：** 检测是否支持设置的手电筒模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|torchMode|[TorchMode](#enum-torchmode)|是|-|手电筒模式。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示设备支持设置的手电筒模式。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let torchMode = cameraManager.getTorchMode()
AppLog.info(cameraManager.isTorchModeSupported(torchMode))
```

### func isTorchSupported()

```cangjie
public func isTorchSupported(): Bool
```

**功能：** 检测设备是否支持手电筒。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回true表示设备支持手电筒。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
AppLog.info(cameraManager.isTorchSupported())
```

### func off(CameraCallbackType, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**功能：** 相机设备状态注销回调，通过注销回调函数以取消获取相机的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为cameraStatus。cameraManager对象获取成功后可监听。目前只支持对设备打开或者关闭会触发该事件并返回对应信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#struct-camerastatusinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackCameraStatus <: Callback1Argument<CameraStatusInfo> {
    public init() {}
    public open func invoke(res: CameraStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CameraStatus. CameraDevice: ${res.camera.cameraId}, CameraStatus: ${res.status}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackCameraStatus = TestCallbackCameraStatus()
cameraManager.off(CameraCallbackType.CameraStatus, testCallbackCameraStatus)
```

### func off(CameraCallbackType, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**功能：** 关闭折叠设备折叠状态变化的监听。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为foldStatusChange。表示折叠设备折叠状态发生变化。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#struct-foldstatusinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackFoldStatusChange <: Callback1Argument<FoldStatusInfo> {
    public init() {}
    public open func invoke(res: FoldStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FoldStatusChange.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackFoldStatusChange = TestCallbackFoldStatusChange()
cameraManager.off(CameraCallbackType.FoldStatusChange, testCallbackFoldStatusChange)
```

### func off(CameraCallbackType, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**功能：** 手电筒状态变化注销回调，通过注销回调函数以取消获取手电筒状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为torchStatusChange。cameraManager对象获取成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#struct-torchstatusinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.off(CameraCallbackType.TorchStatusChange, testCallbackTorchStatusChange)
```

### func off(CameraCallbackType)

```cangjie
public func off(`type`: CameraCallbackType): Unit
```

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
cameraManager.off(CameraCallbackType.TorchStatusChange)
```

### func on(CameraCallbackType, Callback1Argument\<CameraStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<CameraStatusInfo>): Unit
```

**功能：** 相机设备状态回调，通过注册回调函数获取相机的状态变化。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为cameraStatus。cameraManager对象获取成功后可监听。目前只支持对设备打开或者关闭会触发该事件并返回对应信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CameraStatusInfo](#struct-camerastatusinfo)>|是|-|回调函数，用于获取镜头状态变化信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackCameraStatus <: Callback1Argument<CameraStatusInfo> {
    public init() {}
    public open func invoke(res: CameraStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CameraStatus. CameraDevice: ${res.camera.cameraId}, CameraStatus: ${res.status}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackCameraStatus = TestCallbackCameraStatus()
cameraManager.on(CameraCallbackType.CameraStatus, testCallbackCameraStatus)
```

### func on(CameraCallbackType, Callback1Argument\<FoldStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<FoldStatusInfo>): Unit
```

**功能：** 开启折叠设备折叠状态变化的监听。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为foldStatusChange。表示折叠设备折叠状态发生变化。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FoldStatusInfo](#struct-foldstatusinfo)>|是|-|回调函数。返回折叠设备折叠信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackFoldStatusChange <: Callback1Argument<FoldStatusInfo> {
    public init() {}
    public open func invoke(res: FoldStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FoldStatusChange.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackFoldStatusChange = TestCallbackFoldStatusChange()
cameraManager.on(CameraCallbackType.FoldStatusChange, testCallbackFoldStatusChange)
```

### func on(CameraCallbackType, Callback1Argument\<TorchStatusInfo>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<TorchStatusInfo>): Unit
```

**功能：** 手电筒状态变化回调，通过注册回调函数获取手电筒状态变化。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为torchStatusChange。cameraManager对象获取成功后可监听。目前只支持手电筒打开，手电筒关闭，手电筒不可用，手电筒恢复可用会触发该事件并返回对应信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[TorchStatusInfo](#struct-torchstatusinfo)>|是|-|回调函数，用于获取手电筒状态变化信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackTorchStatusChange <: Callback1Argument<TorchStatusInfo> {
    public init() {}
    public open func invoke(res: TorchStatusInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke TorchStatusChange. isTorchAvailable: ${res.isTorchAvailable}, isTorchActive: ${res.isTorchActive}, torchLevel:${res.torchLevel}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let testCallbackTorchStatusChange = TestCallbackTorchStatusChange()
cameraManager.on(CameraCallbackType.TorchStatusChange, testCallbackTorchStatusChange)
```

### func setTorchMode(TorchMode)

```cangjie
public func setTorchMode(torchMode: TorchMode): Unit
```

**功能：** 设置设备手电筒模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|torchMode|[TorchMode](#enum-torchmode)|是|-|手电筒模式。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101 | Parameter missing or parameter type incorrect. |
  | 7400102 | Operation not allowed. |
  | 7400201 | Camera service fatal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相机输出能力项。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let photoProfiles

```cangjie
public let photoProfiles: Array<Profile>
```

**功能：** 支持的拍照配置信息集合。

**类型：** Array\<[Profile](#class-profile)>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let previewProfiles

```cangjie
public let previewProfiles: Array<Profile>
```

**功能：** 支持的预览配置信息集合。

**类型：** Array\<[Profile](#class-profile)>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let supportedMetadataObjectTypes

```cangjie
public let supportedMetadataObjectTypes: Array<MetadataObjectType>
```

**功能：** 支持的metadata流类型信息集合。

**类型：** Array\<[MetadataObjectType](#enum-metadataobjecttype)>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let videoProfiles

```cangjie
public let videoProfiles: Array<VideoProfile>
```

**功能：** 支持的录像配置信息集合。

**类型：** Array\<[VideoProfile](#class-videoprofile)>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## class MetadataObject

```cangjie
public class MetadataObject {
    public let `type`: MetadataObjectType
    public let timestamp: Int32
    public let boundingBox: Rect
}
```

**功能：** 相机元能力信息，CameraInput相机信息中的数据来源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let \`type\`

```cangjie
public let `type`: MetadataObjectType
```

**功能：** metadata 类型。

**类型：** [MetadataObjectType](#enum-metadataobjecttype)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let boundingBox

```cangjie
public let boundingBox: Rect
```

**功能：** metadata 区域框。

**类型：** [Rect](#struct-rect)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let timestamp

```cangjie
public let timestamp: Int32
```

**功能：** 当前时间戳（毫秒）。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## class MetadataOutput

```cangjie
public class MetadataOutput <: CameraOutput {}
```

**功能：** metadata流。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [CameraOutput](#interface-cameraoutput)

### func off(CameraCallbackType, Callback1Argument\<Array\<MetadataObject>>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<Array<MetadataObject>>): Unit
```

**功能：** 注销监听检测到的metadata对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为metadataObjectsAvailable，metadataOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[MetadataObject](#class-metadataobject)>>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback1Argument<Array<MetadataObject>> {
    public init() {}
    public open func invoke(res: Array<MetadataObject>): Unit {
        Hilog.info(0, "Camera", "Call invoke error.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听metadata流的错误。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，metadataOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听检测到的metadata对象，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为metadataObjectsAvailable，metadataOutput创建成功后可监听。检测到有效的metadata数据时触发该事件发生并返回相应的metadata数据。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[MetadataObject](#class-metadataobject)>>|是|-|回调函数，用于获取metadata数据。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback1Argument<Array<MetadataObject>> {
    public init() {}
    public open func invoke(res: Array<MetadataObject>): Unit {
        Hilog.info(0, "Camera", "Call invoke error.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听metadata流的错误，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，metadataOutput创建成功后可监听。metadata接口使用错误时触发该事件并返回对应错误码，比如调用start，CameraOutput.release接口时发生错误返回对应错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 释放输出资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 开始输出metadata。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 停止输出metadata。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 拍照会话中使用的输出信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [CameraOutput](#interface-cameraoutput)

### func capture()

```cangjie
public func capture(): Unit
```

**功能：** 以默认设置触发一次拍照。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400104                |  Session not running.                                  |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 以指定参数触发一次拍照。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|setting|[PhotoCaptureSetting](#struct-photocapturesetting)|是|-|拍照设置。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400104                |  Session not running.                                  |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 是否启用镜像拍照。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Bool|是|-|true为开启镜像拍照，false为关闭镜像拍照。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID    | 错误信息                                           |
  | :------- |:-----------------------------------------------|
  | 7400101  | Parameter missing or parameter type incorrect. |
  | 7400103  | Session not config.                    |
  | 7400201  | Camera service fatal error.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 使能动态照片拍照。

**需要权限：** ohos.permission.MICROPHONE

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enabled|Bool|是|-|true为开启动态照片，false为关闭动态照片。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID    | 错误信息                                           |
  | :------- |:-----------------------------------------------|
  | 201      | permission denied.                             |
  | 7400101  | Parameter missing or parameter type incorrect. |
  | 7400201  | Camera service fatal error.                    |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前生效的配置信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Profile](#class-profile)|当前生效的配置信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID   | 错误信息                         |
  |:--------|:-----------------------------|
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取拍照旋转角度。

- 设备自然方向：设备默认使用方向，手机为竖屏（充电口向下）。
- 相机镜头角度：值等于相机图像顺时针旋转到设备自然方向的角度，手机后置相机传感器是竖屏安装的，所以需要顺时针旋转90度到设备自然方向。
- 屏幕显示方向：需要屏幕显示的图片左上角为第一个像素点为坐标原点。锁屏时与自然方向一致。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceDegree|Int32|是|-|设备旋转角度。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageRotation](#enum-imagerotation)|拍照旋转角度。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID   | 错误信息                         |
  |:--------|:-----------------------------|
  | 7400101 | Parameter missing or parameter type incorrect.  |
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询支持的动态照片短视频编码类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[VideoCodecType](#enum-videocodectype)>|支持的动态照片短视频编码类型列表。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID        | 错误信息                      |
  | :-------------- | :--------------               |
  | 7400201         |  Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询是否支持镜像拍照。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回是否支持镜像拍照，true表示支持，false表示不支持。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询是否支持动态照片拍摄。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回是否支持动态照片拍照，true表示支持，false表示不支持。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID       | 错误信息       |
  | :------------- | :-------------- |
  | 7400201 |  Camera service fatal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听拍照。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureStartWithInfo，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#struct-capturestartinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureStartWithInfo <: Callback1Argument<CaptureStartInfo> {
    public init() {}
    public open func invoke(res: CaptureStartInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureStartWithInfo. captureId: ${res.captureId}, time： ${res.time}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听拍照帧输出捕获。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameShutter，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#struct-frameshutterinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackFrameShutter <: Callback1Argument<FrameShutterInfo> {
    public init() {}
    public open func invoke(res: FrameShutterInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutter. captureId: ${res.captureId}, timestamp： ${res.timestamp}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听拍照结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureEnd，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#struct-captureendinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureEnd <: Callback1Argument<CaptureEndInfo> {
    public init() {}
    public open func invoke(res: CaptureEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureEnd. captureId: ${res.captureId}, frameCount： ${res.frameCount}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听拍照帧输出捕获。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameShutterEnd，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#struct-frameshutterendinfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackFrameShutterEnd <: Callback1Argument<FrameShutterEndInfo> {
    public init() {}
    public open func invoke(res: FrameShutterEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutterEnd. captureId: ${res.captureId}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听可拍下一张。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureReady，photoOutput创建成功后可监听。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureReady <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureReady.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听预估的拍照时间。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为estimatedCaptureDuration，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Int32>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackEstimatedCaptureDuration <: Callback1Argument<Int32> {
    public init() {}
    public open func invoke(res: Int32): Unit {
        Hilog.info(0, "Camera", "Call invoke EstimatedCaptureDuration. time: ${res}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听拍照输出发生错误。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听拍照开始，通过注册回调函数获取[CaptureStartInfo](#struct-capturestartinfo)。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureStartWithInfo，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureStartInfo](#struct-capturestartinfo)>|是|-|回调函数，用于获取相关信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureStartWithInfo <: Callback1Argument<CaptureStartInfo> {
    public init() {}
    public open func invoke(res: CaptureStartInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureStartWithInfo. captureId: ${res.captureId}, time： ${res.time}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听拍照帧输出捕获，通过注册回调函数获取结果。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameShutter，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterInfo](#struct-frameshutterinfo)>|是|-|回调函数，用于获取相关信息。该回调返回意味着可以再次下发拍照请求。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackFrameShutter <: Callback1Argument<FrameShutterInfo> {
    public init() {}
    public open func invoke(res: FrameShutterInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutter. captureId: ${res.captureId}, timestamp： ${res.timestamp}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听拍照结束，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureEnd，photoOutput创建成功后可监听。拍照完全结束可触发该事件发生并返回相应信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[CaptureEndInfo](#struct-captureendinfo)>|是|-|回调函数，用于获取相关信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureEnd <: Callback1Argument<CaptureEndInfo> {
    public init() {}
    public open func invoke(res: CaptureEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureEnd. captureId: ${res.captureId}, frameCount： ${res.frameCount}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听拍照曝光结束捕获，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameShutterEnd，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FrameShutterEndInfo](#struct-frameshutterendinfo)>|是|-|回调函数，用于获取相关信息。该回调返回表示拍照曝光结束。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackFrameShutterEnd <: Callback1Argument<FrameShutterEndInfo> {
    public init() {}
    public open func invoke(res: FrameShutterEndInfo): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameShutterEnd. captureId: ${res.captureId}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听可拍下一张，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为captureReady，photoOutput创建成功后可监听。当下一张可拍时可触发该事件发生并返回相应信息。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackCaptureReady <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke CaptureReady.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听预估的拍照时间。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为estimatedCaptureDuration，photoOutput创建成功后可监听。拍照完全结束可触发该事件发生并返回相应信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Int32>|是|-|回调函数，用于获取预估的单次拍照底层出sensor采集帧时间，如果上报-1，代表没有预估时间。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackEstimatedCaptureDuration <: Callback1Argument<Int32> {
    public init() {}
    public open func invoke(res: Int32): Unit {
        Hilog.info(0, "Camera", "Call invoke EstimatedCaptureDuration. time: ${res}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听拍照输出发生错误，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，photoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 释放输出资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID   | 错误信息                         |
  |:--------|:-----------------------------|
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置动态照片短视频编码类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|codecType|[VideoCodecType](#enum-videocodectype)|是|-|动态照片短视频编码类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID        | 错误信息                      |
  | :-------------- | :--------------               |
  | 7400201         |  Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 普通拍照模式会话类，提供了对闪光灯、曝光、对焦、变焦、色彩空间的操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

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

**功能：** 查询当前Session是否支持指定的与配置类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|preconfigType|[PreconfigType](#enum-preconfigtype)|是|-|指定配置预期分辨率。|
|preconfigRatio|[PreconfigRatio](#enum-preconfigratio)|否|PRECONFIG_RATIO_4_3| **命名参数。** 可选画幅比例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true: 支持指定预配值类型。false: 不支持指定预配值类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
AppLog.info(session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9))
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 注销监听普通拍照会话的错误事件，通过注册回调函数获取结果。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听相机聚焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听相机平滑变焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.smoothZoomInfoAvailable，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听普通拍照会话的错误事件/相机聚焦的状态变化/相机平滑变焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error或CameraCallbackType.focusStateChange或CameraCallbackType.smoothZoomInfoAvailable。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
session.off(CameraCallbackType.FocusStateChange)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 监听普通拍照会话的错误事件，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。session调用相关接口出现错误时会触发该事件，比如调用beginConfig，commitConfig，addInput等接口发生错误时返回错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听相机聚焦的状态变化，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功可监听。仅当自动对焦模式时，且相机对焦状态发生改变时可触发该事件。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，用于获取当前对焦状态。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听相机平滑变焦的状态变化，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.smoothZoomInfoAvailable，session创建成功可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)>|是|-|回调函数，用于获取当前平滑变焦状态。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 对当前Session进行预配置。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|preconfigType|[PreconfigType](#enum-preconfigtype)|是|-|指定配置预期分辨率。|
|preconfigRatio|[PreconfigRatio](#enum-preconfigratio)|否|PreconfigRatio.PRECONFIG_RATIO_4_3| **命名参数。** 可选画幅比例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let photoSession = cameraManager.createSession(SceneMode.NORMAL_PHOTO) as PhotoSession
let session = photoSession.getOrThrow()
session.preconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

## class PreviewOutput

```cangjie
public class PreviewOutput <: CameraOutput {}
```

**功能：** 预览输出类。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**功能：** 获取已设置的帧率范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FrameRateRange](#struct-frameraterange)|帧率范围。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前生效的配置信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Profile](#class-profile)|当前生效的配置信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.                                  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取预览旋转角度。

- 设备自然方向：设备默认使用方向，手机为竖屏（充电口向下）。
- 相机镜头角度：值等于相机图像顺时针旋转到设备自然方向的角度，手机后置相机传感器是竖屏安装的，所以需要顺时针旋转90度到设备自然方向。
- 屏幕显示方向：需要屏幕显示的图片左上角为第一个像素点为坐标原点。锁屏时与自然方向一致。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|displayRotation|Int32|是|-|显示设备的屏幕旋转角度，通过[getDefaultDisplaySync](../../arkui-cj/cj-apis-display.md#func-getdefaultdisplaysync)获得。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageRotation](#enum-imagerotation)|预览旋转角度。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID   | 错误信息                         |
  |:--------|:-----------------------------|
  | 7400101 | Parameter missing or parameter type incorrect.  |
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询支持的帧率范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[FrameRateRange](#struct-frameraterange)>|支持的帧率范围列表。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听预览帧启动或注销监听预览帧结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameStart或frameEnd，previewOutput创建成功可监听。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听预览输出的错误事件。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，previewOutput创建成功可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.base.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听预览帧启动或监听预览帧结束。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameStart或frameEnd，previewOutput创建成功可监听。底层第一次开始曝光时触发该事件并返回。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听预览输出的错误事件，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，previewOutput创建成功可监听。预览接口使用错误时触发该事件，比如调用Session.start，CameraOutput.release等接口发生错误时返回对应错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 释放输出资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201                |  Camera service fatal error.          |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置预览流帧率范围，设置的范围必须在支持的帧率范围内。 进行设置前，可通过[getSupportedFrameRates](#func-getsupportedframerates)查询支持的帧率范围。

> **说明：**
>
> 仅在[PhotoSession](#class-photosession)或[VideoSession](#class-videosession)模式下支持。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|minFps|Int32|是|-|最小帧率。|
|maxFps|Int32|是|-|最大帧率，当传入的最小值大于最大值时，传参异常，接口不生效。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400110                |  Unresolved conflicts with current configurations.     |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置预览旋转角度。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|previewRotation|[ImageRotation](#enum-imagerotation)|是|-|预览旋转角度。|
|isDisplayLocked|Bool|否|false| **命名参数。** 是否旋转锁定。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101 | Parameter missing or parameter type incorrect.  |
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相机配置信息项。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let format

```cangjie
public let format: CameraFormat
```

**功能：** 输出格式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**类型：** [CameraFormat](#enum-cameraformat)

**读写能力：** 只读

**起始版本：** 21

### let size

```cangjie
public let size: Size
```

**功能：** 分辨率。设置的是相机分辨率宽高，非实际出图宽高。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**类型：** [Size](#struct-size)

**读写能力：** 只读

**起始版本：** 21

## class SecureSession

```cangjie
public class SecureSession <: Session & Flash & AutoExposure & Focus & Zoom {}
```

**功能：** 安全模式会话类，提供了对闪光灯、曝光、对焦、变焦的操作。

**系统能力：** SystemCapability.Multimedia.Camera.Core

> **说明：**
>
> - 通过[createSession](#func-createsessionscenemode)接口传入[SceneMode](#enum-scenemode)为SECURE_PHOTO模式创建一个安全模式的会话。该模式开放给人脸识别、银行等有安全诉求的应用，需要结合安全TA使用，支持同时出普通预览流和安全流的业务场景。
>
> - 安全TA可用于图片处理，它具备验证服务器下发数据的验签能力、图片签名、解析及组装tlv逻辑的能力，还具备密钥读取、创建及操作能力。

**系统能力：**  SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [Session](#interface-session)
- [Flash](#interface-flash)
- [AutoExposure](#interface-autoexposure)
- [Focus](#interface-focus)
- [Zoom](#interface-zoom)

### func addSecureOutput(PreviewOutput)

```cangjie
public func addSecureOutput(previewOutput: PreviewOutput): Unit
```

**功能：** 将其中一条[PreviewOutput](#class-previewoutput)标记成安全输出。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|previewOutput|[PreviewOutput](#class-previewoutput)|是|-|需要标记成安全输出的预览流。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400101|Parameter missing or parameter type incorrect.|
  |7400102|Operation not allowed.|
  |7400103|Session not config.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听普通拍照会话的错误事件，通过注册回调函数获取结果。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听相机聚焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听普通拍照会话的错误事件/相机聚焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error或CameraCallbackType.focusStateChange。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let secureSession = cameraManager.createSession(SceneMode.SECURE_PHOTO) as SecureSession
let session = secureSession.getOrThrow()
session.off(CameraCallbackType.CameraError)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 监听普通拍照会话的错误事件，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。session调用相关接口出现错误时会触发该事件，比如调用beginConfig，commitConfig，addInput等接口发生错误时返回错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class ErrorCallback <: Callback1Argument<BusinessException> {
    public static var invoked = false

    public func invoke(exception: BusinessException) {
        AppLog.info("[multimedia_camera | Error Callback]: exception: ${exception.message}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听相机聚焦的状态变化，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功可监听。仅当自动对焦模式时，且相机对焦状态发生改变时可触发该事件。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，用于获取当前对焦状态。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 录像会话中使用的输出信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [CameraOutput](#interface-cameraoutput)

### func getActiveFrameRate()

```cangjie
public func getActiveFrameRate(): FrameRateRange
```

**功能：** 获取已设置的帧率范围。使用setFrameRate对录像流设置过帧率后可查询。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[FrameRateRange](#struct-frameraterange)|帧率范围。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取当前生效的配置信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[VideoProfile](#class-videoprofile)|当前生效的配置信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201         |  Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 查询支持的帧率范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[FrameRateRange](#struct-frameraterange)>|支持的帧率范围列表。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 获取录像旋转角度。

- 设备自然方向：设备默认使用方向，手机为竖屏（充电口向下）。
- 相机镜头角度：值等于相机图像顺时针旋转到设备自然方向的角度，手机后置相机传感器是竖屏安装的，所以需要顺时针旋转90度到设备自然方向。
- 屏幕显示方向：需要屏幕显示的图片左上角为第一个像素点为坐标原点。锁屏时与自然方向一致。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceDegree|Int32|是|-|设备旋转角度。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageRotation](#enum-imagerotation)|录像旋转角度。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101 | Parameter missing or parameter type incorrect.  |
  | 7400201 | Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听录像开始或注销监听录像结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameStart或frameEnd，videoOutput创建成功后可监听。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackFrameStart <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听录像输出发生错误。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，videoOutput创建成功后可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消对应监听事件的所有回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听录像开始或监听录像结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为frameStart或frameEnd，videoOutput创建成功后可监听。底层第一次曝光时触发该事件并返回。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数，用于获取结果。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackFrameStart <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        Hilog.info(0, "Camera", "Call invoke FrameStart.")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听录像输出发生错误，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为error，videoOutput创建成功后可监听。录像接口调用出现错误时触发该事件并返回对应错误码，比如调用start，CameraOutput.release接口时出现错误返回对应错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat
import ohos.hilog.Hilog
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        Hilog.info(0, "Camera", "Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 释放输出资源。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400201         |  Camera service fatal error.  |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 设置录像流帧率范围，设置的范围必须在支持的帧率范围内。进行设置前，可通过[getSupportedFrameRates](#func-getsupportedframerates)查询支持的帧率范围。

> **说明：**
>
> 仅在[PhotoSession](#class-photosession)或[VideoSession](#class-videosession)模式下支持。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|minFps|Int32|是|-|最小帧率。|
|maxFps|Int32|是|-|最大帧率。当传入的最小值大于最大值时，传参异常，接口不生效。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID        | 错误信息        |
  | :-------------- | :-------------- |
  | 7400101                |  Parameter missing or parameter type incorrect.        |
  | 7400110                |  Unresolved conflicts with current configurations.     |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 启动录制。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID         | 错误信息        |
  | :-------------- | :-------------- |
  | 7400103                |  Session not config.                                   |
  | 7400201                |  Camera service fatal error.                           |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 结束录制。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.image.createImageReceiver
import ohos.image.ImageFormat

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 视频配置信息项。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- [Profile](#class-profile)

### let frameRateRange

```cangjie
public let frameRateRange: FrameRateRange
```

**功能：** 帧率范围，fps(frames per second)。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**类型：** [FrameRateRange](#struct-frameraterange)

**读写能力：** 只读

**起始版本：** 21

## class VideoSession

```cangjie
public class VideoSession <: Session & Flash & AutoExposure & Focus & Zoom & Stabilization & ColorManagement {}
```

**功能：** 普通录像模式会话类，提供了对闪光灯、曝光、对焦、变焦、视频防抖、色彩空间的操作。

> **说明：**
>
> 默认的视频录制模式，适用于一般场景。支持720P、1080p等多种分辨率的录制，可选择不同帧率（如30fps、60fps）。

**系统能力：**  SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

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

**功能：** 查询当前Session是否支持指定的与配置类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|preconfigType|[PreconfigType](#enum-preconfigtype)|是|-|指定配置预期分辨率。|
|preconfigRatio|[PreconfigRatio](#enum-preconfigratio)|否|PRECONFIG_RATIO_16_9| **命名参数。** 可选画幅比例。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true: 支持指定预配值类型。false: 不支持指定预配值类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
session.canPreconfig(PRECONFIG_1080P, preconfigRatio: PRECONFIG_RATIO_16_9)
```

### func off(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func off(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 注销监听普通拍照会话的错误事件，通过注册回调函数获取结果。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听相机聚焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听相机平滑变焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.smoothZoomInfoAvailable，session创建成功之后可监听该接口。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)>|是|-|回调函数，取消对应callback。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 注销监听普通拍照会话的错误事件/相机聚焦的状态变化/相机平滑变焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error或CameraCallbackType.focusStateChange或CameraCallbackType.smoothZoomInfoAvailable。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
let cameraManager = getCameraManager(ctx)
let videoSession = cameraManager.createSession(SceneMode.NORMAL_VIDEO) as VideoSession
let session = videoSession.getOrThrow()
session.off(CameraCallbackType.SmoothZoomInfoAvailable)
```

### func on(CameraCallbackType, Callback1Argument\<BusinessException>)

```cangjie
public func on(`type`: CameraCallbackType, callback: Callback1Argument<BusinessException>): Unit
```

**功能：** 监听普通拍照会话的错误事件，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.error，session创建成功之后可监听该接口。session调用相关接口出现错误时会触发该事件，比如调用beginConfig，commitConfig，addInput等接口发生错误时返回错误信息。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception)>|是|-|回调函数，用于获取错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallbackError <: Callback1Argument<BusinessException> {
    public init() {}
    public open func invoke(res: BusinessException): Unit {
        AppLog.info("Call invoke error. code: ${res.code}, msg: ${res.message}")
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听相机聚焦的状态变化，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.focusStateChange，session创建成功可监听。仅当自动对焦模式时，且相机对焦状态发生改变时可触发该事件。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[FocusState](#enum-focusstate)>|是|-|回调函数，用于获取当前对焦状态。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class FocusStateChangeCallback <: Callback1Argument<FocusState> {
    public static var invoked = false

    public func invoke(state: FocusState) {
        AppLog.info("[multimedia_camera | FocusStateChange Callback]: focus state: ${state}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 监听相机平滑变焦的状态变化，通过注册回调函数获取结果。

> **说明：**
>
> 不支持在on监听的回调方法里调用off注销回调。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type\`|[CameraCallbackType](#enum-cameracallbacktype)|是|-|监听事件，必须为CameraCallbackType.smoothZoomInfoAvailable，session创建成功可监听。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[SmoothZoomInfo](#struct-smoothzoominfo)>|是|-|回调函数，用于获取当前平滑变焦状态。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class SmoothZoomInfoAvailableCallback <: Callback1Argument<SmoothZoomInfo> {
    public static var invoked = false

    public func invoke(info: SmoothZoomInfo) {
        AppLog.info("[multimedia_camera | SmoothZoomInfoAvailable Callback]: info: ${info.duration}")

        invoked = true
    }
}

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 对当前Session进行预配置。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|preconfigType|[PreconfigType](#enum-preconfigtype)|是|-|指定配置预期分辨率。|
|preconfigRatio|[PreconfigRatio](#enum-preconfigratio)|否|PreconfigRatio.PRECONFIG_RATIO_16_9| **命名参数。** 可选画幅比例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Camera错误码](../../errorcodes/cj-errorcode-multimedia-camera.md)。

  | 错误码ID|错误信息|
  |:----|:----|
  |7400201|Camera service fatal error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.CameraKit.*

let ctx = Global.getAbilityContext() // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 相机管理器回调返回的接口实例，表示相机状态信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var camera

```cangjie
public var camera: CameraDevice
```

**功能：** 相机信息。

**类型：** [CameraDevice](#struct-cameradevice)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var status

```cangjie
public var status: CameraStatus
```

**功能：** 相机状态。

**类型：** [CameraStatus](#enum-camerastatus)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### init(CameraDevice, CameraStatus)

```cangjie
public init(camera: CameraDevice, status: CameraStatus)
```

**功能：** 创建CameraStatusInfo对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|camera|[CameraDevice](#struct-cameradevice)|是|-|相机信息。|
|status|[CameraStatus](#enum-camerastatus)|是|-|相机状态。|

## struct CaptureEndInfo

```cangjie
public struct CaptureEndInfo {
    public var captureId: Int32
    public var frameCount: Int32
}
```

**功能：** 拍照停止信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var captureId

```cangjie
public var captureId: Int32
```

**功能：** 拍照的ID。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var frameCount

```cangjie
public var frameCount: Int32
```

**功能：** 帧数。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct CaptureStartInfo

```cangjie
public struct CaptureStartInfo {
    public var captureId: Int32
    public var time: UInt32
}
```

**功能：** 拍照开始信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var captureId

```cangjie
public var captureId: Int32
```

**功能：** 拍照的ID。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var time

```cangjie
public var time: UInt32
```

**功能：** 预估的单次拍照底层出sensor采集帧时间。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct FoldStatusInfo

```cangjie
public struct FoldStatusInfo {
    public let supportedCameras: Array<CameraDevice>
    public let foldStatus: FoldStatus
    public init(supportedCameras: Array<CameraDevice>, foldStatus: FoldStatus)
}
```

**功能：** 相机管理器回调返回的接口实例，表示折叠机折叠状态信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let foldStatus

```cangjie
public let foldStatus: FoldStatus
```

**功能：** 折叠屏折叠状态。

**类型：** [FoldStatus](#enum-foldstatus)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let supportedCameras

```cangjie
public let supportedCameras: Array<CameraDevice>
```

**功能：** 当前折叠状态所支持的相机信息列表。

**类型：** Array\<[CameraDevice](#struct-cameradevice)>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### init(Array\<CameraDevice>, FoldStatus)

```cangjie
public init(supportedCameras: Array<CameraDevice>, foldStatus: FoldStatus)
```

**功能：** 创建FoldStatusInfo对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|supportedCameras|Array\<[CameraDevice](#struct-cameradevice)>|是|-|当前折叠状态所支持的相机信息列表。|
|foldStatus|[FoldStatus](#enum-foldstatus)|是|-|折叠屏折叠状态。|

## struct FrameRateRange

```cangjie
public struct FrameRateRange {
    public let min: Int32
    public let max: Int32
}
```

**功能：** 帧率范围。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let max

```cangjie
public let max: Int32
```

**功能：** 最大帧率。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let min

```cangjie
public let min: Int32
```

**功能：** 最小帧率。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct FrameShutterEndInfo

```cangjie
public struct FrameShutterEndInfo {
    public var captureId: Int32
}
```

**功能：** 拍照曝光结束信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var captureId

```cangjie
public var captureId: Int32
```

**功能：** 拍照的ID。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct FrameShutterInfo

```cangjie
public struct FrameShutterInfo {
    public var captureId: Int32
    public var timestamp: UInt64
}
```

**功能：** 拍照帧输出信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var captureId

```cangjie
public var captureId: Int32
```

**功能：** 拍照的ID。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var timestamp

```cangjie
public var timestamp: UInt64
```

**功能：** 快门时间戳。

**类型：** UInt64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct Location

```cangjie
public struct Location {
    public var latitude: Float64
    public var longtitude: Float64
    public var altitude: Float64
    public init(latitude: Float64, longtitude: Float64, altitude: Float64)
}
```

**功能：** 图片地理位置信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var altitude

```cangjie
public var altitude: Float64
```

**功能：** 海拔(米)。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var latitude

```cangjie
public var latitude: Float64
```

**功能：** 纬度(度)。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var longtitude

```cangjie
public var longtitude: Float64
```

**功能：** 经度(度)。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### init(Float64, Float64, Float64)

```cangjie
public init(latitude: Float64, longtitude: Float64, altitude: Float64)
```

**功能：** 创建Location对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|latitude|Float64|是|-|纬度(度)。|
|longtitude|Float64|是|-|经度(度)。|
|altitude|Float64|是|-|海拔(米)。|

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

**功能：** 拍摄照片的设置。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var location

```cangjie
public var location: Location
```

**功能：** 图片地理位置信息(默认以设备硬件信息为准)。

**类型：** [Location](#struct-location)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var mirror

```cangjie
public var mirror: Bool
```

**功能：** 镜像使能开关(默认关)。使用之前需要使用isMirrorSupported进行判断是否支持。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var quality

```cangjie
public var quality: QualityLevel
```

**功能：** 图片质量(默认低)。

**类型：** [QualityLevel](#enum-qualitylevel)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var rotation

```cangjie
public var rotation: ImageRotation
```

**功能：** 图片旋转角度(默认0度，顺时针旋转)。

**类型：** [ImageRotation](#enum-imagerotation)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### init(QualityLevel, ImageRotation, Location, Bool)

```cangjie
public init(
    quality!: QualityLevel = QualityLevel.QUALITY_LEVEL_MEDIUM,
    rotation!: ImageRotation = ImageRotation.ROTATION_0,
    location!: Location = Location(-1.0, -1.0, -1.0),
    mirror!: Bool = false
)
```

**功能：** 创建PhoroCaptureSetting对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|quality|[QualityLevel](#enum-qualitylevel)|否|QualityLevel.QUALITY_LEVEL_MEDIUM| **命名参数。** 图片质量(默认低)。|
|rotation|[ImageRotation](#enum-imagerotation)|否|ImageRotation.ROTATION_0| **命名参数。** 图片质量(默认低)。|
|location|[Location](#struct-location)|否|Location(- 1.0, - 1.0, - 1.0)| **命名参数。** 图片地理位置信息(默认以设备硬件信息为准)。|
|mirror|Bool|否|false| **命名参数。** 镜像使能开关(默认关)。使用之前需要使用[isMirrorSupported](#func-ismirrorsupported)进行判断是否支持。|

## struct Point

```cangjie
public struct Point {
    public var x: Float32
    public var y: Float32
    public init(x: Float32, y: Float32)
}
```

**功能：** 点坐标用于对焦、曝光配置。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var x

```cangjie
public var x: Float32
```

**功能：** 点的x坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var y

```cangjie
public var y: Float32
```

**功能：** 点的y坐标。

**类型：** Float32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### init(Float32, Float32)

```cangjie
public init(x: Float32, y: Float32)
```

**功能：** 创建Point对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|点的x坐标。|
|y|Float32|是|-|点的y坐标。|

## struct Rect

```cangjie
public struct Rect {
    public var topLeftX: Float64
    public var topLeftY: Float64
    public var width: Float64
    public var height: Float64
}
```

**功能：** 矩形定义。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var height

```cangjie
public var height: Float64
```

**功能：** 矩形高，相对值，范围[0.0, 1.0]。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var topLeftX

```cangjie
public var topLeftX: Float64
```

**功能：** 矩形区域左上角x坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var topLeftY

```cangjie
public var topLeftY: Float64
```

**功能：** 矩形区域左上角y坐标。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var width

```cangjie
public var width: Float64
```

**功能：** 矩形宽，相对值，范围[0.0, 1.0]。

**类型：** Float64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct Size

```cangjie
public struct Size {
    public var width: UInt32
    public var height: UInt32
}
```

**功能：** 输出能力查询。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var height

```cangjie
public var height: UInt32
```

**功能：** 图像尺寸高(像素)。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var width

```cangjie
public var width: UInt32
```

**功能：** 图像尺寸宽(像素)。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

## struct SmoothZoomInfo

```cangjie
public struct SmoothZoomInfo {
    public SmoothZoomInfo(public var duration: Int32)
}
```

**功能：** 平滑变焦参数信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### var duration

```cangjie
public var duration: Int32
```

**功能：** 平滑变焦总时长，单位ms。

**类型：** Int32

**读写能力：** 可读写

**起始版本：** 21

### SmoothZoomInfo(Int32)

```cangjie
public SmoothZoomInfo(public var duration: Int32)
```

**功能：** 创建SmoothZoomInfo对象。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|duration|Int32|是|-|平滑变焦总时长，单位ms。|

## struct TorchStatusInfo

```cangjie
public struct TorchStatusInfo {
    public let isTorchAvailable: Bool
    public let isTorchActive: Bool
    public let torchLevel: Float32
}
```

**功能：** 手电筒回调返回的接口实例，表示手电筒状态信息。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let isTorchActive

```cangjie
public let isTorchActive: Bool
```

**功能：** 手电筒是否被激活。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let isTorchAvailable

```cangjie
public let isTorchAvailable: Bool
```

**功能：** 手电筒是否可用。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### let torchLevel

```cangjie
public let torchLevel: Float32
```

**功能：** 手电筒亮度等级。取值范围为[0.0,1.0]，越靠近1，亮度越大。

**类型：** Float32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

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

**功能：** 监听事件名。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- ToString
- Equatable\<CameraCallbackType>

### CameraError

```cangjie
CameraError
```

**功能：** 错误事件。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### CameraStatus

```cangjie
CameraStatus
```

**功能：** 相机的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### CaptureEnd

```cangjie
CaptureEnd
```

**功能：** 拍照结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### CaptureReady

```cangjie
CaptureReady
```

**功能：** 可拍下一张。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### CaptureStartWithInfo

```cangjie
CaptureStartWithInfo
```

**功能：** 拍照开始。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### EstimatedCaptureDuration

```cangjie
EstimatedCaptureDuration
```

**功能：** 预估的拍照时间。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FocusStateChange

```cangjie
FocusStateChange
```

**功能：** 相机聚焦的状态变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FoldStatusChange

```cangjie
FoldStatusChange
```

**功能：** 折叠设备折叠状态发生变化。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FrameEnd

```cangjie
FrameEnd
```

**功能：** 预览帧结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FrameShutter

```cangjie
FrameShutter
```

**功能：** 拍照帧输出捕获。
**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FrameShutterEnd

```cangjie
FrameShutterEnd
```

**功能：** 拍照曝光结束。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

### FrameStart

```cangjie
FrameStart
```

**功能：** 预览帧启动。

**起始版本：** 21

### MetadataObjectsAvailable

```cangjie
MetadataObjectsAvailable
```

**功能：** 检测到metadata对象。

**起始版本：** 21

### SmoothZoomInfoAvailable

```cangjie
SmoothZoomInfoAvailable
```

**功能：** 相机平滑变焦的状态变化。

**起始版本：** 21

### TorchStatusChange

```cangjie
TorchStatusChange
```

**功能：** 手电筒状态变化。

**起始版本：** 21

### func !=(CameraCallbackType)

```cangjie
public operator func !=(other: CameraCallbackType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraCallbackType](#enum-cameracallbacktype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraCallbackType)

```cangjie
public operator func ==(other: CameraCallbackType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraCallbackType](#enum-cameracallbacktype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 相机错误码。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<CameraErrorCode>
- ToString

| 名称                       | 值          | 说明            |
| :------------------------  | :---       | :-----------    |
| INVALID_ARGUMENT           | 7400101    | 参数缺失或者参数类型不对。   |
| OPERATION_NOT_ALLOWED      | 7400102    | 操作流程不对，不允许。     |
| SESSION_NOT_CONFIG         | 7400103    | session 未配置返回。       |
| SESSION_NOT_RUNNING        | 7400104    | session 未运行返回。    |
| SESSION_CONFIG_LOCKED      | 7400105    | session 配置已锁定返回。     |
| DEVICE_SETTING_LOCKED      | 7400106    | 设备设置已锁定返回。     |
| CONFLICT_CAMERA            | 7400107    | 设备重复打开返回。     |
| DEVICE_DISABLED            | 7400108    | 安全原因摄像头被禁用。     |
| DEVICE_PREEMPTED           | 7400109    | 相机被抢占导致无法使用。     |
| UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS | 7400110   | 与当前配置存在冲突。     |
| SERVICE_FATAL_ERROR        | 7400201    | 相机服务错误返回。     |

### CONFLICT_CAMERA

```cangjie
CONFLICT_CAMERA
```

**功能：** 设备重复打开返回。

**起始版本：** 21

### DEVICE_DISABLED

```cangjie
DEVICE_DISABLED
```

**功能：** 安全原因摄像头被禁用。

**起始版本：** 21

### DEVICE_PREEMPTED

```cangjie
DEVICE_PREEMPTED
```

**功能：** 相机被抢占导致无法使用。

**起始版本：** 21

### DEVICE_SETTING_LOCKED

```cangjie
DEVICE_SETTING_LOCKED
```

**功能：** 设备设置已锁定返回。

**起始版本：** 21

### INVALID_ARGUMENT

```cangjie
INVALID_ARGUMENT
```

**功能：** 参数缺失或者参数类型不对。

**起始版本：** 21

### OPERATION_NOT_ALLOWED

```cangjie
OPERATION_NOT_ALLOWED
```

**功能：** 操作流程不对，不允许。

**起始版本：** 21

### SERVICE_FATAL_ERROR

```cangjie
SERVICE_FATAL_ERROR
```

**功能：** 相机服务错误返回。

**起始版本：** 21

### SESSION_CONFIG_LOCKED

```cangjie
SESSION_CONFIG_LOCKED
```

**功能：** session 配置已锁定返回。

**起始版本：** 21

### SESSION_NOT_CONFIG

```cangjie
SESSION_NOT_CONFIG
```

**功能：** session 未配置返回。

**起始版本：** 21

### SESSION_NOT_RUNNING

```cangjie
SESSION_NOT_RUNNING
```

**功能：** session 未运行返回。

**起始版本：** 21

### UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS

```cangjie
UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS
```

**功能：** 与当前配置存在冲突。

**起始版本：** 21

### func !=(CameraErrorCode)

```cangjie
public operator func !=(other: CameraErrorCode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraErrorCode](#enum-cameraerrorcode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraErrorCode)

```cangjie
public operator func ==(other: CameraErrorCode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraErrorCode](#enum-cameraerrorcode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取CameraErrorCode的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|CameraErrorCode的值。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 输出格式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<CameraFormat>
- ToString

### CAMERA_FORMAT_HEIC

```cangjie
CAMERA_FORMAT_HEIC
```

**功能：** HEIF格式的图片。

**起始版本：** 21

### CAMERA_FORMAT_JPEG

```cangjie
CAMERA_FORMAT_JPEG
```

**功能：** JPEG格式的图片。

**起始版本：** 21

### CAMERA_FORMAT_RGBA_8888

```cangjie
CAMERA_FORMAT_RGBA_8888
```

**功能：** RGBA_888格式的图片。

**起始版本：** 21

### CAMERA_FORMAT_YCBCR_P010

```cangjie
CAMERA_FORMAT_YCBCR_P010
```

**功能：** YCBCR_P010格式的图片。

**起始版本：** 21

### CAMERA_FORMAT_YCRCB_P010

```cangjie
CAMERA_FORMAT_YCRCB_P010
```

**功能：** YCRCB_P010格式的图片。

**起始版本：** 21

### CAMERA_FORMAT_YUV_420_SP

```cangjie
CAMERA_FORMAT_YUV_420_SP
```

**功能：** YUV_420_SP格式的图片。

**起始版本：** 21

### func !=(CameraFormat)

```cangjie
public operator func !=(other: CameraFormat): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraFormat](#enum-cameraformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraFormat)

```cangjie
public operator func ==(other: CameraFormat): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraFormat](#enum-cameraformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum CameraPosition

```cangjie
public enum CameraPosition <: Equatable<CameraPosition> & ToString {
    | CAMERA_POSITION_UNSPECIFIED
    | CAMERA_POSITION_BACK
    | CAMERA_POSITION_FRONT
    | ...
}
```

**功能：** 相机位置。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<CameraPosition>
- ToString

### CAMERA_POSITION_BACK

```cangjie
CAMERA_POSITION_BACK
```

**功能：** 后置相机。

**起始版本：** 21

### CAMERA_POSITION_FRONT

```cangjie
CAMERA_POSITION_FRONT
```

**功能：** 前置相机。

**起始版本：** 21

### CAMERA_POSITION_UNSPECIFIED

```cangjie
CAMERA_POSITION_UNSPECIFIED
```

**功能：** 相机位置未指定。

**起始版本：** 21

### func !=(CameraPosition)

```cangjie
public operator func !=(other: CameraPosition): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraPosition](#enum-cameraposition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraPosition)

```cangjie
public operator func ==(other: CameraPosition): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraPosition](#enum-cameraposition)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 相机状态。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<CameraStatus>
- ToString

### CAMERA_STATUS_APPEAR

```cangjie
CAMERA_STATUS_APPEAR
```

**功能：** 新的相机出现。

**起始版本：** 21

### CAMERA_STATUS_AVAILABLE

```cangjie
CAMERA_STATUS_AVAILABLE
```

**功能：** 相机可用。

**起始版本：** 21

### CAMERA_STATUS_DISAPPEAR

```cangjie
CAMERA_STATUS_DISAPPEAR
```

**功能：** 相机被移除。

**起始版本：** 21

### CAMERA_STATUS_UNAVAILABL

```cangjie
CAMERA_STATUS_UNAVAILABL
```

**功能：** 相机不可用。

**起始版本：** 21

### func !=(CameraStatus)

```cangjie
public operator func !=(other: CameraStatus): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraStatus](#enum-camerastatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraStatus)

```cangjie
public operator func ==(other: CameraStatus): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraStatus](#enum-camerastatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 相机类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<CameraType>
- ToString

### CAMERA_TYPE_DEFAULT

```cangjie
CAMERA_TYPE_DEFAULT
```

**功能：** 相机类型未指定。

**起始版本：** 21

### CAMERA_TYPE_TELEPHOTO

```cangjie
CAMERA_TYPE_TELEPHOTO
```

**功能：** 长焦相机。

**起始版本：** 21

### CAMERA_TYPE_TRUE_DEPTH

```cangjie
CAMERA_TYPE_TRUE_DEPTH
```

**功能：** 带景深信息的相机。

**起始版本：** 21

### CAMERA_TYPE_ULTRA_WIDE

```cangjie
CAMERA_TYPE_ULTRA_WIDE
```

**功能：** 超广角相机。

**起始版本：** 21

### CAMERA_TYPE_WIDE_ANGLE

```cangjie
CAMERA_TYPE_WIDE_ANGLE
```

**功能：** 广角相机。

**起始版本：** 21

### func !=(CameraType)

```cangjie
public operator func !=(other: CameraType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraType](#enum-cameratype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(CameraType)

```cangjie
public operator func ==(other: CameraType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[CameraType](#enum-cameratype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ConnectionType

```cangjie
public enum ConnectionType <: Equatable<ConnectionType> & ToString {
    | CAMERA_CONNECTION_BUILT_IN
    | CAMERA_CONNECTION_USB_PLUGIN
    | CAMERA_CONNECTION_REMOTE
    | ...
}
```

**功能：** 相机连接类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<ConnectionType>
- ToString

### CAMERA_CONNECTION_BUILT_IN

```cangjie
CAMERA_CONNECTION_BUILT_IN
```

**功能：** 内置相机。

**起始版本：** 21

### CAMERA_CONNECTION_REMOTE

```cangjie
CAMERA_CONNECTION_REMOTE
```

**功能：** 远程连接的相机。

**起始版本：** 21

### CAMERA_CONNECTION_USB_PLUGIN

```cangjie
CAMERA_CONNECTION_USB_PLUGIN
```

**功能：** USB连接的相机。

**起始版本：** 21

### func !=(ConnectionType)

```cangjie
public operator func !=(other: ConnectionType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ConnectionType](#enum-connectiontype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ConnectionType)

```cangjie
public operator func ==(other: ConnectionType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ConnectionType](#enum-connectiontype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ExposureMode

```cangjie
public enum ExposureMode <: Equatable<ExposureMode> & ToString {
    | EXPOSURE_MODE_LOCKED
    | EXPOSURE_MODE_AUTO
    | EXPOSURE_MODE_CONTINUOUS_AUTO
    | ...
}
```

**功能：** 曝光模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<ExposureMode>
- ToString

### EXPOSURE_MODE_AUTO

```cangjie
EXPOSURE_MODE_AUTO
```

**功能：** 自动曝光模式。支持曝光区域中心点设置，可以使用[AutoExposure.setMeteringPoint](#func-setmeteringpointpoint)设置曝光区域中心点。

**起始版本：** 21

### EXPOSURE_MODE_CONTINUOUS_AUTO

```cangjie
EXPOSURE_MODE_CONTINUOUS_AUTO
```

**功能：** 连续自动曝光。不支持曝光区域中心点设置。

**起始版本：** 21

### EXPOSURE_MODE_LOCKED

```cangjie
EXPOSURE_MODE_LOCKED
```

**功能：** 锁定曝光模式。不支持曝光区域中心点设置。

**起始版本：** 21

### func !=(ExposureMode)

```cangjie
public operator func !=(other: ExposureMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ExposureMode](#enum-exposuremode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ExposureMode)

```cangjie
public operator func ==(other: ExposureMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ExposureMode](#enum-exposuremode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 闪光灯模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<FlashMode>
- ToString

### FLASH_MODE_ALWAYS_OPEN

```cangjie
FLASH_MODE_ALWAYS_OPEN
```

**功能：** 闪光灯常亮。

**起始版本：** 21

### FLASH_MODE_AUTO

```cangjie
FLASH_MODE_AUTO
```

**功能：** 自动闪光灯。

**起始版本：** 21

### FLASH_MODE_CLOSE

```cangjie
FLASH_MODE_CLOSE
```

**功能：** 闪光灯关闭。

**起始版本：** 21

### FLASH_MODE_OPEN

```cangjie
FLASH_MODE_OPEN
```

**功能：** 闪光灯打开。

**起始版本：** 21

### func !=(FlashMode)

```cangjie
public operator func !=(other: FlashMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlashMode](#enum-flashmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FlashMode)

```cangjie
public operator func ==(other: FlashMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FlashMode](#enum-flashmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 焦距模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<FocusMode>
- ToString

### FOCOS_MODE_AUTO

```cangjie
FOCOS_MODE_AUTO
```

**功能：** 自动对焦。支持对焦点设置，可以使用[setFocusPoint](#func-setfocuspointpoint)设置对焦点，根据对焦点执行一次自动对焦。

**起始版本：** 21

### FOCOS_MODE_CONTINUOUS_AUTO

```cangjie
FOCOS_MODE_CONTINUOUS_AUTO
```

**功能：** 连续自动对焦。不支持对焦点设置。

**起始版本：** 21

### FOCOS_MODE_MANUAL

```cangjie
FOCOS_MODE_MANUAL
```

**功能：** 手动对焦。通过手动修改相机焦距来改变对焦位置，不支持对焦点设置。

**起始版本：** 21

### FOCUS_MODE_LOCKED

```cangjie
FOCUS_MODE_LOCKED
```

**功能：** 对焦锁定。不支持对焦点设置。

**起始版本：** 21

### func !=(FocusMode)

```cangjie
public operator func !=(other: FocusMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FocusMode](#enum-focusmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FocusMode)

```cangjie
public operator func ==(other: FocusMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FocusMode](#enum-focusmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum FocusState

```cangjie
public enum FocusState <: Equatable<FocusState> & ToString {
    | FOCUS_STATE_SCAN
    | FOCUS_STATE_FOCUSED
    | FOCUS_STATE_UNFOCUSED
    | ...
}
```

**功能：** 焦距状态。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<FocusState>
- ToString

### FOCUS_STATE_FOCUSED

```cangjie
FOCUS_STATE_FOCUSED
```

**功能：** 对焦成功。

**起始版本：** 21

### FOCUS_STATE_SCAN

```cangjie
FOCUS_STATE_SCAN
```

**功能：** 触发对焦。

**起始版本：** 21

### FOCUS_STATE_UNFOCUSED

```cangjie
FOCUS_STATE_UNFOCUSED
```

**功能：** 未完成对焦。

**起始版本：** 21

### func !=(FocusState)

```cangjie
public operator func !=(other: FocusState): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FocusState](#enum-focusstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FocusState)

```cangjie
public operator func ==(other: FocusState): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FocusState](#enum-focusstate)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum FoldStatus

```cangjie
public enum FoldStatus <: Equatable<FoldStatus> & ToString {
    | NON_FOLDABLE
    | EXPANDED
    | FOLDED
    | ...
}
```

**功能：** 折叠机折叠状态。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<FoldStatus>
- ToString

### EXPANDED

```cangjie
EXPANDED
```

**功能：** 表示当前设备折叠状态为完全展开。

**起始版本：** 21

### FOLDED

```cangjie
FOLDED
```

**功能：** 表示当前设备折叠状态为折叠。

**起始版本：** 21

### NON_FOLDABLE

```cangjie
NON_FOLDABLE
```

**功能：** 表示当前设备不可折叠。

**起始版本：** 21

### func !=(FoldStatus)

```cangjie
public operator func !=(other: FoldStatus): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldStatus](#enum-foldstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(FoldStatus)

```cangjie
public operator func ==(other: FoldStatus): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[FoldStatus](#enum-foldstatus)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 图片旋转角度。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<ImageRotation>
- ToString

### ROTATION_0

```cangjie
ROTATION_0
```

**功能：** 图片旋转0度。

**起始版本：** 21

### ROTATION_180

```cangjie
ROTATION_180
```

**功能：** 图片旋转180度。

**起始版本：** 21

### ROTATION_270

```cangjie
ROTATION_270
```

**功能：** 图片旋转270度。

**起始版本：** 21

### ROTATION_90

```cangjie
ROTATION_90
```

**功能：** 图片旋转90度。

**起始版本：** 21

### func !=(ImageRotation)

```cangjie
public operator func !=(other: ImageRotation): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageRotation](#enum-imagerotation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageRotation)

```cangjie
public operator func ==(other: ImageRotation): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageRotation](#enum-imagerotation)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum MetadataObjectType

```cangjie
public enum MetadataObjectType <: Equatable<MetadataObjectType> & ToString {
    | FACE_DETECTION
    | ...
}
```

**功能：** metadata流。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<MetadataObjectType>
- ToString

### FACE_DETECTION

```cangjie
FACE_DETECTION
```

**功能：** metadata对象类型，用于人脸检测。检测点应在0-1坐标系内，该坐标系左上角为(0.0，0.0)，右下角为(1.0，1.0)。此坐标系以设备充电口在右侧时的横向设备方向为基准。例如应用的预览界面布局以设备充电口在下侧时的竖向方向为基准，布局宽高为(w，h)， 返回点为(x，y)，则转换后的坐标点为(1.0-y，x)。

**起始版本：** 21

### func !=(MetadataObjectType)

```cangjie
public operator func !=(other: MetadataObjectType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MetadataObjectType](#enum-metadataobjecttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MetadataObjectType)

```cangjie
public operator func ==(other: MetadataObjectType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MetadataObjectType](#enum-metadataobjecttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PreconfigRatio

```cangjie
public enum PreconfigRatio <: Equatable<PreconfigRatio> & ToString {
    | PRECONFIG_RATIO_1_1
    | PRECONFIG_RATIO_4_3
    | PRECONFIG_RATIO_16_9
    | ...
}
```

**功能：** 提供预配置的分辨率比例。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<PreconfigRatio>
- ToString

### PRECONFIG_RATIO_16_9

```cangjie
PRECONFIG_RATIO_16_9
```

**功能：** 16:9画幅。

**起始版本：** 21

### PRECONFIG_RATIO_1_1

```cangjie
PRECONFIG_RATIO_1_1
```

**功能：** 1:1画幅。

**起始版本：** 21

### PRECONFIG_RATIO_4_3

```cangjie
PRECONFIG_RATIO_4_3
```

**功能：** 4:3画幅。

**起始版本：** 21

### func !=(PreconfigRatio)

```cangjie
public operator func !=(other: PreconfigRatio): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PreconfigRatio](#enum-preconfigratio)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PreconfigRatio)

```cangjie
public operator func ==(other: PreconfigRatio): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PreconfigRatio](#enum-preconfigratio)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 提供预配置的类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<PreconfigType>
- ToString

### PRECONFIG_1080P

```cangjie
PRECONFIG_1080P
```

**功能：** 1080P预配置。

**起始版本：** 21

### PRECONFIG_4K

```cangjie
PRECONFIG_4K
```

**功能：** 4K预配置。

**起始版本：** 21

### PRECONFIG_720P

```cangjie
PRECONFIG_720P
```

**功能：** 720P预配置。

**起始版本：** 21

### PRECONFIG_HIGH_QUALITY

```cangjie
PRECONFIG_HIGH_QUALITY
```

**功能：** 高质量预配置。

**起始版本：** 21

### func !=(PreconfigType)

```cangjie
public operator func !=(other: PreconfigType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PreconfigType](#enum-preconfigtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PreconfigType)

```cangjie
public operator func ==(other: PreconfigType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PreconfigType](#enum-preconfigtype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum QualityLevel

```cangjie
public enum QualityLevel <: Equatable<QualityLevel> & ToString {
    | QUALITY_LEVEL_HIGH
    | QUALITY_LEVEL_MEDIUM
    | QUALITY_LEVEL_LOW
    | ...
}
```

**功能：** 图片质量。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<QualityLevel>
- ToString

### QUALITY_LEVEL_HIGH

```cangjie
QUALITY_LEVEL_HIGH
```

**功能：** 图片质量高。

**起始版本：** 21

### QUALITY_LEVEL_LOW

```cangjie
QUALITY_LEVEL_LOW
```

**功能：** 图片质量差。

**起始版本：** 21

### QUALITY_LEVEL_MEDIUM

```cangjie
QUALITY_LEVEL_MEDIUM
```

**功能：** 图片质量中等。

**起始版本：** 21

### func !=(QualityLevel)

```cangjie
public operator func !=(other: QualityLevel): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[QualityLevel](#enum-qualitylevel)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(QualityLevel)

```cangjie
public operator func ==(other: QualityLevel): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[QualityLevel](#enum-qualitylevel)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum SceneMode

```cangjie
public enum SceneMode <: Equatable<SceneMode> & ToString {
    | NORMAL_PHOTO
    | NORMAL_VIDEO
    | SECURE_PHOTO
    | ...
}
```

**功能：** 相机支持模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<SceneMode>
- ToString

### NORMAL_PHOTO

```cangjie
NORMAL_PHOTO
```

**功能：** 普通拍照模式。详情见[PhotoSession](#class-photosession)。

**起始版本：** 21

### NORMAL_VIDEO

```cangjie
NORMAL_VIDEO
```

**功能：** 普通录像模式。详情见[VideoSession](#class-videosession)。

**起始版本：** 21

### SECURE_PHOTO

```cangjie
SECURE_PHOTO
```

**功能：** 安全相机模式。详情见[SecureSession](#class-securesession)。

**起始版本：** 21

### func !=(SceneMode)

```cangjie
public operator func !=(other: SceneMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SceneMode](#enum-scenemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SceneMode)

```cangjie
public operator func ==(other: SceneMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SceneMode](#enum-scenemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum SmoothZoomMode

```cangjie
public enum SmoothZoomMode <: Equatable<SmoothZoomMode> & ToString {
    | NORMAL
    | ...
}
```

**功能：** 平滑变焦模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<SmoothZoomMode>
- ToString

### NORMAL

```cangjie
NORMAL
```

**功能：** 贝塞尔曲线模式。

**起始版本：** 21

### func !=(SmoothZoomMode)

```cangjie
public operator func !=(other: SmoothZoomMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SmoothZoomMode](#enum-smoothzoommode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(SmoothZoomMode)

```cangjie
public operator func ==(other: SmoothZoomMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SmoothZoomMode](#enum-smoothzoommode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum TorchMode

```cangjie
public enum TorchMode <: Equatable<TorchMode> & ToString {
    | OFF
    | ON
    | AUTO
    | ...
}
```

**功能：** 手电筒模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<TorchMode>
- ToString

### AUTO

```cangjie
AUTO
```

**功能：** 自动模式。

**起始版本：** 21

### OFF

```cangjie
OFF
```

**功能：** 常关模式。

**起始版本：** 21

### ON

```cangjie
ON
```

**功能：** 常开模式。

**起始版本：** 21

### func !=(TorchMode)

```cangjie
public operator func !=(other: TorchMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TorchMode](#enum-torchmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(TorchMode)

```cangjie
public operator func ==(other: TorchMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[TorchMode](#enum-torchmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum VideoCodecType

```cangjie
public enum VideoCodecType <: Equatable<VideoCodecType> & ToString {
    | AVC
    | HEVC
    | ...
}
```

**功能：** 视频编码类型。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<VideoCodecType>
- ToString

### AVC

```cangjie
AVC
```

**功能：** 视频编码类型AVC。

**起始版本：** 21

### HEVC

```cangjie
HEVC
```

**功能：** 视频编码类型HEVC。

**起始版本：** 21

### func !=(VideoCodecType)

```cangjie
public operator func !=(other: VideoCodecType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VideoCodecType](#enum-videocodectype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(VideoCodecType)

```cangjie
public operator func ==(other: VideoCodecType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VideoCodecType](#enum-videocodectype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 视频防抖模式。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**父类型：**

- Equatable\<VideoStabilizationMode>
- ToString

### AUTO

```cangjie
AUTO
```

**功能：** 自动进行选择。

**起始版本：** 21

### HIGH

```cangjie
HIGH
```

**功能：** 使用防抖效果最好的防抖算法，防抖效果优于MIDDLE类型。

**起始版本：** 21

### LOW

```cangjie
LOW
```

**功能：** 关闭视频防抖功能。

**起始版本：** 21

### MIDDLE

```cangjie
MIDDLE
```

**功能：** 使用防抖效果一般的防抖算法，防抖效果优于LOW类型。

**起始版本：** 21

### OFF

```cangjie
OFF
```

**功能：** 关闭视频防抖功能。

**起始版本：** 21

### func !=(VideoStabilizationMode)

```cangjie
public operator func !=(other: VideoStabilizationMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VideoStabilizationMode](#enum-videostabilizationmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(VideoStabilizationMode)

```cangjie
public operator func ==(other: VideoStabilizationMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[VideoStabilizationMode](#enum-videostabilizationmode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Camera.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|
