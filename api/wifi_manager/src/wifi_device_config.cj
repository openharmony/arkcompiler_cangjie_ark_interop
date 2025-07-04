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

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public class WifiDeviceConfig <: ToString {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public WifiDeviceConfig(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let ssid: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let preSharedKey: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let securityType: WifiSecurityType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let bssid!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let bssidType!: ?DeviceAddressType = RANDOM_DEVICE_ADDRESS,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let isHiddenSsid!: ?Bool = false,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public var eapConfig!: ?WifiEapConfig = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public var wapiConfig!: ?WifiWapiConfig = None
    ) {
        if (securityType == WIFI_SEC_TYPE_WAPI_CERT || securityType == WIFI_SEC_TYPE_WAPI_PSK) {
            match (wapiConfig) {
                case Some(_) => ()
                case None => throw IllegalArgumentException(
                    "When securityType is WIFI_SEC_TYPE_WAPI_CERT or WIFI_SEC_TYPE_WAPI_PSK, eapConfig must be set")
            }
        } else {
            this.wapiConfig = None
        }

        if (securityType == WIFI_SEC_TYPE_EAP || securityType == WIFI_SEC_TYPE_EAP_SUITE_B) {
            match (eapConfig) {
                case Some(_) => ()
                case None => throw IllegalArgumentException(
                    "When securityType is WIFI_SEC_TYPE_EAP or WIFI_SEC_TYPE_EAP_SUITE_B, wapiConfig must be set")
            }
        } else {
            this.wapiConfig = None
        }
    }

    init(cfg: CWifiDeviceConfig) {
        this.ssid = cfg.ssid.toString()
        this.preSharedKey = cfg.preSharedKey.toString()
        this.securityType = WifiSecurityType.parse(cfg.securityType)
        this.bssid = if (cfg.bssid.isNull()) {
            None
        } else {
            cfg.bssid.toString()
        }
        this.bssidType = DeviceAddressType.tryParse(cfg.bssidType)
        this.isHiddenSsid = cfg.isHiddenSsid
        this.eapConfig = if (cfg.eapConfig.isNone) {
            None
        } else {
            WifiEapConfig(cfg.eapConfig)
        }
        this.wapiConfig = if (cfg.wapiConfig.isNone) {
            None
        } else {
            WifiWapiConfig(cfg.wapiConfig)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        """
        ssid: ${ssid}, preSharedKey: ${preSharedKey}, securityType: ${securityType},
         bssid: ${bssid}, bssidType: ${bssidType}, isHiddenSsid: ${isHiddenSsid},
         eapConfig: ${eapConfig}, wapiConfig: ${wapiConfig}"""
    }
}
