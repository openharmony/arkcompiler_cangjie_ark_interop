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

package ohos.screenshot

import ohos.ffi.*
import ohos.base.*
import std.sync.*
import std.collection.*
import ohos.color_manager.*
import ohos.hilog.*
import ohos.image.*
import std.collection.HashMap
import ohos.labels.*

@C
struct RetStruct {
    RetStruct(
        let code: Int32,
        let len: Int64,
        let data: CPointer<Unit>
    ) {}
}

@C
struct CRect {
    CRect(
        var left: Int32,
        var top: Int32,
        var width: UInt32,
        var height: UInt32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Rect {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public Rect(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var left: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var top: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var width: UInt32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var height: UInt32
    ) {}

    init(cRect: CRect) {
        this.left = cRect.left
        this.top = cRect.top
        this.width = cRect.width
        this.height = cRect.height
    }
}

@C
struct CCaptureOption {
    CCaptureOption(var displayId: Int32) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class CaptureOption {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public CaptureOption(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var displayId!: Int32 = 0
    ) {}

    init(cCaptureOption: CCaptureOption) {
        this.displayId = cCaptureOption.displayId
    }
}

@C
struct CPickInfo {
    CPickInfo(
        let pickRect: CRect,
        let pixelMap: Int64
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class PickInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public PickInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let pickRect: Rect,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let pixelMap: PixelMap
    ) {}

    init(cPickInfo: CPickInfo) {
        this.pickRect = Rect(cPickInfo.pickRect)
        this.pixelMap = PixelMap(cPickInfo.pixelMap)
    }
}

foreign {
    func FfiOHOSScreenshotPick(): RetStruct

    func FfiOHOSScreenshotCapture(id: Int32): RetStruct
}

let SCEENSHOT_LOG = HilogChannel(0, 0xD004200, "CJ-Screenshot")

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func pick(): PickInfo {
    unsafe {
        let ret = FfiOHOSScreenshotPick()
        if (ret.code != 0) {
            SCEENSHOT_LOG.error("[screenshot] ERROR: ${ret.code} Failed to get default PickInfo.")
            throw BusinessException(ret.code, "ERROR: Failed to get default PickInfo.")
        }
        let dataPtr = CPointer<CPickInfo>(ret.data)
        let cPickInfo = dataPtr.read()
        let pickInfo = PickInfo(cPickInfo)
        LibC.free<CPickInfo>(dataPtr)
        return pickInfo
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func capture(options!: CaptureOption = CaptureOption()): PixelMap {
    unsafe {
        let ret = FfiOHOSScreenshotCapture(options.displayId)
        if (ret.code != 0) {
            SCEENSHOT_LOG.error("[screenshot] ERROR: ${ret.code} Failed to get default PixelMap.")
            throw BusinessException(ret.code, "ERROR: Failed to get default PixelMap.")
        }
        let dataPtr = CPointer<Int64>(ret.data)
        let retVal = dataPtr.read()
        LibC.free<Int64>(dataPtr)
        return PixelMap(retVal)
    }
}
