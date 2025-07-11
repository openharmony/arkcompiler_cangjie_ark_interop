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
    func FFiOHOSImageCreatorConstructor(width: Int32, height: Int32, format: Int32, capacity: Int32): Int64

    func FFiOHOSImageCreatorGetCapacity(id: Int64): RetDataI32

    func FFiOHOSImageCreatorGetformat(id: Int64): RetDataI32

    func FFiOHOSImageCreatorDequeueImage(id: Int64, errCode: CPointer<UInt32>): Int64

    func FFiOHOSImageCreatorQueueImage(id: Int64, imageId: Int64): Unit

    func FFiOHOSImageCreatorRelease(id: Int64): Unit
}

/**
 * Image creator object.
 *
 * @relation interface ImageCreator
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageCreator"
]
public class ImageCreator <: RemoteDataLite {
    init(width: Int32, height: Int32, format: Int32, capacity: Int32) {
        super(unsafe { FFiOHOSImageCreatorConstructor(width, height, format, capacity) })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Image capacity.
     *
     * @relation readonly capacity: number;
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageCreator"
    ]
    public prop capacity: Int32 {
        get() {
            let ret = unsafe { FFiOHOSImageCreatorGetCapacity(getID()) }
            checkRet(UInt32(ret.code), "[ImageCreator] capacity:")
            return ret.data
        }
    }

    /**
     * Image format.
     *
     * @relation readonly format: ImageFormat;
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageCreator"
    ]
    public prop format: Int32 {
        get() {
            let ret = unsafe { FFiOHOSImageCreatorGetformat(getID()) }
            checkRet(UInt32(ret.code), "[ImageCreator] capacity:")
            return ret.data
        }
    }

    /**
     * Apply for new graphic buffer from free queue.
     *
     * @relation dequeueImage(): Promise<Image>;
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageCreator"
    ]
    public func dequeueImage(): Image {
        unsafe {
            var errCode: UInt32 = 0
            let id = FFiOHOSImageCreatorDequeueImage(getID(), inout errCode)
            checkRet(errCode, "[ImageCreator] dequeueImage:")
            return Image(id)
        }
    }

    /**
     * Queue buffer to dirty queue.
     *
     * @relation queueImage(interface: Image): Promise<void>;
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageCreator"
    ]
    public func queueImage(image: Image): Unit {
        unsafe { FFiOHOSImageCreatorQueueImage(getID(), image.getID()) }
    }

    /**
     * Releases buffer in bufferqueue instance.
     *
     * @relation release(): Promise<void>;
     */
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.ImageCreator"
    ]
    public func release(): Unit {
        unsafe { FFiOHOSImageCreatorRelease(getID()) }
        releaseFFIData(getID())
    }
}

/**
 * Creates an ImageCreator instance.
 *
 * @throws { BusinessException } 401 - Parameter error.Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types;
 * @relation function createImageCreator(size: Size, format: ImageFormat, capacity: number): ImageCreator;
 */
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.ImageCreator"
]
public func createImageCreator(size: Size, format: Int32, capacity: Int32): ImageCreator {
    if (size.width <= 0 || size.height <= 0 || format < 0 || capacity < 0) {
        throw BusinessException(ERR_PARAMETER_ERROR, "[createImageCreator] createImageCreator: Invalid param.")
    }
    return ImageCreator(size.width, size.height, format, capacity)
}
