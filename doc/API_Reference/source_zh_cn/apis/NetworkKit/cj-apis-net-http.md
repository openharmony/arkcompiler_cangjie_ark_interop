# ohos.net.http（数据请求）

本模块提供HTTP数据请求能力。应用可以通过HTTP发起一个数据请求，支持常见的GET、POST、OPTIONS、HEAD、PUT、DELETE、TRACE、CONNECT方法。

## 导入模块

```cangjie
import kit.NetworkKit.*
```

## 权限列表

ohos.permission.INTERNET

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createHttp()

```cangjie
public func createHttp(): HttpRequest
```

**功能：** 创建一个HTTP请求，请求对象功能包括发起请求、中断请求、订阅/取消订阅HTTP Response Header事件。每一个HttpRequest对象对应一个HTTP请求。如需发起多个HTTP请求，须为每个HTTP请求创建对应HttpRequest对象。

> **说明：**
>
> 当该请求使用完毕时，须调用destroy方法主动销毁HttpRequest对象。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[HttpRequest](#class-httprequest)|返回一个HttpRequest对象，里面包括request、requestInStream、destroy、on和off方法。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
```

## func createHttpResponseCache(UInt32)

```cangjie
public func createHttpResponseCache(cacheSize!: UInt32 = MAX_CACHE_SIZE): HttpResponseCache
```

**功能：** 创建一个默认的对象来存储HTTP访问请求的响应。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|cacheSize|UInt32|否|MAX_CACHE_SIZE|**命名参数。** 缓存大小最大为10\*1024\*1024（10MB），默认最大。|

**返回值：**

|类型|说明|
|:----|:----|
|[HttpResponseCache](#class-httpresponsecache)|返回一个存储HTTP访问请求响应的对象。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpResponseCache = createHttpResponseCache()
```

## class ClientCert

```cangjie
public class ClientCert {
    public ClientCert(
        public let certPath: String,
        public let keyPath: String,
        public let certType!: CertType = CertType.PEM,
        public let keyPassword!: ?String = None
    )
}
```

**功能：** 客户端证书类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let certPath

```cangjie
public let certPath: String
```

**功能：** 证书路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let certType

```cangjie
public let certType: CertType = CertType.PEM
```

**功能：** 证书类型，默认是PEM。

**类型：** [CertType](#enum-certtype)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let keyPassword

```cangjie
public let keyPassword:?String = None
```

**功能：** 证书秘钥的密码。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let keyPath

```cangjie
public let keyPath: String
```

**功能：** 证书秘钥的路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### ClientCert(String, String, CertType, ?String)

```cangjie
public ClientCert(
    public let certPath: String,
    public let keyPath: String,
    public let certType!: CertType = CertType.PEM,
    public let keyPassword!: ?String = None
)
```

**功能：** 构建ClientCert实例。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|certPath|String|是|-|证书路径。|
|keyPath|String|是|-|证书秘钥的路径。|
|certType|[CertType](#enum-certtype)|否|CertType.PEM|**命名参数。** 证书类型，默认是PEM。|
|keyPassword|?String|否|None|**命名参数。** 证书秘钥的密码。|

## class DataReceiveProgressInfo

```cangjie
public class DataReceiveProgressInfo {}
```

**功能：** 数据接收信息。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let receiveSize

```cangjie
public let receiveSize: UInt32
```

**功能：** 已接收的数据量单位为字节。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let totalSize

```cangjie
public let totalSize: UInt32
```

**功能：** 总共要接收的数据量单位为字节。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## class DataSendProgressInfo

```cangjie
public class DataSendProgressInfo {}
```

**功能：** 数据发送信息。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let sendSize

```cangjie
public let sendSize: UInt32
```

**功能：** 每次发送的数据量单位为字节。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let totalSize

```cangjie
public let totalSize: UInt32
```

**功能：** 总共要发送的数据量单位为字节。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## class HttpRequest

```cangjie
public class HttpRequest {}
```

**功能：** HTTP请求任务。在调用HttpRequest的方法前，需要先通过[createHttp](../NetworkKit/cj-apis-net-http.md#func-createhttp)创建一个任务。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func destroy()

```cangjie
public func destroy(): Unit
```

**功能：** 中断请求任务。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()

httpRequest.destroy()
```

### func offDataEnd()

```cangjie
public func offDataEnd(): Unit
```

**功能：** 取消订阅HTTP流式响应数据接收完毕事件。

> **说明：**
>
> 清空所有订阅。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataEnd({ =>
    AppLog.info("data end")
})
httpRequest.offDataEnd()
```

### func offDataReceive()

```cangjie
public func offDataReceive(): Unit
```

**功能：** 取消订阅HTTP流式响应数据接收事件。

> **说明：**
>
> 清空所有订阅。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataReceive({ data =>
    AppLog.info("data receive: ${data}")
})
httpRequest.offDataReceive()
```

### func offDataReceiveProgress()

```cangjie
public func offDataReceiveProgress(): Unit
```

**功能：** 取消订阅HTTP流式响应数据接收进度事件。

> **说明：**
>
> 清空所有订阅。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataReceiveProgress({ receiveInfo =>
    AppLog.info("receive data ${receiveInfo.receiveSize}, total: ${receiveInfo.totalSize}")
})
httpRequest.offDataReceiveProgress()
```

### func offDataSendProgress()

```cangjie
public func offDataSendProgress(): Unit
```

**功能：** 取消订阅HTTP网络请求数据发送进度事件。

> **说明：**
>
> 清空所有订阅。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataSendProgress({ sendInfo =>
    AppLog.info("send data ${sendInfo.sendSize}, total: ${sendInfo.totalSize}")
})
httpRequest.offDataSendProgress()
```

### func offHeadersReceive()

```cangjie
public func offHeadersReceive(): Unit
```

**功能：** 取消订阅HTTP Response Header事件。

> **说明：**
>
> 清空所有订阅。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onHeadersReceive({ headers =>
    AppLog.info("headers: ${headers}")
})
httpRequest.offHeadersReceive()
```

### func onDataEnd(() -> Unit)

```cangjie
public func onDataEnd(callback: () -> Unit): Unit
```

**功能：** 订阅HTTP流式响应数据接收完毕事件。

> **说明：**
>
> 暂不支持订阅HTTP流式数据上传的相关事件。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|()->Unit|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataEnd({ =>
    AppLog.info("data end")
})
```

### func onDataReceive((Array\<Byte>) -> Unit)

```cangjie
public func onDataReceive(callback: (Array<Byte>) -> Unit): Unit
```

**功能：** 订阅HTTP流式响应数据接收事件。

> **说明：**
>
> 暂不支持订阅HTTP流式数据上传的相关事件。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(Array\<[Byte](<font color="red" face="bold">please add link</font>)>)->Unit|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataReceive({ data =>
    AppLog.info("data receive: ${data}")
})
```

### func onDataReceiveProgress((DataReceiveProgressInfo) -> Unit)

```cangjie
public func onDataReceiveProgress(callback: (DataReceiveProgressInfo) -> Unit): Unit
```

**功能：** 订阅HTTP流式响应数据接收进度事件。

> **说明：**
>
> 暂不支持订阅HTTP流式数据上传的相关事件。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DataReceiveProgressInfo](#class-datareceiveprogressinfo))->Unit|是|-|回调函数。返回数据接收进度信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataReceiveProgress({ receiveInfo =>
    AppLog.info("receive data ${receiveInfo.receiveSize}, total: ${receiveInfo.totalSize}")
})
```

### func onDataSendProgress((DataSendProgressInfo) -> Unit)

```cangjie
public func onDataSendProgress(callback: (DataSendProgressInfo) -> Unit): Unit
```

**功能：** 订阅HTTP网络请求数据发送进度事件。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([DataSendProgressInfo](#class-datasendprogressinfo))->Unit|是|-|回调函数。返回数据发送进度信息。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onDataSendProgress({ sendInfo =>
    AppLog.info("send data ${sendInfo.sendSize}, total: ${sendInfo.totalSize}")
})
```

### func onHeadersReceive((HashMap\<String,String>) -> Unit)

```cangjie
public func onHeadersReceive(callback: (HashMap<String, String>) -> Unit): Unit
```

**功能：** 订阅HTTP Response Header事件。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(HashMap\<String,String>)->Unit|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onHeadersReceive({ headers =>
    AppLog.info("headers: ${headers}")
})
```

### func onceHeadersReceive((HashMap\<String,String>) -> Unit)

```cangjie
public func onceHeadersReceive(callback: (HashMap<String, String>) -> Unit): Unit
```

**功能：** 订阅HTTP Response Header事件，但是只触发一次。一旦触发之后，此函数注册的订阅器就会被移除。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(HashMap\<String,String>)->Unit|是|-|回调函数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpRequest = createHttp()
httpRequest.onceHeadersReceive({ headers =>
    AppLog.info("headers: ${headers}")
})
```

### func request(String, (?BusinessException,?HttpResponse) -> Unit, ?HttpRequestOptions)

```cangjie
public func request(url: String, callback: (?BusinessException, ?HttpResponse) -> Unit,
    options!: ?HttpRequestOptions = None): Unit
```

**功能：** 根据URL地址，发起HTTP网络请求，在callback回调函数中返回响应。

> **说明：**
>
> 此接口仅支持数据大小为5MB以内的数据接收。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|发起网络请求的URL地址。|
|callback|(?[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception),?[HttpResponse](#class-httpresponse))->Unit|是|-|回调函数。|
|options|?[HttpRequestOptions](#class-httprequestoptions)|否|None|**命名参数。** 参考[HttpRequestOptions](#class-httprequestoptions)。|

**异常：**

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |201|Permission denied.|
  |2300001|Unsupported protocol.|
  |2300003|URL using bad/illegal format or missing URL.|
  |2300005|Couldn't resolve proxy name.|
  |2300006|Couldn't resolve host name.|
  |2300007|Couldn't connect to server.|
  |2300008|Weird server reply.|
  |2300009|Access denied to remote resource.|
  |2300016|Error in the HTTP2 framing layer.|
  |2300018|Transferred a partial file.|
  |2300023|Failed writing received data to disk/application.|
  |2300025|Upload failed.|
  |2300026|Failed to open/read local data from file/application.|
  |2300027|Out of memory.|
  |2300028|Timeout was reached.|
  |2300047|Number of redirects hit maximum amount.|
  |2300052|Server returned nothing (no headers, no data).|
  |2300055|Failed sending data to the peer.|
  |2300056|Failure when receiving data from the peer.|
  |2300058|Problem with the local SSL certificate.|
  |2300059|Couldn't use specified SSL cipher.|
  |2300060|SSL peer certificate or SSH remote key was not OK.|
  |2300061|Unrecognized or bad HTTP Content or Transfer-Encoding.|
  |2300063|Maximum file size exceeded.|
  |2300070|Disk full or allocation exceeded.|
  |2300073|Remote file already exists.|
  |2300077|Problem with the SSL CA cert (path? access rights?).|
  |2300078|Remote file not found.|
  |2300094|An authentication function returned an error.|
  |2300999|Unknown Other Error.|

> **错误码说明：**
>
> 以上错误码的详细介绍参见[HTTP错误码](../../errorcodes/cj-errorcode-net-http.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。
> HTTP接口返回错误码映射关系：2300000 + curl错误码。更多常用错误码，可参考：[curl错误码](https://curl.se/libcurl/c/libcurl-errors.html)。

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpRequest = createHttp()
httpRequest.request("http://www.example.com", {err, resp =>
    if (let Some(e) <- err) {
        Hilog.error(0, "test","exception: ${e.message}")
    }
    if (let Some(r) <- resp) {
        Hilog.info(0, "test", "resp: ${r}")
    } else {
        Hilog.error(0, "test", "response is none")
    }
})
```

### func requestInStream(String, (?BusinessException,?UInt32) -> Unit, ?HttpRequestOptions)

```cangjie
public func requestInStream(url: String, callback: (?BusinessException, ?UInt32) -> Unit,
    options!: ?HttpRequestOptions = None): Unit
```

**功能：** 根据URL地址和相关配置项，发起HTTP网络请求并返回流式响应，在callback回调函数中返回响应。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|url|String|是|-|发起网络请求的URL地址。|
|callback|(?[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception),?UInt32)->Unit|是|-|回调函数。|
|options|?[HttpRequestOptions](#class-httprequestoptions)|否|None|**命名参数。** 参考[HttpRequestOptions](#class-httprequestoptions)。|

**异常：**

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|
  |201|Permission denied.|
  |2300001|Unsupported protocol.|
  |2300003|URL using bad/illegal format or missing URL.|
  |2300005|Couldn't resolve proxy name.|
  |2300006|Couldn't resolve host name.|
  |2300007|Couldn't connect to server.|
  |2300008|Weird server reply.|
  |2300009|Access denied to remote resource.|
  |2300016|Error in the HTTP2 framing layer.|
  |2300018|Transferred a partial file.|
  |2300023|Failed writing received data to disk/application.|
  |2300025|Upload failed.|
  |2300026|Failed to open/read local data from file/application.|
  |2300027|Out of memory.|
  |2300028|Timeout was reached.|
  |2300047|Number of redirects hit maximum amount.|
  |2300052|Server returned nothing (no headers, no data).|
  |2300055|Failed sending data to the peer.|
  |2300056|Failure when receiving data from the peer.|
  |2300058|Problem with the local SSL certificate.|
  |2300059|Couldn't use specified SSL cipher.|
  |2300060|SSL peer certificate or SSH remote key was not OK.|
  |2300061|Unrecognized or bad HTTP Content or Transfer-Encoding.|
  |2300063|Maximum file size exceeded.|
  |2300070|Disk full or allocation exceeded.|
  |2300073|Remote file already exists.|
  |2300077|Problem with the SSL CA cert (path? access rights?).|
  |2300078|Remote file not found.|
  |2300094|An authentication function returned an error.|
  |2300999|Unknown Other Error.|

> **错误码说明：**
>
> 以上错误码的详细介绍参见[HTTP错误码](../../errorcodes/cj-errorcode-net-http.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。
> HTTP接口返回错误码映射关系：2300000 + curl错误码。更多常用错误码，可参考：[curl错误码](https://curl.se/libcurl/c/libcurl-errors.html)。

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpRequest = createHttp()
httpRequest.requestInStream("http://www.example.com", {err, code =>
    if (let Some(e) <- err) {
        Hilog.error(0, "test","exception: ${e.message}")
    }
    if (let Some(respCode) <- code) {
        Hilog.info(0, "test", "resp: ${respCode}")
    } else {
        Hilog.error(0, "test", "response is none")
    }
})
```

## class HttpRequestOptions

```cangjie
public class HttpRequestOptions {
    public HttpRequestOptions(
        public let method!: RequestMethod = RequestMethod.GET,
        public let extraData!: ?HttpData = None,
        public let expectDataType!: ?HttpDataType = None,
        public let usingCache!: Bool = true,
        public let priority!: UInt32 = 1,
        public let header!: ?HashMap<String, String> = None,
        public let readTimeout!: UInt32 = 60000,
        public let connectTimeout!: UInt32 = 60000,
        public let usingProtocol!: ?HttpProtocol = None,
        public let usingProxy!: UsingProxy = USE_DEFAULT,
        public let caPath!: ?String = None,
        public let resumeFrom!: ?Int64 = None,
        public let resumeTo!: ?Int64 = None,
        public let clientCert!: ?ClientCert = None,
        public let dnsOverHttps!: ?String = None,
        public let dnsServers!: ?Array<String> = None,
        public let maxLimit!: UInt32 = 5 * 1024 * 1024,
        public let multiFormDataList!: ?Array<MultiFormData> = None
    )
}
```

**功能：** 发起请求可选参数的类型和取值范围。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let caPath

```cangjie
public let caPath:?String = None
```

**功能：** 如果设置了此参数，系统将使用用户指定路径的CA证书，(开发者需保证该路径下CA证书的可访问性)，否则将使用系统预设CA证书，系统预设CA证书位置：/etc/ssl/certs/cacert.pem。证书路径为沙箱映射路径（开发者可通过Global.getContext().filesDir获取应用沙箱路径）。目前仅支持后缀名为.pem的文本格式证书。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let clientCert

```cangjie
public let clientCert:?ClientCert = None
```

**功能：** 支持传输客户端证书。

**类型：** ?[ClientCert](#class-clientcert)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let connectTimeout

```cangjie
public let connectTimeout: UInt32 = 60000
```

**功能：** 连接超时时间。单位为毫秒（ms），默认为60000ms。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let dnsOverHttps

```cangjie
public let dnsOverHttps:?String = None
```

**功能：** 设置使用HTTPS协议的服务器进行DNS解析。<br />参数必须以以下格式进行URL编码："https:// host:port/path"。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let dnsServers

```cangjie
public let dnsServers:?Array<String>= None
```

**功能：** 设置指定的DNS服务器进行DNS解析。<br />可以设置多个DNS解析服务器，最多3个服务器。如果有3个以上，只取前3个。<br />服务器必须是IPv4或者IPv6地址。

**类型：** ?Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let expectDataType

```cangjie
public let expectDataType:?HttpDataType = None
```

**功能：** 指定返回数据的类型，默认无此字段。如果设置了此参数，系统将优先返回指定的类型。

**类型：** ?[HttpDataType](#enum-httpdatatype)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let extraData

```cangjie
public let extraData:?HttpData = None
```

**功能：** 发送请求的额外数据，默认无此字段。

- 当HTTP请求为POST、PUT等方法时，此字段为HTTP请求的content，以UTF-8编码形式作为请求体。
    - 当'content-Type'为'application/x-www-form-urlencoded'时，请求提交的信息主体数据应在key和value进行URL转码后按照键值对"key1=value1&key2=value2&key3=value3"的方式进行编码，该字段对应的类型通常为String。
    - 当'content-Type'为'text/xml'时，该字段对应的类型通常为String。
    - 当'content-Type'为'application/json'时，该字段对应的类型通常为Object。
    - 当'content-Type'为'application/octet-stream'时，该字段对应的类型通常为ArrayBuffer。
    - 当'content-Type'为'multipart/form-data'且需上传的字段为文件时，该字段对应的类型通常为ArrayBuffer。
- 当HTTP请求为GET、OPTIONS、DELETE、TRACE、CONNECT等方法时，此字段为HTTP请求参数的补充。开发者需传入Encode编码后的string类型参数，Object类型的参数无需预编码，参数内容会拼接到URL中进行发送；ArrayBuffer类型的参数不会做拼接处理。

以上信息仅供参考，并可能根据具体情况有所不同。

**类型：** ?[HttpData](#enum-httpdata)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let header

```cangjie
public let header:?HashMap<String, String>= None
```

**功能：** HTTP请求头字段。默认{'content-Type': 'application/json'}。

**类型：** ?HashMap\<String,String>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let maxLimit

```cangjie
public let maxLimit: UInt32 = 5 * 1024 * 1024
```

**功能：** 响应消息的最大字节限制，默认值为5MB，以字节为单位。最大值为10MB，以字节为单位。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let method

```cangjie
public let method: RequestMethod = RequestMethod.GET
```

**功能：** 请求方式，默认为GET。

**类型：** [RequestMethod](#enum-requestmethod)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let multiFormDataList

```cangjie
public let multiFormDataList:?Array<MultiFormData>= None
```

**功能：** 当'content-Type'为'multipart/form-data'时，则上传该字段定义的数据字段表单列表。

**类型：** ?Array\<[MultiFormData](#class-multiformdata)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let priority

```cangjie
public let priority: UInt32 = 1
```

**功能：** 优先级，范围[1,1000]，默认是1。若传参超出范围则使用默认值1。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let readTimeout

```cangjie
public let readTimeout: UInt32 = 60000
```

**功能：** 读取超时时间。单位为毫秒（ms），默认为60000ms。<br />设置为0表示不会出现超时情况。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let resumeFrom

```cangjie
public let resumeFrom:?Int64 = None
```

**功能：** 用于设置上传或下载起始位置。HTTP标准（RFC 7233第3.1节）允许服务器忽略范围请求。<br />使用HTTP PUT时设置此参数，可能出现未知问题。<br />取值范围是:1~4294967296(4GB)，超出范围则不生效。无默认值。

**类型：** ?Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let resumeTo

```cangjie
public let resumeTo:?Int64 = None
```

**功能：** 用于设置上传或下载结束位置。HTTP标准（RFC 7233第3.1节）允许服务器忽略范围请求。<br />使用HTTP PUT时设置此参数，可能出现未知问题。<br />取值范围是:1~4294967296(4GB)，超出范围则不生效。无默认值。

**类型：** ?Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let usingCache

```cangjie
public let usingCache: Bool = true
```

**功能：** 是否使用缓存，默认为true，请求时优先读取缓存。 缓存跟随当前进程生效。新缓存会替换旧缓存。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let usingProtocol

```cangjie
public let usingProtocol:?HttpProtocol = None
```

**功能：** 使用协议。默认值由系统自动指定。

**类型：** ?[HttpProtocol](#enum-httpprotocol)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let usingProxy

```cangjie
public let usingProxy: UsingProxy = USE_DEFAULT
```

**功能：** 是否使用HTTP代理，默认为USE_DEFAULT，使用默认代理。<br /> 当usingProxy为NOT_USE时，不使用网络代理。<br /> 当usingProxy为USE_SPECIFIED类型时，使用指定网络代理。

**类型：** [UsingProxy](#enum-usingproxy)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### HttpRequestOptions(RequestMethod, ?HttpData, ?HttpDataType, Bool, UInt32, ?HashMap\<String,String>, UInt32, UInt32, ?HttpProtocol, UsingProxy, ?String, ?Int64, ?Int64, ?ClientCert, ?String, ?Array\<String>, UInt32, ?Array\<MultiFormData>)

```cangjie
public HttpRequestOptions(
    public let method!: RequestMethod = RequestMethod.GET,
    public let extraData!: ?HttpData = None,
    public let expectDataType!: ?HttpDataType = None,
    public let usingCache!: Bool = true,
    public let priority!: UInt32 = 1,
    public let header!: ?HashMap<String, String> = None,
    public let readTimeout!: UInt32 = 60000,
    public let connectTimeout!: UInt32 = 60000,
    public let usingProtocol!: ?HttpProtocol = None,
    public let usingProxy!: UsingProxy = USE_DEFAULT,
    public let caPath!: ?String = None,
    public let resumeFrom!: ?Int64 = None,
    public let resumeTo!: ?Int64 = None,
    public let clientCert!: ?ClientCert = None,
    public let dnsOverHttps!: ?String = None,
    public let dnsServers!: ?Array<String> = None,
    public let maxLimit!: UInt32 = 5 * 1024 * 1024,
    public let multiFormDataList!: ?Array<MultiFormData> = None
)
```

**功能：** 构造HttpRequestOptions实例。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|method|[RequestMethod](#enum-requestmethod)|否|RequestMethod.GET|**命名参数。** 请求方式，默认为GET。|
|extraData|?[HttpData](#enum-httpdata)|否|None|**命名参数。**  发送请求的额外数据，默认无此字段。<br>当HTTP请求为POST、PUT等方法时，此字段为HTTP请求的content，以UTF-8编码形式作为请求体。<br>当'content-Type'为'application/x-www-form-urlencoded'时，请求提交的信息主体数据应在key和value进行URL转码后按照键值对"key1=value1&key2=value2&key3=value3"的方式进行编码，该字段对应的类型通常为String；<br>当'content-Type'为'text/xml'时，该字段对应的类型通常为String；<br>当'content-Type'为'application/json'时，该字段对应的类型通常为Object；<br>当'content-Type'为'application/octet-stream'时，该字段对应的类型通常为ArrayBuffer；<br>当'content-Type'为'multipart/form-data'且需上传的字段为文件时，该字段对应的类型通常为ArrayBuffer。<br> 当HTTP请求为GET、OPTIONS、DELETE、TRACE、CONNECT等方法时，此字段为HTTP请求参数的补充。开发者需传入Encode编码后的string类型参数，Object类型的参数无需预编码，参数内容会拼接到URL中进行发送；<br>ArrayBuffer类型的参数不会做拼接处理。<br>以上信息仅供参考，并可能根据具体情况有所不同。|
|expectDataType|?[HttpDataType](#enum-httpdatatype)|否|None|**命名参数。** 指定返回数据的类型，默认无此字段。如果设置了此参数，系统将优先返回指定的类型。|
|usingCache|Bool|否|true|**命名参数。** 是否使用缓存，默认为true，请求时优先读取缓存。 缓存跟随当前进程生效。新缓存会替换旧缓存。|
|priority|UInt32|否|1|**命名参数。** 优先级，范围[1,1000]，默认是1。若传参超出范围则使用默认值1。|
|header|?HashMap\<String,String>|否|None|**命名参数。** HTTP请求头字段。默认{'content-Type': 'application/json'}。|
|readTimeout|UInt32|否|60000|**命名参数。** 读取超时时间。单位为毫秒（ms），默认为60000ms。<br>设置为0表示不会出现超时情况。|
|connectTimeout|UInt32|否|60000|**命名参数。** 连接超时时间。单位为毫秒（ms），默认为60000ms。|
|usingProtocol|?[HttpProtocol](#enum-httpprotocol)|否|None|**命名参数。** 使用协议。默认值由系统自动指定。|
|usingProxy|[UsingProxy](#enum-usingproxy)|否|USE_DEFAULT|**命名参数。** 是否使用HTTP代理，默认为USE_DEFAULT，使用默认代理。<br> 当usingProxy为NOT_USE时，不使用网络代理。<br> 当usingProxy为USE_SPECIFIED类型时，使用指定网络代理。|
|caPath|?String|否|None|**命名参数。** 如果设置了此参数，系统将使用用户指定路径的CA证书，(开发者需保证该路径下CA证书的可访问性)，否则将使用系统预设CA证书，系统预设CA证书位置：/etc/ssl/certs/cacert.pem。证书路径为沙箱映射路径（开发者可通过Global.getContext().filesDir获取应用沙箱路径）。目前仅支持后缀名为.pem的文本格式证书。|
|resumeFrom|?Int64|否|None|**命名参数。** 用于设置上传或下载起始位置。HTTP标准（RFC 7233第3.1节）允许服务器忽略范围请求。<br>使用HTTP PUT时设置此参数，可能出现未知问题。<br>取值范围是:1~4294967296(4GB)，超出范围则不生效。无默认值。|
|resumeTo|?Int64|否|None|**命名参数。** 用于设置上传或下载结束位置。HTTP标准（RFC 7233第3.1节）允许服务器忽略范围请求。<br>使用HTTP PUT时设置此参数，可能出现未知问题。<br>取值范围是:1~4294967296(4GB)，超出范围则不生效。无默认值。|
|clientCert|?[ClientCert](#class-clientcert)|否|None|**命名参数。** 支持传输客户端证书。|
|dnsOverHttps|?String|否|None|**命名参数。** 设置使用HTTPS协议的服务器进行DNS解析。<br>参数必须以以下格式进行URL编码："https:// host:port/path"。|
|dnsServers|?Array\<String>|否|None|**命名参数。** 设置指定的DNS服务器进行DNS解析。<br>可以设置多个DNS解析服务器，最多3个服务器。如果有3个以上，只取前3个。<br>服务器必须是IPv4或者IPv6地址。|
|maxLimit|UInt32|否|5 * 1024 * 1024|**命名参数。** 响应消息的最大字节限制，默认值为5MB，以字节为单位。最大值为10MB，以字节为单位。|
|multiFormDataList|?Array\<[MultiFormData](#class-multiformdata)>|否|None|**命名参数。** 当'content-Type'为'multipart/form-data'时，则上传该字段定义的数据字段表单列表。|

## class HttpResponse

```cangjie
public class HttpResponse <: ToString {}
```

**功能：** request方法回调函数的返回值类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**父类型：**

- ToString

### let cookies

```cangjie
public let cookies: String
```

**功能：** 服务器返回的cookies。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let header

```cangjie
public let header: HashMap<String, String>
```

**功能：** 发起HTTP请求返回来的响应头。

**类型：** HashMap\<String,String>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let performanceTiming

```cangjie
public let performanceTiming: PerformanceTiming
```

**功能：** HTTP请求的各个阶段的耗时。

**类型：** [PerformanceTiming](#class-performancetiming)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let responseCode

```cangjie
public let responseCode: ResponseCode
```

**功能：** 响应的状态码。

**类型：** [ResponseCode](#enum-responsecode)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let result

```cangjie
public let result: HttpData
```

**功能：** HTTP请求根据响应头中content-type类型返回对应的响应格式内容。

**类型：** [HttpData](#enum-httpdata)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let resultType

```cangjie
public let resultType: HttpDataType
```

**功能：** 返回值类型。

**类型：** [HttpDataType](#enum-httpdatatype)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回字符串形式的[HttpResponse](#class-httpresponse)。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回字符串形式的[HttpResponse](#class-httpresponse)。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpRequest = createHttp()
httpRequest.request("http://www.example.com", {err, resp =>
    if (let Some(e) <- err) {
        Hilog.error(0, "test","exception: ${e.message}")
    }
    if (let Some(r) <- resp) {
        Hilog.info(0, "test", "resp: ${r.toString()}")
    } else {
        Hilog.error(0, "test", "response is none")
    }
})
```

## class HttpResponseCache

```cangjie
public class HttpResponseCache {}
```

**功能：** 存储HTTP访问请求响应的对象。在调用HttpResponseCache的方法前，需要先通过[createHttpResponseCache](#func-createhttpresponsecacheuint32)创建一个任务。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func delete()

```cangjie
public func delete(): Unit
```

**功能：** 禁用缓存并删除其中的数据。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpResponseCache = createHttpResponseCache()
try {
    httpResponseCache.delete()
} catch (e: BusinessException) {
    Hilog.info(0, "", "${e}")
}
```

### func flush()

```cangjie
public func flush(): Unit
```

**功能：** 将缓存中的数据写入文件系统，以便在下一个HTTP请求中访问所有缓存数据。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpResponseCache = createHttpResponseCache()
try {
    httpResponseCache.flush()
} catch (e: BusinessException) {
    Hilog.info(0, "", "${e}")
}
```

## class MultiFormData

```cangjie
public class MultiFormData {
    public MultiFormData(
        public let name: String,
        public let contentType: String,
        public let remoteFileName!: ?String = None,
        public let data!: ?HttpData = None,
        public let filePath!: ?String = None
    )
}
```

**功能：** 多部分表单数据的类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let contentType

```cangjie
public let contentType: String
```

**功能：** 数据类型，如'text/plain'，'image/png', 'image/jpeg', 'audio/mpeg', 'video/mp4'等。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let data

```cangjie
public let data:?HttpData = None
```

**功能：** 表单数据内容。

**类型：** ?[HttpData](#enum-httpdata)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let filePath

```cangjie
public let filePath:?String = None
```

**功能：** 此参数根据文件的内容设置mime部件的正文内容。用于代替data将文件数据设置为数据内容，如果data为空，则必须设置filePath。如果data有值，则filePath不会生效。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 数据名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let remoteFileName

```cangjie
public let remoteFileName:?String = None
```

**功能：** 上传到服务器保存为文件的名称。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### MultiFormData(String, String, ?String, ?HttpData, ?String)

```cangjie
public MultiFormData(
    public let name: String,
    public let contentType: String,
    public let remoteFileName!: ?String = None,
    public let data!: ?HttpData = None,
    public let filePath!: ?String = None
)
```

**功能：** 构造MultiFormData实例。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|数据名称。|
|contentType|String|是|-|数据类型，如'text/plain'，'image/png', 'image/jpeg', 'audio/mpeg', 'video/mp4'等。|
|remoteFileName|?String|否|None|**命名参数。** 上传到服务器保存为文件的名称。|
|data|?[HttpData](#enum-httpdata)|否|None|**命名参数。** 表单数据内容。|
|filePath|?String|否|None|**命名参数。** 此参数根据文件的内容设置mime部件的正文内容。用于代替data将文件数据设置为数据内容，如果data为空，则必须设置filePath。如果data有值，则filePath不会生效。|

## class PerformanceTiming

```cangjie
public class PerformanceTiming <: ToString {}
```

**功能：** 性能打点数据，单位为毫秒。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**父类型：**

- ToString

### let dnsTiming

```cangjie
public let dnsTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到DNS解析完成耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let firstReceiveTiming

```cangjie
public let firstReceiveTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到接收第一个字节的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let firstSendTiming

```cangjie
public let firstSendTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到开始发送第一个字节的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let redirectTiming

```cangjie
public let redirectTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到完成所有重定向步骤的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let responseBodyTiming

```cangjie
public let responseBodyTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到body解析完成的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let responseHeaderTiming

```cangjie
public let responseHeaderTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到header解析完成的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let tcpTiming

```cangjie
public let tcpTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到TCP连接完成耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let tlsTiming

```cangjie
public let tlsTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到TLS连接完成耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let totalFinishTiming

```cangjie
public let totalFinishTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求到完成请求的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### let totalTiming

```cangjie
public let totalTiming: Float64
```

**功能：** 从[request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions)请求回调到应用程序的耗时。

**类型：** Float64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回字符串形式的[PerformanceTiming](#class-performancetiming)。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回字符串形式的[PerformanceTiming](#class-performancetiming)。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import ohos.hilog.Hilog

let httpRequest = createHttp()
httpRequest.request("http://www.example.com", {err, resp =>
    if (let Some(e) <- err) {
        Hilog.error(0, "test","exception: ${e.message}")
    }
    if (let Some(r) <- resp) {
        Hilog.info(0, "test", "resp: ${r.performanceTiming.toString()}")
    } else {
        Hilog.error(0, "test", "response is none")
    }
})
```

## enum CertType

```cangjie
public enum CertType {
    | PEM
    | DER
    | P12
    | ...
}
```

**功能：** 证书类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### DER

```cangjie
DER
```

**功能：** 证书类型DER。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### P12

```cangjie
P12
```

**功能：** 证书类型P12。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PEM

```cangjie
PEM
```

**功能：** 证书类型PEM。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## enum HttpData

```cangjie
public enum HttpData <: ToString {
    | STRING_DATA(String)
    | ARRAY_DATA(Array<Byte>)
    | ...
}
```

**功能：** HTTP的数据。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**父类型：**

- ToString

### ARRAY_DATA(Array\<Byte>)

```cangjie
ARRAY_DATA(Array<Byte>)
```

**功能：** 二进制数组。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### STRING_DATA(String)

```cangjie
STRING_DATA(String)
```

**功能：** 字符串。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回字符串形式的[HttpData](#enum-httpdata)。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回字符串形式的[HttpData](#enum-httpdata)。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let httpData = HttpData.STRING_DATA("data to send")
AppLog.info(httpData.toString())
```

## enum HttpDataType

```cangjie
public enum HttpDataType {
    | STRING
    | ARRAY_BUFFER
    | ...
}
```

**功能：** HTTP的数据类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### ARRAY_BUFFER

```cangjie
ARRAY_BUFFER
```

**功能：** 二进制数组类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### STRING

```cangjie
STRING
```

**功能：** 字符串类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## enum HttpProtocol

```cangjie
public enum HttpProtocol {
    | HTTP1_1
    | HTTP2
    | HTTP3
    | ...
}
```

**功能：** HTTP协议版本。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### HTTP1_1

```cangjie
HTTP1_1
```

**功能：** 协议HTTP/1.1。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### HTTP2

```cangjie
HTTP2
```

**功能：** 协议HTTP/2。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### HTTP3

```cangjie
HTTP3
```

**功能：** 协议HTTP/3，若系统或服务器不支持，则使用低版本的HTTP协议请求。仅对HTTPS的URL生效，HTTP则会请求失败。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## enum RequestMethod

```cangjie
public enum RequestMethod {
    | OPTIONS
    | GET
    | HEAD
    | POST
    | PUT
    | DELETE
    | TRACE
    | CONNECT
    | ...
}
```

**功能：** HTTP请求方法。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### CONNECT

```cangjie
CONNECT
```

**功能：** HTTP请求CONNECT。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### DELETE

```cangjie
DELETE
```

**功能：** HTTP请求DELETE。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### GET

```cangjie
GET
```

**功能：** HTTP请求GET。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### HEAD

```cangjie
HEAD
```

**功能：** HTTP请求HEAD。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### OPTIONS

```cangjie
OPTIONS
```

**功能：** HTTP请求OPTIONS。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### POST

```cangjie
POST
```

**功能：** HTTP请求POST。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PUT

```cangjie
PUT
```

**功能：** HTTP请求PUT。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### TRACE

```cangjie
TRACE
```

**功能：** HTTP请求TRACE。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): String
```

**功能：** 获取RequestMethod枚举对应的字符串。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回RequestMethod枚举对应的字符串。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let getMethod = RequestMethod.GET.getValue()
```

## enum ResponseCode

```cangjie
public enum ResponseCode {
    | OK
    | CREATED
    | ACCEPTED
    | NOT_AUTHORITATIVE
    | NO_CONTENT
    | RESET
    | PARTIAL
    | MULT_CHOICE
    | MOVED_PERM
    | MOVED_TEMP
    | SEE_OTHER
    | NOT_MODIFIED
    | USE_PROXY
    | BAD_REQUEST
    | UNAUTHORIZED
    | PAYMENT_REQUIRED
    | FORBIDDEN
    | NOT_FOUND
    | BAD_METHOD
    | NOT_ACCEPTABLE
    | PROXY_AUTH
    | CLIENT_TIMEOUT
    | CONFLICT
    | GONE
    | LENGTH_REQUIRED
    | PRECON_FAILED
    | ENTITY_TOO_LARGE
    | REQ_TOO_LONG
    | UNSUPPORTED_TYPE
    | REQUESTED_RANGE_NOT_SATISFIABLE
    | EXPECTATION_FAILED
    | TEAPOT
    | MISDIRECTED_REQUEST
    | UNPROCESSABLE_ENTITY
    | LOCKED
    | FAILED_DEPENDENCY
    | TOO_EARLY
    | UPGRADE_REQUIRED
    | PRECONDITION_REQUIRED
    | TOO_MANY_REQUESTS
    | REQUEST_HEADER_FIELDS_TOO_LARGE
    | UNAVAILABLE_FOR_LEGAL_REASONS
    | INTERNAL_ERROR
    | NOT_IMPLEMENTED
    | BAD_GATEWAY
    | UNAVAILABLE
    | GATEWAY_TIMEOUT
    | VERSION
    | VARIANT_ALSO_NEGOTIATES
    | INSUFFICIENT_STORAGE
    | LOOP_DETECTED
    | NOT_EXTENDED
    | NETWORK_AUTHENTICATION_REQUIRED
    | ...
}
```

**功能：** 发起请求返回的响应码。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### ACCEPTED

```cangjie
ACCEPTED
```

**功能：** 已经接受请求，但未处理完成。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### BAD_GATEWAY

```cangjie
BAD_GATEWAY
```

**功能：** 充当网关或代理的服务器，从远端服务器接收到了一个无效的请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### BAD_METHOD

```cangjie
BAD_METHOD
```

**功能：** 客户端请求中的方法被禁止。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### BAD_REQUEST

```cangjie
BAD_REQUEST
```

**功能：** 客户端请求的语法错误，服务器无法理解。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### CLIENT_TIMEOUT

```cangjie
CLIENT_TIMEOUT
```

**功能：** 请求时间过长，超时。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### CONFLICT

```cangjie
CONFLICT
```

**功能：** 服务器完成客户端的PUT请求是可能返回此代码，服务器处理请求时发生了冲突。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### CREATED

```cangjie
CREATED
```

**功能：** 成功请求并创建了新的资源。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### ENTITY_TOO_LARGE

```cangjie
ENTITY_TOO_LARGE
```

**功能：** 由于请求的实体过大，服务器无法处理，因此拒绝请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### EXPECTATION_FAILED

```cangjie
EXPECTATION_FAILED
```

**功能：** 此响应代码表示服务器无法满足Expect请求标头字段所指示的期望。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### FAILED_DEPENDENCY

```cangjie
FAILED_DEPENDENCY
```

**功能：** 由于前一个请求失败，本次请求失败。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### FORBIDDEN

```cangjie
FORBIDDEN
```

**功能：** 服务器理解请求客户端的请求，但是拒绝执行此请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### GATEWAY_TIMEOUT

```cangjie
GATEWAY_TIMEOUT
```

**功能：** 充当网关或代理的服务器，未及时从远端服务器获取请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### GONE

```cangjie
GONE
```

**功能：** 客户端请求的资源已经不存在。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### INSUFFICIENT_STORAGE

```cangjie
INSUFFICIENT_STORAGE
```

**功能：** 无法在资源上执行该方法，因为服务器无法存储成功完成请求所需的表示。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### INTERNAL_ERROR

```cangjie
INTERNAL_ERROR
```

**功能：** 服务器内部错误，无法完成请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### LENGTH_REQUIRED

```cangjie
LENGTH_REQUIRED
```

**功能：** 服务器无法处理客户端发送的不带Content-Length的请求信息。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### LOCKED

```cangjie
LOCKED
```

**功能：** 正在访问的资源已锁定。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### LOOP_DETECTED

```cangjie
LOOP_DETECTED
```

**功能：** 服务器在处理请求时检测到无限循环。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### MISDIRECTED_REQUEST

```cangjie
MISDIRECTED_REQUEST
```

**功能：** 请求被定向到无法生成响应的服务器。这可以由未配置为针对请求 URI 中包含的方案和权限组合生成响应的服务器发送。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### MOVED_PERM

```cangjie
MOVED_PERM
```

**功能：** 永久移动。请求的资源已被永久的移动到新URI，返回信息会包括新的URI，浏览器会自动定向到新URI。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### MOVED_TEMP

```cangjie
MOVED_TEMP
```

**功能：** 临时移动。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### MULT_CHOICE

```cangjie
MULT_CHOICE
```

**功能：** 多种选择。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NETWORK_AUTHENTICATION_REQUIRED

```cangjie
NETWORK_AUTHENTICATION_REQUIRED
```

**功能：** 指示客户端需要进行身份验证才能获得网络访问权限。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_ACCEPTABLE

```cangjie
NOT_ACCEPTABLE
```

**功能：** 服务器无法根据客户端请求的内容特性完成请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_AUTHORITATIVE

```cangjie
NOT_AUTHORITATIVE
```

**功能：** 非授权信息。请求成功。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_EXTENDED

```cangjie
NOT_EXTENDED
```

**功能：** 服务器需要对请求进行进一步扩展才能完成请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_FOUND

```cangjie
NOT_FOUND
```

**功能：** 服务器无法根据客户端的请求找到资源（网页）。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_IMPLEMENTED

```cangjie
NOT_IMPLEMENTED
```

**功能：** 服务器不支持请求的功能，无法完成请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_MODIFIED

```cangjie
NOT_MODIFIED
```

**功能：** 未修改。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NO_CONTENT

```cangjie
NO_CONTENT
```

**功能：** 无内容。服务器成功处理，但未返回内容。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### OK

```cangjie
OK
```

**功能：** 请求成功。一般用于GET与POST请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PARTIAL

```cangjie
PARTIAL
```

**功能：** 部分内容。服务器成功处理了部分GET请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PAYMENT_REQUIRED

```cangjie
PAYMENT_REQUIRED
```

**功能：** 保留，将来使用。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PRECONDITION_REQUIRED

```cangjie
PRECONDITION_REQUIRED
```

**功能：** 源服务器要求请求是有条件的。此响应旨在防止'丢失更新'问题，即当第三方修改服务器上的状态时，客户端GET获取资源的状态，对其进行修改并将其PUT放回服务器，从而导致冲突。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PRECON_FAILED

```cangjie
PRECON_FAILED
```

**功能：** 客户端请求信息的先决条件错误。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### PROXY_AUTH

```cangjie
PROXY_AUTH
```

**功能：** 请求要求代理的身份认证。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### REQUESTED_RANGE_NOT_SATISFIABLE

```cangjie
REQUESTED_RANGE_NOT_SATISFIABLE
```

**功能：** 无法满足请求中Range标头字段指定的范围。该范围可能超出了目标URI数据的大小。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### REQUEST_HEADER_FIELDS_TOO_LARGE

```cangjie
REQUEST_HEADER_FIELDS_TOO_LARGE
```

**功能：** 服务器不愿意处理请求，因为其头字段太大。在减小请求头字段的大小后，可以重新提交请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### REQ_TOO_LONG

```cangjie
REQ_TOO_LONG
```

**功能：** 请求的URI过长（URI通常为网址），服务器无法处理。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### RESET

```cangjie
RESET
```

**功能：** 重置内容。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### SEE_OTHER

```cangjie
SEE_OTHER
```

**功能：** 查看其它地址。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### TEAPOT

```cangjie
TEAPOT
```

**功能：** 服务端拒绝用茶壶煮咖啡。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### TOO_EARLY

```cangjie
TOO_EARLY
```

**功能：** 表示服务器不愿意冒险处理可能被重播的请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### TOO_MANY_REQUESTS

```cangjie
TOO_MANY_REQUESTS
```

**功能：** 表示用户在给定的时间内发送了太多请求，应限制请求速率。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UNAUTHORIZED

```cangjie
UNAUTHORIZED
```

**功能：** 请求要求用户的身份认证。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UNAVAILABLE

```cangjie
UNAVAILABLE
```

**功能：** 由于超载或系统维护，服务器暂时的无法处理客户端的请求。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UNAVAILABLE_FOR_LEGAL_REASONS

```cangjie
UNAVAILABLE_FOR_LEGAL_REASONS
```

**功能：** 用户代理请求了无法合法提供的资源，例如政府审查的网页。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UNPROCESSABLE_ENTITY

```cangjie
UNPROCESSABLE_ENTITY
```

**功能：** 请求格式正确，但由于语义错误而无法遵循。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UNSUPPORTED_TYPE

```cangjie
UNSUPPORTED_TYPE
```

**功能：** 服务器无法处理请求的格式。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### UPGRADE_REQUIRED

```cangjie
UPGRADE_REQUIRED
```

**功能：** 服务器拒绝使用当前协议执行请求，但在客户端升级到其他协议后可能愿意这样做。 服务端发送带有Upgrade(en-US)字段的426响应 来表明它所需的协议。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### USE_PROXY

```cangjie
USE_PROXY
```

**功能：** 使用代理。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### VARIANT_ALSO_NEGOTIATES

```cangjie
VARIANT_ALSO_NEGOTIATES
```

**功能：** 服务器存在内部配置错误：所选的变体资源被配置为参与透明内容协商本身，因此不是协商过程中的适当终点。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### VERSION

```cangjie
VERSION
```

**功能：** 服务器请求的HTTP协议的版本。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### static func parse(UInt32)

```cangjie
public static func parse(code: UInt32): ResponseCode
```

**功能：** 获取状态码对应。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|code|UInt32|是|-|状态码的数值。|

**返回值：**

|类型|说明|
|:----|:----|
|[ResponseCode](#enum-responsecode)|返回的响应码。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let code = ResponseCode.parse(200)
```

### func getValue()

```cangjie
public func getValue(): UInt32
```

**功能：** 获取ResponseCode枚举对应的数值。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|返回ResponseCode枚举对应的数值。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let code = ResponseCode.OK.getValue()
```

## enum UsingProxy

```cangjie
public enum UsingProxy {
    | NOT_USE
    | USE_DEFAULT
    | USE_SPECIFIED(HttpProxy)
    | ...
}
```

**功能：** 使用代理的类型。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### NOT_USE

```cangjie
NOT_USE
```

**功能：** 不使用代理。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### USE_DEFAULT

```cangjie
USE_DEFAULT
```

**功能：** 使用默认代理。
**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

### USE_SPECIFIED(HttpProxy)

```cangjie
USE_SPECIFIED(HttpProxy)
```

**功能：** 使用指定类型代理。

**系统能力：** SystemCapability.Communication.NetStack

**起始版本：** 21

## 完整示例

```cangjie
import kit.NetworkKit.*
import ohos.base.*
import std.collection.*

// 每一个httpRequest对应一个HTTP请求任务，不可复用
let httpRequest = createHttp()
// 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
httpRequest.onHeadersReceive({header: HashMap<String, String> =>
    AppLog.info("header: ${header}")
})

let option = HttpRequestOptions(
    method: RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
    // 当使用POST请求时此字段用于传递内容
    extraData: HttpData.STRING_DATA("data to send"),
    expectDataType: HttpDataType.STRING, // 可选，指定返回数据的类型
    usingCache: true, // 可选，默认为true
    priority: 1, // 可选，默认为1
    // 开发者根据自身业务需要添加header字段
    header: HashMap<String, String>([("content-type", "application/json")]),
    readTimeout: 60000, // 可选，默认为60000ms
    connectTimeout: 60000, // 可选，默认为60000ms
    usingProtocol: HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
    usingProxy: UsingProxy.USE_DEFAULT, //可选，默认不使用网络代理，自API 10开始支持该属性
    caPath: "/path/to/cacert.pem", // 可选，默认使用系统预设CA证书，自API 10开始支持该属性
    clientCert: ClientCert(
        "/path/to/client.pem", // 默认不使用客户端证书
        "/path/to/client.key", // 若证书包含Key信息，传入空字符串
        certType: CertType.PEM, // 可选，默认使用PEM
        keyPassword: "passwordToKey" // 可选，输入key文件的密码
    ),
    multiFormDataList: [ // 可选，仅当Header中，'content-Type'为'multipart/form-data'时生效
        MultiFormData (
            "Part1", // 数据名
            "text/plain", // 数据类型
            data: STRING_DATA("Example data"), // 可选，数据内容
            remoteFileName: "example.txt" // 可选
        ),
        MultiFormData (
            "Part2", // 数据名
            "text/plain", // 数据类型
            filePath: "/data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt", // 可选，传入文件路径
            remoteFileName: "fileName.txt" // 可选
        )
    ]
)

httpRequest.request( // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
    "http://www.example.com", { err, resp =>
        if (let Some(e) <- err) {
            Hilog.error(0, "test","exception: ${e.message}")
            throw e
        }
        if (let Some(r) <- resp) {
            Hilog.error(0, "test", "${r}")
        } else {
            Hilog.error(0, "test", "resp is none")
        }
        httpRequest.destroy()
    }, options: option)
```
