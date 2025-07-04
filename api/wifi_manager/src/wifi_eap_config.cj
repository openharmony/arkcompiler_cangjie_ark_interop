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
public class WifiEapConfig <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public WifiEapConfig(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let eapMethod: EapMethod,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let phase2Method: Phase2Method,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let identity: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let anonymousIdentity: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let password: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let caCertAlias: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let caPath: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let clientCertAlias: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let certEntry: Array<UInt8>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let certPassword: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let altSubjectMatch: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let domainSuffixMatch: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let realm: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let plmn: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.WiFi.STA"
        ]
        public let eapSubId: Int32
    ) {
        match (eapMethod) {
            case EAP_NONE => throw IllegalArgumentException("eapMethod cannot be EAP_NONE")
            case _ => ()
        }
    }

    init(cfg: CWifiEapConfig) {
        this.eapMethod = EapMethod.parse(cfg.eapMethod)
        this.phase2Method = Phase2Method.parse(cfg.phase2Method)
        this.identity = cfg.identity.toString()
        this.anonymousIdentity = cfg.anonymousIdentity.toString()
        this.password = cfg.password.toString()
        this.caCertAlias = cfg.caCertAlias.toString()
        this.caPath = cfg.caPath.toString()
        this.clientCertAlias = cfg.clientCertAlias.toString()
        this.certEntry = unsafe {
            cArr2cjArr(cfg.certEntry.size, cfg.certEntry.head) {
                i: UInt8 => i
            }
        }
        this.certPassword = cfg.certPassword.toString()
        this.altSubjectMatch = cfg.altSubjectMatch.toString()
        this.domainSuffixMatch = cfg.domainSuffixMatch.toString()
        this.realm = cfg.realm.toString()
        this.plmn = cfg.plmn.toString()
        this.eapSubId = cfg.eapSubId
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        """
        eapMethod: ${eapMethod}, phase2Method: ${phase2Method}, identity: ${identity},
         anonymousIdentity: ${anonymousIdentity}, password: ${password}, caCertAlias: ${caCertAlias},
         caPath: ${caPath}, clientCertAlias: ${clientCertAlias}, certEntry: ${certEntry},
         certPassword: ${certPassword}, altSubjectMatch: ${altSubjectMatch}, domainSuffixMatch: ${domainSuffixMatch},
         realm: ${realm}, plmn: ${plmn}, eapSubId: ${eapSubId}"""
    }
}
