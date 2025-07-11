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

/**
 * Wi-Fi device address( mac / bssid ) type.
 * @relation enum DeviceAddressType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public enum DeviceAddressType <: ToString {
    /**
     * random device address
     * @relation RANDOM_DEVICE_ADDRESS
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    RandomDeviceAddress
    |
        /**
         * real device address
         * @relation REAL_DEVICE_ADDRESS
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    RealDeviceAddress
    | ...

    func getValue(): Int32 {
        match (this) {
            case RandomDeviceAddress => 0
            case RealDeviceAddress => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): DeviceAddressType {
        match (val) {
            case 0 => RandomDeviceAddress
            case 1 => RealDeviceAddress
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func tryParse(val: Int32): ?DeviceAddressType {
        match (val) {
            case 0 => RandomDeviceAddress
            case 1 => RealDeviceAddress
            case _ => None
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case RandomDeviceAddress => "RandomDeviceAddress"
            case RealDeviceAddress => "RealDeviceAddress"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Describes the wifi security type.
 * @relation enum WifiSecurityType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public enum WifiSecurityType <: Equatable<WifiSecurityType> & ToString {
    /**
     * Invalid security type
     * @relation WIFI_SEC_TYPE_INVALID = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeInvalid
    |
        /**
         * Open
         * @relation WIFI_SEC_TYPE_OPEN = 1
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeOpen
    |
        /**
         * Wired Equivalent Privacy (WEP)
         * @relation WIFI_SEC_TYPE_WEP = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeWep
    |
        /**
         * Pre-shared key (PSK)
         * @relation WIFI_SEC_TYPE_PSK = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypePsk
    |
        /**
        * Simultaneous Authentication of Equals (SAE)
        * @relation WIFI_SEC_TYPE_SAE = 4
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeSae
    |
        /**
        * EAP authentication.
        * @relation WIFI_SEC_TYPE_EAP = 5
        */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeEap
    |
        /**
         * SUITE_B_192 192 bit level.
         * @relation WIFI_SEC_TYPE_EAP_SUITE_B = 6
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeEapSuiteB
    |
        /**
         * Opportunistic Wireless Encryption.
         * @relation WIFI_SEC_TYPE_OWE = 7
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeOwe
    |
        /**
         * WAPI certificate to be specified.
         * @relation WIFI_SEC_TYPE_WAPI_CERT = 8
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeWapiCert
    |
        /**
         * WAPI pre-shared key to be specified.
         * @relation WIFI_SEC_TYPE_WAPI_PSK = 9
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WifiSecTypeWapiPsk
    | ...

    func getValue(): Int32 {
        match (this) {
            case WifiSecTypeInvalid => 0
            case WifiSecTypeOpen => 1
            case WifiSecTypeWep => 2
            case WifiSecTypePsk => 3
            case WifiSecTypeSae => 4
            case WifiSecTypeEap => 5
            case WifiSecTypeEapSuiteB => 6
            case WifiSecTypeOwe => 7
            case WifiSecTypeWapiCert => 8
            case WifiSecTypeWapiPsk => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiSecurityType {
        match (val) {
            case 0 => WifiSecTypeInvalid
            case 1 => WifiSecTypeOpen
            case 2 => WifiSecTypeWep
            case 3 => WifiSecTypePsk
            case 4 => WifiSecTypeSae
            case 5 => WifiSecTypeEap
            case 6 => WifiSecTypeEapSuiteB
            case 7 => WifiSecTypeOwe
            case 8 => WifiSecTypeWapiCert
            case 9 => WifiSecTypeWapiPsk
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public operator func ==(that: WifiSecurityType): Bool {
        match ((this, that)) {
            case (WifiSecTypeInvalid, WifiSecTypeInvalid) => true
            case (WifiSecTypeOpen, WifiSecTypeOpen) => true
            case (WifiSecTypeWep, WifiSecTypeWep) => true
            case (WifiSecTypePsk, WifiSecTypePsk) => true
            case (WifiSecTypeSae, WifiSecTypeSae) => true
            case (WifiSecTypeEap, WifiSecTypeEap) => true
            case (WifiSecTypeEapSuiteB, WifiSecTypeEapSuiteB) => true
            case (WifiSecTypeOwe, WifiSecTypeOwe) => true
            case (WifiSecTypeWapiCert, WifiSecTypeWapiCert) => true
            case (WifiSecTypeWapiPsk, WifiSecTypeWapiPsk) => true
            case _ => false
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case WifiSecTypeInvalid => "WifiSecTypeInvalid"
            case WifiSecTypeOpen => "WifiSecTypeOpen"
            case WifiSecTypeWep => "WifiSecTypeWep"
            case WifiSecTypePsk => "WifiSecTypePsk"
            case WifiSecTypeSae => "WifiSecTypeSae"
            case WifiSecTypeEap => "WifiSecTypeEap"
            case WifiSecTypeEapSuiteB => "WifiSecTypeEapSuiteB"
            case WifiSecTypeOwe => "WifiSecTypeOwe"
            case WifiSecTypeWapiCert => "WifiSecTypeWapiCert"
            case WifiSecTypeWapiPsk => "WifiSecTypeWapiPsk"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Wi-Fi Category.
 * @relation enum WifiCategory
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum WifiCategory <: ToString {
    /**
     * Default.
     * @relation DEFAULT = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    Default
    |
        /**
         * Wifi6.
         * @relation WIFI6 = 2
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    Wifi6
    |
        /**
         * Wifi6+.
         * @relation WIFI6_PLUS = 3
         */
        @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    Wifi6Plus
    | ...

    func getValue(): Int32 {
        match (this) {
            case Default => 1
            case Wifi6 => 2
            case Wifi6Plus => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiCategory {
        match (val) {
            case 1 => Default
            case 2 => Wifi6
            case 3 => Wifi6Plus
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        match (this) {
            case Default => "Default"
            case Wifi6 => "Wifi6"
            case Wifi6Plus => "Wifi6Plus"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
