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
public class WifiP2pLinkedInfo <: ToString {
    WifiP2pLinkedInfo(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let connectState: P2pConnectState,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let isGroupOwner: Bool,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.P2P"
        ]
        public let groupOwnerAddr: String
    ) {}

    init(info: CWifiP2pLinkedInfo) {
        this.connectState = P2pConnectState.parse(info.connectState)
        this.isGroupOwner = info.isGroupOwner
        this.groupOwnerAddr = info.groupOwnerAddr.toString()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.P2P"
    ]
    public func toString(): String {
        "connectState: ${connectState}, isGroupOwner: ${isGroupOwner}, groupOwnerAddr: ${groupOwnerAddr}"
    }
}
