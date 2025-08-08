# ohos.image (Image Processing)

This module provides image processing effects, including creating PixelMap through properties, reading image pixel data, reading image data within a specified region, etc.

## Import Module

```cangjie
import kit.ImageKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#Cangjie-Example-Code-Instructions).

## func createImageCreator(Size, Int32, Int32)

```cangjie
public func createImageCreator(size: Size, format: Int32, capacity: Int32): ImageCreator
```

**Function:** Creates an ImageCreator instance.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Size](#class-size) | Yes | - | Default size of the image. |
| format | Int32 | Yes | - | Image format, such as YCBCR_422_SP, JPEG. |
| capacity | Int32 | Yes | - | Maximum number of images that can be accessed simultaneously. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageCreator](#class-imagecreator) | Returns the ImageCreator instance. |

**Example:**

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

**Function:** Creates an ImagePacker instance.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ImagePacker](#class-imagepacker) | Returns the ImagePacker instance. |

**Example:**

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

**Function:** Creates an ImageReceiver instance with width, height, image format, and capacity.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Size](#class-size) | Yes | - | Default size of the image. This parameter does not affect the size of the received image. The actual returned size is determined by the producer, such as the camera. |
| format | [ImageFormat](#enum-imageformat) | Yes | - | Image format, which can be a constant of [ImageFormat](#enum-imageformat) (currently only ImageFormat:JPEG is supported). |
| capacity | Int32 | Yes | - | Maximum number of images that can be accessed simultaneously. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageReceiver](#class-imagereceiver) | If the operation is successful, returns the ImageReceiver instance. |

**Example:**

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

**Function:** Creates an image source instance using the specified URI.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | Image path. Currently, only application sandbox paths are supported. Supported formats include: .jpg, .png, .gif, .bmp, .webp, RAW, and [SVG](#SVG-Tag-Instructions). |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns the ImageSource instance. |

**Exceptions:**

- BusinessException: For details about the error codes, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**

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

**Function:** Creates an image source instance using the specified URI.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| uri | String | Yes | - | Image path. Currently, only application sandbox paths are supported. Supported formats include: .jpg, .png, .gif, .bmp, .webp, RAW, and [SVG](#SVG-Tag-Instructions). |
| options | [SourceOptions](#struct-sourceoptions) | Yes | - | Image properties, including image sequence number and default property values. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns the ImageSource instance. |

**Exceptions:**

- BusinessException: For details about the error codes, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**

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

**Function:** Creates an image source instance using the specified file descriptor.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor fd. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns the ImageSource instance. |

**Exceptions:**

- BusinessException: For details about the error codes, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**

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

**Function:** Creates an image source instance using the specified file descriptor.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| fd | Int32 | Yes | - | File descriptor fd. |
| options | [SourceOptions](#class-sourceoptions) | Yes | - | Image properties, including image sequence number and default property values. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns the ImageSource instance. |

**Exceptions:**

- BusinessException: For details about the error codes, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**<!-- compile -->

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

**Function:** Creates an image source instance from a buffer.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<UInt8> | Yes | - | Image buffer array. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns an ImageSource class instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let buf: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96 is the required pixel buffer size, calculated as: height * width *4
let imageSourceApi: ImageSource = createImageSource(buf)
```

## func createImageSource(Array\<UInt8>, SourceOptions)

```cangjie
public func createImageSource(buf: Array<UInt8>, options: SourceOptions): ImageSource
```

**Function:** Creates an image source instance from a buffer with specified options.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<UInt8> | Yes | - | Image buffer array. |
| options | [SourceOptions](#class-sourceoptions) | Yes | - | Image properties, including image index and default attributes. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns an ImageSource class instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980104 | Image initialization abnormal.      |
  | 62980115 | Invalid image parameter.            |

**Example:**

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

**Function:** Creates an image source instance from a RawFileDescriptor of an image resource file.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| rawfile | [RawFileDescriptor](../LocalizationKit/cj-apis-resource_manager.md#class-rawfiledescriptor) | Yes | - | RawFileDescriptor of the image resource file. |
| options | [SourceOptions](#class-sourceoptions) | No | SourceOptions(0) | **Named parameter.** Image properties, including pixel density, pixel format, and image dimensions. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns an ImageSource class instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import ohos.resource_manager.ResourceManager
import ohos.base.*

let resourceManager = ResourceManager.getResourceManager(Global.getStageContext()) // Context application context required, see usage instructions
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

**Function:** Creates an image source instance incrementally from a buffer. IncrementalSource does not support reading/writing Exif information.

The ImageSource instance created incrementally only supports the following functionalities:

- Get image information: specified index-[getImageInfo](#func-getimageinfouint32), direct fetch-[getImageInfo](#func-getimageinfo)
- Get the value of a specified property key for the image at the given index: [getImageProperty](#func-getimagepropertypropertykey-imagepropertyoptions)
- Update incremental data: [updateData](#func-updatedataarrayuint8-bool-uint32-uint32)
- Create PixelMap object: via image decoding parameters-[createPixelMap](#func-createpixelmapdecodingoptions)
- Release image source instance: [release](#func-release-1)

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<UInt8> | Yes | - | Incremental data (this parameter is not actually effective). |
| options | [SourceOptions](#class-sourceoptions) | No | SourceOptions(0) | **Named parameter.** Image properties, including image index and default attributes. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageSource](#class-imagesource) | Returns the image source. |

**Example:**

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

**Function:** Creates a PixelMap with specified properties. Defaults to BGRA_8888 format for data processing; currently only BGRA_8888 format is supported.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| colors | Array\<UInt8> | Yes | - | Color array in BGRA_8888 format. |
| options | [InitializationOptions](#class-initializationoptions) | Yes | - | Pixel creation properties, including transparency, dimensions, scale value, pixel format, and editability. |

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](#class-pixelmap) | Returns a PixelMap.<br>If the created pixelmap size exceeds the original image size, returns the original pixelmap size. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :------- | :--------------------------------------------|
  | 62980096 | If the operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let color: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96 is the required pixel buffer size, calculated as: height * width *4
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

**Function:** Describes an image color component.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let byteBuffer

```cangjie
public let byteBuffer: Array<UInt8>
```

**Function:** Component buffer.

**Type:** Array\<UInt8>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let componentType

```cangjie
public let componentType: ComponentType
```

**Function:** Component type.

**Type:** [ComponentType](#enum-componenttype)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let pixelStride

```cangjie
public let pixelStride: Int32
```

**Function:** Pixel spacing.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### let rowStride

```cangjie
public let rowStride: Int32
```

**Function:** Row stride.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

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

**Function:** Image decoding configuration options.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredColorSpace

```cangjie
public var desiredColorSpace:?ColorSpaceManager
```

**Function:** Target color space.

**Type:** ?[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: DecodingDynamicRange
```

**Function:** Target dynamic range, default value is SDR.

ImageSource created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions) does not support setting this property, default decoding is SDR content.

If the platform does not support HDR, setting is invalid, default decoding is SDR content.

**Type:** [DecodingDynamicRange](#enum-decodingdynamicrange)

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredPixelFormat

```cangjie
public var desiredPixelFormat: PixelMapFormat
```

**Function:** Decoded pixel format.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredRegion

```cangjie
public var desiredRegion: Region
```

**Function:** Decoding region.

**Type:** [Region](#class-region)

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredSize

```cangjie
public var desiredSize: Size
```

**Function:** Desired output size.

**Type:** [Size](#class-size)

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var editable

```cangjie
public var editable: Bool
```

**Function:** Whether editable. When set to false, the image cannot be modified further, operations like crop will fail.

**Type:** Bool

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var fitDensity

```cangjie
public var fitDensity: Int32
```

**Function:** Image pixel density, unit is ppi.

**Type:** Int32

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var index

```cangjie
public var index: UInt32
```

**Function:** Decoding image index.

**Type:** UInt32

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var rotate

```cangjie
public var rotate: UInt32
```

**Function:** Rotation angle.

**Type:** UInt32

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var sampleSize

```cangjie
public var sampleSize: UInt32
```

**Function:** Thumbnail sampling size, currently can only be set to 1.

**Type:** UInt32

**Read/Write Capability:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### init(UInt32, UInt32, Bool, Size, Region, PixelMapFormat, UInt32, Int32, ?ColorSpaceManager, DecodingDynamicRange)

```cangjie
public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
    desiredSize!: Size = Size(0, 0), desiredRegion!: Region = Region(Size(0, 0), 0, 0),
    desiredPixelFormat!: PixelMapFormat = UNKNOWN, index!: UInt32 = 0, fitDensity!: Int32 = 0,
    desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = SDR)
```

**Function:** Creates a DecodingOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|sampleSize|UInt32|No|1|**Named parameter.** Thumbnail sampling size, currently can only be set to 1.|
|rotate|UInt32|No|0|**Named parameter.** Rotation angle.|
|editable|Bool|No|false|**Named parameter.** Whether editable. When set to false, the image cannot be modified further, operations like crop will fail.|
|desiredSize|[Size](#class-size)|No|Size(0, 0)|**Named parameter.** Desired output size.|
|desiredRegion|[Region](#class-region)|No|Region(Size(0, 0), 0, 0)|**Named parameter.** Decoding region.|
|desiredPixelFormat|[PixelMapFormat](#enum-pixelmapformat)|No|UNKNOWN|**Named parameter.** Decoded pixel format.|
|index|UInt32|No|0|**Named parameter.** Decoding image index.|
|fitDensity|Int32|No|0|**Named parameter.** Image pixel density, unit is ppi.|
|desiredColorSpace|?[ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager)|No|None|**Named parameter.** Target color space.|
|desiredDynamicRange|[DecodingDynamicRange](#enum-decodingdynamicrange)|No|SDR|**Named parameter.** Target dynamic range.<br>ImageSource created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions) does not support setting this property, default decoding is SDR content.<br>If the platform does not support HDR, setting is invalid, default decoding is SDR content.|

## class Image

```cangjie
public class Image {}
```

**Function:** Provides basic image operations including obtaining image information and reading/writing image data.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### prop clipRect

```cangjie
public prop clipRect: Region
```

**Function:** Image region to be cropped.

**Type:** [Region](#class-region)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### prop format

```cangjie
public prop format: Int32
```

**Function:** Image format, refer to [PixelMapFormat](#enum-pixelmapformat).

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### prop size

```cangjie
public prop size: Size
```

**Function:** Image size.**Type:** [Size](#class-size)

**Readable/Writable:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func getComponent(ComponentType)

```cangjie
public func getComponent(componentType: ComponentType): Component
```

**Description:** Retrieves the component buffer from the image based on the specified component type and returns the result.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| componentType | [ComponentType](#enum-componenttype) | Yes | - | The component type of the image. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Component](#class-component) | Returns the component buffer. |

**Example:**

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

**Description:** Releases the current image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Example:**

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

**Description:** The image creation module, used to request native image data regions and provide the capability to compile native image data for applications. An ImageCreator instance must be created before calling the following methods.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**Description:** The number of images that can be accessed simultaneously.

**Type:** Int32

**Readable/Writable:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### prop format

```cangjie
public prop format: Int32
```

**Description:** The image format.

**Type:** Int32

**Readable/Writable:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### func dequeueImage()

```cangjie
public func dequeueImage(): Image
```

**Description:** Retrieves a buffer image from the idle queue for drawing UI content.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [Image](#class-image) | Returns the latest image. |

**Example:**

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

**Description:** Places the drawn image into the Dirty queue.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| image | [Image](#class-image) | Yes | - | The drawn buffer image. |

**Example:**

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

**Description:** Releases the current image.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Example:**

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

**Description:** Represents image information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var alphaType

```cangjie
public var alphaType: AlphaType
```

**Description:** Transparency.

**Type:** [AlphaType](#enum-alphatype)

**Readable/Writable:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var density

```cangjie
public var density: Int32
```

**Description:** Pixel density, in ppi.

**Type:** Int32

**Readable/Writable:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var isHdr

```cangjie
public var isHdr: Bool
```

**Description:** Indicates whether the image is High Dynamic Range (HDR). For [ImageSource](#class-imagesource), it indicates whether the source image is HDR; for [PixelMap](#class-pixelmap), it indicates whether the decoded pixelmap is HDR.

**Type:** Bool

**Readable/Writable:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var mimeType

```cangjie
public var mimeType: String
```

**Description:** The actual image format (MIME type).

**Type:** String

**Readable/Writable:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**Description:** Pixel format.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Readable/Writable:** Read-write**System Capability:** SystemCapability.Multimedia.Image.Core  

**Initial Version:** 21  

### var size  

```cangjie  
public var size: Size  
```  

**Description:** The size of the image.  

**Type:** [Size](#class-size)  

**Access:** Read-write  

**System Capability:** SystemCapability.Multimedia.Image.Core  

**Initial Version:** 21  

### var stride  

```cangjie  
public var stride: Int32  
```  

**Description:** The stride, representing the space occupied by each row of pixels in memory. stride >= region.size.width*4.  

**Type:** Int32  

**Access:** Read-write  

**System Capability:** SystemCapability.Multimedia.Image.Core  

**Initial Version:** 21  

## class ImagePacker  

```cangjie  
public class ImagePacker {}  
```  

**Description:** The image packer class, used for image compression and packaging. Before calling methods of ImagePacker, an ImagePacker instance must be created via [createImagePacker](#func-createimagepacker). Currently supported formats include: JPEG, WebP, PNG.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

### prop supportedFormats  

```cangjie  
public prop supportedFormats: Array<String>  
```  

**Description:** Supported image packaging formats: JPEG, WebP, PNG.  

**Type:** Array\<String>  

**Access:** Read-only  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

### func packToData(ImageSource, PackingOption)  

```cangjie  
public func packToData(source: ImageSource, option: PackingOption): Array<UInt8>  
```  

**Description:** Compresses or re-encodes an image.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| source | [ImageSource](#class-imagesource) | Yes | - | The image source to be packed. |  
| option | [PackingOption](#class-packingoption) | Yes | - | Configuration for packing parameters. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<UInt8> | Returns the compressed or packed data. |  

**Exceptions:**  

- BusinessException: Error codes are listed below. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 62980115 | The operation failed. |  
  | 62980096 | If the parameter is invalid. |  
  | 62980101 | The image data is abnormal. |  
  | 62980106 | The image is too large. |  
  | 62980113 | Unknown image format. |  
  | 62980119 | If encoder occur error during encoding. |  
  | 62980120 | Add pixelmap out of range. |  
  | 62980172 | Failed to encode icc. |  
  | 62980252 | Failed to create surface. |  

**Example:**  

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

**Description:** Compresses or re-encodes an image.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| source | [PixelMap](#class-pixelmap) | Yes | - | The image source to be packed. |  
| option | [PackingOption](#class-packingoption) | Yes | - | Configuration for packing parameters. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Array\<UInt8> | Returns the compressed or packed data. |  

**Exceptions:**  

- BusinessException: Error codes are listed below. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).  

  | Error Code ID | Error Message |  
  |:---|:---|  
  | 62980115 | The operation failed. |  
  | 62980096 | If the parameter is invalid. |  
  | 62980101 | The image data is abnormal. |  
  | 62980106 | The image is too large. |  
  | 62980113 | Unknown image format. |  
  | 62980119 | If encoder occur error during encoding. |  
  | 62980120 | Add pixelmap out of range. |  
  | 62980172 | Failed to encode icc. |  
  | 62980252 | Failed to create surface. |  

**Example:**  

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

**Description:** Compresses or repackages an image into a file.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| source | [PixelMap](#class-pixelmap) | Yes | - | The image source to be packed. |  
| fd | Int32 | Yes | - | The file descriptor of the destination file. |  
| option | [PackingOption](#class-packingoption) | Yes | - | Configuration for packing parameters. |  

**Example:**  

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

**Description:** Compresses or repackages an image into a file.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| source | [ImageSource](#class-imagesource) | Yes | - | The image source to be packed. |  
| fd | Int32 | Yes | - | The file descriptor of the destination file. |  
| option | [PackingOption](#class-packingoption) | Yes | - | Configuration for packing parameters. |  

**Example:**  

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

**Description:** Releases the image packer instance.  

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker  

**Initial Version:** 21  

**Example:**  

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

**Description:** Represents the index for querying image properties.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var defaultValue

```cangjie
public var defaultValue: String
```

**Description:** Default property value.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var index

```cangjie
public var index: UInt32
```

**Description:** Image sequence number.

**Type:** UInt32

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ImagePropertyOptions(UInt32, String)

```cangjie
public ImagePropertyOptions(index!: UInt32 = 0, defaultValue!: String = "")
```

**Description:** Creates an ImagePropertyOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | UInt32 | No | 0 | **Named parameter.** Image sequence number. |
| defaultValue | String | No | "" | **Named parameter.** Default property value. |

## class ImageReceiver

```cangjie
public class ImageReceiver {}
```

**Description:** Image receiver class, used to obtain component surface ID, receive the latest image, read the next image, and release the ImageReceiver instance.

An ImageReceiver instance must be created before calling the following methods.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**Description:** Number of images that can be accessed simultaneously.

**Type:** Int32

**Access:** Read-Only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop format

```cangjie
public prop format: ImageFormat
```

**Description:** Image format.

**Type:** [ImageFormat](#enum-imageformat)

**Access:** Read-Only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop size

```cangjie
public prop size: Size
```

**Description:** Image size.

**Type:** [Size](#class-size)

**Access:** Read-Only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### func getReceivingSurfaceId()

```cangjie
public func getReceivingSurfaceId(): String
```

**Description:** Used to obtain a surface ID for Camera or other components.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the surface ID. |

**Example:**

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

**Description:** Releases the current image receiver.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Example:**

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

**Description:** Image source class, used to obtain image-related information. Before calling ImageSource methods, an ImageSource instance must be created via createImageSource.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### prop supportedFormats

```cangjie
public prop supportedFormats: Array<String>
```

**Description:** Supported image formats, including: png, jpeg, bmp, gif, webp, RAW.

**Type:** Array\<String>

**Access:** Read-Only

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### func createPixelMap(DecodingOptions)

```cangjie
public func createPixelMap(options!: DecodingOptions = DecodingOptions()): PixelMap
```

**Description:** Creates a PixelMap object using image decoding parameters.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [DecodingOptions](#class-decodingoptions) | No | DecodingOptions() | **Named parameter.** Decoding parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](#class-pixelmap) | Returns a PixelMap instance. |

**Example:**

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

**Description:** Creates an array of PixelMaps using image decoding parameters.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [DecodingOptions](#class-decodingoptions) | No | DecodingOptions() | **Named parameter.** Decoding parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[PixelMap](#class-pixelmap)> | Returns an array of PixelMaps. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 62980096 | The operation failed. |
  | 62980099 | The shared memory data is abnormal. |
  | 62980101 | The image data is abnormal. |
  | 62980103 | The image data is not supported. |
  | 62980106 | The image is too large. |
  | 62980109 | Failed to crop the image. |
  | 62980110 | The image source data is incorrect. |
  | 62980111 | The image source data is incomplete. |  |62980112|The image format does not match.|
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

**Function:** Gets the delay time array of the image. This interface is only applicable to GIF images.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<Int32>|Returns the delay time array.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  |Error Code ID|Error Message|
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

**Function:** Gets the frame count of the image.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|UInt32|Returns the frame count of the image.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  |Error Code ID|Error Message|
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

**Function:** Gets the image information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|index|UInt32|No|0| **Named parameter.** The sequence number when creating the image source, defaults to 0 if not specified.|

**Return Value:**

|Type|Description|
|:----|:----|
|[ImageInfo](#class-imageinfo)|Returns the obtained image information.|

**Example:**

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

**Function:** Gets the value of the specified property key for the image at the given index. Only supports JPEG files with EXIF information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|key|[PropertyKey](#enum-propertykey)|Yes|-|The property name of the image.|
|options|[ImagePropertyOptions](#class-imagepropertyoptions)|No|ImagePropertyOptions()|**Named parameter.** Image properties, including the image sequence number and default property value.|

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the property value of the image. If the retrieval fails, returns the default property value.|

**Example:**

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

**Function:** Modifies the value of the specified image property key. Only supports JPEG files with EXIF information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|key|[PropertyKey](#enum-propertykey)|Yes|-|The property name of the image.|
|value|String|Yes|-|The property value.|

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the image source instance.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Example:**

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

**Function:** Updates incremental data, used in conjunction with CreateIncrementalSource.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|buf|Array\<UInt8>|Yes|-|Incremental data.|
|isFinished|Bool|Yes|-|Whether the update is complete.|
|offset|UInt32|Yes|-|Offset.|
|length|UInt32|Yes|-|Array length.|

**Example:**

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

**Function:** Initialization options for PixelMap.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var alphaType

```cangjie
public var alphaType: AlphaType
```

**Function:** Transparency.

**Type:** [AlphaType](#enum-alphatype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var editable

```cangjie
public var editable: Bool
```

**Function:** Whether it is editable.

**Type:** Bool**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**Description:** Pixel format.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var scaleMode

```cangjie
public var scaleMode: ScaleMode
```

**Description:** Scaling mode.

**Type:** [ScaleMode](#enum-scalemode)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var size

```cangjie
public var size: Size
```

**Description:** Size of the image to be created.

**Type:** [Size](#class-size)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var srcPixelFormat

```cangjie
public var srcPixelFormat: PixelMapFormat
```

**Description:** Pixel format of the input buffer data. Default value is BGRA_8888.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### init(AlphaType, Bool, PixelMapFormat, PixelMapFormat, ScaleMode, Size)

```cangjie
public init(alphaType!: AlphaType = AlphaType.PREMUL, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888,
    pixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888, scaleMode!: ScaleMode = ScaleMode.FIT_TARGET_SIZE,
    size!: Size)
```

**Description:** Creates an InitializationOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| alphaType | [AlphaType](#enum-alphatype) | No | AlphaType.PREMUL | **Named parameter.** Transparency. |
| editable | Bool | No | false | **Named parameter.** Whether it is editable. |
| srcPixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.BGRA_8888 | **Named parameter.** Pixel format of the input buffer data. |
| pixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.BGRA_8888 | **Named parameter.** Pixel format. |
| scaleMode | [ScaleMode](#enum-scalemode) | No | ScaleMode.FIT_TARGET_SIZE | **Named parameter.** Scaling mode. |
| size | [Size](#class-size) | Yes | - | **Named parameter.** Size of the image to be created. |

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

**Description:** Represents image packing options.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var bufferSize

```cangjie
public var bufferSize: UInt64
```

**Description:** Size of the buffer for receiving encoded data, in bytes. If not specified, the default is 25MB. If the encoded image exceeds 25MB, the size must be specified. bufferSize must be larger than the size of the encoded image. This parameter does not apply to [packToFile](#func-packtofileimagesource-int32-packingoption).

**Type:** UInt64

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: PackingDynamicRange
```

**Description:** Target dynamic range. Default value is SDR.

**Type:** [PackingDynamicRange](#enum-packingdynamicrange)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var format

```cangjie
public var format: String
```

**Description:** Target format.</br>Currently supports "image/jpeg", "image/webp", "image/png", and "image/heif" (availability may vary by hardware device).

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var needsPackProperties

```cangjie
public var needsPackProperties: Bool
```

**Description:** Whether to include image property information, such as EXIF, in the encoding. Default value is false.

**Type:** Bool

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### var quality

```cangjie
public var quality: UInt8
```

**Description:** Parameter for setting the output image quality in JPEG encoding, ranging from 0 to 100. 0 is the lowest quality, and 100 is the highest. Higher quality results in larger file sizes.

**Type:** UInt8

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### init(String, UInt8, PackingDynamicRange, Bool, UInt64)

```cangjie
public init(format: String, quality: UInt8, desiredDynamicRange: PackingDynamicRange, needsPackProperties: Bool,
    bufferSize!: UInt64 = 25 * 1024 * 1024)
```

**Description:** Creates a PackingOption object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| format | String | Yes | - | Target format.</br>Currently supports "image/jpeg", "image/webp", "image/png", and "image/heif" (availability may vary by hardware device). |
| quality | UInt8 | Yes | - | Parameter for setting the output image quality in JPEG encoding, ranging from 0 to 100. 0 is the lowest quality, and 100 is the highest. Higher quality results in larger file sizes. |
| desiredDynamicRange | [PackingDynamicRange](#enum-packingdynamicrange) | Yes | - | **Named parameter.** Target dynamic range. |
| needsPackProperties | Bool | Yes | - | **Named parameter.** Whether to include image property information, such as EXIF, in the encoding. |
| bufferSize | UInt64 | No | 25 * 1024 * 1024 | **Named parameter.** Size of the buffer for receiving encoded data, in bytes. If not specified, the default is 25MB. If the encoded image exceeds 25MB, the size must be specified. bufferSize must be larger than the size of the encoded image. This parameter does not apply to [packToFile](#func-packtofileimagesource-int32-packingoption). |

## class PixelMap

```cangjie
public class PixelMap {}
```

**Description:** Image pixel class for reading or writing image data and obtaining image information. Before calling methods of PixelMap, a PixelMap instance must be created via [createPixelMap](#func-createpixelmaparrayuint8-initializationoptions). The current maximum serialization size for pixelmap is 128MB; exceeding this limit will result in display failure. The size is calculated as (width * height * bytes per pixel).

PixelMap supports cross-thread invocation via Worker. After PixelMap is passed across threads via Worker, all interfaces of the original thread's PixelMap cannot be called; otherwise, error 501 (server does not support the functionality required to fulfill the request) will occur.

Before calling methods of PixelMap, a PixelMap object must be constructed via [createPixelMap](#func-createpixelmaparrayuint8-initializationoptions).

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### prop isEditable

```cangjie
public prop isEditable: Bool
```

**Description:** Sets whether the image pixels can be edited.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### prop isStrideAlignment

```cangjie
public prop isStrideAlignment: Bool
```

**Description:** Sets whether the image memory is DMA memory.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

### func applyColorSpace(ColorSpaceManager)

```cangjie
public func applyColorSpace(targetColorSpace: ColorSpaceManager): Unit
```

**Description:** Performs color space conversion on image pixel colors based on the input target color space.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| targetColorSpace | [ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager) | Yes | - | Target color space, supporting SRGB, DCI_P3, DISPLAY_P3, and ADOBE_RGB_1998. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | The parameter check failed. |
  | 62980104 | Failed to initialize the internal object. |
  | 62980108 | Failed to convert the color space. |
  | 62980115 | Invalid image parameter. |

### func createAlphaPixelmap()

```cangjie
public func createAlphaPixelmap(): PixelMap
```
**Function:** Generates a pixelmap containing only Alpha channel information based on the Alpha channel data, which can be used for shadow effects.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](#class-pixelmap) | Returns a PixelMap instance. |

**Example:**

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

**Function:** Crops the image according to the input dimensions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| region | [Region](#class-region) | Yes | - | The dimensions for cropping. |

**Example:**

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

**Function:** Flips the image based on the input conditions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| horizontal | Bool | Yes | - | Horizontal flip. |
| vertical | Bool | Yes | - | Vertical flip. |

**Example:**

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

**Function:** Gets the number of bytes per row of the image pixels.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The number of bytes per row of the image pixels. |

**Example:**

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

**Function:** Gets the wide color gamut information of the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager) | The wide color gamut information of the image. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 62980101 | If the image data is abnormal. |
  | 62980103 | If the image data is unsupported. |
  | 62980115 | If the image parameter is invalid. |

### func getDensity()

```cangjie
public func getDensity(): Int32
```

**Function:** Gets the density of the current image pixels.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The density of the image pixels. |

**Example:**

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

**Function:** Gets the pixel information of the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageInfo](#class-imageinfo) | Used to get the pixel information of the image. Returns an error message on failure. |

**Example:**

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

**Function:** Gets the total number of bytes of the image pixels.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The total number of bytes of the image pixels. |

**Example:**

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

**Function:** Sets the transparency ratio to achieve the corresponding transparency effect for the PixelMap.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| rate | Float32 | Yes | - | The value of the transparency ratio. |

**Example:**

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

**Function:** Reads image data within the specified area.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| area | [PositionArea](#class-positionarea) | Yes | - | The area size from which data will be read. |

**Example:**

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

**Function:** Reads image pixel data and writes the result into an Array\<UInt8>. When creating a pixelmap with BGRA_8888 format, the read pixel data will be consistent with the original data.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| dst | Array\<UInt8> | Yes | - | The buffer where the image pixel data will be written after execution. The buffer size can be obtained via the [getPixelBytesNumber](#func-getpixelbytesnumber) interface. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let readBuffer: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96 is the required pixel buffer size, calculated as: height * width * 4
pixelMap.readPixelsToBuffer(readBuffer)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the PixelMap object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Example:**

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

**Function:** Rotates the image by the specified angle.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| angle | Float32 | Yes | - | The rotation angle of the image. |

**Example:**

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

**Function:** Scales the image based on the specified width and height factors.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | Yes | - | The scaling factor for width. |
| y | Float32 | Yes | - | The scaling factor for height. |

### func setColorSpace(ColorSpaceManager)

```cangjie
public func setColorSpace(colorSpace: ColorSpaceManager): Unit
```

**Function:** Sets the wide color gamut information for the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| colorSpace | [ColorSpaceManager](../ArkGraphics2D/cj-apis-color_manager.md#class-colorspacemanager) | Yes | - | The wide color gamut information for the image. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 62980111 | If the operation is invalid. |
  | 62980115 | If the image parameter is invalid. |

### func translate(Float32, Float32)

```cangjie
public func translate(x: Float32, y: Float32): Unit
```

**Function:** Translates the image based on the specified coordinates.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| x | Float32 | Yes | - | The horizontal coordinate of the area. |
| y | Float32 | Yes | - | The vertical coordinate of the area. |

**Example:**

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

**Function:** Reads image data from the buffer and writes the result into the PixelMap.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| src | Array\<UInt8> | Yes | - | The image pixel data. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(sourceDensity: 120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let color: Array<UInt8> = Array<UInt8>(96, {i => UInt8(i)}) //96 is the required pixel buffer size, calculated as: height * width * 4
pixelMap.writeBufferToPixels(color)
```

### func writePixels(PositionArea)

```cangjie
public func writePixels(area: PositionArea): Unit
```

**Function:** Writes the PixelMap into the specified area.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| area | [PositionArea](#class-positionarea) | Yes | - | The area into which the PixelMap will be written. |

**Example:**

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

**Function:** Represents data within a specified image region.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var offset

```cangjie
public var offset: UInt32
```

**Function:** Offset value.

**Type:** UInt32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var pixels

```cangjie
public var pixels: Array<UInt8>
```

**Function:** Pixels.

**Type:** Array\<UInt8>

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var region

```cangjie
public var region: Region
```

**Function:** Region for read/write operations. The sum of the region width and X-coordinate must not exceed the original image width, and the sum of the region height and Y-coordinate must not exceed the original image height.

**Type:** [Region](#class-region)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var stride

```cangjie
public var stride: UInt32
```

**Function:** Stride, representing the memory space occupied per row of pixels. stride >= region.size.width*4.

**Type:** UInt32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Array\<UInt8>, UInt32, UInt32, Region)

```cangjie
public init(pixels: Array<UInt8>, offset: UInt32, stride: UInt32, region: Region)
```

**Function:** Creates a PositionArea object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| pixels | Array\<UInt8> | Yes | - | Pixels. |
| offset | UInt32 | Yes | - | Offset value. |
| stride | UInt32 | Yes | - | Stride, representing the memory space occupied per row of pixels. stride >= region.size.width*4. |
| region | [Region](#class-region) | Yes | - | Region for read/write operations. The sum of the region width and X-coordinate must not exceed the original image width, and the sum of the region height and Y-coordinate must not exceed the original image height. |

## class Region

```cangjie
public class Region {
    public var size: Size
    public var x: Int32
    public var y: Int32
    public init(size: Size, x: Int32, y: Int32)
}
```

**Function:** Represents region information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var size

```cangjie
public var size: Size
```

**Function:** Region size.

**Type:** [Size](#class-size)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var x

```cangjie
public var x: Int32
```

**Function:** X-coordinate of the region.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var y

```cangjie
public var y: Int32
```

**Function:** Y-coordinate of the region.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Size, Int32, Int32)

```cangjie
public init(size: Size, x: Int32, y: Int32)
```

**Function:** Creates a Region object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| size | [Size](#class-size) | Yes | - | Region size. |
| x | Int32 | Yes | - | X-coordinate of the region. |
| y | Int32 | Yes | - | Y-coordinate of the region. |

## class Size

```cangjie
public class Size {
    public var height: Int32
    public var width: Int32
    public init(height: Int32, width: Int32)
}
```

**Function:** Represents image dimensions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var height

```cangjie
public var height: Int32
```

**Function:** Height of the output image.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var width

```cangjie
public var width: Int32
```

**Function:** Width of the output image.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Int32, Int32)

```cangjie
public init(height: Int32, width: Int32)
```

**Function:** Creates a Size object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| height | Int32 | No | 0 | **Named parameter.** Height of the output image. |
| width | Int32 | No | 0 | **Named parameter.** Width of the output image. |

## class SourceOptions

```cangjie
public class SourceOptions {
    public var sourceDensity: Int32
    public var sourcePixelFormat: PixelMapFormat
    public var sourceSize: Size
    public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.UNKNOWN, sourceSize!: Size = Size(0, 0))
}
```

**Function:** Initialization options for ImageSource.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var sourceDensity

```cangjie
public var sourceDensity: Int32
```

**Function:** Pixel density of the image resource, in DPI.

When the desiredSize parameter is not set in [DecodingOptions](#class-decodingoptions), this parameter (SourceOptions.sourceDensity) and DecodingOptions.fitDensity (when non-zero) will scale the decoded output pixelmap.

The scaled width is calculated as follows (height is calculated similarly): (width * fitDensity + (sourceDensity >> 1)) / sourceDensity.

**Type:** Int32

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var sourcePixelFormat

```cangjie
public var sourcePixelFormat: PixelMapFormat
```

**Function:** Pixel format of the image, default value is UNKNOWN.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Readable/Writable:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var sourceSize

```cangjie
public var sourceSize: Size
```

**Description:** The pixel size of the image, with a default value of empty.

**Type:** [Size](#class-size)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Int32, PixelMapFormat, Size)

```cangjie
public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.UNKNOWN, sourceSize!: Size = Size(0, 0))
```

**Description:** Creates a SourceOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| sourceDensity | Int32 | No | 0 | **Named parameter.** The pixel density of the image resource, in DPI.<br>When the desiredSize parameter in [DecodingOptions](#class-decodingoptions) is not set, the current parameter SourceOptions.sourceDensity and DecodingOptions.fitDensity will scale the decoded output pixelmap if they are non-zero.<br>The scaled width is calculated as follows (height is calculated similarly): (width * fitDensity + (sourceDensity >> 1)) |
| sourcePixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.UNKNOWN | **Named parameter.** The pixel format of the image, with a default value of UNKNOWN. |
| sourceSize | [Size](#class-size) | No | Size(height: 0, width: 0) | **Named parameter.** The pixel size of the image, with a default value of empty. |

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

**Description:** The transparency type of the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlphaType>
- ToString

### OPAQUE

```cangjie
OPAQUE
```

**Description:** No alpha or the image is opaque.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PREMUL

```cangjie
PREMUL
```

**Description:** RGB with premultiplied alpha.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**Description:** Unknown transparency.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### UNPREMUL

```cangjie
UNPREMUL
```

**Description:** RGB without premultiplied alpha.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(AlphaType)

```cangjie
public operator func !=(other: AlphaType): Bool
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AlphaType](#enum-alphatype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(AlphaType)

```cangjie
public operator func ==(other: AlphaType): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AlphaType](#enum-alphatype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

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

**Description:** The component type of the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<ComponentType>
- ToString

### JPEG

```cangjie
JPEG
```

**Description:** JPEG type.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YUV_U

```cangjie
YUV_U
```

**Description:** Chrominance information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YUV_V

```cangjie
YUV_V
```

**Description:** Chrominance information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YUV_Y

```cangjie
YUV_Y
```

**Description:** Luminance information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(ComponentType)

```cangjie
public operator func !=(other: ComponentType): Bool
```

**Description:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ComponentType](#enum-componenttype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(ComponentType)

```cangjie
public operator func ==(other: ComponentType): Bool
```

**Description:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [ComponentType](#enum-componenttype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Return Value:**

| Type    | Description               |
|:--------|:--------------------------|
| String  | Description of the enumeration. |

## enum DecodingDynamicRange

```cangjie
public enum DecodingDynamicRange <: Equatable<DecodingDynamicRange> & ToString {
    | AUTO
    | SDR
    | HDR
    | ...
}
```

**Function:** Describes the expected dynamic range of the image during decoding.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<DecodingDynamicRange>
- ToString

### AUTO

```cangjie
AUTO
```

**Function:** Adaptive processing based on image information. If the image itself is HDR, it will be decoded as HDR content; otherwise, it will be decoded as SDR content. Images created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions) will be decoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### HDR

```cangjie
HDR
```

**Function:** Processes the image as high dynamic range content. Images created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions) will be decoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SDR

```cangjie
SDR
```

**Function:** Processes the image as standard dynamic range content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(DecodingDynamicRange)

```cangjie
public operator func !=(other: DecodingDynamicRange): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type                                | Required | Default | Description               |
|:----------|:------------------------------------|:---------|:--------|:--------------------------|
| other     | [DecodingDynamicRange](#enum-decodingdynamicrange) | Yes      | -       | Another enumeration value. |

**Return Value:**

| Type | Description                               |
|:-----|:------------------------------------------|
| Bool | Returns `true` if unequal, otherwise `false`. |

### func ==(DecodingDynamicRange)

```cangjie
public operator func ==(other: DecodingDynamicRange): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type                                | Required | Default | Description               |
|:----------|:------------------------------------|:---------|:--------|:--------------------------|
| other     | [DecodingDynamicRange](#enum-decodingdynamicrange) | Yes      | -       | Another enumeration value. |

**Return Value:**

| Type | Description                             |
|:-----|:----------------------------------------|
| Bool | Returns `true` if equal, otherwise `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type    | Description               |
|:--------|:--------------------------|
| String  | Description of the enumeration. |

## enum ImageFormat

```cangjie
public enum ImageFormat <: Equatable<ImageFormat> & ToString {
    | YCBCR_422_SP
    | JPEG
    | ...
}
```

**Function:** Image format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<ImageFormat>
- ToString

### JPEG

```cangjie
JPEG
```

**Function:** JPEG encoding format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YCBCR_422_SP

```cangjie
YCBCR_422_SP
```

**Function:** YCBCR422 semi-planar format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(ImageFormat)

```cangjie
public operator func !=(other: ImageFormat): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type                          | Required | Default | Description               |
|:----------|:------------------------------|:---------|:--------|:--------------------------|
| other     | [ImageFormat](#enum-imageformat) | Yes      | -       | Another enumeration value. |

**Return Value:**

| Type | Description                               |
|:-----|:------------------------------------------|
| Bool | Returns `true` if unequal, otherwise `false`. |

### func ==(ImageFormat)

```cangjie
public operator func ==(other: ImageFormat): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type                          | Required | Default | Description               |
|:----------|:------------------------------|:---------|:--------|:--------------------------|
| other     | [ImageFormat](#enum-imageformat) | Yes      | -       | Another enumeration value. |

**Return Value:**

| Type | Description                             |
|:-----|:----------------------------------------|
| Bool | Returns `true` if equal, otherwise `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type    | Description               |
|:--------|:--------------------------|
| String  | Description of the enumeration. |

## enum PackingDynamicRange

```cangjie
public enum PackingDynamicRange <: Equatable<PackingDynamicRange> & ToString {
    | AUTO
    | SDR
    | ...
}
```

**Function:** Describes the expected dynamic range of the image during encoding.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<PackingDynamicRange>
- ToString

### AUTO

```cangjie
AUTO
```

**Function:** Adaptive processing based on [pixelmap](#class-pixelmap) content. If the pixelmap itself is HDR, it will be encoded as HDR content; otherwise, it will be encoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SDR

```cangjie
SDR
```

**Function:** Processes the image as standard dynamic range content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PackingDynamicRange)

```cangjie
public operator func !=(other: PackingDynamicRange): Bool
```
**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PackingDynamicRange](#enum-packingdynamicrange) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(PackingDynamicRange)

```cangjie
public operator func ==(other: PackingDynamicRange): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PackingDynamicRange](#enum-packingdynamicrange) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

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

**Function:** Image pixel format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<PixelMapFormat>
- ToString

### ALPHA_8

```cangjie
ALPHA_8
```

**Function:** Format is ALPHA_8.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### BGRA_8888

```cangjie
BGRA_8888
```

**Function:** Format is BGRA_8888.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### NV12

```cangjie
NV12
```

**Function:** Format is NV12.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### NV21

```cangjie
NV21
```

**Function:** Format is NV21.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RGBA_1010102

```cangjie
RGBA_1010102
```

**Function:** Format is RGBA_1010102.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RGBA_8888

```cangjie
RGBA_8888
```

**Function:** Format is RGBA_8888.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RGBA_F16

```cangjie
RGBA_F16
```

**Function:** Format is RGBA_F16.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RGB_565

```cangjie
RGB_565
```

**Function:** Format is RGB_565.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RGB_888

```cangjie
RGB_888
```

**Function:** Format is RGB_888.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**Function:** Unknown format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YCBCR_P010

```cangjie
YCBCR_P010
```

**Function:** Format is YCBCR_P010.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YCRCB_P010

```cangjie
YCRCB_P010
```

**Function:** Format is YCRCB_P010.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PixelMapFormat)

```cangjie
public operator func !=(other: PixelMapFormat): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PixelMapFormat](#enum-pixelmapformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal; otherwise, returns `false`. |

### func ==(PixelMapFormat)

```cangjie
public operator func ==(other: PixelMapFormat): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [PixelMapFormat](#enum-pixelmapformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. ||String|Description of the enumeration.|

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

**Function:** Exif (Exchangeable image file format) image information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<PropertyKey>

### APERTURE_VALUE

```cangjie
APERTURE_VALUE
```

**Function:** Aperture value.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### BITS_PER_SAMPLE

```cangjie
BITS_PER_SAMPLE
```

**Function:** Bits per pixel.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### CAPTURE_MODE

```cangjie
CAPTURE_MODE
```

**Function:** Capture mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### DATE_TIME

```cangjie
DATE_TIME
```

**Function:** Date and time.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### DATE_TIME_ORIGINAL

```cangjie
DATE_TIME_ORIGINAL
```

**Function:** Shooting time, e.g., 2022:09:06 15:48:00.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### EXPOSURE_BIAS_VALUE

```cangjie
EXPOSURE_BIAS_VALUE
```

**Function:** Exposure bias value.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### EXPOSURE_TIME

```cangjie
EXPOSURE_TIME
```

**Function:** Exposure time, e.g., 1/33 sec.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FACE_COUNT

```cangjie
FACE_COUNT
```

**Function:** Number of faces.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FLASH

```cangjie
FLASH
```

**Function:** Flash, records flash status.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FOCAL_LENGTH

```cangjie
FOCAL_LENGTH
```

**Function:** Focal length.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FOCAL_LENGTH_IN_35_MM_FILM

```cangjie
FOCAL_LENGTH_IN_35_MM_FILM
```

**Function:** Focal length in 35mm film.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FOCUS_MODE

```cangjie
FOCUS_MODE
```

**Function:** Focus mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### F_NUMBER

```cangjie
F_NUMBER
```

**Function:** Aperture value, e.g., f/1.8.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_DATE_STAMP

```cangjie
GPS_DATE_STAMP
```

**Function:** GPS date stamp.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_LATITUDE

```cangjie
GPS_LATITUDE
```

**Function:** Image latitude. When modifying, it should be passed in the format of "degrees,minutes,seconds", e.g., "39,54,7.542".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_LATITUDE_REF

```cangjie
GPS_LATITUDE_REF
```

**Function:** Latitude reference, e.g., N or S.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_LONGITUDE

```cangjie
GPS_LONGITUDE
```

**Function:** Image longitude. When modifying, it should be passed in the format of "degrees,minutes,seconds", e.g., "116,19,42.16".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_LONGITUDE_REF

```cangjie
GPS_LONGITUDE_REF
```

**Function:** Longitude reference, e.g., W or E.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPS_TIME_STAMP

```cangjie
GPS_TIME_STAMP
```

**Function:** GPS timestamp.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21### IMAGE_DESCRIPTION

```cangjie
IMAGE_DESCRIPTION
```

**Function:** Image information description.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### IMAGE_LENGTH

```cangjie
IMAGE_LENGTH
```

**Function:** Image length.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### IMAGE_WIDTH

```cangjie
IMAGE_WIDTH
```

**Function:** Image width.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ISO_SPEED

```cangjie
ISO_SPEED
```

**Function:** ISO speed rating.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ISO_SPEED_RATINGS

```cangjie
ISO_SPEED_RATINGS
```

**Function:** ISO sensitivity, e.g., 400.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### LIGHT_SOURCE

```cangjie
LIGHT_SOURCE
```

**Function:** Light source.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### MAKE

```cangjie
MAKE
```

**Function:** Manufacturer.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### METERING_MODE

```cangjie
METERING_MODE
```

**Function:** Metering mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### MODEL

```cangjie
MODEL
```

**Function:** Device model.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ORIENTATION

```cangjie
ORIENTATION
```

**Function:** Image orientation.<br/>- 1: Top-left, image not rotated.<br/>- 2: Top-right, mirrored horizontally.<br/>- 3: Bottom-right, image rotated 180°.<br/>- 4: Bottom-left, mirrored vertically.<br/>- 5: Left-top, mirrored horizontally then rotated 270° clockwise.<br/>- 6: Right-top, rotated 90° clockwise.<br/>- 7: Right-bottom, mirrored horizontally then rotated 90° clockwise.<br/>- 8: Left-bottom, rotated 270° clockwise.<br/>- Undefined values return "Unknown Value".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PHOTO_MODE

```cangjie
PHOTO_MODE
```

**Function:** Photography mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PHYSICAL_APERTURE

```cangjie
PHYSICAL_APERTURE
```

**Function:** Physical aperture, f-number.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PITCH_ANGLE

```cangjie
PITCH_ANGLE
```

**Function:** Pitch angle.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PIXEL_X_DIMENSION

```cangjie
PIXEL_X_DIMENSION
```

**Function:** Pixel X dimension.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PIXEL_Y_DIMENSION

```cangjie
PIXEL_Y_DIMENSION
```

**Function:** Pixel Y dimension.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RECOMMENDED_EXPOSURE_INDEX

```cangjie
RECOMMENDED_EXPOSURE_INDEX
```

**Function:** Recommended exposure index.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ROLL_ANGLE

```cangjie
ROLL_ANGLE
```

**Function:** Roll angle.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_BEACH_CONF

```cangjie
SCENE_BEACH_CONF
```

**Function:** Photography scene: beach.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_BLUE_SKY_CONF

```cangjie
SCENE_BLUE_SKY_CONF
```

**Function:** Photography scene: blue sky.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_FLOWERS_CONF

```cangjie
SCENE_FLOWERS_CONF
```

**Function:** Photography scene: flowers.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_FOOD_CONF

```cangjie
SCENE_FOOD_CONF
```

**Function:** Photography scene: food.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_GREEN_PLANT_CONF

```cangjie
SCENE_GREEN_PLANT_CONF
```

**Function:** Photography scene: green plants.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_NIGHT_CONF

```cangjie
SCENE_NIGHT_CONF
```

**Function:** Photography scene: night.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_SNOW_CONF

```cangjie
SCENE_SNOW_CONF
```

**Function:** Photography scene: snow.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_STAGE_CONF

```cangjie
SCENE_STAGE_CONF
```

**Function:** Photography scene: stage.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21### SCENE_SUNSET_CONF

```cangjie
SCENE_SUNSET_CONF
```

**Function:** Photography scene: Sunset.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_TEXT_CONF

```cangjie
SCENE_TEXT_CONF
```

**Function:** Photography scene: Text.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SCENE_TYPE

```cangjie
SCENE_TYPE
```

**Function:** Photography scene modes, such as portrait, landscape, sports, night scene, etc.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SENSITIVITY_TYPE

```cangjie
SENSITIVITY_TYPE
```

**Function:** Sensitivity type.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### STANDARD_OUTPUT_SENSITIVITY

```cangjie
STANDARD_OUTPUT_SENSITIVITY
```

**Function:** Standard output sensitivity.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### USER_COMMENT

```cangjie
USER_COMMENT
```

**Function:** User comment.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### WHITE_BALANCE

```cangjie
WHITE_BALANCE
```

**Function:** White balance.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PropertyKey)

```cangjie
public operator func !=(other: PropertyKey): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PropertyKey](#enum-propertykey) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(PropertyKey)

```cangjie
public operator func ==(other: PropertyKey): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PropertyKey](#enum-propertykey) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## enum ScaleMode

```cangjie
public enum ScaleMode <: Equatable<ScaleMode> & ToString {
    | FIT_TARGET_SIZE
    | CENTER_CROP
    | ...
}
```

**Function:** Image scaling modes.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<ScaleMode>
- ToString

### CENTER_CROP

```cangjie
CENTER_CROP
```

**Function:** Scales the image to fill the target image area and centers the cropped area outside the effect.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FIT_TARGET_SIZE

```cangjie
FIT_TARGET_SIZE
```

**Function:** Effect of fitting the image to the target size.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(ScaleMode)

```cangjie
public operator func !=(other: ScaleMode): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScaleMode](#enum-scalemode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(ScaleMode)

```cangjie
public operator func ==(other: ScaleMode): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [ScaleMode](#enum-scalemode) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enumeration. |

## Additional Notes

### SVG Tag Descriptions

Supports SVG tags, using version (SVG) 1.1. The currently supported tag list includes:

- a
- circle
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
- stop- svg  
- text  
- textPath  
- tspan  
- use