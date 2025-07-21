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

internal import ohos.ffi.*

public type WindowStageNativeHandler = Int64

foreign {
    func FfiOHOSBindWindowStage(handler: WindowStageNativeHandler): RetDataI64

    func FfiOHOSGetMainWindow(id: Int64): RetDataI64

    func FfiOHOSCreateSubWindow(id: Int64, name: CString): RetDataI64

    func FfiOHOSGetSubWindow(id: Int64): RetStruct

    func FfiOHOSLoadContent(id: Int64, path: CString): Int32

    func FfiOHOSLoadContentByName(id: Int64, name: CString): Int32

    func FfiOHOSDisableWindowDecor(id: Int64): Int32

    func FfiOHOSSetShowOnLockScreen(id: Int64, showOnLockScreen: Bool): Int32

    func FfiOHOSSetDefaultDensityEnabled(id: Int64, enabled: Bool): Int32

    func FfiOHOSStageOn(id: Int64, callbackId: Int64): Int32

    func FfiOHOSStageOff(id: Int64, callbackId: Int64): Int32

    func FfiOHOSCreateSubWindowWithOptionsStage(id: Int64, name: CString, title: CString, decorEnabled: Bool,
        isModal: Bool): RetDataI64
}

let stageRegisterMutex = Mutex()

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public class WindowStage <: RemoteDataLite {
    let callbackMaps = HashMap<String, ArrayList<(CallbackObject, Int64)>>(
        [("windowStageEvent", ArrayList<(CallbackObject, Int64)>())])
    protected init(windowStageHandler: WindowStageNativeHandler) {
        let ret = unsafe { FfiOHOSBindWindowStage(windowStageHandler) }
        checkRet(ret.code, "[WindowStage] bind WindowStage: ")
        dataInit(ret.data)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getMainWindow(): Window {
        unsafe {
            let ret = FfiOHOSGetMainWindow(getID())
            checkRet(ret.code, "[WindowStage] get mainwindow: ")
            getOrCreate(Window.instanceMap, ret.data, {id: Int64 => Window(id)})
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func createSubWindow(name: String): Window {
        unsafe {
            let cname = LibC.mallocCString(name)
            let ret = FfiOHOSCreateSubWindow(getID(), cname)
            LibC.free(cname)
            checkRet(ret.code, "[WindowStage] create subwindow: ")
            getOrCreate(Window.instanceMap, ret.data, {id: Int64 => Window(id)})
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getSubWindow(): Array<Window> {
        unsafe {
            var ret = FfiOHOSGetSubWindow(getID())
            checkRet(ret.code, "[WindowStage] get subWindow: ")
            let dataPtr = CPointer<Int64>(ret.data)
            let idArray = Array<Int64>(ret.len, {i => dataPtr.read(i)})
            LibC.free<Int64>(dataPtr)
            let result = Array<Window>(ret.len,
                {i => getOrCreate(Window.instanceMap, idArray[i], {id: Int64 => Window(id)})})
            return result
        }
    }

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func loadContent(path: String): Unit {
        unsafe {
            try (cpath = LibC.mallocCString(path).asResource()) {
                FfiOHOSLoadContent(getID(), cpath.value)
            }
        }
    }

    /**
     * @brief  loadContentByName(name: string, storage?: LocalStorage): Promise<void>
     */
    func loadContentByName(name: String): Unit {
        unsafe {
            try (cname = LibC.mallocCString(name).asResource()) {
                FfiOHOSLoadContentByName(getID(), cname.value)
            }
        }
    }

    /**
     * @brief  disableWindowDecor(): void
     */
    func disableWindowDecor(): Unit {
        let ret = unsafe { FfiOHOSDisableWindowDecor(getID()) }
        checkRet(ret, "[WindowStage] disableWindowDecor: ")
    }

    /**
     * @brief  setShowOnLockScreen(showOnLockScreen: boolean): void
     */
    func setShowOnLockScreen(showOnLockScreen: Bool): Unit {
        let ret = unsafe { FfiOHOSSetShowOnLockScreen(getID(), showOnLockScreen) }
        checkRet(ret, "[WindowStage] setShowOnLockScreen: ")
    }

    func onWindowStageEvent(callbackType: String, callback: Callback1Argument<WindowStageEventType>): Unit {
        synchronized(stageRegisterMutex) {
            var callbackEntryView = callbackMaps.entryView(callbackType)
            if (callbackEntryView.value.isNone()) {
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (findCallbackObject(callbackList, callback)) {
                WindowLibLog.info("[WindowStage] The callback object already exists.")
                return
            }
            unsafe {
                let wrapper = {
                    data: CPointer<Unit> =>
                    let val = CPointer<Int32>(data).read()
                    callback.invoke(WindowStageEventType.parse(val))
                }
                let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
                let ret = FfiOHOSStageOn(getID(), registerCall.getID())
                checkRet(ret, "[WindowStage] Register ${callbackType.toString()} failed: ")
                callbackList.add((callback, registerCall.getID()))
            }
        }
    }

    func offWindowStage(key: String, callback: ?Callback1Argument<WindowStageEventType>): Unit {
        synchronized(registerMutex) {
            var callbackEntryView = callbackMaps.entryView(key)
            if (callbackEntryView.value.isNone()) {
                WindowLibLog.error("[WindowStage] Invalid param.")
                return
            }
            var callbackList = callbackEntryView.value.getOrThrow()
            if (callback.isNone()) { // clear all callback
                unsafe {
                    let ret = FfiOHOSStageOff(getID(), -1)
                    checkRet(ret, "[WindowStage] Unregister ${key.toString()} failed: ")
                }
                callbackList.clear()
                return;
            }
            var callbackId: Option<Int64> = None
            for (idx in 0..callbackList.size) {
                if (refEq(callback.getOrThrow(), callbackList[idx][0])) {
                    callbackId = callbackList[idx][1]
                    callbackList.remove(idx..idx + 1)
                    break
                }
            }
            if (callbackId.isNone()) {
                WindowLibLog.info("[WindowStage] The callback object not exists.")
                return
            }
            unsafe {
                let ret = FfiOHOSStageOff(getID(), callbackId.getOrThrow())
                checkRet(ret, "[WindowStage] Unregister ${key.toString()} failed: ")
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
}
