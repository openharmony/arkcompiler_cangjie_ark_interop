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
    func FfiOHOSImageGetClipRect(id: Int64, retVal: CPointer<CRegion>): UInt32

    func FfiOHOSImageGetSize(id: Int64, retVal: CPointer<CSize>): UInt32

    func FfiOHOSImageGetFormat(id: Int64, retVal: CPointer<Int32>): UInt32

    func FfiOHOSGetComponent(id: Int64, componentType: Int32, ptr: CPointer<CRetComponent>): UInt32

    func FfiOHOSImageRelease(id: Int64): Unit

    func FfiImageImageImplGetTimestamp(id: Int64): Int64
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public class Image <: RemoteDataLite {
    @!APILevel[
        12,
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

    @!APILevel[
        12,
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

    @!APILevel[
        12,
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

    /**
     * Image timestamp.
     *
     * @type { Int64 }
     * @syscap SystemCapability.Multimedia.Image.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop timestamp: Int64 {
        get() {
            unsafe {
                return FfiImageImageImplGetTimestamp(getID())
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

    @!APILevel[
        12,
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
        throw Exception()
    }

    @!APILevel[
        12,
        deprecated: 19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func Release(): Unit {
        unsafe { FfiOHOSImageRelease(getID()) }
        releaseFFIData(getID())
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func release(): Unit {
        unsafe { FfiOHOSImageRelease(getID()) }
        releaseFFIData(getID())
    }
}
