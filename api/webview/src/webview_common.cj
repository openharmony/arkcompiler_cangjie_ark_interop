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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SecurityLevel {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NoneLevel
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Secure
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Warning
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Dangeous
    | ...

    static func fromInt32(code: Int32): SecurityLevel {
        match (code) {
            case 1 => Secure
            case 2 => Warning
            case 3 => Dangeous
            case _ => NoneLevel
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebHitTestType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    EditText
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Email
    | @!APILevel[
        21,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum OfflineResourceType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Image
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Css
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ClassicJS
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ModuleJs
    | ...

    static func fromInt32(code: Int32): OfflineResourceType {
        match (code) {
            case 0 => Image
            case 1 => Css
            case 2 => ClassicJS
            case 3 => ModuleJs
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Image => 0
            case Css => 1
            case ClassicJS => 2
            case ModuleJs => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebHeader {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerKey: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerValue: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(headerKey: String, headerValue: String) {
        this.headerKey = headerKey
        this.headerValue = headerValue
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class CacheOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var responseHeaders: Array<WebHeader>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(responseHeaders: Array<WebHeader>) {
        this.responseHeaders = responseHeaders
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var id: String = ""

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var size: SizeOptions = SizeOptions()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(id!: String = "", size!: SizeOptions = SizeOptions()) {
        this.id = id
        this.size = size
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var id: ?String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var image: ?PixelMap

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var status: ?Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var size: ?SizeOptions

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(id: ?String, image: ?PixelMap, status: ?Bool, size: ?SizeOptions) {
        this.id = id
        this.image = image
        this.status = status
        this.size = size
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HitTestValue {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let hitTestType: WebHitTestType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let extra: String

    init(hitTestType: WebHitTestType, extra: String) {
        this.hitTestType = hitTestType
        this.extra = extra
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OfflineResourceMap {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    var urlList: Array<String>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    var resource: Array<UInt8>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    var responseHeaders: Array<WebHeader>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    var type_: OfflineResourceType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(urlList: Array<String>, resource: Array<UInt8>, responseHeaders: Array<WebHeader>, `type`: OfflineResourceType) {
        this.urlList = urlList
        this.resource = resource
        this.responseHeaders = responseHeaders
        this.type_ = `type`
    }

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
                resOfflineResourceMap.type_ = this.type_.getValue()
            }
        } catch (e: Exception) {
            resOfflineResourceMap.free()
        }
        return resOfflineResourceMap
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HistoryItem {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let icon: ?PixelMap

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let historyUrl: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let historyRawUrl: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public let title: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(icon: ?PixelMap, historyUrl: String, historyRawUrl: String, title: String) {
        this.icon = icon
        this.historyUrl = historyUrl
        this.historyRawUrl = historyRawUrl
        this.title = title
    }
}

/**
 * Defines the configuration of web custom scheme, related to {@link customizeSchemes} method.
 *
 * @relation interface WebCustomScheme
 */
@!APILevel[
    20,
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
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isCodeCacheSupported: Bool = false

    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(schemeName: String) {
        this.schemeName = schemeName
    }
}
