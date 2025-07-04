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
    syscap: "SystemCapability.Communication.WiFi.STA"
]
public class Ipv6Info <: ToString {
    Ipv6Info(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let linkIpv6Address: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let globalIpv6Address: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let randomGlobalIpv6Address: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let gateway: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let netmask: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let primaryDNS: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let secondDNS: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let uniqueIpv6Address!: ?String = None,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let randomUniqueIpv6Address!: ?String = None
    ) {}

    init(info: CIpv6Info) {
        this.linkIpv6Address = info.linkIpv6Address.toString()
        this.globalIpv6Address = info.globalIpv6Address.toString()
        this.randomGlobalIpv6Address = info.randomGlobalIpv6Address.toString()
        this.gateway = info.gateway.toString()
        this.netmask = info.netmask.toString()
        this.primaryDNS = info.primaryDNS.toString()
        this.secondDNS = info.secondDNS.toString()
        this.uniqueIpv6Address = if (info.uniqueIpv6Address.isNull()) {
            None
        } else {
            info.uniqueIpv6Address.toString()
        }
        this.randomUniqueIpv6Address = if (info.randomUniqueIpv6Address.isNull()) {
            None
        } else {
            info.randomUniqueIpv6Address.toString()
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        """
        linkIpv6Address: ${linkIpv6Address}, globalIpv6Address: ${globalIpv6Address},
         randomGlobalIpv6Address: ${randomGlobalIpv6Address}, gateway: ${gateway},
         netmask: ${netmask}, primaryDNS: ${primaryDNS}, secondDNS: ${secondDNS},
         uniqueIpv6Address: ${uniqueIpv6Address}, randomUniqueIpv6Address: ${randomUniqueIpv6Address}"""
    }
}
