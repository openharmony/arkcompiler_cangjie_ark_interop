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
public class WifiP2pDevice <: ToString {
    WifiP2pDevice(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let deviceName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let deviceAddress: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let primaryDeviceType: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let deviceStatus: P2pDeviceStatus,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let groupCapabilities: Int32,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let deviceAddressType!: ?DeviceAddressType = None
    ) {}

    init(device: CWifiP2pDevice) {
        this.deviceName = device.deviceName.toString()
        this.deviceAddress = device.deviceAddress.toString()
        this.primaryDeviceType = device.primaryDeviceType.toString()
        this.deviceStatus = P2pDeviceStatus.parse(device.deviceStatus)
        this.groupCapabilities = device.groupCapabilities
        this.deviceAddressType = DeviceAddressType.parse(device.deviceAddressType)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        """
        deviceName: ${deviceName}, deviceAddress: ${deviceAddress}, primaryDeviceType: ${primaryDeviceType},
         deviceStatus: ${deviceStatus}, groupCapabilities: ${groupCapabilities}, deviceAddressType: ${deviceAddressType}"""
    }
}
