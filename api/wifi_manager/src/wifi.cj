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
    atomicservice: true,
    permission: "ohos.SET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func addCandidateConfig(config: WifiDeviceConfig): Int32 {
    var ret = 0i32
    let ct = CWifiDeviceConfig(config)
    let code = unsafe { FfiWifiAddCandidateConfig(ct, inout ret) }
    ct.free()
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "addCandidateConfig failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.SET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func removeCandidateConfig(networkId: Int32): Unit {
    let code = unsafe { FfiWifiRemoveCandidateConfig(networkId) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "removeCandidateConfig failed: ${err[1]}")
    }
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getCandidateConfigs(): Array<WifiDeviceConfig> {
    var code = 0i32
    var arr: Array<WifiDeviceConfig> = Array<WifiDeviceConfig>()
    unsafe {
        let ret = FfiWifiGetCandidateConfigs(inout code)
        if (code != SUCCESS_CODE) {
            ret.free()
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "getCandidateConfigs failed: ${err[1]}")
        }
        // ffi return information may be invalid UTF8 and may be parsed abnormally.
        try {
            arr = cArr2cjArr<CWifiDeviceConfig, WifiDeviceConfig>(ret.size, ret.head) {
                cfg => WifiDeviceConfig(cfg)
            }
        } finally {
            ret.free()
        }
    }
    arr
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.SET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func connectToCandidateConfig(networkId: Int32): Unit {
    let code = unsafe { FfiWifiConnectToCandidateConfig(networkId) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "connectToCandidateConfig failed: ${err[1]}")
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getSignalLevel(rssi: Int32, band: Int32): UInt32 {
    var ret = 0u32
    let code = unsafe { FfiWifiGetSignalLevel(rssi, band, inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "connectToCandidateConfig failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getLinkedInfo(): WifiLinkedInfo {
    try (ptr = safeMalloc<CWifiLinkedInfo>().asResource()) {
        let code = unsafe { FfiWifiGetLinkedInfo(ptr.value) }
        if (code != SUCCESS_CODE) {
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "getLinkedInfo failed: ${err[1]}")
        }
        let ret = unsafe { ptr.value.read() }
        try {
            return WifiLinkedInfo(ret)
        } finally {
            ret.free()
        }
    }
    throw IllegalStateException("should not reach here")
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func isConnected(): Bool {
    var ret = false
    let code = unsafe { FfiWifiIsConnected(inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "isConnected failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public func isFeatureSupported(featureId: Int64): Bool {
    var ret = false
    let code = unsafe { FfiWifiIsFeatureSupported(featureId, inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_CORE)
        throw BusinessException(err[0], "isFeatureSupported failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getIpInfo(): IpInfo {
    try (ptr = safeMalloc<CIpInfo>().asResource()) {
        let code = unsafe { FfiWifiGetIpInfo(ptr.value) }
        if (code != SUCCESS_CODE) {
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "getIpInfo failed: ${err[1]}")
        }
        return unsafe { ptr.value.read().toIpInfo() }
    }
    throw IllegalStateException("should not reach here")
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func getIpv6Info(): Ipv6Info {
    try (ptr = safeMalloc<CIpv6Info>().asResource()) {
        let code = unsafe { FfiWifiGetIpv6Info(ptr.value) }
        if (code != SUCCESS_CODE) {
            let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
            throw BusinessException(err[0], "getIpv6Info failed: ${err[1]}")
        }
        let ret = unsafe { ptr.value.read() }
        try {
            return Ipv6Info(ret)
        } finally {
            ret.free()
        }
    }
    throw IllegalStateException("should not reach here")
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public func getCountryCode(): String {
    var code = 0i32
    let cstr = unsafe { FfiWifiGetCountryCode(inout code) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_CORE)
        throw BusinessException(err[0], "getCountryCode failed: ${err[1]}")
    }
    try {
        return cstr.toString()
    } finally {
        unsafe { LibC.free(cstr) }
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func isBandTypeSupported(bandType: WifiBandType): Bool {
    var ret = false
    let code = unsafe { FfiWifiIsBandTypeSupported(bandType.getValue(), inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "isBandTypeSupported failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func isMeteredHotspot(): Bool {
    var ret = false
    let code = unsafe { FfiWifiIsMeteredHotspot(inout ret) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_STA)
        throw BusinessException(err[0], "isMeteredHotspot failed: ${err[1]}")
    }
    ret
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func getP2pLinkedInfo(): WifiP2pLinkedInfo {
    let ptr = safeMalloc<CWifiP2pLinkedInfo>()
    let code = unsafe { FfiWifiGetP2pLinkedInfo(ptr) }
    if (code != SUCCESS_CODE) {
        unsafe { LibC.free(ptr) }
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "getP2pLinkedInfo failed: ${err[1]}")
    }
    let ret = unsafe { ptr.read() }
    unsafe { LibC.free(ptr) }
    try {
        WifiP2pLinkedInfo(ret)
    } finally {
        ret.free()
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func getCurrentGroup(): WifiP2pGroupInfo {
    let ptr = safeMalloc<CWifiP2pGroupInfo>()
    let code = unsafe { FfiWifiGetCurrentGroup(ptr) }
    if (code != SUCCESS_CODE) {
        unsafe { LibC.free(ptr) }
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "getCurrentGroup failed: ${err[1]}")
    }
    let ret = unsafe { ptr.read() }
    unsafe { LibC.free(ptr) }
    try {
        WifiP2pGroupInfo(ret)
    } finally {
        ret.free()
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func getP2pPeerDevices(): Array<WifiP2pDevice> {
    var code = 0i32
    let ret = unsafe { FfiWifiGetP2pPeerDevices(inout code) }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "getP2pPeerDevices failed: ${err[1]}")
    }
    ret.toCjArrAndFree()
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func getP2pLocalDevice(): WifiP2pDevice {
    let ptr = safeMalloc<CWifiP2pDevice>()
    let code = unsafe { FfiWifiGetP2pLocalDevice(ptr) }
    if (code != SUCCESS_CODE) {
        unsafe { LibC.free(ptr) }
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "getP2pLocalDevice failed: ${err[1]}")
    }
    let ret = unsafe { ptr.read() }
    unsafe { LibC.free(ptr) }
    try {
        WifiP2pDevice(ret)
    } finally {
        ret.free()
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func createGroup(config: WifiP2PConfig): Unit {
    let ct = CWifiP2PConfig(config)
    let code = unsafe { FfiWifiCreateGroup(ct) }
    ct.free()
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "createGroup failed: ${err[1]}")
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func removeGroup(): Unit {
    let code = unsafe { FfiWifiRemoveGroup() }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "removeGroup failed: ${err[1]}")
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func p2pConnect(config: WifiP2PConfig): Unit {
    let ct = CWifiP2PConfig(config)
    let code = unsafe { FfiWifiP2pConnect(ct) }
    ct.free()
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "p2pConnect failed: ${err[1]}")
    }
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

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func stopDiscoverDevices(): Unit {
    let code = unsafe { FfiWifiStopDiscoverDevices() }
    if (code != SUCCESS_CODE) {
        let err = getCodeAndMsg(code, SYSCAP_WIFI_P2P)
        throw BusinessException(err[0], "stopDiscoverDevices failed: ${err[1]}")
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

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func onWifiStateChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_STA_POWER_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func offWifiStateChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_STA_POWER_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func onWifiConnectionChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_STA_CONN_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func offWifiConnectionChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_STA_CONN_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func onWifiScanStateChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_STA_SCAN_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    atomicservice: true,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func offWifiScanStateChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_STA_SCAN_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func onWifiRssiChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_STA_RSSI_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public func offWifiRssiChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_STA_RSSI_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public func onHotspotStateChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_HOTSPOT_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public func offHotspotStateChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_HOTSPOT_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pStateChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_P2P_STATE_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pStateChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_P2P_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pConnectionChange(callback: WifiCallback1<WifiP2pLinkedInfo>): Unit {
    commonSubscribe1Arg(EVENT_P2P_CONN_STATE_CHANGE, callback) {
        info: CWifiP2pLinkedInfo => WifiP2pLinkedInfo(info)
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pConnectionChange(callback!: ?WifiCallback1<WifiP2pLinkedInfo> = None): Unit {
    commonUnSubscribe(EVENT_P2P_CONN_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pDeviceChange(callback: WifiCallback1<WifiP2pDevice>): Unit {
    commonSubscribe1Arg(EVENT_P2P_DEVICE_STATE_CHANGE, callback) {
        device: CWifiP2pDevice => WifiP2pDevice(device)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pDeviceChange(callback!: ?WifiCallback1<WifiP2pDevice> = None): Unit {
    commonUnSubscribe(EVENT_P2P_DEVICE_STATE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pPeerDeviceChange(callback: WifiCallback1<Array<WifiP2pDevice>>): Unit {
    commonSubscribe1Arg(EVENT_P2P_PEER_DEVICE_CHANGE, callback) {
        devices: WifiP2pDeviceArr => unsafe {
            cArr2cjArr<CWifiP2pDevice, WifiP2pDevice>(devices.size, devices.head) {
                ct => WifiP2pDevice(ct)
            }
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pPeerDeviceChange(callback!: ?WifiCallback1<Array<WifiP2pDevice>> = None): Unit {
    commonUnSubscribe(EVENT_P2P_PEER_DEVICE_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pPersistentGroupChange(callback: WifiCallback0): Unit {
    commonSubscribe0Arg(EVENT_P2P_PERSISTENT_GROUP_CHANGE, callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pPersistentGroupChange(callback!: ?WifiCallback0 = None): Unit {
    commonUnSubscribe(EVENT_P2P_PERSISTENT_GROUP_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func onP2pDiscoveryChange(callback: WifiCallback1<Int32>): Unit {
    commonSubscribe1Arg(EVENT_P2P_DISCOVERY_CHANGE, callback) {i: Int32 => i}
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public func offP2pDiscoveryChange(callback!: ?WifiCallback1<Int32> = None): Unit {
    commonUnSubscribe(EVENT_P2P_DISCOVERY_CHANGE, callback: callback)
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public class WifiCallback0 <: Callback0Argument {
    let f_: () -> Unit

    @!APILevel[
        19,
        permission: "ohos.GET_WIFI_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public init(fn: () -> Unit) {
        f_ = fn
    }

    @!APILevel[
        19,
        permission: "ohos.GET_WIFI_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func invoke(): Unit {
        f_()
    }
}

@!APILevel[
    19,
    permission: "ohos.GET_WIFI_INFO",
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public class WifiCallback1<T> <: Callback1Argument<T> {
    let f_: (T) -> Unit

    @!APILevel[
        19,
        permission: "ohos.GET_WIFI_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public init(fn: (T) -> Unit) {
        f_ = fn
    }

    @!APILevel[
        19,
        permission: "ohos.GET_WIFI_INFO",
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func invoke(arg: T): Unit {
        f_(arg)
    }
}
