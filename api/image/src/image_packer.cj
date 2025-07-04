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

foreign {
    func FFiOHOSImagePackerConstructor(): Int64

    func FfiOHOSGetPackOptionSize(): UInt64

    func FfiOHOSImagePackerPackingPixelMap(packerId: Int64, sourceId: Int64, option: CPackingOption): RetDataCArrUI8

    func FfiOHOSImagePackerPackingPixelMapV2(packerId: Int64, sourceId: Int64, option: CPackingOptionV2): RetDataCArrUI8

    func FfiOHOSImagePackerPackingImageSource(packerId: Int64, sourceId: Int64, option: CPackingOption): RetDataCArrUI8

    func FfiOHOSImagePackerPackingImageSourceV2(packerId: Int64, sourceId: Int64, option: CPackingOptionV2): RetDataCArrUI8

    func FfiOHOSImagePackerGetSupportedFormats(packerId: Int64): RetDataCArrString

    func FfiOHOSImagePackerPackPixelMapToFile(packerId: Int64, sourceId: Int64, fd: IntNative, option: CPackingOption): UInt32

    func FfiOHOSImagePackerPackPixelMapToFileV2(packerId: Int64, sourceId: Int64, fd: IntNative,
        option: CPackingOptionV2): UInt32

    func FfiOHOSImagePackerImageSourcePackToFile(packerId: Int64, sourceId: Int64, fd: IntNative, option: CPackingOption): UInt32

    func FfiOHOSImagePackerImageSourcePackToFileV2(packerId: Int64, sourceId: Int64, fd: IntNative,
        option: CPackingOptionV2): UInt32

    func FFiOHOSImagePackerRelease(id: Int64): Unit

    func FfiImageImagePackerImplPackToDataPixelMap(packerId: Int64, sourceId: Int64, option: CPackingOptionV2): RetDataCArrUI8

    func FfiImageImagePackerImplPackToDataImageSource(packerId: Int64, sourceId: Int64, option: CPackingOptionV2): RetDataCArrUI8

    func FfiImageImagePackerImplPackingPicture(packerId: Int64, sourceId: Int64, option: CPackingOptionV2): RetDataCArrUI8

    func FfiImageImagePackerImplPackToFilePicture(packerId: Int64, sourceId: Int64, fd: IntNative,
        option: CPackingOptionV2): UInt32
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImagePacker"
]
public class ImagePacker <: RemoteDataLite {
    init() {
        super(unsafe { FFiOHOSImagePackerConstructor() })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public prop supportedFormats: Array<String> {
        get() {
            let cValue = unsafe { FfiOHOSImagePackerGetSupportedFormats(getID()) }
            checkRet(UInt32(cValue.code), "[ImagePacker] supportedFormats:")
            let arr = cValue.getDataAndFree()
            return arr
        }
    }

    /**
     * Compresses or packs an image and uses a promise to return the result.
     *
     * @param { ImageSource } source Image to be processed.
     * @param { PackingOption } option Option for image packing.
     * @returns { Array<UInt8> } Return the compressed or packed data.
     * @relation packing(source: ImageSource, option: PackingOption): Promise<ArrayBuffer>;
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packing(source: ImageSource, option: PackingOption): Array<UInt8> {
        let cOption = CPackingOptionV2(option)
        let cValue = unsafe { FfiOHOSImagePackerPackingImageSourceV2(this.getID(), source.getID(), cOption) }
        cOption.free()
        try {
            return parsePackingRes(cValue)
        } finally {
            unsafe { LibC.free(cValue.data.head) }
        }
    }

    /**
     * Compresses or packs an image and uses a promise to return the result.
     *
     * @param { ImageSource } source Image to be processed.
     * @param { PackingOption } option Option for image packing.
     * @returns { Array<UInt8> } Return the compressed or packed data.
     * @throws { BusinessException } 62980115 - If the parameter is invalid.
     * @throws { BusinessException } 62980096 - The Operation failed.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980106 - The image is too large.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * @throws { BusinessException } 62980119 - If encoder occur error during encoding.
     * @throws { BusinessException } 62980120 - Add pixelmap out of range.
     * @throws { BusinessException } 62980172 - Failed to encode icc.
     * @throws { BusinessException } 62980252 - Failed to create surface.
     * @relation packToData(source: ImageSource, options: PackingOption): Promise<ArrayBuffer>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packToData(source: ImageSource, option: PackingOption): Array<UInt8> {
        let cOption = CPackingOptionV2(option)
        let cValue = unsafe { FfiImageImagePackerImplPackToDataImageSource(this.getID(), source.getID(), cOption) }
        cOption.free()
        try {
            return parsePackingResFor20(cValue)
        } finally {
            unsafe { LibC.free(cValue.data.head) }
        }
    }

    /**
     * Compresses or packs an image and uses a promise to return the result.
     *
     * @param { PixelMap } source PixelMap to be processed.
     * @param { PackingOption } option Option for image packing.
     * @returns { Array<UInt8> } Return the compressed or packed data.
     * @relation packing(source: PixelMap, option: PackingOption): Promise<ArrayBuffer>;
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        deprecated: 20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packing(source: PixelMap, option: PackingOption): Array<UInt8> {
        let cOption = CPackingOptionV2(option)
        let cValue = unsafe { FfiOHOSImagePackerPackingPixelMapV2(this.getID(), source.getID(), cOption) }
        cOption.free()
        try {
            return parsePackingRes(cValue)
        } finally {
            unsafe { LibC.free(cValue.data.head) }
        }
    }

    /**
     * Compresses or packs an image and uses a promise to return the result.
     *
     * @param { PixelMap } source PixelMap to be processed.
     * @param { PackingOption } option Option for image packing.
     * @returns { Array<UInt8> } Return the compressed or packed data.
     * @throws { BusinessException } 62980115 - If the parameter is invalid.
     * @throws { BusinessException } 62980096 - The Operation failed.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980106 - The image is too large.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * @throws { BusinessException } 62980119 - If encoder occur error during encoding.
     * @throws { BusinessException } 62980120 - Add pixelmap out of range.
     * @throws { BusinessException } 62980172 - Failed to encode icc.
     * @throws { BusinessException } 62980252 - Failed to create surface.
     * @relation packToData(source: PixelMap, options: PackingOption): Promise<ArrayBuffer>;
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packToData(source: PixelMap, option: PackingOption): Array<UInt8> {
        let cOption = CPackingOptionV2(option)
        let cValue = unsafe { FfiImageImagePackerImplPackToDataPixelMap(this.getID(), source.getID(), cOption) }
        cOption.free()
        try {
            return parsePackingResFor20(cValue)
        } finally {
            unsafe { LibC.free(cValue.data.head) }
        }
    }

    /**
     * Compresses or packs an image and uses a promise to return the result.
     *
     * @param { Picture } picture Picture to be processed.
     * @param { PackingOption } options Option for image packing.
     * @returns { Array<UInt8> } Return the compressed or packed data.
     * @throws { BusinessException } 62980115 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified.
     * 2.Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 7800301 - Encode failed.
     * @relation packing(picture: Picture, options: PackingOption): Promise<ArrayBuffer>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packing(source: Picture, option: PackingOption): Array<UInt8> {
        let cOption = CPackingOptionV2(option)
        let cValue = unsafe { FfiImageImagePackerImplPackingPicture(getID(), source.getID(), cOption) }
        cOption.free()
        try {
            return parsePackingResFor20(cValue)
        } finally {
            unsafe { LibC.free(cValue.data.head) }
        }
    }

    func parsePackingRes(cValue: RetDataCArrUI8): Array<UInt8> {
        checkRet(UInt32(cValue.code), "[ImagePacker] packing:")
        let cArray = cValue.data
        let array = Array<UInt8>(cArray.size, repeat: 0)
        for (i in 0..cArray.size) {
            array[i] = unsafe { cArray.head.read(i) }
        }
        return array
    }

    func parsePackingResFor20(cValue: RetDataCArrUI8): Array<UInt8> {
        checkRetFor20(UInt32(cValue.code))
        let cArray = cValue.data
        if (cArray.head.isNull()) {
            return []
        }
        let array = Array<UInt8>(cArray.size, repeat: 0)
        for (i in 0..cArray.size) {
            array[i] = unsafe { cArray.head.read(i) }
        }
        return array
    }

    /**
     * Compresses or packs an image into a file and uses a callback to return the result.
     *
     * @param { PixelMap } source PixelMap to be processed.
     * @param { IntNative } fd ID of a file descriptor.
     * @param { PackingOption } options Options for image packing.
     * @throws { BusinessException } 62980096 - The Operation failed.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980106 - The image is too large.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * @throws { BusinessException } 62980115 - If the parameter is invalid.
     * @throws { BusinessException } 62980119 - If encoder occur error during encoding.
     * @throws { BusinessException } 62980120 - Add pixelmap out of range.
     * @throws { BusinessException } 62980172 - Failed to encode icc.
     * @throws { BusinessException } 62980252 - Failed to create surface.
     * @relation packToFile(source: PixelMap, fd: number, options: PackingOption): Promise<void>;
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packToFile(source: PixelMap, fd: IntNative, option: PackingOption): Unit {
        let cOption = CPackingOptionV2(option)
        let ret = unsafe { FfiOHOSImagePackerPackPixelMapToFileV2(this.getID(), source.getID(), fd, cOption) }
        cOption.free()
        checkRet(ret, "[ImagePacker] packToFile:")
    }

    /**
     * Compresses or packs an image into a file and uses a promise to return the result.
     *
     * @param { ImageSource } source Image to be processed.
     * @param { IntNative } fd ID of a file descriptor.
     * @param { PackingOption } options Options for image packing.
     * @throws { BusinessException } 62980096 - The Operation failed.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980106 - The image is too large.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * @throws { BusinessException } 62980115 - If the parameter is invalid.
     * @throws { BusinessException } 62980119 - If encoder occur error during encoding.
     * @throws { BusinessException } 62980120 - Add pixelmap out of range.
     * @throws { BusinessException } 62980172 - Failed to encode icc.
     * @throws { BusinessException } 62980252 - Failed to create surface.
     * @relation packToFile(source: ImageSource, fd: number, options: PackingOption): Promise<void>;
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packToFile(source: ImageSource, fd: IntNative, option: PackingOption): Unit {
        let cOption = CPackingOptionV2(option)
        let ret = unsafe { FfiOHOSImagePackerImageSourcePackToFileV2(this.getID(), source.getID(), fd, cOption) }
        cOption.free()
        checkRet(ret, "[ImagePacker] packToFile:")
    }

    /**
     * Compresses or packs an image into a file and uses a promise to return the result.
     *
     * @param { Picture } picture Picture to be processed.
     * @param { IntNative } fd ID of a file descriptor.
     * @param { PackingOption } options Options for image packing.
     * @throws { BusinessException } 62980115 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified.
     * 2.Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 7800301 - Encode failed.
     * @relation packToFile(picture: Picture, fd: number, options: PackingOption): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func packToFile(source: Picture, fd: IntNative, option: PackingOption): Unit {
        let cOption = CPackingOptionV2(option)
        let ret = unsafe { FfiImageImagePackerImplPackToFilePicture(getID(), source.getID(), fd, cOption) }
        cOption.free()
        checkRetFor20(ret)
    }

    @!APILevel[
        12,
        crossplatform: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func Release(): Unit {
        unsafe { FFiOHOSImagePackerRelease(getID()) }
        releaseFFIData(getID())
    }

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImagePacker"
    ]
    public func release(): Unit {
        unsafe { FFiOHOSImagePackerRelease(getID()) }
        releaseFFIData(getID())
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImagePacker"
]
public func createImagePacker(): ImagePacker {
    return ImagePacker()
}
