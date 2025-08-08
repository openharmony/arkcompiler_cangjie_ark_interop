# ohos.image（图片处理）

本模块提供图片处理效果，包括通过属性创建PixelMap、读取图像像素数据、读取区域内的图片数据等。

## 导入模块

```cangjie
import kit.ImageKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createImageCreator(Size, Int32, Int32)

```cangjie
public func createImageCreator(size: Size, format: Int32, capacity: Int32): ImageCreator
```

**功能：** 创建ImageCreator实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Size](#class-size)|是|-|图像的默认大小。|
|format|Int32|是|-|图像格式，如YCBCR_422_SP，JPEG。|
|capacity|Int32|是|-|同时访问的最大图像数。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageCreator](#class-imagecreator)|返回ImageCreator实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(height: 8192, width: 8)
let imageCreator = createImageCreator(size, 4, 8)
```

## func createImagePacker()

```cangjie
public func createImagePacker(): ImagePacker
```

**功能：** 创建ImagePacker实例。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ImagePacker](#class-imagepacker)|返回ImagePacker实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imagePacker : ImagePacker = createImagePacker()
```

## func createImageReceiver(Size, ImageFormat, Int32)

```cangjie
public func createImageReceiver(size: Size, format: ImageFormat, capacity: Int32): ImageReceiver
```

**功能：** 通过宽、高、图片格式、容量创建ImageReceiver实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Size](#class-size)|是|-|图像的默认大小。该参数不会影响接收到的图片大小，实际返回大小由生产者决定，如相机。   |
|format|[ImageFormat](#enum-imageformat)|是|-|图像格式，取值为[ImageFormat](#enum-imageformat)常量（目前仅支持ImageFormat:JPEG）。|
|capacity|Int32|是|-|同时访问的最大图像数。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageReceiver](#class-imagereceiver)|如果操作成功，则返回ImageReceiver实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8192, 8)
let receiver : ImageReceiver = createImageReceiver(size, ImageFormat.JPEG, 8)
```

## func createImageSource(String)

```cangjie
public func createImageSource(uri: String): ImageSource
```

**功能：** 通过传入的URI创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|uri|String|是|-|图片路径，当前仅支持应用沙箱路径。</br>当前支持格式有：.jpg .png .gif .bmp .webp RAW [SVG](#svg标签说明)。 |

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let path: String = "../test.jpg"
let imageSourceApi: ImageSource = createImageSource(path)
```

## func createImageSource(String, SourceOptions)

```cangjie
public func createImageSource(uri: String, options: SourceOptions): ImageSource
```

**功能：** 通过传入的URI创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|uri|String|是|-|图片路径，当前仅支持应用沙箱路径。</br>当前支持格式有：.jpg .png .gif .bmp .webp RAW [SVG](#svg标签说明)。|
|options|[SourceOptions](#struct-sourceoptions)|是|-|图片属性，包括图片序号与默认属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSource: ImageSource = createImageSource("test.png", sourceOptions)
```

## func createImageSource(Int32)

```cangjie
public func createImageSource(fd: Int32): ImageSource
```

**功能：** 通过传入文件描述符来创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|文件描述符fd。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imageSourceApi : ImageSource = createImageSource(0)
```

## func createImageSource(Int32, SourceOptions)

```cangjie
public func createImageSource(fd: Int32, options: SourceOptions): ImageSource
```

**功能：** 通过传入文件描述符来创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fd|Int32|是|-|文件描述符fd。|
|options|[SourceOptions](#class-sourceoptions)|是|-|图片属性，包括图片序号与默认属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSource: ImageSource = createImageSource(0, sourceOptions)
```

## func createImageSource(Array\<UInt8>)

```cangjie
public func createImageSource(buf: Array<UInt8>): ImageSource
```

**功能：** 通过缓冲区创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|是|-|图像缓冲区数组。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let buf: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96为需要创建的像素buffer大小，取值为：height * width *4
let imageSourceApi: ImageSource = createImageSource(buf)
```

## func createImageSource(Array\<UInt8>, SourceOptions)

```cangjie
public func createImageSource(buf: Array<UInt8>, options: SourceOptions): ImageSource
```

**功能：** 通过缓冲区创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|是|-|图像缓冲区数组。|
|options|[SourceOptions](#class-sourceoptions)|是|-|图片属性，包括图片序号与默认属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
```

## func createImageSource(RawFileDescriptor, SourceOptions)

```cangjie
public func createImageSource(rawfile: RawFileDescriptor, options!: SourceOptions = SourceOptions(0)): ImageSource
```

**功能：** 通过图像资源文件的RawFileDescriptor创建图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rawfile|[RawFileDescriptor](../LocalizationKit/cj-apis-resource_manager.md#class-rawfiledescriptor)|是|-|图像资源文件的RawFileDescriptor。|
|options|[SourceOptions](#class-sourceoptions)|否|SourceOptions(0)| **命名参数。** 图片属性，包括图片像素密度、像素格式和图片尺寸。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回ImageSource类实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import ohos.resource_manager.ResourceManager
import ohos.base.*

let resourceManager = ResourceManager.getResourceManager(Global.getStageContext()) // 需获取Context应用上下文，详见本文使用说明
try {
    let rawfd = resourceManager.getRawFd("test.png")
    createImageSource(rawfd)
} catch (e: BusinessException) {
    let code = e.code
    let message = e.message
    AppLog.info("getRawFd failed, error code: ${code}, message: ${message}.")
}
```

## func createIncrementalSource(Array\<UInt8>, SourceOptions)

```cangjie
public func createIncrementalSource(buf: Array<UInt8>, options!: SourceOptions = SourceOptions(0)): ImageSource
```

**功能：** 通过缓冲区以增量的方式创建图片源实例，IncrementalSource不支持读写Exif信息。

以增量方式创建的图片源实例ImageSource，仅支持使用以下功能。

- 获取图片信息：指定序号-[getImageInfo](#func-getimageinfouint32)、直接获取-[getImageInfo](#func-getimageinfo)
- 获取图片中给定索引处图像的指定属性键的值：[getImageProperty](#func-getimagepropertypropertykey-imagepropertyoptions)
- 更新增量数据：[updateData](#func-updatedataarrayuint8-bool-uint32-uint32)
- 创建PixelMap对象：通过图片解码参数创建-[createPixelMap](#func-createpixelmapdecodingoptions)
- 释放图片源实例：[release](#func-release-1)

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|是|-|增量数据， 这个参数实际不生效。|
|options|[SourceOptions](#class-sourceoptions)|否|SourceOptions(0)| **命名参数。** 图片属性，包括图片序号与默认属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageSource](#class-imagesource)|返回图片源。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let buf = Array<UInt8>(1, repeat: 0)
let imageSource = CreateIncrementalSource(buf)
```

## func createPixelMap(Array\<UInt8>, InitializationOptions)

```cangjie
public func createPixelMap(colors: Array<UInt8>, options: InitializationOptions): PixelMap
```

**功能：** 通过属性创建PixelMap，默认采用BGRA_8888格式处理数据，目前只支持BGRA_8888格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colors|Array\<UInt8>|是|-|BGRA_8888格式的颜色数组。|
|options|[InitializationOptions](#class-initializationoptions)|是|-|创建像素的属性，包括透明度，尺寸，缩略值，像素格式和是否可编辑。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](#class-pixelmap)|返回Pixelmap。<br>当创建的pixelmap大小超过原图大小时，返回原图pixelmap大小。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  | 错误码ID | 错误信息 |
  | :------- | :--------------------------------------------|
  | 62980096 | If the operation failed. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let color: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96为需要创建的像素buffer大小，取值为：height * width *4
let opts: InitializationOptions = InitializationOptions(editable: true, pixelFormat: RGBA_8888,
    size: Size(height: 4, width: 6))
let pixelMap = createPixelMap(color, opts)
```

## class Component

```cangjie
public class Component {
    public let componentType: ComponentType
    public let rowStride: Int32
    public let pixelStride: Int32
    public let byteBuffer: Array<UInt8>
}
```

**功能：** 描述图像颜色分量。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### let byteBuffer

```cangjie
public let byteBuffer: Array<UInt8>
```

**功能：** 组件缓冲区。

**类型：** Array\<UInt8>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### let componentType

```cangjie
public let componentType: ComponentType
```

**功能：** 组件类型。

**类型：** [ComponentType](#enum-componenttype)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### let pixelStride

```cangjie
public let pixelStride: Int32
```

**功能：** 像素间距。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### let rowStride

```cangjie
public let rowStride: Int32
```

**功能：** 行距。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

## class DecodingOptions

```cangjie
public class DecodingOptions {
    public var sampleSize: UInt32
    public var rotate: UInt32
    public var editable: Bool
    public var desiredSize: Size
    public var desiredRegion: Region
    public var desiredPixelFormat: PixelMapFormat
    public var index: UInt32
    public var fitDensity: Int32
    public var desiredColorSpace:?ColorSpaceManager
    public var desiredDynamicRange: DecodingDynamicRange
    public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
        desiredSize!: Size = Size(0, 0), desiredRegion!: Region = Region(Size(0, 0), 0, 0),
        desiredPixelFormat!: PixelMapFormat = UNKNOWN, index!: UInt32 = 0, fitDensity!: Int32 = 0,
        desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = SDR)
}
```

**功能：** 图像解码设置选项。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredColorSpace

```cangjie
public var desiredColorSpace:?ColorSpaceManager
```

**功能：** 目标色彩空间。

**类型：** ?[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: DecodingDynamicRange
```

**功能：** 目标动态范围，默认值为SDR。

通过[CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions)创建的imagesource不支持设置此属性，默认解码为SDR内容。

如果平台不支持HDR，设置无效，默认解码为SDR内容。

**类型：** [DecodingDynamicRange](#enum-decodingdynamicrange)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredPixelFormat

```cangjie
public var desiredPixelFormat: PixelMapFormat
```

**功能：** 解码的像素格式。

**类型：** [PixelMapFormat](#enum-pixelmapformat)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredRegion

```cangjie
public var desiredRegion: Region
```

**功能：** 解码区域。

**类型：** [Region](#class-region)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredSize

```cangjie
public var desiredSize: Size
```

**功能：** 期望输出大小。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var editable

```cangjie
public var editable: Bool
```

**功能：** 是否可编辑。当取值为false时，图片不可二次编辑，如crop等操作将失败。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var fitDensity

```cangjie
public var fitDensity: Int32
```

**功能：** 图像像素密度，单位为ppi。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var index

```cangjie
public var index: UInt32
```

**功能：** 解码图片序号。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var rotate

```cangjie
public var rotate: UInt32
```

**功能：** 旋转角度。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var sampleSize

```cangjie
public var sampleSize: UInt32
```

**功能：** 缩略图采样大小，当前只能取1。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(UInt32, UInt32, Bool, Size, Region, PixelMapFormat, UInt32, Int32, ?ColorSpaceManager, DecodingDynamicRange)

```cangjie
public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
    desiredSize!: Size = Size(0, 0), desiredRegion!: Region = Region(Size(0, 0), 0, 0),
    desiredPixelFormat!: PixelMapFormat = UNKNOWN, index!: UInt32 = 0, fitDensity!: Int32 = 0,
    desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = SDR)
```

**功能：** 创建DecodingOptions对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sampleSize|UInt32|否|1|**命名参数。** 缩略图采样大小，当前只能取1。|
|rotate|UInt32|否|0|**命名参数。** 旋转角度。|
|editable|Bool|否|false|**命名参数。** 是否可编辑。当取值为false时，图片不可二次编辑，如crop等操作将失败。|
|desiredSize|[Size](#class-size)|否|Size(0, 0)|**命名参数。** 期望输出大小。|
|desiredRegion|[Region](#class-region)|否|Region(Size(0, 0), 0, 0)|**命名参数。** 解码区域。|
|desiredPixelFormat|[PixelMapFormat](#enum-pixelmapformat)|否|UNKNOWN|**命名参数。** 解码的像素格式。|
|index|UInt32|否|0|**命名参数。** 解码图片序号。|
|fitDensity|Int32|否|0|**命名参数。** 图像像素密度，单位为ppi。|
|desiredColorSpace|?[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)|否|None|**命名参数。** 目标色彩空间。|
|desiredDynamicRange|[DecodingDynamicRange](#enum-decodingdynamicrange)|否|SDR|**命名参数。** 目标动态范围。<br>通过[CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions)创建的imagesource不支持设置此属性，默认解码为SDR内容。<br>如果平台不支持HDR，设置无效，默认解码为SDR内容。|

## class Image

```cangjie
public class Image {}
```

**功能：** 提供基本的图像操作，包括获取图像信息、读写图像数据。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### prop clipRect

```cangjie
public prop clipRect: Region
```

**功能：** 要裁剪的图像区域。

**类型：** [Region](#class-region)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### prop format

```cangjie
public prop format: Int32
```

**功能：** 图像格式，参考[PixelMapFormat](#enum-pixelmapformat)。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### prop size

```cangjie
public prop size: Size
```

**功能：** 图像大小。

**类型：** [Size](#class-size)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func getComponent(ComponentType)

```cangjie
public func getComponent(componentType: ComponentType): Component
```

**功能：** 根据图像的组件类型从图像中获取组件缓存返回结果。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|componentType|[ComponentType](#enum-componenttype)|是|-|图像的组件类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[Component](#class-component)|返回组件缓冲区。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imageCreator = createImageCreator(8192, 8, 4, 8)
let img = imageCreator.dequeueImage()
let component : Component = img.getComponent(ComponentType.JPEG)
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放当前图像。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imageCreator = createImageCreator(8192, 8, 4, 8)
let img = imageCreator.dequeueImage()
img.release()
```

## class ImageCreator

```cangjie
public class ImageCreator {}
```

**功能：** 图像创建模块，用于请求图像原生数据区域，并开放给应用编译原生图像数据的能力。 在调用以下方法前需要先创建ImageCreator实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**功能：** 同时访问的图像数。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

### prop format

```cangjie
public prop format: Int32
```

**功能：** 图像格式。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

### func dequeueImage()

```cangjie
public func dequeueImage(): Image
```

**功能：** 从空闲队列中获取buffer图片，用于绘制UI内容。

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[Image](#class-image)|用于返回最新图片。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var imageCreator = createImageCreator(8192, 8, 4, 8)
var image = imageCreator.dequeueImage()
```

### func queueImage(Image)

```cangjie
public func queueImage(image: Image): Unit
```

**功能：** 将绘制好的图片放入Dirty队列。

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|image|[Image](#class-image)|是|-|绘制好的buffer图像。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var imageCreator = createImageCreator(8192, 8, 4, 8)
var image = imageCreator.dequeueImage()
imageCreator.queueImage(image)
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放当前图像。

**系统能力：** SystemCapability.Multimedia.Image.ImageCreator

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imageCreator = createImageCreator(8192, 8, 4, 8)
imageCreator.release()
```

## class ImageInfo

```cangjie
public class ImageInfo {
    public var size: Size
    public var density: Int32
    public var stride: Int32
    public var pixelFormat: PixelMapFormat
    public var alphaType: AlphaType
    public var mimeType: String
    public var isHdr: Bool
}
```

**功能：** 表示图片信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var alphaType

```cangjie
public var alphaType: AlphaType
```

**功能：** 透明度。

**类型：** [AlphaType](#enum-alphatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var density

```cangjie
public var density: Int32
```

**功能：** 像素密度，单位为ppi。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var isHdr

```cangjie
public var isHdr: Bool
```

**功能：** 图片是否为高动态范围（HDR）。对于[ImageSource](#class-imagesource)，代表源图片是否为HDR；对于[PixelMap](#class-pixelmap)，代表解码后的pixelmap是否为HDR。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var mimeType

```cangjie
public var mimeType: String
```

**功能：** 图片真实格式（MIME type）。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**功能：** 像素格式。

**类型：** [PixelMapFormat](#enum-pixelmapformat)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var size

```cangjie
public var size: Size
```

**功能：** 图片大小。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var stride

```cangjie
public var stride: Int32
```

**功能：** 跨距，内存中每行像素所占的空间。stride >= region.size.width*4。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

## class ImagePacker

```cangjie
public class ImagePacker {}
```

**功能：** 图片打包器类，用于图片压缩和打包。在调用ImagePacker的方法前，需要先通过[createImagePacker](#func-createimagepacker)构建一个ImagePacker实例，当前支持格式有：jpeg、webp、png。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

### prop supportedFormats

```cangjie
public prop supportedFormats: Array<String>
```

**功能：** 图片打包支持的格式jpeg、webp、png。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

### func packToData(ImageSource, PackingOption)

```cangjie
public func packToData(source: ImageSource, option: PackingOption): Array<UInt8>
```

**功能：** 图片压缩或重新编码。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|source|[ImageSource](#class-imagesource)|是|-|打包的图片源。|
|option|[PackingOption](#class-packingoption)|是|-|设置打包参数。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|用于获取压缩或打包后的数据。|

**异常：**

- BusinessException：对应错误码如下表，详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980115|The operation failed.|
  |62980096|If the parameter is invalid.|
  |62980101|The image data is abnormal.|
  |62980106|The image is too large.|
  |62980113|Unknown image format.|
  |62980119|If encoder occur error during encoding.|
  |62980120|Add pixelmap out of range.|
  |62980172|Failed to encode icc.|
  |62980252|Failed to create surface.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var imageSource = createImageSource("xxx/test.jpg")
var imagePacker = createImagePacker()
let packingOption = PackingOption("image/jpeg", 98)
let packRes = imagePacker.packToData(imageSource, packingOption)
```

### func packToData(PixelMap, PackingOption)

```cangjie
public func packToData(source: PixelMap, option: PackingOption): Array<UInt8>
```

**功能：** 图片压缩或重新编码。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|source|[PixelMap](#class-pixelmap)|是|-|打包的图片源。|
|option|[PackingOption](#class-packingoption)|是|-|设置打包参数。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|用于获取压缩或打包后的数据。|

**异常：**

- BusinessException：对应错误码如下表，详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980115|The operation failed.|
  |62980096|If the parameter is invalid.|
  |62980101|The image data is abnormal.|
  |62980106|The image is too large.|
  |62980113|Unknown image format.|
  |62980119|If encoder occur error during encoding.|
  |62980120|Add pixelmap out of range.|
  |62980172|Failed to encode icc.|
  |62980252|Failed to create surface.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
var pm = createPixelMap(colors,
    InitializationOptions(scaleMode: ScaleMode.CENTER_CROP, size: Size(height: 2, width: 1)))
var imagePacker = createImagePacker()
let supportedFormats = imagePacker.supportedFormats
let packingOption = PackingOption("image/jpeg", 98)
let packRes = imagePacker.packToData(pm, packingOption)
```

### func packToFile(PixelMap, Int32, PackingOption)

```cangjie
public func packToFile(source: PixelMap, fd: Int32, option: PackingOption): Unit
```

**功能：** 图片压缩或重新打包到文件中。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|source|[PixelMap](#class-pixelmap)|是|-|打包的图片源。|
|fd|Int32|是|-|打包的目的文件的文件描述符。|
|option|[PackingOption](#class-packingoption)|是|-|设置打包参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import ohos.file_fs.*

let imagePacker = createImagePacker()
var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
var pm = createPixelMap(colors,
    InitializationOptions(scaleMode: ScaleMode.CENTER_CROP, size: Size(height: 4, width: 3)))
var fd: Int32 = 0
let filePath = "data/storage/el1/base/temp.txt"
let file = FileFs.open(
    filePath,
    mode: (OpenMode
        .CREATE
        .mode | OpenMode
        .READ_WRITE
        .mode)
)
let packingOption = PackingOption("image/jpeg", 98)
imagePacker.packToFile(pm, IntNative(fd), packingOption)
```

### func packToFile(ImageSource, Int32, PackingOption)

```cangjie
public func packToFile(source: ImageSource, fd: Int32, option: PackingOption): Unit
```

**功能：** 图片压缩或重新打包到文件中。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|source|[ImageSource](#class-imagesource)|是|-|打包的图片源。|
|fd|Int32|是|-|打包的目的文件的文件描述符。|
|option|[PackingOption](#class-packingoption)|是|-|设置打包参数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import ohos.file_fs.*

let imagePacker = createImagePacker()
var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
var imageSource = createImageSource("xxx/test.jpg")
var fd: Int32 = 0
let filePath = "data/storage/el1/base/temp.txt"
let file = FileFs.open(
    filePath,
    mode: (OpenMode
        .CREATE
        .mode | OpenMode
        .READ_WRITE
        .mode)
)
let packingOption = PackingOption("image/jpeg", 98)
imagePacker.packToFile(imageSource, IntNative(fd), packingOption)
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放图片打包实例。

**系统能力：** SystemCapability.Multimedia.Image.ImagePacker

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imagePacker = createImagePacker()
imagePacker.release()
```

## class ImagePropertyOptions

```cangjie
public class ImagePropertyOptions {
    public var index: UInt32
    public var defaultValue: String
    public ImagePropertyOptions(index!: UInt32 = 0, defaultValue!: String = "")
}
```

**功能：** 表示查询图片属性的索引。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var defaultValue

```cangjie
public var defaultValue: String
```

**功能：** 默认属性值。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var index

```cangjie
public var index: UInt32
```

**功能：** 图片序号。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### ImagePropertyOptions(UInt32, String)

```cangjie
public ImagePropertyOptions(index!: UInt32 = 0, defaultValue!: String = "")
```

**功能：** 创建ImagePropertyOptions对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|UInt32|否|0|**命名参数。** 图片序号。|
|defaultValue|String|否|""|**命名参数。** 默认属性值。|

## class ImageReceiver

```cangjie
public class ImageReceiver {}
```

**功能：** 图像接收类，用于获取组件surface id，接收最新的图片和读取下一张图片，以及释放ImageReceiver实例。

在调用以下方法前需要先创建ImageReceiver实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**功能：** 同时访问的图像数。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

### prop format

```cangjie
public prop format: ImageFormat
```

**功能：** 图像格式。

**类型：** [ImageFormat](#enum-imageformat)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

### prop size

```cangjie
public prop size: Size
```

**功能：** 图片大小。

**类型：** [Size](#class-size)

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

### func getReceivingSurfaceId()

```cangjie
public func getReceivingSurfaceId(): String
```

**功能：** 用于获取一个surface id供Camera或其他组件使用。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回surface id。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
let id: String = receiver.getReceivingSurfaceId()
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放当前图像接收类。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var receiver = createImageReceiver(8192, 8, ImageFormat.JPEG, 8)
receiver.release()
```

## class ImageSource

```cangjie
public class ImageSource {}
```

**功能：** 图片源类，用于获取图片相关信息。在调用ImageSource的方法前，需要先通过createImageSource构建一个ImageSource实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

### prop supportedFormats

```cangjie
public prop supportedFormats: Array<String>
```

**功能：** 支持的图片格式，包括：png，jpeg，bmp，gif，webp，RAW。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

### func createPixelMap(DecodingOptions)

```cangjie
public func createPixelMap(options!: DecodingOptions = DecodingOptions()): PixelMap
```

**功能：** 通过图片解码参数创建PixelMap对象。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[DecodingOptions](#class-decodingoptions)|否|DecodingOptions()| **命名参数。** 解码参数。|

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](#class-pixelmap)|返回pixelMap实例|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let option = DecodingOptions(
    sampleSize: 1,
    rotate: 10,
    editable: true,
    desiredSize: Size(height: 3, width: 4),
    desiredRegion: Region(Size(height: 3, width: 4), 0, 0),
    desiredPixelFormat: PixelMapFormat.RGBA_8888,
    index: 0,
    fitDensity: 20
)
let pixelMap = imageSourceApi.createPixelMap(options: option)
```

### func createPixelMapList(DecodingOptions)

```cangjie
public func createPixelMapList(options!: DecodingOptions = DecodingOptions()): Array<PixelMap>
```

**功能：** 通过图片解码参数创建PixelMap数组。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|options|[DecodingOptions](#class-decodingoptions)|否|DecodingOptions()| **命名参数。** 解码参数。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[PixelMap](#class-pixelmap)>|返回PixeMap数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980096|The operation failed.|
  |62980099|The shared memory data is abnormal.|
  |62980101|The image data is abnormal.|
  |62980103|The image data is not supported.|
  |62980106|The image is too large.|
  |62980109|Failed to crop the image.|
  |62980110|The image source data is incorrect.|
  |62980111|The image source data is incomplete.|
  |62980112|The image format does not match.|
  |62980113|Unknown image format.|
  |62980115|Invalid image parameter.|
  |62980116|Failed to decode the image.|
  |62980118|Failed to create the image plugin.|
  |62980122|The image decoding header is abnormal.|
  |62980137|Invalid media operation.|
  |62980173|The DMA memory does not exist.|
  |62980174|The DMA memory data is abnormal.|

### func getDelayTimeList()

```cangjie
public func getDelayTimeList(): Array<Int32>
```

**功能：** 获取图像延迟时间数组。此接口仅用于gif图片。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<Int32>|返回延迟时间数组。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980096|The operation failed.|
  |62980110|The image source data is incorrect.|
  |62980111|The image source data is incomplete.|
  |62980112|The image format does not match.|
  |62980113|Unknown image format.|
  |62980115|Invalid image parameter.|
  |62980116|Failed to decode the image.|
  |62980118|Failed to create the image plugin.|
  |62980122|The image decoding header is abnormal.|
  |62980137|Invalid media operation.|
  |62980149|Invalid MIME type for the image source.|

### func getFrameCount()

```cangjie
public func getFrameCount(): UInt32
```

**功能：** 获取图像帧数。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回图像帧数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980096|The operation failed.|
  |62980110|The image source data is incorrect.|
  |62980111|The image source data is incomplete.|
  |62980112|The image format does not match.|
  |62980113|Unknown image format.|
  |62980115|Invalid image parameter.|
  |62980116|Failed to decode the image.|
  |62980118|Failed to create the image plugin.|
  |62980122|The image decoding header is abnormal.|
  |62980137|Invalid media operation.|

### func getImageInfo(UInt32)

```cangjie
public func getImageInfo(index!: UInt32 = 0): ImageInfo
```

**功能：** 获取图片信息。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|UInt32|否|0| **命名参数。** 创建图片源时的序号，不选择时默认为0。|

**返回值：**

|类型|说明|
|:----|:----|
|[ImageInfo](#class-imageinfo)|返回获取到的图片信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
imageSourceApi.getImageInfo(index : 0)
```

### func getImageProperty(PropertyKey, ImagePropertyOptions)

```cangjie
public func getImageProperty(key: PropertyKey, options!: ImagePropertyOptions = ImagePropertyOptions()): String
```

**功能：** 获取图片中给定索引处图像的指定属性键的值，仅支持JPEG文件，且需要包含exif信息。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|[PropertyKey](#enum-propertykey)|是|-|图片属性名。|
|options|[ImagePropertyOptions](#class-imagepropertyoptions)|否|ImagePropertyOptions()|**命名参数。** 图片属性，包括图片序号与默认属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|String|获取图片属性值，如获取失败则返回属性默认值。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
imageSourceApi.getImageProperty(IMAGE_LENGTH)
```

### func modifyImageProperty(PropertyKey, String)

```cangjie
public func modifyImageProperty(key: PropertyKey, value: String): Unit
```

**功能：** 通过指定的键修改图片属性的值，仅支持JPEG文件，且需要包含exif信息。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|[PropertyKey](#enum-propertykey)|是|-|图片属性名。|
|value|String|是|-|属性值。|

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放图片源实例。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
imageSourceApi.release()
```

### func updateData(Array\<UInt8>, Bool, UInt32, UInt32)

```cangjie
public func updateData(buf: Array<UInt8>, isFinished: Bool, offset: UInt32, length: UInt32): Unit
```

**功能：** 更新增量数据，配合CreateIncrementalSource使用。

**系统能力：** SystemCapability.Multimedia.Image.ImageSource

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|是|-|增量数据。|
|isFinished|Bool|是|-|是否更新完。|
|offset|UInt32|是|-|偏移量。|
|length|UInt32|是|-|数组长。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let testPng = Array<UInt8>(16500, repeat: 0)
let bufferSize = 5000
var offset = 0
var isFinished = false
while (offset < testPng.size) {
    var oneStep = testPng.slice(offset, min(bufferSize, testPng.size - offset))
    if (oneStep.size < bufferSize) {
        isFinished = true
    }
    imageSourceApi.updateData(oneStep, isFinished, 0, UInt32(oneStep.size))
    offset = offset + oneStep.size
}
```

## class InitializationOptions

```cangjie
public class InitializationOptions {
    public var alphaType: AlphaType
    public var editable: Bool
    public var srcPixelFormat: PixelMapFormat
    public var pixelFormat: PixelMapFormat
    public var scaleMode: ScaleMode
    public var size: Size
    public init(alphaType!: AlphaType = AlphaType.PREMUL, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888,
        pixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888, scaleMode!: ScaleMode = ScaleMode.FIT_TARGET_SIZE,
        size!: Size)
}
```

**功能：** PixelMap的初始化选项。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var alphaType

```cangjie
public var alphaType: AlphaType
```

**功能：** 透明度。

**类型：** [AlphaType](#enum-alphatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var editable

```cangjie
public var editable: Bool
```

**功能：** 是否可编辑。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**功能：** 像素格式。

**类型：** [PixelMapFormat](#enum-pixelmapformat)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var scaleMode

```cangjie
public var scaleMode: ScaleMode
```

**功能：** 缩略值。

**类型：** [ScaleMode](#enum-scalemode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var size

```cangjie
public var size: Size
```

**功能：** 创建图片大小。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var srcPixelFormat

```cangjie
public var srcPixelFormat: PixelMapFormat
```

**功能：** 传入的buffer数据的像素格式。默认值为BGRA_8888。

**类型：** [PixelMapFormat](#enum-pixelmapformat)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(AlphaType, Bool, PixelMapFormat, PixelMapFormat, ScaleMode, Size)

```cangjie
public init(alphaType!: AlphaType = AlphaType.PREMUL, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888,
    pixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888, scaleMode!: ScaleMode = ScaleMode.FIT_TARGET_SIZE,
    size!: Size)
```

**功能：** 创建InitializationOptions对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|alphaType|[AlphaType](#enum-alphatype)|否|AlphaType.PREMUL|**命名参数。** 透明度。|
|editable|Bool|否|false|**命名参数。** 是否可编辑。|
|srcPixelFormat|[PixelMapFormat](#enum-pixelmapformat)|否|PixelMapFormat.BGRA_8888|**命名参数。** 传入的buffer数据的像素格式。|
|pixelFormat|[PixelMapFormat](#enum-pixelmapformat)|否|PixelMapFormat.BGRA_8888|**命名参数。**  像素格式。|
|scaleMode|[ScaleMode](#enum-scalemode)|否|ScaleMode.FIT_TARGET_SIZE|**命名参数。** 缩略值。|
|size|[Size](#class-size)|是|-|**命名参数。** 创建图片大小。|

## class PackingOption

```cangjie
public class PackingOption {
    public var format: String
    public var quality: UInt8
    public var bufferSize: UInt64
    public var desiredDynamicRange: PackingDynamicRange
    public var needsPackProperties: Bool
    public init(format: String, quality: UInt8, desiredDynamicRange: PackingDynamicRange, needsPackProperties: Bool,
        bufferSize!: UInt64 = 25 * 1024 * 1024)
}
```

**功能：** 表示图片打包选项。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var bufferSize

```cangjie
public var bufferSize: UInt64
```

**功能：** 接收编码数据的缓冲区大小，单位为Byte。如果不设置大小，默认为25M。如果编码图片超过25M，需要指定大小。bufferSize需大于编码后图片大小。使用[packToFile](#func-packtofileimagesource-int32-packingoption)不受此参数限制。

**类型：** UInt64

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: PackingDynamicRange
```

**功能：** 目标动态范围。默认值为SDR。

**类型：** [PackingDynamicRange](#enum-packingdynamicrange)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var format

```cangjie
public var format: String
```

**功能：** 目标格式。</br>当前只支持"image/jpeg"、"image/webp"、"image/png"和"image/heif"（不同硬件设备支持情况不同）。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var needsPackProperties

```cangjie
public var needsPackProperties: Bool
```

**功能：** 是否需要编码图片属性信息，例如EXIF。默认值为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var quality

```cangjie
public var quality: UInt8
```

**功能：** JPEG编码中设定输出图片质量的参数，取值范围为0-100。0质量最低，100质量最高，质量越高生成图片所占空间越大。

**类型：** UInt8

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(String, UInt8, PackingDynamicRange, Bool, UInt64)

```cangjie
public init(format: String, quality: UInt8, desiredDynamicRange: PackingDynamicRange, needsPackProperties: Bool,
    bufferSize!: UInt64 = 25 * 1024 * 1024)
```

**功能：** 创建PackingOption对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|format|String|是|-|目标格式。</br>当前只支持"image/jpeg"、"image/webp"、"image/png"和"image/heif"（不同硬件设备支持情况不同）。|
|quality|UInt8|是|-|JPEG编码中设定输出图片质量的参数，取值范围为0-100。0质量最低，100质量最高，质量越高生成图片所占空间越大。|
|desiredDynamicRange|[PackingDynamicRange](#enum-packingdynamicrange)|是|-|**命名参数。** 目标动态范围。|
|needsPackProperties|Bool|是|-|**命名参数。** 是否需要编码图片属性信息，例如EXIF。|
|bufferSize|UInt64|否|25 * 1024 * 1024|**命名参数。** 接收编码数据的缓冲区大小，单位为Byte。如果不设置大小，默认为25M。如果编码图片超过25M，需要指定大小。bufferSize需大于编码后图片大小。使用[packToFile](#func-packtofileimagesource-int32-packingoption)不受此参数限制。|

## class PixelMap

```cangjie
public class PixelMap {}
```

**功能：** 图像像素类，用于读取或写入图像数据以及获取图像信息。在调用PixelMap的方法前，需要先通过[createPixelMap](#func-createpixelmaparrayuint8-initializationoptions)创建一个PixelMap实例。目前pixelmap序列化大小最大128MB，超过会送显失败。大小计算方式为(宽\*高\*每像素占用字节数)。

PixelMap支持通过worker跨线程调用。当PixelMap通过Worker跨线程后，原线程的PixelMap的所有接口均不能调用，否则将报错501服务器不具备完成请求的功能。

在调用PixelMap的方法前，需要先通过[createPixelMap](#func-createpixelmaparrayuint8-initializationoptions)构建一个PixelMap对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### prop isEditable

```cangjie
public prop isEditable: Bool
```

**功能：** 设定图像像素是否可被编辑。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### prop isStrideAlignment

```cangjie
public prop isStrideAlignment: Bool
```

**功能：** 设定图像内存是否为DMA内存。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func applyColorSpace(ColorSpaceManager)

```cangjie
public func applyColorSpace(targetColorSpace: ColorSpaceManager): Unit
```

**功能：** 根据输入的目标色彩空间对图像像素颜色进行色彩空间转换。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|targetColorSpace|[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)|是|-|目标色彩空间，支持SRGB、DCI_P3、DISPLAY_P3、ADOBE_RGB_1998。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|The parameter check failed.|
  |62980104|Failed to initialize the internal object.|
  |62980108|Failed to convert the color space.|
  |62980115|Invalid image parameter.|

### func createAlphaPixelmap()

```cangjie
public func createAlphaPixelmap(): PixelMap
```

**功能：** 根据Alpha通道的信息，来生成一个仅包含Alpha通道信息的pixelmap，可用于阴影效果。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[PixelMap](#class-pixelmap)|返回pixelmap实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let alphaPixelmap = pixelMap.createAlphaPixelmap()
```

### func crop(Region)

```cangjie
public func crop(region: Region): Unit
```

**功能：** 根据输入的尺寸对图片进行裁剪。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|region|[Region](#class-region)|是|-|裁剪的尺寸。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let region: Region = Region(Size(height: 100, width: 100), 0, 0)
pixelMap.crop(region)
```

### func flip(Bool, Bool)

```cangjie
public func flip(horizontal: Bool, vertical: Bool): Unit
```

**功能：** 根据输入的条件对图片进行翻转。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|horizontal|Bool|是|-|水平翻转。|
|vertical|Bool|是|-|垂直翻转。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let horizontal: Bool = true
let vertical: Bool = false
pixelMap.flip(horizontal, vertical)
```

### func getBytesNumberPerRow()

```cangjie
public func getBytesNumberPerRow(): UInt32
```

**功能：** 获取图像像素每行字节数。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|图像像素的行字节数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let rowCount : UInt32 = pixelMap.getBytesNumberPerRow()
```

### func getColorSpace()

```cangjie
public func getColorSpace(): ColorSpaceManager
```

**功能：** 获取图像广色域信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)|图像广色域信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980101|If the image data abnormal.|
  |62980103|If the image data unsupport.|
  |62980115|If the image parameter invalid.|

### func getDensity()

```cangjie
public func getDensity(): Int32
```

**功能：** 获取当前图像像素的密度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|图像像素的密度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let getDensity : Int32 = pixelMap.getDensity()
```

### func getImageInfo()

```cangjie
public func getImageInfo(): ImageInfo
```

**功能：** 获取图像像素信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ImageInfo](#class-imageinfo)|用于获取图像像素信息，失败时返回错误信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
pixelMap.getImageInfo()
```

### func getPixelBytesNumber()

```cangjie
public func getPixelBytesNumber(): UInt32
```

**功能：** 获取图像像素的总字节数。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|图像像素的总字节数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let pixelBytesNumber : UInt32 = pixelMap.getPixelBytesNumber()
```

### func opacity(Float32)

```cangjie
public func opacity(rate: Float32): Unit
```

**功能：** 通过设置透明比率来让PixelMap达到对应的透明效果。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rate|Float32|是|-|透明比率的值。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let rate: Float32 = 0.5
pixelMap.opacity(rate)
```

### func readPixels(PositionArea)

```cangjie
public func readPixels(area: PositionArea): Unit
```

**功能：** 读取区域内的图片数据。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|area|[PositionArea](#class-positionarea)|是|-|区域大小，根据区域读取。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let area: PositionArea = PositionArea(
    Array<UInt8>(8, repeat: 0),
    0,
    8,
    Region(Size(height: 1, width: 2), 0, 0)
)
pixelMap.readPixels(area)
```

### func readPixelsToBuffer(Array\<UInt8>)

```cangjie
public func readPixelsToBuffer(dst: Array<UInt8>): Unit
```

**功能：** 读取图像像素数据，结果写入Array\<UInt8>里返回。指定BGRA_8888格式创建pixelmap，读取的像素数据与原数据保持一致。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dst|Array\<UInt8>|是|-|缓冲区，函数执行结束后获取的图像像素数据写入到该内存区域内。缓冲区大小由[getPixelBytesNumber](#func-getpixelbytesnumber)接口获取。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let readBuffer: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96为需要创建的像素buffer大小，取值为：height * width *4
pixelMap.readPixelsToBuffer(readBuffer)
```

### func release()

```cangjie
public func release(): Unit
```

**功能：** 释放PixelMap对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
pixelMap.release()
```

### func rotate(Float32)

```cangjie
public func rotate(angle: Float32): Unit
```

**功能：** 根据输入的角度对图片进行旋转。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|angle|Float32|是|-|图片旋转的角度。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let angle: Float32 = 90.0
pixelMap.rotate(angle)
```

### func scale(Float32, Float32)

```cangjie
public func scale(x: Float32, y: Float32): Unit
```

**功能：** 根据输入的宽高对图片进行缩放。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|宽度的缩放倍数。|
|y|Float32|是|-|高度的缩放倍数。|

### func setColorSpace(ColorSpaceManager)

```cangjie
public func setColorSpace(colorSpace: ColorSpaceManager): Unit
```

**功能：** 设置图像广色域信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|colorSpace|[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)|是|-|图像广色域信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Image错误码](../../errorcodes/cj-errorcode-image.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |62980111|If the operation invalid.|
  |62980115|If the image parameter invalid.|

### func translate(Float32, Float32)

```cangjie
public func translate(x: Float32, y: Float32): Unit
```

**功能：** 根据输入的坐标对图片进行位置变换。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|区域横坐标。|
|y|Float32|是|-|区域纵坐标。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let translateX: Float32 = 50.0
let translateY: Float32 = 10.0
pixelMap.translate(translateX, translateY)
```

### func writeBufferToPixels(Array\<UInt8>)

```cangjie
public func writeBufferToPixels(src: Array<UInt8>): Unit
```

**功能：** 读取缓冲区中的图片数据，结果写入PixelMap中。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|src|Array\<UInt8>|是|-|图像像素数据。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let color: Array<UInt8> = Array<UInt8>(96, {i => UInt8(i)}) //96为需要创建的像素buffer大小，取值为：height * width *4
pixelMap.writeBufferToPixels(color)
```

### func writePixels(PositionArea)

```cangjie
public func writePixels(area: PositionArea): Unit
```

**功能：** 将PixelMap写入指定区域内。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|area|[PositionArea](#class-positionarea)|是|-|区域，根据区域写入。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let area: PositionArea = PositionArea(
    Array<UInt8>(8, {i => UInt8(i)}),
    0,
    8,
    Region(Size(height: 1, width: 2), 0, 0)
)
pixelMap.writePixels(area)
```

## class PositionArea

```cangjie
public class PositionArea {
    public var pixels: Array<UInt8>
    public var offset: UInt32
    public var stride: UInt32
    public var region: Region
    public init(pixels: Array<UInt8>, offset: UInt32, stride: UInt32, region: Region)
}
```

**功能：** 表示图片指定区域内的数据。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var offset

```cangjie
public var offset: UInt32
```

**功能：** 偏移量。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var pixels

```cangjie
public var pixels: Array<UInt8>
```

**功能：** 像素。

**类型：** Array\<UInt8>

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var region

```cangjie
public var region: Region
```

**功能：** 区域，按照区域读写。写入的区域宽度加X坐标不能大于原图的宽度，写入的区域高度加Y坐标不能大于原图的高度。

**类型：** [Region](#class-region)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var stride

```cangjie
public var stride: UInt32
```

**功能：** 跨距，内存中每行像素所占的空间。stride >= region.size.width*4。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(Array\<UInt8>, UInt32, UInt32, Region)

```cangjie
public init(pixels: Array<UInt8>, offset: UInt32, stride: UInt32, region: Region)
```

**功能：** 创建PositionArea对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|pixels|Array\<UInt8>|是|-|像素。|
|offset|UInt32|是|-|偏移量。|
|stride|UInt32|是|-|跨距，内存中每行像素所占的空间。stride >= region.size.width*4。|
|region|[Region](#class-region)|是|-|区域，按照区域读写。写入的区域宽度加X坐标不能大于原图的宽度，写入的区域高度加Y坐标不能大于原图的高度。|

## class Region

```cangjie
public class Region {
    public var size: Size
    public var x: Int32
    public var y: Int32
    public init(size: Size, x: Int32, y: Int32)
}
```

**功能：** 表示区域信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var size

```cangjie
public var size: Size
```

**功能：** 区域大小。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var x

```cangjie
public var x: Int32
```

**功能：** 区域横坐标。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var y

```cangjie
public var y: Int32
```

**功能：** 区域纵坐标。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(Size, Int32, Int32)

```cangjie
public init(size: Size, x: Int32, y: Int32)
```

**功能：** 创建Region对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|[Size](#class-size)|是|-|区域大小。|
|x|Int32|是|-|区域横坐标。|
|y|Int32|是|-|区域纵坐标。|

## class Size

```cangjie
public class Size {
    public var height: Int32
    public var width: Int32
    public init(height: Int32, width: Int32)
}
```

**功能：** 表示图片尺寸。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var height

```cangjie
public var height: Int32
```

**功能：** 输出图片的高。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var width

```cangjie
public var width: Int32
```

**功能：** 输出图片的宽。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(Int32, Int32)

```cangjie
public init(height: Int32, width: Int32)
```

**功能：** 创建Size对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|height|Int32|否|0| **命名参数。** 输出图片的高。|
|width|Int32|否|0| **命名参数。** 输出图片的宽。|

## class SourceOptions

```cangjie
public class SourceOptions {
    public var sourceDensity: Int32
    public var sourcePixelFormat: PixelMapFormat
    public var sourceSize: Size
    public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.UNKNOWN, sourceSize!: Size = Size(0, 0))
}
```

**功能：** ImageSource的初始化选项。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var sourceDensity

```cangjie
public var sourceDensity: Int32
```

**功能：** 图片资源像素密度，单位DPI。

在解码参数[DecodingOptions](#class-decodingoptions)未设置desiredSize的前提下，当前参数SourceOptions.sourceDensity与DecodingOptions.fitDensity非零时将对解码输出的pixelmap进行缩放。

缩放后宽计算公式如下(高同理)：(width * fitDensity + (sourceDensity >> 1)) / sourceDensity。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var sourcePixelFormat

```cangjie
public var sourcePixelFormat: PixelMapFormat
```

**功能：** 图片像素格式，默认值为UNKNOWN。

**类型：** [PixelMapFormat](#enum-pixelmapformat)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### var sourceSize

```cangjie
public var sourceSize: Size
```

**功能：** 图像像素大小，默认值为空。

**类型：** [Size](#class-size)

**读写能力：** 可读写

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### init(Int32, PixelMapFormat, Size)

```cangjie
public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.UNKNOWN, sourceSize!: Size = Size(0, 0))
```

**功能：** 创建SourceOptions对象。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sourceDensity|Int32|否|0| **命名参数。** 图片资源像素密度，单位DPI。<br>在解码参数[DecodingOptions](#class-decodingoptions)未设置desiredSize的前提下，当前参数SourceOptions.sourceDensity与DecodingOptions.fitDensity非零时将对解码输出的pixelmap进行缩放。<br>缩放后宽计算公式如下(高同理)：(width * fitDensity + (sourceDensity >> 1))|
|sourcePixelFormat|[PixelMapFormat](#enum-pixelmapformat)|否|PixelMapFormat.UNKNOWN| **命名参数。** 图片像素格式，默认值为UNKNOWN。|
|sourceSize|[Size](#class-size)|否|Size(height: 0, width: 0)| **命名参数。** 图像像素大小，默认值为空。|

## enum AlphaType

```cangjie
public enum AlphaType <: Equatable<AlphaType> & ToString {
    | UNKNOWN
    | OPAQUE
    | PREMUL
    | UNPREMUL
    | ...
}
```

**功能：** 图像的透明度类型。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<AlphaType>
- ToString

### OPAQUE

```cangjie
OPAQUE
```

**功能：** 没有alpha或图片不透明。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PREMUL

```cangjie
PREMUL
```

**功能：** RGB前乘alpha。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知透明度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### UNPREMUL

```cangjie
UNPREMUL
```

**功能：** RGB不前乘alpha。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(AlphaType)

```cangjie
public operator func !=(other: AlphaType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlphaType](#enum-alphatype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AlphaType)

```cangjie
public operator func ==(other: AlphaType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AlphaType](#enum-alphatype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ComponentType

```cangjie
public enum ComponentType <: Equatable<ComponentType> & ToString {
    | YUV_Y
    | YUV_U
    | YUV_V
    | JPEG
    | ...
}
```

**功能：** 图像的组件类型。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<ComponentType>
- ToString

### JPEG

```cangjie
JPEG
```

**功能：** JPEG 类型。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YUV_U

```cangjie
YUV_U
```

**功能：** 色度信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YUV_V

```cangjie
YUV_V
```

**功能：** 色度信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YUV_Y

```cangjie
YUV_Y
```

**功能：** 亮度信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(ComponentType)

```cangjie
public operator func !=(other: ComponentType): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ComponentType](#enum-componenttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ComponentType)

```cangjie
public operator func ==(other: ComponentType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ComponentType](#enum-componenttype)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.ImageReceiver

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum DecodingDynamicRange

```cangjie
public enum DecodingDynamicRange <: Equatable<DecodingDynamicRange> & ToString {
    | AUTO
    | SDR
    | HDR
    | ...
}
```

**功能：** 描述解码时期望的图像动态范围。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<DecodingDynamicRange>
- ToString

### AUTO

```cangjie
AUTO
```

**功能：** 自适应，根据图片信息处理。即如果图片本身为HDR图片，则会按照HDR内容解码；反之按照SDR内容解码。通过[CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions)创建的imagesource会解码为SDR内容。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### HDR

```cangjie
HDR
```

**功能：** 按照高动态范围处理图片。通过[CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions)创建的imagesource会解码为SDR内容。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SDR

```cangjie
SDR
```

**功能：** 按照标准动态范围处理图片。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(DecodingDynamicRange)

```cangjie
public operator func !=(other: DecodingDynamicRange): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DecodingDynamicRange](#enum-decodingdynamicrange)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(DecodingDynamicRange)

```cangjie
public operator func ==(other: DecodingDynamicRange): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[DecodingDynamicRange](#enum-decodingdynamicrange)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ImageFormat

```cangjie
public enum ImageFormat <: Equatable<ImageFormat> & ToString {
    | YCBCR_422_SP
    | JPEG
    | ...
}
```

**功能：** 图片格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<ImageFormat>
- ToString

### JPEG

```cangjie
JPEG
```

**功能：** JPEG编码格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YCBCR_422_SP

```cangjie
YCBCR_422_SP
```

**功能：** YCBCR422半平面格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(ImageFormat)

```cangjie
public operator func !=(other: ImageFormat): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageFormat](#enum-imageformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ImageFormat)

```cangjie
public operator func ==(other: ImageFormat): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ImageFormat](#enum-imageformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PackingDynamicRange

```cangjie
public enum PackingDynamicRange <: Equatable<PackingDynamicRange> & ToString {
    | AUTO
    | SDR
    | ...
}
```

**功能：** 描述编码时期望的图像动态范围。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<PackingDynamicRange>
- ToString

### AUTO

```cangjie
AUTO
```

**功能：** 自适应，根据[pixelmap](#class-pixelmap)内容处理。即如果pixelmap本身为HDR，则会按照HDR内容进行编码；反之按照SDR内容编码。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SDR

```cangjie
SDR
```

**功能：** 按照标准动态范围处理图片。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(PackingDynamicRange)

```cangjie
public operator func !=(other: PackingDynamicRange): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PackingDynamicRange](#enum-packingdynamicrange)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PackingDynamicRange)

```cangjie
public operator func ==(other: PackingDynamicRange): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PackingDynamicRange](#enum-packingdynamicrange)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PixelMapFormat

```cangjie
public enum PixelMapFormat <: Equatable<PixelMapFormat> & ToString {
    | UNKNOWN
    | RGB_565
    | RGBA_8888
    | BGRA_8888
    | RGB_888
    | ALPHA_8
    | RGBA_F16
    | NV21
    | NV12
    | RGBA_1010102
    | YCBCR_P010
    | YCRCB_P010
    | ...
}
```

**功能：** 图片像素格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<PixelMapFormat>
- ToString

### ALPHA_8

```cangjie
ALPHA_8
```

**功能：** 格式为ALPHA_8。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### BGRA_8888

```cangjie
BGRA_8888
```

**功能：** 格式为BGRA_8888。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### NV12

```cangjie
NV12
```

**功能：** 格式为NV12。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### NV21

```cangjie
NV21
```

**功能：** 格式为NV21。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RGBA_1010102

```cangjie
RGBA_1010102
```

**功能：** 格式为RGBA_1010102。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RGBA_8888

```cangjie
RGBA_8888
```

**功能：** 格式为RGBA_8888。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RGBA_F16

```cangjie
RGBA_F16
```

**功能：** 格式为RGBA_F16。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RGB_565

```cangjie
RGB_565
```

**功能：** 格式为RGB_565。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RGB_888

```cangjie
RGB_888
```

**功能：** 格式为RGB_888。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知格式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YCBCR_P010

```cangjie
YCBCR_P010
```

**功能：** 格式为YCBCR_P010。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### YCRCB_P010

```cangjie
YCRCB_P010
```

**功能：** 格式为YCRCB_P010。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(PixelMapFormat)

```cangjie
public operator func !=(other: PixelMapFormat): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PixelMapFormat](#enum-pixelmapformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PixelMapFormat)

```cangjie
public operator func ==(other: PixelMapFormat): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PixelMapFormat](#enum-pixelmapformat)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PropertyKey

```cangjie
public enum PropertyKey <: ToString & Equatable<PropertyKey> {
    | IMAGE_WIDTH
    | IMAGE_LENGTH
    | BITS_PER_SAMPLE
    | IMAGE_DESCRIPTION
    | MAKE
    | MODEL
    | ORIENTATION
    | DATE_TIME
    | PHOTO_MODE
    | EXPOSURE_TIME
    | F_NUMBER
    | GPS_LATITUDE_REF
    | GPS_LATITUDE
    | GPS_LONGITUDE_REF
    | GPS_LONGITUDE
    | GPS_TIME_STAMP
    | GPS_DATE_STAMP
    | ISO_SPEED_RATINGS
    | SENSITIVITY_TYPE
    | STANDARD_OUTPUT_SENSITIVITY
    | RECOMMENDED_EXPOSURE_INDEX
    | ISO_SPEED
    | DATE_TIME_ORIGINAL
    | APERTURE_VALUE
    | EXPOSURE_BIAS_VALUE
    | METERING_MODE
    | LIGHT_SOURCE
    | FLASH
    | FOCAL_LENGTH
    | SCENE_FOOD_CONF
    | SCENE_STAGE_CONF
    | SCENE_BLUE_SKY_CONF
    | SCENE_GREEN_PLANT_CONF
    | SCENE_BEACH_CONF
    | SCENE_SNOW_CONF
    | SCENE_SUNSET_CONF
    | SCENE_FLOWERS_CONF
    | SCENE_NIGHT_CONF
    | SCENE_TEXT_CONF
    | FACE_COUNT
    | CAPTURE_MODE
    | ROLL_ANGLE
    | PITCH_ANGLE
    | PHYSICAL_APERTURE
    | FOCUS_MODE
    | USER_COMMENT
    | PIXEL_X_DIMENSION
    | PIXEL_Y_DIMENSION
    | SCENE_TYPE
    | WHITE_BALANCE
    | FOCAL_LENGTH_IN_35_MM_FILM
    | ...
}
```

**功能：** Exif（Exchangeable image file format）图片信息。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- ToString
- Equatable\<PropertyKey>

### APERTURE_VALUE

```cangjie
APERTURE_VALUE
```

**功能：** 光圈值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### BITS_PER_SAMPLE

```cangjie
BITS_PER_SAMPLE
```

**功能：** 每个像素比特数。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### CAPTURE_MODE

```cangjie
CAPTURE_MODE
```

**功能：** 捕获模式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### DATE_TIME

```cangjie
DATE_TIME
```

**功能：** 日期时间。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### DATE_TIME_ORIGINAL

```cangjie
DATE_TIME_ORIGINAL
```

**功能：** 拍摄时间，例如2022:09:06 15:48:00。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### EXPOSURE_BIAS_VALUE

```cangjie
EXPOSURE_BIAS_VALUE
```

**功能：** 曝光偏差值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### EXPOSURE_TIME

```cangjie
EXPOSURE_TIME
```

**功能：** 曝光时间，例如1/33 sec。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FACE_COUNT

```cangjie
FACE_COUNT
```

**功能：** 人脸数量。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FLASH

```cangjie
FLASH
```

**功能：** 闪光灯,记录闪光灯状态。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FOCAL_LENGTH

```cangjie
FOCAL_LENGTH
```

**功能：** 焦距。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FOCAL_LENGTH_IN_35_MM_FILM

```cangjie
FOCAL_LENGTH_IN_35_MM_FILM
```

**功能：** 焦距35毫米胶片。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FOCUS_MODE

```cangjie
FOCUS_MODE
```

**功能：** 对焦模式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### F_NUMBER

```cangjie
F_NUMBER
```

**功能：** 光圈值，例如f/1.8。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_DATE_STAMP

```cangjie
GPS_DATE_STAMP
```

**功能：** GPS日期戳。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_LATITUDE

```cangjie
GPS_LATITUDE
```

**功能：** 图片纬度。修改时应按"度,分,秒"格式传入，如"39,54,7.542"。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_LATITUDE_REF

```cangjie
GPS_LATITUDE_REF
```

**功能：** 纬度引用，例如N或S。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_LONGITUDE

```cangjie
GPS_LONGITUDE
```

**功能：** 图片经度。修改时应按"度,分,秒"格式传入，如"116,19,42.16"。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_LONGITUDE_REF

```cangjie
GPS_LONGITUDE_REF
```

**功能：** 经度引用，例如W或E。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### GPS_TIME_STAMP

```cangjie
GPS_TIME_STAMP
```

**功能：** GPS时间戳。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### IMAGE_DESCRIPTION

```cangjie
IMAGE_DESCRIPTION
```

**功能：** 图像信息描述。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### IMAGE_LENGTH

```cangjie
IMAGE_LENGTH
```

**功能：** 图片长度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### IMAGE_WIDTH

```cangjie
IMAGE_WIDTH
```

**功能：** 图片宽度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### ISO_SPEED

```cangjie
ISO_SPEED
```

**功能：** ISO速度等级。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### ISO_SPEED_RATINGS

```cangjie
ISO_SPEED_RATINGS
```

**功能：** ISO感光度，例如400。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### LIGHT_SOURCE

```cangjie
LIGHT_SOURCE
```

**功能：** 光源。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### MAKE

```cangjie
MAKE
```

**功能：** 生产商。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### METERING_MODE

```cangjie
METERING_MODE
```

**功能：** 测光模式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### MODEL

```cangjie
MODEL
```

**功能：** 设备型号。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**功能：** 图片方向。<br/>- 1：Top-left，图像未旋转。<br/>- 2：Top-right，镜像水平翻转。<br/>- 3：Bottom-right，图像旋转180°。<br/>- 4：Bottom-left，镜像垂直翻转。<br/>- 5：Left-top，镜像水平翻转再顺时针旋转270°。<br/>- 6：Right-top，顺时针旋转90°。<br/>- 7：Right-bottom，镜像水平翻转再顺时针旋转90°。<br/>- 8：Left-bottom，顺时针旋转270°。<br/>- 未定义值返回Unknown Value。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PHOTO_MODE

```cangjie
PHOTO_MODE
```

**功能：** 拍照模式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PHYSICAL_APERTURE

```cangjie
PHYSICAL_APERTURE
```

**功能：** 物理孔径，光圈大小。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PITCH_ANGLE

```cangjie
PITCH_ANGLE
```

**功能：** 俯仰角度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PIXEL_X_DIMENSION

```cangjie
PIXEL_X_DIMENSION
```

**功能：** 像素X尺寸。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### PIXEL_Y_DIMENSION

```cangjie
PIXEL_Y_DIMENSION
```

**功能：** 像素Y尺寸。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### RECOMMENDED_EXPOSURE_INDEX

```cangjie
RECOMMENDED_EXPOSURE_INDEX
```

**功能：** 推荐曝光指数。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### ROLL_ANGLE

```cangjie
ROLL_ANGLE
```

**功能：** 滚动角度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_BEACH_CONF

```cangjie
SCENE_BEACH_CONF
```

**功能：** 拍照场景：沙滩。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_BLUE_SKY_CONF

```cangjie
SCENE_BLUE_SKY_CONF
```

**功能：** 拍照场景：蓝天。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_FLOWERS_CONF

```cangjie
SCENE_FLOWERS_CONF
```

**功能：** 拍照场景：花。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_FOOD_CONF

```cangjie
SCENE_FOOD_CONF
```

**功能：** 拍照场景：食物。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_GREEN_PLANT_CONF

```cangjie
SCENE_GREEN_PLANT_CONF
```

**功能：** 拍照场景：绿植。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_NIGHT_CONF

```cangjie
SCENE_NIGHT_CONF
```

**功能：** 拍照场景：夜晚。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_SNOW_CONF

```cangjie
SCENE_SNOW_CONF
```

**功能：** 拍照场景：下雪。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_STAGE_CONF

```cangjie
SCENE_STAGE_CONF
```

**功能：** 拍照场景：舞台。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_SUNSET_CONF

```cangjie
SCENE_SUNSET_CONF
```

**功能：** 拍照场景：日落。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_TEXT_CONF

```cangjie
SCENE_TEXT_CONF
```

**功能：** 拍照场景：文本。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SCENE_TYPE

```cangjie
SCENE_TYPE
```

**功能：** 拍摄场景模式，例如人像、风光、运动、夜景等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### SENSITIVITY_TYPE

```cangjie
SENSITIVITY_TYPE
```

**功能：** 灵敏度类型。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### STANDARD_OUTPUT_SENSITIVITY

```cangjie
STANDARD_OUTPUT_SENSITIVITY
```

**功能：** 标准输出灵敏度。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### USER_COMMENT

```cangjie
USER_COMMENT
```

**功能：** 用户注释。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### WHITE_BALANCE

```cangjie
WHITE_BALANCE
```

**功能：** 白平衡。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(PropertyKey)

```cangjie
public operator func !=(other: PropertyKey): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PropertyKey](#enum-propertykey)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PropertyKey)

```cangjie
public operator func ==(other: PropertyKey): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[PropertyKey](#enum-propertykey)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ScaleMode

```cangjie
public enum ScaleMode <: Equatable<ScaleMode> & ToString {
    | FIT_TARGET_SIZE
    | CENTER_CROP
    | ...
}
```

**功能：** 图像的缩放模式。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**父类型：**

- Equatable\<ScaleMode>
- ToString

### CENTER_CROP

```cangjie
CENTER_CROP
```

**功能：** 缩放图像以填充目标图像区域并居中裁剪区域外的效果。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### FIT_TARGET_SIZE

```cangjie
FIT_TARGET_SIZE
```

**功能：** 图像适合目标尺寸的效果。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

### func !=(ScaleMode)

```cangjie
public operator func !=(other: ScaleMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScaleMode](#enum-scalemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScaleMode)

```cangjie
public operator func ==(other: ScaleMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[ScaleMode](#enum-scalemode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Multimedia.Image.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## 补充说明

### SVG标签说明

支持SVG标签，使用版本为(SVG) 1.1，当前支持的标签列表有：

- a
- circla
- clipPath
- defs
- ellipse
- feBlend
- feColorMatrix
- feComposite
- feDiffuseLighting
- feDisplacementMap
- feDistantLight
- feFlood
- feGaussianBlur
- feImage
- feMorphology
- feOffset
- fePointLight
- feSpecularLighting
- feSpotLight
- feTurbulence
- filter
- g
- image
- line
- linearGradient
- mask
- path
- pattern
- polygon
- polyline
- radialGradient
- rect
- stop
- svg
- text
- textPath
- tspan
- use
