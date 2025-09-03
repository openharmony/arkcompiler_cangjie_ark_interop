# ohos.multimedia.image (Image Processing)

This module provides image processing capabilities, including creating PixelMap through properties, reading image pixel data, and reading image data within a specified region.

## Import Module

```cangjie
import kit.ImageKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in the first line, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example projects and configuration templates, please refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func createImageCreator(Size, Int32, Int32)

```cangjie
public func createImageCreator(size: Size, format: Int32, capacity: Int32): ImageCreator
```

**Function:** Creates an ImageCreator instance.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| size | [Size](#class-size) | Yes | - | Default size of the image. |
| format | Int32 | Yes | - | Image format, such as YCBCR_422_SP, JPEG. |
| capacity | Int32 | Yes | - | Maximum number of images that can be accessed simultaneously. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageCreator](#class-imagecreator) | Returns the ImageCreator instance. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; |

## func createImagePacker()

```cangjie
public func createImagePacker(): ImagePacker
```

**Function:** Creates an ImagePacker instance.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
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

**Function:** Creates an ImageReceiver instance with specified width, height, image format, and capacity.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| size | [Size](#class-size) | Yes | - | Default size of the image. |
| format | [ImageFormat](#enum-imageformat) | Yes | - | Image format, which can be one of the [ImageFormat](#enum-imageformat) constants (currently only ImageFormat:JPEG is supported). |
| capacity | Int32 | Yes | - | Maximum number of images that can be accessed simultaneously. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageReceiver](#class-imagereceiver) | If the operation is successful, returns the ImageReceiver instance. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8, 8192)
let receiver:ImageReceiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
```

## func createImageSource(String)

```cangjie
public func createImageSource(uri: String): ImageSource
```

**Function:** Creates an image source instance using the specified URI.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| uri | String | Yes | - | Image path, currently only supports application sandbox paths.</br>Supported formats include: .jpg .png .gif .bmp .webp RAW [SVG](#SVG-Tag-Description). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(String, SourceOptions)

```cangjie
public func createImageSource(uri: String, options: SourceOptions): ImageSource
```

**Function:** Creates an image source instance using the specified URI.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| uri | String | Yes | - | Image path, currently only supports application sandbox paths.</br>Supported formats include: .jpg .png .gif .bmp .webp RAW [SVG](#SVG-Tag-Description). |
| options | [SourceOptions](#class-sourceoptions) | Yes | - | Image properties, including image index and default property values. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(Int32)

```cangjie
public func createImageSource(fd: Int32): ImageSource
```

**Function:** Creates an image source instance using the specified file descriptor.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| fd | Int32 | Yes | - | File descriptor fd. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(Int32, SourceOptions)

```cangjie
public func createImageSource(fd: Int32, options: SourceOptions): ImageSource
```

**Function:** Creates an image source instance using the specified file descriptor.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| fd | Int32 | Yes | - | Image file descriptor. |
| options | [SourceOptions](#class-sourceoptions) | Yes | - | Image properties, including image index and default property values. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(Array\<UInt8>)

```cangjie
public func createImageSource(buf: Array<UInt8>): ImageSource
```

**Function:** Creates an image source instance using the specified buffer.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buf | Array\<UInt8> | Yes | - | Image buffer array. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(Array\<UInt8>, SourceOptions)

```cangjie
public func createImageSource(buf: Array<UInt8>, options: SourceOptions): ImageSource
```

**Function:** Creates an image source instance using the specified buffer.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buf | Array\<UInt8> | Yes | - | Image buffer array. |
| options | [SourceOptions](#class-sourceoptions) | Yes | - | Image properties, including image index and default property values. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createImageSource(RawFileDescriptor, SourceOptions)

```cangjie
public func createImageSource(rawfile: RawFileDescriptor, options!: SourceOptions = SourceOptions(0))): ImageSource
```

**Function:** Creates an image source instance using the RawFileDescriptor of the image resource file.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| rawfile | [RawFileDescriptor](../LocalizationKit/cj-apis-resource_manager.md#class-rawfiledescriptor) | Yes | - | RawFileDescriptor of the image resource file. |
| options | [SourceOptions](#class-sourceoptions) | No | SourceOptions(0) | **Named parameter.** Image properties, including pixel density, pixel format, and image size. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the ImageSource class instance. |

## func createIncrementalSource(Array\<UInt8>, SourceOptions)

```cangjie
public func createIncrementalSource(buf: Array<UInt8>, options!: SourceOptions = SourceOptions(0))): ImageSource
```

**Function:** Creates an image source instance incrementally using the specified buffer. IncrementalSource does not support reading or writing Exif information.

The ImageSource instance created incrementally only supports the following functions:

- Get image information: Specify index - [getImageInfo](#func-getimageinfouint32), direct access - [getImageInfo](#func-getimageinfo)
- Get the value of the specified property key for the image at the given index: [getImageProperty](#func-getimagepropertypropertykey-imagepropertyoptions)
- Batch get the values of specified property keys in the image: [getImageProperties](#func-getimagepropertiesarraypropertykey)
- Update incremental data: [updateData](#func-updatedataarrayuint8-bool-uint32-uint32)
- Create PixelMap object: Create via image decoding parameters - [createPixelMap](#func-createpixelmapdecodingoptions)
- Release image source instance: [release](#func-release-1)

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| buf | Array\<UInt8> | Yes | - | Incremental data. This parameter is not actually effective. |
| options | [SourceOptions](#class-sourceoptions) | No | SourceOptions(0) | **Named parameter.** Image properties, including image index and default property values. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ImageSource](#class-imagesource) | Returns the image source. |

## func createPixelMap(Array\<UInt8>, InitializationOptions)

```cangjie
public func createPixelMap(colors: Array<UInt8>, options: InitializationOptions): PixelMap
```

**Function:** Creates a PixelMap using specified properties. By default, data is processed in BGRA_8888 format. Currently, only BGRA_8888 format is supported.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| colors | Array\<UInt8> | Yes | - | Color array in BGRA_8888 format. |
| options | [InitializationOptions](#class-initializationoptions) | Yes | - | Pixel creation properties, including transparency, size, thumbnail value, pixel format, and editability. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [PixelMap](#class-pixelmap) | Returns the PixelMap.<br>If the created pixelmap size exceeds the original image size, returns the original pixelmap size. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |

## class Component

```cangjie
public class Component {
    public let componentType: ComponentType
    public let rowStride: Int32
    public let pixelStride: Int32
    public let byteBuffer: Array<UInt8>
}
```

**Function:** Describes image color components.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let byteBuffer

```cangjie
public let byteBuffer: Array<UInt8>
```

**Function:** Component buffer.

**Type:** Array\<UInt8>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let componentType

```cangjie
public let componentType: ComponentType
```

**Function:** Component type.

**Type:** [ComponentType](#enum-componenttype)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let pixelStride

```cangjie
public let pixelStride: Int32
```

**Function:** Pixel stride.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### let rowStride

```cangjie
public let rowStride: Int32
```

**Function:** Row stride.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21```markdown
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
        desiredPixelFormat!: PixelMapFormat = Unknown, index!: UInt32 = 0, fitDensity!: Int32 = 0,
        desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = Sdr)
}
```

**Function:** Image decoding configuration options.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var desiredColorSpace

```cangjie
public var desiredColorSpace:?ColorSpaceManager
```

**Function:** Target color space.

**Type:** ?[ColorSpaceManager](#class-colorspacemanager)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: DecodingDynamicRange
```

**Function:** Target dynamic range, default value is SDR.

Imagesource created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-asynccallbackimagesource) does not support setting this property and will default to decoding as SDR content.

If the platform does not support HDR, the setting is invalid and will default to decoding as SDR content.

**Type:** [DecodingDynamicRange](#enum-decodingdynamicrange)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var desiredPixelFormat

```cangjie
public var desiredPixelFormat: PixelMapFormat
```

**Function:** Pixel format for decoding.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var desiredRegion

```cangjie
public var desiredRegion: Region
```

**Function:** Decoding region.

**Type:** [Region](#class-region)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var desiredSize

```cangjie
public var desiredSize: Size
```

**Function:** Expected output size.

**Type:** [Size](#class-size)

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var editable

```cangjie
public var editable: Bool
```

**Function:** Whether editable. When set to false, the image cannot be further edited (e.g., crop operations will fail).

**Type:** Bool

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var fitDensity

```cangjie
public var fitDensity: Int32
```

**Function:** Image pixel density in ppi.

**Type:** Int32

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var index

```cangjie
public var index: UInt32
```

**Function:** Decoding image sequence number.

**Type:** UInt32

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var rotate

```cangjie
public var rotate: UInt32
```

**Function:** Rotation angle.

**Type:** UInt32

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var sampleSize

```cangjie
public var sampleSize: UInt32
```

**Function:** Thumbnail sampling size, currently only supports value 1.

**Type:** UInt32

**Access:** Read-Write

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### init(UInt32, UInt32, Bool, Size, Region, PixelMapFormat, UInt32, Int32, ?ColorSpaceManager, DecodingDynamicRange)

```cangjie
public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
    desiredSize!: Size = Size(0, 0), desiredRegion!: Region = Region(Size(0, 0), 0, 0),
    desiredPixelFormat!: PixelMapFormat = Unknown, index!: UInt32 = 0, fitDensity!: Int32 = 0,
    desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = Sdr)
```

**Function:** Creates a DecodingOptions object.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| sampleSize | UInt32 | No | 1 | **Named parameter.** Thumbnail sampling size, currently only supports value 1. |
| rotate | UInt32 | No | 0 | **Named parameter.** Rotation angle. |
| editable | Bool | No | false | **Named parameter.** Whether editable. When set to false, the image cannot be further edited (e.g., crop operations will fail). |
| desiredSize | [Size](#class-size) | No | Size(0, 0) | **Named parameter.** Expected output size. |
| desiredRegion | [Region](#class-region) | No | Region(Size(0, 0), 0, 0) | **Named parameter.** Decoding region. |
| desiredPixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | Unknown | **Named parameter.** Pixel format for decoding. |
| index | UInt32 | No | 0 | **Named parameter.** Decoding image sequence number. |
| fitDensity | Int32 | No | 0 | **Named parameter.** Image pixel density in ppi. |
| desiredColorSpace | ?[ColorSpaceManager](#class-colorspacemanager) | No | None | **Named parameter.** Target color space. |
| desiredDynamicRange | [DecodingDynamicRange](#enum-decodingdynamicrange) | No | Sdr | **Named parameter.** Target dynamic range.<br>Imagesource created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-sourceoptions) does not support setting this property and will default to decoding as SDR content.<br>If the platform does not support HDR, the setting is invalid and will default to decoding as SDR content. |

## class Image

```cangjie
public class Image {}
```

**Function:** Provides basic image operations including obtaining image information and reading/writing image data.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### prop clipRect

```cangjie
public prop clipRect: Region
```

**Function:** The image region to be cropped.

**Type:** [Region](#class-region)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### prop format

```cangjie
public prop format: Int32
```

**Function:** Image format, refer to [PixelMapFormat](#enum-pixelmapformat).

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### prop size

```cangjie
public prop size: Size
```

**Function:** Image size.

**Type:** [Size](#class-size)

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func getComponent(ComponentType)

```cangjie
public func getComponent(componentType: ComponentType): Component
```

**Function:** Obtains the component buffer from the image based on the component type and returns the result.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
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

let size = Size(8, 8192)
let imageCreator = createImageCreator(size, ImageFormat.Jpeg, 8)
let img = imageCreator.dequeueImage()
let component : Component = img.getComponent(ComponentType.Jpeg)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the current image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8, 8192)
let imageCreator = createImageCreator(size, ImageFormat.Jpeg, 8)
let img = imageCreator.dequeueImage()
img.release()
```

## class ImageCreator

```cangjie
public class ImageCreator {}
```

**Function:** Image creation module used to request native image data regions and provide applications with the capability to compile native image data. An ImageCreator instance must be created before calling the following methods.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**Function:** Number of images that can be accessed simultaneously.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### prop format

```cangjie
public prop format: Int32
```

**Function:** Image format.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

### func dequeueImage()

```cangjie
public func dequeueImage(): Image
```

**Function:** Obtains a buffer image from the idle queue for UI content rendering.

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

let size = Size(8, 8192)
var imageCreator = createImageCreator(size, ImageFormat.Jpeg, 8)
var image = imageCreator.dequeueImage()
```

### func queueImage(Image)

```cangjie
public func queueImage(image: Image): Unit
```

**Function:** Places the rendered image into the Dirty queue.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| image | [Image](#class-image) | Yes | - | The rendered buffer image. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8, 8192)
var imageCreator = createImageCreator(size, ImageFormat.Jpeg, 8)
var image = imageCreator.dequeueImage()
imageCreator.queueImage(image)
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the current image.

**System Capability:** SystemCapability.Multimedia.Image.ImageCreator

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8, 8192)
let imageCreator = createImageCreator(size, ImageFormat.Jpeg, 8)
imageCreator.release()
```## class ImageInfo

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

**Description:** Alpha transparency.

**Type:** [AlphaType](#enum-alphatype)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var density

```cangjie
public var density: Int32
```

**Description:** Pixel density in ppi (pixels per inch).

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var isHdr

```cangjie
public var isHdr: Bool
```

**Description:** Whether the image is High Dynamic Range (HDR). For [ImageSource](#class-imagesource), indicates if the source image is HDR; for [PixelMap](#class-pixelmap), indicates if the decoded pixelmap is HDR.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var mimeType

```cangjie
public var mimeType: String
```

**Description:** The actual image format (MIME type).

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**Description:** Pixel format.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var size

```cangjie
public var size: Size
```

**Description:** Image dimensions.

**Type:** [Size](#class-size)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var stride

```cangjie
public var stride: Int32
```

**Description:** Stride, the space occupied by each row of pixels in memory. stride >= region.size.width*4.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

## class ImagePacker

```cangjie
public class ImagePacker {}
```

**Description:** Image packer class for image compression and packaging. Before calling ImagePacker methods, an ImagePacker instance must be created via [createImagePacker](#func-createimagepacker). Currently supported formats: jpeg, webp, png.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### prop supportedFormats

```cangjie
public prop supportedFormats: Array<String>
```

**Description:** Supported image packaging formats: jpeg, webp, png.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### func packToData(ImageSource, PackingOption)

```cangjie
public func packToData(source: ImageSource, options: PackingOption): Array<UInt8>
```

**Description:** Compresses or re-encodes an image.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| source | [ImageSource](#class-imagesource) | Yes | - | Image source to pack. |
| options | [PackingOption](#class-packingoption) | Yes | - | Packaging parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | Returns compressed/packaged data. |

**Exceptions:**

- BusinessException: Error codes as below, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the parameter is invalid. |
  | 62980096 | The operation failed. Possible causes: 1.Image upload exception. 2.Decoding process exception. 3.Insufficient memory. |
  | 62980101 | The image data is abnormal. |
  | 62980106 | The image data is too large. This status code is thrown when an error occurs during size checking. |
  | 62980113 | Unknown image format. The provided image data is not in a recognized/supported format or may be corrupted. |
  | 62980119 | Failed to encode the image. |
  | 62980120 | Add pixelmap out of range. |
  | 62980172 | Failed to encode ICC. |
  | 62980252 | Failed to create surface. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSource: ImageSource = createImageSource(data, sourceOptions)
var imagePacker = createImagePacker()
let supportedFormats = imagePacker.supportedFormats
let packingOption = PackingOption("image/jpeg", 98)
let packRes = imagePacker.packToData(imageSource, packingOption)
```

### func packToData(PixelMap, PackingOption)

```cangjie
public func packToData(source: PixelMap, options: PackingOption): Array<UInt8>
```

**Description:** Compresses or re-encodes an image.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| source | [PixelMap](#class-pixelmap) | Yes | - | Image source to pack. |
| options | [PackingOption](#class-packingoption) | Yes | - | Packaging parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | Returns compressed/packaged data. |

**Exceptions:**

- BusinessException: Error codes as below, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | If the parameter is invalid. |
  | 62980096 | The operation failed. Possible causes: 1.Image upload exception. 2.Decoding process exception. 3.Insufficient memory. |
  | 62980101 | The image data is abnormal. |
  | 62980106 | The image data is too large. This status code is thrown when an error occurs during size checking. |
  | 62980113 | Unknown image format. The provided image data is not in a recognized/supported format or may be corrupted. |
  | 62980119 | Failed to encode the image. |
  | 62980120 | Add pixelmap out of range. |
  | 62980172 | Failed to encode ICC. |
  | 62980252 | Failed to create surface. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

var colors: Array<UInt8> = [80, 2, 4, 8, 40, 2, 4, 8]
var pm = createPixelMap(colors,
    InitializationOptions(Size(2, 1), scaleMode: ScaleMode.CenterCrop))
var imagePacker = createImagePacker()
let supportedFormats = imagePacker.supportedFormats
let packingOption = PackingOption("image/jpeg", 98)
let packRes = imagePacker.packToData(pm, packingOption)
```

### func packToFile(ImageSource, Int32, PackingOption)

```cangjie
public func packToFile(source: ImageSource, fd: Int32, options: PackingOption): Unit
```

**Description:** Encodes an image directly into a file with specified parameters.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| source | [ImageSource](#class-imagesource) | Yes | - | Image source to encode. |
| fd | Int32 | Yes | - | File descriptor. |
| options | [PackingOption](#class-packingoption) | Yes | - | Packaging parameters. |

**Exceptions:**

- BusinessException: Error codes as below, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980096 | The operation failed. Possible causes: 1.Image upload exception. 2.Decoding process exception. 3.Insufficient memory. |
  | 62980101 | The image data is abnormal. |
  | 62980106 | The image data is too large. This status code is thrown when an error occurs during size checking. |
  | 62980113 | Unknown image format. The provided image data is not in a recognized/supported format or may be corrupted. |
  | 62980115 | Invalid input parameter. |
  | 62980119 | Failed to encode the image. |
  | 62980120 | Add pixelmap out of range. |
  | 62980172 | Failed to encode ICC. |
  | 62980252 | Failed to create surface. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import kit.CoreFileKit.{FileIo, OpenMode}

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSource: ImageSource = createImageSource(data, sourceOptions)
var fd: Int32 = 0
let filePath = "data/storage/el1/base/xxx.txt"
let file = FileIo.open(filePath,mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
let packingOption = PackingOption("image/jpeg", 98)
let imagePacker = createImagePacker()
imagePacker.packToFile(imageSource, fd, packingOption)
```

### func packToFile(PixelMap, Int32, PackingOption)

```cangjie
public func packToFile(source: PixelMap, fd: Int32, options: PackingOption): Unit
```

**Description:** Encodes an image directly into a file with specified parameters.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| source | [PixelMap](#class-pixelmap) | Yes | - | Image source to encode. |
| fd | Int32 | Yes | - | File descriptor. |
| options | [PackingOption](#class-packingoption) | Yes | - | Packaging parameters. |

**Exceptions:**

- BusinessException: Error codes as below, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980096 | The operation failed. Possible causes: 1.Image upload exception. 2.Decoding process exception. 3.Insufficient memory. |
  | 62980101 | The image data is abnormal. |
  | 62980106 | The image data is too large. This status code is thrown when an error occurs during size checking. |
  | 62980113 | Unknown image format. The provided image data is not in a recognized/supported format or may be corrupted. |
  | 62980115 | Invalid input parameter. |
  | 62980119 | Failed to encode the image. |
  | 62980120 | Add pixelmap out of range. |
  | 62980172 | Failed to encode ICC. |
  | 62980252 | Failed to create surface. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*
import kit.CoreFileKit.{FileIo, OpenMode}

let color: Array<UInt8> = Array<UInt8>(96, repeat: 0) //96 is the required pixel buffer size (height * width *4)
let opts: InitializationOptions = InitializationOptions(
    Size(4, 6),
    editable: true,
    pixelFormat: PixelMapFormat.Rgba8888)
let pixelMap = createPixelMap(color, opts)
var fd: Int32 = 0
let filePath = "data/storage/el1/base/xxx.txt"
let file = FileIo.open(filePath,mode: (OpenMode.CREATE | OpenMode.READ_WRITE))
let packingOption = PackingOption("image/jpeg", 98)
let imagePacker = createImagePacker()
imagePacker.packToFile(pixelMap, fd, packingOption)
```

### func release()

```cangjie
public func release(): Unit
```

**Description:** Releases the ImagePacker instance.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let imagePacker = createImagePacker()
imagePacker.release()
```## class ImagePropertyOptions

```cangjie
public class ImagePropertyOptions {
    public var index: UInt32
    public var defaultValue: String
    public init(index!: UInt32 = 0, defaultValue!: String = "")
}
```

**Function:** Represents the index for querying image properties.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var defaultValue

```cangjie
public var defaultValue: String
```

**Function:** Default property value.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### var index

```cangjie
public var index: UInt32
```

**Function:** Image sequence number.

**Type:** UInt32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### init(UInt32, String)

```cangjie
public init(index!: UInt32 = 0, defaultValue!: String = "")
```

**Function:** Creates an ImagePropertyOptions object.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

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

**Function:** Image receiver class, used to obtain component surface ID, receive the latest image, read the next image, and release the ImageReceiver instance.

An ImageReceiver instance must be created before calling the following methods.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop capacity

```cangjie
public prop capacity: Int32
```

**Function:** Number of images that can be accessed simultaneously.

**Type:** Int32

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop format

```cangjie
public prop format: ImageFormat
```

**Function:** Image format.

**Type:** [ImageFormat](#enum-imageformat)

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### prop size

```cangjie
public prop size: Size
```

**Function:** Image size.

**Type:** [Size](#class-size)

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### func getReceivingSurfaceId()

```cangjie
public func getReceivingSurfaceId(): String
```

**Function:** Used to obtain a surface ID for Camera or other components.

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

let size = Size(8, 8192)
var receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
let id: String = receiver.getReceivingSurfaceId()
```

### func release()

```cangjie
public func release(): Unit
```

**Function:** Releases the current image receiver.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let size = Size(8, 8192)
var receiver = createImageReceiver(size, ImageFormat.Jpeg, 8)
receiver.release()
```

## class ImageSource

```cangjie
public class ImageSource {}
```

**Function:** Image source class, used to obtain image-related information. Before calling ImageSource methods, an ImageSource instance must be created via createImageSource.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### prop supportedFormats

```cangjie
public prop supportedFormats: Array<String>
```

**Function:** Supported image formats, including: png, jpeg, bmp, gif, webp, RAW.

**Type:** Array\<String>

**Read/Write:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

### func createPixelMap(DecodingOptions)

```cangjie
public func createPixelMap(options!: DecodingOptions = DecodingOptions()): PixelMap
```

**Function:** Creates a PixelMap object using image decoding parameters.

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
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let option = DecodingOptions(
    sampleSize: 1,
    rotate: 10,
    editable: true,
    desiredSize: Size(3, 4),
    desiredRegion: Region(Size(3, 4), 0, 0),
    desiredPixelFormat: PixelMapFormat.Rgba8888,
    index: 0,
    fitDensity: 20
)
let pixelMap = imageSourceApi.createPixelMap(options: option)
```

### func createPixelMapList(DecodingOptions)

```cangjie
public func createPixelMapList(options!: DecodingOptions = DecodingOptions()): Array<PixelMap>
```

**Function:** Creates an array of PixelMap objects using image decoding parameters.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| options | [DecodingOptions](#class-decodingoptions) | No | DecodingOptions() | **Named parameter.** Decoding parameters. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[PixelMap](#class-pixelmap)> | Returns an array of PixelMap objects. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980096 | The operation failed. Possible cause: 1.Image upload exception.2. Decoding process exception. 3. Insufficient memory. |
  | 62980099 | The shared memory data is abnormal. |
  | 62980101 | The image data is abnormal. |
  | 62980103 | The image data is not supported. |
  | 62980106 | The image data is too large. This status code is thrown when an error occurs during the process of checking size. |
  | 62980109 | Failed to crop the image. |
  | 62980111 | The image source data is incomplete. |
  | 62980115 | Invalid image parameter. |
  | 62980116 | Failed to decode the image. |
  | 62980118 | Failed to create the image plugin. |
  | 62980137 | Invalid media operation. |
  | 62980173 | The DMA memory does not exist. |
  | 62980174 | The DMA memory data is abnormal. |

### func getDelayTimeList()

```cangjie
public func getDelayTimeList(): Array<Int32>
```

**Function:** Obtains an array of image delay times. This interface is only applicable to GIF images.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<Int32> | Returns an array of delay times. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980096 | The operation failed. Possible cause: 1.Image upload exception.2. Decoding process exception. 3. Insufficient memory. |
  | 62980110 | The image source data is incorrect. |
  | 62980111 | The image source data is incomplete. |
  | 62980115 | Invalid image parameter. |
  | 62980116 | Failed to decode the image. |
  | 62980118 | Failed to create the image plugin. |
  | 62980122 | Failed to decode the image header. |
  | 62980149 | Invalid MIME type for the image source. |

### func getFrameCount()

```cangjie
public func getFrameCount(): UInt32
```

**Function:** Obtains the number of image frames.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Returns the number of image frames. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980096 | The operation failed. Possible cause: 1.Image upload exception.2. Decoding process exception. 3. Insufficient memory. |
  | 62980111 | The image source data is incomplete. |
  | 62980112 | The image format does not match. |
  | 62980113 | Unknown image format.The image data provided is not in a recognized or supported format, or it may be occorrupted. |
  | 62980115 | Invalid image parameter. |
  | 62980116 | Failed to decode the image. |
  | 62980118 | Failed to create the image plugin. |
  | 62980122 | Failed to decode the image header. |
  | 62980137 | Invalid media operation. |

### func getImageInfo(UInt32)

```cangjie
public func getImageInfo(index!: UInt32 = 0): ImageInfo
```

**Function:** Obtains image information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| index | UInt32 | No | 0 | **Named parameter.** Sequence number when creating the image source. Defaults to 0 if not specified. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ImageInfo](#class-imageinfo) | Returns the obtained image information. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
imageSourceApi.getImageInfo(index : 0)
```

### func getImageProperty(PropertyKey, ImagePropertyOptions)

```cangjie
public func getImageProperty(key: PropertyKey, options!: ImagePropertyOptions = ImagePropertyOptions()): String
```

**Function:** Obtains the value of the specified property key for the image at the given index. Only supports JPEG files with EXIF information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | [PropertyKey](#enum-propertykey) | Yes | - | Image property name. |
| options | [ImagePropertyOptions](#class-imagepropertyoptions) | No | ImagePropertyOptions() | **Named parameter.** Image properties, including image sequence number and default property value. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the image property value. If the operation fails, returns the default property value. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types;3.Parameter verification failed; |
  | 62980096 | The operation failed. Possible cause: 1.Image upload exception.2. Decoding process exception. 3. Insufficient memory. |
  | 62980103 | The image data is not supported. |
  | 62980110 | The image source data is incorrect. |
  | 62980111 | The image source data is incomplete. |
  | 62980112 | The image format does not match. |
  | 62980113 | Unknown image format.The image data provided is not in a recognized or supported format, or it may be occorrupted. |
  | 62980115 | Invalid image parameter. |
  | 62980118 | Failed to create the image plugin. |
  | 62980122 | Failed to decode the image header. |
  | 62980123 | The image does not support EXIF decoding. |
  | 62980135 | The EXIF value is invalid. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
imageSourceApi.getImageProperty(PropertyKey.ImageLength)
```

### func modifyImageProperty(PropertyKey, String)

```cangjie
public func modifyImageProperty(key: PropertyKey, value: String): Unit
```

**Function:** Modifies the value of the specified image property key. Only supports JPEG files with EXIF information.

**System Capability:** SystemCapability.Multimedia.Image.ImageSource

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | [PropertyKey](#enum-propertykey) | Yes | - | Image property name. |
| value | String | Yes | - | Property value. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; |
  | 62980123 | The image does not support EXIF decoding. |
  | 62980133 | The EXIF data is out of range. |
  | 62980135 | The EXIF value is invalid. |
  | 62980146 | The EXIF data failed to be written to the file. |

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
let sourceOptions: SourceOptions = SourceOptions(120)
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

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| buf | Array\<UInt8> | Yes | - | Incremental data. |
| isFinished | Bool | Yes | - | Whether the update is complete. |
| offset | UInt32 | Yes | - | Offset. |
| length | UInt32 | Yes | - | Array length. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
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
```## class InitializationOptions

```cangjie
public class InitializationOptions {
    public var alphaType: AlphaType
    public var editable: Bool
    public var srcPixelFormat: PixelMapFormat
    public var pixelFormat: PixelMapFormat
    public var scaleMode: ScaleMode
    public var size: Size
    public init(size: Size, alphaType!: AlphaType = AlphaType.Premul, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888,
        pixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888, scaleMode!: ScaleMode = ScaleMode.FitTargetSize)
}
```

**Description:** Initialization options for PixelMap.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var alphaType

```cangjie
public var alphaType: AlphaType
```

**Description:** Transparency type.

**Type:** [AlphaType](#enum-alphatype)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var editable

```cangjie
public var editable: Bool
```

**Description:** Whether the image is editable.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var pixelFormat

```cangjie
public var pixelFormat: PixelMapFormat
```

**Description:** Pixel format.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var scaleMode

```cangjie
public var scaleMode: ScaleMode
```

**Description:** Scaling mode.

**Type:** [ScaleMode](#enum-scalemode)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var size

```cangjie
public var size: Size
```

**Description:** Size of the image to be created.

**Type:** [Size](#class-size)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var srcPixelFormat

```cangjie
public var srcPixelFormat: PixelMapFormat
```

**Description:** Pixel format of the input buffer data. Default value is BGRA_8888.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Size, AlphaType, Bool, PixelMapFormat, PixelMapFormat, ScaleMode)

```cangjie
public init(size: Size, alphaType!: AlphaType = AlphaType.Premul, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888,
    pixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888, scaleMode!: ScaleMode = ScaleMode.FitTargetSize)
```

**Description:** Creates an InitializationOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| size | [Size](#class-size) | Yes | - | **Named parameter.** Size of the image to be created. |
| alphaType | [AlphaType](#enum-alphatype) | No | AlphaType.Premul | **Named parameter.** Transparency type. |
| editable | Bool | No | false | **Named parameter.** Whether the image is editable. |
| srcPixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.Bgra8888 | **Named parameter.** Pixel format of the input buffer data. |
| pixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.Bgra8888 | **Named parameter.** Pixel format. |
| scaleMode | [ScaleMode](#enum-scalemode) | No | ScaleMode.FitTargetSize | **Named parameter.** Scaling mode. |

## class PackingOption

```cangjie
public class PackingOption {
    public var format: String
    public var quality: UInt8
    public var bufferSize: UInt64
    public var desiredDynamicRange: PackingDynamicRange
    public var needsPackProperties: Bool
    public init(format: String, quality: UInt8, bufferSize!: UInt64 = 25  * 1024  * 1024,
        desiredDynamicRange!: PackingDynamicRange = Sdr, needsPackProperties!: Bool = false)
}
```

**Description:** Image packing options.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### var bufferSize

```cangjie
public var bufferSize: UInt64
```

**Description:** Buffer size for receiving encoded data, in bytes. Default is 25MB if not specified. If the encoded image exceeds 25MB, this parameter must be specified. bufferSize must be larger than the size of the encoded image. Not applicable when using [packToFile](#func-packtofileimagesource-int-packingoption).

**Type:** UInt64

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### var desiredDynamicRange

```cangjie
public var desiredDynamicRange: PackingDynamicRange
```

**Description:** Target dynamic range. Default is SDR.

**Type:** [PackingDynamicRange](#enum-packingdynamicrange)

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### var format

```cangjie
public var format: String
```

**Description:** Target format.</br>Currently supports "image/jpeg", "image/webp", "image/png", and "image/heif" (availability varies by hardware).

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### var needsPackProperties

```cangjie
public var needsPackProperties: Bool
```

**Description:** Whether to include image property information (e.g., EXIF) in the encoding. Default is false.

**Type:** Bool

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### var quality

```cangjie
public var quality: UInt8
```

**Description:** Quality parameter for JPEG encoding, ranging from 0-100. 0 is the lowest quality, 100 is the highest. Higher quality results in larger file sizes.

**Type:** UInt8

**Access:** Read-write

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

### init(String, UInt8, UInt64, PackingDynamicRange, Bool)

```cangjie
public init(format: String, quality: UInt8, bufferSize!: UInt64 = 25  * 1024  * 1024,
    desiredDynamicRange!: PackingDynamicRange = Sdr, needsPackProperties!: Bool = false)
```

**Description:** Creates a PackingOption object.

**System Capability:** SystemCapability.Multimedia.Image.ImagePacker

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| format | String | Yes | - | Target format.</br>Currently supports "image/jpeg", "image/webp", "image/png", and "image/heif" (availability varies by hardware). |
| quality | UInt8 | Yes | - | Quality parameter for JPEG encoding, ranging from 0-100. 0 is the lowest quality, 100 is the highest. Higher quality results in larger file sizes. |
| bufferSize | UInt64 | No | 25 * 1024 * 1024 | **Named parameter.** Buffer size for receiving encoded data, in bytes. Default is 25MB if not specified. If the encoded image exceeds 25MB, this parameter must be specified. bufferSize must be larger than the size of the encoded image. Not applicable when using [packToFile](#func-packtofileimagesource-intnative-packingoption). |
| desiredDynamicRange | [PackingDynamicRange](#enum-packingdynamicrange) | No | Sdr | **Named parameter.** Target dynamic range. |
| needsPackProperties | Bool | No | false | **Named parameter.** Whether to include image property information (e.g., EXIF) in the encoding. |

## class PixelMap

```cangjie
public class PixelMap {}
```

**Description:** Image pixel class for reading or writing image data and obtaining image information. Before calling PixelMap methods, create a PixelMap instance via [createPixelMap](#func-createpixelmaparrayuint-initializationoptions). Current maximum serialized size for pixelmap is 128MB; exceeding this will cause display failure. Size calculation: (width * height * bytes per pixel).

PixelMap supports cross-thread calls via Worker. After PixelMap is transferred across threads via Worker, all interfaces of the original thread's PixelMap become unavailable and will throw error 501 (Not Implemented).

Before calling PixelMap methods, create a PixelMap object via [createPixelMap](#func-createpixelmaparrayuint-initializationoptions).

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### prop isEditable

```cangjie
public prop isEditable: Bool
```

**Description:** Sets whether the image pixels can be edited.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### prop isStrideAlignment

```cangjie
public prop isStrideAlignment: Bool
```

**Description:** Sets whether the image memory is DMA memory.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func applyColorSpace(ColorSpaceManager)

```cangjie
public func applyColorSpace(targetColorSpace: ColorSpaceManager): Unit
```

**Description:** Performs color space conversion on image pixels based on the input target color space.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| targetColorSpace | [ColorSpaceManager](#class-colorspacemanager) | Yes | - | Target color space, supports Srgb, DCI_P3, DisplayP3, ADOBE_RGB_1998. |

**Exceptions:**

- BusinessException: Error codes as follows, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code | Error Message |
  | :---- | :--- |
  | 401 | The parameter check failed. |
  | 62980104 | Failed to initialize the internal object. |
  | 62980108 | Failed to convert the color space. |
  | 62980115 | Invalid image parameter. |

### func createAlphaPixelmap()

```cangjie
public func createAlphaPixelmap(): PixelMap
```

**Description:** Generates a pixelmap containing only alpha channel information based on the alpha channel, which can be used for shadow effects.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [PixelMap](#class-pixelmap) | Returns a pixelmap instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let alphaPixelmap = pixelMap.createAlphaPixelmap()
```

### func crop(Region)

```cangjie
public func crop(region: Region): Unit
```

**Description:** Crops the image based on the input dimensions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| region | [Region](#class-region) | Yes | - | Dimensions for cropping. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let region: Region = Region(Size(100, 100), 0, 0)
pixelMap.crop(region)
```### func flip(Bool, Bool)

```cangjie
public func flip(horizontal: Bool, vertical: Bool): Unit
```

**Function:** Flips the image based on input conditions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| horizontal | Bool | Yes | - | Horizontal flip. |
| vertical | Bool | Yes | - | Vertical flip. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
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

**Function:** Gets the number of bytes per row of image pixels.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | The number of bytes per row of image pixels. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
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
| [ColorSpaceManager](#class-colorspacemanager) | The wide color gamut information of the image. |

**Exceptions:**

- BusinessException: Corresponding error codes are as follows. For details, see [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
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
let sourceOptions: SourceOptions = SourceOptions(120)
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
| [ImageInfo](#class-imageinfo) | Used to get the pixel information of the image. Returns an error message if failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
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
let sourceOptions: SourceOptions = SourceOptions(120)
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

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| rate | Float32 | Yes | - | The value of the transparency ratio. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
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
| area | [PositionArea](#class-positionarea) | Yes | - | The area size. Reads based on the area. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let area: PositionArea = PositionArea(
    Array<UInt8>(8, repeat: 0),
    0,
    8,
    Region(Size(1, 2), 0, 0)
)
pixelMap.readPixels(area)
```

### func readPixelsToBuffer(Array\<UInt8>)

```cangjie
public func readPixelsToBuffer(dst: Array<UInt8>): Unit
```

**Function:** Reads image pixel data and writes the result into an Array\<UInt8>. When creating a pixelmap with BGRA_8888 format, the read pixel data remains consistent with the original data.

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
let sourceOptions: SourceOptions = SourceOptions(120)
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
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
pixelMap.release()
```

### func rotate(Float32)

```cangjie
public func rotate(angle: Float32): Unit
```

**Function:** Rotates the image based on the input angle.

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
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let angle: Float32 = 90.0
pixelMap.rotate(angle)
```

### func scale(Float32, Float32)

```cangjie
public func scale(x: Float32, y: Float32): Unit
```

**Function:** Scales the image based on the input width and height.

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

**Function:** Sets the wide color gamut information of the image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| colorSpace | [ColorSpaceManager](#class-colorspacemanager) | Yes | - | The wide color gamut information of the image. |

**Exceptions:**

- BusinessException: Corresponding error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Image Error Codes](../../errorcodes/cj-errorcode-image.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 62980111 | The image source data is incomplete. |
  | 62980115 | If the image parameter is invalid. |

### func translate(Float32, Float32)

```cangjie
public func translate(x: Float32, y: Float32): Unit
```

**Function:** Transforms the position of the image based on the input coordinates.

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
let sourceOptions: SourceOptions = SourceOptions(120)
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
let sourceOptions: SourceOptions = SourceOptions(120)
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
| area | [PositionArea](#class-positionarea) | Yes | - | The area to write into. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ImageKit.*

let data: Array<UInt8> = Array<UInt8>(112, repeat: 0)
let sourceOptions: SourceOptions = SourceOptions(120)
let imageSourceApi: ImageSource = createImageSource(data, sourceOptions)
let pixelMap = imageSourceApi.createPixelMap()
let area: PositionArea = PositionArea(
    Array<UInt8>(8, {i => UInt8(i)}),
    0,
    8,
    Region(Size(1, 2), 0, 0)
)
pixelMap.writePixels(area)
``````markdown
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

**Function:** Represents data within a specified region of an image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var offset

```cangjie
public var offset: UInt32
```

**Function:** Offset value.

**Type:** UInt32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var pixels

```cangjie
public var pixels: Array<UInt8>
```

**Function:** Pixels.

**Type:** Array\<UInt8>

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var region

```cangjie
public var region: Region
```

**Function:** Region for read/write operations. The sum of the region width and X-coordinate must not exceed the original image width, and the sum of the region height and Y-coordinate must not exceed the original image height.

**Type:** [Region](#class-region)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var stride

```cangjie
public var stride: UInt32
```

**Function:** Stride, the space occupied by each row of pixels in memory. stride >= region.size.width*4.

**Type:** UInt32

**Read/Write:** Readable and Writable

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

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| pixels | Array\<UInt8> | Yes | - | Pixels. |
| offset | UInt32 | Yes | - | Offset value. |
| stride | UInt32 | Yes | - | Stride, the space occupied by each row of pixels in memory. stride >= region.size.width*4. |
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

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var x

```cangjie
public var x: Int32
```

**Function:** X-coordinate of the region.

**Type:** Int32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var y

```cangjie
public var y: Int32
```

**Function:** Y-coordinate of the region.

**Type:** Int32

**Read/Write:** Readable and Writable

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

| Parameter | Type | Required | Default | Description |
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

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var width

```cangjie
public var width: Int32
```

**Function:** Width of the output image.

**Type:** Int32

**Read/Write:** Readable and Writable

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

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| height | Int32 | Yes | - | Height of the output image. |
| width | Int32 | Yes | - | Width of the output image. |

## class SourceOptions

```cangjie
public class SourceOptions {
    public var sourceDensity: Int32
    public var sourcePixelFormat: PixelMapFormat
    public var sourceSize: Size
    public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.Unknown, sourceSize!: Size = Size(0, 0))
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

When the decoding parameter [DecodingOptions](#class-decodingoptions) does not set desiredSize, and both SourceOptions.sourceDensity and DecodingOptions.fitDensity are non-zero, the decoded output pixelmap will be scaled.

The scaled width is calculated as follows (height is similar): (width * fitDensity + (sourceDensity >> 1)) / sourceDensity.

**Type:** Int32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var sourcePixelFormat

```cangjie
public var sourcePixelFormat: PixelMapFormat
```

**Function:** Pixel format of the image, default is UNKNOWN.

**Type:** [PixelMapFormat](#enum-pixelmapformat)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### var sourceSize

```cangjie
public var sourceSize: Size
```

**Function:** Pixel size of the image, default is empty.

**Type:** [Size](#class-size)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### init(Int32, PixelMapFormat, Size)

```cangjie
public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.Unknown, sourceSize!: Size = Size(0, 0))
```

**Function:** Creates a SourceOptions object.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| sourceDensity | Int32 | Yes | - | Pixel density of the image resource, in DPI.<br>When the decoding parameter [DecodingOptions](#class-decodingoptions) does not set desiredSize, and both SourceOptions.sourceDensity and DecodingOptions.fitDensity are non-zero, the decoded output pixelmap will be scaled.<br>The scaled width is calculated as follows (height is similar): (width * fitDensity + (sourceDensity >> 1)) / sourceDensity. |
| sourcePixelFormat | [PixelMapFormat](#enum-pixelmapformat) | No | PixelMapFormat.Unknown | **Named parameter** Pixel format of the image, default is UNKNOWN. |
| sourceSize | [Size](#class-size) | No | Size(0, 0) | **Named parameter** Pixel size of the image, default is empty. |

## enum AlphaType

```cangjie
public enum AlphaType <: Equatable<AlphaType> & ToString {
    | Unknown
    | Opaque
    | Premul
    | UnPremul
    | ...
}
```

**Function:** Transparency type of an image.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<AlphaType>
- ToString

### Opaque

```cangjie
Opaque
```

**Function:** No alpha or the image is opaque.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Premul

```cangjie
Premul
```

**Function:** RGB with premultiplied alpha.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### UnPremul

```cangjie
UnPremul
```

**Function:** RGB without premultiplied alpha.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Function:** Unknown transparency.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(AlphaType)

```cangjie
public operator func !=(other: AlphaType): Bool
```

**Function:** Determines if two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlphaType](#enum-alphatype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are not equal, otherwise false. |

### func ==(AlphaType)

```cangjie
public operator func ==(other: AlphaType): Bool
```

**Function:** Determines if two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AlphaType](#enum-alphatype) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |
``````markdown
## enum ComponentType

```cangjie
public enum ComponentType <: Equatable<ComponentType> & ToString {
    | YuvY
    | YuvU
    | YuvV
    | Jpeg
    | ...
}
```

**Function:** Image component type.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

**Parent Types:**

- Equatable\<ComponentType>
- ToString

### Jpeg

```cangjie
Jpeg
```

**Function:** JPEG type.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### YuvU

```cangjie
YuvU
```

**Function:** Chrominance information.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### YuvV

```cangjie
YuvV
```

**Function:** Chrominance information.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### YuvY

```cangjie
YuvY
```

**Function:** Luminance information.

**System Capability:** SystemCapability.Multimedia.Image.ImageReceiver

**Since:** 21

### func !=(ComponentType)

```cangjie
public operator func !=(other: ComponentType): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ComponentType](#enum-componenttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(ComponentType)

```cangjie
public operator func ==(other: ComponentType): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ComponentType](#enum-componenttype)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum DecodingDynamicRange

```cangjie
public enum DecodingDynamicRange <: Equatable<DecodingDynamicRange> & ToString {
    | Auto
    | Sdr
    | Hdr
    | ...
}
```

**Function:** Describes the expected image dynamic range during decoding.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<DecodingDynamicRange>
- ToString

### Auto

```cangjie
Auto
```

**Function:** Adaptive processing based on image information. If the image itself is HDR, it will be decoded as HDR content; otherwise, it will be decoded as SDR content. Images created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-asynccallbackimagesource) will be decoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Hdr

```cangjie
Hdr
```

**Function:** Processes the image as high dynamic range content. Images created via [CreateIncrementalSource](#func-createincrementalsourcearrayuint8-asynccallbackimagesource) will be decoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Sdr

```cangjie
Sdr
```

**Function:** Processes the image as standard dynamic range content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(DecodingDynamicRange)

```cangjie
public operator func !=(other: DecodingDynamicRange): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[DecodingDynamicRange](#enum-decodingdynamicrange)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(DecodingDynamicRange)

```cangjie
public operator func ==(other: DecodingDynamicRange): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[DecodingDynamicRange](#enum-decodingdynamicrange)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum ImageFormat

```cangjie
public enum ImageFormat <: Equatable<ImageFormat> & ToString {
    | Ycbcr422Sp
    | Jpeg
    | ...
}
```

**Function:** Image format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<ImageFormat>
- ToString

### Jpeg

```cangjie
Jpeg
```

**Function:** JPEG encoding format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Ycbcr422Sp

```cangjie
Ycbcr422Sp
```

**Function:** YCBCR422 semi-planar format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(ImageFormat)

```cangjie
public operator func !=(other: ImageFormat): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageFormat](#enum-imageformat)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(ImageFormat)

```cangjie
public operator func ==(other: ImageFormat): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ImageFormat](#enum-imageformat)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|

## enum PackingDynamicRange

```cangjie
public enum PackingDynamicRange <: Equatable<PackingDynamicRange> & ToString {
    | Auto
    | Sdr
    | ...
}
```

**Function:** Describes the expected image dynamic range during encoding.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<PackingDynamicRange>
- ToString

### Auto

```cangjie
Auto
```

**Function:** Adaptive processing based on [pixelmap](#class-pixelmap) content. If the pixelmap itself is HDR, it will be encoded as HDR content; otherwise, it will be encoded as SDR content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Sdr

```cangjie
Sdr
```

**Function:** Processes the image as standard dynamic range content.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PackingDynamicRange)

```cangjie
public operator func !=(other: PackingDynamicRange): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PackingDynamicRange](#enum-packingdynamicrange)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(PackingDynamicRange)

```cangjie
public operator func ==(other: PackingDynamicRange): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[PackingDynamicRange](#enum-packingdynamicrange)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the enum value.

**Return Value:**

|Type|Description|
|:----|:----|
|String|Description of the enum.|
```## enum PixelMapFormat

```cangjie
public enum PixelMapFormat <: Equatable<PixelMapFormat> & ToString {
    | Unknown
    | Rgb565
    | Rgba8888
    | Bgra8888
    | Rgb888
    | Alpha8
    | RgbaF16
    | Nv21
    | Nv12
    | Rgba1010102
    | YcbcrP010
    | YcrcbP010
    | ...
}
```

**Description:** Pixel format of images.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<PixelMapFormat>
- ToString

### Alpha8

```cangjie
Alpha8
```

**Description:** ALPHA_8 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Bgra8888

```cangjie
Bgra8888
```

**Description:** BGRA_8888 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Nv12

```cangjie
Nv12
```

**Description:** NV12 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Nv21

```cangjie
Nv21
```

**Description:** NV21 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Rgb565

```cangjie
Rgb565
```

**Description:** RGB_565 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Rgb888

```cangjie
Rgb888
```

**Description:** RGB_888 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Rgba1010102

```cangjie
Rgba1010102
```

**Description:** RGBA_1010102 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Rgba8888

```cangjie
Rgba8888
```

**Description:** RGBA_8888 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RgbaF16

```cangjie
RgbaF16
```

**Description:** RGBA_F16 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Description:** Unknown format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YcbcrP010

```cangjie
YcbcrP010
```

**Description:** YCBCR_P010 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### YcrcbP010

```cangjie
YcrcbP010
```

**Description:** YCRCB_P010 format.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PixelMapFormat)

```cangjie
public operator func !=(other: PixelMapFormat): Bool
```

**Description:** Determines whether two enum values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PixelMapFormat](#enum-pixelmapformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are unequal, otherwise returns false. |

### func ==(PixelMapFormat)

```cangjie
public operator func ==(other: PixelMapFormat): Bool
```

**Description:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PixelMapFormat](#enum-pixelmapformat) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the enum values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the value of the enum.

**Return Value:**

| Type | Description |
|:----|:----|
| String | Description of the enum. |

## enum PropertyKey

```cangjie
public enum PropertyKey <: ToString & Equatable<PropertyKey> {
    | ImageWidth
    | ImageLength
    | BitsPerSample
    | ImageDescription
    | Make
    | Model
    | Orientation
    | DateTime
    | PhotoMode
    | ExposureTime
    | FNumber
    | GPSLatitudeRef
    | GPSLatitude
    | GPSLongitudeRef
    | GPSLongitude
    | GPSTimeStamp
    | GPSDateStamp
    | ISOSpeedRatings
    | SensitivityType
    | StandardOutputSensitivity
    | RecommendedExposureIndex
    | ISOSpeed
    | DateTimeOriginal
    | ApertureValue
    | ExposureBiasValue
    | MeteringMode
    | LightSource
    | Flash
    | FocalLength
    | SceneFoodConf
    | SceneStageConf
    | SceneBlueSkyConf
    | SceneGreenPlantConf
    | SceneBeachConf
    | SceneSnowConf
    | SceneSunsetConf
    | SceneFlowersConf
    | SceneNightConf
    | SceneTextConf
    | FaceCount
    | CaptureMode
    | RollAngle
    | PitchAngle
    | PhysicalAperture
    | FocusMode
    | UserComment
    | PixelXDimension
    | PixelYDimension
    | SceneType
    | WhiteBalance
    | FocalLengthIn35mmFilm
    | ...
}
```

**Description:** EXIF (Exchangeable Image File Format) image information.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- ToString
- Equatable\<PropertyKey>

### ApertureValue

```cangjie
ApertureValue
```

**Description:** Aperture value.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### BitsPerSample

```cangjie
BitsPerSample
```

**Description:** Bits per pixel.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### CaptureMode

```cangjie
CaptureMode
```

**Description:** Capture mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### DateTime

```cangjie
DateTime
```

**Description:** Date and time.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### DateTimeOriginal

```cangjie
DateTimeOriginal
```

**Description:** Shooting time, e.g., 2022:09:06 15:48:00.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ExposureBiasValue

```cangjie
ExposureBiasValue
```

**Description:** Exposure bias value.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ExposureTime

```cangjie
ExposureTime
```

**Description:** Exposure time, e.g., 1/33 sec.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FNumber

```cangjie
FNumber
```

**Description:** Aperture value, e.g., f/1.8.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FaceCount

```cangjie
FaceCount
```

**Description:** Number of faces.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21### Flash

```cangjie
Flash
```

**Function:** Flash, records the flash status.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FocalLength

```cangjie
FocalLength
```

**Function:** Focal length.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FocalLengthIn35mmFilm

```cangjie
FocalLengthIn35mmFilm
```

**Function:** Focal length in 35mm film.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FocusMode

```cangjie
FocusMode
```

**Function:** Focus mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSDateStamp

```cangjie
GPSDateStamp
```

**Function:** GPS date stamp.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSLatitude

```cangjie
GPSLatitude
```

**Function:** Image latitude. When modifying, it should be passed in the format of "degrees, minutes, seconds", e.g., "39,54,7.542".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSLatitudeRef

```cangjie
GPSLatitudeRef
```

**Function:** Latitude reference, e.g., N or S.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSLongitude

```cangjie
GPSLongitude
```

**Function:** Image longitude. When modifying, it should be passed in the format of "degrees, minutes, seconds", e.g., "116,19,42.16".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSLongitudeRef

```cangjie
GPSLongitudeRef
```

**Function:** Longitude reference, e.g., W or E.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### GPSTimeStamp

```cangjie
GPSTimeStamp
```

**Function:** GPS timestamp.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ISOSpeed

```cangjie
ISOSpeed
```

**Function:** ISO speed rating.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ISOSpeedRatings

```cangjie
ISOSpeedRatings
```

**Function:** ISO sensitivity, e.g., 400.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ImageDescription

```cangjie
ImageDescription
```

**Function:** Image information description.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ImageLength

```cangjie
ImageLength
```

**Function:** Image length.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### ImageWidth

```cangjie
ImageWidth
```

**Function:** Image width.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### LightSource

```cangjie
LightSource
```

**Function:** Light source.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Make

```cangjie
Make
```

**Function:** Manufacturer.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### MeteringMode

```cangjie
MeteringMode
```

**Function:** Metering mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Model

```cangjie
Model
```

**Function:** Device model.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### Orientation

```cangjie
Orientation
```

**Function:** Image orientation.<br/>- 1: Top-left, image not rotated.<br/>- 2: Top-right, mirrored horizontally.<br/>- 3: Bottom-right, image rotated 180°.<br/>- 4: Bottom-left, mirrored vertically.<br/>- 5: Left-top, mirrored horizontally and rotated clockwise 270°.<br/>- 6: Right-top, rotated clockwise 90°.<br/>- 7: Right-bottom, mirrored horizontally and rotated clockwise 90°.<br/>- 8: Left-bottom, rotated clockwise 270°.<br/>- Undefined values return "Unknown Value".

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PhotoMode

```cangjie
PhotoMode
```

**Function:** Photo mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PhysicalAperture

```cangjie
PhysicalAperture
```

**Function:** Physical aperture, aperture size.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PitchAngle

```cangjie
PitchAngle
```

**Function:** Pitch angle.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PixelXDimension

```cangjie
PixelXDimension
```

**Function:** Pixel X dimension.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### PixelYDimension

```cangjie
PixelYDimension
```

**Function:** Pixel Y dimension.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RecommendedExposureIndex

```cangjie
RecommendedExposureIndex
```

**Function:** Recommended exposure index.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### RollAngle

```cangjie
RollAngle
```

**Function:** Roll angle.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneBeachConf

```cangjie
SceneBeachConf
```

**Function:** Photo scene: beach.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneBlueSkyConf

```cangjie
SceneBlueSkyConf
```

**Function:** Photo scene: blue sky.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneFlowersConf

```cangjie
SceneFlowersConf
```

**Function:** Photo scene: flowers.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneFoodConf

```cangjie
SceneFoodConf
```

**Function:** Photo scene: food.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneGreenPlantConf

```cangjie
SceneGreenPlantConf
```

**Function:** Photo scene: green plants.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneNightConf

```cangjie
SceneNightConf
```

**Function:** Photo scene: night.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneSnowConf

```cangjie
SceneSnowConf
```

**Function:** Photo scene: snow.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneStageConf

```cangjie
SceneStageConf
```

**Function:** Photo scene: stage.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneSunsetConf

```cangjie
SceneSunsetConf
```

**Function:** Photo scene: sunset.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneTextConf

```cangjie
SceneTextConf
```

**Function:** Photo scene: text.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SceneType

```cangjie
SceneType
```

**Function:** Shooting scene mode, e.g., portrait, landscape, sports, night, etc.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### SensitivityType

```cangjie
SensitivityType
```

**Function:** Sensitivity type.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### StandardOutputSensitivity

```cangjie
StandardOutputSensitivity
```

**Function:** Standard output sensitivity.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### UserComment

```cangjie
UserComment
```

**Function:** User comment.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### WhiteBalance

```cangjie
WhiteBalance
```

**Function:** White balance.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(PropertyKey)

```cangjie
public operator func !=(other: PropertyKey): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PropertyKey](#enum-propertykey) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are not equal, otherwise returns false. |

### func ==(PropertyKey)

```cangjie
public operator func ==(other: PropertyKey): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [PropertyKey](#enum-propertykey) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enum values are equal, otherwise returns false. |

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
| String | Description of the enum. |

**Exceptions:**

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The type is not supported yet. | Invalid enum value, the enum value is not supported. | Check if the passed enum value is correct. |## enum ScaleMode

```cangjie
public enum ScaleMode <: Equatable<ScaleMode> & ToString {
    | FitTargetSize
    | CenterCrop
    | ...
}
```

**Function:** Image scaling mode.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

**Parent Types:**

- Equatable\<ScaleMode>
- ToString

### CenterCrop

```cangjie
CenterCrop
```

**Function:** Scales the image to fill the target image area while center-cropping the excess regions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### FitTargetSize

```cangjie
FitTargetSize
```

**Function:** Scales the image to fit the target dimensions.

**System Capability:** SystemCapability.Multimedia.Image.Core

**Since:** 21

### func !=(ScaleMode)

```cangjie
public operator func !=(other: ScaleMode): Bool
```

**Function:** Determines whether two enum values are unequal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScaleMode](#enum-scalemode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are unequal, otherwise returns false.|

### func ==(ScaleMode)

```cangjie
public operator func ==(other: ScaleMode): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[ScaleMode](#enum-scalemode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**Return Value:**

|Type|Description|
|:----|:----|
|String|The description of the enum.|

## Additional Notes

### SVG Tag Specifications

Supports SVG tags using version (SVG) 1.1. Currently supported tags include:

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