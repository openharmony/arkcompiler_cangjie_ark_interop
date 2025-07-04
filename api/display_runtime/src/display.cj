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

import ohos.ffi.*
import ohos.base.*
import std.sync.*
import std.collection.*
import ohos.color_manager.*
import ohos.labels.*
import std.collection.HashMap

// The value of ColorSpace in ohos.display is different from value of ColorSpace in ohos.color_manager.
// The map NATIVE_TO_JS_COLOR_SPACE_TYPE_MAP is in cpp file "foundation/window/window_manager/interfaces/kits/napi/display_runtime/js_display.cpp"
extend ColorSpace {
    static func parseFromDisplay(cs: UInt32): ColorSpace {
        return match (cs) {
            case 0 => UNKNOWN
            case 2228482 => BT601_EBU
            case 2294019 => BT601_SMPTE_C
            case 2162945 => BT709
            case 2360580 => BT2020_HLG
            case 2360324 => BT2020_PQ
            case 4325634 => BT601_EBU
            case 4391171 => BT601_SMPTE_C
            case 4260097 => BT709
            case 4457732 => BT2020_HLG
            case 4457476 => BT2020_PQ
            case 2294273 => SRGB
            case 2294278 => DISPLAY_P3
            case 2295046 => P3_HLG
            case 2294790 => P3_PQ
            case 2098711 => ADOBE_RGB_1998
            case 4391425 => SRGB
            case 4391430 => DISPLAY_P3
            case 4391942 => P3_PQ
            case 4195863 => ADOBE_RGB_1998
            case 769 => LINEAR_SRGB
            case 774 => LINEAR_P3
            case 772 => LINEAR_BT2020
            case _ => throw Exception("Unrecognized ColorSpace type: ${cs}")
        }
    }
}

foreign {
    func FfiOHOSGetDefaultDisplaySync(): RetStruct

    func FfiOHOSGetAllDisplays(): RetStruct

    func FfiOHOSHasPrivateWindow(displayId: UInt32): RetStruct

    func FfiOHOSIsFoldable(): Bool

    func FfiOHOSSetFoldDisplayMode(mode: UInt32): Unit

    func FfiOHOSGetFoldStatus(): UInt32

    func FfiOHOSGetFoldDisplayMode(): UInt32

    func FfiOHOSGetCurrentFoldCreaseRegion(): RetStruct

    func FfiOHOSIsCaptured(): Bool

    func FfiOHOSGetAllDisplayPhysicalResolution(): RetStruct

    func FfiOHOSUnRegisterAllDisplayManagerCallback(callbackType: CString): Int32

    func FfiOHOSRegisterDisplayManagerCallback(callbackType: CString, callbackId: Int64): Int32

    func FfiOHOSUnRegisterDisplayManagerCallback(callbackType: CString, callbackId: Int64): Int32

    func FfiOHOSDisplayGetId(id: Int64): UInt32

    func FfiOHOSGetDisplayName(id: Int64): CString

    func FfiOHOSDisplayGetAlive(id: Int64): Bool

    func FfiOHOSDisplayGetState(id: Int64): UInt32

    func FfiOHOSDisplayGetRefreshRate(id: Int64): UInt32

    func FfiOHOSDisplayGetRotation(id: Int64): UInt32

    func FfiOHOSDisplayGetOrientation(id: Int64): UInt32

    func FfiOHOSDisplayGetWidth(id: Int64): Int32

    func FfiOHOSDisplayGetHeight(id: Int64): Int32

    func FfiOHOSDisplayGetDensityDPI(id: Int64): Float32

    func FfiOHOSDisplayGetVirtualPixelRatio(id: Int64): Float32

    func FfiOHOSDisplayGetXDPI(id: Int64): Float32

    func FfiOHOSDisplayGetYDPI(id: Int64): Float32

    func FfiOHOSDisplayGetColorSpaces(id: Int64): RetStruct

    func FfiOHOSDisplayGetHdrFormats(id: Int64): RetStruct

    func FfiOHOSDisplayGetAvailableWidth(id: Int64): UInt32

    func FfiOHOSDisplayGetAvailableHeight(id: Int64): UInt32

    func FfiOHOSDisplayGetCutoutInfo(id: Int64): RetStruct

    func FfiOHOSDisplayGetAvailableArea(id: Int64): RetStruct

    func FfiOHOSDisplayUnRegisterAllDisplayManagerCallback(callbackType: CString, id: Int64): Int32

    func FfiOHOSDisplayRegisterDisplayManagerCallback(callbackType: CString, id: Int64, callbackId: Int64): Int32

    func FfiOHOSDisplayUnRegisterDisplayManagerCallback(callbackType: CString, id: Int64, callbackId: Int64): Int32
}

const EXCEPTION_PARAMCHECK: Int32 = 401
let REGISTER_MUTEX = Mutex()
let CALLBACK_MAP = HashMap<String, ArrayList<(CallbackObject, Int64)>>(
    [
        (LISTNER_TYPE_ADD.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_REMOVE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_FOLD_STATUS_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_FOLD_ANGLE_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_CAPTURE_STATUS_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>()),
        (LISTNER_TYPE_AVAILABLE_AREA_CHANGE.toString(), ArrayList<(CallbackObject, Int64)>())
    ]
)

/*
 * Find the callback among registered callbacks
 *
 * @param list: registered callbacks
 * @param callback: target callback object
 * @return index of the found callback if it exists else -1
 */
func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Int64 {
    for (idx in 0..list.size) {
        if (refEq(callback, list[idx][0])) {
            return idx
        }
    }
    return -1
}

/**
 * @brief  getDefaultDisplaySync(): Display
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getDefaultDisplaySync(): Display {
    unsafe {
        let ret = FfiOHOSGetDefaultDisplaySync()
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to get default display.")
            throw BusinessException(ret.code, "ERROR: Failed to get default display.")
        }
        let dataPtr = CPointer<Int64>(ret.data)
        let retVal = dataPtr.read()
        LibC.free<Int64>(dataPtr)
        return getOrCreate(Display.instanceMap, retVal, {id: Int64 => Display(id)})
    }
}

/**
 * @brief  getAllDisplays(): Promise<Array<Display>>
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getAllDisplays(): Array<Display> {
    unsafe {
        let ret = FfiOHOSGetAllDisplays()
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to get all displays.")
            throw BusinessException(ret.code, "ERROR: Failed to get all displays.")
        }
        let dataPtr = CPointer<Int64>(ret.data)
        let idArray = Array<Int64>(ret.len, {i => dataPtr.read(i)})
        LibC.free<Int64>(dataPtr)
        let result = Array<Display>(ret.len,
            {i => getOrCreate(Display.instanceMap, idArray[i], {id: Int64 => Display(id)})})
        return result
    }
}

/**
 * @brief  hasPrivateWindow(displayId: number): boolean
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func hasPrivateWindow(displayId: UInt32): Bool {
    unsafe {
        let ret = FfiOHOSHasPrivateWindow(displayId)
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to check private window")
            return false
        }
        let dataPtr = CPointer<Bool>(ret.data)
        let retVal = dataPtr.read()
        LibC.free<Bool>(dataPtr)
        return retVal
    }
}

/**
 * @brief  isFoldable(): boolean
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func isFoldable(): Bool {
    unsafe { FfiOHOSIsFoldable() }
}

/**
 * @brief  setFoldDisplayMode(mode: FoldDisplayMode): void
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func setFoldDisplayMode(mode: FoldDisplayMode): Unit {
    unsafe { FfiOHOSSetFoldDisplayMode(mode.getValue()) }
}

/**
 * Check whether the device is taking a screenshot, projection, or recording.
 *
 * @return true if the device is taking a screenshot, projection, or recording, else false
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func isCaptured(): Bool {
    unsafe { FfiOHOSIsCaptured() }
}

/**
 * @brief  getFoldStatus(): FoldStatus
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getFoldStatus(): FoldStatus {
    unsafe {
        let ret = FfiOHOSGetFoldStatus()
        return FoldStatus.parse(ret)
    }
}

/**
 * @brief  getFoldDisplayMode(): FoldDisplayMode
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getFoldDisplayMode(): FoldDisplayMode {
    unsafe {
        let ret = FfiOHOSGetFoldDisplayMode()
        return FoldDisplayMode.parse(ret)
    }
}

/**
 * @brief  getCurrentFoldCreaseRegion(): FoldCreaseRegion
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getCurrentFoldCreaseRegion(): FoldCreaseRegion {
    let retData = unsafe {
        FfiOHOSGetCurrentFoldCreaseRegion()
    }
    if (retData.code != 0) {
        DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get current fold crease region.")
        throw BusinessException(retData.code, "ERROR: Failed to get current fold crease region.")
    }
    let ptr = unsafe { CPointer<CFoldCreaseRegion>(retData.data) }
    if (ptr.isNull()) {
        unsafe { LibC.free(retData.data) }
        throw IllegalMemoryException("Failed to create target pointer type")
    }
    let foldCreaseRegion = unsafe { ptr.read() }
    let ret = FoldCreaseRegion(foldCreaseRegion)
    unsafe {
        LibC.free<CRect>(foldCreaseRegion.creaseRects)
        LibC.free<CFoldCreaseRegion>(ptr)
    }
    return ret
}

/**
 * Obtaining a display mode of a current folding device and a corresponding physical screen resolution information object.
 *
 * @return All current DisplayPhysicalResolution objects
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func getAllDisplayPhysicalResolution(): Array<DisplayPhysicalResolution> {
    unsafe {
        let ret = FfiOHOSGetAllDisplayPhysicalResolution()
        if (ret.code != 0) {
            DisplayLog.error("[display] ERROR: ${ret.code} Failed to get all display physical resolution.")
            throw BusinessException(ret.code, "ERROR: Failed to get all display physical resolution.")
        }
        let dataPtr = CPointer<CDisplayPhysicalResolution>(ret.data)
        let resolutionArray = Array<CDisplayPhysicalResolution>(ret.len, {i => dataPtr.read(i)})
        LibC.free<CDisplayPhysicalResolution>(dataPtr)
        let result = Array<DisplayPhysicalResolution>(ret.len, {i => DisplayPhysicalResolution(resolutionArray[i])})
        return result
    }
}

/**
 * Disables all listeners for display device changes.
 *
 * @param `type`: Type of listening event
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType): Unit {
    offAllCallback(`type`.toString())
}

/*
 * Disables all listeners for display device changes.
 *
 * @param callbackType: Type of listening event
 */
func offAllCallback(callbackType: String): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        unsafe {
            v.value.getOrThrow().clear()
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterAllDisplayManagerCallback(callbackCType)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
        }
    }
}

/**
 * Enable listening to display device changes.
 *
 * @param `type`: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func on(`type`: ListenerType, callback: Callback1Argument<UInt64>): Unit {
    match (`type`) {
        case LISTNER_TYPE_CHANGE => onDeviceChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Enable listening to display device changes.
 *
 * @param callbackType: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
func onDeviceChange(callbackType: String, callback: Callback1Argument<UInt64>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[display] INFO: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> => callback.invoke(CPointer<UInt64>(value).read())
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID())
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
            }
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

/**
 * Disable listening to display device changes.
 *
 * @param `type`: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType, callback: Callback1Argument<UInt64>): Unit {
    match (`type`) {
        case LISTNER_TYPE_CHANGE => offDeviceChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Disable listening to display device changes.
 *
 * @param callbackType: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
func offDeviceChange(callbackType: String, callback: Callback1Argument<UInt64>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
 * Enable listening for changes in the folding state of foldable devices.
 *
 * @param `type`: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func on(`type`: ListenerType, callback: Callback1Argument<FoldStatus>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_STATUS_CHANGE => onFoldStatusChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Enable listening for changes in the folding state of foldable devices.
 *
 * @param callbackType: Type of listening event
 * @param callback: Callback function
 * @since 14
 */
func onFoldStatusChange(callbackType: String, callback: Callback1Argument<FoldStatus>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        let wrapper = {
            value: CPointer<Unit> =>
            let foldStatus = unsafe { CPointer<UInt32>(value).read() }
            callback.invoke(FoldStatus.parse(foldStatus))
        }
        let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
        let callbackCType = unsafe { LibC.mallocCString(callbackType) }
        let ret = unsafe { FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID()) }
        unsafe { LibC.free(callbackCType) }
        if (ret != 0) {
            DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
            throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
        }
        v.value.getOrThrow().add((callback, registerCall.getID()))
    }
}

/**
 * Disable listening for changes in the folding state of foldable devices.
 *
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType, callback: Callback1Argument<FoldStatus>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_STATUS_CHANGE => offFoldStatusChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Disable listening for changes in the folding state of foldable devices.
 *
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func offFoldStatusChange(callbackType: String, callback: Callback1Argument<FoldStatus>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
 * Enable listening for changes in the folding angle of foldable devices.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func on(`type`: ListenerType, callback: Callback1Argument<Array<Float32>>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_ANGLE_CHANGE => onFoldAngleChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Enable listening for changes in the folding angle of foldable devices.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func onFoldAngleChange(callbackType: String, callback: Callback1Argument<Array<Float32>>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let ffiList = FFIVectorFloat32(value)
                let list = Array<Float32>(ffiList.getSize(), {i => ffiList.getElement(i)})
                ffiList.free()
                callback.invoke(list)
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID())
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
            }
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

/**
 * Disable listening for changes in the folding angle of foldable devices.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType, callback: Callback1Argument<Array<Float32>>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_ANGLE_CHANGE => offFoldAngleChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Disable listening for changes in the folding angle of foldable devices.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func offFoldAngleChange(callbackType: String, callback: Callback1Argument<Array<Float32>>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
 * Enable listening for changes in screen capture, screen casting, and screen recording states.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func on(`type`: ListenerType, callback: Callback1Argument<Bool>): Unit {
    match (`type`) {
        case LISTNER_TYPE_CAPTURE_STATUS_CHANGE => onCaptureStatusChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Enable listening for changes in screen capture, screen casting, and screen recording states.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func onCaptureStatusChange(callbackType: String, callback: Callback1Argument<Bool>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let argv = CPointer<Bool>(value).read()
                callback.invoke(argv)
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID())
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
            }
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

/**
 * Disable listening for changes in screen capture, screen casting, and screen recording states.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType, callback: Callback1Argument<Bool>): Unit {
    match (`type`) {
        case LISTNER_TYPE_CAPTURE_STATUS_CHANGE => offCaptureStatusChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Disable listening for changes in screen capture, screen casting, and screen recording states.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func offCaptureStatusChange(callbackType: String, callback: Callback1Argument<Bool>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
        }
    }
}

/**
 * Enable listening for changes in the display mode of foldable devices.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func on(`type`: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE => onFoldDisplayModeChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Enable listening for changes in the display mode of foldable devices.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
func onFoldDisplayModeChange(callbackType: String, callback: Callback1Argument<FoldDisplayMode>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to register callback with type ${callbackType}")
            return
        }
        if (findCallbackObject(v.value.getOrThrow(), callback) >= 0) {
            DisplayLog.info("[Display] INFO: The callback obj already registered!")
            return
        }
        unsafe {
            let wrapper = {
                value: CPointer<Unit> =>
                let argv = CPointer<UInt32>(value).read()
                callback.invoke(FoldDisplayMode.parse(argv))
            }
            let registerCall = Callback1Param<CPointer<Unit>, Unit>(wrapper)
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSRegisterDisplayManagerCallback(callbackCType, registerCall.getID())
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to register callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to register callback with type ${callbackType}")
            }
            v.value.getOrThrow().add((callback, registerCall.getID()))
        }
    }
}

/**
 * Disable listening for changes in the display mode of foldable devices.
 * @param `type`: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func off(`type`: ListenerType, callback: Callback1Argument<FoldDisplayMode>): Unit {
    match (`type`) {
        case LISTNER_TYPE_FOLD_DISPLAY_MODE_CHANGE => offFoldDisplayModeChange(`type`.toString(), callback)
        case _ => throw BusinessException(EXCEPTION_PARAMCHECK,
            "Parameter error: ${`type`.toString()} is not supported.")
    }
}

/**
 * Disable listening for changes in the display mode of foldable devices.
 * @param callbackType: Type of listening events
 * @param callback: Callback function
 * @since 14
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.WindowManager.WindowManager.Core"
]
public func offFoldDisplayModeChange(callbackType: String, callback: Callback1Argument<FoldDisplayMode>): Unit {
    synchronized(REGISTER_MUTEX) {
        var v = CALLBACK_MAP.entryView(callbackType)
        if (v.value.isNone()) {
            DisplayLog.error("[display] ERROR: Failed to unregister callback with type ${callbackType}")
            return
        }
        let idx = findCallbackObject(v.value.getOrThrow(), callback)
        if (idx == -1) {
            DisplayLog.info("[Display] INFO: The callback obj is not registered!")
            return
        }
        unsafe {
            let callbackId = v.value.getOrThrow()[idx][1]
            let callbackCType = LibC.mallocCString(callbackType)
            let ret = FfiOHOSUnRegisterDisplayManagerCallback(callbackCType, callbackId)
            LibC.free(callbackCType)
            if (ret != 0) {
                DisplayLog.error("[display] ERROR: ${ret} Failed to unregister callback with type ${callbackType}")
                throw BusinessException(ret, "ERROR: Failed to unregister callback with type ${callbackType}")
            }
            v.value.getOrThrow().remove(at: idx)
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
public class Display <: RemoteDataLite {
    static let instanceMap = HashMap<Int64, Display>()
    static let REGISTER_MUTEX = Mutex()

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop id: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetId(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop name: String {
        get() {
            let retData = unsafe { FfiOHOSGetDisplayName(getID()) }
            let ret = retData.toString()
            DisplayLog.info("[Display] name: " + ret)
            unsafe { LibC.free(retData) }
            return ret
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop alive: Bool {
        get() {
            unsafe { FfiOHOSDisplayGetAlive(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop state: DisplayState {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetState(getID()) }
            let ret = DisplayState.parse(retData)
            return ret
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop refreshRate: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetRefreshRate(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop rotation: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetRotation(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop orientation: Orientation {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetOrientation(getID()) }
            let ret = Orientation.parse(retData)
            return ret
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop width: Int32 {
        get() {
            unsafe { FfiOHOSDisplayGetWidth(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop height: Int32 {
        get() {
            unsafe { FfiOHOSDisplayGetHeight(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop densityDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetDensityDPI(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop densityPixels: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetVirtualPixelRatio(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop scaledDensity: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetVirtualPixelRatio(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop xDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetXDPI(getID()) }
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop yDPI: Float32 {
        get() {
            unsafe { FfiOHOSDisplayGetYDPI(getID()) }
        }
    }

    /**
     * All color gamut types supported by the display device
     *
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop colorSpaces: Array<ColorSpace> {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetColorSpaces(getID()) }
            if (retData.code != 0) {
                DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get cutout info.")
                throw BusinessException(retData.code, "ERROR: Failed to get cutout info.")
            }
            unsafe {
                let ptr = CPointer<UInt32>(retData.data)
                let colorSpaces_ = Array<ColorSpace>(retData.len, {i => ColorSpace.parseFromDisplay(ptr.read(i))})
                LibC.free<UInt32>(ptr)
                return colorSpaces_
            }
        }
    }

    /**
     * All HDR formats supported by the display device
     *
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop hdrFormats: Array<HDRFormat> {
        get() {
            let retData = unsafe { FfiOHOSDisplayGetHdrFormats(getID()) }
            if (retData.code != 0) {
                DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get cutout info.")
                throw BusinessException(retData.code, "ERROR: Failed to get cutout info.")
            }
            unsafe {
                let ptr = CPointer<UInt32>(retData.data)
                let len = retData.len
                let hdrFormats_ = Array<HDRFormat>(len, {i => HDRFormat.parse(ptr.read(i))})
                LibC.free<UInt32>(ptr)
                return hdrFormats_
            }
        }
    }

    /**
     * The width of the available area of ​​the screen on 2in1 devices, in px
     *
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop availableWidth: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetAvailableWidth(getID()) }
        }
    }

    /**
     * The height of the available area of ​​the screen on 2in1 devices, in px
     *
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public prop availableHeight: UInt32 {
        get() {
            unsafe { FfiOHOSDisplayGetAvailableHeight(getID()) }
        }
    }

    init(id: Int64) {
        super(id)
        DisplayLog.info("[Display] construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    /**
     * @brief  getCutoutInfo(): Promise<CutoutInfo>
     */
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getCutoutInfo(): CutoutInfo {
        let retData = unsafe {
            FfiOHOSDisplayGetCutoutInfo(getID())
        }
        if (retData.code != 0) {
            DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get cutout info.")
            throw BusinessException(retData.code, "ERROR: Failed to get cutout info.")
        }
        let ptr = unsafe { CPointer<CCutoutInfo>(retData.data) }
        if (ptr.isNull()) {
            unsafe { LibC.free(retData.data) }
            throw IllegalMemoryException("Failed to create target pointer type")
        }
        let cutoutInfo = unsafe { ptr.read() }
        let ret = CutoutInfo(cutoutInfo)
        unsafe {
            LibC.free<CRect>(cutoutInfo.boundingRects)
            LibC.free<CCutoutInfo>(ptr)
        }
        return ret
    }

    /**
     * Get the current available area of the 2-in-1 device's screen.
     *
     * @return The current screen's available rectangular area.
     * @since 14
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.WindowManager.WindowManager.Core"
    ]
    public func getAvailableArea(): Rect {
        let retData = unsafe {
            FfiOHOSDisplayGetAvailableArea(getID())
        }
        if (retData.code != 0) {
            DisplayLog.error("[Display] ERROR: ${retData.code} Failed to get available area.")
            throw BusinessException(retData.code, "ERROR: Failed to get available area.")
        }
        let ptr = unsafe { CPointer<CRect>(retData.data) }
        let rect = unsafe { ptr.read() }
        let ret = Rect(rect)
        unsafe {
            LibC.free<CRect>(ptr)
        }
        return ret
    }
}
