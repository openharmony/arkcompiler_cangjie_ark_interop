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

package ohos.ui_test

import std.convert.Parsable
import ohos.encoding.json.*
import std.convert.*
import std.sync.*
import ohos.base.*
import ohos.hilog.*
import ohos.system_parameter_enhance.*
import ohos.ability_delegator_registry.*
import ohos.ability.*
import ohos.bundle_manager.ApplicationInfo
import ohos.labels.*
import ohos.ffi.*

let SETUP_CALLED = AtomicBool(false)
let TEST_LOG = HilogChannel(3, 0xD003100, "CJ-UITEST")

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class UITest {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public static func setup(): Unit {
        if (!SETUP_CALLED.compareAndSwap(false, true)) {
            return
        }
        let testEnable = Systemparameter.get(TESTMODE_ENABLE, def: "0")
        if (testEnable != "1") {
            TEST_LOG.warn("UiTestKit_exporter: systemParameter \"${TESTMODE_ENABLE}\" is not set!")
        }
        let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let appCtx = delegator.getAppContext()
        // used to start server & client
        let token = "${appCtx.getApplicationInfo().name}@${Process.pid}@${Process.uid}@${appCtx.getArea()}"
        // start client
        try (ctoken = unsafe { LibC.mallocCString(token) }.asResource()) {
            unsafe { CJ_InitConnection(ctoken.value) }
        }
        // start server
        let result = delegator.executeShellCommand("uitest start-daemon ${token}", 3)
        if (result.getExitCode() != 0) {
            TEST_LOG.error("uitest setup failed")
        }
    }
}

func getData(params: ApiCallParams, api: String): String {
    let ret = unsafe { CJ_ApiCall(params) }
    params.free()
    let dataOrMessage = ret.data.toString()
    unsafe { LibC.free(ret.data) }
    if (ret.code != 0) {
        throw BusinessException(ret.code, "${api} failed: ${dataOrMessage}")
    }
    return dataOrMessage
}

func releaseRef(ref: String) {
    unsafe {
        try (cref = LibC.mallocCString(ref).asResource()) {
            CJ_UITestObjDelete(cref.value)
        }
    }
}

func checkRef(ref: String) {
    if (!ref.contains("#")) {
        throw BusinessException(OBJ_LOST, "obj create return null reference")
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class Driver {
    Driver(let ref: String) {
        checkRef(ref)
    }

    ~init() {
        releaseRef(ref)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public static func create(): Driver {
        let cjCallParams = ApiCallParams(DRIVER_CREATE, "", EMPTY_PARAM)
        let data = getData(cjCallParams, DRIVER_CREATE)
        return Driver(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func delayMs(delayMs: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_DELAYMS, ref, "[${delayMs}]")
        getData(cjCallParams, DRIVER_DELAYMS)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func findComponent(on: On): UIComponent {
        let cjCallParams = ApiCallParams(DRIVER_FINDCOMPONENT, ref, "[\"${on.ref}\"]")
        let data = getData(cjCallParams, DRIVER_FINDCOMPONENT)
        return UIComponent(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func findComponents(on: On): Array<UIComponent> {
        let cjCallParams = ApiCallParams(DRIVER_FINDCOMPONENTS, ref, "[\"${on.ref}\"]")
        let data = getData(cjCallParams, DRIVER_FINDCOMPONENTS)
        let jsonArr = JsonValue.fromStr(data).asArray()
        let arr = Array<UIComponent>(
            jsonArr.size(),
            {
                i => UIComponent(
                    jsonArr.get(i).getOrThrow({=> BusinessException(OBJ_LOST, "wrong component")}).asString().getValue())
            }
        )
        return arr
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func findWindow(filter: WindowFilter): UiWindow {
        let params: StringBuilder = StringBuilder("[{")
        var temp = false
        if (let Some(v) <- filter.bundleName) {
            params.append("\"bundleName\":\"${v}\"")
            temp = true
        }
        if (let Some(v) <- filter.title) {
            if (temp) {
                params.append(",")
            }
            params.append("\"title\":\"${v}\"")
            temp = true
        }
        if (let Some(v) <- filter.focused) {
            if (temp) {
                params.append(",")
            }
            params.append("\"focused\":${v}")
            temp = true
        }
        if (let Some(v) <- filter.active) {
            if (temp) {
                params.append(",")
            }
            params.append("\"active\":${v}")
        }
        params.append("}]")
        let cjCallParams = ApiCallParams(DRIVER_FINDWINDOW, ref, params.toString())
        let data = getData(cjCallParams, DRIVER_FINDWINDOW)
        return UiWindow(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func waitForComponent(on: On, time: Int32): UIComponent {
        let cjCallParams = ApiCallParams(DRIVER_WAITFORCOMPONENT, ref, "[\"${on.ref}\",${time}]")
        let data = getData(cjCallParams, DRIVER_WAITFORCOMPONENT)
        return UIComponent(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func assertComponentExist(on: On): Unit {
        let cjCallParams = ApiCallParams(DRIVER_ASSERTCOMPONENTEXIST, ref, "[\"${on.ref}\"]")
        getData(cjCallParams, DRIVER_ASSERTCOMPONENTEXIST)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func pressBack(): Unit {
        let cjCallParams = ApiCallParams(DRIVER_PRESSBACK, ref, EMPTY_PARAM)
        getData(cjCallParams, DRIVER_PRESSBACK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func triggerKey(keyCode: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_TRIGGERKEY, ref, "[${keyCode}]")
        getData(cjCallParams, DRIVER_TRIGGERKEY)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func triggerCombineKeys(key0: Int32, key1: Int32, key2!: Option<Int32> = None): Unit {
        let params: StringBuilder = StringBuilder("[${key0},${key1}")
        if (let Some(v) <- key2) {
            params.append(",${v}")
        }
        params.append("]")
        let cjCallParams = ApiCallParams(DRIVER_TRIGGERCOMBINEKEYS, ref, params.toString())
        getData(cjCallParams, DRIVER_TRIGGERCOMBINEKEYS)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func click(x: Int32, y: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_CLICK, ref, "[${x},${y}]")
        getData(cjCallParams, DRIVER_CLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func doubleClick(x: Int32, y: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_DOUBLECLICK, ref, "[${x},${y}]")
        getData(cjCallParams, DRIVER_DOUBLECLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func longClick(x: Int32, y: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_LONGCLICK, ref, "[${x},${y}]")
        getData(cjCallParams, DRIVER_LONGCLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func swipe(
        startx: Int32,
        starty: Int32,
        endx: Int32,
        endy: Int32,
        speed!: Int32 = 600
    ): Unit {
        let params = "[${startx},${starty},${endx},${endy},${speed}]"
        let cjCallParams = ApiCallParams(DRIVER_SWIPE, ref, params)
        getData(cjCallParams, DRIVER_SWIPE)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func drag(
        startx: Int32,
        starty: Int32,
        endx: Int32,
        endy: Int32,
        speed!: Int32 = 600
    ): Unit {
        let params = "[${startx},${starty},${endx},${endy},${speed}]"
        let cjCallParams = ApiCallParams(DRIVER_DRAG, ref, params)
        getData(cjCallParams, DRIVER_DRAG)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func screenCap(savePath: String): Bool {
        let cjCallParams = ApiCallParams(DRIVER_SCREENCAP, ref, "[\"${eatEscape(savePath)}\"]")
        let data = getData(cjCallParams, DRIVER_SCREENCAP)
        return Bool.parse(data)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func setDisplayRotation(rotation: DisplayRotation): Unit {
        let cjCallParams = ApiCallParams(DRIVER_SETDISPLAYROTATION, ref, "[${rotation.getValue()}]")
        getData(cjCallParams, DRIVER_SETDISPLAYROTATION)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getDisplayRotation(): DisplayRotation {
        let cjCallParams = ApiCallParams(DRIVER_GETDISPLAYROTATION, ref, EMPTY_PARAM)
        let data = getData(cjCallParams, DRIVER_GETDISPLAYROTATION)
        return DisplayRotation.parse(data)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func setDisplayRotationEnabled(enabled: Bool): Unit {
        let cjCallParams = ApiCallParams(DRIVER_SETDISPLAYROTATIONENABLED, ref, "[${enabled}]")
        getData(cjCallParams, DRIVER_SETDISPLAYROTATIONENABLED)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getDisplaySize(): Point {
        let cjCallParams = ApiCallParams(DRIVER_GETDISPLAYSIZE, ref, EMPTY_PARAM)
        let data = getData(cjCallParams, DRIVER_GETDISPLAYSIZE)
        Point(data)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getDisplayDensity(): Point {
        let cjCallParams = ApiCallParams(DRIVER_GETDISPLAYDENSITY, ref, EMPTY_PARAM)
        let data = getData(cjCallParams, DRIVER_GETDISPLAYDENSITY)
        Point(data)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func wakeUpDisplay(): Unit {
        let cjCallParams = ApiCallParams(DRIVER_WAKEUPDISPLAY, ref, EMPTY_PARAM)
        getData(cjCallParams, DRIVER_WAKEUPDISPLAY)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func pressHome(): Unit {
        let cjCallParams = ApiCallParams(DRIVER_PRESSHOME, ref, EMPTY_PARAM)
        getData(cjCallParams, DRIVER_PRESSHOME)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func waitForIdle(idleTime: Int32, timeout: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_WAITFORIDLE, ref, "[${idleTime},${timeout}]")
        getData(cjCallParams, DRIVER_WAITFORIDLE)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func injectMultiPointerAction(pointers: PointerMatrix, speed!: Int32 = 600): Bool {
        let cjCallParams = ApiCallParams(DRIVER_INJECTMULTIPOINTERACTION, ref, "[\"${pointers.ref}\",${speed}]")
        let data = getData(cjCallParams, DRIVER_INJECTMULTIPOINTERACTION)
        return Bool.parse(data)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func fling(fromP: Point, to: Point, stepLen: Int32, speed: Int32): Unit {
        let params: String = "[{\"x\":${fromP.x},\"y\":${fromP.y}},{\"x\":${to.x},\"y\":${to.y}},${stepLen},${speed}]"
        let cjCallParams = ApiCallParams(DRIVER_FLING, ref, params)
        getData(cjCallParams, DRIVER_FLING)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func fling(direction: UiDirection, speed: Int32): Unit {
        let cjCallParams = ApiCallParams(DRIVER_FLING, ref, "[${direction.getValue()},${speed}]")
        getData(cjCallParams, DRIVER_FLING)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func screenCapture(savePath: String, rect!: Option<Rect> = None): Bool {
        let params: StringBuilder = StringBuilder("[\"${eatEscape(savePath)}\"")
        if (let Some(v) <- rect) {
            params.append(",")
            params.append("{\"left\":${v.left},\"top\":${v.top},\"right\":${v.right},\"bottom\":${v.bottom}}")
        }
        params.append("]")
        let cjCallParams = ApiCallParams(DRIVER_SCREENCAPTURE, ref, params.toString())
        let data = getData(cjCallParams, DRIVER_SCREENCAPTURE)
        return Bool.parse(data)
    }

    func parseClickParam(p: Point, btnId: MouseButton, key1: Option<Int32>, key2: Option<Int32>): String {
        let params: StringBuilder = StringBuilder("[{\"x\":${p.x},\"y\":${p.y}},${btnId.getValue()}")
        if (let Some(v) <- key1) {
            params.append(",${v}")
        }
        if (let Some(v) <- key2) {
            params.append(",${v}")
        }
        params.append("]")
        params.toString()
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit {
        let cjCallParams = ApiCallParams(DRIVER_MOUSECLICK, ref, parseClickParam(p, btnId, key1, key2))
        getData(cjCallParams, DRIVER_MOUSECLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseMoveTo(p: Point): Unit {
        let cjCallParams = ApiCallParams(DRIVER_MOUSEMOVETO, ref, "[{\"x\":${p.x},\"y\":${p.y}}]")
        getData(cjCallParams, DRIVER_MOUSEMOVETO)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func createUIEventObserver(): UIEventObserver {
        let cjCallParams = ApiCallParams(DRIVER_CREATEUIEVENTOBSERVER, ref, EMPTY_PARAM)
        let data = getData(cjCallParams, DRIVER_CREATEUIEVENTOBSERVER)
        return UIEventObserver(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseScroll(p: Point, down: Bool, d: Int32, key1!: Option<Int32> = None, key2!: Option<Int32> = None,
        speed!: Int32 = 20): Unit {
        let params: StringBuilder = StringBuilder("[{\"x\":${p.x},\"y\":${p.y}},${down},${d}")
        if (let Some(v) <- key1) {
            params.append(",${v}")
        }
        if (let Some(v) <- key2) {
            params.append(",${v}")
        }
        params.append(",${speed}]")
        let cjCallParams = ApiCallParams(DRIVER_MOUSESCROLL, ref, params.toString())
        getData(cjCallParams, DRIVER_MOUSESCROLL)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseDoubleClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit {
        let cjCallParams = ApiCallParams(DRIVER_MOUSEDOUBLECLICK, ref, parseClickParam(p, btnId, key1, key2))
        getData(cjCallParams, DRIVER_MOUSEDOUBLECLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseLongClick(p: Point, btnId: MouseButton, key1!: Option<Int32> = None, key2!: Option<Int32> = None): Unit {
        let cjCallParams = ApiCallParams(DRIVER_MOUSELONGCLICK, ref, parseClickParam(p, btnId, key1, key2))
        getData(cjCallParams, DRIVER_MOUSELONGCLICK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseMoveWithTrack(fromP: Point, to: Point, speed!: Int32 = 600): Unit {
        let params = "[{\"x\":${fromP.x},\"y\":${fromP.y}},{\"x\":${to.x},\"y\":${to.y}},${speed}]"
        let cjCallParams = ApiCallParams(DRIVER_MOUSEMOVEWITHTRACK, ref, params)
        getData(cjCallParams, DRIVER_MOUSEMOVEWITHTRACK)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func mouseDrag(fromP: Point, to: Point, speed!: Int32 = 600): Unit {
        let params = "[{\"x\":${fromP.x},\"y\":${fromP.y}},{\"x\":${to.x},\"y\":${to.y}},${speed}]"
        let cjCallParams = ApiCallParams(DRIVER_MOUSEDRAG, ref, params)
        getData(cjCallParams, DRIVER_MOUSEDRAG)
        return
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func inputText(p: Point, text: String): Unit {
        let params: String = "[{\"x\":${p.x},\"y\":${p.y}},\"${eatEscape(text)}\"]"
        let cjCallParams = ApiCallParams(DRIVER_INPUTTEXT, ref, params)
        getData(cjCallParams, DRIVER_INPUTTEXT)
        return
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class PointerMatrix {
    PointerMatrix(public let ref: String) {
        checkRef(ref)
    }

    ~init() {
        releaseRef(ref)
    }

    /**
     * @brief  static create(fingers: number, steps: number): PointerMatrix
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public static func create(fingers: IntNative, steps: IntNative): PointerMatrix {
        let ffiParam = ApiCallParams(POINTERMATRIX_CREATE, "", "[${fingers},${steps}]")
        let data = getData(ffiParam, POINTERMATRIX_CREATE)
        return PointerMatrix(data[1..data.size - 1])
    }

    /**
     * @brief  setPoint(finger: number, step: number, point: Point): void
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func setPoint(fingers: IntNative, steps: IntNative, point: Point): Unit {
        let ffiParam = ApiCallParams(POINTERMATRIX_SETPOINT, ref,
            "[${fingers},${steps},{\"x\":${point.x},\"y\":${point.y}}]")
        getData(ffiParam, POINTERMATRIX_SETPOINT)
        return
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class UiWindow {
    UiWindow(public let ref: String) {
        checkRef(ref)
    }

    ~init() {
        releaseRef(ref)
    }

    /**
     * @brief  getBundleName(): Promise<string>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getBundleName(): String {
        let ffiParam = ApiCallParams(UIWINDOW_GETBUNDLENAME, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_GETBUNDLENAME)
        return data[1..data.size - 1]
    }

    /**
     * @brief  getBounds(): Promise<Rect>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getBounds(): Rect {
        let ffiParam = ApiCallParams(UIWINDOW_GETBOUNDS, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_GETBOUNDS)
        let jsonValue = JsonValue.fromStr(data)
        let jsonObject = jsonValue.asObject()
        let numBottom = IntNative(jsonObject.get(STRING_BOTTOM).getOrThrow().asInt().getValue())
        let numLeft = IntNative(jsonObject.get(STRING_LEFT).getOrThrow().asInt().getValue())
        let numRight = IntNative(jsonObject.get(STRING_RIGHT).getOrThrow().asInt().getValue())
        let numTop = IntNative(jsonObject.get(STRING_TOP).getOrThrow().asInt().getValue())
        return Rect(numLeft, numTop, numRight, numBottom)
    }

    /**
     * @brief  getTitle(): Promise<string>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getTitle(): String {
        let ffiParam = ApiCallParams(UIWINDOW_GETTITLE, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_GETTITLE)
        return data[1..data.size - 1]
    }

    /**
     * @brief  getWindowMode(): Promise<WindowMode>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getWindowMode(): WindowMode {
        let ffiParam = ApiCallParams(UIWINDOW_GETWINDOWMODE, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_GETWINDOWMODE)
        return WindowMode.parse(data)
    }

    /**
     * @brief  isFocused(): Promise<boolean>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isFocused(): Bool {
        let ffiParam = ApiCallParams(UIWINDOW_ISFOCUSED, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_ISFOCUSED)
        Bool.parse(data)
    }

    /**
     * @brief  focus(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func focus(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_FOCUS, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_FOCUS)
        return
    }

    /**
     * @brief  moveTo(x: number, y: number): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func moveTo(x: IntNative, y: IntNative): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_MOVETO, ref, "[${x},${y}]")
        getData(ffiParam, UIWINDOW_MOVETO)
        return
    }

    /**
     * @brief  resize(wide: number, height: number, direction: ResizeDirection): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func resize(wide: IntNative, height: IntNative, direction: ResizeDirection): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_RESIZE, ref, "[${wide},${height},${direction.getValue()}]")
        getData(ffiParam, UIWINDOW_RESIZE)
        return
    }

    /**
     * @brief  split(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func split(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_SPLIT, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_SPLIT)
        return
    }

    /**
     * @brief  maximize(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func maximize(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_MAXIMIZE, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_MAXIMIZE)
        return
    }

    /**
     * @brief  minimize(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func minimize(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_MINIMIZE, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_MINIMIZE)
        return
    }

    /**
     * @brief  resume(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func resume(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_RESUME, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_RESUME)
        return
    }

    /**
     * @brief  close(): Promise<void>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func close(): Unit {
        let ffiParam = ApiCallParams(UIWINDOW_CLOSE, ref, EMPTY_PARAM)
        getData(ffiParam, UIWINDOW_CLOSE)
        return
    }

    /**
     * @brief  isActive(): Promise<boolean>
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isActive(): Bool {
        let ffiParam = ApiCallParams(UIWINDOW_ISACTIVE, ref, EMPTY_PARAM)
        let data = getData(ffiParam, UIWINDOW_ISACTIVE)
        Bool.parse(data)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class On {
    var ref: String = ON_SEED_REF

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public init() {}

    ~init() {
        releaseRef(ref)
    }

    func apiCall(id: String, param: String): String {
        let ffiParam = ApiCallParams(id, ref, param)
        getData(ffiParam, id)
    }

    func boolParamCall(id: String, b: Bool): String {
        let param = "[${b.toString()}]"
        let data = apiCall(id, param)
        return data[1..data.size - 1]
    }

    func toParamString(p: String): String {
        return "[\"${p}\"]"
    }

    /**
     * Specifies the text attribute of the target component. Multiple match patterns are supported.
     *
     * @param { String } txt - Component text, used to match the target component.
     * @param { MatchPattern } pattern - Match pattern. The default value is EQUALS.
     * @returns { On } On object that matches the text attribute of the target component.
     * @brief text(txt: string, pattern?: MatchPattern): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func text(txt: String, pattern!: MatchPattern = MatchPattern.EQUALS): On {
        let param = "[\"${eatEscape(txt)}\",${pattern.getValue()}]"
        let data = apiCall(ON_TEXT, param)
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies the ID attribute of the target component.
     *
     * @param { String } id - Component ID.
     * @returns { On } On object that matches the ID attribute of the target component.
     * @brief id(id: string): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func id(id: String): On {
        let data = apiCall(ON_ID, toParamString(eatEscape(id)))
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies the type attribute of the target component.
     *
     * @param { String } tp - Component type.
     * @returns { On } On object that matches the type attribute of the target component.
     * @brief type(tp: string): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func onType(tp: String): On {
        let data = apiCall(ON_TYPE, toParamString(eatEscape(tp)))
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies the description for the target Component.
     *
     * @param { String } val - the description value.
     * @param { MatchPattern } [pattern] - the {@link MatchPattern} of description value,set it default {@link MatchPattern.EQUALS} if null or undefined.
     * @returns { On } this {@link On} object.
     * @throws { BusinessError } 401 - if the input parameters are invalid.
     * @brief description(val: string, pattern?: MatchPattern): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func description(val: String, pattern!: ?MatchPattern = None): On {
        let param = StringBuilder("[\"${eatEscape(val)}\"")
        if (let Some(v) <- pattern) {
            param.append(",${v.getValue()}")
        }
        param.append("]")
        let data = apiCall(ON_DESCRIPTION, param.toString())
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies the clickable attribute of the target component.
     *
     * @param { Bool } b - Clickable status of the target component. The default value is true.
     *                     true: clickable; false: not clickable.
     * @returns { On } On object that matches the clickable attribute of the target component.
     * @brief clickable(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func clickable(b!: Bool = true): On {
        ref = boolParamCall(ON_CLICKABLE, b)
        this
    }

    /**
     * Specifies the long-clickable attribute of the target component.
     *
     * @param { Bool } b - Long-clickable status of the target component. The default value is true.
     *                     true: long-clickable; false: not long-clickable.
     * @returns { On } On object that matches the long-clickable attribute of the target component.
     * @brief longClickable(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func longClickable(b!: Bool = true): On {
        ref = boolParamCall(ON_LONG_CLICKABLE, b)
        this
    }

    /**
     * Specifies the scrollable attribute of the target component.
     *
     * @param { Bool } b - Scrollable status of the target component. The default value is true.
     *                     true: scrollable; false: not scrollable.
     * @returns { On } On object that matches the scrollable attribute of the target component.
     * @brief scrollable(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func scrollable(b!: Bool = true): On {
        ref = boolParamCall(ON_SCROLLABLE, b)
        this
    }

    /**
     * Specifies the enabled attribute of the target component.
     *
     * @param { Bool } b - Enabled status of the target component. The default value is true.
     *                     true: enabled; false: not enabled.
     * @returns { On } On object that matches the enabled attribute of the target component.
     * @brief enabled(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func enabled(b!: Bool = true): On {
        ref = boolParamCall(ON_ENABLED, b)
        this
    }

    /**
     * Specifies the focused attribute of the target component.
     *
     * @param { Bool } b - Focused status of the target component. The default value is true.
     *                     true: focused; false: not focused.
     * @returns { On } On object that matches the focused attribute of the target component.
     * @brief focused(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func focused(b!: Bool = true): On {
        ref = boolParamCall(ON_FOCUSED, b)
        this
    }

    /**
     * Specifies the selected attribute of the target component.
     *
     * @param { Bool } b - Selected status of the target component. The default value is true.
     *                     true: selected; false: not selected.
     * @returns { On } On object that matches the selected attribute of the target component.
     * @brief selected(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func selected(b!: Bool = true): On {
        ref = boolParamCall(ON_SELECTED, b)
        this
    }

    /**
     * Specifies the checked attribute of the target component.
     *
     * @param { Bool } b - Checked status of the target component. The default value is true.
     *                     true: checked; false: not checked.
     * @returns { On } On object that matches the checked attribute of the target component.
     * @brief checked(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func checked(b!: Bool = true): On {
        ref = boolParamCall(ON_CHECKED, b)
        this
    }

    /**
     * Specifies the checkable attribute of the target component.
     *
     * @param { Bool } b - Checkable status of the target component. The default value is true.
     *                     true: checkable; false: not checkable.
     * @returns { On } On object that matches the checkable attribute of the target component.
     * @brief checkable(b?: boolean): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func checkable(b!: Bool = true): On {
        ref = boolParamCall(ON_CHECKABLE, b)
        this
    }

    /**
     * Specifies that the target component is located before the given attribute component.
     *
     * @param { On } on - Information about the attribute component.
     * @returns { On } On object.
     * @brief isBefore(on: On): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isBefore(on: On): On {
        let data = apiCall(ON_IS_BEFORE, "[\"${on.ref}\"]")
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies that the target component is located after the given attribute component.
     *
     * @param { On } on - Information about the attribute component.
     * @returns { On } On object.
     * @brief isAfter(on: On): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isAfter(on: On): On {
        let data = apiCall(ON_IS_AFTER, "[\"${on.ref}\"]")
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies that the target component is located within the given attribute component.
     *
     * @param { On } on - Information about the attribute component.
     * @returns { On } On object.
     * @brief within(on: On): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func within(on: On): On {
        let data = apiCall(ON_WITHIN, "[\"${on.ref}\"]")
        ref = data[1..data.size - 1]
        this
    }

    /**
     * Specifies that the target component is located within the given application window.
     *
     * @param { String } bundleName - Bundle name of the application window.
     * @returns { On } On object.
     * @brief inWindow(bundleName: string): On
     */
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func inWindow(bundleName: String): On {
        let data = apiCall(ON_IN_WINDOW, toParamString(eatEscape(bundleName)))
        ref = data[1..data.size - 1]
        this
    }
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class UIEventObserver {
    UIEventObserver(let ref: String) {
        checkRef(ref)
    }

    ~init() {
        releaseRef(ref)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func onceToastShow(callback: (UIElementInfo) -> Unit): Unit {
        onceShow(TOAST, callback)
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func onceDialogShow(callback: (UIElementInfo) -> Unit): Unit {
        onceShow(DIALOG, callback)
    }

    func onceShow(api: String, callback: (UIElementInfo) -> Unit): Unit {
        unsafe {
            let wrapper = {
                cUIElementInfo: CUIElementInfo =>
                let info = UIElementInfo(cUIElementInfo)
                callback(info)
            }
            let param = ApiCallParams(OBSERVER_ONCE, this.ref,
                api + Callback1Param<CUIElementInfo, Unit>(wrapper).getID().toString() + "]")
            let ret = CJ_ApiCall(param)
            param.free()
            let dataOrMessage = ret.data.toString()
            LibC.free(ret.data)
            if (ret.code != 0) {
                throw BusinessException(ret.code, "${api} failed: ${dataOrMessage}")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Test.UiTest"
]
public class UIComponent {
    UIComponent(let ref: String) {
        checkRef(ref)
    }

    ~init() {
        releaseRef(ref)
    }

    func apiCall(id: String, param: String): String {
        let ffiParam = ApiCallParams(id, ref, param)
        getData(ffiParam, id)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func click(): Unit {
        apiCall(COMPONENT_CLICK, EMPTY_PARAM)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func doubleClick(): Unit {
        apiCall(COMPONENT_DOUBLE_CLICK, EMPTY_PARAM)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func longClick(): Unit {
        apiCall(COMPONENT_LONG_CLICK, EMPTY_PARAM)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getId(): String {
        let data = apiCall(COMPONENT_GET_ID, EMPTY_PARAM)
        return data[1..data.size - 1]
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getText(): String {
        let data = apiCall(COMPONENT_GET_TEXT, EMPTY_PARAM)
        return data[1..data.size - 1]
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getType(): String {
        let data = apiCall(COMPONENT_GET_TYPE, EMPTY_PARAM)
        return data[1..data.size - 1]
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getBounds(): Rect {
        let jsonStr = apiCall(COMPONENT_GET_BOUNDS, EMPTY_PARAM)
        return Rect(jsonStr)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getBoundsCenter(): Point {
        let jsonStr = apiCall(COMPONENT_GET_BOUNDSCENTER, EMPTY_PARAM)
        return Point(jsonStr)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isClickable(): Bool {
        let str = apiCall(COMPONENT_IS_CLICKABLE, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isLongClickable(): Bool {
        let str = apiCall(COMPONENT_IS_LONGCLICKABLE, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isChecked(): Bool {
        let str = apiCall(COMPONENT_IS_CHECKED, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isCheckable(): Bool {
        let str = apiCall(COMPONENT_IS_CHECKABLE, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isScrollable(): Bool {
        let str = apiCall(COMPONENT_IS_SCROLLABLE, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isEnabled(): Bool {
        let str = apiCall(COMPONENT_IS_ENABLED, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isFocused(): Bool {
        let str = apiCall(COMPONENT_IS_FOCUSED, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func isSelected(): Bool {
        let str = apiCall(COMPONENT_IS_SELECTED, EMPTY_PARAM)
        return Bool.parse(str)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func inputText(text: String): Unit {
        apiCall(COMPONENT_INPUT_TEXT, "[\"${eatEscape(text)}\"]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func clearText(): Unit {
        apiCall(COMPONENT_CLEAR_TEXT, EMPTY_PARAM)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func scrollSearch(on: On): UIComponent {
        let data = apiCall(COMPONENT_SCROLL_SEARCH, "[\"${on.ref}\"]")
        UIComponent(data[1..data.size - 1])
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func scrollToTop(speed!: Int64 = 600): Unit {
        apiCall(COMPONENT_SCROLL_TOTOP, "[${speed}]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func scrollToBottom(speed!: Int64 = 600): Unit {
        apiCall(COMPONENT_SCROLL_TOBOTTOM, "[${speed}]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func dragTo(target: UIComponent): Unit {
        apiCall(COMPONENT_DRAGTO, "[\"${target.ref}\"]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func pinchOut(scale: Float32): Unit {
        apiCall(COMPONENT_PINCHOUT, "[${scale.format(".16")}]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func pinchIn(scale: Float32): Unit {
        apiCall(COMPONENT_PINCHIN, "[${scale.format(".16")}]")
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Test.UiTest"
    ]
    public func getDescription(): String {
        let data = apiCall(COMPONENT_GET_DESCRIPTION, EMPTY_PARAM)
        return data[1..data.size - 1]
    }
}

func eatEscape(str: String): String {
    let tmp = StringBuilder()
    for (c in str.runes()) {
        let val = match (c) {
            case r'\t' => "\\t"
            case r'\b' => "\\b"
            case r'\r' => "\\r"
            case r'\n' => "\\n"
            case r'\f' => "\\f"
            case r'\v' => "\\v"
            case _ => "${c}"
        }
        tmp.append(val)
    }
    return tmp.toString()
}
