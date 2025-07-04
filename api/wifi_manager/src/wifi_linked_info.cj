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
public class WifiLinkedInfo <: ToString {
    WifiLinkedInfo(
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
        public let bssid: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let rssi: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let band: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let linkSpeed: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let rxLinkSpeed: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let maxSupportedTxLinkSpeed: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let maxSupportedRxLinkSpeed: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let frequency: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let isHidden: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let isRestricted: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let macType: Int32, // Type of macAddress: 0 - real mac, 1 - random mac.
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let macAddress: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let ipAddress: UInt32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let connState: ConnState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let channelWidth: WifiChannelWidth,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let wifiStandard: WifiStandard,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let supportedWifiCategory: WifiCategory,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let isHiLinkNetwork: Bool
    ) {}

    init(info: CWifiLinkedInfo) {
        this.ssid = info.ssid.toString()
        this.bssid = info.bssid.toString()
        this.rssi = info.rssi
        this.band = info.band
        this.linkSpeed = info.linkSpeed
        this.rxLinkSpeed = info.rxLinkSpeed
        this.maxSupportedTxLinkSpeed = info.maxSupportedTxLinkSpeed
        this.maxSupportedRxLinkSpeed = info.maxSupportedRxLinkSpeed
        this.frequency = info.frequency
        this.isHidden = info.isHidden
        this.isRestricted = info.isRestricted
        this.macType = info.macType
        this.macAddress = info.macAddress.toString()
        this.ipAddress = info.ipAddress
        this.connState = ConnState.parse(info.connState)
        this.channelWidth = WifiChannelWidth.parse(info.channelWidth)
        this.wifiStandard = WifiStandard.parse(info.wifiStandard)
        this.supportedWifiCategory = WifiCategory.parse(info.supportedWifiCategory)
        this.isHiLinkNetwork = info.isHiLinkNetwork
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        """
        ssid: ${ssid}, bssid: ${bssid}, rssi: ${rssi}, band: ${band}, linkSpeed: ${linkSpeed},
         rxLinkSpeed: ${rxLinkSpeed}, maxSupportedTxLinkSpeed: ${maxSupportedTxLinkSpeed},
         maxSupportedRxLinkSpeed: ${maxSupportedRxLinkSpeed}, frequency: ${frequency}, isHidden: ${isHidden},
         isRestricted: ${isRestricted}, macType: ${macType}, macAddress: ${macAddress}, ipAddress: ${ipAddress}
         connState: ${connState}, channelWidth: ${channelWidth}, wifiStandard: ${wifiStandard},
         supportedWifiCategory: ${supportedWifiCategory}, isHiLinkNetwork: ${isHiLinkNetwork}"""
    }
}
