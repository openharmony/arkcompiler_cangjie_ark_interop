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

import ohos.labels.APILevel

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
     * @relation RANDOM_DEVICE_ADDRESS = 0
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
     * @relation REAL_DEVICE_ADDRESS = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    RealDeviceAddress
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case RandomDeviceAddress => 0
            case RealDeviceAddress => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
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

    /**
     * Obtain the string representation of DeviceAddressType.
     *
     * @throws IllegalArgumentException - Value conversion failed.
     */
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
    WifiSecTypeWEP
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
    WifiSecTypePSK
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
    WifiSecTypeSAE
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
    WifiSecTypeEAP
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
    WifiSecTypeOWE
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
    WifiSecTypeWapiPSK
    | ...

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case WifiSecTypeInvalid => 0
            case WifiSecTypeOpen => 1
            case WifiSecTypeWEP => 2
            case WifiSecTypePSK => 3
            case WifiSecTypeSAE => 4
            case WifiSecTypeEAP => 5
            case WifiSecTypeEapSuiteB => 6
            case WifiSecTypeOWE => 7
            case WifiSecTypeWapiCert => 8
            case WifiSecTypeWapiPSK => 9
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    static func parse(val: Int32): WifiSecurityType {
        match (val) {
            case 0 => WifiSecTypeInvalid
            case 1 => WifiSecTypeOpen
            case 2 => WifiSecTypeWEP
            case 3 => WifiSecTypePSK
            case 4 => WifiSecTypeSAE
            case 5 => WifiSecTypeEAP
            case 6 => WifiSecTypeEapSuiteB
            case 7 => WifiSecTypeOWE
            case 8 => WifiSecTypeWapiCert
            case 9 => WifiSecTypeWapiPSK
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * Perform a classification operation on the WifiSecurityType.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public operator func ==(that: WifiSecurityType): Bool {
        match ((this, that)) {
            case (WifiSecTypeInvalid, WifiSecTypeInvalid) => true
            case (WifiSecTypeOpen, WifiSecTypeOpen) => true
            case (WifiSecTypeWEP, WifiSecTypeWEP) => true
            case (WifiSecTypePSK, WifiSecTypePSK) => true
            case (WifiSecTypeSAE, WifiSecTypeSAE) => true
            case (WifiSecTypeEAP, WifiSecTypeEAP) => true
            case (WifiSecTypeEapSuiteB, WifiSecTypeEapSuiteB) => true
            case (WifiSecTypeOWE, WifiSecTypeOWE) => true
            case (WifiSecTypeWapiCert, WifiSecTypeWapiCert) => true
            case (WifiSecTypeWapiPSK, WifiSecTypeWapiPSK) => true
            case _ => false
        }
    }

    /**
     * Obtain the string representation of WifiSecurityType.
     *
     * @throws IllegalArgumentException - Value conversion failed.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case WifiSecTypeInvalid => "WifiSecTypeInvalid"
            case WifiSecTypeOpen => "WifiSecTypeOpen"
            case WifiSecTypeWEP => "WifiSecTypeWEP"
            case WifiSecTypePSK => "WifiSecTypePSK"
            case WifiSecTypeSAE => "WifiSecTypeSAE"
            case WifiSecTypeEAP => "WifiSecTypeEAP"
            case WifiSecTypeEapSuiteB => "WifiSecTypeEapSuiteB"
            case WifiSecTypeOWE => "WifiSecTypeOWE"
            case WifiSecTypeWapiCert => "WifiSecTypeWapiCert"
            case WifiSecTypeWapiPSK => "WifiSecTypeWapiPSK"
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

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    func getValue(): Int32 {
        match (this) {
            case Default => 1
            case Wifi6 => 2
            case Wifi6Plus => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * @throws IllegalArgumentException - Value conversion failed.
     */
    static func parse(val: Int32): WifiCategory {
        match (val) {
            case 1 => Default
            case 2 => Wifi6
            case 3 => Wifi6Plus
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * Obtain the string representation of WifiCategory.
     *
     * @throws IllegalArgumentException - Value conversion failed.
     */
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
