# ohos.web.webview

提供web控制能力，组件提供网页显示的能力。

## 导入模块

```cangjie
import kit.ArkWeb.*
```

## 权限列表

ohos.permission.APPROXIMATELY_LOCATION

ohos.permission.LOCATION

ohos.permission.LOCATION_IN_BACKGROUND

ohos.permission.INTERNET

## 使用说明

API示例代码使用说明：

- 若示例代码首行有"// index.cj"注释，表示该示例可在仓颉模板工程的"index.cj"文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的"main_ability.cj"文件中进行配置。

上述示例工程及配置模板详见[接口使用说明](../../cj-development-intro.md#接口使用说明)。

## class BackForwardList

```cangjie
public class BackForwardList {}
```

**功能：** 当前Webview的历史信息列表。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### prop currentIndex

```cangjie
public prop currentIndex: Int32
```

**功能：** 当前页面在历史列表中的索引。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### prop size

```cangjie
public prop size: Int32
```

**功能：** 历史列表中索引的数量，最多保存50条，超过时起始记录会被覆盖。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### func getItemAtIndex(Int32)

```cangjie
public func getItemAtIndex(index: Int32): HistoryItem
```

**功能：** 获取历史列表中指定索引的历史记录项信息。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|index|Int32|是|-|指定历史列表中的索引。|

**返回值：**

|类型|说明|
|:----|:----|
|[HistoryItem](#class-historyitem)|历史记录项。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |

**示例：**

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

**功能：** 页面历史记录项。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var historyRawUrl

```cangjie
public var historyRawUrl: String
```

**功能：** 历史记录项的原始URL地址。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var historyUrl

```cangjie
public var historyUrl: String
```

**功能：** 历史记录项的URL地址。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var title

```cangjie
public var title: String
```

**功能：** 历史记录项的标题。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let icon

```cangjie
public let icon: PixelMap
```

**功能：** 历史页面图标的PixelMap对象。

**类型：** [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

## class HitTestValue

```cangjie
public class HitTestValue {
    public var hitTestType: WebHitTestType
    public var extra: String
}
```

**功能：** 提供点击区域的元素信息。示例代码参考[getHitTestValue](#func-gethittestvalue)。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var extra

```cangjie
public var extra: String
```

**功能：** 点击区域的附加参数信息。若被点击区域为图片或链接，则附加参数信息为其URL地址。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var hitTestType

```cangjie
public var hitTestType: WebHitTestType
```

**功能：** 当前被点击区域的元素类型。

**类型：** [WebHitTestType](#enum-webhittesttype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

## class WebCookieManager

```cangjie
public class WebCookieManager {}
```

**功能：** 通过WebCookie可以控制Web组件中的cookie的各种行为，其中每个应用中的所有web组件共享一个WebCookieManager实例。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### static func clearAllCookies(Bool)

```cangjie
public static func clearAllCookies(incognito!: Bool = false): Unit
```

**功能：** 清除所有cookie。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|incognito|Bool|否|false|**命名参数。** true表示清除隐私模式下webview的所有内存cookies，false表示清除正常非隐私模式下的所有cookies。|

**示例：**

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

**功能：** 清除所有会话cookie。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**示例：**

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

**功能：** 为指定URL设置cookie的值。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|要设置的cookie所属的URL，建议使用完整的URL。|
|value|String|是|-|要设置的cookie的值。|
|incognito|Bool|否|false|true表示设置隐私模式下对应URL的cookies，false表示设置正常非隐私模式下对应URL的cookies。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Webview错误码](<font color="red" face="bold">please add link</font>)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100002 | Invalid url. |
  | 17100005 | Invalid cookie value. |

**示例：**

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

**功能：** WebCookieManager是否存在cookie。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|incognito|Bool|否|false|**命名参数。** true表示查询隐私模式下是否存在cookies，false表示查询正常非隐私模式下是否存在cookies。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true表示存在cookie，false表示不存在cookie。|

**示例：**

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

**功能：** 获取指定url对应cookie的值。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|要获取的cookie所属的URL，建议使用完整的URL。|
|incognito|Bool|否|false|**命名参数。** true表示获取隐私模式下webview的内存cookies，false表示获取正常非隐私模式下的cookies。|

**返回值：**

|类型|说明|
|:----|:----|
|String|指定URL对应的cookie的值。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100002 | Invalid url. |

**示例：**

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

**功能：** WebCookieManager实例是否拥有发送和接收cookie的权限。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|是否拥有发送和接收cookie的权限。true表示拥有发送和接收cookie的权限，false表示无发送和接收cookie的权限。默认为true。|

**示例：**

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

**功能：** WebCookieManager实例是否拥有发送和接收第三方cookie的权限。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|是否拥有发送和接收第三方cookie的权限。true表示拥有发送和接收第三方cookie的权限，false表示无发送和接收第三方cookie的权限。默认为false。|

**示例：**

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

**功能：** 设置WebCookieManager实例是否拥有发送和接收cookie的权限。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|accept|Bool|是|-|设置是否拥有发送和接收cookie的权限。默认为true，表示拥有发送和接收cookie的权限。|

**示例：**

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

**功能：** 设置WebCookieManager实例是否拥有发送和接收第三方cookie的权限。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|accept|Bool|是|-|设置是否拥有发送和接收第三方cookie的权限。true表示设置拥有发送和接收第三方cookie的权限，false表示设置无发送和接收第三方cookie的权限。默认为false。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkWeb.*
import kit.PerformanceAnalysisKit.Hilog

WebCookieManager.putAcceptThirdPartyCookieEnabled(true)
```

## class WebHeader

```cangjie
public class WebHeader {
    public var headerKey: String
    public var headerValue: String
    public init(headerKey: String, headerValue: String)
}
```

**功能：** Web组件返回的请求/响应头对象。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var headerKey

```cangjie
public var headerKey: String
```

**功能：** 请求/响应头的key。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var headerValue

```cangjie
public var headerValue: String
```

**功能：** 请求/响应头的value。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### init(String, String)

```cangjie
public init(headerKey: String, headerValue: String)
```

**功能：** WebHeader的构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|headerKey|String|是|-|请求/响应头的key。|
|headerValue|String|是|-|请求/响应头的value。|

## class WebviewController

```cangjie
public class WebviewController {
    public init(webTag!: ?String = None)
}
```

**功能：** 清除主名称所拥有的的IP地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### init(?String)

```cangjie
public init(webTag!: ?String = None)
```

**功能：** 创建WebviewController对象。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|webTag|?String|否|None|指定Web组件的名称。|

### static func setWebDebuggingAccess(Bool)

```cangjie
public static func setWebDebuggingAccess(webDebuggingAccess: Bool): Unit
```

**功能：** 设置是否启用网页调试功能。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|webDebuggingAccess|Bool|是|-|设置是否启用网页调试功能。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |

**示例：**

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

**功能：** 当前页面是否可后退，即当前页面是否有返回历史记录。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|可以后退返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error. |

**示例：**

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

**功能：** 当前页面是否可前进或者后退给定的step步。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|step|Int32|是|-|要跳转的步数，正数代表前进，负数代表后退。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|页面是否前进或后退。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 按照历史栈，前进或者后退指定步长的页面，当历史栈中不存在对应步长的页面时，不会进行页面跳转。

前进或者后退页面时，直接使用已加载过的网页，无需重新加载网页。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|step|Int32|是|-|需要前进或后退的步长。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 按照历史栈，后退一个页面。一般结合accessBackward一起使用。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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
```

### func clearHistory()

```cangjie
public func clearHistory(): Unit
```

**功能：** 删除所有前进后退记录。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 启用检查网站安全风险的功能，非法和欺诈网站是强制启用的，不能通过此功能禁用。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enable|Bool|是|-|是否启用检查网站安全风险的功能。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 按照历史栈，前进一个页面。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前Webview的历史信息列表。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[BackForwardList](#class-backforwardlist)|当前Webview的历史信息列表。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取自定义用户代理。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|用户自定义代理信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前被点击区域的元素类型。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[WebHitTestType](#enum-webhittesttype)|被点击区域的元素类型。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前被点击区域的元素信息。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[HitTestValue](#class-hittestvalue)|点击区域的元素信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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
```

### func getOriginalUrl()

```cangjie
public func getOriginalUrl(): String
```

**功能：** 获取当前页面的原始URL地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前页面的原始URL地址。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前网页的页面高度。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前网页的页面高度。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

### func getSecurityLevel()

```cangjie
public func getSecurityLevel(): SecurityLevel
```

**功能：** 获取当前网页的安全级别。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[SecurityLevel](#enum-securitylevel)|当前网页的安全级别，具体值为NONE、SECURE、WARNING、DANGEROUS。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前网页的标题。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前网页的标题。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前页面的URL地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前页面的URL地址。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 获取当前默认用户代理。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|默认用户代理。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 查询当前是否是隐私模式的Webview。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回是否是隐私模式的Webview。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

```

### func isSafeBrowsingEnabled()

```cangjie
public func isSafeBrowsingEnabled(): Bool
```

**功能：** 获取当前网页是否启用了检查网站安全风险。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前网页是否启用了检查网站安全风险的功能，默认为false。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 加载指定的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|[ResourceStr](../BasicServicesKit/cj-apis-base.md#interface-resourcestr)|是|-|需要加载的URL。|
|headers|Array\<[WebHeader](#class-webheader)>|否|Array<WebHeader>()|URL的附加HTTP请求头。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |
  | 17100002 | Invalid url. |
  | 17100003 | Invalid resource path or file type. |

**示例：**

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

**功能：** 将Webview的内容向下滚动半个视框大小或者跳转到页面最底部，通过bottom入参控制。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bottom|Bool|是|-|是否跳转到页面最底部，设置为false时将页面内容向下滚动半个视框大小，设置为true时跳转到页面最底部。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component.relation pageDown(bottom: boolean): void |

**示例：**

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

**功能：** 将Webview的内容向上滚动半个视框大小或者跳转到页面最顶部，通过top入参控制。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|Bool|是|-|是否跳转到页面最顶部，设置为false时将页面内容向上滚动半个视框大小，设置为true时跳转到页面最顶部。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component.relation pageUp(top: boolean): void |

**示例：**

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

**功能：** 调用此接口通知Web组件刷新网页。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Invalid input parameter. |
  | 17100001 | Init error.The WebviewController must be associated with a Web component. |

**示例：**

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

**功能：** 注入仓颉方法到Window对象中，并在window对象中调用该方法。注册后，须调用[refresh](#func-refresh)接口生效。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|funcs|Array\<(String)->String>|是|-|参与注册的应用侧仓颉方法数组。注册的仓颉方法的入参和返回值都是String类型。|
|name|String|是|-|注册仓颉方法数组的名称，与window中调用的对象名一致。注册后window对象可以通过此名字访问应用侧仓颉方法。|
|methodList|Array\<String>|是|-|参与注册的应用侧仓颉方法名，此数组的长度需要与funcs数组一致。注册完成后，后续funcs的判等会通过methodList来判断。因此后续如果想注册新的、或更改funcs，需要传入新的methodList。|

**异常：**
