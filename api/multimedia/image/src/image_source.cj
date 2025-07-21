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

import ohos.ffi.*
import ohos.resource_manager.RawFileDescriptor
import ohos.labels.*
import ohos.base.*

foreign {
    func FfiOHOSCreateImageSourceByPath(uri: CString, errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByFd(fd: Int32, errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByBuffer(data: CPointer<UInt8>, size: UInt32, errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByPathWithOption(uri: CString, opts: CSourceOptions, errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByFdWithOption(fd: Int32, opts: CSourceOptions, errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByBufferWithOption(data: CPointer<UInt8>, size: UInt32, opts: CSourceOptions,
        errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateImageSourceByRawFile(fd: Int32, offset: Int32, length: Int32, opts: CSourceOptions,
        errCode: CPointer<UInt32>): Int64

    func FfiOHOSCreateIncrementalSource(data: CPointer<UInt8>, size: UInt32, opts: CSourceOptions,
        errCode: CPointer<UInt32>): Int64

    func FfiOHOSGetFrameCount(id: Int64): RetDataUI32

    func FfiOHOSImageSourceGetImageInfo(id: Int64, index: UInt32, errCode: CPointer<UInt32>): CImageInfo

    func FfiOHOSImageSourceGetImageInfoV2(id: Int64, index: UInt32, errCode: CPointer<UInt32>): CImageInfoV2

    func FfiOHOSGetSupportedFormats(id: Int64, errCode: CPointer<UInt32>): CArrString

    func FfiOHOSGetImageProperty(id: Int64, key: CString, index: UInt32, defaultValue: CString,
        errCode: CPointer<UInt32>): CString

    func FfiOHOSModifyImageProperty(id: Int64, key: CString, value: CString): UInt32

    func FfiOHOSUpdateData(id: Int64, info: UpdateDataInfo): UInt32

    func FfiOHOSRelease(id: Int64): UInt32

    func FfiOHOSImageSourceCreatePixelMap(id: Int64, index: UInt32, opt: CDecodingOptions): RetDataI64U32

    func FfiOHOSImageSourceCreatePixelMapV2(id: Int64, index: UInt32, opt: CDecodingOptionsV2): RetDataI64U32

    func FfiOHOSImageSourceCreatePixelMapList(id: Int64, index: UInt32, opt: CDecodingOptions,
        errorCode: CPointer<UInt32>): CArrI64

    func FfiOHOSImageSourceCreatePixelMapListV2(id: Int64, index: UInt32, opt: CDecodingOptionsV2,
        errorCode: CPointer<UInt32>): CArrI64

    func FfiOHOSImageSourceGetDelayTime(id: Int64, errorCode: CPointer<UInt32>): CArrI32

    func FfiImageImageSourceImplGetDisposalTypeList(id: Int64, errorCode: CPointer<UInt32>): CArrI32

    func FfiImageImageSourceImplModifyImageProperties(id: Int64, key: CArrString, value: CArrString): UInt32

    func FfiImageImageSourceImplGetImageProperties(id: Int64, key: CArrString, value: CPointer<CString>): UInt32
}

/**
 * Creates an ImageSource instance based on the URI.
 *
 * @param { String } uri - Image source URI.
 * @relation createImageSource(uri: string): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(uri: String): ImageSource {
    unsafe {
        if (uri.isEmpty()) {
            IMAGE_LOG.error("The uri cannot be empty.")
            throw BusinessException(62980115, "[ImageSource] createImageSource: Invalid image parameter.")
        }
        let curi = LibC.mallocCString(uri)
        var errCode: UInt32 = 0
        let id = FfiOHOSCreateImageSourceByPath(curi, inout errCode)
        LibC.free(curi)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the URI.
 *
 * @param { String } uri - Image source URI.
 * @param { SourceOptions } options - The config of Image source.
 * @relation createImageSource(uri: string, options: SourceOptions): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(uri: String, options: SourceOptions): ImageSource {
    unsafe {
        if (uri.isEmpty()) {
            IMAGE_LOG.error("The uri cannot be empty.")
            throw BusinessException(62980115, "[ImageSource] createImageSource: Invalid image parameter.")
        }
        let curi = LibC.mallocCString(uri)
        var errCode: UInt32 = 0
        let id = FfiOHOSCreateImageSourceByPathWithOption(curi, options.toExternal(), inout errCode)
        LibC.free(curi)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the file descriptor.
 *
 * @param { Int32 } fd - ID of a file descriptor.
 * @relation createImageSource(fd: int): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(fd: Int32): ImageSource {
    unsafe {
        var errCode: UInt32 = 0
        let id = FfiOHOSCreateImageSourceByFd(fd, inout errCode)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the file descriptor.
 *
 * @param { Int32 } fd - ID of a file descriptor.
 * @param { SourceOptions } options - The config of Image source.
 * @relation createImageSource(fd: int, options: SourceOptions): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(fd: Int32, options: SourceOptions): ImageSource {
    unsafe {
        var errCode: UInt32 = 0
        let id = FfiOHOSCreateImageSourceByFdWithOption(fd, options.toExternal(), inout errCode)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the buffer.
 *
 * @param { Array<UInt8> } buf - The buffer of the image.
 * @relation createImageSource(buf: ArrayBuffer): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(buf: Array<UInt8>): ImageSource {
    unsafe {
        if (buf.isEmpty()) {
            IMAGE_LOG.error("The array cannot be empty.")
            throw BusinessException(62980115, "[ImageSource] createImageSource: Invalid image parameter.")
        }
        var errCode: UInt32 = 0
        let arrPtr = acquireArrayRawData(buf)
        let id = FfiOHOSCreateImageSourceByBuffer(arrPtr.pointer, UInt32(buf.size), inout errCode)
        releaseArrayRawData(arrPtr)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the buffer.
 *
 * @param { Array<UInt8> } buf - The buffer of the image.
 * @param { SourceOptions } options - The config of Image source.
 * @relation createImageSource(buf: ArrayBuffer, options: SourceOptions): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(buf: Array<UInt8>, options: SourceOptions): ImageSource {
    unsafe {
        if (buf.isEmpty()) {
            IMAGE_LOG.error("The array cannot be empty.")
            throw BusinessException(62980115, "[ImageSource] createImageSource: Invalid image parameter.")
        }
        var errCode: UInt32 = 0
        let arrPtr = acquireArrayRawData(buf)
        let id = FfiOHOSCreateImageSourceByBufferWithOption(arrPtr.pointer, UInt32(buf.size), options.toExternal(),
            inout errCode)
        releaseArrayRawData(arrPtr)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the raw file descriptor.
 *
 * @param { resourceManager.RawFileDescriptor } rawfile - The raw file descriptor of the image.
 * @param { SourceOptions } options - The config of Image source.
 * @relation function createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(rawfile: RawFileDescriptor, options!: SourceOptions = SourceOptions(0)): ImageSource {
    unsafe {
        var errCode: UInt32 = 0
        let id = FfiOHOSCreateImageSourceByRawFile(Int32(rawfile.fd), Int32(rawfile.offset), Int32(rawfile.length),
            options.toExternal(), inout errCode)
        checkRet(errCode, "[ImageSource] createImageSource:")
        return ImageSource(id)
    }
}

/**
 * Creates an ImageSource instance based on the buffer in incremental.
 *
 * @param { Array<UInt8> } buf - Image buffer array.
 * @param { SourceOptions } options - The config of Image source.
 * @relation function CreateIncrementalSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createIncrementalSource(buf: Array<UInt8>, options!: SourceOptions = SourceOptions(0)): ImageSource {
    if (buf.size > 0xFFFF_FFFF) {
        throw IllegalArgumentException("[ImageSource] CreateIncrementalSource: buf too large")
    }
    unsafe {
        var errCode: UInt32 = 0
        let arrPtr = acquireArrayRawData(buf)
        let id = FfiOHOSCreateIncrementalSource(arrPtr.pointer, UInt32(buf.size), options.toExternal(), inout errCode)
        releaseArrayRawData(arrPtr)
        checkRet(errCode, "[ImageSource] CreateIncrementalSource:")
        return ImageSource(id)
    }
}

/**
 * ImageSource instance.
 *
 * @relation interface ImageSource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public class ImageSource <: RemoteDataLite {
    /**
     * Supported image formats.
     *
     * @relation readonly supportedFormats: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public prop supportedFormats: Array<String> {
        get() {
            unsafe {
                var errCode: UInt32 = 0
                let cArr = FfiOHOSGetSupportedFormats(getID(), inout errCode)
                checkRet(errCode, "[ImageSource] supportedFormats:")
                let cp = cArr.head
                let size = cArr.size
                let arr = Array<String>(size, repeat: "")
                for (i in 0..size) {
                    arr[i] = cp.read(i).toString()
                }
                cArr.free()
                return arr
            }
        }
    }

    protected init(id: Int64) {
        super(id)
        IMAGE_LOG.info("[ImageSource] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Obtains the count of frame in an image.
     *
     * @returns { UInt32> } An instance used to return the number.
     * @throws { BusinessException } 62980096 - The operation failed. Possible cause: 1.Image upload exception.
     * 2. Decoding process exception. 3. Insufficient memory.
     * @throws { BusinessException } 62980111 - The image source data is incomplete.
     * @throws { BusinessException } 62980112 - The image format does not match.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * The image data provided is not in a recognized or supported format, or it may be occorrupted.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980116 - Failed to decode the image.
     * @throws { BusinessException } 62980118 - Failed to create the image plugin.
     * @throws { BusinessException } 62980122 - Failed to decode the image header.
     * @throws { BusinessException } 62980137 - Invalid media operation.
     * @relation getFrameCount(): Promise<int>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getFrameCount(): UInt32 {
        let cvalue = unsafe { FfiOHOSGetFrameCount(getID()) }
        checkRet(cvalue.code, "[ImageSource] getFrameCount:")
        return cvalue.data
    }

    /**
     * Get image information from image source synchronously.
     *
     * @param { UInt32 } index Sequence number of an image. If this parameter is not specified,
     *  the default value 0 is used.
     * @returns { ImageInfo } An instance used to return the image information.
     * @relation getImageInfoSync(index?: int): ImageInfo
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getImageInfo(index!: UInt32 = 0): ImageInfo {
        unsafe {
            var errCode: UInt32 = 0
            let cimage = FfiOHOSImageSourceGetImageInfoV2(getID(), index, inout errCode)
            checkRet(errCode, "[ImageSource] getImageInfo:")
            try {
                return cimage.toImageInfo()
            } finally {
                cimage.free()
            }
        }
    }

    /**
     * Obtains the value of a property in an image with the specified index. This method return the property value in a string.
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types;3.Parameter verification failed;
     * @throws { BusinessException } 62980096 - The operation failed. Possible cause: 1.Image upload exception.
     * 2. Decoding process exception. 3. Insufficient memory.
     * @throws { BusinessException } 62980103 - The image data is not supported.
     * @throws { BusinessException } 62980110 - The image source data is incorrect.
     * @throws { BusinessException } 62980111 - The image source data is incomplete.
     * @throws { BusinessException } 62980112 - The image format does not match.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * The image data provided is not in a recognized or supported format, or it may be occorrupted.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980118 - Failed to create the image plugin.
     * @throws { BusinessException } 62980122 - Failed to decode the image header.
     * @throws { BusinessException } 62980123 - The image does not support EXIF decoding.
     * @throws { BusinessException } 62980135 - The EXIF value is invalid.
     * @relation getImageProperty(key: PropertyKey, options?: ImagePropertyOptions): Promise<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getImageProperty(key: PropertyKey, options!: ImagePropertyOptions = ImagePropertyOptions()): String {
        unsafe {
            var res = ""
            try (
                ckey = LibC.mallocCString(key.toString()).asResource(),
                cvalue = LibC.mallocCString(options.defaultValue).asResource()
            ) {
                var errCode: UInt32 = 0
                let result = FfiOHOSGetImageProperty(getID(), ckey.value, options.index, cvalue.value, inout errCode)
                checkRet(errCode, "[ImageSource] getImageProperty:", handle: {=> LibC.free(result)})
                res = result.toString()
                LibC.free(result)
            }
            return res
        }
    }

    /**
     * Modify the value of a property in an image with the specified key. 
     *
     * @throws { BusinessException } 401 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types;
     * @throws { BusinessException } 62980123 - The image does not support EXIF decoding.
     * @throws { BusinessException } 62980133 - The EXIF data is out of range.
     * @throws { BusinessException } 62980135 - The EXIF value is invalid.
     * @throws { BusinessException } 62980146 - The EXIF data failed to be written to the file.
     * @relation modifyImageProperty(key: PropertyKey, value: string): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func modifyImageProperty(key: PropertyKey, value: String): Unit {
        unsafe {
            try (
                ckey = LibC.mallocCString(key.toString()).asResource(),
                cvalue = LibC.mallocCString(value).asResource()
            ) {
                let ret = FfiOHOSModifyImageProperty(getID(), ckey.value, cvalue.value)
                checkRet(ret, "[ImageSource] modifyImageProperty:")
            }
        }
    }

    /**
     * Update the data in the incremental ImageSource.
     *
     * @param { Array<UInt8> } buf The data to be updated.
     * @param { Bool } isFinished If is it finished.
     * @param { UInt32 } value The offset of data.
     * @param { UInt32 } length The length fo buf.
     * @relation updateData(buf: ArrayBuffer, isFinished: boolean, value: int, length: int): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func updateData(buf: Array<UInt8>, isFinished: Bool, offset: UInt32, length: UInt32): Unit {
        unsafe {
            let arrPtr = acquireArrayRawData(buf)
            let ret = FfiOHOSUpdateData(getID(),
                UpdateDataInfo(arrPtr.pointer, UIntNative(buf.size), offset, length, isFinished))
            releaseArrayRawData(arrPtr)
            checkRet(ret, "[ImageSource] updateData:")
        }
    }

    /**
     * Create a PixelMap object based on image decoding parameters synchronously.
     *
     * @param { DecodingOptions } options Image decoding parameters.
     * @returns { PixelMap } An instance used to return the PixelMap object.
     * @relation createPixelMapSync(options?: DecodingOptions): PixelMap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func createPixelMap(options!: DecodingOptions = DecodingOptions()): PixelMap {
        unsafe {
            let cValue: RetDataI64U32 = FfiOHOSImageSourceCreatePixelMapV2(getID(), options.index, options.getValue())
            checkRet(cValue.code, "[ImageSource] createPixelMap:")
            return PixelMap(cValue.data)
        }
    }

    /**
     * Creates a PixelMap array based on image decoding parameters.
     *
     * @param { DecodingOptions } options Image decoding parameters.
     * @returns { Array<PixelMap> } An instance used to return the PixelMap array.
     * @throws { BusinessException } 62980096 - The operation failed. Possible cause: 1.Image upload exception.
     * 2. Decoding process exception. 3. Insufficient memory.
     * @throws { BusinessException } 62980099 - The shared memory data is abnormal.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980103 - The image data is not supported.
     * @throws { BusinessException } 62980106 - The image data is too large. This status code is thrown when an error occurs during the process of checking size.
     * @throws { BusinessException } 62980109 - Failed to crop the image.
     * @throws { BusinessException } 62980111 - The image source data is incomplete.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980116 - Failed to decode the image.
     * @throws { BusinessException } 62980118 - Failed to create the image plugin.
     * @throws { BusinessException } 62980137 - Invalid media operation.
     * @throws { BusinessException } 62980173 - The DMA memory does not exist.
     * @throws { BusinessException } 62980174 - The DMA memory data is abnormal.
     * @relation createPixelMapList(options?: DecodingOptions): Promise<Array<PixelMap>>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func createPixelMapList(options!: DecodingOptions = DecodingOptions()): Array<PixelMap> {
        unsafe {
            var errCode: UInt32 = 0
            let cArr = FfiOHOSImageSourceCreatePixelMapListV2(getID(), options.index, options.getValue(), inout errCode)
            checkRet(errCode, "[ImageSource] createPixelMapList:")
            let data = cArr.head
            let size = cArr.size
            let pmArr = Array<PixelMap>(size, {i => PixelMap(data.read(i))})
            LibC.free(data)
            return pmArr
        }
    }

    /**
     * Obtains the array of delay time in an image. 
     *
     * @returns { Array<UInt32> } An instance used to return the array.
     * @throws { BusinessException } 62980096 - The operation failed. Possible cause: 1.Image upload exception.
     * 2. Decoding process exception. 3. Insufficient memory.
     * @throws { BusinessException } 62980110 - The image source data is incorrect.
     * @throws { BusinessException } 62980111 - The image source data is incomplete.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980116 - Failed to decode the image.
     * @throws { BusinessException } 62980118 - Failed to create the image plugin.
     * @throws { BusinessException } 62980122 - Failed to decode the image header.
     * @throws { BusinessException } 62980149 - Invalid MIME type for the image source.
     * @relation getDelayTimeList(): Promise<Array<int>>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getDelayTimeList(): Array<Int32> {
        unsafe {
            var errCode: UInt32 = 0
            let cArr = FfiOHOSImageSourceGetDelayTime(getID(), inout errCode)
            checkRet(errCode, "[ImageSource] getDelayTimeList:")
            let data = cArr.head
            let arr = Array<Int32>(cArr.size, {i => data.read(i)})
            LibC.free(data)
            return arr
        }
    }

    /**
     * Releases an ImageSource instance.
     *
     * @relation release(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func release(): Unit {
        unsafe {
            let ret = FfiOHOSRelease(getID())
            checkRet(ret, "[ImageSource] Release:")
            releaseFFIData(getID())
        }
    }
}
