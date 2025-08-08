# ohos.net.http (Data Request)

This module provides HTTP data request capabilities. Applications can initiate data requests via HTTP, supporting common methods such as GET, POST, OPTIONS, HEAD, PUT, DELETE, TRACE, and CONNECT.

## Import Module

```cangjie
import kit.NetworkKit.*
```

## Permission List

ohos.permission.INTERNET

## Usage Instructions

API example code usage instructions:

- If the first line of the example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## func createHttp()

```cangjie
public func createHttp(): HttpRequest
```

**Description:** Creates an HTTP request. The request object includes functionalities such as initiating requests, aborting requests, and subscribing/unsubscribing to HTTP Response Header events. Each HttpRequest object corresponds to one HTTP request. To initiate multiple HTTP requests, a corresponding HttpRequest object must be created for each HTTP request.

> **Note:**
>
> When the request is no longer needed, the `destroy` method must be called to actively destroy the HttpRequest object.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [HttpRequest](#class-httprequest) | Returns an HttpRequest object, which includes methods such as `request`, `requestInStream`, `destroy`, `on`, and `off`. |

**Example:**

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

**Description:** Creates a default object to store responses from HTTP access requests.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| cacheSize | UInt32 | No | MAX_CACHE_SIZE | **Named parameter.** The maximum cache size is 10*1024*1024 (10MB), defaulting to the maximum. |

**Return Value:**

| Type | Description |
|:----|:----|
| [HttpResponseCache](#class-httpresponsecache) | Returns an object that stores HTTP access request responses. |

**Example:**

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

**Description:** Client certificate type.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let certPath

```cangjie
public let certPath: String
```

**Description:** Certificate path.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let certType

```cangjie
public let certType: CertType = CertType.PEM
```

**Description:** Certificate type, default is PEM.

**Type:** [CertType](#enum-certtype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let keyPassword

```cangjie
public let keyPassword:?String = None
```

**Description:** Password for the certificate key.

**Type:** ?String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let keyPath

```cangjie
public let keyPath: String
```

**Description:** Path to the certificate key.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### ClientCert(String, String, CertType, ?String)

```cangjie
public ClientCert(
    public let certPath: String,
    public let keyPath: String,
    public let certType!: CertType = CertType.PEM,
    public let keyPassword!: ?String = None
)
```

**Description:** Constructs a ClientCert instance.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| certPath | String | Yes | - | Certificate path. |
| keyPath | String | Yes | - | Path to the certificate key. |
| certType | [CertType](#enum-certtype) | No | CertType.PEM | **Named parameter.** Certificate type, default is PEM. |
| keyPassword | ?String | No | None | **Named parameter.** Password for the certificate key. |

## class DataReceiveProgressInfo

```cangjie
public class DataReceiveProgressInfo {}
```

**Description:** Data reception information.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let receiveSize

```cangjie
public let receiveSize: UInt32
```

**Description:** Amount of data received, in bytes.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let totalSize

```cangjie
public let totalSize: UInt32
```

**Description:** Total amount of data to be received, in bytes.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

## class DataSendProgressInfo

```cangjie
public class DataSendProgressInfo {}
```

**Description:** Data transmission information.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let sendSize

```cangjie
public let sendSize: UInt32
```

**Description:** Amount of data sent each time, in bytes.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let totalSize

```cangjie
public let totalSize: UInt32
```

**Description:** Total amount of data to be sent, in bytes.

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

## class HttpRequest

```cangjie
public class HttpRequest {}
```

**Description:** HTTP request task. Before calling methods of HttpRequest, you need to create a task via [createHttp](../NetworkKit/cj-apis-net-http.md#func-createhttp).**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### func destroy()  

```cangjie  
public func destroy(): Unit  
```  

**Description:** Terminates the request task.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Unsubscribes from the HTTP streaming response data completion event.  

> **Note:**  
>  
> Clears all subscriptions.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Unsubscribes from the HTTP streaming response data reception event.  

> **Note:**  
>  
> Clears all subscriptions.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Unsubscribes from the HTTP streaming response data reception progress event.  

> **Note:**  
>  
> Clears all subscriptions.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Unsubscribes from the HTTP network request data transmission progress event.  

> **Note:**  
>  
> Clears all subscriptions.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Unsubscribes from the HTTP Response Header event.  

> **Note:**  
>  
> Clears all subscriptions.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Description:** Subscribes to the HTTP streaming response data completion event.  

> **Note:**  
>  
> Subscription to HTTP streaming data upload events is not currently supported.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | () -> Unit | Yes | - | Callback function. |  

**Example:**  

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

**Description:** Subscribes to the HTTP streaming response data reception event.  

> **Note:**  
>  
> Subscription to HTTP streaming data upload events is not currently supported.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | (Array\<[Byte](<font color="red" face="bold">please add link</font>)>) -> Unit | Yes | - | Callback function. |  

**Example:**  

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

**Description:** Subscribes to the HTTP streaming response data reception progress event.  

> **Note:**  
>  
> Subscription to HTTP streaming data upload events is not currently supported.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| callback | ([DataReceiveProgressInfo](#class-datareceiveprogressinfo)) -> Unit | Yes | - | Callback function. Returns data reception progress information. |  

**Example:**  

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

**Function:** Subscribes to HTTP network request data sending progress events.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([DataSendProgressInfo](#class-datasendprogressinfo))->Unit | Yes | - | Callback function. Returns data sending progress information. |

**Example:**

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

**Function:** Subscribes to HTTP Response Header events.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (HashMap\<String,String>)->Unit | Yes | - | Callback function. |

**Example:**

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

**Function:** Subscribes to HTTP Response Header events, but triggers only once. Once triggered, the subscriber registered by this function will be removed.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | (HashMap\<String,String>)->Unit | Yes | - | Callback function. |

**Example:**

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

**Function:** Initiates an HTTP network request based on the URL address and returns the response in the callback function.

> **Note:**
>
> This interface only supports receiving data with a size of up to 5MB.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | URL address for the network request. |
| callback | (?[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception),?[HttpResponse](#class-httpresponse))->Unit | Yes | - | Callback function. |
| options | ?[HttpRequestOptions](#class-httprequestoptions) | No | None | **Named parameter.** Refer to [HttpRequestOptions](#class-httprequestoptions). |

**Exceptions:**

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 201 | Permission denied. |
  | 2300001 | Unsupported protocol. |
  | 2300003 | URL using bad/illegal format or missing URL. |
  | 2300005 | Couldn't resolve proxy name. |
  | 2300006 | Couldn't resolve host name. |
  | 2300007 | Couldn't connect to server. |
  | 2300008 | Weird server reply. |
  | 2300009 | Access denied to remote resource. |
  | 2300016 | Error in the HTTP2 framing layer. |
  | 2300018 | Transferred a partial file. |
  | 2300023 | Failed writing received data to disk/application. |
  | 2300025 | Upload failed. |
  | 2300026 | Failed to open/read local data from file/application. |
  | 2300027 | Out of memory. |
  | 2300028 | Timeout was reached. |
  | 2300047 | Number of redirects hit maximum amount. |
  | 2300052 | Server returned nothing (no headers, no data). |
  | 2300055 | Failed sending data to the peer. |
  | 2300056 | Failure when receiving data from the peer. |
  | 2300058 | Problem with the local SSL certificate. |
  | 2300059 | Couldn't use specified SSL cipher. |
  | 2300060 | SSL peer certificate or SSH remote key was not OK. |
  | 2300061 | Unrecognized or bad HTTP Content or Transfer-Encoding. |
  | 2300063 | Maximum file size exceeded. |
  | 2300070 | Disk full or allocation exceeded. |
  | 2300073 | Remote file already exists. |
  | 2300077 | Problem with the SSL CA cert (path? access rights?). |
  | 2300078 | Remote file not found. |
  | 2300094 | An authentication function returned an error. |
  | 2300999 | Unknown Other Error. |

> **Error Code Description:**
>
> For detailed descriptions of the above error codes, refer to [HTTP Error Codes](../../errorcodes/cj-errorcode-net-http.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).
> HTTP interface error code mapping: 2300000 + curl error code. For more common error codes, refer to: [curl Error Codes](https://curl.se/libcurl/c/libcurl-errors.html).

**Example:**

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

**Function:** Initiates an HTTP network request based on the URL address and configuration options, returning a streaming response in the callback function.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| url | String | Yes | - | URL address for the network request. |
| callback | (?[BusinessException](../BasicServicesKit/cj-apis-base.md#class-businessexception),?UInt32)->Unit | Yes | - | Callback function. |
| options | ?[HttpRequestOptions](#class-httprequestoptions) | No | None | **Named parameter.** Refer to [HttpRequestOptions](#class-httprequestoptions). |

**Exceptions:**

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 201 | Permission denied. |
  | 2300001 | Unsupported protocol. |
  | 2300003 | URL using bad/illegal format or missing URL. |
  | 2300005 | Couldn't resolve proxy name. |
  | 2300006 | Couldn't resolve host name. |
  | 2300007 | Couldn't connect to server. |
  | 2300008 | Weird server reply. |
  | 2300009 | Access denied to remote resource. |
  | 2300016 | Error in the HTTP2 framing layer. |
  | 2300018 | Transferred a partial file. |
  | 2300023 | Failed writing received data to disk/application. |
  | 2300025 | Upload failed. |
  | 2300026 | Failed to open/read local data from file/application. |
  | 2300027 | Out of memory. |
  | 2300028 | Timeout was reached. |
  | 2300047 | Number of redirects hit maximum amount. |
  | 2300052 | Server returned nothing (no headers, no data). |
  | 2300055 | Failed sending data to the peer. |
  | 2300056 | Failure when receiving data from the peer. |
  | 2300058 | Problem with the local SSL certificate. |
  | 2300059 | Couldn't use specified SSL cipher. |
  | 2300060 | SSL peer certificate or SSH remote key was not OK. |
  | 2300061 | Unrecognized or bad HTTP Content or Transfer-Encoding. |
  | 2300063 | Maximum file size exceeded. |
  | 2300070 | Disk full or allocation exceeded. |
  | 2300073 | Remote file already exists. |
  | 2300077 | Problem with the SSL CA cert (path? access rights?). |
  | 2300078 | Remote file not found. |
  | 2300094 | An authentication function returned an error. |
  | 2300999 | Unknown Other Error. |

> **Error Code Description:**
>
> For detailed descriptions of the above error codes, refer to [HTTP Error Codes](../../errorcodes/cj-errorcode-net-http.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).
> HTTP interface error code mapping: 2300000 + curl error code. For more common error codes, refer to: [curl Error Codes](https://curl.se/libcurl/c/libcurl-errors.html).

**Example:**

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

**Function:** Type and value range of optional parameters for initiating requests.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let caPath

```cangjie
public let caPath:?String = None
```

**Function:** If this parameter is set, the system will use the CA certificate at the user-specified path (developers must ensure the accessibility of the CA certificate at this path). Otherwise, the system will use the preset CA certificate located at: /etc/ssl/certs/cacert.pem. The certificate path is a sandbox-mapped path (developers can obtain the application sandbox path via Global.getContext().filesDir). Currently, only text-format certificates with the .pem extension are supported.

**Type:** ?String

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let clientCert

```cangjie
public let clientCert:?ClientCert = None
```

**Function:** Supports transmitting client certificates.

**Type:** ?[ClientCert](#class-clientcert)

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let connectTimeout

```cangjie
public let connectTimeout: UInt32 = 60000
```

**Function:** Connection timeout duration. Unit: milliseconds (ms), default is 60000ms.

**Type:** UInt32

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let dnsOverHttps

```cangjie
public let dnsOverHttps:?String = None
```

**Function:** Sets the use of an HTTPS protocol server for DNS resolution.<br />The parameter must be URL-encoded in the following format: "https://host:port/path".

**Type:** ?String

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let dnsServers

```cangjie
public let dnsServers:?Array<String>= None
```

**Function:** Sets specified DNS servers for DNS resolution.<br />Multiple DNS resolution servers can be set, with a maximum of 3 servers. If more than 3 are provided, only the first 3 will be used.<br />Servers must be IPv4 or IPv6 addresses.

**Type:** ?Array\<String>

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let expectDataType

```cangjie
public let expectDataType:?HttpDataType = None
```

**Function:** Specifies the type of returned data. By default, this field is not set. If this parameter is specified, the system will prioritize returning the specified type.

**Type:** ?[HttpDataType](#enum-httpdatatype)

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let extraData

```cangjie
public let extraData:?HttpData = None
```

**Function:** Additional data for sending requests. By default, this field is not set.

- For HTTP requests with methods like POST or PUT, this field serves as the HTTP request content, encoded in UTF-8 as the request body.
    - When 'content-Type' is 'application/x-www-form-urlencoded', the submitted data should be URL-encoded key-value pairs in the format "key1=value1&key2=value2&key3=value3". The corresponding type for this field is typically String.
    - When 'content-Type' is 'text/xml', the corresponding type is typically String.
    - When 'content-Type' is 'application/json', the corresponding type is typically Object.
    - When 'content-Type' is 'application/octet-stream', the corresponding type is typically ArrayBuffer.
    - When 'content-Type' is 'multipart/form-data' and the field to be uploaded is a file, the corresponding type is typically ArrayBuffer.
- For HTTP requests with methods like GET, OPTIONS, DELETE, TRACE, or CONNECT, this field supplements the HTTP request parameters. Developers should provide string-type parameters that have been Encode-encoded. Object-type parameters do not require pre-encoding and will be appended to the URL for sending; ArrayBuffer-type parameters will not be appended.

The above information is for reference only and may vary depending on specific circumstances.

**Type:** ?[HttpData](#enum-httpdata)

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let header

```cangjie
public let header:?HashMap<String, String>= None
```

**Function:** HTTP request header fields. Default is {'content-Type': 'application/json'}.

**Type:** ?HashMap\<String,String>

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let maxLimit

```cangjie
public let maxLimit: UInt32 = 5 * 1024 * 1024
```

**Function:** Maximum byte limit for response messages, default is 5MB in bytes. Maximum value is 10MB in bytes.

**Type:** UInt32

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let method

```cangjie
public let method: RequestMethod = RequestMethod.GET
```

**Function:** Request method, default is GET.

**Type:** [RequestMethod](#enum-requestmethod)

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let multiFormDataList

```cangjie
public let multiFormDataList:?Array<MultiFormData>= None
```

**Function:** When 'content-Type' is 'multipart/form-data', this field defines the list of data fields to be uploaded.

**Type:** ?Array\<[MultiFormData](#class-multiformdata)>

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let priority

```cangjie
public let priority: UInt32 = 1
```

**Function:** Priority, range [1,1000], default is 1. If the parameter exceeds the range, the default value 1 will be used.

**Type:** UInt32

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let readTimeout

```cangjie
public let readTimeout: UInt32 = 60000
```

**Function:** Read timeout duration. Unit: milliseconds (ms), default is 60000ms.<br />Setting it to 0 means no timeout will occur.

**Type:** UInt32

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let resumeFrom

```cangjie
public let resumeFrom:?Int64 = None
```

**Function:** Used to set the starting position for upload or download. HTTP standard (RFC 7233 Section 3.1) allows servers to ignore range requests.<br />Setting this parameter when using HTTP PUT may cause unknown issues.<br />Valid range: 1~4294967296 (4GB). Values outside this range will not take effect. No default value.

**Type:** ?Int64

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let resumeTo

```cangjie
public let resumeTo:?Int64 = None
```

**Function:** Used to set the ending position for upload or download. HTTP standard (RFC 7233 Section 3.1) allows servers to ignore range requests.<br />Setting this parameter when using HTTP PUT may cause unknown issues.<br />Valid range: 1~4294967296 (4GB). Values outside this range will not take effect. No default value.

**Type:** ?Int64

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let usingCache

```cangjie
public let usingCache: Bool = true
```

**Function:** Whether to use cache, default is true. The cache is read first when making requests. The cache is effective within the current process. New cache will replace old cache.

**Type:** Bool

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### let usingProtocol

```cangjie
public let usingProtocol:?HttpProtocol = None
```

**Function:** Protocol to use. Default value is automatically specified by the system.

**Type:** ?[HttpProtocol](#enum-httpprotocol)
**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let usingProxy  

```cangjie  
public let usingProxy: UsingProxy = USE_DEFAULT  
```  

**Function:** Specifies whether to use an HTTP proxy. Default is USE_DEFAULT, which uses the default proxy.  
- When usingProxy is NOT_USE, no network proxy is used.  
- When usingProxy is USE_SPECIFIED, the specified network proxy is used.  

**Type:** [UsingProxy](#enum-usingproxy)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

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

**Function:** Constructs an HttpRequestOptions instance.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| method | [RequestMethod](#enum-requestmethod) | No | RequestMethod.GET | **Named parameter.** Request method, default is GET. |  
| extraData | ?[HttpData](#enum-httpdata) | No | None | **Named parameter.** Additional data for the request, default is None.  
When the HTTP request is POST, PUT, etc., this field is the HTTP request content, encoded in UTF-8 as the request body.  
When 'content-Type' is 'application/x-www-form-urlencoded', the submitted data should be URL-encoded as key-value pairs like "key1=value1&key2=value2&key3=value3", typically of type String.  
When 'content-Type' is 'text/xml', the field is typically of type String.  
When 'content-Type' is 'application/json', the field is typically of type Object.  
When 'content-Type' is 'application/octet-stream', the field is typically of type ArrayBuffer.  
When 'content-Type' is 'multipart/form-data' and the field to upload is a file, the field is typically of type ArrayBuffer.  
For GET, OPTIONS, DELETE, TRACE, CONNECT methods, this field supplements the HTTP request parameters. Developers should pass URL-encoded string parameters; Object-type parameters do not need pre-encoding and will be appended to the URL. ArrayBuffer-type parameters are not processed.  
The above information is for reference and may vary based on specific cases. |  
| expectDataType | ?[HttpDataType](#enum-httpdatatype) | No | None | **Named parameter.** Specifies the return data type, default is None. If set, the system prioritizes returning the specified type. |  
| usingCache | Bool | No | true | **Named parameter.** Whether to use cache, default is true. Requests prioritize reading from cache. Cache is process-specific; new cache replaces old cache. |  
| priority | UInt32 | No | 1 | **Named parameter.** Priority, range [1,1000], default is 1. Values outside the range default to 1. |  
| header | ?HashMap\<String,String> | No | None | **Named parameter.** HTTP request header fields. Default is {'content-Type': 'application/json'}. |  
| readTimeout | UInt32 | No | 60000 | **Named parameter.** Read timeout in milliseconds (ms), default is 60000ms.  
Set to 0 for no timeout. |  
| connectTimeout | UInt32 | No | 60000 | **Named parameter.** Connection timeout in milliseconds (ms), default is 60000ms. |  
| usingProtocol | ?[HttpProtocol](#enum-httpprotocol) | No | None | **Named parameter.** Protocol to use. Default is system-specified. |  
| usingProxy | [UsingProxy](#enum-usingproxy) | No | USE_DEFAULT | **Named parameter.** Whether to use HTTP proxy, default is USE_DEFAULT.  
- When usingProxy is NOT_USE, no network proxy is used.  
- When usingProxy is USE_SPECIFIED, the specified network proxy is used. |  
| caPath | ?String | No | None | **Named parameter.** If set, the system uses the CA certificate at the specified path (developers must ensure accessibility). Otherwise, the system preset CA certificate at /etc/ssl/certs/cacert.pem is used. The path is sandbox-mapped (accessible via Global.getContext().filesDir). Currently, only .pem text-format certificates are supported. |  
| resumeFrom | ?Int64 | No | None | **Named parameter.** Sets the start position for upload/download. HTTP standard (RFC 7233 Section 3.1) allows servers to ignore range requests.  
Using this with HTTP PUT may cause issues.  
Range: 1~4294967296 (4GB). Out-of-range values are ignored. No default. |  
| resumeTo | ?Int64 | No | None | **Named parameter.** Sets the end position for upload/download. HTTP standard (RFC 7233 Section 3.1) allows servers to ignore range requests.  
Using this with HTTP PUT may cause issues.  
Range: 1~4294967296 (4GB). Out-of-range values are ignored. No default. |  
| clientCert | ?[ClientCert](#class-clientcert) | No | None | **Named parameter.** Supports transmitting client certificates. |  
| dnsOverHttps | ?String | No | None | **Named parameter.** Sets a DNS-over-HTTPS server for DNS resolution.  
Parameter must be URL-encoded in the format: "https://host:port/path". |  
| dnsServers | ?Array\<String> | No | None | **Named parameter.** Sets specified DNS servers for resolution.  
Up to 3 servers can be set; excess servers are truncated.  
Servers must be IPv4 or IPv6 addresses. |  
| maxLimit | UInt32 | No | 5 * 1024 * 1024 | **Named parameter.** Maximum byte limit for response messages, default is 5MB in bytes. Maximum is 10MB in bytes. |  
| multiFormDataList | ?Array\<[MultiFormData](#class-multiformdata)> | No | None | **Named parameter.** When 'content-Type' is 'multipart/form-data', this field defines the list of data fields to upload. |  

## class HttpResponse  

```cangjie  
public class HttpResponse <: ToString {}  
```  

**Function:** Return type for the callback function of the request method.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Parent Type:**  

- ToString  

### let cookies  

```cangjie  
public let cookies: String  
```  

**Function:** Cookies returned by the server.  

**Type:** String  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let header  

```cangjie  
public let header: HashMap<String, String>  
```  

**Function:** Response headers returned by the HTTP request.  

**Type:** HashMap\<String,String>  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let performanceTiming  

```cangjie  
public let performanceTiming: PerformanceTiming  
```  

**Function:** Time consumption for each phase of the HTTP request.  

**Type:** [PerformanceTiming](#class-performancetiming)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let responseCode  

```cangjie  
public let responseCode: ResponseCode  
```  

**Function:** Response status code.  

**Type:** [ResponseCode](#enum-responsecode)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let result  

```cangjie  
public let result: HttpData  
```  

**Function:** HTTP request returns content in the format specified by the 'content-type' header.  

**Type:** [HttpData](#enum-httpdata)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### let resultType  

```cangjie  
public let resultType: HttpDataType  
```  

**Function:** Return value type.  

**Type:** [HttpDataType](#enum-httpdatatype)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Returns a string representation of [HttpResponse](#class-httpresponse).  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns a string representation of [HttpResponse](#class-httpresponse). |  

**Example:**  

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

**Function:** Stores HTTP request response objects. Before using HttpResponseCache methods, create a task via [createHttpResponseCache](#func-createhttpresponsecacheuint32).  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

### func delete()  

```cangjie  
public func delete(): Unit  
```  

**Function:** Disables the cache and deletes its data.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Function:** Writes cached data to the file system for access in subsequent HTTP requests.  

**System Capability:** SystemCapability.Communication.NetStack  

**Initial Version:** 21  

**Example:**  

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

**Function:** Type for multipart form data.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let contentType

```cangjie
public let contentType: String
```

**Function:** Data type, such as 'text/plain', 'image/png', 'image/jpeg', 'audio/mpeg', 'video/mp4', etc.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let data

```cangjie
public let data:?HttpData = None
```

**Function:** Form data content.

**Type:** ?[HttpData](#enum-httpdata)

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let filePath

```cangjie
public let filePath:?String = None
```

**Function:** This parameter sets the MIME part's body content based on the file content. Used as an alternative to `data` for setting file data as the content. If `data` is empty, `filePath` must be set. If `data` has a value, `filePath` will not take effect.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** Data name.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let remoteFileName

```cangjie
public let remoteFileName:?String = None
```

**Function:** The filename to be saved on the server after upload.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

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

**Function:** Constructs a MultiFormData instance.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Data name. |
| contentType | String | Yes | - | Data type, such as 'text/plain', 'image/png', 'image/jpeg', 'audio/mpeg', 'video/mp4', etc. |
| remoteFileName | ?String | No | None | **Named parameter.** The filename to be saved on the server after upload. |
| data | ?[HttpData](#enum-httpdata) | No | None | **Named parameter.** Form data content. |
| filePath | ?String | No | None | **Named parameter.** This parameter sets the MIME part's body content based on the file content. Used as an alternative to `data` for setting file data as the content. If `data` is empty, `filePath` must be set. If `data` has a value, `filePath` will not take effect. |

## class PerformanceTiming

```cangjie
public class PerformanceTiming <: ToString {}
```

**Function:** Performance timing data in milliseconds.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parent Type:**

- ToString

### let dnsTiming

```cangjie
public let dnsTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to DNS resolution completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let firstReceiveTiming

```cangjie
public let firstReceiveTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to receiving the first byte.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let firstSendTiming

```cangjie
public let firstSendTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to sending the first byte.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let redirectTiming

```cangjie
public let redirectTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to completing all redirect steps.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let responseBodyTiming

```cangjie
public let responseBodyTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to body parsing completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let responseHeaderTiming

```cangjie
public let responseHeaderTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to header parsing completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let tcpTiming

```cangjie
public let tcpTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to TCP connection completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let tlsTiming

```cangjie
public let tlsTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to TLS connection completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let totalFinishTiming

```cangjie
public let totalFinishTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) to request completion.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### let totalTiming

```cangjie
public let totalTiming: Float64
```

**Function:** Time elapsed from [request](#func-requeststring-businessexceptionhttpresponse---unit-httprequestoptions) callback to application.

**Type:** Float64

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21
**Type:** Float64  

**Read-Write Permission:** Read-only  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Description:** Returns a string representation of [PerformanceTiming](#class-performancetiming).  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

**Return Value:**  

| Type   | Description |  
|:------|:-----------|  
| String | Returns a string representation of [PerformanceTiming](#class-performancetiming). |  

**Example:**  

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

**Description:** Certificate type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### DER  

```cangjie  
DER  
```  

**Description:** DER certificate type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### P12  

```cangjie  
P12  
```  

**Description:** P12 certificate type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### PEM  

```cangjie  
PEM  
```  

**Description:** PEM certificate type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

## enum HttpData  

```cangjie  
public enum HttpData <: ToString {  
    | STRING_DATA(String)  
    | ARRAY_DATA(Array<Byte>)  
    | ...  
}  
```  

**Description:** HTTP data.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

**Parent Type:**  

- ToString  

### ARRAY_DATA(Array\<Byte>)  

```cangjie  
ARRAY_DATA(Array<Byte>)  
```  

**Description:** Binary array.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### STRING_DATA(String)  

```cangjie  
STRING_DATA(String)  
```  

**Description:** String.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Description:** Returns a string representation of [HttpData](#enum-httpdata).  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

**Return Value:**  

| Type   | Description |  
|:------|:-----------|  
| String | Returns a string representation of [HttpData](#enum-httpdata). |  

**Example:**  

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

**Description:** HTTP data type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### ARRAY_BUFFER  

```cangjie  
ARRAY_BUFFER  
```  

**Description:** Binary array type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### STRING  

```cangjie  
STRING  
```  

**Description:** String type.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

## enum HttpProtocol  

```cangjie  
public enum HttpProtocol {  
    | HTTP1_1  
    | HTTP2  
    | HTTP3  
    | ...  
}  
```  

**Description:** HTTP protocol version.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### HTTP1_1  

```cangjie  
HTTP1_1  
```  

**Description:** HTTP/1.1 protocol.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### HTTP2  

```cangjie  
HTTP2  
```  

**Description:** HTTP/2 protocol.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### HTTP3  

```cangjie  
HTTP3  
```  

**Description:** HTTP/3 protocol. If the system or server does not support it, a lower version of HTTP protocol will be used for the request. Only effective for HTTPS URLs; HTTP requests will fail.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

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

**Description:** HTTP request methods.  

**System Capability:** SystemCapability.Communication.NetStack  

**Since Version:** 21  

### CONNECT  

```cangjie  
CONNECT  
```
**Function:** HTTP request CONNECT.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### DELETE

```cangjie
DELETE
```

**Function:** HTTP request DELETE.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### GET

```cangjie
GET
```

**Function:** HTTP request GET.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### HEAD

```cangjie
HEAD
```

**Function:** HTTP request HEAD.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### OPTIONS

```cangjie
OPTIONS
```

**Function:** HTTP request OPTIONS.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### POST

```cangjie
POST
```

**Function:** HTTP request POST.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### PUT

```cangjie
PUT
```

**Function:** HTTP request PUT.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### TRACE

```cangjie
TRACE
```

**Function:** HTTP request TRACE.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### func getValue()

```cangjie
public func getValue(): String
```

**Function:** Get the string corresponding to the RequestMethod enumeration.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the string corresponding to the RequestMethod enumeration.|

**Example:**

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

**Function:** Response codes returned from requests.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### ACCEPTED

```cangjie
ACCEPTED
```

**Function:** The request has been accepted but has not yet been processed.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### BAD_GATEWAY

```cangjie
BAD_GATEWAY
```

**Function:** The server, acting as a gateway or proxy, received an invalid request from the remote server.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### BAD_METHOD

```cangjie
BAD_METHOD
```

**Function:** The method specified in the client's request is forbidden.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### BAD_REQUEST

```cangjie
BAD_REQUEST
```

**Function:** The server could not understand the request due to invalid syntax.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### CLIENT_TIMEOUT

```cangjie
CLIENT_TIMEOUT
```

**Function:** The request took too long and timed out.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### CONFLICT

```cangjie
CONFLICT
```

**Function:** This code may be returned when the server completes a client's PUT request, indicating a conflict occurred while processing the request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### CREATED

```cangjie
CREATED
```

**Function:** The request was successful and a new resource was created.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### ENTITY_TOO_LARGE

```cangjie
ENTITY_TOO_LARGE
```

**Function:** The server rejected the request because the request entity is too large for the server to process.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### EXPECTATION_FAILED

```cangjie
EXPECTATION_FAILED
```

**Function:** This response code indicates that the server cannot meet the expectations indicated by the Expect request header field.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### FAILED_DEPENDENCY

```cangjie
PRECON_FAILED
```

**Function:** The request failed due to a failed prerequisite request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### FORBIDDEN

```cangjie
FORBIDDEN
```

**Function:** The server understood the client's request but refused to fulfill it.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### GATEWAY_TIMEOUT

```cangjie
GATEWAY_TIMEOUT
```

**Function:** The server, acting as a gateway or proxy, did not receive a timely response from the upstream server.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### GONE

```cangjie
GONE
```

**Function:** The requested resource is no longer available.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### INSUFFICIENT_STORAGE

```cangjie
INSUFFICIENT_STORAGE
```

**Function:** The server cannot perform the requested method due to insufficient storage to complete the operation.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### INTERNAL_ERROR

```cangjie
INTERNAL_ERROR
```

**Function:** The server encountered an internal error and could not complete the request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### LENGTH_REQUIRED

```cangjie
LENGTH_REQUIRED
```

**Function:** The server cannot process the request without a valid Content-Length header.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### LOCKED

```cangjie
LOCKED
```

**Function:** The requested resource is currently locked.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### LOOP_DETECTED

```cangjie
LOOP_DETECTED
```

**Function:** The server detected an infinite loop while processing the request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### MISDIRECTED_REQUEST

```cangjie
MISDIRECTED_REQUEST
```

**Function:** The request was directed to a server that is not configured to produce a response for the combination of scheme and authority included in the request URI.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### MOVED_PERM

```cangjie
MOVED_PERM
```

**Function:** The requested resource has been permanently moved to a new URI, which is included in the response.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### MOVED_TEMP

```cangjie
MOVED_TEMP
```

**Function:** Temporary redirect.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### MULT_CHOICE

```cangjie
MULT_CHOICE
```

**Function:** Multiple choices available.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NETWORK_AUTHENTICATION_REQUIRED

```cangjie
NETWORK_AUTHENTICATION_REQUIRED
```

**Function:** Indicates that the client needs to authenticate to gain network access.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_ACCEPTABLE

```cangjie
NOT_ACCEPTABLE
```

**Function:** The server cannot produce a response matching the client's content negotiation preferences.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_AUTHORITATIVE

```cangjie
NOT_AUTHORITATIVE
```

**Function:** Non-authoritative information. The request was successful.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_EXTENDED

```cangjie
NOT_EXTENDED
```

**Function:** The server requires further extensions to fulfill the request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_FOUND

```cangjie
NOT_FOUND
```

**Function:** The server cannot find the requested resource.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_IMPLEMENTED

```cangjie
NOT_IMPLEMENTED
```

**Function:** The server does not support the functionality required to fulfill the request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NOT_MODIFIED

```cangjie
NOT_MODIFIED
```

**Function:** The resource has not been modified.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### NO_CONTENT

```cangjie
NO_CONTENT
```

**Function:** The server successfully processed the request but is not returning any content.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### OK

```cangjie
OK
```

**Function:** The request has succeeded. Typically used for GET and POST requests.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### PARTIAL

```cangjie
PARTIAL
```

**Function:** The server has successfully fulfilled a partial GET request.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### PAYMENT_REQUIRED

```cangjie
PAYMENT_REQUIRED
```

**Function:** Reserved for future use.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### PRECONDITION_REQUIRED

```cangjie
PRECONDITION_REQUIRED
```

**Function:** The origin server requires the request to be conditional. This response is intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it, and PUTs it back to the server, leading to conflicts when a third party modifies the state on the server.

**System Capability:** SystemCapability.Communication.NetStack

**Initial Version:** 21

### PRECON_FAILED

```cangjie
PRECON_FAILED
```

**Function:** Precondition failed for client request information.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### PROXY_AUTH

```cangjie
PROXY_AUTH
```

**Function:** Proxy authentication required for the request.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### REQUESTED_RANGE_NOT_SATISFIABLE

```cangjie
REQUESTED_RANGE_NOT_SATISFIABLE
```

**Function:** The range specified in the request's Range header field cannot be fulfilled. The range may be outside the size of the target URI data.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### REQUEST_HEADER_FIELDS_TOO_LARGE

```cangjie
REQUEST_HEADER_FIELDS_TOO_LARGE
```

**Function:** The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### REQ_TOO_LONG

```cangjie
REQ_TOO_LONG
```

**Function:** The request URI is too long (URI is typically a URL), and the server cannot process it.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### RESET

```cangjie
RESET
```

**Function:** Reset content.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### SEE_OTHER

```cangjie
SEE_OTHER
```

**Function:** See other address.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### TEAPOT

```cangjie
TEAPOT
```

**Function:** The server refuses to brew coffee with a teapot.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### TOO_EARLY

```cangjie
TOO_EARLY
```

**Function:** Indicates that the server is unwilling to risk processing a request that might be replayed.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### TOO_MANY_REQUESTS

```cangjie
TOO_MANY_REQUESTS
```

**Function:** Indicates that the user has sent too many requests in a given time frame, and request rate limiting should be applied.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UNAUTHORIZED

```cangjie
UNAUTHORIZED
```

**Function:** Authentication is required for the request.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UNAVAILABLE

```cangjie
UNAVAILABLE
```

**Function:** The server is temporarily unable to process the client's request due to overload or system maintenance.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UNAVAILABLE_FOR_LEGAL_REASONS

```cangjie
UNAVAILABLE_FOR_LEGAL_REASONS
```

**Function:** The user agent requested a resource that cannot be legally provided, such as a government-censored webpage.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UNPROCESSABLE_ENTITY

```cangjie
UNPROCESSABLE_ENTITY
```

**Function:** The request was well-formed but could not be followed due to semantic errors.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UNSUPPORTED_TYPE

```cangjie
UNSUPPORTED_TYPE
```

**Function:** The server cannot process the requested format.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### UPGRADE_REQUIRED

```cangjie
UPGRADE_REQUIRED
```

**Function:** The server refuses to perform the request using the current protocol but may be willing to do so after the client upgrades to a different protocol. The server sends a 426 response with an Upgrade(en-US) field to indicate the required protocol.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### USE_PROXY

```cangjie
USE_PROXY
```

**Function:** Use proxy.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### VARIANT_ALSO_NEGOTIATES

```cangjie
VARIANT_ALSO_NEGOTIATES
```

**Function:** The server has an internal configuration error: the chosen variant resource is configured to engage in transparent content negotiation itself and is therefore not a proper endpoint in the negotiation process.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### VERSION

```cangjie
VERSION
```

**Function:** The HTTP protocol version requested by the server.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### static func parse(UInt32)

```cangjie
public static func parse(code: UInt32): ResponseCode
```

**Function:** Get the corresponding status code.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description            |
|:----------|:--------|:---------|:--------|:-----------------------|
| code      | UInt32  | Yes      | -       | The numerical status code. |

**Return Value:**

| Type                     | Description                  |
|:-------------------------|:-----------------------------|
| [ResponseCode](#enum-responsecode) | The returned response code. |

**Example:**

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

**Function:** Get the numerical value corresponding to the ResponseCode enumeration.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

**Return Value:**

| Type   | Description                              |
|:-------|:-----------------------------------------|
| UInt32 | The numerical value corresponding to the ResponseCode enumeration. |

**Example:**

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
```
    | ...
}
```

**Function:** Type of proxy to use.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### NOT_USE

```cangjie
NOT_USE
```

**Function:** Do not use a proxy.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### USE_DEFAULT

```cangjie
USE_DEFAULT
```

**Function:** Use the default proxy.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

### USE_SPECIFIED(HttpProxy)

```cangjie
USE_SPECIFIED(HttpProxy)
```

**Function:** Use a specified proxy type.

**System Capability:** SystemCapability.Communication.NetStack

**Since:** 21

## Complete Example

```cangjie
import kit.NetworkKit.*
import ohos.base.*
import std.collection.*

// Each httpRequest corresponds to an HTTP request task and cannot be reused
let httpRequest = createHttp()
// Used to subscribe to HTTP response headers. This callback returns before the request is sent. Subscribe as needed.
httpRequest.onHeadersReceive({header: HashMap<String, String> =>
    AppLog.info("header: ${header}")
})

let option = HttpRequestOptions(
    method: RequestMethod.POST, // Optional, defaults to http.RequestMethod.GET
    // For POST requests, this field carries the data to send
    extraData: HttpData.STRING_DATA("data to send"),
    expectDataType: HttpDataType.STRING, // Optional, specifies the response data type
    usingCache: true, // Optional, defaults to true
    priority: 1, // Optional, defaults to 1
    // Add custom header fields as needed
    header: HashMap<String, String>([("content-type", "application/json")]),
    readTimeout: 60000, // Optional, defaults to 60000ms
    connectTimeout: 60000, // Optional, defaults to 60000ms
    usingProtocol: HttpProtocol.HTTP1_1, // Optional, protocol type defaults to system auto-selection
    usingProxy: UsingProxy.USE_DEFAULT, // Optional, defaults to no proxy (supported since API 10)
    caPath: "/path/to/cacert.pem", // Optional, defaults to system CA certificates (supported since API 10)
    clientCert: ClientCert(
        "/path/to/client.pem", // Optional, no client certificate by default
        "/path/to/client.key", // If the certificate includes Key info, pass an empty string
        certType: CertType.PEM, // Optional, defaults to PEM
        keyPassword: "passwordToKey" // Optional, password for the key file
    ),
    multiFormDataList: [ // Optional, only effective when 'content-Type' in Header is 'multipart/form-data'
        MultiFormData (
            "Part1", // Data name
            "text/plain", // Data type
            data: STRING_DATA("Example data"), // Optional, data content
            remoteFileName: "example.txt" // Optional
        ),
        MultiFormData (
            "Part2", // Data name
            "text/plain", // Data type
            filePath: "/data/app/el2/100/base/com.example.myapplication/haps/entry/files/fileName.txt", // Optional, file path
            remoteFileName: "fileName.txt" // Optional
        )
    ]
)

httpRequest.request( // Enter the HTTP request URL (with or without parameters). URL must be customized. Request parameters can be specified in extraData.
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