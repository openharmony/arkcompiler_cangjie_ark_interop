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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum EapMethod <: Equatable<EapMethod> & ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_PEAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_TLS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_TTLS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_PWD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_SIM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_AKA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_AKA_PRIME
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    EAP_UNAUTH_TLS
    | ...

    func getValue(): Int32 {
        match (this) {
            case EAP_NONE => 0
            case EAP_PEAP => 1
            case EAP_TLS => 2
            case EAP_TTLS => 3
            case EAP_PWD => 4
            case EAP_SIM => 5
            case EAP_AKA => 6
            case EAP_AKA_PRIME => 7
            case EAP_UNAUTH_TLS => 8
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): EapMethod {
        match (val) {
            case 0 => EAP_NONE
            case 1 => EAP_PEAP
            case 2 => EAP_TLS
            case 3 => EAP_TTLS
            case 4 => EAP_PWD
            case 5 => EAP_SIM
            case 6 => EAP_AKA
            case 7 => EAP_AKA_PRIME
            case 8 => EAP_UNAUTH_TLS
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public operator func ==(that: EapMethod): Bool {
        match ((this, that)) {
            case (EAP_NONE, EAP_NONE) => true
            case (EAP_PEAP, EAP_PEAP) => true
            case (EAP_TLS, EAP_TLS) => true
            case (EAP_TTLS, EAP_TTLS) => true
            case (EAP_PWD, EAP_PWD) => true
            case (EAP_SIM, EAP_SIM) => true
            case (EAP_AKA, EAP_AKA) => true
            case (EAP_AKA_PRIME, EAP_AKA_PRIME) => true
            case (EAP_UNAUTH_TLS, EAP_UNAUTH_TLS) => true
            case _ => false
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        match (this) {
            case EAP_NONE => "EAP_NONE"
            case EAP_PEAP => "EAP_PEAP"
            case EAP_TLS => "EAP_TLS"
            case EAP_TTLS => "EAP_TTLS"
            case EAP_PWD => "EAP_PWD"
            case EAP_SIM => "EAP_SIM"
            case EAP_AKA => "EAP_AKA"
            case EAP_AKA_PRIME => "EAP_AKA_PRIME"
            case EAP_UNAUTH_TLS => "EAP_UNAUTH_TLS"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum Phase2Method <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_PAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_MSCHAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_MSCHAPV2
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_GTC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_SIM
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_AKA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    PHASE2_AKA_PRIME
    | ...

    func getValue(): Int32 {
        match (this) {
            case PHASE2_NONE => 0
            case PHASE2_PAP => 1
            case PHASE2_MSCHAP => 2
            case PHASE2_MSCHAPV2 => 3
            case PHASE2_GTC => 4
            case PHASE2_SIM => 5
            case PHASE2_AKA => 6
            case PHASE2_AKA_PRIME => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): Phase2Method {
        match (val) {
            case 0 => PHASE2_NONE
            case 1 => PHASE2_PAP
            case 2 => PHASE2_MSCHAP
            case 3 => PHASE2_MSCHAPV2
            case 4 => PHASE2_GTC
            case 5 => PHASE2_SIM
            case 6 => PHASE2_AKA
            case 7 => PHASE2_AKA_PRIME
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
            case PHASE2_NONE => "PHASE2_NONE"
            case PHASE2_PAP => "PHASE2_PAP"
            case PHASE2_MSCHAP => "PHASE2_MSCHAP"
            case PHASE2_MSCHAPV2 => "PHASE2_MSCHAPV2"
            case PHASE2_GTC => "PHASE2_GTC"
            case PHASE2_SIM => "PHASE2_SIM"
            case PHASE2_AKA => "PHASE2_AKA"
            case PHASE2_AKA_PRIME => "PHASE2_AKA_PRIME"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.Core"
]
public enum WapiPskType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WAPI_PSK_ASCII
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    WAPI_PSK_HEX
    | ...

    func getValue(): Int32 {
        match (this) {
            case WAPI_PSK_ASCII => 0
            case WAPI_PSK_HEX => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WapiPskType {
        match (val) {
            case 0 => WAPI_PSK_ASCII
            case 1 => WAPI_PSK_HEX
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.Core"
    ]
    public func toString(): String {
        match (this) {
            case WAPI_PSK_ASCII => "WAPI_PSK_ASCII"
            case WAPI_PSK_HEX => "WAPI_PSK_HEX"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum WifiStandard <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_UNDEFINED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11A
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11B
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11G
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11N
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11AC
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11AX
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_STANDARD_11AD
    | ...

    func getValue(): Int32 {
        match (this) {
            case WIFI_STANDARD_UNDEFINED => 0
            case WIFI_STANDARD_11A => 1
            case WIFI_STANDARD_11B => 2
            case WIFI_STANDARD_11G => 3
            case WIFI_STANDARD_11N => 4
            case WIFI_STANDARD_11AC => 5
            case WIFI_STANDARD_11AX => 6
            case WIFI_STANDARD_11AD => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiStandard {
        match (val) {
            case 0 => WIFI_STANDARD_UNDEFINED
            case 1 => WIFI_STANDARD_11A
            case 2 => WIFI_STANDARD_11B
            case 3 => WIFI_STANDARD_11G
            case 4 => WIFI_STANDARD_11N
            case 5 => WIFI_STANDARD_11AC
            case 6 => WIFI_STANDARD_11AX
            case 7 => WIFI_STANDARD_11AD
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
            case WIFI_STANDARD_UNDEFINED => "WIFI_STANDARD_UNDEFINED"
            case WIFI_STANDARD_11A => "WIFI_STANDARD_11A"
            case WIFI_STANDARD_11B => "WIFI_STANDARD_11B"
            case WIFI_STANDARD_11G => "WIFI_STANDARD_11G"
            case WIFI_STANDARD_11N => "WIFI_STANDARD_11N"
            case WIFI_STANDARD_11AC => "WIFI_STANDARD_11AC"
            case WIFI_STANDARD_11AX => "WIFI_STANDARD_11AX"
            case WIFI_STANDARD_11AD => "WIFI_STANDARD_11AD"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum ConnState <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    SCANNING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    CONNECTING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    AUTHENTICATING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    OBTAINING_IPADDR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    CONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    DISCONNECTING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    DISCONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    UNKNOWN
    | ...

    func getValue(): Int32 {
        match (this) {
            case SCANNING => 0
            case CONNECTING => 1
            case AUTHENTICATING => 2
            case OBTAINING_IPADDR => 3
            case CONNECTED => 4
            case DISCONNECTING => 5
            case DISCONNECTED => 6
            case UNKNOWN => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): ConnState {
        match (val) {
            case 0 => SCANNING
            case 1 => CONNECTING
            case 2 => AUTHENTICATING
            case 3 => OBTAINING_IPADDR
            case 4 => CONNECTED
            case 5 => DISCONNECTING
            case 6 => DISCONNECTED
            case 7 => UNKNOWN
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
            case SCANNING => "SCANNING"
            case CONNECTING => "CONNECTING"
            case AUTHENTICATING => "AUTHENTICATING"
            case OBTAINING_IPADDR => "OBTAINING_IPADDR"
            case CONNECTED => "CONNECTED"
            case DISCONNECTING => "DISCONNECTING"
            case DISCONNECTED => "DISCONNECTED"
            case UNKNOWN => "UNKNOWN"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum WifiChannelWidth <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_20MHZ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_40MHZ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_80MHZ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_160MHZ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_80MHZ_PLUS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIDTH_INVALID
    | ...

    func getValue(): Int32 {
        match (this) {
            case WIDTH_20MHZ => 0
            case WIDTH_40MHZ => 1
            case WIDTH_80MHZ => 2
            case WIDTH_160MHZ => 3
            case WIDTH_80MHZ_PLUS => 4
            case WIDTH_INVALID => 5
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiChannelWidth {
        match (val) {
            case 0 => WIDTH_20MHZ
            case 1 => WIDTH_40MHZ
            case 2 => WIDTH_80MHZ
            case 3 => WIDTH_160MHZ
            case 4 => WIDTH_80MHZ_PLUS
            case 5 => WIDTH_INVALID
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
            case WIDTH_20MHZ => "WIDTH_20MHZ"
            case WIDTH_40MHZ => "WIDTH_40MHZ"
            case WIDTH_80MHZ => "WIDTH_80MHZ"
            case WIDTH_160MHZ => "WIDTH_160MHZ"
            case WIDTH_80MHZ_PLUS => "WIDTH_80MHZ_PLUS"
            case WIDTH_INVALID => "WIDTH_INVALID"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public enum WifiBandType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_BAND_NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_BAND_2G
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_BAND_5G
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_BAND_6G
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    WIFI_BAND_60G
    | ...

    func getValue(): Int32 {
        match (this) {
            case WIFI_BAND_NONE => 0
            case WIFI_BAND_2G => 1
            case WIFI_BAND_5G => 2
            case WIFI_BAND_6G => 3
            case WIFI_BAND_60G => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): WifiBandType {
        match (val) {
            case 0 => WIFI_BAND_NONE
            case 1 => WIFI_BAND_2G
            case 2 => WIFI_BAND_5G
            case 3 => WIFI_BAND_6G
            case 4 => WIFI_BAND_60G
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
            case WIFI_BAND_NONE => "WIFI_BAND_NONE"
            case WIFI_BAND_2G => "WIFI_BAND_2G"
            case WIFI_BAND_5G => "WIFI_BAND_5G"
            case WIFI_BAND_6G => "WIFI_BAND_6G"
            case WIFI_BAND_60G => "WIFI_BAND_60G"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public enum P2pConnectState <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    DISCONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    CONNECTED
    | ...

    func getValue(): Int32 {
        match (this) {
            case DISCONNECTED => 0
            case CONNECTED => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): P2pConnectState {
        match (val) {
            case 0 => DISCONNECTED
            case 1 => CONNECTED
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        match (this) {
            case DISCONNECTED => "DISCONNECTED"
            case CONNECTED => "CONNECTED"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public enum GroupOwnerBand <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    GO_BAND_AUTO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    GO_BAND_2GHZ
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    GO_BAND_5GHZ
    | ...

    func getValue(): Int32 {
        match (this) {
            case GO_BAND_AUTO => 0
            case GO_BAND_2GHZ => 1
            case GO_BAND_5GHZ => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): GroupOwnerBand {
        match (val) {
            case 0 => GO_BAND_AUTO
            case 1 => GO_BAND_2GHZ
            case 2 => GO_BAND_5GHZ
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        match (this) {
            case GO_BAND_AUTO => "GO_BAND_AUTO"
            case GO_BAND_2GHZ => "GO_BAND_2GHZ"
            case GO_BAND_5GHZ => "GO_BAND_5GHZ"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public enum P2pDeviceStatus <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    CONNECTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    INVITED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    FAILED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    AVAILABLE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    UNAVAILABLE
    | ...

    func getValue(): Int32 {
        match (this) {
            case CONNECTED => 0
            case INVITED => 1
            case FAILED => 2
            case AVAILABLE => 3
            case UNAVAILABLE => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): P2pDeviceStatus {
        match (val) {
            case 0 => CONNECTED
            case 1 => INVITED
            case 2 => FAILED
            case 3 => AVAILABLE
            case 4 => UNAVAILABLE
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        match (this) {
            case CONNECTED => "CONNECTED"
            case INVITED => "INVITED"
            case FAILED => "FAILED"
            case AVAILABLE => "AVAILABLE"
            case UNAVAILABLE => "UNAVAILABLE"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
