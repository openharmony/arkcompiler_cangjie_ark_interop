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

internal import std.collection.*
internal import std.sync.*
internal import ohos.ffi.*
internal import ohos.image.*

type StageContext = CPointer<Unit>

foreign {
    func FfiOHOSCreateWindow(name: CString, windowType: UInt32, ctx: StageContext, displayId: Int64, parentId: Int64): RetDataI64

    func FFiOHOSWindowFindWindow(name: CString): RetDataI64

    func FfiOHOSGetLastWindow(ctx: StageContext): RetDataI64

    func FfiOHOSShiftAppWindowFocus(sourceWindowId: Int32, targetWindowId: Int32): Int32

    func FfiOHOSWindowShowWindow(id: Int64): Int32

    func FfiOHOSWindowDestroyWindow(id: Int64): Int32

    func FfiOHOSWindowMoveWindowTo(id: Int64, x: Int32, y: Int32): Int32

    func FfiOHOSWindowResize(id: Int64, width: UInt32, height: UInt32): Int32

    func FfiOHOSWindowSetWindowLayoutFullScreen(id: Int64, isLayoutFullScreen: Bool): Int32

    func FfiOHOSWindowIsWindowSupportWideGamut(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSWindowGetWindowProperties(id: Int64, errCode: CPointer<Int32>): CWindowProperties

    func FfiOHOSSetWindowBackgroundColor(id: Int64, color: CString): Int32

    func FfiOHOSWindowSetWindowBrightness(id: Int64, brightness: Float32): Int32

    func FfiOHOSWindowSetWindowFocusable(id: Int64, focusable: Bool): Int32

    func FfiOHOSWindowSetWindowKeepScreenOn(id: Int64, keepScreenOn: Bool): Int32

    func FfiOHOSWindowSetWindowPrivacyMode(id: Int64, isPrivacyMode: Bool): Int32

    func FfiOHOSWindowSetWindowTouchable(id: Int64, touchable: Bool): Int32

    func FfiOHOSWindowIsWindowShowing(id: Int64, errCode: CPointer<Int32>): Bool

    func FFiOHOSWindowSetPreferredOrientation(id: Int64, orientation: UInt32): Int32

    func FFiOHOSWindowGetWindowAvoidArea(id: Int64, areaType: UInt32, retPtr: CPointer<CAvoidArea>): Int32

    func FFiOHOSWindowSetAspectRatio(id: Int64, ratio: Float64): Int32

    func FFiOHOSWindowResetAspectRatio(id: Int64): Int32

    func FFiOHOSWindowMinimize(id: Int64): Int32

    func FFiOHOSWindowSetWindowColorSpace(id: Int64, colorSpace: UInt32): Int32

    func FFiOHOSWindowSetResizeByDragEnabled(id: Int64, enable: Bool): Int32

    func FFiOHOSWindowGetWindowColorSpace(id: Int64, errCode: CPointer<Int32>): UInt32

    func FFiOHOSWindowSnapshot(id: Int64, errCode: CPointer<Int32>): Int64

    func FFiOHOSWindowSetWindowSystemBarEnable(id: Int64, arr: CArrString): Int32

    func FFiOHOSWindowSetWindowSystemBarProperties(id: Int64, properties: CJBarProperties): Int32

    func FfiOHOSOnKeyboardHeightChange(id: Int64, callbackId: Int64): Int32

    func FfiOHOSOffKeyboardHeightChange(id: Int64): Int32

    func FfiOHOSIsFocused(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSSetWindowLimits(id: Int64, windowlimits: CWindowLimits, retPtr: CPointer<CWindowLimits>): Int32

    func FfiOHOSGetWindowLimits(id: Int64, retPtr: CPointer<CWindowLimits>): Int32

    func FfiOHOSGetImmersiveModeEnabledState(id: Int64, errCode: CPointer<Int32>): Bool

    func FfiOHOSSetImmersiveModeEnabledState(id: Int64, enabled: Bool): Int32

    func FfiOHOSKeepKeyboardOnFocus(id: Int64, keepKeyboardFlag: Bool): Int32

    func FfiOHOSGetWindowDecorHeight(id: Int64, height: CPointer<Int32>): Int32

    func FfiOHOSSetWindowDecorHeight(id: Int64, height: Int32): Int32

    func FfiOHOSRecover(id: Int64): Int32

    func FfiOHOSSetWindowDecorVisible(id: Int64, isVisible: Bool): Int32

    func FfiOHOSGetTitleButtonRect(id: Int64, retPtr: CPointer<CTitleButtonRect>): Int32

    func FfiOHOSSetDialogBackGestureEnabled(id: Int64, enabled: Bool): Int32

    func FfiOHOSDisableLandscapeMultiWindow(id: Int64): Int32

    func FfiOHOSEnableLandscapeMultiWindow(id: Int64): Int32

    func FfiOHOSSetWindowGrayScale(id: Int64, grayScale: Float32): Int32

    func FfiOHOSSpecificSystemBarEnabled(id: Int64, name: Int32, enable: Bool, enableAnimation: Bool): Int32

    func FfiOHOSGetWindowSystemBarProperties(id: Int64, systemBarProperties: CPointer<CJBarProperties>): Int32

    func FfiOHOSGetPreferredOrientation(id: Int64, errCode: CPointer<Int32>): UInt32

    func FfiOHOSGetWindowStatus(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiOHOSSetSubWindowModal(id: Int64, isModal: Bool): Int32

    func FfiOHOSMaximize(id: Int64, presentation: Int32): Int32

    func FfiOHOSCreateSubWindowWithOptions(id: Int64, name: CString, option: CSubWindowOptions): RetDataI64

    func FfiOHOSOnNoInteractionDetected(id: Int64, timeout: Int64, callbackId: Int64): Int32

    func FfiOHOSOnCallback(id: Int64, callbackId: Int64, callbackType: CString): Int32

    func FfiOHOSOffCallback(id: Int64, callbackId: Int64, callbackType: CString): Int32
}

let registerMutex = Mutex()

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func findWindow(name: String): Window {
    unsafe {
        let cString = LibC.mallocCString(name)
        let cValue = FFiOHOSWindowFindWindow(cString)
        LibC.free(cString)
        checkRet(cValue.code, "[Window] findWindow: ")
        let id = cValue.data
        getOrCreate(Window.instanceMap, id, {id: Int64 => Window(id)})
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func createWindow(config: Configuration): Window {
    unsafe {
        if (config.name.isEmpty()) {
            checkRet(401, "[Window] createWindow: ")
        }
        let cname = LibC.mallocCString(config.name)
        let ret = FfiOHOSCreateWindow(cname, config.windowType.getValue(), config.ctx, config.displayId, config.parentId
        )
        LibC.free(cname)
        checkRet(ret.code, "[Window] createWindow: ")
        getOrCreate(Window.instanceMap, ret.data, {id: Int64 => Window(id)})
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getLastWindow(ctx: StageContext): Window {
    unsafe {
        let ret = FfiOHOSGetLastWindow(ctx)
        checkRet(ret.code, "[Window] getLastWindow: ")
        getOrCreate(Window.instanceMap, ret.data, {id: Int64 => Window(id)})
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func shiftAppWindowFocus(sourceWindowId: Int32, targetWindowId: Int32): Unit {
    unsafe {
        let ret = FfiOHOSShiftAppWindowFocus(sourceWindowId, targetWindowId)
        checkRet(ret, "[Window] shiftAppWindowFocus: ")
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class Window <: RemoteDataLite {
    let callbackMaps = HashMap<String, ArrayList<(CallbackObject, Int64)>>(
        [
            ("windowSizeChange", ArrayList<(CallbackObject, Int64)>()),
            ("avoidAreaChange", ArrayList<(CallbackObject, Int64)>()),
            ("keyboardHeightChange", ArrayList<(CallbackObject, Int64)>()),
            ("touchOutside", ArrayList<(CallbackObject, Int64)>()),
            ("screenshot", ArrayList<(CallbackObject, Int64)>()),
            ("dialogTargetTouch", ArrayList<(CallbackObject, Int64)>()),
            ("windowEvent", ArrayList<(CallbackObject, Int64)>()),
            ("windowVisibilityChange", ArrayList<(CallbackObject, Int64)>()),
            ("windowStatusChange", ArrayList<(CallbackObject, Int64)>()),
            ("windowTitleButtonRectChange", ArrayList<(CallbackObject, Int64)>()),
            ("noInteractionDetected", ArrayList<(CallbackObject, Int64)>()),
            ("windowRectChange", ArrayList<(CallbackObject, Int64)>()),
            ("subWindowClose", ArrayList<(CallbackObject, Int64)>())
        ]
    )

    static let instanceMap = HashMap<Int64, Window>()

    init(id: Int64) {
        super(id)
        WindowLibLog.info("[Window] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func showWindow(): Unit {
        unsafe {
            let ret = FfiOHOSWindowShowWindow(getID())
            checkRet(ret, "[Window] showWindow: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func moveWindowTo(x: Int32, y: Int32): Unit {
        unsafe {
            let ret = FfiOHOSWindowMoveWindowTo(getID(), x, y)
            checkRet(ret, "[Window] moveWindowTo: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func resize(width: UInt32, height: UInt32): Unit {
        unsafe {
            let ret = FfiOHOSWindowResize(getID(), width, height)
            checkRet(ret, "[Window] resize: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowProperties(): WindowProperties {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiOHOSWindowGetWindowProperties(getID(), inout errCode)
            checkRet(errCode, "[Window] getWindowProperties: ")
            return res.toWindowProperties()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func destroyWindow(): Unit {
        unsafe {
            let ret = FfiOHOSWindowDestroyWindow(getID())
            checkRet(ret, "[Window] destroyWindow: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowLayoutFullScreen(isLayoutFullScreen: Bool): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowLayoutFullScreen(getID(), isLayoutFullScreen)
            checkRet(ret, "[Window] setWindowLayoutFullScreen: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func isWindowSupportWideGamut(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiOHOSWindowIsWindowSupportWideGamut(getID(), inout errCode)
            checkRet(errCode, "[Window] isWindowSupportWideGamut: ")
            return res
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func isWindowShowing(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let res = FfiOHOSWindowIsWindowShowing(getID(), inout errCode)
            checkRet(errCode, "[Window] isWindowShowing: ")
            return res
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowBackgroundColor(color: String): Unit {
        unsafe {
            try (rowColor = LibC.mallocCString(color).asResource()) {
                let ret = FfiOHOSSetWindowBackgroundColor(getID(), rowColor.value)
                checkRet(ret, "[Window] setWindowBackgroundColor: ")
            }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowBrightness(brightness: Float32): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowBrightness(getID(), brightness)
            checkRet(ret, "[Window] setWindowBrightness: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowFocusable(isFocusable: Bool): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowFocusable(getID(), isFocusable)
            checkRet(ret, "[Window] setWindowFocusable: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowKeepScreenOn(isKeepScreenOn: Bool): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowKeepScreenOn(getID(), isKeepScreenOn)
            checkRet(ret, "[Window] setWindowKeepScreenOn: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowPrivacyMode(isPrivacyMode: Bool): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowPrivacyMode(getID(), isPrivacyMode)
            checkRet(ret, "[Window] setWindowPrivacyMode: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowTouchable(isTouchable: Bool): Unit {
        unsafe {
            let ret = FfiOHOSWindowSetWindowTouchable(getID(), isTouchable)
            checkRet(ret, "[Window] setWindowTouchable: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setPreferredOrientation(orientation: Orientation): Unit {
        let code = unsafe { FFiOHOSWindowSetPreferredOrientation(getID(), orientation.getValue()) }
        checkRet(code, "[Window] setPreferredOrientation: ")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowAvoidArea(areaType: AvoidAreaType): AvoidArea {
        unsafe {
            var cAvoidArea: CAvoidArea = CAvoidArea(false, CRect(0, 0, 0, 0), CRect(0, 0, 0, 0), CRect(0, 0, 0, 0),
                CRect(0, 0, 0, 0))
            let code = FFiOHOSWindowGetWindowAvoidArea(getID(), areaType.getValue(), inout cAvoidArea)
            checkRet(code, "[Window] getWindowAvoidArea: ")
            return AvoidArea(cAvoidArea)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setAspectRatio(ratio: Float64): Unit {
        let code = unsafe { FFiOHOSWindowSetAspectRatio(getID(), ratio) }
        checkRet(code, "[Window] setAspectRatio: ")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func resetAspectRatio(): Unit {
        let code = unsafe { FFiOHOSWindowResetAspectRatio(getID()) }
        checkRet(code, "[Window] resetAspectRatio: ")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowColorSpace(colorSpace: ColorSpace): Unit {
        unsafe {
            let ret = FFiOHOSWindowSetWindowColorSpace(getID(), colorSpace.getValue())
            checkRet(ret, "[Window] setWindowColorSpace: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func minimize(): Unit {
        unsafe {
            let ret = FFiOHOSWindowMinimize(getID())
            checkRet(ret, "[Window] minimize: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowColorSpace(): ColorSpace {
        unsafe {
            var errCode: Int32 = 0
            let res = FFiOHOSWindowGetWindowColorSpace(getID(), inout errCode)
            checkRet(errCode, "[Window] getWindowColorSpace: ")
            return ColorSpace.parse(Int32(res))
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func snapshot(): PixelMap {
        unsafe {
            var errCode: Int32 = 0
            let id = FFiOHOSWindowSnapshot(getID(), inout errCode)
            checkRet(errCode, "[Window] snapshot: ")
            return PixelMap(id)
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowSystemBarEnable(names: Array<String>): Unit {
        unsafe {
            let arr = toArrayCString(names)
            let ret = FFiOHOSWindowSetWindowSystemBarEnable(getID(), arr)
            freeArrCString(arr)
            checkRet(ret, "[Window] setWindowSystemBarEnable: ")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowSystemBarProperties(systemBarProperties: SystemBarProperties): Unit {
        unsafe {
            try (
                v1 = LibC.mallocCString(systemBarProperties.statusBarColor).asResource(),
                v2 = LibC.mallocCString(systemBarProperties.statusBarContentColor).asResource(),
                v3 = LibC.mallocCString(systemBarProperties.navigationBarColor).asResource(),
                v4 = LibC.mallocCString(systemBarProperties.navigationBarContentColor).asResource()
            ) {
                let properties = CJBarProperties(v1.value, systemBarProperties.isStatusBarLightIcon, v2.value, v3.value,
                    systemBarProperties.isNavigationBarLightIcon, v4.value, systemBarProperties.enableStatusBarAnimation,
                    systemBarProperties.enableNavigationBarAnimation)
                let ret = FFiOHOSWindowSetWindowSystemBarProperties(getID(), properties)
                checkRet(ret, "[Window] setWindowSystemBarProperties: ")
                properties.freeCStringMember()
            }
        }
    }

    func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Bool {
        for (item in list) {
            if (refEq(callback, item[0])) {
                return true
            }
        }
        false
    }

    func on(callbackType: String, callback: Callback0Argument): Unit {
        synchronized(registerMutex) {
            var v = callbackMaps.entryView(callbackType)
            if (v.value.isNone() || callbackType != "keyboardHeightChange") {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(v.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    => callback.invoke()
                }
                let registerCall = Callback0Param<Unit>(wrapper)
            }
        }
    }

    func on(_: String, _: Callback1Argument<Size>): Unit {
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: String, callback: Callback1Argument<UInt32>): Unit {
        synchronized(registerMutex) {
            var v = callbackMaps.entryView(callbackType)
            if (v.value.isNone() || callbackType != "keyboardHeightChange") {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(v.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<UInt32>(data).read()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let ret = FfiOHOSOnKeyboardHeightChange(getID(), registerCall.getID())
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                v.value.getOrThrow().add((callback, registerCall.getID()))
            }
        }
    }

    func on(_: String, _: Callback1Argument<WindowEventType>): Unit {
    }

    func on(_: String, _: Callback1Argument<Bool>): Unit {
    }

    func on(_: String, _: Callback1Argument<WindowStatusType>): Unit {
    }

    func on(_: String, _: Callback1Argument<TitleButtonRect>): Unit {
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: String): Unit {
        synchronized(registerMutex) {
            var v = callbackMaps.entryView(callbackType)
            if (v.value.isNone() || callbackType != "keyboardHeightChange") {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            unsafe {
                let ret = FfiOHOSOffKeyboardHeightChange(getID())
                checkRet(ret, "[Window] Unregister ${callbackType} failed: ")
                v.value.getOrThrow().clear()
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<Size>): Unit {
        match (callbackType) {
            case WindowSizeChange => onWindowSizeChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowSizeChange(callbackType: String, callback: Callback1Argument<Size>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<CSize>(data).read().toSize()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<Size>): Unit {
        match (callbackType) {
            case WindowSizeChange => commonUnregister<Callback1Argument<Size>>(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<AvoidAreaOptions>): Unit {
        match (callbackType) {
            case WindowAvoidAreaChange => onAvoidAreaChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onAvoidAreaChange(callbackType: String, callback: Callback1Argument<AvoidAreaOptions>): Unit {
        synchronized(registerMutex) {
            var value = callbackMaps.entryView(callbackType)
            if (value.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(value.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<CAvoidAreaOptions>(data).read().toAvoidAreaOptions()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                value.value.getOrThrow().add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<AvoidAreaOptions>): Unit {
        match (callbackType) {
            case WindowAvoidAreaChange => commonUnregister<Callback1Argument<AvoidAreaOptions>>(callbackType.toString(),
                callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit {
        match (callbackType) {
            case KeyboardHeightChange => onKeyboardHeightChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onKeyboardHeightChange(callbackType: String, callback: Callback1Argument<UInt32>): Unit {
        synchronized(registerMutex) {
            var value = callbackMaps.entryView(callbackType)
            if (value.value.isNone() || callbackType != "keyboardHeightChange") {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(value.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<UInt32>(data).read()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                value.value.getOrThrow().add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<UInt32>): Unit {
        match (callbackType) {
            case KeyboardHeightChange => commonUnregister<Callback1Argument<UInt32>>(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback0Argument): Unit {
        match (callbackType) {
            case TouchOutside | Screenshot | DialogTargetTouch | SubWindowClose => onCallbackUnit(
                callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onCallbackUnit(callbackType: String, callback: Callback0Argument): Unit {
        synchronized(registerMutex) {
            var value = callbackMaps.entryView(callbackType)
            if (value.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(value.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> => callback.invoke()
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                WindowLibLog.info("[Window] QDY screenshot ${registerCall.getID()}")
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                value.value.getOrThrow().add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback0Argument): Unit {
        match (callbackType) {
            case TouchOutside | Screenshot | DialogTargetTouch | SubWindowClose | NoInteractionDetected => commonUnregister<Callback0Argument>(
                callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, timeout: Int64, callback: Callback0Argument): Unit {
        match (callbackType) {
            case NoInteractionDetected => onNoInteractionDetected(callbackType.toString(), timeout, callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onNoInteractionDetected(callbackType: String, timeout: Int64, callback: Callback0Argument): Unit {
        synchronized(registerMutex) {
            var value = callbackMaps.entryView(callbackType)
            if (value.value.isNone() || callbackType != "noInteractionDetected") {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            if (findCallbackObject(value.value.getOrThrow(), callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> => callback.invoke()
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let ret = FfiOHOSOnNoInteractionDetected(getID(), timeout, registerCall.getID())
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                value.value.getOrThrow().add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<WindowEventType>): Unit {
        match (callbackType) {
            case WindowEvent => onWindowEvent(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowEvent(callbackType: String, callback: Callback1Argument<WindowEventType>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<Int32>(data).read()
                    callback.invoke(WindowEventType.parse(val))
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<WindowEventType>): Unit {
        match (callbackType) {
            case WindowEvent => commonUnregister<Callback1Argument<WindowEventType>>(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<Bool>): Unit {
        match (callbackType) {
            case WindowVisibilityChange => onWindowVisibilityChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowVisibilityChange(callbackType: String, callback: Callback1Argument<Bool>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<Bool>(data).read()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<Bool>): Unit {
        match (callbackType) {
            case WindowVisibilityChange => commonUnregister<Callback1Argument<Bool>>(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<WindowStatusType>): Unit {
        match (callbackType) {
            case WindowStatusChange => onWindowStatusChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowStatusChange(callbackType: String, callback: Callback1Argument<WindowStatusType>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<Int32>(data).read()
                    callback.invoke(WindowStatusType.parse(val))
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<WindowStatusType>): Unit {
        match (callbackType) {
            case WindowStatusChange => commonUnregister<Callback1Argument<WindowStatusType>>(callbackType.toString(),
                callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<TitleButtonRect>): Unit {
        match (callbackType) {
            case WindowTitleButtonRectChange => onWindowTitleButtonRectChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowTitleButtonRectChange(callbackType: String, callback: Callback1Argument<TitleButtonRect>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<CTitleButtonRect>(data).read().toTitleButtonRect()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<TitleButtonRect>): Unit {
        match (callbackType) {
            case WindowTitleButtonRectChange => commonUnregister<Callback1Argument<TitleButtonRect>>(
                callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func on(callbackType: WindowCallbackType, callback: Callback1Argument<RectChangeOptions>): Unit {
        match (callbackType) {
            case WindowRectChange => onWindowRectChange(callbackType.toString(), callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func onWindowRectChange(callbackType: String, callback: Callback1Argument<RectChangeOptions>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[Window] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<CRectChangeOptions>(data).read().toRectChangeOptions()
                    callback.invoke(val)
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOnCallback(getID(), registerCall.getID(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Register ${callbackType} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType, callback: Callback1Argument<RectChangeOptions>): Unit {
        match (callbackType) {
            case WindowRectChange => commonUnregister<Callback1Argument<RectChangeOptions>>(callbackType.toString(),
                callback)
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func off(callbackType: WindowCallbackType): Unit {
        match (callbackType) {
            case WindowRectChange | WindowTitleButtonRectChange | WindowStatusChange | WindowEvent | WindowSizeChange
                | KeyboardHeightChange | TouchOutside | SubWindowClose | DialogTargetTouch | Screenshot
                | NoInteractionDetected | WindowVisibilityChange | WindowAvoidAreaChange => commonUnregister(
                callbackType.toString())
            case _ => throw IllegalArgumentException("Invalid param.")
        }
    }

    func commonUnregister(callbackType: String): Unit {
        synchronized(registerMutex) {
            var value = callbackMaps.entryView(callbackType)
            if (value.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            unsafe {
                var callbackTypeCString = LibC.mallocCString(callbackType)
                let ret = FfiOHOSOffCallback(getID(), -1, callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Unregister ${callbackType} failed: ")
                value.value.getOrThrow().clear()
            }
        }
    }

    func commonUnregister<T>(callbackType: String, callback: T): Unit where T <: CallbackObject {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[Window] Invalid param.")
                return
            }
            var callbackId: Option<Int64> = None
            var callbackList = callbackEntryView.value.getOrThrow()
            for (idx in 0..callbackList.size) {
                if (refEq(callback, callbackList[idx][0])) {
                    callbackId = callbackList[idx][1]
                    callbackList.remove(idx..idx + 1)
                    break
                }
            }
            if (callbackId.isNone()) {
                WindowLibLog.info("[Window] The callback object not exists.")
                return
            }
            unsafe {
                var callbackTypeCString = LibC.mallocCString(callbackType)
                WindowLibLog.info("[Window] The callback QDY id = ${callbackId.getOrThrow()}")
                let ret = FfiOHOSOffCallback(getID(), callbackId.getOrThrow(), callbackTypeCString)
                callbackTypeCString.free()
                checkRet(ret, "[Window] Unregister ${callbackType} failed: ")
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setSubWindowModal(isModal: Bool): Unit {
        unsafe {
            let ret = FfiOHOSSetSubWindowModal(getID(), isModal)
            checkRet(ret, "[Window] setSubWindowModal: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func isFocused(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let ret = FfiOHOSIsFocused(getID(), inout errCode)
            checkRet(errCode, "[Window] IsFocused: ")
            return ret
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowLimits(windowLimits: WindowLimits): WindowLimits {
        unsafe {
            var cWindowLimits: CWindowLimits = CWindowLimits(UInt32.Max, UInt32.Max, 1, 1)
            let ret = FfiOHOSSetWindowLimits(getID(), windowLimits.toExternal(), inout cWindowLimits)
            checkRet(ret, "[Window] setWindowLimits: ")
            return WindowLimits(cWindowLimits)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowLimits(): WindowLimits {
        unsafe {
            var cWindowLimits: CWindowLimits = CWindowLimits(UInt32.Max, UInt32.Max, 1, 1)
            let code = FfiOHOSGetWindowLimits(getID(), inout cWindowLimits)
            checkRet(code, "[Window] getWindowAvoidArea: ")
            return WindowLimits(cWindowLimits)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getImmersiveModeEnabledState(): Bool {
        unsafe {
            var errCode: Int32 = 0
            let ret = FfiOHOSGetImmersiveModeEnabledState(getID(), inout errCode)
            checkRet(errCode, "[Window] getImmersiveModeEnabledState: ")
            return ret
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setImmersiveModeEnabledState(enabled: Bool): Unit {
        unsafe {
            let ret = FfiOHOSSetImmersiveModeEnabledState(getID(), enabled)
            checkRet(ret, "[Window] setImmersiveModeEnabledState: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func keepKeyboardOnFocus(keepKeyboardFlag: Bool): Unit {
        unsafe {
            let ret = FfiOHOSKeepKeyboardOnFocus(getID(), keepKeyboardFlag)
            checkRet(ret, "[Window] keepKeyboardOnFocus: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowDecorHeight(): Int32 {
        unsafe {
            var height: Int32 = 0
            let ret = FfiOHOSGetWindowDecorHeight(getID(), inout height)
            checkRet(ret, "[Window] getWindowDecorHeight: ")
            return ret
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowDecorHeight(height: Int32): Unit {
        unsafe {
            let ret = FfiOHOSSetWindowDecorHeight(getID(), height)
            checkRet(ret, "[Window] setWindowDecorHeight: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func recover(): Unit {
        unsafe {
            let ret = FfiOHOSRecover(getID())
            checkRet(ret, "[Window] Recover: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowDecorVisible(isVisible: Bool): Unit {
        unsafe {
            let ret = FfiOHOSSetWindowDecorVisible(getID(), isVisible)
            checkRet(ret, "[Window] setWindowDecorVisible: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getTitleButtonRect(): TitleButtonRect {
        unsafe {
            var cTitleButtonRect: CTitleButtonRect = CTitleButtonRect(0, 0, 0, 0)
            let ret = FfiOHOSGetTitleButtonRect(getID(), inout cTitleButtonRect)
            checkRet(ret, "[Window] getWindowDecorHeight: ")
            return TitleButtonRect(cTitleButtonRect)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setDialogBackGestureEnabled(enabled: Bool): Unit {
        unsafe {
            let ret = FfiOHOSSetDialogBackGestureEnabled(getID(), enabled)
            checkRet(ret, "[Window] setDialogBackGestureEnabled: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func disableLandscapeMultiWindow(): Unit {
        unsafe {
            let ret = FfiOHOSDisableLandscapeMultiWindow(getID())
            checkRet(ret, "[Window] disableLandscapeMultiWindow: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func enableLandscapeMultiWindow(): Unit {
        unsafe {
            let ret = FfiOHOSEnableLandscapeMultiWindow(getID())
            checkRet(ret, "[Window] enableLandscapeMultiWindow: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setWindowGrayScale(grayScale: Float32): Unit {
        unsafe {
            let ret = FfiOHOSSetWindowGrayScale(getID(), grayScale)
            checkRet(ret, "[Window] setWindowGrayScale: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func setSpecificSystemBarEnabled(name: SpecificSystemBar, enable: Bool, enableAnimation: Bool): Unit {
        unsafe {
            let ret = FfiOHOSSpecificSystemBarEnabled(getID(), name.getValue(), enable, enableAnimation)
            checkRet(ret, "[Window] setSpecificSystemBarEnabled: ")
        }
    }

    func getCJBarProperties(): CJBarProperties {
        var v1: ?CString = None
        var v2: ?CString = None
        var v3: ?CString = None
        var v4: ?CString = None
        unsafe {
            try {
                v1 = LibC.mallocCString("")
                v2 = LibC.mallocCString("")
                v3 = LibC.mallocCString("")
                v4 = LibC.mallocCString("")
                CJBarProperties(v1.getOrThrow(), false, v2.getOrThrow(), v3.getOrThrow(), false, v4.getOrThrow(), false,
                    false)
            } catch (e: Exception) {
                v1?.free()
                v2?.free()
                v3?.free()
                v4?.free()
                throw e
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowSystemBarProperties(): SystemBarProperties {
        var systemBarProperties: CJBarProperties = getCJBarProperties()
        unsafe {
            let ret = FfiOHOSGetWindowSystemBarProperties(getID(), inout systemBarProperties)
            checkRet(ret, "[Window] getWindowSystemBarProperties: ")
            let res =  SystemBarProperties(systemBarProperties)
            systemBarProperties.freeCStringMember()
            res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getPreferredOrientation(): Orientation {
        unsafe {
            var errCode: Int32 = 0
            let ret = FfiOHOSGetPreferredOrientation(getID(), inout errCode)
            checkRet(errCode, "[Window] getPreferredOrientation: ")
            return Orientation.parse(ret)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getWindowStatus(): WindowStatusType {
        unsafe {
            var errCode: Int32 = 0
            let ret = FfiOHOSGetWindowStatus(getID(), inout errCode)
            checkRet(errCode, "[Window] getWindowStatus: ")
            return WindowStatusType.parse(ret)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func maximize(presentation!: MaximizePresentation = MaximizePresentation.ENTER_IMMERSIVE): Unit {
        unsafe {
            let ret = FfiOHOSMaximize(getID(), presentation.getValue())
            checkRet(ret, "[Window] maximize: ")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func createSubWindowWithOptions(name: String, option: SubWindowOptions): Window {
        unsafe {
            let cname = LibC.mallocCString(name)
            var cOption = option.toExternal()
            let ret = FfiOHOSCreateSubWindowWithOptions(getID(), cname, cOption)
            LibC.free(cOption.title)
            LibC.free(cname)
            checkRet(ret.code, "[WindowStage] create subwindow: ")
            getOrCreate(Window.instanceMap, ret.data, {id: Int64 => Window(id)})
        }
    }
}
