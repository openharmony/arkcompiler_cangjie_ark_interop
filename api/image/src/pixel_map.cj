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

import ohos.color_manager.*
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*
import ohos.rpc.MessageSequence

const BASE_MEDIA_ERR: Int32 = 62980096
const ARG_SIZE_ONE: UIntNative = 1
const ARG_SIZE_TWO: UIntNative = 2

foreign {
    func FfiOHOSCreatePixelMap(colors: CPointer<UInt8>, colorLength: UInt32, opts: CInitializationOptions): Int64

    func FfiOHOSCreatePixelMapV2(colors: CPointer<UInt8>, colorLength: UInt32, opts: CInitializationOptionsV2): Int64

    func FfiImagePixelMapImplCreatePixelMap(opts: CInitializationOptionsV2): Int64

    func FfiImagePixelMapImplCreatePremultipliedPixelMap(srcId: Int64, dstId: Int64): UInt32

    func FfiImagePixelMapImplCreateUnpremultipliedPixelMap(srcId: Int64, dstId: Int64): UInt32

    func FfiOHOSReadPixelsToBuffer(id: Int64, bufferSize: UInt64, dst: CPointer<UInt8>): UInt32

    func FfiOHOSWriteBufferToPixels(id: Int64, source: CPointer<UInt8>, bufferSize: UInt64): UInt32

    func FfiOHOSGetDensity(id: Int64, errCode: CPointer<UInt32>): Int32

    func FfiOHOSOpacity(id: Int64, rate: Float32): UInt32

    func FfiOHOSCrop(id: Int64, region: CRegion): UInt32

    func FfiOHOSGetPixelBytesNumber(id: Int64, errCode: CPointer<UInt32>): UInt32

    func FfiOHOSGetBytesNumberPerRow(id: Int64, errCode: CPointer<UInt32>): UInt32

    func FfiOHOSGetImageInfo(id: Int64, errCode: CPointer<UInt32>): CImageInfo

    func FfiOHOSGetImageInfoV2(id: Int64, errCode: CPointer<UInt32>): CImageInfoV2

    func FfiOHOSScale(id: Int64, x: Float32, y: Float32): UInt32

    func FfiImagePixelMapImplScale(id: Int64, x: Float32, y: Float32, antiAliasing: Int32): UInt32

    func FfiOHOSFlip(id: Int64, horizontal: Bool, vertical: Bool): UInt32

    func FfiOHOSRotate(id: Int64, angle: Float32): UInt32

    func FfiOHOSTranslate(id: Int64, x: Float32, y: Float32): UInt32

    func FfiOHOSGetIsEditable(id: Int64, errCode: CPointer<UInt32>): Bool

    func FfiOHOSGetIsStrideAlignment(id: Int64, errCode: CPointer<UInt32>): Bool

    func FfiOHOSReadPixels(id: Int64, area: CPositionArea): UInt32

    func FfiOHOSWritePixels(id: Int64, area: CPositionArea): UInt32

    func FfiOHOSCreateAlphaPixelMap(id: Int64, errCode: CPointer<UInt32>): Int64

    func FfiOHOSPixelMapRelease(id: Int64): UInt32

    func FfiOHOSPixelMapSetColorSpace(id: Int64, colorSpaceId: Int64): UInt32

    func FfiOHOSPixelMapGetColorSpace(id: Int64, errCode: CPointer<UInt32>): Int64

    func FfiOHOSPixelMapApplyColorSpace(id: Int64, colorSpaceId: Int64): UInt32

    func FfiImagePixelMapImplToSdr(id: Int64): UInt32

    func FfiImagePixelMapImplMarshalling(id: Int64, rpcId: Int64): UInt32

    func FfiImagePixelMapImplUnmarshalling(id: Int64, rpcId: Int64, errCode: CPointer<UInt32>): Int64

    func FfiImagePixelMapImplConvertPixelMapFormat(id: Int64, targetFormat: Int32): UInt32

    func FfiImagePixelMapImplCreatePixelMapFromSurface(surfaceId: CString, rect: CRegion, argc: UIntNative,
        errCode: CPointer<UInt32>): Int64

    func FfiImagePixelMapImplCreatePixelMapFromParcel(rpcId: Int64, errCode: CPointer<UInt32>): Int64
}

/**
 * Create pixelmap by data buffer.
 *
 * @param {Array<UInt8> } colors The image color buffer.
 * @param { InitializationOptions } options Initialization options for pixelmap.
 * @returns { PixelMap } A Promise instance used to return the PixelMap object.
 * @brief createPixelMap(colors: ArrayBuffer, options: InitializationOptions): Promise<PixelMap>
 */
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPixelMap(colors: Array<UInt8>, opts: InitializationOptions): PixelMap {
    if (colors.size == 0) {
        throw BusinessException(BASE_MEDIA_ERR, "[PixelMap] createPixelMap: create failed!")
    }
    unsafe {
        let arrPtr = acquireArrayRawData(colors)
        let id = FfiOHOSCreatePixelMapV2(arrPtr.pointer, UInt32(colors.size), opts.toExternal())
        releaseArrayRawData(arrPtr)
        if (id == -1) {
            throw BusinessException(BASE_MEDIA_ERR, "[PixelMap] createPixelMap: create failed!")
        }
        return PixelMap(id)
    }
}

/**
 * Create an empty pixelmap.
 *
 * @param { InitializationOptions } options Initialization options for pixelmap.
 * @returns { PixelMap } Returns the instance if the operation is successful;Otherwise, return undefined.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
 * 2.Incorrect parameter types. 3.Parameter verification failed.
 * @syscap SystemCapability.Multimedia.Image.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPixelMap(opts: InitializationOptions): PixelMap {
    unsafe {
        let id = FfiImagePixelMapImplCreatePixelMap(opts.toExternal())
        if (id == -1) {
            throw BusinessException(BASE_MEDIA_ERR, "[PixelMap] createPixelMap: create failed!")
        }
        return PixelMap(id)
    }
}

/**
 * Transforms pixelmap from premultiplied alpha format to unpremultiplied alpha format.
 *
 * @param { PixelMap } src The source pixelMap.
 * @param { PixelMap } dst The destination pixelmap.
 * If the operation fails, an error message is returned.
 * @throws { BusinessException } 62980103 - The image data is not supported.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
 * 2.Incorrect parameter types. 3.Parameter verification failed.
 * @throws { BusinessException } 62980246 - Failed to read the pixelMap.
 * @throws { BusinessException } 62980248 - Pixelmap not allow modify.
 * @syscap SystemCapability.Multimedia.Image.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPremultipliedPixelMap(src: PixelMap, dst: PixelMap): Unit {
    let errCode = unsafe { FfiImagePixelMapImplCreatePremultipliedPixelMap(src.getID(), dst.getID()) }
    checkRet(errCode, "[PixelMap] createPremultipliedPixelMap:")
}

/**
 * Transforms pixelmap from premultiplied alpha format to unpremultiplied alpha format.
 *
 * @param { PixelMap } src The source pixelmap.
 * @param { PixelMap } dst The destination pixelmap.
 * If the operation fails, an error message is returned.
 * @throws { BusinessException } 62980103 - The image data is not supported.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
 * 2.Incorrect parameter types. 3.Parameter verification failed.
 * @throws { BusinessException } 62980246 - Failed to read the pixelMap.
 * @throws { BusinessException } 62980248 - Pixelmap not allow modify.
 * @syscap SystemCapability.Multimedia.Image.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createUnpremultipliedPixelMap(src: PixelMap, dst: PixelMap): Unit {
    let errCode = unsafe { FfiImagePixelMapImplCreateUnpremultipliedPixelMap(src.getID(), dst.getID()) }
    checkRet(errCode, "[PixelMap] createUnpremultipliedPixelMap:")
}

/**
 * Creates a PixelMap object based on MessageSequence parameter.
 *
 * @param { MessageSequence } sequence - MessageSequence parameter.
 * @returns { PixelMap } Returns the instance if the operation is successful;Otherwise, an exception will be thrown.
 * @throws { BusinessException } 62980096 - Operation failed.
 * @throws { BusinessException } 62980097 - IPC error.
 * @throws { BusinessException } 62980115 - Invalid input parameter.
 * @throws { BusinessException } 62980105 - Failed to get the data.
 * @throws { BusinessException } 62980177 - Abnormal API environment.
 * @throws { BusinessException } 62980178 - Failed to create the PixelMap.
 * @throws { BusinessException } 62980179 - Abnormal buffer size.
 * @throws { BusinessException } 62980180 - FD mapping failed.
 * @throws { BusinessException } 62980246 - Failed to read the PixelMap.
 * @syscap SystemCapability.Multimedia.Image.Core
 * @relation createPixelMapFromParcel(sequence: rpc.MessageSequence): PixelMap;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPixelMapFromParcel(sequence: MessageSequence): PixelMap {
    var errCode: UInt32 = 0
    let pixelMap = unsafe { FfiImagePixelMapImplCreatePixelMapFromParcel(sequence.getID(), inout errCode) }
    checkRetFor20(errCode)
    return PixelMap(pixelMap)
}

/**
 * Creates a PixelMap object from surface id.
 *
 * @param { String } surfaceId - surface id.
 * @param { Region } region - The region to surface.
 * @returns { PixelMap } Returns the instance if the operation is successful;Otherwise, an exception will be thrown.
 * @throws { BusinessException } 62980115 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
 *     2.Incorrect parameter types. 3.Parameter verification failed.
 * @throws { BusinessException } 62980105 - Failed to get the data.
 * @throws { BusinessException } 62980178 - Failed to create the PixelMap.
 * @relation createPixelMapFromSurfaceSync(surfaceId: string, region: Region): PixelMap;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPixelMapFromSurface(surfaceId: String, region: Region): PixelMap {
    var errCode: UInt32 = 0
    unsafe {
        let id = LibC.mallocCString(surfaceId)
        let pixelMap = FfiImagePixelMapImplCreatePixelMapFromSurface(id, region.toExternal(), ARG_SIZE_TWO,
            inout errCode)
        LibC.free(id)
        checkRetFor20(errCode)
        return PixelMap(pixelMap)
    }
}

/**
 * Creates a PixelMap object from surface id.
 *
 * @param { String } surfaceId - surface id.
 * @returns { PixelMap } Returns the instance if the operation is successful;Otherwise, an exception will be thrown.
 * @throws { BusinessException } 62980115 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
 *     2.Incorrect parameter types. 3.Parameter verification failed.
 * @throws { BusinessException } 62980105 - Failed to get the data.
 * @throws { BusinessException } 62980178 - Failed to create the PixelMap.
 * @relation createPixelMapFromSurfaceSync(surfaceId: string): PixelMap;
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public func createPixelMapFromSurface(surfaceId: String): PixelMap {
    var errCode: UInt32 = 0
    unsafe {
        let id = LibC.mallocCString(surfaceId)
        let pixelMap = FfiImagePixelMapImplCreatePixelMapFromSurface(id, CRegion(CSize(0, 0), 0, 0), ARG_SIZE_ONE,
            inout errCode)
        LibC.free(id)
        checkRetFor20(errCode)
        return PixelMap(pixelMap)
    }
}

/**
 * PixelMap instance.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class PixelMap <: RemoteDataLite {
    protected init(id: Int64) {
        super(id)
        IMAGE_LOG.info("[PixelMap] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Whether the image pixel map can be edited.
     *
     * @type { Bool }
     *
     * @brief readonly isEditable: boolean
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop isEditable: Bool {
        get() {
            unsafe {
                var errCode: UInt32 = 0
                let res = FfiOHOSGetIsEditable(getID(), inout errCode)
                checkRet(errCode, "[PixelMap] isEditable:")
                return res
            }
        }
    }

    /**
     * Whether the image pixel map can be edited.
     *
     * @type { Bool }
     *
     * @brief readonly isEditable: boolean
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop isStrideAlignment: Bool {
        get() {
            unsafe {
                var errCode: UInt32 = 0
                let res = FfiOHOSGetIsStrideAlignment(getID(), inout errCode)
                checkRet(errCode, "[PixelMap] isStrideAlignment:")
                return res
            }
        }
    }

    /**
     * Releases this PixelMap object. This method return the result.
     *
     * @brief release(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func Release(): Unit {
        unsafe {
            let ret = FfiOHOSPixelMapRelease(getID())
            checkRet(ret, "[PixelMap] Release:")
            releaseFFIData(getID())
        }
        IMAGE_LOG.info("[PixelMap] ffi release success")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func release(): Unit {
        unsafe {
            let ret = FfiOHOSPixelMapRelease(getID())
            checkRet(ret, "[PixelMap] Release:")
            releaseFFIData(getID())
        }
        IMAGE_LOG.info("[PixelMap] ffi release success")
    }

    /**
     * Reads image pixel map data and writes the data to an ArrayBuffer. This method uses
     * a promise to return the result.
     *
     * @param { Array<UInt8> } dst A buffer to which the image pixel map data will be written.
     * @brief readPixelsToBuffer(dst: ArrayBuffer): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func readPixelsToBuffer(dst: Array<UInt8>): Unit {
        unsafe {
            var arrPtr = acquireArrayRawData(dst)
            let ret = FfiOHOSReadPixelsToBuffer(getID(), UInt64(dst.size), arrPtr.pointer)
            releaseArrayRawData(arrPtr)
            checkRet(ret, "[PixelMap] readPixelsToBuffer:")
        }
    }

    /**
     * Reads image data in an ArrayBuffer and writes the data to a PixelMap object. This method
     * uses a promise to return the result.
     *
     * @param { Array<UInt8> } src A buffer from which the image data will be read.
     * @brief writeBufferToPixels(src: ArrayBuffer): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func writeBufferToPixels(src: Array<UInt8>): Unit {
        unsafe {
            let arrPtr = acquireArrayRawData(src)
            let ret = FfiOHOSWriteBufferToPixels(getID(), arrPtr.pointer, UInt64(src.size))
            releaseArrayRawData(arrPtr)
            checkRet(ret, "[PixelMap] writeBufferToPixels:")
        }
    }

    /**
     * Obtains pixel map information about this image. This method uses a promise to return the information.
     *
     * @returns { ImageInfo } An instance used to return the image pixel map information. If the operation fails,
     *  an error message is returned.
     * @brief getImageInfo(): Promise<ImageInfo>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getImageInfo(): ImageInfo {
        unsafe {
            var errCode: UInt32 = 0
            let cimage = FfiOHOSGetImageInfoV2(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] getImageInfo:")
            try {
                return cimage.toImageInfo()
            } finally {
                cimage.free()
            }
        }
    }

    /**
     * Obtains the number of bytes in each line of the image pixel map.
     *
     * @returns { UInt32 } Number of bytes in each line.
     * @brief getBytesNumberPerRow(): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getBytesNumberPerRow(): UInt32 {
        unsafe {
            var errCode: UInt32 = 0
            let res = FfiOHOSGetBytesNumberPerRow(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] getBytesNumberPerRow:")
            return res
        }
    }

    /**
     * Obtains the total number of bytes of the image pixel map.
     *
     * @returns { UInt32 } Total number of bytes.
     * @brief getPixelBytesNumber(): number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getPixelBytesNumber(): UInt32 {
        unsafe {
            var errCode: UInt32 = 0
            let res = FfiOHOSGetPixelBytesNumber(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] getPixelBytesNumber:")
            return res
        }
    }

    /**
     * Obtains the density of the image pixel map.
     *
     * @returns { Int32 } The number of density.
     * @brief getDensity():number
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getDensity(): Int32 {
        unsafe {
            var errCode: UInt32 = 0
            let res = FfiOHOSGetDensity(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] getDensity:")
            return res
        }
    }

    /**
     * Set the transparent rate of pixel map. This method return the operation result.
     *
     * @param { Float32 } rate The value of transparent rate.
     * @brief opacity(rate: number): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func opacity(rate: Float32): Unit {
        unsafe {
            let ret = FfiOHOSOpacity(getID(), rate)
            checkRet(ret, "[PixelMap] opacity:")
        }
    }

    /**
     * Image zoom in width and height. This method return the operation result.
     *
     * @param { Float32 } x The zoom value of width.
     * @param { Float32 } y The zoom value of height.
     * @brief scale(x: number, y: number): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func scale(x: Float32, y: Float32): Unit {
        unsafe {
            let ret = FfiOHOSScale(getID(), x, y)
            checkRet(ret, "[PixelMap] scale:")
        }
    }

    /**
     * Image zoom in width and height width with anti-aliasing. This method uses a promise to return the result.
     *
     * @param { Float32 } x The zoom value of width.
     * @param { Float32 } y The zoom value of height.
     * @param { AntiAliasingLevel } level The anti-aliasing algorithm to be used.
     * @throws { BusinessException } 401 - Parameter error. Possible causes: 1.Mandatory parameters are left unspecified.
     * 2.Incorrect parameter types. 3.Parameter verification failed.
     * @throws { BusinessException } 501 - Resource Unavailable.
     * @syscap SystemCapability.Multimedia.Image.Core
     * @crossplatform
     * @form
     * @atomicservice
     */
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func scale(x: Float32, y: Float32, level: AntiAliasingLevel): Unit {
        unsafe {
            let ret = FfiImagePixelMapImplScale(getID(), x, y, level.value)
            checkRet(ret, "[PixelMap] scale:")
        }
    }

    /**
     * Image position transformation. This method return the operation result.
     *
     * @param { Float32 } x The position value of width.
     * @param { Float32 } y The position value of height.
     * @brief translate(x: number, y: number): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func translate(x: Float32, y: Float32): Unit {
        unsafe {
            let ret = FfiOHOSTranslate(getID(), x, y)
            checkRet(ret, "[PixelMap] translate:")
        }
    }

    /**
     * Image rotation. This method return the operation result.
     *
     * @param { Float32 } angle The rotation angle.
     * @brief rotate(angle: number): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func rotate(angle: Float32): Unit {
        unsafe {
            let ret = FfiOHOSRotate(getID(), angle)
            checkRet(ret, "[PixelMap] translate:")
        }
    }

    /**
     * Image flipping. This method return the operation result.
     *
     * @param { Bool } horizontal Is flip in horizontal.
     * @param { Bool } vertical Is flip in vertical.
     * @brief flip(horizontal: boolean, vertical: boolean): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func flip(horizontal: Bool, vertical: Bool): Unit {
        unsafe {
            let ret = FfiOHOSFlip(getID(), horizontal, vertical)
            checkRet(ret, "[PixelMap] flip:")
        }
    }

    /**
     * Crop the image. This method return the operation result.
     *
     * @param { Region } region The region to crop.
     * @brief crop(region: Region): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func crop(region: Region): Unit {
        unsafe {
            let ret = FfiOHOSCrop(getID(), region.toExternal())
            checkRet(ret, "[PixelMap] crop: ")
        }
    }

    /**
     * Writes image pixel map data to the specified area. This method uses a promise to return
     * the operation result.
     *
     * @param { PositionArea } area Area to which the image pixel map data will be written.
     * @brief writePixels(area: PositionArea): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func writePixels(area: PositionArea): Unit {
        unsafe {
            let arrPtr = acquireArrayRawData(area.pixels)
            let ret = FfiOHOSWritePixels(
                getID(),
                CPositionArea(UIntNative(area.pixels.size), area.offset, area.stride, area.region.toExternal(),
                    arrPtr.pointer)
            )
            releaseArrayRawData(arrPtr)
            checkRet(ret, "[PixelMap] writePixels:")
        }
    }

    /**
     * Reads image pixel map data in an area. This method return the data read.
     *
     * @param { PositionArea } area Area from which the image pixel map data will be read.
     * readPixels(area: PositionArea): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func readPixels(area: PositionArea): Unit {
        unsafe {
            let arrPtr = acquireArrayRawData(area.pixels)
            let ret = FfiOHOSReadPixels(
                getID(),
                CPositionArea(UIntNative(area.pixels.size), area.offset, area.stride, area.region.toExternal(),
                    arrPtr.pointer)
            )
            releaseArrayRawData(arrPtr)
            checkRet(ret, "[PixelMap] readPixels:")
        }
    }

    /**
     * Obtains new pixel map with alpha information. This method uses a promise to return the information.
     *
     * @returns { PixelMap } An instance used to return the new image pixel map. If the operation fails,
     *  an error message is returned.
     * @brief createAlphaPixelmap(): PixelMap
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func createAlphaPixelmap(): PixelMap {
        unsafe {
            var errCode: UInt32 = 0
            let id = FfiOHOSCreateAlphaPixelMap(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] createAlphaPixelmap:")
            return PixelMap(id)
        }
    }

    /**
     * Set color space of pixel map.
     *
     * @param { ColorSpaceManager } colorSpace The color space for pixel map.
     * @throws { BusinessException } 62980111 - If the operation invalid.
     * @throws { BusinessException } 62980115 - If the image parameter invalid.
     * @brief setColorSpace(colorSpace: colorSpaceManager.ColorSpaceManager): void
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func setColorSpace(colorSpace: ColorSpaceManager): Unit {
        unsafe {
            let ret = FfiOHOSPixelMapSetColorSpace(getID(), colorSpace.getID())
            checkRet(ret, "[PixelMap] setColorSpace:")
        }
    }

    /**
     * Get color space of pixel map.
     *
     * @throws { BusinessException } 62980101 - If the image data abnormal.
     * @throws { BusinessException } 62980103 - If the image data unsupport.
     * @throws { BusinessException } 62980115 - If the image parameter invalid.
     * @brief getColorSpace(): colorSpaceManager.ColorSpaceManager
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getColorSpace(): ColorSpaceManager {
        unsafe {
            var errCode: UInt32 = 0
            let colorSpaceId = FfiOHOSPixelMapGetColorSpace(getID(), inout errCode)
            checkRet(errCode, "[PixelMap] getColorSpace:")
            return ColorSpaceManager(colorSpaceId)
        }
    }

    /**
     * Apply color space of pixel map, the pixels will be changed by input color space.
     *
     * @param { ColorSpaceManager } targetColorSpace - The color space for pixel map.
     * @throws { BusinessException } 401 - The parameter check failed.
     * @throws { BusinessException } 62980104 - Failed to initialize the internal object.
     * @throws { BusinessException } 62980108 - Failed to convert the color space.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @brief applyColorSpace(targetColorSpace: colorSpaceManager.ColorSpaceManager): Promise<void>
     */
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func applyColorSpace(colorSpace: ColorSpaceManager): Unit {
        unsafe {
            let ret = FfiOHOSPixelMapApplyColorSpace(getID(), colorSpace.getID())
            checkRet(ret, "[PixelMap] applyColorSpace:")
        }
    }

    /**
     * Convert pixelmap to standard dynamic range.
     *
     * @throws { BusinessException } 62980137 - Invalid image operation.
     * @syscap SystemCapability.Multimedia.Image.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func toSdr(): Unit {
        let errCode = unsafe { FfiImagePixelMapImplToSdr(getID()) }
        checkRet(errCode, "[PixelMap] toSdr:")
    }

    /**
     * Marshalling pixelmap and write into MessageSequence.
     *
     * @param { MessageSequence } sequence MessageSequence parameter.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980097 - IPC error.
     * @relation marshalling(sequence: rpc.MessageSequence): void;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func marshalling(sequence: MessageSequence): Unit {
        let errCode = unsafe { FfiImagePixelMapImplMarshalling(getID(), sequence.getID()) }
        checkRetFor20(errCode)
    }

    /**
     * Creates a PixelMap object based on MessageSequence parameter.
     *
     * @param { MessageSequence } sequence MessageSequence parameter.
     * @returns { PixelMap } Return the PixelMap object.
     * @throws { BusinessException } 62980115 - Invalid image parameter.
     * @throws { BusinessException } 62980097 - IPC error.
     * @throws { BusinessException } 62980096 - The operation failed.
     * @relation unmarshalling(sequence: rpc.MessageSequence): Promise<PixelMap>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func unmarshalling(sequence: MessageSequence): PixelMap {
        var errCode: UInt32 = 0
        let pixelMap = unsafe { FfiImagePixelMapImplUnmarshalling(getID(), sequence.getID(), inout errCode) }
        checkRetFor20(errCode)
        return PixelMap(pixelMap)
    }

    /**
     * The method is used for the transformation of the image formats. Pixel data will be changed by calling this method.
     *
     * @param { PixelMapFormat } targetPixelFormat - The pixel format for pixelmap conversion.
     * @throws { BusinessException } 62980115 - Invalid input parameter.
     * @throws { BusinessException } 62980111 - The image source data is incomplete.
     * @throws { BusinessException } 62980274 - The conversion failed.
     * @throws { BusinessException } 62980276 - The type to be converted is an unsupported target pixel format.
     * @throws { BusinessException } 62980178 - Failed to create the pixelmap.
     * @relation onvertPixelFormat(targetPixelFormat: PixelMapFormat): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func convertPixelFormat(targetPixelFormat: PixelMapFormat): Unit {
        let errCode = unsafe { FfiImagePixelMapImplConvertPixelMapFormat(getID(), targetPixelFormat.getValue()) }
        checkRetFor20(errCode)
    }
}
