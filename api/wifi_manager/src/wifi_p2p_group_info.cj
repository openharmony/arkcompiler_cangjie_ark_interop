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
    stagemodelonly: true,
    syscap: "SystemCapability.Communication.WiFi.P2P"
]
public class WifiP2pGroupInfo <: ToString {
    WifiP2pGroupInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let isP2pGo: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let ownerInfo: WifiP2pDevice,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let passphrase: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let interfaceName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let groupName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let networkId: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let frequency: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let clientDevices: Array<WifiP2pDevice>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let goIpAddress: String
    ) {}

    init(info: CWifiP2pGroupInfo) {
        this.isP2pGo = info.isP2pGo
        this.networkId = info.networkId
        this.frequency = info.frequency
        this.passphrase = info.passphrase.toString()
        this.interfaceName = info.interfaceName.toString()
        this.groupName = info.groupName.toString()
        this.goIpAddress = info.goIpAddress.toString()
        this.ownerInfo = WifiP2pDevice(info.ownerInfo)
        this.clientDevices = unsafe {
            cArr2cjArr<CWifiP2pDevice, WifiP2pDevice>(info.clientSize, info.clientDevices) {
                cdevice => WifiP2pDevice(cdevice)
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        """
        isP2pGo: ${isP2pGo}, ownerInfo: ${ownerInfo}, passphrase: ${passphrase},
         interfaceName: ${interfaceName}, groupName: ${groupName}, networkId: ${networkId},
         frequency: ${frequency}, clientDevices: ${clientDevices}, goIpAddress: ${goIpAddress}"""
    }
}
