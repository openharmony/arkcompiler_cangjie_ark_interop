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

/**
 * Query the Wi-Fi status
 * @throws {BusinessException} 801 - Capability not supported.
 * @throws {BusinessException} 2501000 - Operation failed.
 * @relation function isWifiActive(): boolean
 */
@!APILevel[
    21,
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

/**
 * Obtain the scanned station list. If does't have the permission of ohos.permission.GET_WIFI_PEERS_MAC, return random bssid.
 * @throws {BusinessException} 201 - Permission denied.
 * @throws {BusinessException} 801 - Capability not supported.
 * @throws {BusinessException} 2501000 - Operation failed.
 * @relation function getScanInfoList(): Array<WifiScanInfo>
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_WIFI_INFO",
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

/**
 * Stop an ongoing p2p connection that is being established.
 * @throws {BusinessException} 201 - Permission denied.
 * @throws {BusinessException} 801 - Capability not supported.
 * @throws {BusinessException} 2801000 - Operation failed.
 * @throws {BusinessException} 2801001 - Wi-Fi STA disabled.
 * @relation function p2pCancelConnect(): void
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_WIFI_INFO",
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

/**
 * Start discover Wi-Fi P2P devices.
 * @throws {BusinessException} 201 - Permission denied.
 * @throws {BusinessException} 801 - Capability not supported.
 * @throws {BusinessException} 2801000 - Operation failed.
 * @throws {BusinessException} 2801001 - Wi-Fi STA disabled.
 * @relation function startDiscoverDevices(): void
 */
@!APILevel[
    21,
    permission: "ohos.permission.GET_WIFI_INFO",
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
