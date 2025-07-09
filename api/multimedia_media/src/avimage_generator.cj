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

import ohos.ffi.*
import ohos.base.*
import ohos.image.PixelMap
import ohos.labels.*

foreign {
    func FfiCreateAVImageGenerator(): Int64

    func FfiAVImageGeneratorGetFdSrc(id: Int64, fd: CPointer<CAVFileDescriptor>): Int32

    func FfiAVImageGeneratorSetFdSrc(id: Int64, fd: CAVFileDescriptor): Int32

    func FfiFetchFrameByTime(id: Int64, timeUs: Int64, option: Int32, param: CPixelMapParams): Int64

    func FfiAVImageGeneratorRelease(id: Int64): Int32
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public func createAVImageGenerator(): AVImageGenerator {
    let id = unsafe {
        FfiCreateAVImageGenerator()
    }
    if (id == 0) {
        throw BusinessException(MEDIA_MEMORY_ERROR, "Create AVImageGenerator failed.")
    }
    return AVImageGenerator(id)
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
]
public class AVImageGenerator <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public mut prop fdSrc: AVFileDescriptor {
        get() {
            unsafe {
                var fdSrc_ = CAVFileDescriptor(0, 0, 0)
                let errCode = FfiAVImageGeneratorGetFdSrc(getID(), inout fdSrc_)
                throwIfNotSuccess(errCode, "AVImageGenerator", "get fdSrc")
                let result = fdSrc_.toCJObject()
                return result
            }
        }
        set(value) {
            unsafe {
                let fdSrc_ = CAVFileDescriptor(value)
                let errCode = FfiAVImageGeneratorSetFdSrc(getID(), fdSrc_)
                throwIfNotSuccess(errCode, "AVImageGenerator", "set fdSrc")
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public func fetchFrameByTime(timeUs: Int64, option: AVImageQueryOptions, param: PixelMapParams): PixelMap {
        let cParam = CPixelMapParams(param)
        let ret = unsafe { FfiFetchFrameByTime(getID(), timeUs, option.getValue(), cParam) }
        if (ret == 0) {
            throw BusinessException(MEDIA_MEMORY_ERROR, "Create AVImageGenerator failed.")
        }
        return PixelMap(ret)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Media.AVImageGenerator"
    ]
    public func release(): Unit {
        let errCode = unsafe { FfiAVImageGeneratorRelease(getID()) }
        throwIfNotSuccess(errCode, "AVImageGenerator", "release")
    }
}
