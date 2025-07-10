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
            case _ => Unknown
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
