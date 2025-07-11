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
public class WifiInfoElem <: ToString {

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public let eid: UInt32
    
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public let content: Array<UInt8>

    init(eid: UInt32, content: Array<UInt8>) {
        this.eid = eid
        this.content = content
    }

    init(info: CWifiInfoElem) {
        this.eid = info.eid
        this.content = unsafe {
            cArr2cjArr<UInt8, UInt8>(info.content.size, info.content.head) {
                i => i
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.WiFi.STA"
    ]
    public func toString(): String {
        "eid: ${eid}, content: ${content}"
    }
}
