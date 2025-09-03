# ohos.web.webview

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

## Usage Guidelines

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration is needed in the "main_ability.cj" file of the Cangjie template project.

For details about the sample projects and configuration templates mentioned above, refer to [Interface Usage Instructions](../../cj-development-intro.md#接口使用说明).

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

**Description:** The number of indices in the history list, with a maximum of 50 entries. When exceeded, the earliest records will be overwritten.

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

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| index | Int32 | Yes | - | The specified index in the history list. |

**Return Value:**

| Type | Description |
|:----|:----|
| [HistoryItem](#class-historyitem) | The history item. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.arkui.component.button.Button
import ohos.hilog.Hilog

@Entry
@Component
class webview_0 {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getItemAtIndex")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getItemAtIndex")
                let backForwardList = webController.getBackForwardEntries()
                let historyItem = backForwardList.getItemAtIndex(backForwardList.currentIndex)
                Hilog.info(0, "cangjieTest", "Current historyUrl is ${historyItem.historyUrl}.")
                Hilog.info(0, "cangjieTest", "Current historyRawUrl is ${historyItem.historyRawUrl}.")
                Hilog.info(0, "cangjieTest", "Current title is ${historyItem.title}.")
                let pixelMap = historyItem.icon
                let byteInfo = pixelMap?.getPixelBytesNumber() ?? 0
                Hilog.info(0, "cangjieTest", "icon byteInfo is ${byteInfo}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

## class HistoryItem

```cangjie
public class HistoryItem {
    public let icon: PixelMap
    public var historyUrl: String
    public var historyRawUrl: String
    public var title: String
}
```

**Description:** A page history item.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var historyRawUrl

```cangjie
public var historyRawUrl: String
```

**Description:** The original URL address of the history item.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var historyUrl

```cangjie
public var historyUrl: String
```

**Description:** The URL address of the history item.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var title

```cangjie
public var title: String
```

**Description:** The title of the history item.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### let icon

```cangjie
public let icon: PixelMap
```

**Description:** The PixelMap object of the history page icon.

**Type:** [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**Access:** Read-only

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

## class HitTestValue

```cangjie
public class HitTestValue {
    public var hitTestType: WebHitTestType
    public var extra: String
}
```

**Description:** Provides information about the element in the clicked area. For sample code, refer to [getHitTestValue](#func-gethittestvalue).

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var extra

```cangjie
public var extra: String
```

**Description:** Additional parameter information of the clicked area. If the clicked area is an image or link, the additional parameter information is its URL address.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var hitTestType

```cangjie
public var hitTestType: WebHitTestType
```

**Description:** The element type of the currently clicked area.

**Type:** [WebHitTestType](#enum-webhittesttype)

**Access:** Read-write

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

## class WebCookieManager

```cangjie
public class WebCookieManager {}
```

**Description:** Through WebCookie, various behaviors of cookies in Web components can be controlled. All Web components in an application share a single WebCookieManager instance.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### static func clearAllCookies(Bool)

```cangjie
public static func clearAllCookies(incognito!: Bool = false): Unit
```

**Description:** Clears all cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| incognito | Bool | No | false | **Named parameter.** true clears all memory cookies of webview in incognito mode, false clears all cookies in normal non-incognito mode. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkWeb.*
import kit.ArkUI.Web

WebCookieManager.clearAllCookies()
```

### static func clearSessionCookie()

```cangjie
public static func clearSessionCookie(): Unit
```

**Description:** Clears all session cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

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

**Description:** Sets the cookie value for the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL to which the cookie belongs. A complete URL is recommended. |
| value | String | Yes | - | The value of the cookie to be set. |
| incognito | Bool | No | false | true sets cookies for the corresponding URL in incognito mode, false sets cookies in normal non-incognito mode. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Webview Error Codes](<font color="red" face="bold">please add link</font>).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100002 | Invalid url. |
  | 17100005 | Invalid cookie value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkWeb.*

try {
    WebCookieManager.configCookie("https://www.example.com", "a=b", incognito: false, includeHttpOnly: false)
} catch (e: BusinessException) {
    Hilog.error(0, "AppLogCj", "ErrorCode: ${e.code}, ErrorMessage: ${e.message}")
}
```

### static func existCookie(Bool)

```cangjie
public static func existCookie(incognito!: Bool = false): Bool
```

**Description:** Checks whether cookies exist in WebCookieManager.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| incognito | Bool | No | false | **Named parameter.** true checks for cookies in incognito mode, false checks for cookies in normal non-incognito mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true indicates cookies exist, false indicates no cookies exist. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

let result = WebCookieManager.existCookie()
Hilog.info(0, "AppLogCj", "WebCookiemanager result: ${result}")
```

### static func fetchCookie(String, Bool)

```cangjie
public static func fetchCookie(url: String, incognito!: Bool = false): String
```

**Description:** Retrieves the cookie value for the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | The URL to which the cookie belongs. A complete URL is recommended. |
| incognito | Bool | No | false | **Named parameter.** true retrieves memory cookies of webview in incognito mode, false retrieves cookies in normal non-incognito mode. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | The cookie value corresponding to the specified URL. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Webview Error Codes](../../errorcodes/cj-errorcode-webview.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100002 | Invalid url. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

let value = WebCookieManager.fetchCookie("https://www.example.com")
Hilog.info(0, "AppLogCj",  "WebCookieManager,fetchCookie cookie = ${value}")
```

### static func isCookieAllowed()

```cangjie
public static func isCookieAllowed(): Bool
```

**Description:** Checks whether the WebCookieManager instance has permission to send and receive cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether permission to send and receive cookies is granted. true indicates permission is granted, false indicates permission is denied. Default is true. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

let result = WebCookieManager.isCookieAllowed()
Hilog.info(0, "AppLogCj",  "WebCookieManager, result: ${result}")
```

### static func isThirdPartyCookieAllowed()

```cangjie
public static func isThirdPartyCookieAllowed(): Bool
```

**Description:** Checks whether the WebCookieManager instance has permission to send and receive third-party cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Whether permission to send and receive third-party cookies is granted. true indicates permission is granted, false indicates permission is denied. Default is false. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

let result = WebCookieManager.isThirdPartyCookieAllowed()
Hilog.info(0, "AppLogCj",  "WebCookieManager, result: ${result}")
```

### static func putAcceptCookieEnabled(Bool)

```cangjie
public static func putAcceptCookieEnabled(accept: Bool): Unit
```

**Description:** Sets whether the WebCookieManager instance has permission to send and receive cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| accept | Bool | Yes | - | Sets whether permission to send and receive cookies is granted. Default is true, indicating permission is granted. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

WebCookieManager.putAcceptCookieEnabled(false)
```

### static func putAcceptThirdPartyCookieEnabled(Bool)

```cangjie
public static func putAcceptThirdPartyCookieEnabled(accept: Bool): Unit
```

**Description:** Sets whether the WebCookieManager instance has permission to send and receive third-party cookies.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| accept | Bool | Yes | - | Sets whether permission to send and receive third-party cookies is granted. true indicates permission is granted, false indicates permission is denied. Default is false. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

WebCookieManager.putAcceptThirdPartyCookieEnabled(true)
```## class WebHeader

```cangjie
public class WebHeader {
    public var headerKey: String
    public var headerValue: String
    public init(headerKey: String, headerValue: String)
}
```

**Function:** Request/response header object returned by web components.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var headerKey

```cangjie
public var headerKey: String
```

**Function:** Key of the request/response header.

**Type:** String

**Read-Write Attribute:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### var headerValue

```cangjie
public var headerValue: String
```

**Function:** Value of the request/response header.

**Type:** String

**Read-Write Attribute:** Readable and Writable

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### init(String, String)

```cangjie
public init(headerKey: String, headerValue: String)
```

**Function:** Constructor of WebHeader.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| headerKey | String | Yes | - | Key of the request/response header. |
| headerValue | String | Yes | - | Value of the request/response header. |

## class WebviewController

```cangjie
public class WebviewController {
    public init(webTag!: ?String = None)
}
```

**Function:** Clears the IP address owned by the main name.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

### init(?String)

```cangjie
public init(webTag!: ?String = None)
```

**Function:** Creates a WebviewController object.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| webTag | ?String | No | None | Specifies the name of the web component. |

### static func setWebDebuggingAccess(Bool)

```cangjie
public static func setWebDebuggingAccess(webDebuggingAccess: Bool): Unit
```

**Function:** Enables or disables web page debugging functionality.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| webDebuggingAccess | Bool | Yes | - | Sets whether to enable web page debugging functionality. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import kit.PerformanceAnalysisKit.Hilog
import ohos.arkui.component.button.Button

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
                Hilog.info(0, "AppLogCj", "setWebDebuggingAccess")
                WebviewController.setWebDebuggingAccess(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "AppLogCj", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "AppLogCj", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func accessBackward()

```cangjie
public func accessBackward(): Bool
```

**Function:** Checks whether the current page can navigate backward, i.e., whether there is a back history for the current page.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if backward navigation is possible, otherwise returns false. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space:10) {
            Button("accessBackward")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "accessBackward")
                let bool = webController.accessBackward()
                Hilog.info(0, "cangjieTest", "accessBackward returns ${bool}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
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

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| step | Int32 | Yes | - | Number of steps to navigate. Positive values indicate forward navigation, negative values indicate backward navigation. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Indicates whether the page can navigate forward or backward. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.arkui.component.button.Button
import ohos.hilog.Hilog

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
                Hilog.info(0, "cangjieTest", "accessStep")
                let access = webController.accessStep(2)
                Hilog.info(0, "cangjieTest", "accessStep returns: ${access}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func backOrForward(Int32)

```cangjie
public func backOrForward(step: Int32): Unit
```

**Function:** Navigates forward or backward by the specified number of steps in the history stack. If no corresponding step exists in the history stack, no navigation occurs.

When navigating forward or backward, the already loaded web page is used directly without reloading.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| step | Int32 | Yes | - | Number of steps to navigate forward or backward. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.arkui.component.button.Button
import ohos.hilog.Hilog

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("backOrForward")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "backOrForward")
                webController.backOrForward(-2)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func backward()

```cangjie
public func backward(): Unit
```

**Function:** Navigates backward one page in the history stack. Typically used in conjunction with accessBackward.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("backward")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "backward")
                webController.backward()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```### func clearHistory()

```cangjie
public func clearHistory(): Unit
```

**Function:** Deletes all forward and backward navigation history.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("clearHistory")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "clearHistory")
                webController.clearHistory()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func enableSafeBrowsing(Bool)

```cangjie
public func enableSafeBrowsing(enable: Bool): Unit
```

**Function:** Enables the feature to check for website security risks. Illegal and fraudulent websites are forcibly enabled and cannot be disabled via this function.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| enable | Bool | Yes | - | Whether to enable the feature to check for website security risks. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("enableSafeBrowsing")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "enableSafeBrowsing")
                webController.enableSafeBrowsing(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
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

**Initial Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("forward")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "forward")
                webController.forward()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getBackForwardEntries()

```cangjie
public func getBackForwardEntries(): BackForwardList
```

**Function:** Retrieves the current Webview's history information list.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [BackForwardList](#class-backforwardlist) | The current Webview's history information list. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getBackForwardEntries")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getBackForwardEntries")
                let backForwardList = webController.getBackForwardEntries()
                Hilog.info(0, "cangjieTest", "backForwardList currentIndex is ${backForwardList.currentIndex}")
                Hilog.info(0, "cangjieTest", "backForwardList size is ${backForwardList.size}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getCustomUserAgent()

```cangjie
public func getCustomUserAgent(): String
```

**Function:** Retrieves the custom user agent.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The custom user agent information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

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
                Hilog.info(0, "cangjieTest", "getCustomUserAgent")
                let agent = webController.getCustomUserAgent()
                Hilog.info(0, "cangjieTest", "getCustomUserAgent returns ${agent}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getHitTest()

```cangjie
public func getHitTest(): WebHitTestType
```

**Function:** Retrieves the element type of the currently clicked area.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [WebHitTestType](#enum-webhittesttype) | The element type of the clicked area. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getHitTest")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getHitTest")
                let hitType = webController.getHitTest()
                match(hitType) {
                    case WebHitTestType.EditText => Hilog.info(0, "cangjieTest", "getHitTest returns EditText")
                    case WebHitTestType.Email => Hilog.info(0, "cangjieTest", "getHitTest returns Email")
                    case WebHitTestType.Unknown => Hilog.info(0, "cangjieTest", "getHitTest returns Unknown")
                    case _ =>  ()
                }
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getHitTestValue()

```cangjie
public func getHitTestValue(): HitTestValue
```

**Function:** Retrieves the element information of the currently clicked area.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [HitTestValue](#class-hittestvalue) | The element information of the clicked area. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getHitTestValue")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getHitTestValue")
                let hitTestValue = webController.getHitTestValue()
                match(hitTestValue.hitTestType) {
                    case WebHitTestType.EditText => Hilog.info(0, "cangjieTest", "getHitTestValue returns EditText")
                    case WebHitTestType.Email => Hilog.info(0, "cangjieTest", "getHitTestValue returns Email")
                    case WebHitTestType.Unknown => Hilog.info(0, "cangjieTest", "getHitTestValue returns Unknown")
                    case _ =>  ()
                 }
                Hilog.info(0, "cangjieTest", "getHitTestValue extra returns ${hitTestValue.extra}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```### func getOriginalUrl()

```cangjie
public func getOriginalUrl(): String
```

**Function:** Gets the original URL of the current page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type    | Description                     |
|:--------|:--------------------------------|
| String  | The original URL of the current page. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getOriginalUrl")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getOriginalUrl")
                let url = webController.getOriginalUrl()
                Hilog.info(0, "cangjieTest", "getOriginalUrl is ${url}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getPageHeight()

```cangjie
public func getPageHeight(): Int32
```

**Function:** Gets the height of the current web page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type    | Description                     |
|:--------|:--------------------------------|
| Int32   | The height of the current web page. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

### func getSecurityLevel()

```cangjie
public func getSecurityLevel(): SecurityLevel
```

**Function:** Gets the security level of the current web page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type            | Description                                                                 |
|:----------------|:----------------------------------------------------------------------------|
| [SecurityLevel](#enum-securitylevel) | The security level of the current web page, with values: NONE, SECURE, WARNING, DANGEROUS. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getSecurityLevel")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getSecurityLevel")
                let securityLevel = webController.getSecurityLevel()
                match(securityLevel) {
                    case SecurityLevel.NoneLevel => Hilog.info(0, "cangjieTest", "getSecurityLevel returns NONE")
                    case SecurityLevel.Secure => Hilog.info(0, "cangjieTest", "getSecurityLevel returns SECURE")
                    case SecurityLevel.Warning => Hilog.info(0, "cangjieTest", "getSecurityLevel returns WARNING")
                    case SecurityLevel.Dangerous => Hilog.info(0, "cangjieTest", "getSecurityLevel returns DANGEROUS")
                    case _ => throw IllegalArgumentException("The type is not supported.")
                 }
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getTitle()

```cangjie
public func getTitle(): String
```

**Function:** Gets the title of the current web page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type    | Description                     |
|:--------|:--------------------------------|
| String  | The title of the current web page. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getTitle")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getTitle")
                let title = webController.getTitle()
                Hilog.info(0, "cangjieTest", "getTitle returns ${title}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func getUrl()

```cangjie
public func getUrl(): String
```

**Function:** Gets the URL of the current page.

**System Capability:** SystemCapability.Web.Webview.Core

**Initial Version:** 21

**Return Value:**

| Type    | Description                     |
|:--------|:--------------------------------|
| String  | The URL of the current page.    |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("getUrl")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "getUrl")
                let url = webController.getUrl()
                Hilog.info(0, "cangjieTest", "getUrl is ${url}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
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

**Initial Version:** 21

**Return Value:**

| Type    | Description                     |
|:--------|:--------------------------------|
| String  | The default user agent.         |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

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
                Hilog.info(0, "cangjieTest", "getUserAgent")
                webController.getUserAgent()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
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

**Initial Version:** 21

**Return Value:**

| Type    | Description                                     |
|:--------|:------------------------------------------------|
| Bool    | Returns whether the Webview is in incognito mode. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                   |
  | :------------ | :------------------------------ |
  | 401           | Invalid input parameter.        |
  | 17100001      | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("isIncognitoMode")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "isIncognitoMode")
                let bool = webController.isIncognitoMode()
                Hilog.info(0, "cangjieTest", "isIncognitoMode returns ${bool}")
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```### func isSafeBrowsingEnabled()

```cangjie
public func isSafeBrowsingEnabled(): Bool
```

**Function:** Checks whether the current webpage has enabled website security risk inspection.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Indicates whether the current webpage has enabled website security risk inspection. The default value is false. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("isSafeBrowsingEnabled")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "isSafeBrowsingEnabled")
                let bool = webController.isSafeBrowsingEnabled()
                Hilog.info(0, "cangjieTest", "isSafeBrowsingEnabled returns ${bool}")
            }.width(400.px).height(150.px)
            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func loadUrl(ResourceStr, Array\<WebHeader>)

```cangjie
public func loadUrl(url: ResourceStr, headers!: Array<WebHeader> = Array<WebHeader>()): Unit
```

**Function:** Loads the specified URL.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| url | [ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr) | Yes | - | The URL to be loaded. |
| headers | Array\<[WebHeader](#class-webheader)> | No | Array<WebHeader>() | Additional HTTP request headers for the URL. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
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
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

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
                Hilog.info(0, "cangjieTest", "loadUrl")
                webController.loadUrl("index.html", headers:headers)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func pageDown(Bool)

```cangjie
public func pageDown(bottom: Bool): Unit
```

**Function:** Scrolls the Webview content down by half a viewport size or jumps to the bottom of the page, controlled by the `bottom` parameter.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| bottom | Bool | Yes | - | Whether to jump to the bottom of the page. If set to false, the page content scrolls down by half a viewport size. If set to true, it jumps to the bottom of the page. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component.relation pageDown(bottom: boolean): void |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("pageDown")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "pageDown")
                webController.pageDown(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func pageUp(Bool)

```cangjie
public func pageUp(top: Bool): Unit
```

**Function:** Scrolls the Webview content up by half a viewport size or jumps to the top of the page, controlled by the `top` parameter.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| top | Bool | Yes | - | Whether to jump to the top of the page. If set to false, the page content scrolls up by half a viewport size. If set to true, it jumps to the top of the page. |

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component.relation pageUp(top: boolean): void |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

@Entry
@Component
class EntryView {
    let webController = WebviewController()
    func build() {
        Column(space: 10) {
            Button("pageUp")
            .onClick {
                evt =>
                Hilog.info(0, "cangjieTest", "pageUp")
                webController.pageUp(true)
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func refresh()

```cangjie
public func refresh(): Unit
```

**Function:** Notifies the Web component to refresh the webpage.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Exceptions:**

- BusinessException: The error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. The WebviewController must be associated with a Web component. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.ArkUI.Web
import ohos.hilog.Hilog
import ohos.arkui.component.button.Button

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
                Hilog.info(0, "cangjieTest", "refresh")
                webController.refresh()
            }.width(400.px).height(150.px)

            Web(src: "www.example.com", controller: webController)
            .onPageBegin({evt =>
                Hilog.info(0, "cangjieTest", "page begin url: ${evt.url}")
            })
            .onPageEnd({evt =>
                Hilog.info(0, "cangjieTest", "page end url: ${evt.url}")
            })
        }
    }
}
```

### func registerJavaScriptProxy(Array\<(String) -> String>, String, Array\<String>)

```cangjie
public func registerJavaScriptProxy(funcs: Array<(String) -> String>, name: String, methodList: Array<String>): Unit
```

**Function:** Injects Cangjie methods into the Window object for invocation within the window context. After registration, the [refresh](#func-refresh) interface must be called to take effect.

**System Capability:** SystemCapability.Web.Webview.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| funcs | Array\<(String)->String> | Yes | - | Array of Cangjie methods on the application side to be registered. The input and return values of the registered Cangjie methods must be of String type. |
| name | String | Yes | - | Name of the registered Cangjie method array, consistent with the object name used in window invocation. After registration, the window object can access the application-side Cangjie methods via this name. |
| methodList | Array\<String> | Yes | - | Names of the application-side Cangjie methods to be registered. The length of this array must match the funcs array. After registration, subsequent equality checks for funcs will be based on methodList. Therefore, to register new or modified funcs, a new methodList must be provided. |

**Exceptions:**