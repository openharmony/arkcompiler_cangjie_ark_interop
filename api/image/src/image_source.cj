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

import ohos.ffi.*
import ohos.resource_manager.RawFileDescriptor
import ohos.labels.*
import ohos.color_manager.*
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
 * @brief createImageSource(uri: string): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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
 * @brief createImageSource(uri: string, options: SourceOptions): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
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
 * @brief createImageSource(fd: number): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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
 * @brief createImageSource(fd: number, options: SourceOptions): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
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
 * @brief createImageSource(buf: ArrayBuffer): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
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
 * @brief createImageSource(buf: ArrayBuffer, options: SourceOptions): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
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
 * @brief function createImageSource(rawfile: resourceManager.RawFileDescriptor, options?: SourceOptions): ImageSource
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func createImageSource(rawfile: RawFileDescriptor, options!: SourceOptions = SourceOptions()): ImageSource {
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
 * @brief function CreateIncrementalSource(buf: ArrayBuffer, options?: SourceOptions): ImageSource
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public func CreateIncrementalSource(buf: Array<UInt8>, options!: SourceOptions = SourceOptions()): ImageSource {
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
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageSource"
]
public class ImageSource <: RemoteDataLite {

    /**
     * Supported image formats.
     *
     * @brief readonly supportedFormats: Array<string>
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * Obtains the count of frame in an image. This method uses a promise to return the number.
     *
     * @returns { UInt32> } An instance used to return the number.
     * @throws { BusinessException } 62980096 - If the operation failed.
     * @throws { BusinessException } 62980110 - If the image source data error.
     * @throws { BusinessException } 62980111 - If the image source data incomplete.
     * @throws { BusinessException } 62980113 - If the image format unknown.
     * @throws { BusinessException } 62980116 - If the image decode failed.
     * @throws { BusinessException } 62980118 - If the image plugin create failed.
     * @throws { BusinessException } 62980122 - If the image decode head abnormal.
     * @brief getFrameCount(): Promise<number>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getFrameCount(): UInt32 {
        let cvalue = unsafe { FfiOHOSGetFrameCount(getID()) }
        checkRet(cvalue.code, "[ImageSource] getFrameCount:")
        return cvalue.data
    }

    /**
     * Get image information from image source.
     *
     * @param { Int32 } index Sequence number of an image. If this parameter is not specified,
     *  the default value 0 is used.
     * @returns { ImageInfo } An instance used to return the image information.
     * @brief getImageInfo(index?: number): Promise<ImageInfo>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
     * Obtains the value of a property in an image with the specified index. This method return the property value in a
     * string.
     *
     * @param { string } key Name of the property whose value is to be obtained.
     * @param { GetImagePropertyOptions } options Index of the image.
     * @returns { String } return the property value. If the operation fails, the default value is returned.
     * @brief getImageProperty(key: string, options?: GetImagePropertyOptions): Promise<string>
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * Modify the value of a property in an image with the specified key. This method uses a
     * promise to return the property value in a string.
     *
     * @param { String } key Name of the property whose value is to be modified.
     * @param { String } value The value to be set to property.
     * @brief modifyImageProperty(key: string, value: string): Promise<void>
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * @brief updateData(buf: ArrayBuffer, isFinished: boolean, value: number, length: number): Promise<void>
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * Creates a PixelMap object based on image decoding parameters. This method uses a promise to
     * return the object.
     *
     * @param { DecodingOptions } options Image decoding parameters.
     * @returns { PixelMap } An instance used to return the PixelMap object.
     * @brief createPixelMap(options?: DecodingOptions): Promise<PixelMap>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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
     * Creates a PixelMap array based on image decoding parameters. This method uses a promise to
     * return the array.
     *
     * @param { DecodingOptions } options Image decoding parameters.
     * @returns { Array<PixelMap> } An instance used to return the PixelMap array.
     * @throws { BusinessException } 62980096 - If the operation failed.
     * @throws { BusinessException } 62980103 - If the image data unsupport.
     * @throws { BusinessException } 62980110 - If the image source data error.
     * @throws { BusinessException } 62980111 - If the image source data incomplete.
     * @throws { BusinessException } 62980118 - If the image plugin create failed.
     * @brief createPixelMapList(options?: DecodingOptions): Promise<Array<PixelMap>>
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * Obtains the array of delay time in an image. This method uses a promise to return the array.
     *
     * @returns { Array<UInt32> } An instance used to return the array.
     * @throws { BusinessException } 62980096 - If the operation failed.
     * @throws { BusinessException } 62980110 - If the image source data error.
     * @throws { BusinessException } 62980111 - If the image source data incomplete.
     * @throws { BusinessException } 62980113 - If the image format unknown.
     * @throws { BusinessException } 62980116 - If the image decode failed.
     * @throws { BusinessException } 62980118 - If the image plugin create failed.
     * @throws { BusinessException } 62980122 - If the image decode head abnormal.
     * @brief getDelayTimeList(): Promise<Array<number>>;
     */
    @!APILevel[
        12,
        crossplatform: true,
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
     * Obtains the array of disposal type in a gif image. This method uses a promise to return the array.
     *
     * @returns { Array<Int32> } A Promise instance used to return the array.
     * @throws { BusinessException } 62980096 - The operation failed.
     * @throws { BusinessException } 62980101 - The image data is abnormal.
     * @throws { BusinessException } 62980137 - Invalid media operation.
     * @throws { BusinessException } 62980149 - Invalid MIME type for the image source.
     * @syscap SystemCapability.Multimedia.Image.ImageSource
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getDisposalTypeList(): Array<Int32> {
        unsafe {
            var errCode: UInt32 = 0
            let cArr = FfiImageImageSourceImplGetDisposalTypeList(getID(), inout errCode)
            checkRet(errCode, "[ImageSource] getDelayTimeList:")
            let data = cArr.head
            let arr = Array<Int32>(cArr.size, {i => data.read(i)})
            LibC.free(data)
            return arr
        }
    }

    /**
     * Obtains the value of properties in an image. This method uses a promise to return the property values in array
     * of records.
     *
     * @param { key: Array<PropertyKey> } key - Name of the properties whose value is to be obtained.
     * @returns { Array<(PropertyKey, String)> } Array of Records instance used to return the
     * property values. If the operation fails, the null is returned.
     * @throws { BusinessException } 401 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed;
     * @throws { BusinessException } 62980096 - The operation failed.
     * @throws { BusinessException } 62980110 - The image source data is incorrect.
     * @throws { BusinessException } 62980113 - Unknown image format.
     * @throws { BusinessException } 62980116 - Failed to decode the image.
     * @syscap SystemCapability.Multimedia.Image.ImageSource
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func getImageProperties(key: Array<PropertyKey>): Array<(PropertyKey, String)> {
        if (key.size == 0) {
            return Array<(PropertyKey, String)>()
        }
        let keyPointer = safeMalloc<CString>(count: key.size)
        var i = 0i64
        try {
            for (it in key) {
                unsafe { keyPointer.write(i, LibC.mallocCString(it.toString())) }
                i++
            }
        } catch (e: Exception) {
            for (j in 0..i) {
                unsafe { LibC.free(keyPointer.read(j)) }
            }
            unsafe { LibC.free(keyPointer) }
            throw e
        }

        let cKey = CArrString(keyPointer, key.size)
        let valuePointer = try {
            safeMalloc<CString>(count: key.size)
        } catch (e: Exception) {
            cKey.free()
            throw e
        }
        let errCode = unsafe { FfiImageImageSourceImplGetImageProperties(getID(), cKey, valuePointer) }
        cKey.free()
        checkRet(errCode, "[ImageSource] getImageProperties:", handle: unsafe { {=> LibC.free(valuePointer)} })
        let cValue = CArrString(valuePointer, key.size)
        let value = cValue.toStringArray()
        cValue.free()
        return Array<(PropertyKey, String)>(key.size, {i => (key[i], value[i])})
    }

    /**
     * Modify the value of properties in an image with the specified keys.
     *
     * @param { Array<(PropertyKey, String)> } records - Array of the property Records whose values are to
     * be modified.
     * @returns { Promise<void> } A Promise instance used to return the operation result. If the operation fails, an
     * error message is returned.
     * @throws { BusinessException } 401 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3.Parameter verification failed;
     * @throws { BusinessException } 62980123 - The image does not support EXIF decoding.
     * @throws { BusinessException } 62980133 - The EXIF data is out of range.
     * @throws { BusinessException } 62980135 - The EXIF value is invalid.
     * @throws { BusinessException } 62980146 - The EXIF data failed to be written to the file.
     * @syscap SystemCapability.Multimedia.Image.ImageSource
     * @crossplatform
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func modifyImageProperties(records: Array<(PropertyKey, String)>): Unit {
        if (records.size == 0) {
            return
        }
        let keyPointer = safeMalloc<CString>(count: records.size)
        let valuePointer = try {
            safeMalloc<CString>(count: records.size)
        } catch (e: Exception) {
            unsafe { LibC.free(keyPointer) }
            throw e
        }
        var i = 0i64
        try {
            for (it in records) {
                unsafe {
                    keyPointer.write(i, LibC.mallocCString(it[0].toString()))
                    valuePointer.write(i, LibC.mallocCString(it[1]))
                }
                i++
            }
        } catch (e: Exception) {
            for (j in 0..i + 1) {
                unsafe {
                    LibC.free(keyPointer.read(j))
                    LibC.free(valuePointer.read(j))
                }
            }
            unsafe {
                LibC.free(keyPointer)
                LibC.free(valuePointer)
            }
            throw e
        }

        let cKey = CArrString(keyPointer, records.size)
        let cValue = CArrString(valuePointer, records.size)
        let errCode = unsafe { FfiImageImageSourceImplModifyImageProperties(getID(), cKey, cValue) }
        cKey.free()
        cValue.free()
        checkRet(errCode, "[ImageSource] modifyImageProperties:")
    }

    /**
     * Releases an ImageSource instance and uses a promise to return the result.
     *
     * @brief release(): Promise<void>
     */
    @!APILevel[
        12,
        crossplatform: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageSource"
    ]
    public func Release(): Unit {
        unsafe {
            let ret = FfiOHOSRelease(getID())
            checkRet(ret, "[ImageSource] Release:")
            releaseFFIData(getID())
        }
    }

    @!APILevel[
        12,
        crossplatform: true,
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
