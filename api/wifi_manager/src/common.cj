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

import std.collection.HashMap
import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

const EVENT_STA_POWER_STATE_CHANGE = "wifiStateChange"
const EVENT_STA_CONN_STATE_CHANGE = "wifiConnectionChange"
const EVENT_STA_RSSI_STATE_CHANGE = "wifiRssiChange"
const EVENT_STA_SCAN_STATE_CHANGE = "wifiScanStateChange"
const EVENT_HOTSPOT_STATE_CHANGE = "hotspotStateChange"
const EVENT_P2P_STATE_CHANGE = "p2pStateChange"
const EVENT_P2P_PERSISTENT_GROUP_CHANGE = "p2pPersistentGroupChange"
const EVENT_P2P_DEVICE_STATE_CHANGE = "p2pDeviceChange"
const EVENT_P2P_PEER_DEVICE_CHANGE = "p2pPeerDeviceChange"
const EVENT_P2P_CONN_STATE_CHANGE = "p2pConnectionChange"
const EVENT_P2P_DISCOVERY_CHANGE = "p2pDiscoveryChange"

// syscap code
const SYSCAP_WIFI_CORE = 2400000i32
const SYSCAP_WIFI_STA = 2500000i32
const SYSCAP_WIFI_P2P = 2800000i32

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public enum DeviceAddressType <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    RANDOM_DEVICE_ADDRESS
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    REAL_DEVICE_ADDRESS
    | ...

    func getValue(): Int32 {
        match (this) {
            case RANDOM_DEVICE_ADDRESS => 0
            case REAL_DEVICE_ADDRESS => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): DeviceAddressType {
        match (val) {
            case 0 => RANDOM_DEVICE_ADDRESS
            case 1 => REAL_DEVICE_ADDRESS
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?DeviceAddressType {
        match (val) {
            case 0 => RANDOM_DEVICE_ADDRESS
            case 1 => REAL_DEVICE_ADDRESS
            case _ => None
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case RANDOM_DEVICE_ADDRESS => "RANDOM_DEVICE_ADDRESS"
            case REAL_DEVICE_ADDRESS => "REAL_DEVICE_ADDRESS"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public enum WifiSecurityType <: Equatable<WifiSecurityType> & ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_INVALID
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_OPEN
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_WEP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_PSK
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_SAE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_EAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_EAP_SUITE_B
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_OWE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_WAPI_CERT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WIFI_SEC_TYPE_WAPI_PSK
    | ...

    func getValue(): Int32 {
        match (this) {
            case WIFI_SEC_TYPE_INVALID => 0
            case WIFI_SEC_TYPE_OPEN => 1
            case WIFI_SEC_TYPE_WEP => 2
            case WIFI_SEC_TYPE_PSK => 3
            case WIFI_SEC_TYPE_SAE => 4
            case WIFI_SEC_TYPE_EAP => 5
            case WIFI_SEC_TYPE_EAP_SUITE_B => 6
            case WIFI_SEC_TYPE_OWE => 7
            case WIFI_SEC_TYPE_WAPI_CERT => 8
            case WIFI_SEC_TYPE_WAPI_PSK => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiSecurityType {
        match (val) {
            case 0 => WIFI_SEC_TYPE_INVALID
            case 1 => WIFI_SEC_TYPE_OPEN
            case 2 => WIFI_SEC_TYPE_WEP
            case 3 => WIFI_SEC_TYPE_PSK
            case 4 => WIFI_SEC_TYPE_SAE
            case 5 => WIFI_SEC_TYPE_EAP
            case 6 => WIFI_SEC_TYPE_EAP_SUITE_B
            case 7 => WIFI_SEC_TYPE_OWE
            case 8 => WIFI_SEC_TYPE_WAPI_CERT
            case 9 => WIFI_SEC_TYPE_WAPI_PSK
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public operator func ==(that: WifiSecurityType): Bool {
        match ((this, that)) {
            case (WIFI_SEC_TYPE_INVALID, WIFI_SEC_TYPE_INVALID) => true
            case (WIFI_SEC_TYPE_OPEN, WIFI_SEC_TYPE_OPEN) => true
            case (WIFI_SEC_TYPE_WEP, WIFI_SEC_TYPE_WEP) => true
            case (WIFI_SEC_TYPE_PSK, WIFI_SEC_TYPE_PSK) => true
            case (WIFI_SEC_TYPE_SAE, WIFI_SEC_TYPE_SAE) => true
            case (WIFI_SEC_TYPE_EAP, WIFI_SEC_TYPE_EAP) => true
            case (WIFI_SEC_TYPE_EAP_SUITE_B, WIFI_SEC_TYPE_EAP_SUITE_B) => true
            case (WIFI_SEC_TYPE_OWE, WIFI_SEC_TYPE_OWE) => true
            case (WIFI_SEC_TYPE_WAPI_CERT, WIFI_SEC_TYPE_WAPI_CERT) => true
            case (WIFI_SEC_TYPE_WAPI_PSK, WIFI_SEC_TYPE_WAPI_PSK) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case WIFI_SEC_TYPE_INVALID => "WIFI_SEC_TYPE_INVALID"
            case WIFI_SEC_TYPE_OPEN => "WIFI_SEC_TYPE_OPEN"
            case WIFI_SEC_TYPE_WEP => "WIFI_SEC_TYPE_WEP"
            case WIFI_SEC_TYPE_PSK => "WIFI_SEC_TYPE_PSK"
            case WIFI_SEC_TYPE_SAE => "WIFI_SEC_TYPE_SAE"
            case WIFI_SEC_TYPE_EAP => "WIFI_SEC_TYPE_EAP"
            case WIFI_SEC_TYPE_EAP_SUITE_B => "WIFI_SEC_TYPE_EAP_SUITE_B"
            case WIFI_SEC_TYPE_OWE => "WIFI_SEC_TYPE_OWE"
            case WIFI_SEC_TYPE_WAPI_CERT => "WIFI_SEC_TYPE_WAPI_CERT"
            case WIFI_SEC_TYPE_WAPI_PSK => "WIFI_SEC_TYPE_WAPI_PSK"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum WifiCategory <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    DEFAULT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI6
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI6_PLUS
    | ...

    func getValue(): Int32 {
        match (this) {
            case DEFAULT => 1
            case WIFI6 => 2
            case WIFI6_PLUS => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiCategory {
        match (val) {
            case 1 => DEFAULT
            case 2 => WIFI6
            case 3 => WIFI6_PLUS
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        match (this) {
            case DEFAULT => "DEFAULT"
            case WIFI6 => "WIFI6"
            case WIFI6_PLUS => "WIFI6_PLUS"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
