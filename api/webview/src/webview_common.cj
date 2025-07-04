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
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SecureDnsMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SECURE_ONLY
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    AUTO
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    OFF
    | ...

    func getValue(): Int32 {
        match (this) {
            case OFF => 0
            case AUTO => 1
            case SECURE_ONLY => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
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
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HttpAnchor
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    HttpAnchorImg
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Img
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Map
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Phone
    | @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Unknown
    | ...

    static func fromInt32(code: Int32): WebHitTestType {
        match (code) {
            case 0 => EditText
            case 1 => Email
            case 2 => HttpAnchor
            case 3 => HttpAnchorImg
            case 4 => Img
            case 5 => Map
            case 6 => Phone
            case _ => Unknown
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebDownloadState {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    IN_PROGRESS
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    COMPLETE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CANCELED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    INTERRUPTED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PENDING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PAUSED
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    UNKNOWN
    | ...

    static func fromInt32(code: Int32): WebDownloadState {
        match (code) {
            case 0 => IN_PROGRESS
            case 1 => COMPLETE
            case 2 => CANCELED
            case 3 => INTERRUPTED
            case 4 => PENDING
            case 5 => PAUSED
            case _ => UNKNOWN
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebDownloadErrorCode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERROR_UNKNOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_ACCESS_DENIED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_NO_SPACE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_NAME_TOO_LONG
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_TOO_LARGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_TRANSIENT_ERROR
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_BLOCKED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_TOO_SHORT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_HASH_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    FILE_SAME_AS_SOURCE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_TIMEOUT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_DISCONNECTED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_SERVER_DOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NETWORK_INVALID_REQUEST
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_FAILED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_NO_RANGE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_BAD_CONTENT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_UNAUTHORIZED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_CERT_PROBLEM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_FORBIDDEN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_UNREACHABLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_CONTENT_LENGTH_MISMATCH
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SERVER_CROSS_ORIGIN_REDIRECT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    USER_CANCELED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    USER_SHUTDOWN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CRASH
    | ...

    static func fromInt32(code: Int32): WebDownloadErrorCode {
        match (code) {
            case 1 => FILE_FAILED
            case 2 => FILE_ACCESS_DENIED
            case 3 => FILE_NO_SPACE
            case 5 => FILE_NAME_TOO_LONG
            case 6 => FILE_TOO_LARGE
            case 10 => FILE_TRANSIENT_ERROR
            case 11 => FILE_BLOCKED
            case 13 => FILE_TOO_SHORT
            case 14 => FILE_HASH_MISMATCH
            case 15 => FILE_SAME_AS_SOURCE
            case 20 => NETWORK_FAILED
            case 21 => NETWORK_TIMEOUT
            case 22 => NETWORK_DISCONNECTED
            case 23 => NETWORK_SERVER_DOWN
            case 24 => NETWORK_INVALID_REQUEST
            case 30 => SERVER_FAILED
            case 31 => SERVER_NO_RANGE
            case 33 => SERVER_BAD_CONTENT
            case 34 => SERVER_UNAUTHORIZED
            case 35 => SERVER_CERT_PROBLEM
            case 36 => SERVER_FORBIDDEN
            case 37 => SERVER_UNREACHABLE
            case 38 => SERVER_CONTENT_LENGTH_MISMATCH
            case 39 => SERVER_CROSS_ORIGIN_REDIRECT
            case 40 => USER_CANCELED
            case 41 => USER_SHUTDOWN
            case 50 => CRASH
            case _ => ERROR_UNKNOWN
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum JsMessageType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NOTSUPPORT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    STRING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NUMBER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    BOOLEAN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAY_BUFFER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAY
    | ...

    static func fromInt32(code: Int32): JsMessageType {
        match (code) {
            case 1 => STRING
            case 2 => NUMBER
            case 3 => BOOLEAN
            case 4 => ARRAY_BUFFER
            case 5 => ARRAY
            case _ => NOTSUPPORT
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum MessageArrayValue {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAYSTRING(Array<String>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAYI64(Array<Int64>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAYF64(Array<Float64>)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAYBOOL(Array<Bool>)
    | ...
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebMessage {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    STRING(String)
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAY_BUFFER(Array<UInt8>)
    | ...
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebMessageType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NOTSUPPORT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    STRING
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NUMBER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    BOOLEAN
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAY_BUFFER
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ARRAY
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ERROR
    | ...

    static func fromInt32(code: Int32): WebMessageType {
        match (code) {
            case 1 => STRING
            case 2 => NUMBER
            case 3 => BOOLEAN
            case 4 => ARRAY_BUFFER
            case 5 => ARRAY
            case 6 => ERROR
            case _ => NOTSUPPORT
        }
    }

    func toInt32(): Int32 {
        match (this) {
            case NOTSUPPORT => 0
            case STRING => 1
            case NUMBER => 2
            case BOOLEAN => 3
            case ARRAY_BUFFER => 4
            case ARRAY => 5
            case ERROR => 6
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum MediaPlaybackState {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PLAYING
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    PAUSED
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    STOPPED
    | ...

    static func fromInt32(code: Int32): MediaPlaybackState {
        match (code) {
            case 1 => PLAYING
            case 2 => PAUSED
            case 3 => STOPPED
            case _ => NONE
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum RenderProcessMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    SINGLE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    MULTIPLE
    | ...

    static func fromInt32(code: Int32): RenderProcessMode {
        match (code) {
            case 0 => SINGLE
            case 1 => MULTIPLE
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case SINGLE => 0
            case MULTIPLE => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum OfflineResourceType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    IMAGE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CSS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CLASSIC_JS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    MODULE_JS
    | ...

    static func fromInt32(code: Int32): OfflineResourceType {
        match (code) {
            case 0 => IMAGE
            case 1 => CSS
            case 2 => CLASSIC_JS
            case 3 => MODULE_JS
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case IMAGE => 0
            case CSS => 1
            case CLASSIC_JS => 2
            case MODULE_JS => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class CacheOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public CacheOptions(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var responseHeaders: Array<WebHeader>
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class RequestInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public RequestInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var url: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var method: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var formData: String
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public SnapshotInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var id!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var size!: SizeOptions = SizeOptions()
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotResult {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public SnapshotResult(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var id: ?String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var image: ?PixelMap,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var status: ?Bool,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public var size: ?SizeOptions
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
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OfflineResourceMap {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public OfflineResourceMap(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        var urlList: Array<String>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        var resource: Array<UInt8>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        var responseHeaders: Array<WebHeader>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        var _type: OfflineResourceType
    ) {}

    func toCOfflineResourceMap(): COfflineResourceMap {
        var resOfflineResourceMap = COfflineResourceMap()
        try {
            unsafe {
                let arr: CPointer<CString> = cjArr2CArr<String, CString>(this.urlList, {str => LibC.mallocCString(str)}) {
                    cstr => LibC.free(cstr)
                }
                resOfflineResourceMap.urlList = CArrString(arr, this.urlList.size)

                resOfflineResourceMap.resourceSize = this.resource.size
                resOfflineResourceMap.resource = LibC.malloc(count: this.resource.size)
                resOfflineResourceMap.resource = cjArr2CArr<UInt8, UInt8>(this.resource, {byte: UInt8 => byte})
                resOfflineResourceMap.responseHeaders = ArrWebHeader(this.responseHeaders) {}
                resOfflineResourceMap._type = this._type.getValue()
            }
        } catch (e: Exception) {
            resOfflineResourceMap.free()
        }
        return resOfflineResourceMap
    }
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

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class Error {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public Error(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let errorName: String,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.Web.Webview.Core"
        ]
        public let errorMsg: String
    ) {}

    static func fromCErrorAndFree(cerr: CError): Error {
        var name: String = ""
        var msg: String = ""
        try {
            name = cerr.errorName.toString()
            msg = cerr.errorMsg.toString()
        } finally {
            unsafe {
                LibC.free(cerr.errorName)
                LibC.free(cerr.errorMsg)
            }
        }
        return Error(name, msg)
    }
}

/**
 * Defines the scroll offset of the webpage in view port, the unit is virtual pixel.
 *
 * @relation interface ScrollOffset
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class ScrollOffset {
    /**
     * Get the horizontal offset.
     *
     * @relation x: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var x: Float32
    /**
     * Get the vertical offset.
     *
     * @relation y: number;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var y: Float32

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }
}

/**
 * Defines the configuration of web custom scheme, related to {@link customizeSchemes} method.
 *
 * @relation interface WebCustomScheme
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebCustomScheme {

    /**
     * Name of the custom scheme.
     *
     * @relation schemeName: string;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var schemeName: String
    /**
     * Whether Cross-Origin Resource Sharing is supported.
     *
     * @relation isSupportCORS: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSupportCORS: Bool = true
    /**
     * Whether fetch request is supported.
     *
     * @relation isSupportFetch: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSupportFetch: Bool = true
    /**
     * If isStandard is true, the scheme will be handled as a standard scheme. The standard
     * schemes needs to comply with the URL normalization and parsing rules defined in Section 3.1 of RFC 1738,
     *
     * @relation isStandard?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isStandard: Bool = true
    /**
     * If isLocal is true, the same security rules as those applied to the "file" URL will be
     * used to handle the scheme.
     *
     * @relation isLocal?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isLocal: Bool = true
    /**
     * If isDisplayIsolated is true, then the scheme can only be displayed from other content
     * hosted using the same scheme.
     *
     * @relation isDisplayIsolated?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isDisplayIsolated: Bool = true
    /**
     * If isSecure is true, the same security rules as those applied to the "https" URL will be
     * used to handle the scheme.
     *
     * @relation isSecure?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSecure: Bool = true
    /**
     * If isCspBypassing is true, then this scheme can bypass Content Security Policy (CSP)
     * checks. In most cases, this value should not be true when isStandard is true.
     *
     * @relation isCspBypassing?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isCspBypassing: Bool = true
    /**
     * If isCodeCacheSupported is true, then the js of this scheme can generate code cache.
     *
     * @relation isCodeCacheSupported?: boolean;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isCodeCacheSupported: Bool = false

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(schemeName: String) {
        this.schemeName = schemeName
    }
}

/**
 * Enum type supplied to {@link setScrollable} for indicating the type of scroll.
 *
 * @relation  enum ScrollType
 */
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum ScrollType {
    /**
     * If isCodeCacheSupported is true, then the js of this scheme can generate code cache.
     *
     * @relation isCodeCacheSupported?: boolean;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    EVENT | ...

    func getValue(): Int32 {
        match (this) {
            case EVENT => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
