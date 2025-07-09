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

package ohos.multimedia_media

import ohos.image.PixelMap
import ohos.labels.*
import ohos.ffi.*
import ohos.base.*

foreign {
    func FfiCreateAVMetadataExtractor(): Int64

    func FfiFetchMetadata(id: Int64, data: CPointer<CMetaAVMetadata>): Int32

    func FfiFetchAlbumCover(id: Int64): Int64

    func FfiAVMetadataExtractorGetFdSrc(id: Int64, fd: CPointer<CAVFileDescriptor>): Int32

    func FfiAVMetadataExtractorSetFdSrc(id: Int64, fd: CAVFileDescriptor): Int32

    func FfiAVMetadataExtractorGetDataSrc(id: Int64, data: CPointer<CAVDataSrcDescriptor>): Int32

    func FfiAVMetadataExtractorSetDataSrc(id: Int64, data: CAVDataSrcDescriptor): Int32

    func FfiAVMetadataExtractorRelease(id: Int64): Int32
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
]
public func createAVMetadataExtractor(): AVMetadataExtractor {
    let id = unsafe {
        FfiCreateAVMetadataExtractor()
    }
    if (id == 0) {
        throw BusinessException(MEDIA_MEMORY_ERROR, "Create AVMetadataExtractor failed.")
    }
    return AVMetadataExtractor(id)
}

protected class InnerUnusedCallback <: Callback3ArgumentWithReturn<Array<UInt8>, UInt32, Int64, Int32> {
    protected init() {}
    public func invoke(_: Array<UInt8>, _: UInt32, _: Int64): Int32 {
        0i32
    }
}

@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
]
public class AVMetadataExtractor <: RemoteDataLite {
    protected var callback: Callback3ArgumentWithReturn<Array<UInt8>, UInt32, Int64, Int32>
    protected var callbackId: Int64

    init(id: Int64) {
        super(id)
        callbackId = 0
        callback = InnerUnusedCallback()
    }

    ~init() {
        releaseFFIData(myDataId)
    }
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
    ]
    public mut prop fdSrc: AVFileDescriptor {
        get() {
            unsafe {
                var fdSrc_ = CAVFileDescriptor(0, 0, 0)
                let errCode = FfiAVMetadataExtractorGetFdSrc(getID(), inout fdSrc_)
                throwIfNotSuccess(errCode, "AVMetadataExtractor", "get fdSrc")
                let result = fdSrc_.toCJObject()
                return result
            }
        }
        set(value) {
            unsafe {
                let fdSrc_ = CAVFileDescriptor(value)
                let errCode = FfiAVMetadataExtractorSetFdSrc(getID(), fdSrc_)
                throwIfNotSuccess(errCode, "AVMetadataExtractor", "set fdSrc")
            }
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
    ]
    public mut prop dataSrc: AVDataSrcDescriptor {
        get() {
            unsafe {
                var dataSrc_ = CAVDataSrcDescriptor(0, 0)
                let errCode = FfiAVMetadataExtractorGetDataSrc(getID(), inout dataSrc_)
                throwIfNotSuccess(errCode, "AVMetadataExtractor", "get dataSrc")
                if (this.callbackId != dataSrc_.callback) {
                    throw BusinessException(MEDIA_MEMORY_ERROR, "Get AVDataSrcDescriptor failed.")
                }
                AVDataSrcDescriptor(dataSrc_.fileSize, this.callback)
            }
        }
        set(value) {
            unsafe {
                if (refEq(value.callback, this.callback)) {
                    let val = CAVDataSrcDescriptor(value.fileSize, this.callbackId)
                    let errCode = FfiAVMetadataExtractorSetDataSrc(getID(), val)
                    throwIfNotSuccess(errCode, "AVMetadataExtractor", "set dataSrc")
                } else {
                    let wrapper: (CPointer<UInt8>, UInt32, Int64) -> Int32 = {
                        buffer: CPointer<UInt8>, length: UInt32, pos: Int64 =>
                        let arr = Array<UInt8>(Int64(length), repeat: 0)
                        let ret = value.callback.invoke(arr, length, pos)
                        for (i in 0..Int64(length)) {
                            buffer.write(i, arr[i])
                        }
                        ret
                    }
                    let lambda = Callback3Param<CPointer<UInt8>, UInt32, Int64, Int32>(wrapper)
                    let val = CAVDataSrcDescriptor(value.fileSize, lambda.getID())
                    let errCode = FfiAVMetadataExtractorSetDataSrc(getID(), val)
                    throwIfNotSuccess(errCode, "AVMetadataExtractor", "set dataSrc")
                    this.callbackId = lambda.getID()
                    this.callback = value.callback
                }
            }
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
    ]
    public func fetchMetadata(): AVMetadata {
        var data = CMetaAVMetadata()
        unsafe {
            let errCode = FfiFetchMetadata(getID(), inout data)
            throwIfNotSuccess(errCode, "AVMetadataExtractor", "fetch metadata")
            let result = data.toCJObject()
            data.free()
            result
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
    ]
    public func fetchAlbumCover(): PixelMap {
        let id = unsafe { FfiFetchAlbumCover(getID()) }
        if (id == 0) {
            throw BusinessException(MEDIA_MEMORY_ERROR, "fetchAlbumCover failed.")
        }
        return PixelMap(id)
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVMetadataExtractor"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiAVMetadataExtractorRelease(getID()) }
        throwIfNotSuccess(errCode, "AVMetadataExtractor", "release")
    }
}
