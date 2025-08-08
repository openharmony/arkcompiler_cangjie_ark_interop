# ohos.webview（Webview）

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

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

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

- BusinessException：对应错误码如下表，详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter.@syscap SystemCapability.Web.Webview.Core@brief getItemAtIndex(index: number): HistoryItem |

**示例：**

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
        Column(10) {
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

**功能：** Web组件预编译JavaScript生成字节码缓存的配置对象，用于控制字节码缓存更新。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var responseHeaders

```cangjie
public var responseHeaders: Array<WebHeader>
```

**功能：** 请求此JavaScript文件时服务器返回的响应头，使用E-Tag或Last-Modified标识文件版本，判断是否需要更新。

**类型：** Array\<[WebHeader](#class-webheader)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### CacheOptions(Array\<WebHeader>)

```cangjie
public CacheOptions(
    public var responseHeaders: Array<WebHeader>
)
```

**功能：** CacheOptions的主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|responseHeaders|Array\<[WebHeader](#class-webheader)>|是|-|请求此JavaScript文件时服务器返回的响应头，使用E-Tag或Last-Modified标识文件版本，判断是否需要更新。|

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

**功能：** 页面历史记录项。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let historyRawUrl

```cangjie
public let historyRawUrl: String
```

**功能：** 历史记录项的原始URL地址。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let historyUrl

```cangjie
public let historyUrl: String
```

**功能：** 历史记录项的URL地址。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let icon

```cangjie
public let icon: ?PixelMap
```

**功能：** 历史页面图标的PixelMap对象。

**类型：** ?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let title

```cangjie
public let title: String
```

**功能：** 历史记录项的标题。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### HistoryItem(?PixelMap, String, String, String)

```cangjie
public HistoryItem(
    public let icon: ?PixelMap,
    public let historyUrl: String,
    public let historyRawUrl: String,
    public let title: String
)
```

**功能：** 构造HistoryItem对象。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|icon|?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|是|-|历史页面图标的PixelMap对象。|
|historyUrl|String|是|-|历史记录项的URL地址。|
|historyRawUrl|String|是|-|历史记录项的原始URL地址。|
|title|String|是|-|历史记录项的标题。|

## class HitTestValue

```cangjie
public class HitTestValue {}
```

**功能：** 提供点击区域的元素信息。示例代码参考[getHitTestValue](#func-gethittestvalue)。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let extra

```cangjie
public let extra: String
```

**功能：** 点击区域的附加参数信息。若被点击区域为图片或链接，则附加参数信息为其URL地址。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### let hitTestType

```cangjie
public let hitTestType: WebHitTestType
```

**功能：** 当前被点击区域的元素类型。

**类型：** [WebHitTestType](#enum-webhittesttype)

**读写能力：** 只读

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

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

**功能：** 本地离线资源配置对象，用于配置将被[injectOfflineResources](#func-injectofflineresourcesarrayofflineresourcemap)接口注入到内存缓存的本地离线资源的相关信息，内核会根据此信息生成资源缓存，并据此控制缓存的有效期。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### OfflineResourceMap(Array\<String>, Array\<UInt8>, Array\<WebHeader>, OfflineResourceType)

```cangjie
public OfflineResourceMap(
    var urlList: Array<String>,
    var resource: Array<UInt8>,
    var responseHeaders: Array<WebHeader>,
    var _type: OfflineResourceType
)
```

**功能：** OfflineResourceMap主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|urlList|Array\<String>|是|-|本地离线资源对应的网络地址列表，列表的第一项将作为资源的源(Origin), 如果仅提供一个网络地址，则使用该地址作为这个资源的源。url仅支持http或https协议，长度不超过2048。|
|resource|Array\<UInt8>|是|-|本地离线资源的内容。|
|responseHeaders|Array\<[WebHeader](#class-webheader)>|是|-|资源对应的HTTP响应头。|
|_type|[OfflineResourceType](#enum-offlineresourcetype)|是|-|资源的类型，目前仅支持Javascript、图片和CSS类型的资源。|

## class SnapshotInfo

```cangjie
public class SnapshotInfo {
    public SnapshotInfo(
        public var id!: String = "",
        public var size!: SizeOptions = SizeOptions()
    )
}
```

**功能：** 获取全量绘制结果入参。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var id

```cangjie
public var id: String = ""
```

**功能：** snapshot的id。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var size

```cangjie
public var size: SizeOptions = SizeOptions()
```

**功能：** web绘制的尺寸，最多支持16000px * 16000px，长度单位支持px、vp、%，需保持不同参数传入长度单位一致，默认单位vp，超过规格时返回最大规格。只写数字时单位为vp。

示例：width:‘100px’, height:‘200px’。或者 width:‘20%’, height’30%'。

**类型：** [SizeOptions](#struct-sizeoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### SnapshotInfo(String, SizeOptions)

```cangjie
public SnapshotInfo(
    public var id!: String = "",
    public var size!: SizeOptions = SizeOptions()
)
```

**功能：** SnapshotInfo主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|否|""| **命名参数。** snapshot的id。|
|size|[SizeOptions](#struct-sizeoptions)|否|SizeOptions()| **命名参数。** web绘制的尺寸。|

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

**功能：** 全量绘制回调结果。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var id

```cangjie
public var id:?String
```

**功能：** snapshot的id。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var image

```cangjie
public var image:?PixelMap
```

**功能：** [PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)格式的全量绘制结果。

**类型：** ?[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var size

```cangjie
public var size:?SizeOptions
```

**功能：** web绘制的真实尺寸，默认单位vp。

**类型：** ?[SizeOptions](#struct-sizeoptions)

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var status

```cangjie
public var status:?Bool
```

**功能：** snapshot的状态，正常为true，失败为false，获取全量绘制结果失败，返回size的长宽都为0，map为空。

**类型：** ?Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### SnapshotResult(?String, ?PixelMap, ?Bool, ?SizeOptions)

```cangjie
public SnapshotResult(
    public var id: ?String,
    public var image: ?PixelMap,
    public var status: ?Bool,
    public var size: ?SizeOptions
)
```

**功能：** SnapshotResult主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|?String|是|-|snapshot的id。|
|image|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)|是|-|[PixelMap](../ImageKit/cj-apis-image.md#class-pixelmap)格式的全量绘制结果。|
|status|?Bool|是|-|snapshot的状态，正常为true，失败为false，获取全量绘制结果失败，返回size的长宽都为0，map为空。|
|size|[SizeOptions](#struct-sizeoptions)|是|-|web绘制的真实尺寸，默认单位vp。|

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
import kit.UIKit.Web

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

> **说明：**
>
> - 通过url指定域名，来使得页面内请求也附带上cookie。
> - 同步cookie的时机，建议在webview组件加载之前。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|要设置的cookie所属的URL，建议使用完整的URL。|
|value|String|是|-|要设置的cookie的值。|
|incognito|Bool|否|false| **命名参数。** true表示设置隐私模式下对应URL的cookies，false表示设置正常非隐私模式下对应URL的cookies。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100002|Invalid url.|
  |17100005|Invalid cookie value.|

**示例：**

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

**功能：** WebCookieManager是否存在cookie。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|incognito|Bool|否|false| **命名参数。** true表示查询隐私模式下是否存在cookies，false表示查询正常非隐私模式下是否存在cookies。|

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

let result = WebCookieManager.existCookie()
AppLog.info("WebCookiemanager result: ${result}")
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

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

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

let value = WebCookieManager.fetchCookie("https://www.example.com")
AppLog.info( "WebCookieManager,fetchCookie cookie = ${value}")
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

let result = WebCookieManager.isCookieAllowed()
AppLog.info( "WebCookieManager, result: ${result}")
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

let result = WebCookieManager.isThirdPartyCookieAllowed()
AppLog.info( "WebCookieManager, result: ${result}")
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

**功能：** 表示自定义协议配置。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
let webScheme: WebCustomScheme = WebCustomScheme("myapp")
```

### var isCodeCacheSupported

```cangjie
public var isCodeCacheSupported: Bool = false
```

**功能：** 设置了该选项的scheme的js资源是否支持生成code cache。true表示设置了该选项的scheme的js资源支持生成code cache，false表示设置了该选项的scheme的js资源不支持生成code cache。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isCspBypassing

```cangjie
public var isCspBypassing: Bool = true
```

**功能：** 设置了该选项的scheme可以绕过内容安全策略（CSP）检查。true表示设置了该选项的scheme可以绕过内容安全策略（CSP）检查，false表示设置了该选项的scheme不可以绕过内容安全策略（CSP）检查。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isDisplayIsolated

```cangjie
public var isDisplayIsolated: Bool = true
```

**功能：** 设置了该选项的scheme的内容是否只能从相同scheme的其他内容中显示或访问。true表示设置了该选项的scheme的内容只能从相同scheme的其他内容中显示或访问，false表示设置了该选项的scheme的内容不是只能从相同scheme的其他内容中显示或访问。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isLocal

```cangjie
public var isLocal: Bool = true
```

**功能：** 设置了该选项的scheme是否将使用与“file”协议相同的安全规则来处理。true表示设置了该选项的scheme将使用与“file”协议相同的安全规则来处理，false表示设置了该选项的scheme不使用与“file”协议相同的安全规则来处理。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isSecure

```cangjie
public var isSecure: Bool = true
```

**功能：** 设置了该选项的scheme是否将使用与应用于“https”的安全规则相同的安全规则来处理。true表示设置了该选项的scheme将使用与应用于“https”的安全规则相同的安全规则来处理，false表示设置了该选项的scheme不使用与应用于“https”的安全规则相同的安全规则来处理。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isStandard

```cangjie
public var isStandard: Bool = true
```

**功能：** 设置了该选项的scheme是否将作为标准scheme进行处理。标准scheme需要符合RFC 1738第3.1节中定义的URL规范化和解析规则。true表示设置了该选项的scheme将作为标准scheme进行处理，false表示设置了该选项的scheme不作为标准scheme进行处理。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isSupportCORS

```cangjie
public var isSupportCORS: Bool = true
```

**功能：** 是否支持跨域请求。true表示支持跨域请求，false表示不支持跨域请求。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var isSupportFetch

```cangjie
public var isSupportFetch: Bool = true
```

**功能：** 是否支持fetch请求。true表示支持fetch请求，false表示不支持fetch请求。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var schemeName

```cangjie
public var schemeName: String
```

**功能：** 自定义协议名称。最大长度为32，其字符仅支持小写字母、数字、'.'、'+'、'-'，同时需要以字母开头。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### init(String)

```cangjie
public init(schemeName: String)
```

**功能：** WebCustomScheme的构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|schemeName|String|是|-|自定义协议名称。最大长度为32，其字符仅支持小写字母、数字、'.'、'+'、'-'，同时需要以字母开头。|

## class WebHeader

```cangjie
public class WebHeader {
    public WebHeader(
        public var headerKey: String,
        public var headerValue: String
    )
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

### WebHeader(String, String)

```cangjie
public WebHeader(
    public var headerKey: String,
    public var headerValue: String
)
```

**功能：** WebHeader的主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|headerKey|String|是|-|请求/响应头的key。|
|headerValue|String|是|-|请求/响应头的value。|

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

**功能：** 提供Web SQL数据库的使用信息。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var origin

```cangjie
public var origin: String
```

**功能：** 指定源的字符串索引。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var quota

```cangjie
public var quota: Int64
```

**功能：** 指定源的存储配额。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### var usage

```cangjie
public var usage: Int64
```

**功能：** 指定源的存储量。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### WebStorageOrigin(String, Int64, Int64)

```cangjie
public WebStorageOrigin(
    public var origin: String,
    public var quota: Int64,
    public var usage: Int64
)
```

**功能：** WebStorageOrigin的主构造函数。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|origin|String|是|-|指定源的字符串索引。|
|quota|Int64|是|-|指定源的存储配额。|
|usage|Int64|是|-|指定源的存储量。|

## class WebviewController

```cangjie
public class WebviewController {
    public init()
    public init(webTag: String)
}
```

**功能：** 清除主名称所拥有的的IP地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### init()

```cangjie
public init()
```

**功能：** 创建WebviewController对象。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### init(String)

```cangjie
public init(webTag: String)
```

**功能：** 创建WebviewController对象。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|webTag|String|是|-|指定Web组件的名称。|

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

- BusinessException：对应错误码如下表，详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. |

**示例：**

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
        Column(10) {
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

**功能：** 当前页面是否可后退，即当前页面是否有返回历史记录。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|可以后退返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 按照历史栈，前进或者后退指定步长的页面，当历史栈中不存在对应步长的页面时，不会进行页面跳转。

前进或者后退页面时，直接使用已加载过的网页，无需重新加载网页。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|step|Int32|是|-|需要前进或后退的步长。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 按照历史栈，后退一个页面。一般结合accessBackward一起使用。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 删除所有前进后退记录。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 启用检查网站安全风险的功能，非法和欺诈网站是强制启用的，不能通过此功能禁用。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|enable|Bool|是|-|是否启用检查网站安全风险的功能。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 按照历史栈，前进一个页面。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前Webview的历史信息列表。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[BackForwardList](#class-backforwardlist)|当前Webview的历史信息列表。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取自定义用户代理。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|用户自定义代理信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前被点击区域的元素类型。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[WebHitTestType](#enum-webhittesttype)|被点击区域的元素类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前被点击区域的元素信息。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[HitTestValue](#class-hittestvalue)|点击区域的元素信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前页面的原始URL地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前页面的原始URL地址。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前网页的页面高度。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|当前网页的页面高度。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

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

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前网页的标题。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前网页的标题。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

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

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前默认用户代理。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|默认用户代理。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 查询当前是否是隐私模式的Webview。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|返回是否是隐私模式的Webview。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 获取当前网页是否启用了检查网站安全风险。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前网页是否启用了检查网站安全风险的功能，默认为false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 加载指定的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|需要加载的URL。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**示例：**

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
        Column(10) {
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

**功能：** 加载指定的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|[AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)|是|-|需要加载的URL。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**示例：**

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
        Column(10) {
            Button("loadUrl")
            .onClick {
                evt =>
                AppLog.info("loadUrl")
                webController.loadUrl(@rawfile("index.html")) //在resources/rawfile下新建index.html
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

**功能：** 加载指定的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|需要加载的URL。|
|headers|Array\<[WebHeader](#class-webheader)>|是|-|URL的附加HTTP请求头。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**示例：**

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
        Column(10) {
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

**功能：** 加载指定的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|[AppResource](../LocalizationKit/cj-apis-resource_manager.md#class-appresource)|是|-|需要加载的URL。|
|headers|Array\<[WebHeader](#class-webheader)>|是|-|URL的附加HTTP请求头。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100002|Invalid url.|
  |17100003|Invalid resource path or file type.|

**示例：**

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
        Column(10) {
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

**功能：** 将Webview的内容向下滚动半个视框大小或者跳转到页面最底部，通过bottom入参控制。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bottom|Bool|是|-|是否跳转到页面最底部，设置为false时将页面内容向下滚动半个视框大小，设置为true时跳转到页面最底部。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 将Webview的内容向上滚动半个视框大小或者跳转到页面最顶部，通过top入参控制。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|top|Bool|是|-|是否跳转到页面最顶部，设置为false时将页面内容向上滚动半个视框大小，设置为true时跳转到页面最顶部。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 调用此接口通知Web组件刷新网页。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. Possible causes: 1.the funcs and methodList must have the same size.2. the funcs' size be greater than 0. |
| 17100001 | Init error.The WebviewController must be associated with a Web component.|

**示例：**

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

加载的html文件。需要在`entry\src\main\resources\rawfile`目录下新增`index.html`文件。

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

**功能：** 清除应用中的资源缓存文件，此方法将会清除同一应用中所有webview的缓存文件。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|clearRom|Bool|是|-|设置为true时同时清除rom和ram中的缓存，设置为false时只清除ram中的缓存。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 异步执行JavaScript脚本，并通过回调方式返回脚本执行的结果。runJavaScript需要在loadUrl完成后，比如onPageEnd中调用。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|script|String|是|-|JavaScript脚本。|
|callback|[AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<String>|是|-|回调执行JavaScript脚本结果。JavaScript脚本若执行失败或无返回值时，返回null。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

加载的html文件。需要在`entry\src\main\resources\rawfile`目录下新增`index.html`文件。

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

**功能：** 将页面滚动指定的偏移量。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deltaX|Float32|是|-|水平偏移量，其中水平向右为正方向。|
|deltaY|Float32|是|-|垂直偏移量，其中垂直向下为正方向。|
|duration|Int32|否|0|**命名参数。** 滚动动画时间。<br>单位：ms。<br>不传入为无动画，当传入数值为负数或传入0时，按照不传入处理。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

加载的html文件。需要在`entry\src\main\resources\rawfile`目录下新增`index.html`文件。

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

**功能：** 将页面滚动到指定的绝对位置。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|x|Float32|是|-|绝对位置的水平坐标，当传入数值为负数时，按照传入0处理。|
|y|Float32|是|-|绝对位置的垂直坐标，当传入数值为负数时，按照传入0处理。|
|duration|Int32|否|0|**命名参数。** 滚动动画时间。<br>单位：ms。<br>不传入为无动画，当传入数值为负数或传入0时，按照不传入处理。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error.The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

加载的html文件。需要在`entry\src\main\resources\rawfile`目录下新增`index.html`文件。

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

**功能：** 设置自定义用户代理，会覆盖系统的用户代理。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|userAgent|String|是|-|用户自定义代理信息。建议先使用[getUserAgent](#func-getuseragent)获取当前默认用户代理，在此基础上追加自定义用户代理信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error.The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 停止页面加载。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|

**示例：**

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
        Column(10) {
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

**功能：** 以回调方式异步保存当前页面。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|baseName|String|是|-|生成的离线网页存储位置，该值不能为空。|
|autoName|Bool|是|-|决定是否自动生成文件名。如果为false，则按baseName的文件名存储；如果为true，则根据当前Url自动生成文件名，并按baseName的文件目录存储。|
|callback|[AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<String>|是|-|返回文件存储路径。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error.The WebviewController must be associated with a Web component. |
| 17100003 | Invalid resource path or file type.|

**示例：**

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
        Column(10) {
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

**功能：** 调整当前网页的缩放比例，zoomAccess需为true。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|factor|Float32|是|-|基于当前网页所需调整的相对缩放比例，入参要求大于0，当入参为1时为默认加载网页的缩放比例，入参小于1为缩小，入参大于1为放大。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Invalid input parameter. |
| 17100001 | Init error.The WebviewController must be associated with a Web component. |
| 17100004 | Function not enable.|

**示例：**

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
        Column(10) {
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

**功能：** 调用此接口将当前网页进行放大，比例为20%。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100004|Function not enable.|

**示例：**

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
        Column(10) {
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

**功能：** 调用此接口将当前网页进行缩小，比例为20%。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[Webview错误码](../../errorcodes/cj-errorcode-webview.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |17100001|Init error. The WebviewController must be associated with a Web component.|
  |17100004|Function not enable.|

**示例：**

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
        Column(10) {
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

**功能：** 本地离线资源的接口类型。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**父类型：**

- Equatable\<OfflineResourceType>
- ToString

### CLASSIC_JS

```cangjie
CLASSIC_JS
```

**功能：** 通过\<script src=“” \/>标签加载的Javascript资源。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### CSS

```cangjie
CSS
```

**功能：** CSS类型的资源。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### IMAGE

```cangjie
IMAGE
```

**功能：** 图片类型的资源。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### MODULE_JS

```cangjie
MODULE_JS
```

**功能：** 通过\<script src=“” type=“module” \/>标签加载的Javascript资源。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### func !=(OfflineResourceType)

```cangjie
public operator func !=(other: OfflineResourceType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[OfflineResourceType](#enum-offlineresourcetype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(OfflineResourceType)

```cangjie
public operator func ==(other: OfflineResourceType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[OfflineResourceType](#enum-offlineresourcetype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

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

**功能：** 当前网页的安全级别。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**父类型：**

- Equatable\<SecurityLevel>
- ToString

### DANGEROUS

```cangjie
DANGEROUS
```

**功能：** 页面不安全。尝试HTTPS并失败、页面未通过身份验证、页面上包含不安全活动内容的HTTPS、恶意软件、网络钓鱼或任何其他可能危险的严重安全问题。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### NONE

```cangjie
NONE
```

**功能：** 页面既不绝对安全，也不是不安全，即是中立。例如，部分scheme非http/https的URL。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### SECURE

```cangjie
SECURE
```

**功能：** 页面安全，页面使用的是HTTPS协议，且使用了信任的证书。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### WARNING

```cangjie
WARNING
```

**功能：** 页面不安全。例如，使用HTTP协议或使用HTTPS协议但使用旧版TLS版本。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### func !=(SecurityLevel)

```cangjie
public operator func !=(other: SecurityLevel): Bool 
```

**功能：** 判断两个枚举值是否不等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SecurityLevel](#enum-securitylevel)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不等，返回true，否则返回false。|

### func ==(SecurityLevel)

```cangjie
public operator func ==(other: SecurityLevel): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[SecurityLevel](#enum-securitylevel)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的字符串表示。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的字符串表示。|

## enum WebHitTestType

```cangjie
public enum WebHitTestType <: Equatable<WebHitTestType> & ToString {
    | EditText
    | Email
    | Unknown
    | ...
}
```

**功能：** [getHitTest](#func-gethittest)用于指示游标节点。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**父类型：**

- Equatable\<WebHitTestType>
- ToString

### EditText

```cangjie
EditText
```

**功能：** 可编辑的区域。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### Email

```cangjie
Email
```

**功能：** 电子邮件地址。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知内容。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

### func !=(WebHitTestType)

```cangjie
public operator func !=(other: WebHitTestType): Bool 
```

**功能：** 判断两个枚举值是否不等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WebHitTestType](#enum-webhittesttype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值不等，返回true，否则返回false。|

### func ==(WebHitTestType)

```cangjie
public operator func ==(other: WebHitTestType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[WebHitTestType](#enum-webhittesttype)|是|-|待比较的另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果两个枚举值相等，返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的字符串表示。

**系统能力：** SystemCapability.Web.Webview.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的字符串表示。|
