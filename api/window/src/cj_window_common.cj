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

package ohos.window

internal import ohos.labels.*

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Size {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public Size(
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

    func toExternal(): CSize {
        return CSize(width, height)
    }

    init(cSize: CSize) {
        this.width = cSize.width
        this.height = cSize.height
    }
}

@C
struct CSize {
    CSize(
        let width: UInt32,
        let height: UInt32
    ) {}

    func toSize(): Size {
        return Size(width, height)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public class TitleButtonRect {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public TitleButtonRect(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var right: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var top: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var width: UInt32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var height: UInt32
    ) {}

    func toExternal(): CTitleButtonRect {
        return CTitleButtonRect(right, top, width, height)
    }

    init(cTitleButtonRect: CTitleButtonRect) {
        this.right = cTitleButtonRect.right
        this.top = cTitleButtonRect.top
        this.width = cTitleButtonRect.width
        this.height = cTitleButtonRect.height
    }
}

@C
struct CTitleButtonRect {
    CTitleButtonRect(
        let right: Int32,
        let top: Int32,
        let width: UInt32,
        let height: UInt32
    ) {}

    func toTitleButtonRect(): TitleButtonRect {
        return TitleButtonRect(right, top, width, height)
    }
}

@C
struct RetStruct {
    RetStruct(
        let code: Int32,
        let len: Int64,
        let data: CPointer<Unit>
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Configuration {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public Configuration(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let name: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let windowType: WindowType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let ctx: StageContext,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var displayId!: Int64 = -1,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var parentId!: Int64 = -1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var decorEnabled!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var title!: String = ""
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

    func toExternal(): CRect {
        return CRect(left, top, width, height)
    }

    init(cRect: CRect) {
        this.left = cRect.left
        this.top = cRect.top
        this.width = cRect.width
        this.height = cRect.height
    }
}

@C
struct CRect {
    CRect(
        let left: Int32,
        let top: Int32,
        let width: UInt32,
        let height: UInt32
    ) {}

    func toRect(): Rect {
        return Rect(left, top, width, height)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public class RectChangeOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public RectChangeOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var rect: Rect,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var reason: RectChangeReason
    ) {}

    func toExternal(): CRectChangeOptions {
        return CRectChangeOptions(rect.toExternal(), Int32(reason.getValue()))
    }

    init(cRectChangeOptions: CRectChangeOptions) {
        this.rect = cRectChangeOptions.rect.toRect()
        this.reason = RectChangeReason.parse(cRectChangeOptions.reason)
    }
}

@C
struct CRectChangeOptions {
    CRectChangeOptions(
        let rect: CRect,
        let reason: Int32
    ) {}

    func toRectChangeOptions(): RectChangeOptions {
        return RectChangeOptions(rect.toRect(), RectChangeReason.parse(reason))
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class WindowProperties {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public WindowProperties(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let windowRect: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let drawableRect: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let winType: WindowType,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isFullScreen: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isLayoutFullScreen: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let focusable: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let touchable: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let brightness: Float32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isKeepScreenOn: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isPrivacyMode: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isRoundCorner: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let isTransparent: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public let id: UInt32
    ) {}
}

@C
struct CWindowProperties {
    CWindowProperties(
        let windowRect: CRect,
        let drawableRect: CRect,
        let winType: UInt32,
        let isFullScreen: Bool,
        let isLayoutFullScreen: Bool,
        let focusable: Bool,
        let touchable: Bool,
        let brightness: Float32,
        let isKeepScreenOn: Bool,
        let isPrivacyMode: Bool,
        let isRoundCorner: Bool,
        let isTransparent: Bool,
        let id: UInt32
    ) {}

    func toWindowProperties(): WindowProperties {
        return WindowProperties(windowRect.toRect(), drawableRect.toRect(), toWindowType(winType), isFullScreen,
            isLayoutFullScreen, focusable, touchable, brightness, isKeepScreenOn, isPrivacyMode, isRoundCorner,
            isTransparent, id)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class AvoidArea {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public AvoidArea(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var visible: Bool,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var leftRect: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var topRect: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var rightRect: Rect,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var bottomRect: Rect
    ) {}

    func toExternal(): CAvoidArea {
        return CAvoidArea(visible, leftRect.toExternal(), topRect.toExternal(), rightRect.toExternal(),
            bottomRect.toExternal())
    }

    init(cAvoidArea: CAvoidArea) {
        this.visible = cAvoidArea.visible
        this.leftRect = Rect(cAvoidArea.leftRect)
        this.topRect = Rect(cAvoidArea.topRect)
        this.rightRect = Rect(cAvoidArea.rightRect)
        this.bottomRect = Rect(cAvoidArea.bottomRect)
    }
}

@C
struct CAvoidArea {
    CAvoidArea(
        var visible: Bool,
        var leftRect: CRect,
        var topRect: CRect,
        var rightRect: CRect,
        var bottomRect: CRect
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class AvoidAreaOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public AvoidAreaOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var areaType: AvoidAreaType,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var area: AvoidArea
    ) {}

    func toExternal(): CAvoidAreaOptions {
        return CAvoidAreaOptions(Int32(this.areaType.getValue()), this.area.toExternal())
    }

    init(cAvoidAreaOptions: CAvoidAreaOptions) {
        this.areaType = AvoidAreaType.parse(cAvoidAreaOptions.areaType)
        this.area = AvoidArea(cAvoidAreaOptions.area)
    }
}

@C
struct CAvoidAreaOptions {
    CAvoidAreaOptions(
        var areaType: Int32,
        var area: CAvoidArea
    ) {}

    func toAvoidAreaOptions(): AvoidAreaOptions {
        return AvoidAreaOptions(this)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class SystemBarProperties {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public SystemBarProperties(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var statusBarColor!: String = "#66000000",
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var isStatusBarLightIcon!: Bool = false,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var statusBarContentColor!: String = "#E5FFFFFF",
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var navigationBarColor!: String = "#66000000",
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var isNavigationBarLightIcon!: Bool = false,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var navigationBarContentColor!: String = "#E5FFFFFF",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var enableStatusBarAnimation!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.WindowManager.WindowManager.Core"
        ]
        public var enableNavigationBarAnimation!: Bool = false
    ) {}

    init(systemBarProperties: CJBarProperties) {
        this.statusBarColor = systemBarProperties.statusBarColor.toString()
        this.isStatusBarLightIcon = systemBarProperties.isStatusBarLightIcon
        this.statusBarContentColor = systemBarProperties.statusBarContentColor.toString()
        this.navigationBarColor = systemBarProperties.navigationBarColor.toString()
        this.isNavigationBarLightIcon = systemBarProperties.isNavigationBarLightIcon
        this.navigationBarContentColor = systemBarProperties.navigationBarContentColor.toString()
        this.enableStatusBarAnimation = systemBarProperties.enableStatusBarAnimation
        this.enableNavigationBarAnimation = systemBarProperties.enableNavigationBarAnimation
    }
}

@C
struct CJBarProperties {
    CJBarProperties(
        var statusBarColor: CString,
        var isStatusBarLightIcon: Bool,
        var statusBarContentColor: CString,
        var navigationBarColor: CString,
        var isNavigationBarLightIcon: Bool,
        var navigationBarContentColor: CString,
        var enableStatusBarAnimation: Bool,
        var enableNavigationBarAnimation: Bool
    ) {}

    func freeCStringMember(): Unit {
        unsafe {
            LibC.free(statusBarColor)
            LibC.free(statusBarContentColor)
            LibC.free(navigationBarColor)
            LibC.free(navigationBarContentColor)
        }
    } 
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public class WindowLimits {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public WindowLimits(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var maxWidth!: UInt32 = UInt32.Max,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var maxHeight!: UInt32 = UInt32.Max,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var minWidth!: UInt32 = 1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var minHeight!: UInt32 = 1
    ) {}

    func toExternal(): CWindowLimits {
        return CWindowLimits(maxWidth, maxHeight, minWidth, minHeight)
    }

    init(windowLimits: CWindowLimits) {
        this.maxWidth = windowLimits.maxWidth
        this.maxHeight = windowLimits.maxHeight
        this.minWidth = windowLimits.minWidth
        this.minHeight = windowLimits.minHeight
    }
}

@C
struct CWindowLimits {
    CWindowLimits(
        var maxWidth: UInt32,
        var maxHeight: UInt32,
        var minWidth: UInt32,
        var minHeight: UInt32
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Window.SessionManager"
]
public class SubWindowOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Window.SessionManager"
    ]
    public SubWindowOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public let title!: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public let decorEnabled!: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Window.SessionManager"
        ]
        public var isModal!: Bool = false
    ) {}

    func toExternal(): CSubWindowOptions {
        unsafe {
            return CSubWindowOptions(LibC.mallocCString(title), decorEnabled, isModal)
        }
    }

    init(subWindowOptions: CSubWindowOptions) {
        this.title = subWindowOptions.title.toString()
        this.decorEnabled = subWindowOptions.decorEnabled
        this.isModal = subWindowOptions.isModal
    }
}

@C
struct CSubWindowOptions {
    CSubWindowOptions(
        var title: CString,
        var decorEnabled: Bool,
        var isModal: Bool
    ) {}
}
