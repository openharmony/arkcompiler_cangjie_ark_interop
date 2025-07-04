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

package ohos.image

import ohos.labels.*
import ohos.color_manager.*
import ohos.ffi.*
import ohos.base.*

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
        return ImageInfo(Size(height: height, width: width), density, stride, PixelMapFormat.parse(pixelFormat),
            AlphaType.parse(alphaType), mimeType.toString(), isHdr)
    }

    func free(): Unit {
        unsafe { LibC.free(mimeType) }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class ImageInfo {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var size: Size
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var density: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var stride: Int32
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var pixelFormat: PixelMapFormat
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var alphaType: AlphaType
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var mimeType: String
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var isHdr: Bool

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(size: Size, density: Int32) {
        this.size = size
        this.density = density
        this.stride = 0
        this.pixelFormat = UNKNOWN
        this.alphaType = UNKNOWN
        this.mimeType = "UNKNOWN"
        this.isHdr = false
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(size: Size, density: Int32, stride: Int32, pixelFormat: PixelMapFormat, alphaType: AlphaType,
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

@C
struct CSourceOptions {
    CSourceOptions(
        var sourceDensity: Int32,
        var sourcePixelFormat: Int32,
        var height: Int32,
        var width: Int32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct SourceOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public SourceOptions(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var sourceDensity!: Int32 = 0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var sourcePixelFormat!: PixelMapFormat = PixelMapFormat.UNKNOWN,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var sourceSize!: Size = Size(height: 0, width: 0)
    ) {}

    func toExternal(): CSourceOptions {
        return CSourceOptions(sourceDensity, sourcePixelFormat.getValue(), sourceSize.height, sourceSize.width)
    }
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class InitializationOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var alphaType: AlphaType
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var editable: Bool
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var srcPixelFormat: PixelMapFormat
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var pixelFormat: PixelMapFormat
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var scaleMode: ScaleMode
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var size: Size

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(alphaType!: AlphaType = AlphaType.PREMUL, editable!: Bool = false,
        pixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888, scaleMode!: ScaleMode = ScaleMode.FIT_TARGET_SIZE,
        size!: Size) {
        this.alphaType = alphaType
        this.editable = editable
        this.srcPixelFormat = PixelMapFormat.BGRA_8888
        this.pixelFormat = pixelFormat
        this.scaleMode = scaleMode
        this.size = size
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(srcPixelFormat: PixelMapFormat, alphaType!: AlphaType = AlphaType.PREMUL, editable!: Bool = false,
        pixelFormat!: PixelMapFormat = PixelMapFormat.BGRA_8888, scaleMode!: ScaleMode = ScaleMode.FIT_TARGET_SIZE,
        size!: Size) {
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class DecodingOptions {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let sampleSize: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let rotate: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let editable: Bool
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let desiredSize: Size
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let desiredRegion: Region
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let desiredPixelFormat: PixelMapFormat
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let index: UInt32
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let fitDensity: Int32
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let desiredColorSpace: ?ColorSpaceManager
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public let desiredDynamicRange: DecodingDynamicRange

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(sampleSize!: UInt32 = 1, rotate!: UInt32 = 0, editable!: Bool = false,
        desiredSize!: Size = Size(height: 0, width: 0), desiredRegion!: Region = Region(Size(height: 0, width: 0), 0, 0),
        desiredPixelFormat!: PixelMapFormat = UNKNOWN, index!: UInt32 = 0, fitDensity!: Int32 = 0,
        desiredColorSpace!: ?ColorSpaceManager = None) {
        this.sampleSize = sampleSize
        this.rotate = rotate
        this.editable = editable
        this.desiredSize = desiredSize
        this.desiredRegion = desiredRegion
        this.desiredPixelFormat = desiredPixelFormat
        this.index = index
        this.fitDensity = fitDensity
        this.desiredColorSpace = desiredColorSpace
        this.desiredDynamicRange = SDR
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(desiredDynamicRange: DecodingDynamicRange, sampleSize!: UInt32 = 1, rotate!: UInt32 = 0,
        editable!: Bool = false, desiredSize!: Size = Size(height: 0, width: 0),
        desiredRegion!: Region = Region(Size(height: 0, width: 0), 0, 0), desiredPixelFormat!: PixelMapFormat = UNKNOWN,
        index!: UInt32 = 0, fitDensity!: Int32 = 0, desiredColorSpace!: ?ColorSpaceManager = None) {
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct PositionArea {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public PositionArea(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let pixels: Array<UInt8>,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let offset: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let stride: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let region: Region
    ) {}
}

@C
protected struct CSize {
    protected CSize(
        var height: Int32,
        var width: Int32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct Size {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public Size(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var height!: Int32 = 0,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var width!: Int32 = 0
    ) {}

    protected func toExternal(): CSize {
        return CSize(height, width)
    }

    init(cSize: CSize) {
        this.height = cSize.height
        this.width = cSize.width
    }
}

@C
struct CRegion {
    CRegion(
        var size: CSize,
        var x: Int32,
        var y: Int32
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct Region {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public Region(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var size: Size,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var x: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var y: Int32
    ) {}

    func toExternal(): CRegion {
        return CRegion(size.toExternal(), x, y)
    }

    init(cRegion: CRegion) {
        this.size = Size(cRegion.size)
        this.x = cRegion.x
        this.y = cRegion.y
    }
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct Component {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public Component(
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let componentType: ComponentType,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let rowStride: Int32,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let pixelStride: Int32,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let byteBuffer: Array<UInt8>
    ) {}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class PackingOption {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var format: String
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var quality: UInt8
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var bufferSize: UInt64
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var desiredDynamicRange: PackingDynamicRange
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public var needsPackProperties: Bool

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(format: String, quality: UInt8, bufferSize!: UInt64 = 25 * 1024 * 1024) {
        this.format = format
        this.quality = quality
        this.bufferSize = bufferSize
        this.desiredDynamicRange = SDR
        this.needsPackProperties = false
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public init(format: String, quality: UInt8, desiredDynamicRange: PackingDynamicRange, needsPackProperties: Bool,
        bufferSize!: UInt64 = 25 * 1024 * 1024) {
        this.format = format
        this.quality = quality
        this.bufferSize = bufferSize
        this.desiredDynamicRange = desiredDynamicRange
        this.needsPackProperties = needsPackProperties
    }
}

struct RetCode {
    static let SUCCESS: Int64
    static let FAILED: Int64
    static init() {
        SUCCESS = 0
        FAILED = -1
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public struct ImagePropertyOptions {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public ImagePropertyOptions(
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let index!: UInt32 = 0,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public let defaultValue!: String = ""
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class GainmapChannel {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public GainmapChannel(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var gainmapMax: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var gainmapMin: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var gamma: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var baseOffset: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var alternateOffset: Float32
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class HdrGainmapMetadata {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public HdrGainmapMetadata(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var writerVersion: UInt16,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var miniVersion: UInt16,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var gainmapChannelCount: UInt8,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var useBaseColorFlag: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var baseHeadroom: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var alternateHeadroom: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var channels: Array<GainmapChannel>
    ) {}
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class HdrStaticMetadata {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public HdrStaticMetadata(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var displayPrimariesX: Array<Float32>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var displayPrimariesY: Array<Float32>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var whitePointX: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var whitePointY: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var maxLuminance: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var minLuminance: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var maxContentLightLevel: Float32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Multimedia.Image.Core"
        ]
        public var maxFrameAverageLightLevel: Float32
    ) {}
}

@C
struct CjProperties {
    CjProperties(
        let key: CPointer<CString>,
        let value: CPointer<CString>,
        let size: Int64
    ) {}

    func toArray(): Array<(String, String)> {
        if (key.isNotNull() && value.isNotNull()) {
            return Array<(String, String)>(size, {
                i => unsafe { (key.read(i).toString(), value.read(i).toString()) }
            })
        }
        return Array<(String, String)>()
    }
}
