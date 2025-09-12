# ohos.webview (Webview)

Provides web control capabilities, enabling components to display web pages.

## Import Module

```cangjie
import kit.ArkWeb.*
```

## Permission List

ohos.permission.APPROXIMATELY_LOCATION

ohos.permission.LOCATION

ohos.permission.LOCATION_IN_BACKGROUND

ohos.permission.INTERNET

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Interface Usage Instructions](../../cj-development-intro.md#Interface usage instructions).

## class BackForwardList

```cangjie
public class BackForwardList {}
```

**Description:** The history information list of the current Webview.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### prop currentIndex

```cangjie
public prop currentIndex: Int32
```

**Description:** The index of the current page in the history list.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### prop size

```cangjie
public prop size: Int32
```

**Description:** The number of indices in the history list, with a maximum of 50 entries. Older records will be overwritten when exceeded.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### func getItemAtIndex(Int32)

```cangjie
public func getItemAtIndex(index: Int32): HistoryItem
```

**Description:** Retrieves the history item information at the specified index in the history list.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter
| Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int32 | Yes | - | The specified index in the history list. |

**Return Value:**

| Type | Description |
|:----|:----|
| [HistoryItem](#class-historyitem) | The history item. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter.@syscap SystemCapability.Web.Webview.Core@brief getItemAtIndex(index: number): HistoryItem |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getItemAtIndex")
            .onClick {
                evt =>
                AppLog.info("getItemAtIndex")
                let backForwardList = webController.getBackForwardEntries()
                let historyItem = backForwardList.getItemAtIndex(backForwardList.currentIndex)
                AppLog.info("Current historyUrl is ${historyItem.historyUrl}.")
                AppLog.info("Current historyRawUrl is ${historyItem.historyRawUrl}.")
                AppLog.info("Current title is ${historyItem.title}.")
                let pixelMap = historyItem.icon
                let byteInfo = pixelMap?.getPixelBytesNumber() ?? 0
                AppLog.info("icon byteInfo is ${byteInfo}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

## class CacheOptions

```cangjie
public class CacheOptions {
    public CacheOptions(
        public var responseHeaders: Array<WebHeader>
    )
}
```

**Description:** Configuration object for precompiling JavaScript into bytecode cache in Web components, used to control bytecode cache updates.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var responseHeaders

```cangjie
public var responseHeaders: Array<WebHeader>
```

**Description:** The response headers returned by the server when requesting this JavaScript file, using E-Tag or Last-Modified to identify file versions and determine whether updates are needed.

**Type:** Array\<[WebHeader](#class-webheader)>

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### CacheOptions(Array\<WebHeader>)

```cangjie
public CacheOptions(
    public var responseHeaders: Array<WebHeader>
)
```

**Description:** The main constructor of CacheOptions.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| responseHeaders | Array\<[WebHeader](#class-webheader)> | Yes | - | The response headers returned by the server when requesting this JavaScript file, using E-Tag or Last-Modified to identify file versions and determine whether updates are needed. |

## class HistoryItem

```cangjie
public class HistoryItem {
    public HistoryItem(
        public let icon: ?PixelMap,
        public let historyUrl: String,
        public let historyRawUrl: String,
        public let title: String
    )
}
```

**Description:** Page history item.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let historyRawUrl

```cangjie
public let historyRawUrl: String
```

**Description:** The original URL address of the history item.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let historyUrl

```cangjie
public let historyUrl: String
```

**Description:** The URL address of the history item.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let icon

```cangjie
public let icon: ?PixelMap
```

**Description:** The PixelMap object of the history page icon.

**Type:** ?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let title

```cangjie
public let title: String
```

**Description:** The title of the history item.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### HistoryItem(?PixelMap, String, String, String)

```cangjie
public HistoryItem(
    public let icon: ?PixelMap,
    public let historyUrl: String,
    public let historyRawUrl: String,
    public let title: String
)
```

**Description:** Constructs a HistoryItem object.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| icon | ?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap) | Yes | - | The PixelMap object of the history page icon. |
| historyUrl | String | Yes | - | The URL address of the history record item. |
| historyRawUrl | String | Yes | - | The original URL address of the history record item. |
| title | String | Yes | - | The title of the history record item. |

## class HitTestValue

```cangjie
public class HitTestValue {}
```

**Function:** Provides information about elements in the clicked area. For sample code, refer to [getHitTestValue](#func-gethittestvalue).

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let extra

```cangjie
public let extra: String
```

**Function:** Additional parameter information for the clicked area. If the clicked area is an image or link, the additional parameter information is its URL address.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let hitTestType

```cangjie
public let hitTestType: WebHitTestType
```

**Function:** The element type of the currently clicked area.

**Type:** [WebHitTestType](#enum-webhittesttype)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

## class OfflineResourceMap

```cangjie
public class OfflineResourceMap {
    public OfflineResourceMap(
        var urlList: Array<String>,
        var resource: Array<UInt8>,
        var responseHeaders: Array<WebHeader>,
        var _type: OfflineResourceType
    )
}
```

**Function:** A local offline resource configuration object used to configure information about local offline resources that will be injected into the memory cache by the [injectOfflineResources](#func-injectofflineresourcesarrayofflineresourcemap) interface. The kernel generates resource caches based on this information and controls the cache validity period accordingly.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### OfflineResourceMap(Array\<String>, Array\<UInt8>, Array\<WebHeader>, OfflineResourceType)

```cangjie
public OfflineResourceMap(
    var urlList: Array<String>,
    var resource: Array<UInt8>,
    var responseHeaders: Array<WebHeader>,
    var _type: OfflineResourceType
)
```

**Function:** The main constructor of OfflineResourceMap.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| urlList | Array\<String> | Yes | - | The list of network addresses corresponding to the local offline resources. The first item in the list will be used as the origin of the resource. If only one network address is provided, that address will be used as the origin of the resource. URLs must use the http or https protocol and should not exceed 2048 characters in length. |
| resource | Array\<UInt8> | Yes | - | The content of the local offline resource. |
| responseHeaders | Array\<[WebHeader](#class-webheader)> | Yes | - | The HTTP response headers corresponding to the resource. |
| _type | [OfflineResourceType](#enum-offlineresourcetype) | Yes | - | The type of the resource. Currently, only Javascript, image, and CSS type resources are supported. |

## class SnapshotInfo

```cangjie
public class SnapshotInfo {
    public SnapshotInfo(
        public var id!: String = "",
        public var size!: SizeOptions = SizeOptions()
    )
}
```

**Function:** Parameters for obtaining full rendering results.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var id

```cangjie
public var id: String = ""
```

**Function:** The ID of the snapshot.

**Type:** String

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var size

```cangjie
public var size: SizeOptions = SizeOptions()
```

**Function:** The dimensions of the web rendering, supporting up to 16000px * 16000px. Length units include px, vp, and %. Different parameters must use the same unit. The default unit is vp. If the specification is exceeded, the maximum specification will be returned. When only numbers are provided, the unit is vp.

Example: width:‘100px’, height:‘200px’. Or width:‘20%’, height’30%'.

**Type:** [SizeOptions](#struct-sizeoptions)

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### SnapshotInfo(String, SizeOptions)

```cangjie
public SnapshotInfo(
    public var id!: String = "",
    public var size!: SizeOptions = SizeOptions()
)
```

**Function:** The main constructor of SnapshotInfo.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| id | String | No | "" | **Named parameter.** The ID of the snapshot. |
| size | [SizeOptions](#struct-sizeoptions) | No | SizeOptions() | **Named parameter.** The dimensions of the web rendering. |

## class SnapshotResult

```cangjie
public class SnapshotResult {
    public SnapshotResult(
        public var id: ?String,
        public var image: ?PixelMap,
        public var status: ?Bool,
        public var size: ?SizeOptions
    )
}
```

**Function:** Callback results for full rendering.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var id

```cangjie
public var id:?String
```

**Function:** The ID of the snapshot.

**Type:** ?String

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var image

```cangjie
public var image:?PixelMap
```

**Function:** Full rendering results in [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap) format.

**Type:** ?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var size

```cangjie
public var size:?SizeOptions
```

**Function:** The actual dimensions of the web rendering, with the default unit being vp.

**Type:** ?[SizeOptions](#struct-sizeoptions)

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var status

```cangjie
public var status:?Bool
```

**Function:** The status of the snapshot. True indicates normal, and false indicates failure. If obtaining full rendering results fails, the size length and width will be 0, and the map will be empty.

**Type:** ?Bool

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### SnapshotResult(?String, ?PixelMap, ?Bool, ?SizeOptions)

```cangjie
public SnapshotResult(
    public var id: ?String,
    public var image: ?PixelMap,
    public var status: ?Bool,
    public var size: ?SizeOptions
)
```

**Function:** The main constructor of SnapshotResult.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| id | ?String | Yes | - | The ID of the snapshot. |
| image | [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap) | Yes | - | Full rendering results in [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap) format. |
| status | ?Bool | Yes | - | The status of the snapshot. True indicates normal, and false indicates failure. If obtaining full rendering results fails, the size length and width will be 0, and the map will be empty. |
| size | [SizeOptions](#struct-sizeoptions) | Yes | - | The actual dimensions of the web rendering, with the default unit being vp. |

## class WebCookieManager

```cangjie
public class WebCookieManager {}
```

**Function:** WebCookieManager can control various behaviors of cookies in Web components. All Web components within an application share a single WebCookieManager instance.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### static func clearAllCookies(Bool)

```cangjie
public static func clearAllCookies(incognito!: Bool = false): Unit
```

**Function:** Clears all cookies.

**System Capability:** SystemCapability.Web.Webview.Core**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| incognito | Bool | No | false | **Named parameter.** `true` indicates clearing all in-memory cookies of the WebView in incognito mode, while `false` indicates clearing all cookies in normal non-incognito mode. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkWeb.*
import kit.UIKit.Web

WebCookieManager.clearAllCookies()
```

### static func clearSessionCookie()

```cangjie
public static func clearSessionCookie(): Unit
```

**Function:** Clears all session cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkWeb.*

WebCookieManager.clearSessionCookie()
```

### static func configCookie(String, String, Bool)

```cangjie
public static func configCookie(url: String, value: String, incognito!: Bool = false): Unit
```

**Function:** Sets the cookie value for the specified URL.

> **Note:**
>
> - The `url` parameter specifies the domain name to ensure that cookies are also attached to requests within the page.
> - It is recommended to synchronize cookies before loading the WebView component.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL to which the cookie belongs. A complete URL is recommended. |
| value | String | Yes | - | The value of the cookie to be set. |
| incognito | Bool | No | false | **Named parameter.** `true` indicates setting cookies for the specified URL in incognito mode, while `false` indicates setting cookies for the specified URL in normal non-incognito mode. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100002 | Invalid URL. |
  | 17100005 | Invalid cookie value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkWeb.*

WebCookieManager.configCookie("https://www.example.com", "a=b,c=d,e=f")
```

### static func existCookie(Bool)

```cangjie
public static func existCookie(incognito!: Bool = false): Bool
```

**Function:** Checks whether cookies exist in WebCookieManager.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| incognito | Bool | No | false | **Named parameter.** `true` indicates checking for cookies in incognito mode, while `false` indicates checking for cookies in normal non-incognito mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | `true` indicates cookies exist, while `false` indicates no cookies exist. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*

let result = WebCookieManager.existCookie()
AppLog.info("WebCookiemanager result: ${result}")
```

### static func fetchCookie(String, Bool)

```cangjie
public static func fetchCookie(url: String, incognito!: Bool = false): String
```

**Function:** Retrieves the cookie value for the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL to which the cookie belongs. A complete URL is recommended. |
| incognito | Bool | No | false | **Named parameter.** `true` retrieves in-memory cookies of the WebView in incognito mode, while `false` retrieves cookies in normal non-incognito mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The cookie value corresponding to the specified URL. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100002 | Invalid URL. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*

let value = WebCookieManager.fetchCookie("https://www.example.com")
AppLog.info("WebCookieManager,fetchCookie cookie = ${value}")
```

### static func isCookieAllowed()

```cangjie
public static func isCookieAllowed(): Bool
```

**Function:** Checks whether the WebCookieManager instance has permission to send and receive cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the instance has permission to send and receive cookies. `true` indicates permission is granted, while `false` indicates permission is denied. Default is `true`. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*

let result = WebCookieManager.isCookieAllowed()
AppLog.info("WebCookieManager, result: ${result}")
```

### static func isThirdPartyCookieAllowed()

```cangjie
public static func isThirdPartyCookieAllowed(): Bool
```

**Function:** Checks whether the WebCookieManager instance has permission to send and receive third-party cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether the instance has permission to send and receive third-party cookies. `true` indicates permission is granted, while `false` indicates permission is denied. Default is `false`. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*

let result = WebCookieManager.isThirdPartyCookieAllowed()
AppLog.info("WebCookieManager, result: ${result}")
```

### static func putAcceptCookieEnabled(Bool)

```cangjie
public static func putAcceptCookieEnabled(accept: Bool): Unit
```

**Function:** Sets whether the WebCookieManager instance has permission to send and receive cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| accept | Bool | Yes | - | Sets whether the instance has permission to send and receive cookies. Default is `true`, indicating permission is granted. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*

WebCookieManager.putAcceptCookieEnabled(false)
```

### static func putAcceptThirdPartyCookieEnabled(Bool)

```cangjie
public static func putAcceptThirdPartyCookieEnabled(accept: Bool): Unit
```

**Function:** Sets whether the WebCookieManager instance has permission to send and receive third-party cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| accept | Bool | Yes | - | Sets whether the instance has permission to send and receive third-party cookies. `true` grants permission, while `false` denies permission. Default is `false`. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
WebCookieManager.putAcceptThirdPartyCookieEnabled(true)
```

## class WebCustomScheme

```cangjie
public class WebCustomScheme {
    public var schemeName: String
    public var isSupportCORS: Bool = true
    public var isSupportFetch: Bool = true
    public var isStandard: Bool = true
    public var isLocal: Bool = true
    public var isDisplayIsolated: Bool = true
    public var isSecure: Bool = true
    public var isCspBypassing: Bool = true
    public var isCodeCacheSupported: Bool = false
    public init(schemeName: String)
}
```

**Function:** Represents custom protocol configuration.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
let webScheme: WebCustomScheme = WebCustomScheme("myapp")
```

### var isCodeCacheSupported

```cangjie
public var isCodeCacheSupported: Bool = false
```

**Function:** Indicates whether JS resources under this scheme support generating code cache. true means JS resources under this scheme support generating code cache, false means they do not.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isCspBypassing

```cangjie
public var isCspBypassing: Bool = true
```

**Function:** Indicates whether this scheme can bypass Content Security Policy (CSP) checks. true means this scheme can bypass CSP checks, false means it cannot.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isDisplayIsolated

```cangjie
public var isDisplayIsolated: Bool = true
```

**Function:** Indicates whether content under this scheme can only be displayed or accessed from other content with the same scheme. true means content under this scheme can only be displayed/accessed from same-scheme content, false means it is not restricted.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isLocal

```cangjie
public var isLocal: Bool = true
```

**Function:** Indicates whether this scheme will be processed with the same security rules as the "file" protocol. true means it uses "file" protocol security rules, false means it does not.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isSecure

```cangjie
public var isSecure: Bool = true
```

**Function:** Indicates whether this scheme will be processed with the same security rules as "https". true means it uses "https" security rules, false means it does not.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isStandard

```cangjie
public var isStandard: Bool = true
```

**Function:** Indicates whether this scheme will be treated as a standard scheme. Standard schemes must comply with URL normalization and parsing rules defined in RFC 1738 Section 3.1. true means it is treated as standard, false means it is not.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isSupportCORS

```cangjie
public var isSupportCORS: Bool = true
```

**Function:** Indicates whether cross-origin requests are supported. true means supported, false means not supported.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var isSupportFetch

```cangjie
public var isSupportFetch: Bool = true
```

**Function:** Indicates whether fetch requests are supported. true means supported, false means not supported.

**Type:** Bool

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var schemeName

```cangjie
public var schemeName: String
```

**Function:** Custom protocol name. Maximum length is 32 characters, only supporting lowercase letters, numbers, '.', '+', '-', and must start with a letter.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### init(String)

```cangjie
public init(schemeName: String)
```

**Function:** Constructor for WebCustomScheme.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| schemeName | String | Yes | - | Custom protocol name. Maximum length is 32 characters, only supporting lowercase letters, numbers, '.', '+', '-', and must start with a letter. |

## class WebHeader

```cangjie
public class WebHeader {
    public WebHeader(
        public var headerKey: String,
        public var headerValue: String
    )
}
```

**Function:** Represents request/response header objects returned by Web components.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var headerKey

```cangjie
public var headerKey: String
```

**Function:** Key of the request/response header.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var headerValue

```cangjie
public var headerValue: String
```

**Function:** Value of the request/response header.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### WebHeader(String, String)

```cangjie
public WebHeader(
    public var headerKey: String,
    public var headerValue: String
)
```

**Function:** Main constructor for WebHeader.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| headerKey | String | Yes | - | Key of the request/response header. |
| headerValue | String | Yes | - | Value of the request/response header. |

## class WebStorageOrigin

```cangjie
public class WebStorageOrigin {
    public WebStorageOrigin(
        public var origin: String,
        public var quota: Int64,
        public var usage: Int64
    )
}
```

**Function:** Provides usage information for Web SQL databases.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var origin

```cangjie
public var origin: String
```

**Function:** String index specifying the origin.

**Type:** String

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core**Initial Version:** 21

### var quota

```cangjie
public var quota: Int64
```

**Function:** Specifies the storage quota for a given origin.

**Type:** Int64

**Read/Write Capability:** Read-Write

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

### var usage

```cangjie
public var usage: Int64
```

**Function:** Specifies the storage usage for a given origin.

**Type:** Int64

**Read/Write Capability:** Read-Write

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

### WebStorageOrigin(String, Int64, Int64)

```cangjie
public WebStorageOrigin(
    public var origin: String,
    public var quota: Int64,
    public var usage: Int64
)
```

**Function:** Primary constructor for WebStorageOrigin.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| origin | String | Yes | - | String identifier for the specified origin. |
| quota | Int64 | Yes | - | Storage quota for the specified origin. |
| usage | Int64 | Yes | - | Storage usage for the specified origin. |

## class WebviewController

```cangjie
public class WebviewController {
    public init()
    public init(webTag: String)
}
```

**Function:** Clears the IP addresses owned by the primary name.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

### init()

```cangjie
public init()
```

**Function:** Creates a WebviewController object.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

### init(String)

```cangjie
public init(webTag: String)
```

**Function:** Creates a WebviewController object.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| webTag | String | Yes | - | Specifies the name of the Web component. |

### static func setWebDebuggingAccess(Bool)

```cangjie
public static func setWebDebuggingAccess(webDebuggingAccess: Bool): Unit
```

**Function:** Enables or disables web page debugging functionality.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| webDebuggingAccess | Bool | Yes | - | Sets whether to enable web page debugging functionality. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For detailed information, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("setWebDebuggingAccess")
            .onClick {
                evt =>
                AppLog.info("setWebDebuggingAccess")
                WebviewController.setWebDebuggingAccess(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func accessBackward()

```cangjie
public func accessBackward(): Bool
```

**Function:** Checks whether the current page can navigate backward, i.e., whether there is a back history record.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if backward navigation is possible, otherwise `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("accessBackward")
            .onClick {
                evt =>
                AppLog.info("accessBackward")
                let bool = webController.accessBackward()
                AppLog.info("accessBackward returns ${bool}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func accessStep(Int32)

```cangjie
public func accessStep(step: Int32): Bool
```

**Function:** Checks whether the current page can navigate forward or backward by the specified number of steps.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| step | Int32 | Yes | - | Number of steps to navigate. Positive values indicate forward navigation, negative values indicate backward navigation. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if navigation is possible, otherwise `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    var message: String = "Hello World"
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("accessStep")
             Text(this.message).onClick {
                evt =>
                AppLog.info("accessStep")
                let access = webController.accessStep(2)
                AppLog.info("accessStep returns: ${access}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func backOrForward(Int32)
```cangjie
public func backOrForward(step: Int32): Unit
```

**Function:** Navigates forward or backward in the history stack by the specified number of steps. If the corresponding step does not exist in the history stack, no page navigation will occur.

When navigating forward or backward, the already loaded web page is used directly without reloading.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| step | Int32 | Yes | - | The number of steps to navigate forward or backward. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("backOrForward")
            .onClick {
                evt =>
                AppLog.info("backOrForward")
                webController.backOrForward(-2)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func backward()

```cangjie
public func backward(): Unit
```

**Function:** Navigates backward one page in the history stack. Typically used in conjunction with `accessBackward`.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("backward")
            .onClick {
                evt =>
                AppLog.info("backward")
                webController.backward()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func clearHistory()

```cangjie
public func clearHistory(): Unit
```

**Function:** Clears all forward and backward navigation history.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("clearHistory")
            .onClick {
                evt =>
                AppLog.info("clearHistory")
                webController.clearHistory()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func enableSafeBrowsing(Bool)

```cangjie
public func enableSafeBrowsing(enable: Bool): Unit
```

**Function:** Enables the feature to check for website security risks. Illegal and fraudulent websites are always checked and cannot be disabled via this function.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enable | Bool | Yes | - | Whether to enable the feature to check for website security risks. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("enableSafeBrowsing")
            .onClick {
                evt =>
                AppLog.info("enableSafeBrowsing")
                webController.enableSafeBrowsing(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func forward()

```cangjie
public func forward(): Unit
```

**Function:** Navigates forward one page in the history stack.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("forward")
            .onClick {
                evt =>
                AppLog.info("forward")
                webController.forward()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getBackForwardEntries()

```cangjie
public func getBackForwardEntries(): BackForwardList
```

**Function:** Retrieves the current Webview's history information list.**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [BackForwardList](#class-backforwardlist) | The history list of the current Webview. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getBackForwardEntries")
            .onClick {
                evt =>
                AppLog.info("getBackForwardEntries")
                let backForwardList = webController.getBackForwardEntries()
                AppLog.info("backForwardList currentIndex is ${backForwardList.currentIndex}")
                AppLog.info("backForwardList size is ${backForwardList.size}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getCustomUserAgent()

```cangjie
public func getCustomUserAgent(): String
```

**Description:** Gets the custom user agent.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The custom user agent information. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("getCustomUserAgent")
            .onClick {
                evt =>
                AppLog.info("getCustomUserAgent")
                let agent = webController.getCustomUserAgent()
                AppLog.info("getCustomUserAgent returns ${agent}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getHitTest()

```cangjie
public func getHitTest(): WebHitTestType
```

**Description:** Gets the type of the element in the currently clicked area.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [WebHitTestType](#enum-webhittesttype) | The type of the element in the clicked area. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getHitTest")
            .onClick {
                evt =>
                AppLog.info("getHitTest")
                let hitType = webController.getHitTest()
                match(hitType) {
                    case WebHitTestType.EditText => AppLog.info("getHitTest returns EditText")
                    case WebHitTestType.Email => AppLog.info("getHitTest returns Email")
                    case WebHitTestType.HttpAnchor => AppLog.info("getHitTest returns HttpAnchor")
                    case WebHitTestType.HttpAnchorImg => AppLog.info("getHitTest returns HttpAnchorImg")
                    case WebHitTestType.Img => AppLog.info("getHitTest returns Img")
                    case WebHitTestType.Map => AppLog.info("getHitTest returns Map")
                    case WebHitTestType.Phone => AppLog.info("getHitTest returns Phone")
                    case WebHitTestType.Unknown => AppLog.info("getHitTest returns Unknown")
                    case _ =>  ()
                }
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getHitTestValue()

```cangjie
public func getHitTestValue(): HitTestValue
```

**Description:** Gets the element information of the currently clicked area.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [HitTestValue](#class-hittestvalue) | The element information of the clicked area. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getHitTestValue")
            .onClick {
                evt =>
                AppLog.info("getHitTestValue")
                let hitTestValue = webController.getHitTestValue()
                match(hitTestValue.hitTestType) {
                    case WebHitTestType.EditText => AppLog.info("getHitTestValue returns EditText")
                    case WebHitTestType.Email => AppLog.info("getHitTestValue returns Email")
                    case WebHitTestType.HttpAnchor => AppLog.info("getHitTestValue returns HttpAnchor")
                    case WebHitTestType.HttpAnchorImg => AppLog.info("getHitTestValue returns HttpAnchorImg")
                    case WebHitTestType.Img => AppLog.info("getHitTestValue returns Img")
                    case WebHitTestType.Map => AppLog.info("getHitTestValue returns Map")
                    case WebHitTestType.Phone => AppLog.info("getHitTestValue returns Phone")
                    case WebHitTestType.Unknown => AppLog.info("getHitTestValue returns Unknown")
                    case _ =>  ()
                 }
                AppLog.info("getHitTestValue extra returns ${hitTestValue.extra}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getOriginalUrl()

```cangjie
public func getOriginalUrl(): String
```

**Description:** Gets the original URL address of the current page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The original URL address of the current page. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getOriginalUrl")
            .onClick {
                evt =>
                AppLog.info("getOriginalUrl")
                let url = webController.getOriginalUrl()
                AppLog.info("getOriginalUrl is ${url}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getPageHeight()

```cangjie
public func getPageHeight(): Int32
```

**Function:** Gets the current webpage's height.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The height of the current webpage. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

### func getSecurityLevel()

```cangjie
public func getSecurityLevel(): SecurityLevel
```

**Function:** Gets the security level of the current webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [SecurityLevel](#enum-securitylevel) | The security level of the current webpage, with possible values: NONE, SECURE, WARNING, DANGEROUS. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getSecurityLevel")
            .onClick {
                evt =>
                AppLog.info("getSecurityLevel")
                let securityLevel = webController.getSecurityLevel()
                match(securityLevel) {
                    case SecurityLevel.NONE => AppLog.info("getSecurityLevel returns NONE")
                    case SecurityLevel.SECURE => AppLog.info("getSecurityLevel returns SECURE")
                    case SecurityLevel.WARNING => AppLog.info("getSecurityLevel returns WARNING")
                    case SecurityLevel.DANGEROUS => AppLog.info("getSecurityLevel returns DANGEROUS")
                    case _ => throw IllegalArgumentException("The type is not supported.")
                 }
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getTitle()

```cangjie
public func getTitle(): String
```

**Function:** Gets the title of the current webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The title of the current webpage. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

### func getUrl()

```cangjie
public func getUrl(): String
```

**Function:** Gets the URL of the current page.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The URL of the current page. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getUrl")
            .onClick {
                evt =>
                AppLog.info("getUrl")
                let url = webController.getUrl()
                AppLog.info("getUrl is ${url}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func getUserAgent()

```cangjie
public func getUserAgent(): String
```

**Function:** Gets the default user agent.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The default user agent. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("getUserAgent")
            .onClick {
                evt =>
                AppLog.info("getUserAgent")
                webController.getUserAgent()
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func isIncognitoMode()

```cangjie
public func isIncognitoMode(): Bool
```

**Function:** Checks whether the current Webview is in incognito mode.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns whether the Webview is in incognito mode. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**
<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("isIncognitoMode")
            .onClick {
                evt =>
                AppLog.info("isIncognitoMode")
                let bool = webController.isIncognitoMode()
                AppLog.info("isIncognitoMode returns ${bool}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func isSafeBrowsingEnabled()

```cangjie
public func isSafeBrowsingEnabled(): Bool
```

**Function:** Checks whether the current webpage has enabled website security risk detection.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Whether the current webpage has enabled website security risk detection. Default is false.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("isSafeBrowsingEnabled")
            .onClick {
                evt =>
                AppLog.info("isSafeBrowsingEnabled")
                let bool = webController.isSafeBrowsingEnabled()
                AppLog.info("isSafeBrowsingEnabled returns ${bool}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func loadUrl(String)

```cangjie
public func loadUrl(url: String): Unit
```

**Function:** Loads the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|url|String|Yes|-|The URL to load.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("loadUrl")
            .onClick {
                evt =>
                AppLog.info("loadUrl")
                webController.loadUrl("www.example.com")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func loadUrl(AppResource)

```cangjie
public func loadUrl(url: AppResource): Unit
```

**Function:** Loads the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|url|[AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)|Yes|-|The URL to load.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.LocalizationKit.*
import ohos.state_macro_manage.rawfile
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("loadUrl")
            .onClick {
                evt =>
                AppLog.info("loadUrl")
                webController.loadUrl(@rawfile("index.html")) //Create index.html under resources/rawfile
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func loadUrl(String, Array\<WebHeader>)

```cangjie
public func loadUrl(url: String, headers: Array<WebHeader>): Unit
```

**Function:** Loads the specified URL with additional HTTP headers.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|url|String|Yes|-|The URL to load.|
|headers|Array\<[WebHeader](#class-webheader)>|Yes|-|Additional HTTP headers for the URL.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("loadUrl")
            .onClick {
                evt =>
                AppLog.info("loadUrl")
                webController.loadUrl("www.example.com", headers)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func loadUrl(AppResource, Array\<WebHeader>)

```cangjie
public func loadUrl(url: AppResource, headers: Array<WebHeader>): Unit
```
**Function:** Load the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| url | [AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource) | Yes | - | The URL to be loaded. |
| headers | Array\<[WebHeader](#class-webheader)> | Yes | - | Additional HTTP request headers for the URL. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |
  | 17100002 | Invalid url. |
  | 17100003 | Invalid resource path or file type. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.LocalizationKit.*
import ohos.state_macro_manage.rawfile
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("loadUrl")
            .onClick {
                evt =>
                AppLog.info("loadUrl")
                webController.loadUrl(@rawfile("index.html"), headers)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func pageDown(Bool)

```cangjie
public func pageDown(bottom: Bool): Unit
```

**Function:** Scroll the Webview content down by half a viewport size or jump to the bottom of the page, controlled by the `bottom` parameter.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bottom | Bool | Yes | - | Whether to jump to the bottom of the page. If set to `false`, the page content scrolls down by half a viewport size; if set to `true`, it jumps to the bottom of the page. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("pageDown")
            .onClick {
                evt =>
                AppLog.info("pageDown")
                webController.pageDown(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func pageUp(Bool)

```cangjie
public func pageUp(top: Bool): Unit
```

**Function:** Scroll the Webview content up by half a viewport size or jump to the top of the page, controlled by the `top` parameter.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| top | Bool | Yes | - | Whether to jump to the top of the page. If set to `false`, the page content scrolls up by half a viewport size; if set to `true`, it jumps to the top of the page. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("pageUp")
            .onClick {
                evt =>
                AppLog.info("pageUp")
                webController.pageUp(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func refresh()

```cangjie
public func refresh(): Unit
```

**Function:** Call this interface to notify the Web component to refresh the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("refresh")
            .onClick {
                evt =>
                AppLog.info("refresh")
                webController.refresh()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func registerJavaScriptProxy(Array\<(String) -> String>, String, Array\<String>)

```cangjie
public func registerJavaScriptProxy(funcs: Array<(String) -> String>, name: String, methodList: Array<String>): Unit
```

**Function:** Inject Cangjie methods into the Window object and call these methods within the window object. After registration, the [refresh](#func-refresh) interface must be called to take effect.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| funcs | Array\<(String)->String> | Yes | - | Array of application-side Cangjie methods to be registered. The input and return values of the registered Cangjie methods are of type String. |
| name | String | Yes | - | Name of the registered Cangjie method array, consistent with the object name called in the window. After registration, the window object can access the application-side Cangjie methods via this name. |
| methodList | Array\<String> | Yes | - | Names of the application-side Cangjie methods to be registered. The length of this array must match the `funcs` array. After registration, subsequent equality checks for `funcs` will be performed using `methodList`. Therefore, to register new or modify `funcs`, a new `methodList` must be provided. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. Possible causes: 1. The `funcs` and `methodList` must have the same size. 2. The `funcs` size must be greater than 0. |
| 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

let webController = WebviewController()
let callback: AsyncCallback<String> = {
    errorCode: Option<AsyncError>, data: Option<String> => match (errorCode) {
        case Some(e) => AppLog.error("callback error: errcode is ${e.code}")
        case _ => match (data) {
            case Some(value) =>
                AppLog.info("callback: get data successfully and data is ${value.toArray()}")
                AppLog.info("callback: get data successfully and data is ${value}")
            case _ => AppLog.error("callback: data is null")
        }
    }
}
@Entry
@Component
class EntryView {
    func build() {
        Row {
            Column {
                Button("refresh").onClick {
                    evt =>
                    AppLog.info("refresh")
                    webController.refresh()
                }.width(400.px).height(150.px)
                Button("proxy").onClick {
                    evt =>
                    AppLog.info("registerJavaScriptProxy")
                    let funcA1 = {
                        a: String =>
                        AppLog.info("funcA1 ${a}")
                        return "funcA1 " + a
                    }
                    let funcA2 = {
                        a: String =>
                        AppLog.info("funcA2 ${a}")
                        return "funcA2 " + a
                    }
                    let funcA3 = {
                        a: String =>
                        AppLog.info("funcA3 ${a}")
                        return "funcA3 " + a
                    }
                    let funcB1 = {
                        a: String =>
                        AppLog.info("funcB1 ${a}")
                        return "funcB1 " + a
                    }
                    let funcB2 = {
                        a: String =>
                        AppLog.info("funcB2 ${a}")
                        return "funcB2 " + a
                    }
                    let funcB3 = {
                        a: String =>
                        AppLog.info("funcB3 ${a}")
                        return "funcB3 " + a
                    }
                    let funcsA = [funcA1, funcA2, funcA3]
                    let funcsB = [funcB1, funcB2, funcB3]
                    let methodListA = ["testFunA1", "testFunA2", "testFunA3"]
                    let methodListB = ["testFunB1", "testFunB2", "testFunB3"]
                    try {
                        webController.registerJavaScriptProxy(funcsA, "testObjA", methodListA)
                        webController.registerJavaScriptProxy(funcsB, "testObjB", methodListB)
                    } catch (e: Exception) {
                        AppLog.info(e.message)
                    }
                }.width(400.px).height(150.px)
                Button("deleteJavaScriptRegister").onClick {
                    evt =>
                    AppLog.info("deleteJavaScriptRegister")
                    webController.deleteJavaScriptRegister("testObjA")
                }.width(400.px).height(150.px)
                Button("runProxy").onClick {
                    evt =>
                    AppLog.info("runProxy")
                    webController.runJavaScript("testObjA.testFunA2('someData')", callback)
                    webController.runJavaScript("testObjB.testFunB2('someData')", callback)
                }.width(400.px).height(150.px)

                Web(src: "www.example.com", controller: webController).onPageBegin(
                    {
                    evt => AppLog.info("page begin url: ${evt.url}")
                }).onPageEnd({
                    evt => AppLog.info("page end url: ${evt.url}")
                })
            }.width(100.percent)
        }.height(100.percent)
    }
}
```

The loaded HTML file. You need to add an `index.html` file in the `entry\src\main\resources\rawfile` directory.

```html
<!-- index.html -->
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<body>
<button type="button" onclick="htmlTest()">Click Me!</button>
<p id="demo"></p>
<p id="webDemo"></p>
</body>
<script type="text/javascript">
    function htmlTest() {
      // This function call expects to return "ArkUI Web Component"
      let AStr=testObjA.testFunA2("A2 data");
      let BStr=testObjB.testFunB1("B1 data");
      testObjA.testFunA3("A3 data");
      document.getElementById("demo").innerHTML=AStr;
      document.getElementById("webDemo").innerHTML=BStr;
      console.log('objName.test result:'+ str)
    }
</script>
</html>
```

### func removeCache(Bool)

```cangjie
public func removeCache(clearRom: Bool): Unit
```

**Function:** Clears resource cache files in the application. This method will clear cache files for all webviews within the same application.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| clearRom | Bool | Yes | - | When set to true, clears both ROM and RAM caches. When set to false, only clears RAM cache. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("removeCache")
            .onClick {
                evt =>
                AppLog.info("removeCache")
                webController.removeCache(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func runJavaScript(String, AsyncCallback\<String>)

```cangjie
public func runJavaScript(script: String, callback: AsyncCallback<String>): Unit
```

**Function:** Asynchronously executes JavaScript scripts and returns the execution result via a callback. `runJavaScript` must be called after `loadUrl` completes, such as in `onPageEnd`.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| script | String | Yes | - | JavaScript script. |
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<String> | Yes | - | Callback for JavaScript script execution result. Returns null if the script fails or has no return value. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

let callback: AsyncCallback<String> = {
    errorCode: Option<AsyncError>, data: Option<String> => match (errorCode) {
        case Some(e) => AppLog.error("callback error: errcode is ${e.code}")
        case _ =>
            match (data) {
                case Some(value) =>
                    AppLog.info("callback: get data successfully and data is ${value}")
                case _ => AppLog.error("callback: data is null")
            }
    }
}
@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("runJavaScript")
            .onClick {
                evt =>
                AppLog.info("runJavaScript")
                webController.runJavaScript("test()", callback)
            }.width(400.px).height(150.px)

            Web(src: ("index.html"), controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

The loaded HTML file. You need to add an `index.html` file in the `entry\src\main\resources\rawfile` directory.

```html
<!-- index.html -->
<!DOCTYPE html>
<html>
  <meta charset="utf-8">
  <body>
      Hello world!
  </body>
  <script type="text/javascript">
  function test() {
      console.log('Ark WebComponent')
      return "This value is from index.html"
  }
  </script>
</html>
```

### func scrollBy(Float32, Float32, Int32)

```cangjie
public func scrollBy(deltaX: Float32, deltaY: Float32, duration!: Int32 = 0): Unit
```

**Function:** Scrolls the page by the specified offset.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| deltaX | Float32 | Yes | - | Horizontal offset, where right is the positive direction. |
| deltaY | Float32 | Yes | - | Vertical offset, where down is the positive direction. |
| duration | Int32 | No | 0 | **Named parameter.** Scroll animation duration.<br>Unit: ms.<br>If not provided or set to a negative number or 0, no animation is applied. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("scrollBy")
            .onClick {
                evt =>
                AppLog.info("scrollBy")
                webController.scrollBy(50.0, 50.0)
            }.width(400.px).height(150.px)

            Web(src: ("index.html"), controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

The loaded HTML file. You need to add an `index.html` file under the `entry\src\main\resources\rawfile` directory.

```html
<!--index.html-->
<!DOCTYPE html>
<html>
<head>
    <title>Demo</title>
    <style>
        body {
            width:3000px;
            height:3000px;
            padding-right:170px;
            padding-left:170px;
            border:5px solid blueviolet
        }
    </style>
</head>
<body>
Scroll Test
</body>
</html>
```

### func scrollTo(Float32, Float32, Int32)

```cangjie
public func scrollTo(x: Float32, y: Float32, duration!: Int32 = 0): Unit
```

**Function:** Scrolls the page to the specified absolute position.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|x|Float32|Yes|-|The horizontal coordinate of the absolute position. If a negative value is passed, it will be treated as 0.|
|y|Float32|Yes|-|The vertical coordinate of the absolute position. If a negative value is passed, it will be treated as 0.|
|duration|Int32|No|0|**Named parameter.** The duration of the scroll animation.<br>Unit: ms.<br>If not passed, there will be no animation. If a negative value or 0 is passed, it will be treated as not passed.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error. The WebviewController must be associated with a Web component.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("scrollTo")
            .onClick {
                evt =>
                AppLog.info("scrollTo")
                webController.scrollTo(50.0, 50.0)
            }.width(400.px).height(150.px)

            Web(src: ("index.html"), controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

The loaded HTML file. You need to add an `index.html` file under the `entry\src\main\resources\rawfile` directory.

```html
<!--index.html-->
<!DOCTYPE html>
<html>
<head>
    <title>Demo</title>
    <style>
        body {
            width:3000px;
            height:3000px;
            padding-right:170px;
            padding-left:170px;
            border:5px solid blueviolet
        }
    </style>
</head>
<body>
Scroll Test
</body>
</html>
```

### func setCustomUserAgent(String)

```cangjie
public func setCustomUserAgent(userAgent: String): Unit
```

**Function:** Sets a custom user agent, which will override the system's user agent.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|userAgent|String|Yes|-|Custom user agent information. It is recommended to first use [getUserAgent](#func-getuseragent) to obtain the current default user agent and then append custom user agent information to it.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error. The WebviewController must be associated with a Web component.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    let headers = [WebHeader("headerKey", "headerValue")]
    func build() {
        Column(space: 10) {
            Button("setCustomUserAgent")
            .onClick {
                evt =>
                AppLog.info("setCustomUserAgent")
                webController.setCustomUserAgent("ua")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func stop()

```cangjie
public func stop(): Unit
```

**Function:** Stops the page from loading.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("stop")
            .onClick {
                evt =>
                AppLog.info("stop")
                webController.stop()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func storeWebArchive(String, Bool, AsyncCallback\<String>)

```cangjie
public func storeWebArchive(baseName: String, autoName: Bool, callback: AsyncCallback<String>): Unit
```

**Function:** Asynchronously saves the current page via callback.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
|baseName|String|Yes|-|The storage location of the generated offline webpage. This value cannot be empty.|
|autoName|Bool|Yes|-|Determines whether to automatically generate a filename. If false, the file will be stored with the name specified in `baseName`. If true, the filename will be automatically generated based on the current URL, and the file will be stored in the directory specified by `baseName`.|
|callback|[AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<String>|Yes|-|Returns the file storage path.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error. The WebviewController must be associated with a Web component. |
| 17100003 | Invalid resource path or file type.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

let callback: AsyncCallback<String> = {
    errorCode: Option<AsyncError>, data: Option<String> => match (errorCode) {
        case Some(e) => AppLog.error("callback error: errcode is ${e.code}")
        case _ =>
            match (data) {
                case Some(value) =>
                    AppLog.info("callback: get data successfully and data is ${value}")
                case _ => AppLog.error("callback: data is null")
            }
    }
}
@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("storeWebArchive")
            .onClick {
                evt =>
                AppLog.info("storeWebArchive")
                webController.storeWebArchive("/data/storage/el2/base/", true, callback)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func zoom(Float32)

```cangjie
public func zoom(factor: Float32): Unit
```

**Function:** Adjusts the zoom scale of the current webpage. zoomAccess must be set to true.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| factor | Float32 | Yes | - | The relative zoom scale to adjust based on the current webpage. The input must be greater than 0. A value of 1 represents the default webpage zoom scale, values less than 1 indicate zoom out, and values greater than 1 indicate zoom in. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Invalid input parameter. |
| 17100001 | Init error. The WebviewController must be associated with a Web component. |
| 17100004 | Function not enable. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("zoom")
            .onClick {
                evt =>
                AppLog.info("zoom")
                webController.zoom(2.5)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func zoomIn()

```cangjie
public func zoomIn(): Unit
```

**Function:** Calls this interface to zoom in the current webpage by 20%.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |
  | 17100004 | Function not enable. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("zoomIn")
            .onClick {
                evt =>
                AppLog.info("zoomIn")
                webController.zoomIn()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

### func zoomOut()

```cangjie
public func zoomOut(): Unit
```

**Function:** Calls this interface to zoom out the current webpage by 20%.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |
  | 17100004 | Function not enable. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.UIKit.Web

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("zoomOut")
            .onClick {
                evt =>
                AppLog.info("zoomOut")
                webController.zoomOut()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                AppLog.info("page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                AppLog.info("page end url: ${evt.url}")
            })
        }
    }
}
```

## enum OfflineResourceType

```cangjie
public enum OfflineResourceType <: Equatable<OfflineResourceType> & ToString {
    | IMAGE
    | CSS
    | CLASSIC_JS
    | MODULE_JS
    | ...
}
```

**Function:** Interface type for local offline resources.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parent Types:**

- Equatable\<OfflineResourceType>
- ToString

### CLASSIC_JS

```cangjie
CLASSIC_JS
```

**Function:** Javascript resources loaded via \<script src=“” \/> tags.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### CSS

```cangjie
CSS
```

**Function:** CSS-type resources.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### IMAGE

```cangjie
IMAGE
```

**Function:** Image-type resources.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### MODULE_JS

```cangjie
MODULE_JS
```

**Function:** Javascript resources loaded via \<script src=“” type=“module” \/> tags.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### func !=(OfflineResourceType)

```cangjie
public operator func !=(other: OfflineResourceType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [OfflineResourceType](#enum-offlineresourcetype) | Yes | - | Another enum value to compare. |

**Return Value:**

| Type | Description |
|:----|:----|
|Bool|Returns true if two enum values are not equal, otherwise returns false.|

### func ==(OfflineResourceType)

```cangjie
public operator func ==(other: OfflineResourceType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[OfflineResourceType](#enum-offlineresourcetype)|Yes|-|The other enum value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the value of the enum.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The description of the enum.|

## enum SecurityLevel

```cangjie
public enum SecurityLevel <: Equatable<SecurityLevel> & ToString {
    | NONE
    | SECURE
    | WARNING
    | DANGEROUS
    | ...
}
```

**Function:** The security level of the current webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parent Types:**

- Equatable\<SecurityLevel>
- ToString

### DANGEROUS

```cangjie
DANGEROUS
```

**Function:** The page is unsafe. Attempts to use HTTPS failed, the page is unauthenticated, HTTPS page contains insecure active content, malware, phishing, or any other serious security issue that may be dangerous.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### NONE

```cangjie
NONE
```

**Function:** The page is neither absolutely secure nor unsafe, i.e., neutral. For example, URLs with schemes other than http/https.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### SECURE

```cangjie
SECURE
```

**Function:** The page is secure, using HTTPS protocol with a trusted certificate.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### WARNING

```cangjie
WARNING
```

**Function:** The page is unsafe. For example, using HTTP protocol or HTTPS protocol with an outdated TLS version.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### func !=(SecurityLevel)

```cangjie
public operator func !=(other: SecurityLevel): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[SecurityLevel](#enum-securitylevel)|Yes|-|The other enum value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are not equal, otherwise returns false.|

### func ==(SecurityLevel)

```cangjie
public operator func ==(other: SecurityLevel): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[SecurityLevel](#enum-securitylevel)|Yes|-|The other enum value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the enum.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the enum.|

## enum WebHitTestType

```cangjie
public enum WebHitTestType <: Equatable<WebHitTestType> & ToString {
    | EditText
    | Email
    | Unknown
    | ...
}
```

**Function:** [getHitTest](#func-gethittest) is used to indicate the cursor node.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parent Types:**

- Equatable\<WebHitTestType>
- ToString

### EditText

```cangjie
EditText
```

**Function:** An editable area.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### Email

```cangjie
Email
```

**Function:** An email address.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Function:** Unknown content.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### func !=(WebHitTestType)

```cangjie
public operator func !=(other: WebHitTestType): Bool
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[WebHitTestType](#enum-webhittesttype)|Yes|-|The other enum value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are not equal, otherwise returns false.|

### func ==(WebHitTestType)

```cangjie
public operator func ==(other: WebHitTestType): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|other|[WebHitTestType](#enum-webhittesttype)|Yes|-|The other enum value to compare.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the enum.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the enum.|
**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the enumeration.|