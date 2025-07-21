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

import ohos.labels.*
import ohos.ffi.*

foreign {
    func FfiOHOSImageGetClipRect(id: Int64, retVal: CPointer<CRegion>): UInt32

    func FfiOHOSImageGetSize(id: Int64, retVal: CPointer<CSize>): UInt32

    func FfiOHOSImageGetFormat(id: Int64, retVal: CPointer<Int32>): UInt32

    func FfiOHOSGetComponent(id: Int64, componentType: Int32, ptr: CPointer<CRetComponent>): UInt32

    func FfiOHOSImageRelease(id: Int64): Unit

    func FfiImageImageImplGetTimestamp(id: Int64): Int64
}

/**
 * Provides basic image operations, including obtaining image information, and reading and writing image data.
 *
 * @relation interface Image
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Image <: RemoteDataLite {
    /**
     * Gets the image area to crop, default is size.
     *
     * @relation clipRect: Region
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop clipRect: Region {
        get() {
            unsafe {
                var cRegion = CRegion(CSize(0, 0), 0, 0)
                let result = FfiOHOSImageGetClipRect(getID(), inout cRegion)
                checkRet(result, "ERROR: [Image][clipRect]")
                return Region(cRegion)
            }
        }
    }

    /**
     * Image size.
     *
     * @relation readonly size: Size
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop size: Size {
        get() {
            unsafe {
                var cSize = CSize(0, 0)
                let result = FfiOHOSImageGetSize(getID(), inout cSize)
                checkRet(result, "ERROR: [Image][size]")
                return Size(cSize)
            }
        }
    }

    /**
     * Image format.
     *
     * @relation readonly format: int
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop format: Int32 {
        get() {
            unsafe {
                var ret: Int32 = 0
                let result = FfiOHOSImageGetFormat(getID(), inout ret)
                checkRet(result, "ERROR: [Image][format]")
                return ret
            }
        }
    }

    init(id: Int64) {
        super(id)
        IMAGE_LOG.info("[Image] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * Get component buffer from image.
     *
     * @relation getComponent(componentType: ComponentType): Promise<Component>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func getComponent(componentType: ComponentType): Component {
        unsafe {
            try (retPtr = safeMalloc<CRetComponent>().asResource()) {
                let errCode = FfiOHOSGetComponent(getID(), componentType.getValue(), retPtr.value)
                checkRet(errCode, "[Image] get component failed")
                let cComponent = retPtr.value.read()
                try {
                    return Component(cComponent)
                } finally {
                    cComponent.free()
                }
            }
        }
        throw Exception("Unreachable Code.")
    }

    /**
     * Release current image to receive another.
     *
     * @relation release(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func release(): Unit {
        unsafe { FfiOHOSImageRelease(getID()) }
        releaseFFIData(getID())
    }
}
