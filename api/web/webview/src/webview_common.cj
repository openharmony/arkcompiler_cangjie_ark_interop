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

package ohos.web.webview

import ohos.base.SizeOptions
import ohos.ffi.{ CArrString, cjArr2CArr }
import ohos.hilog.HilogChannel
import ohos.multimedia.image.PixelMap
import ohos.labels.APILevel

import std.deriving.Derive


const OUT_MEMEORY: Int32 = 17100015
const LOG_DOMAIN: UInt32 = 0xD004500
let WEBVIEW_LOG = HilogChannel(0, LOG_DOMAIN, "CJ-Webview")

foreign func memcpy_s(dest: CPointer<UInt8>, destMax: UIntNative, src: CPointer<UInt8>, count: UIntNative): Int32

/**
 * Defines the security level for the page.
 *
 * @relation enum SecurityLevel
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum SecurityLevel {
    /**
     * Unable to determine whether it is safe or not, the non-http/https protocol used.
     *
     * @relation NONE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    NoneLevel
    |
    /**
     * Indicates the HTTPS protocol used by the page and the authentication is successful.
     *
     * @relation SECURE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Secure
    |
    /**
     * The page is insecure. For example, the HTTP protocol is used or the HTTPS protocol
     * is used but use an legacy TLS version.
     *
     * @relation WARNING = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Warning
    |
    /**
     * Attempted HTTPS and failed, the authentication is failed.
     *
     * @relation DANGEROUS = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Dangerous
    | ...

    static func fromInt32(code: Int32): SecurityLevel {
        match (code) {
            case 1 => Secure
            case 2 => Warning
            case 3 => Dangerous
            case _ => NoneLevel
        }
    }
}

/**
 * Enum type supplied to {@link getHitTest} for indicating the cursor node HitTest.
 *
 * @relation enum WebHitTestType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum WebHitTestType {
    /**
     * The edit text.
     *
     * @relation EditText = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    EditText
    |
    /**
     * The email address.
     *
     * @relation Email = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Email
    |
    /**
     * Other unknown HitTest.
     *
     * @relation Unknown = 7
     */
    @!APILevel[
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

/**
 * Enum type supplied to {@link OfflineResourceMap} for indicating the type of resource.
 *
 * @relation enum OfflineResourceType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public enum OfflineResourceType {
    /**
     * Resource of the image type.
     *
     * @relation IMAGE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    Image
    |
    /**
     * Resource of the CSS type.
     *
     * @relation CSS = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    CSS
    |
    /**
     * Javascript resource loaded through the <script src="" /> tag.
     *
     * @relation CLASSIC_JS = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ClassicJS
    |
    /**
     * Javascript resource loaded through the <script src="" type="module" /> tag.
     *
     * @relation MODULE_JS = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    ModuleJs
    | ...

    static func fromInt32(code: Int32): OfflineResourceType {
        match (code) {
            case 0 => Image
            case 1 => CSS
            case 2 => ClassicJS
            case 3 => ModuleJs
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Image => 0
            case CSS => 1
            case ClassicJS => 2
            case ModuleJs => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Defines the Web's request/response header.
 *
 * @relation interface WebHeader
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebHeader {
    /**
     * Gets the key of the request/response header.
     *
     * @relation headerKey: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerKey: String

    /**
     * Gets the value of the request/response header.
     *
     * @relation headerValue: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var headerValue: String

    /**
     * WebHeader constructor.
     */
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

/**
 * Options of generating code cache
 *
 * @relation interface CacheOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class CacheOptions {
    /**
     * Response headers used to configure the validation key of code cache.
     * Currently only support E-Tag and Last-Modified.
     *
     * @relation responseHeaders: Array<WebHeader>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var responseHeaders: Array<WebHeader>

    /**
     * CacheOptions constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(responseHeaders: Array<WebHeader>) {
        this.responseHeaders = responseHeaders
    }
}

/**
 * Defines the snapshot info.
 *
 * @relation interface SnapshotInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotInfo {
    /**
     * Id of the snapshot.
     *
     * @relation id?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var id: String = ""

    /**
     * Size of the web.
     *
     * @relation size?: SizeOptions
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var size: SizeOptions = SizeOptions()

    /**
     * SnapshotInfo constructor.
     */
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

/**
 * Defines the snapshot result.
 *
 * @relation interface SnapshotResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class SnapshotResult {
    /**
     * Id of the snapshot.
     *
     * @relation id?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var id: ?String

    /**
     * The image in PixelMap format.
     *
     * @relation imagePixelMap?: image.PixelMap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var imagePixelMap: ?PixelMap

    /**
     * The status of the snapshot.
     *
     * @relation status?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var status: ?Bool

    /**
     * Size of the web.
     *
     * @relation size?: SizeOptions
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var size: ?SizeOptions

    /**
     * SnapshotResult constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(id: ?String, imagePixelMap: ?PixelMap, status: ?Bool, size: ?SizeOptions) {
        this.id = id
        this.imagePixelMap = imagePixelMap
        this.status = status
        this.size = size
    }
}

/**
 * Provides element information of the click area. related to {@link getLastHitTest} method.
 *
 * @relation interface HitTestValue
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HitTestValue {
    /**
     * Get the hit test type.
     *
     * @relation type: WebHitTestType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var hitTestType: WebHitTestType

    /**
     * Get the hit test extra data.
     * If the clicked area is an image or a link, the additional parameter information is it's URL address.
     *
     * @relation extra: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var extra: String

    init(hitTestType: WebHitTestType, extra: String) {
        this.hitTestType = hitTestType
        this.extra = extra
    }
}

/**
 * Define offline resource's content and info.
 *
 * @relation interface OfflineResourceMap
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class OfflineResourceMap {
    /**
     * Url list of resource. Url of urlList must be HTTP/HTTPS protocol and no longer than 2048.
     *
     * @relation urlList: Array<string>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var urlList: Array<String>

    /**
     * Arraybuffer of resource. Size must less than 10Mb and cannot be empty.
     *
     * @relation resource: Uint8Array
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var resource: Array<UInt8>

    /**
     * Response headers of resource.
     *
     * @relation responseHeaders: Array<WebHeader>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var responseHeaders: Array<WebHeader>

    /**
     * Resource type
     *
     * @relation type: OfflineResourceType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var offlineResourceType: OfflineResourceType

    /**
     * OfflineResourceMap constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(urlList: Array<String>, resource: Array<UInt8>, responseHeaders: Array<WebHeader>, offlineResourceType: OfflineResourceType) {
        this.urlList = urlList
        this.resource = resource
        this.responseHeaders = responseHeaders
        this.offlineResourceType = offlineResourceType
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
                resOfflineResourceMap.offlineResourceType = this.offlineResourceType.getValue()
            }
        } catch (e: Exception) {
            resOfflineResourceMap.free()
        }
        return resOfflineResourceMap
    }
}

/**
 * Provides information for history item in BackForwardList.
 *
 * @relation interface HistoryItem
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class HistoryItem {
    /**
     * Pixelmap of icon.
     *
     * @relation icon: image.PixelMap
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var icon: ?PixelMap

    /**
     * Url of this history item.
     *
     * @relation historyUrl: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var historyUrl: String

    /**
     * Original request url of this history item.
     *
     * @relation historyRawUrl: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var historyRawUrl: String

    /**
     * Title of this history item.
     *
     * @relation title: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var title: String

    /**
     * HistoryItem constructor.
     */
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Web.Webview.Core"
]
public class WebCustomScheme {
    /**
     * Name of the custom scheme.
     *
     * @relation schemeName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var schemeName: String

    /**
     * Whether Cross-Origin Resource Sharing is supported.
     *
     * @relation isSupportCORS: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSupportCORS: Bool = true

    /**
     * Whether fetch request is supported.
     *
     * @relation isSupportFetch: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSupportFetch: Bool = true

    /**
     * If isStandard is true, the scheme will be handled as a standard scheme. The standard
     * schemes needs to comply with the URL normalization and parsing rules defined in Section 3.1 of RFC 1738,
     *
     * @relation isStandard?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isStandard: Bool = true

    /**
     * If isLocal is true, the same security rules as those applied to the "file" URL will be
     * used to handle the scheme.
     *
     * @relation isLocal?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isLocal: Bool = true

    /**
     * If isDisplayIsolated is true, then the scheme can only be displayed from other content
     * hosted using the same scheme.
     *
     * @relation isDisplayIsolated?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isDisplayIsolated: Bool = true

    /**
     * If isSecure is true, the same security rules as those applied to the "https" URL will be
     * used to handle the scheme.
     *
     * @relation isSecure?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isSecure: Bool = true

    /**
     * If isCspBypassing is true, then this scheme can bypass Content Security Policy (CSP)
     * checks. In most cases, this value should not be true when isStandard is true.
     *
     * @relation isCspBypassing?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isCspBypassing: Bool = true

    /**
     * If isCodeCacheSupported is true, then the js of this scheme can generate code cache.
     *
     * @relation isCodeCacheSupported?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public var isCodeCacheSupported: Bool = false

    /**
     * WebCustomScheme constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Web.Webview.Core"
    ]
    public init(schemeName: String) {
        this.schemeName = schemeName
    }
}
