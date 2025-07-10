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
    func FfiOHOSReceiverGetSize(id: Int64, retVal: CPointer<CSize>): UInt32

    func FfiOHOSReceiverGetCapacity(id: Int64, retVal: CPointer<Int32>): UInt32

    func FfiOHOSReceiverGetFormat(id: Int64, retVal: CPointer<Int32>): UInt32

    func FfiOHOSCreateImageReceiver(width: Int32, height: Int32, format: Int32, capacity: Int32): Int64

    func FfiOHOSGetReceivingSurfaceId(id: Int64): CString

    func FfiOHOSReadNextImage(id: Int64): Int64

    func FfiOHOSReadLatestImage(id: Int64): Int64

    func FfiOHOSReceiverRelease(id: Int64): Unit

    func FfiImageReceiverImplOn(id: Int64, name: CString, callbackId: Int64): UInt32
}

/**
 * @brief createImageReceiver(width: number, height: number, format: number, capacity: number): ImageReceiver
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
]
public func createImageReceiver(size: Size, format: ImageFormat, capacity: Int32): ImageReceiver {
    let id = unsafe { FfiOHOSCreateImageReceiver(size.width, size.height, format.getValue(), capacity) }
    if (id < 0) {
        throw Exception("ERROR: [createImageReceiver] ret ${id}")
    }
    return ImageReceiver(id)
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
]
public class ImageReceiver <: RemoteDataLite {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
    ]
    public prop size: Size {
        get() {
            unsafe {
                var cSize = CSize(0, 0)
                let res = FfiOHOSReceiverGetSize(getID(), inout cSize)
                checkRet(res, "ERROR: [ImageReceiver][size]")
                return Size(cSize)
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
    ]
    public prop capacity: Int32 {
        get() {
            unsafe {
                var ret: Int32 = 0
                let result = FfiOHOSReceiverGetCapacity(getID(), inout ret)
                checkRet(result, "ERROR: [ImageReceiver][capacity]")
                return ret
            }
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
    ]
    public prop format: ImageFormat {
        get() {
            unsafe {
                var value: Int32 = 0
                let result = FfiOHOSReceiverGetFormat(getID(), inout value)
                checkRet(result, "ERROR: [ImageReceiver][format]")
                return ImageFormat.parse(value)
            }
        }
    }

    init(id: Int64) {
        super(id)
        IMAGE_LOG.info("[ImageReceiver] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
    ]
    public func getReceivingSurfaceId(): String {
        let retData = unsafe {
            FfiOHOSGetReceivingSurfaceId(getID())
        }
        if (retData.isNull()) {
            throw BusinessException(62980102, "[getReceivingSurfaceId] get id failed!")
        }
        let ret = retData.toString()
        IMAGE_LOG.info("[getReceivingSurfaceId] id: " + ret)
        unsafe { LibC.free(retData) }
        return ret
    }

    func readNextImage(): Image {
        let retImageID = unsafe {
            FfiOHOSReadNextImage(getID())
        }
        return Image(retImageID)
    }

    func readLatestImage(): Image {
        let retImageID = unsafe {
            FfiOHOSReadLatestImage(getID())
        }
        return Image(retImageID)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageReceiver"
    ]
    public func release(): Unit {
        unsafe { FfiOHOSReceiverRelease(getID()) }
        releaseFFIData(getID())
    }
}
