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

package ohos.wifi_manager

import ohos.base.*
import ohos.ffi.*
import ohos.hilog.*
import std.collection.{HashMap, ArrayList}
import std.sync.AtomicBool
import ohos.labels.*

let LOGGER = HilogChannel(0, 0xD001560, "CJ-wifi")

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func isWifiActive(): Bool {
    var ret = false
    let code = unsafe { FfiWifiIsWifiActive(inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "isWifiActive failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getScanInfoList(): Array<WifiScanInfo> {
    var code = 0i32
    var arr: Array<WifiScanInfo> = Array<WifiScanInfo>()
    unsafe {
        let ret = FfiWifiGetScanInfoList(inout code)
        if (code != SUCCESS_CODE) {
            ret.free()
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "getScanInfoList failed: ${err[1]}")
        }
        try {
            arr = cArr2cjArr<CWifiScanInfo, WifiScanInfo>(ret.size, ret.head) {
                ct => WifiScanInfo(ct)
            }
        } finally {
            ret.free()
        }
    }
    arr
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func p2pCancelConnect(): Unit {
    let code = unsafe { FfiWifiP2pCancelConnect() }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "p2pCancelConnect failed: ${err[1]}")
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func startDiscoverDevices(): Unit {
    let code = unsafe { FfiWifiStartDiscoverDevices() }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "startDiscoverDevices failed: ${err[1]}")
    }
}


// ----------- for callback ----------------

private let CALLBACK_MAP = HashMap<String, ArrayList<CallbackObject>>()
private let REGISTER_MAP = HashMap<String, AtomicBool>(
    [
        (EVENT_STA_POWER_STATE_CHANGE, AtomicBool(false)),
        (EVENT_STA_CONN_STATE_CHANGE, AtomicBool(false)),
        (EVENT_STA_RSSI_STATE_CHANGE, AtomicBool(false)),
        (EVENT_STA_SCAN_STATE_CHANGE, AtomicBool(false)),
        (EVENT_HOTSPOT_STATE_CHANGE, AtomicBool(false)),
        (EVENT_P2P_STATE_CHANGE, AtomicBool(false)),
        (EVENT_P2P_PERSISTENT_GROUP_CHANGE, AtomicBool(false)),
        (EVENT_P2P_DEVICE_STATE_CHANGE, AtomicBool(false)),
        (EVENT_P2P_PEER_DEVICE_CHANGE, AtomicBool(false)),
        (EVENT_P2P_CONN_STATE_CHANGE, AtomicBool(false)),
        (EVENT_P2P_DISCOVERY_CHANGE, AtomicBool(false))
    ]
)

// return index of the object in array
private func findCallbackObject(callbackType: String, callback: CallbackObject, remove!: Bool = false): Int64 {
    let callbackList = CALLBACK_MAP.get(callbackType) ?? return -1
    for (idx in 0..callbackList.size) {
        if (refEq(callback, callbackList[idx])) {
            if (remove) {
                callbackList.remove(at: idx)
            }
            return idx
        }
    }
    return -1
}

private func on(callbackType: String, id: Int64) {
    let code: Int32
    try (cstr = unsafe { LibC.mallocCString(callbackType) }.asResource()) {
        code = unsafe { FfiWifiWifiOn(cstr.value, id) }
        if (code != SUCCESS_CODE) {
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "on ${callbackType} failed: ${err[1]}")
        }
    }
}

private func argWrapper1<CT, T>(callbackType: String, ctor: (CT) -> T): Int64 where CT <: CType {
    let wrapper = {
        ctype: CT =>
        let cjType = ctor(ctype)
        let callbackList = CALLBACK_MAP.get(callbackType) ?? ArrayList<CallbackObject>()
        for (caller in callbackList) {
            (caller as Callback1Argument<T>)?.invoke(cjType)
        }
    }
    let registerCall = Callback1Param<CT, Unit>(wrapper)
    registerCall.getID()
}

private func commonSubscribe1Arg<CT, T>(callbackType: String, callback: CallbackObject, ctor: (CT) -> T) where CT <: CType {
    LOGGER.debug("subscribe ${callbackType}")
    if (REGISTER_MAP[callbackType].compareAndSwap(false, true)) {
        on(callbackType, argWrapper1<CT, T>(callbackType, ctor))
    } else {
        if (findCallbackObject(callbackType, callback) >= 0) {
            LOGGER.info("[Wifi] The callback object already exists.")
            return
        }
    }
    CALLBACK_MAP.addIfAbsent(callbackType, ArrayList<CallbackObject>())
    CALLBACK_MAP[callbackType].add(callback)
}

private func argWrapper0(callbackType: String): Int64 {
    let wrapper = {
        =>
        let callbackList = CALLBACK_MAP.get(callbackType) ?? ArrayList<CallbackObject>()
        for (caller in callbackList) {
            (caller as Callback0Argument)?.invoke()
        }
    }
    let registerCall = Callback0Param<Unit>(wrapper)
    registerCall.getID()
}

private func commonSubscribe0Arg(callbackType: String, callback: CallbackObject): Unit {
    LOGGER.debug("subscribe ${callbackType}")
    if (REGISTER_MAP[callbackType].compareAndSwap(false, true)) {
        on(callbackType, argWrapper0(callbackType))
    } else {
        if (findCallbackObject(callbackType, callback) >= 0) {
            LOGGER.info("[Wifi] The callback object already exists.")
            return
        }
    }
    CALLBACK_MAP.addIfAbsent(callbackType, ArrayList<CallbackObject>())
    CALLBACK_MAP[callbackType].add(callback)
}

// no need to call FfiWifiWifiOff because there is no unregister api in ndk
private func commonUnSubscribe<T>(callbackType: String, callback!: ?T = None): Unit where T <: CallbackObject {
    LOGGER.debug("unsubscribe ${callbackType}")
    match (callback) {
        case Some(v) => findCallbackObject(callbackType, v, remove: true)
        case None => CALLBACK_MAP.get(callbackType)?.clear()
    }
}