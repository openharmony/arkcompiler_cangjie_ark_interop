/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.multimedia.image

import ohos.graphics.color_space_manager.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

/**
 * Describes image information.
 *
 * @relation interface ImageInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class ImageInfo {
    /**
     * Indicates image dimensions.
     *
     * @relation size: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var size: Size

    /**
     * Indicates image default density.
     *
     * @relation density: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var density: Int32

    /**
     * The number of byte per row.
     *
     * @relation stride: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var stride: Int32

    /**
     * Indicates image format.
     *
     * @relation pixelFormat: PixelMapFormat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var pixelFormat: PixelMapFormat

    /**
     * Indicates image alpha type.
     *
     * @relation alphaType: AlphaType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var alphaType: AlphaType

    /**
     * Indicates image mime type.
     *
     * @relation mimeType: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var mimeType: String

    /**
     * Indicates whether the image high dynamic range.
     *
     * @relation isHdr: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var isHdr: Bool

    init(size: Size, density: Int32, stride: Int32, pixelFormat: PixelMapFormat, alphaType: AlphaType,
        mimeType: String, isHdr: Bool) {
        this.size = size
        this.density = density
        this.stride = stride
        this.pixelFormat = pixelFormat
        this.alphaType = alphaType
        this.mimeType = mimeType
        this.isHdr = isHdr
    }
}

/**
 * Initialization options for ImageSource.
 *
 * @relation interface SourceOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class SourceOptions {
    /**
     * The density for ImageSource.
     *
     * @relation sourceDensity: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var sourceDensity: Int32

    /**
     * PixelMap expected format.
     *
     * @relation sourcePixelFormat?: PixelMapFormat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var sourcePixelFormat: PixelMapFormat

    /**
     * PixelMap size.
     *
     * @relation sourceSize?: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var sourceSize: Size

    /**
     * SourceOptions constructor .
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(sourceDensity: Int32, sourcePixelFormat!: PixelMapFormat = PixelMapFormat.Unknown, sourceSize!: Size = Size(0, 0)) {
        this.sourceDensity = sourceDensity
        this.sourcePixelFormat = sourcePixelFormat
        this.sourceSize = sourceSize
    }

    func toExternal(): CSourceOptions {
        return CSourceOptions(sourceDensity, sourcePixelFormat.getValue(), sourceSize.height, sourceSize.width)
    }
}

/**
 * Initialization options for pixelmap.
 *
 * @relation interface InitializationOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class InitializationOptions {
    /**
     * PixelMap expected alpha type.
     *
     * @relation alphaType?: AlphaType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var alphaType: AlphaType

    /**
     * Editable or not.
     *
     * @relation editable?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var editable: Bool

    /**
     * PixelMap source format.
     *
     * @relation srcPixelFormat?: PixelMapFormat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var srcPixelFormat: PixelMapFormat

    /**
     * PixelMap expected format.
     *
     * @relation pixelFormat?: PixelMapFormat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var pixelFormat: PixelMapFormat

    /**
     * PixelMap expected scaling effect.
     *
     * @relation scaleMode?: ScaleMode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var scaleMode: ScaleMode

    /**
     * PixelMap size.
     *
     * @relation size: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var size: Size

    /**
     * InitializationOptions constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(size: Size, alphaType!: AlphaType = AlphaType.Premul, editable!: Bool = false, srcPixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888,
        pixelFormat!: PixelMapFormat = PixelMapFormat.Bgra8888, scaleMode!: ScaleMode = ScaleMode.FitTargetSize) {
        this.alphaType = alphaType
        this.editable = editable
        this.srcPixelFormat = srcPixelFormat
        this.pixelFormat = pixelFormat
        this.scaleMode = scaleMode
        this.size = size
    }

    func toExternal(): CInitializationOptionsV2 {
        return unsafe {
            CInitializationOptionsV2(alphaType.getValue(), editable, srcPixelFormat.getValue(), pixelFormat.getValue(),
                scaleMode.getValue(), size.width, size.height)
        }
    }
}

/**
 * Describes image decoding parameters.
 *
 * @relation interface DecodingOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public class DecodingOptions {
    /**
     * Sampling ratio of the image pixel map.
     *
     * @relation sampleSize?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var sampleSize: UInt32

    /**
     * Rotation angle of the image pixel map. The value ranges from 0 to 360.
     *
     * @relation rotate?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var rotate: UInt32

    /**
     * Whether the image pixel map is editable.
     *
     * @relation editable?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var editable: Bool

    /**
     * Width and height of the image pixel map. The value (0, 0) indicates that the pixels are decoded
     * based on the original image size.
     *
     * @relation desiredSize?: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var desiredSize: Size

    /**
     * Cropping region of the image pixel map.
     *
     * @relation desiredRegion?: Region
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var desiredRegion: Region

    /**
     * Data format of the image pixel map.
     *
     * @relation desiredPixelFormat?: PixelMapFormat
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var desiredPixelFormat: PixelMapFormat

    /**
     * Number of image frames.
     *
     * @relation index?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var index: UInt32

    /**
     * The density for image pixel map.
     *
     * @relation fitDensity?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var fitDensity: Int32

    /**
     * Color space of the image pixel map.
     *
     * @relation desiredColorSpace?: colorSpaceManager.ColorSpaceManager
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var desiredColorSpace: ?ColorSpaceManager

    /**
     * The desired dynamic range of the image pixelmap.
     *
     * @relation desiredDynamicRange?: DecodingDynamicRange
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var desiredDynamicRange: DecodingDynamicRange

    /**
     * DecodingOptions constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
        desiredSize!: Size = Size(0, 0), desiredRegion!: Region = Region(Size(0, 0), 0, 0),
        desiredPixelFormat!: PixelMapFormat = Unknown, index!: UInt32 = 0, fitDensity!: Int32 = 0,
        desiredColorSpace!: ?ColorSpaceManager = None, desiredDynamicRange!: DecodingDynamicRange = Sdr) {
        this.sampleSize = sampleSize
        this.rotate = rotate
        this.editable = editable
        this.desiredSize = desiredSize
        this.desiredRegion = desiredRegion
        this.desiredPixelFormat = desiredPixelFormat
        this.index = index
        this.fitDensity = fitDensity
        this.desiredColorSpace = desiredColorSpace
        this.desiredDynamicRange = desiredDynamicRange
    }

    func getValue(): CDecodingOptionsV2 {
        parseDecodeOptions()
        let newRotate = Float32(rotate)
        return CDecodingOptionsV2(fitDensity, desiredSize.toExternal(), desiredRegion.toExternal(), newRotate,
            sampleSize, desiredPixelFormat.getValue(), editable, desiredColorSpace?.getID() ?? 0,
            desiredDynamicRange.value)
    }

    func parseDecodeOptions() {
        if (rotate < 0 || rotate > 360) {
            throw BusinessException(ERR_PARAMETER_ERROR, "DecodeOptions mismatch: Invalid rotate ${rotate}")
        }
        if (desiredPixelFormat.getValue() > 9) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "DecodeOptions mismatch: Invalid desiredPixelFormat ${desiredPixelFormat.getValue()}")
        }
    }
}

/**
 * Describes area information in an image.
 *
 * @relation interface PositionArea
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class PositionArea {
    /**
     * Image data that will be read or written.
     *
     * @relation pixels: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var pixels: Array<UInt8>

    /**
     * Offset for data reading.
     *
     * @relation offset: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var offset: UInt32

    /**
     * Number of bytes to read.
     *
     * @relation stride: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var stride: UInt32

    /**
     * Region to read.
     *
     * @relation region: Region
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var region: Region

    /**
     * PositionArea constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(pixels: Array<UInt8>, offset: UInt32, stride: UInt32, region: Region) {
        this.pixels = pixels
        this.offset = offset
        this.stride = stride
        this.region = region
    }
}

/**
 * Describes the size of an image.
 *
 * @relation interface Size
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Size {
    /**
     * Height.
     *
     * @relation height: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var height: Int32

    /**
     * Width.
     *
     * @relation width: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var width: Int32

    /**
     * Size constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(height: Int32, width: Int32) {
        this.height = height
        this.width = width
    }

    protected func toExternal(): CSize {
        return CSize(height, width)
    }

    init(cSize: CSize) {
        this.height = cSize.height
        this.width = cSize.width
    }
}

/**
 * Describes region information.
 *
 * @relation interface Region
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Region {
    /**
     * Image size.
     *
     * @relation size: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var size: Size

    /**
     * x-coordinate at the upper left corner of the image.
     *
     * @relation x: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var x: Int32

    /**
     * y-coordinate at the upper left corner of the image.
     *
     * @relation y: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var y: Int32

    /**
     * Region constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(size: Size, x: Int32, y: Int32) {
        this.size = size
        this.x = x
        this.y = y
    }

    func toExternal(): CRegion {
        return CRegion(size.toExternal(), x, y)
    }

    init(cRegion: CRegion) {
        this.size = Size(cRegion.size)
        this.x = cRegion.x
        this.y = cRegion.y
    }
}

/**
 * Describes image color components.
 *
 * @relation interface Component
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Component {
    /**
     * Component type.
     *
     * @relation readonly componentType: ComponentType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let componentType: ComponentType

    /**
     * Row stride.
     *
     * @relation readonly rowStride: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let rowStride: Int32

    /**
     * Pixel stride.
     *
     * @relation readonly pixelStride: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let pixelStride: Int32

    /**
     * Component buffer.
     *
     * @relation readonly byteBuffer: ArrayBuffer
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let byteBuffer: Array<UInt8>

    init(componentType: ComponentType, rowStride: Int32, pixelStride: Int32, byteBuffer: Array<UInt8>) {
        this.componentType = componentType
        this.rowStride = rowStride
        this.pixelStride = pixelStride
        this.byteBuffer = byteBuffer
    }

    init(component: CRetComponent) {
        this.componentType = ComponentType.parse(component.componentType)
        this.rowStride = component.rowStride
        this.pixelStride = component.pixelStride
        this.byteBuffer = Array<UInt8>(component.bufSize, repeat: 0)
        for (i in 0..component.bufSize) {
            this.byteBuffer[i] = unsafe { component.byteBuffer.read(i) }
        }
    }
}

/**
 * Describes the option for image packing.
 *
 * @relation interface PackingOption
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImagePacker"
]
public class PackingOption {
    /**
     * Multipurpose Internet Mail Extensions (MIME) format of the target image, for example, image/jpeg.
     *
     * @relation format: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public var format: String

    /**
     * Quality of the target image. The value is an integer ranging from 0 to 100. A larger value indicates better.
     *
     * @relation quality: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public var quality: UInt8

    /**
     * BufferSize of the target image.
     * If this bufferSize is less than or equal to 0, it will be converted to 10MB.
     *
     * @relation bufferSize?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public var bufferSize: UInt64

    /**
     * The desired dynamic range of the target image.
     *
     * @relation desiredDynamicRange?: PackingDynamicRange
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public var desiredDynamicRange: PackingDynamicRange

    /**
     * Whether the image properties can be saved, like Exif.
     *
     * @relation needsPackProperties?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public var needsPackProperties: Bool

    /**
     * PackingOption constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public init(format: String, quality: UInt8, bufferSize!: UInt64 = 25  * 1024  * 1024,
        desiredDynamicRange!: PackingDynamicRange = Sdr, needsPackProperties!: Bool = false) {
        this.format = format
        this.quality = quality
        this.bufferSize = bufferSize
        this.desiredDynamicRange = desiredDynamicRange
        this.needsPackProperties = needsPackProperties
    }
}

/**
 * Describes image properties.
 *
 * @relation interface ImagePropertyOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public class ImagePropertyOptions {
    /**
     * Index of an image.
     *
     * @relation index?: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var index: UInt32

    /**
     * Default property value.
     *
     * @relation defaultValue?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public var defaultValue: String

    /**
     * ImagePropertyOptions constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public init(index!: UInt32 = 0, defaultValue!: String = "") {
        this.index = index
        this.defaultValue = defaultValue
    }
}

@C
struct CImageInfo {
    CImageInfo(
        let height: Int32,
        let width: Int32,
        let density: Int32
    ) {}
}

@C
struct CImageInfoV2 {
    CImageInfoV2(
        let height: Int32,
        let width: Int32,
        let density: Int32,
        let stride: Int32,
        let pixelFormat: Int32,
        let alphaType: Int32,
        let mimeType: CString,
        let isHdr: Bool
    ) {}

    func toImageInfo(): ImageInfo {
        return ImageInfo(Size(height, width), density, stride, PixelMapFormat.parse(pixelFormat),
            AlphaType.parse(alphaType), mimeType.toString(), isHdr)
    }

    func free(): Unit {
        unsafe { LibC.free(mimeType) }
    }
}

@C
struct CSourceOptions {
    CSourceOptions(
        var sourceDensity: Int32,
        var sourcePixelFormat: Int32,
        var height: Int32,
        var width: Int32
    ) {}
}

@C
struct CInitializationOptions {
    CInitializationOptions(
        let alphaType: Int32,
        let editable: Bool,
        let pixelFormat: Int32,
        let scaleMode: Int32,
        let width: Int32,
        let height: Int32
    ) {}
}

@C
struct CInitializationOptionsV2 {
    CInitializationOptionsV2(
        let alphaType: Int32,
        let editable: Bool,
        let srcPixelFormat: Int32,
        let pixelFormat: Int32,
        let scaleMode: Int32,
        let width: Int32,
        let height: Int32
    ) {}
}

@C
struct CDecodingOptions {
    CDecodingOptions(
        let fitDensity: Int32,
        let desiredSize: CSize,
        let desiredRegion: CRegion,
        let rotateDegrees: Float32,
        let sampleSize: UInt32,
        let desiredPixelFormat: Int32,
        let editable: Bool,
        let desiredColorSpace: Int64
    ) {}
}

@C
struct CDecodingOptionsV2 {
    CDecodingOptionsV2(
        let fitDensity: Int32,
        let desiredSize: CSize,
        let desiredRegion: CRegion,
        let rotateDegrees: Float32,
        let sampleSize: UInt32,
        let desiredPixelFormat: Int32,
        let editable: Bool,
        let desiredColorSpace: Int64,
        let desiredDynamicRange: Int32
    ) {}
}

@C
struct CPositionArea {
    CPositionArea(
        let bufferSize: UIntNative,
        let offset: UInt32,
        let stride: UInt32,
        let region: CRegion,
        let dst: CPointer<UInt8>
    ) {}
}

@C
protected struct CSize {
    protected CSize(
        var height: Int32,
        var width: Int32
    ) {}
}

@C
struct CRegion {
    CRegion(
        var size: CSize,
        var x: Int32,
        var y: Int32
    ) {}
}

@C
struct CRetComponent {
    CRetComponent(
        let componentType: Int32,
        let rowStride: Int32,
        let pixelStride: Int32,
        let byteBuffer: CPointer<UInt8>,
        let bufSize: Int64
    ) {}

    func free() {
        unsafe { LibC.free(byteBuffer) }
    }
}

@C
struct UpdateDataInfo {
    UpdateDataInfo(
        let buf: CPointer<UInt8>,
        let bufSize: UIntNative,
        let offset: UInt32,
        let length: UInt32,
        let isFinished: Bool
    ) {}
}

@C
protected struct CPackingOption {
    CPackingOption(
        let format: CString,
        let quality: UInt8,
        let bufferSize: UInt64
    ) {}
}

@C
protected struct CPackingOptionV2 {
    CPackingOptionV2(
        let format: CString,
        let quality: UInt8,
        let bufferSize: UInt64,
        let desiredDynamicRange: Int32,
        let needsPackProperties: Bool
    ) {}

    protected init(option: PackingOption) {
        this.format = unsafe { LibC.mallocCString(option.format) }
        this.quality = option.quality
        this.bufferSize = option.bufferSize
        this.desiredDynamicRange = option.desiredDynamicRange.value
        this.needsPackProperties = option.needsPackProperties
    }

    protected func free(): Unit {
        unsafe { LibC.free(this.format) }
    }
}
