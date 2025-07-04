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

package ohos.display

import ohos.base.*
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Rect {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public Rect(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var left: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var top: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var width: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
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
struct CWaterfallDisplayAreaRects {
    CWaterfallDisplayAreaRects(
        let left: CRect,
        let top: CRect,
        let right: CRect,
        let bottom: CRect
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class WaterfallDisplayAreaRects {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public WaterfallDisplayAreaRects(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let left: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let top: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let right: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let bottom: Rect
    ) {}

    init(cWaterfallDisplayAreaRects: CWaterfallDisplayAreaRects) {
        this.left = Rect(cWaterfallDisplayAreaRects.left)
        this.top = Rect(cWaterfallDisplayAreaRects.top)
        this.right = Rect(cWaterfallDisplayAreaRects.right)
        this.bottom = Rect(cWaterfallDisplayAreaRects.bottom)
    }
}

@C
struct CCutoutInfo {
    CCutoutInfo(
        let boundingRects: CPointer<CRect>,
        let number: Int64,
        let waterfallDisplayAreaRects: CWaterfallDisplayAreaRects
    ) {}
}

public class CutoutInfo {
    public CutoutInfo(
        public let boundingRects: Array<Rect>,
        public let waterfallDisplayAreaRects: WaterfallDisplayAreaRects
    ) {}

    init(cCutoutInfo: CCutoutInfo) {
        let ptr = cCutoutInfo.boundingRects
        this.boundingRects = unsafe {
            Array<Rect>(cCutoutInfo.number, {i => Rect(ptr.read(i))})
        }
        this.waterfallDisplayAreaRects = WaterfallDisplayAreaRects(cCutoutInfo.waterfallDisplayAreaRects)
    }
}

@C
struct CFoldCreaseRegion {
    CFoldCreaseRegion(
        let displayId: UInt32,
        let number: Int64,
        let creaseRects: CPointer<CRect>
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class FoldCreaseRegion {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public FoldCreaseRegion(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let displayId: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let creaseRects: Array<Rect>
    ) {}

    init(cFoldCreaseRegion: CFoldCreaseRegion) {
        let ptr = cFoldCreaseRegion.creaseRects
        this.creaseRects = unsafe {
            Array<Rect>(cFoldCreaseRegion.number, {i => Rect(ptr.read(i))})
        }
        this.displayId = cFoldCreaseRegion.displayId
    }
}

@C
struct CDisplayPhysicalResolution {
    CDisplayPhysicalResolution(
        let foldDisplayMode: UInt32,
        let physicalWidth: UInt32,
        let physicalHeight: UInt32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class DisplayPhysicalResolution {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public DisplayPhysicalResolution(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let foldDisplayMode: FoldDisplayMode,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let physicalWidth: UInt32,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let physicalHeight: UInt32
    ) {}

    init(cDisplayPhysicalResolution: CDisplayPhysicalResolution) {
        this.foldDisplayMode = FoldDisplayMode.parse(cDisplayPhysicalResolution.foldDisplayMode)
        this.physicalWidth = cDisplayPhysicalResolution.physicalWidth
        this.physicalHeight = cDisplayPhysicalResolution.physicalHeight
    }
}
