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

package ohos.webview

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import ohos.image.*
import std.collection.*
import std.deriving.*
import ohos.labels.*

const OUT_MEMEORY: Int32 = 17100015
const LOG_DOMAIN: UInt32 = 0xD004500
let WEBVIEW_LOG = HilogChannel(0, LOG_DOMAIN, "CJ-Webview")

foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SecurityLevel {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NONE
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SECURE
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    WARNING
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    DANGEROUS
    | ...

    static func fromInt32(code: Int32): SecurityLevel {
        match (code) {
            case 1 => SECURE
            case 2 => WARNING
            case 3 => DANGEROUS
            case _ => NONE
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebHitTestType {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    EditText
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Email
    | ...

    static func fromInt32(code: Int32): WebHitTestType {
        match (code) {
            case 0 => EditText
            case 1 => Email
            case _ => Unknown
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebHeader {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public WebHeader(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var headerKey: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var headerValue: String
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HitTestValue {
    HitTestValue(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let hitTestType: WebHitTestType,
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let extra: String
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HistoryItem {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public HistoryItem(
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let icon: ?PixelMap,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let historyUrl: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let historyRawUrl: String,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let title: String
    ) {}
}
