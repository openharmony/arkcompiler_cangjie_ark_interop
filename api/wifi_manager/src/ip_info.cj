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

import ohos.ffi.*

foreign {
    func FfiWifiIsWifiActive(ret: CPointer<Bool>): Int32

    func FfiWifiGetScanInfoList(ret: CPointer<Int32>): WifiScanInfoArr

    func FfiWifiP2pCancelConnect(): Int32

    func FfiWifiStartDiscoverDevices(): Int32
}

@C
struct CWifiInfoElem {
    CWifiInfoElem(
        let eid: UInt32,
        let content: CArrUI8
    ) {}

    func free() {
        unsafe { LibC.free(content.head) }
    }
}

@C
struct CWifiScanInfo {
    CWifiScanInfo(
        let ssid: CString, // the maximum length is 32
        let bssid: CString, // the length is 6
        let bssidType: Int32,
        let capabilities: CString,
        let securityType: Int32,
        let rssi: Int32, // Received signal strength indicator
        let band: Int32, // Frequency band, 1: 2.4G, 2: 5G
        let frequency: Int32,
        let channelWidth: Int32,
        let centerFrequency0: Int32,
        let centerFrequency1: Int32,
        let infoElems: CPointer<CWifiInfoElem>,
        let elemsSize: Int64,
        let timestamp: Int64,
        let supportedWifiCategory: Int32,
        let isHiLinkNetwork: Bool
    ) {}

    func free() {
        unsafe {
            LibC.free(ssid)
            LibC.free(bssid)
            LibC.free(capabilities)
            if (infoElems.isNotNull()) {
                for (i in 0..elemsSize) {
                    infoElems.read(i).free()
                }
            }
            LibC.free(infoElems)
        }
    }
}

@C
struct WifiScanInfoArr {
    WifiScanInfoArr(
        let head: CPointer<CWifiScanInfo>,
        let size: Int64
    ) {}

    unsafe func free() {
        if (head.isNotNull()) {
            for (i in 0..size) {
                head.read(i).free()
            }
        }
        LibC.free(head)
    }
}
