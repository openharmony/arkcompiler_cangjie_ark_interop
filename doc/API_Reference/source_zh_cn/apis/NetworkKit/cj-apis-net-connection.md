# ohos.net.connection（网络连接管理）

网络连接管理提供管理网络一些基础能力，包括获取默认激活的数据网络、获取所有激活数据网络列表、开启关闭飞行模式、获取网络能力信息等功能。

本节错误码的详细介绍请参见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)。

## 导入模块

```cangjie
import kit.NetworkKit.*
```

## 权限列表

ohos.permission.GET_NETWORK_INFO

ohos.permission.INTERNET

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createNetConnection(?NetSpecifier, UInt32)

```cangjie
public func createNetConnection(netSpecifier!: ?NetSpecifier = None, timeout!: UInt32 = 0): NetConnection
```

**功能：** 创建一个NetConnection对象，netSpecifier指定关注的网络的各项特征；timeout是超时时间(单位是毫秒)；netSpecifier是timeout的必要条件，两者都没有则表示关注默认网络。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netSpecifier|?[NetSpecifier](#class-netspecifier)|否|None|**命名参数。** 指定网络的各项特征，为None时关注默认网络。|
|timeout|UInt32|否|0|**命名参数。** 获取netSpecifier指定的网络时的超时时间，仅netSpecifier存在时生效，默认值为0。|

**返回值：**

|类型|说明|
|:----|:----|
|[NetConnection](#class-netconnection)|所关注的网络的句柄。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

// 关注默认网络, 不需要传参
let netConnection = createNetConnection()

// 关注蜂窝网络，需要传入相关网络特征，timeout参数未传入说明未使用超时时间，此时timeout为0
let netspecifier = NetSpecifier(NetCapabilities([NetBearType.BEARER_CELLULAR]))
let netConnectionCellular = createNetConnection(netSpecifier: netspecifier)
```

## func getAddressesByName(String)

```cangjie
public func getAddressesByName(host: String): Array<NetAddress>
```

**功能：** 使用对应网络解析主机名以获取所有IP地址。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|host|String|是|-|需要解析的主机名。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[NetAddress](#class-netaddress)>|返回所有IP地址。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let addresses = getAddressesByName("localhost")
```

## func getAllNets()

```cangjie
public func getAllNets(): Array<NetHandle>
```

**功能：** 获取所有处于连接状态的网络列表。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[NetHandle](#class-nethandle)>|返回激活的数据网络列表。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let netHandles = getAllNets()
```

## func getAppNet()

```cangjie
public func getAppNet(): NetHandle
```

**功能：** 绑定App到指定网络，绑定后的App只能通过指定网络访问外网。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[NetHandle](#class-nethandle)|返回APP绑定的数据网络。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let netHandle = getAppNet()
```

## func getConnectionProperties(NetHandle)

```cangjie
public func getConnectionProperties(netHandle: NetHandle): ConnectionProperties
```

**功能：** 获取netHandle对应的网络的连接信息。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络的句柄。|

**返回值：**

|类型|说明|
|:----|:----|
|[ConnectionProperties](#class-connectionproperties)|返回网络的连接信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

try {
    let netHandle = getDefaultNet()
    let connectionProperties = getConnectionProperties(netHandle)
} catch (e: BusinessException) {
    Hilog.info(0, "test", "getConnectionProperties failed: ${e.code} ${e.message}")
}
```

## func getDefaultHttpProxy()

```cangjie
public func getDefaultHttpProxy(): HttpProxy
```

**功能：** 获取网络默认的代理配置信息。 如果设置了全局代理，则会返回全局代理配置信息。如果进程使用setAppNet绑定到指定NetHandle对应的网络，则返回NetHandle对应网络的代理配置信息。在其它情况下，将返回默认网络的代理配置信息。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[HttpProxy](#class-httpproxy)|返回网络默认的代理配置信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error.@syscap SystemCapability.Communication.NetManager.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

try {
    let proxy = getDefaultHttpProxy()
    Hilog.info(0, "test", "proxy: ${proxy.host ?? ""} ${proxy.port ?? 0}")
} catch (e: BusinessException) {
    Hilog.info(0, "test", "getDefaultHttpProxy failed: ${e.code} ${e.message}")
}
```

## func getDefaultNet()

```cangjie
public func getDefaultNet(): NetHandle
```

**功能：** 获取默认激活的数据网络。可以使用getNetCapabilities去获取网络的类型、拥有的能力等信息。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[NetHandle](#class-nethandle)|返回默认激活的数据网络。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

try {
    let netHandle = getDefaultNet()
} catch(_) {}
```

## func getNetCapabilities(NetHandle)

```cangjie
public func getNetCapabilities(netHandle: NetHandle): NetCapabilities
```

**功能：** 获取netHandle对应的网络的能力信息。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络的句柄。|

**返回值：**

|类型|说明|
|:----|:----|
|[NetCapabilities](#class-netcapabilities)|返回网络的能力信息。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

try {
    let netHandle = getDefaultNet()
    let netCapabilities = getNetCapabilities(netHandle)
} catch (e: BusinessException) {
    Hilog.info(0, "test", "getNetCapabilities failed: ${e.code} ${e.message}")
}
```

## func hasDefaultNet()

```cangjie
public func hasDefaultNet(): Bool
```

**功能：** 检查默认数据网络是否被激活，返回接口，如果被激活则返回true。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|默认数据网络被激活返回true。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let hasDefault = hasDefaultNet()
```

## func isDefaultNetMetered()

```cangjie
public func isDefaultNetMetered(): Bool
```

**功能：** 检查当前网络上的数据流量使用是否被计量。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|当前网络上的数据流量使用被计量，则返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let isMetered = isDefaultNetMetered()
```

## func reportNetConnected(NetHandle)

```cangjie
public func reportNetConnected(netHandle: NetHandle): Unit
```

**功能：** 向网络管理报告网络处于可用状态。

**需要权限：** ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络的句柄，参考[NetHandle](#class-nethandle)。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let handle = getDefaultNet()
reportNetConnected(handle)
```

## func reportNetDisconnected(NetHandle)

```cangjie
public func reportNetDisconnected(netHandle: NetHandle): Unit
```

**功能：** 向网络管理报告网络处于不可用状态。

**需要权限：** ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络的句柄，参考[NetHandle](#class-nethandle)。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let handle = getDefaultNet()
reportNetDisconnected(handle)
```

## func setAppNet(NetHandle)

```cangjie
public func setAppNet(netHandle: NetHandle): Unit
```

**功能：** 绑定App到指定网络，绑定后的App只能通过指定网络访问外网。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络的句柄。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

try {
    let netHandle = getDefaultNet()
    setAppNet(netHandle)
} catch (e: BusinessException) {
    Hilog.info(0, "test", "setAppNet failed: ${e.code} ${e.message}")
}
```

## class ConnectionProperties

```cangjie
public class ConnectionProperties {
    public ConnectionProperties(
        public let interfaceName: String,
        public let domains: String,
        public let linkAddresses: Array<LinkAddress>,
        public let dnses: Array<NetAddress>,
        public let routes: Array<RouteInfo>,
        public let mtu: UInt16
    )
}
```

**功能：** 网络连接信息类。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let dnses

```cangjie
public let dnses: Array<NetAddress>
```

**功能：** 网络地址，参考[NetAddress](#class-netaddress)。

**类型：** Array\<[NetAddress](#class-netaddress)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let domains

```cangjie
public let domains: String
```

**功能：** 所属域，默认""。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let interfaceName

```cangjie
public let interfaceName: String
```

**功能：** 网卡名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let linkAddresses

```cangjie
public let linkAddresses: Array<LinkAddress>
```

**功能：** 链路信息。

**类型：** Array\<[LinkAddress](#class-linkaddress)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let mtu

```cangjie
public let mtu: UInt16
```

**功能：** 最大传输单元。

**类型：** UInt16

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let routes

```cangjie
public let routes: Array<RouteInfo>
```

**功能：** 路由信息。

**类型：** Array\<[RouteInfo](#class-routeinfo)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### ConnectionProperties(String, String, Array\<LinkAddress>, Array\<NetAddress>, Array\<RouteInfo>, UInt16)

```cangjie
public ConnectionProperties(
    public let interfaceName: String,
    public let domains: String,
    public let linkAddresses: Array<LinkAddress>,
    public let dnses: Array<NetAddress>,
    public let routes: Array<RouteInfo>,
    public let mtu: UInt16
)
```

**功能：** 构造ConnectionProperties实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|interfaceName|String|是|-|网卡名称。|
|domains|String|是|-|所属域，默认""。|
|linkAddresses|Array\<[LinkAddress](#class-linkaddress)>|是|-|链路信息。|
|dnses|Array\<[NetAddress](#class-netaddress)>|是|-|网络地址，参考NetAddress。|
|routes|Array\<[RouteInfo](#class-routeinfo)>|是|-|路由信息。|
|mtu|UInt16|是|-|最大传输单元。|

## class HttpProxy

```cangjie
public class HttpProxy {
    public HttpProxy(
        public let host!: ?String = None,
        public let port!: ?UInt16 = None,
        public let exclusionList!: ?Array<String> = None
    )
}
```

**功能：** 网络代理配置信息。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let exclusionList

```cangjie
public let exclusionList:?Array<String>= None
```

**功能：** 不使用代理的主机名列表，主机名支持域名、IP地址以及通配符形式，详细匹配规则如下：

1. 域名匹配规则：

    （1）完全匹配：代理服务器主机名只要与列表中的任意一个主机名完全相同，就可以匹配。

    （2）包含匹配：代理服务器主机名只要包含列表中的任意一个主机名，就可以匹配。

    例如，如果在主机名列表中设置了“ample.com”，则“ample.com”、“www.ample.com”、“ample.com:80”都会被匹配，而“www.example.com”、“ample.com.org”则不会被匹配。

2. IP地址匹配规则：代理服务器主机名只要与列表中的任意一个IP地址完全相同，就可以匹配。

3. 域名跟IP地址可以同时添加到列表中进行匹配。

4. 单个“*”是唯一有效的通配符，当列表中只有通配符时，将与所有代理服务器主机名匹配，表示禁用代理。通配符只能单独添加，不可以与其他域名、IP地址一起添加到列表中，否则通配符将不生效。

5. 匹配规则不区分主机名大小写。

6. 匹配主机名时，不考虑http和https等协议前缀。

**类型：** ?Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let host

```cangjie
public let host:?String = None
```

**功能：** 代理服务器主机名。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let port

```cangjie
public let port:?UInt16 = None
```

**功能：** 主机端口。

**类型：** ?UInt16

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### HttpProxy(?String, ?UInt16, ?Array\<String>)

```cangjie
public HttpProxy(
    public let host!: ?String = None,
    public let port!: ?UInt16 = None,
    public let exclusionList!: ?Array<String> = None
)
```

**功能：** 构造HttpProxy实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|host|?String|否|None|**命名参数。** 代理服务器主机名。|
|port|?UInt16|否|None|**命名参数。** 主机端口。|
|exclusionList|?Array\<String>|否|None|**命名参数。** 不使用代理的主机名列表，主机名支持域名、IP地址以及通配符形式，详细匹配规则如下：<br>1、域名匹配规则：<br>（1）完全匹配：代理服务器主机名只要与列表中的任意一个主机名完全相同，就可以匹配。<br>（2）包含匹配：代理服务器主机名只要包含列表中的任意一个主机名，就可以匹配。<br>例如，如果在主机名列表中设置了 “ample.com”，则 “ample.com”、“www.ample.com”、“ample.com:80”都会被匹配，而 “www.example.com”、“ample.com.org”则不会被匹配。<br>2、IP地址匹配规则：代理服务器主机名只要与列表中的任意一个IP地址完全相同，就可以匹配。<br>3、域名跟IP地址可以同时添加到列表中进行匹配。<br>4、单个“*”是唯一有效的通配符，当列表中只有通配符时，将与所有代理服务器主机名匹配，表示禁用代理。通配符只能单独添加，不可以与其他域名、IP地址一起添加到列表中，否则通配符将不生效。<br>5、匹配规则不区分主机名大小写。<br>6、匹配主机名时，不考虑http和https等协议前缀。|

## class LinkAddress

```cangjie
public class LinkAddress {
    public LinkAddress(
        public let address: NetAddress,
        public let prefixLength: Int32
    )
}
```

**功能：** 网络链路信息。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let address

```cangjie
public let address: NetAddress
```

**功能：** 链路地址。

**类型：** [NetAddress](#class-netaddress)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let prefixLength

```cangjie
public let prefixLength: Int32
```

**功能：** 链路地址前缀的长度。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### LinkAddress(NetAddress, Int32)

```cangjie
public LinkAddress(
    public let address: NetAddress,
    public let prefixLength: Int32
)
```

**功能：** 构造LinkAddress实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|address|[NetAddress](#class-netaddress)|是|-|链路地址。|
|prefixLength|Int32|是|-|链路地址前缀的长度。|

## class NetAddress

```cangjie
public class NetAddress {
    public NetAddress(
        public let address: String,
        public let family: ?UInt32,
        public let port: ?UInt16
    )
}
```

**功能：** 网络地址。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let address

```cangjie
public let address: String
```

**功能：** 地址。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let family

```cangjie
public let family:?UInt32
```

**功能：** IPv4 = 1，IPv6 = 2，默认IPv4。

**类型：** ?UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let port

```cangjie
public let port:?UInt16
```

**功能：** 端口，取值范围[0, 65535]。

**类型：** ?UInt16

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NetAddress(String, ?UInt32, ?UInt16)

```cangjie
public NetAddress(
    public let address: String,
    public let family: ?UInt32,
    public let port: ?UInt16
)
```

**功能：** 构造NetAddress实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|address|String|是|-|地址。|
|family|?UInt32|是|-|IPv4 = 1，IPv6 = 2，默认IPv4。|
|port|?UInt16|是|-|端口，取值范围[0, 65535]。|

## class NetCapabilities

```cangjie
public class NetCapabilities {
    public NetCapabilities(
        public let bearerTypes: Array<NetBearType>,
        public let linkUpBandwidthKbps!: ?UInt32 = None,
        public let linkDownBandwidthKbps!: ?UInt32 = None,
        public let networkCap!: ?Array<NetCap> = None
    )
}
```

**功能：** 网络的能力集。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let bearerTypes

```cangjie
public let bearerTypes: Array<NetBearType>
```

**功能：** 网络类型。

**类型：** Array\<[NetBearType](#enum-netbeartype)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let linkDownBandwidthKbps

```cangjie
public let linkDownBandwidthKbps:?UInt32 = None
```

**功能：** 下行（网络到设备）带宽，0表示无法评估当前网络带宽。

**类型：** ?UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let linkUpBandwidthKbps

```cangjie
public let linkUpBandwidthKbps:?UInt32 = None
```

**功能：** 上行（设备到网络）带宽，0表示无法评估当前网络带宽。

**类型：** ?UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let networkCap

```cangjie
public let networkCap:?Array<NetCap>= None
```

**功能：** 网络具体能力。

**类型：** ?Array\<[NetCap](#enum-netcap)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NetCapabilities(Array\<NetBearType>, ?UInt32, ?UInt32, ?Array\<NetCap>)

```cangjie
public NetCapabilities(
    public let bearerTypes: Array<NetBearType>,
    public let linkUpBandwidthKbps!: ?UInt32 = None,
    public let linkDownBandwidthKbps!: ?UInt32 = None,
    public let networkCap!: ?Array<NetCap> = None
)
```

**功能：** 构造NetCapabilities实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bearerTypes|Array\<[NetBearType](#enum-netbeartype)>|是|-|网络类型。|
|linkUpBandwidthKbps|?UInt32|否|None|**命名参数。** 上行（设备到网络）带宽，0表示无法评估当前网络带宽。|
|linkDownBandwidthKbps|?UInt32|否|None|**命名参数。** 下行（网络到设备）带宽，0表示无法评估当前网络带宽。|
|networkCap|?Array\<[NetCap](#enum-netcap)>|否|None|**命名参数。** 网络具体能力。|

## class NetCapabilityInfo

```cangjie
public class NetCapabilityInfo {
    public NetCapabilityInfo(
        public let netHandle: NetHandle,
        public let netCap!: ?NetCapabilities = None
    )
}
```

**功能：** 提供承载数据网络能力的实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let netCap

```cangjie
public let netCap:?NetCapabilities = None
```

**功能：** 存储数据网络的传输能力和承载类型。

**类型：** ?[NetCapabilities](#class-netcapabilities)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let netHandle

```cangjie
public let netHandle: NetHandle
```

**功能：** 数据网络句柄。

**类型：** [NetHandle](#class-nethandle)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NetCapabilityInfo(NetHandle, ?NetCapabilities)

```cangjie
public NetCapabilityInfo(
    public let netHandle: NetHandle,
    public let netCap!: ?NetCapabilities = None
)
```

**功能：** 构造NetCapabilityInfo实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netHandle|[NetHandle](#class-nethandle)|是|-|数据网络句柄。|
|netCap|?[NetCapabilities](#class-netcapabilities)|否|None|**命名参数。** 存储数据网络的传输能力和承载类型。|

## class NetConnection

```cangjie
public class NetConnection {}
```

**功能：** 网络连接的句柄；设备从无网络到有网络会触发netAvailable事件、netCapabilitiesChange事件和netConnectionPropertiesChange事件； 设备从有网络到无网络状态会触发netLost事件； 设备从WiFi到蜂窝会触发netLost事件（WiFi丢失）之后触发 netAvaliable事件（蜂窝可用）。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### func onNetAvailable((NetHandle) -> Unit)

```cangjie
public func onNetAvailable(callback: (NetHandle) -> Unit): Unit
```

**功能：** 订阅网络可用事件。

**模型约束：** 此接口调用之前需要先调用register接口，使用unregister取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([NetHandle](#class-nethandle))->Unit|是|-|回调函数，返回数据网络句柄。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// 创建NetConnection对象
let netCon: NetConnection = createNetConnection()

// 先使用register接口注册订阅事件
netCon.register()

// 订阅网络可用事件。调用register后，才能接收到此事件通知
netCon.onNetAvailable({ netHandle =>
    Hilog.info(0, "test", "${netHandle.netId}")
})

// 使用unregister接口取消订阅
netCon.unregister()
```

### func onNetBlockStatusChange((NetHandle,Bool) -> Unit)

```cangjie
public func onNetBlockStatusChange(callback: (NetHandle, Bool) -> Unit): Unit
```

**功能：** 订阅网络阻塞状态事件。

**模型约束：** 此接口调用之前需要先调用register接口，使用unregister取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([NetHandle](#class-nethandle),Bool)->Unit|是|-|回调函数，返回数据网络句柄（netHandle）,及网络堵塞状态（blocked）。|

### func onNetCapabilitiesChange((NetCapabilityInfo) -> Unit)

```cangjie
public func onNetCapabilitiesChange(callback: (NetCapabilityInfo) -> Unit): Unit
```

**功能：** 订阅网络能力变化事件。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([NetCapabilityInfo](#class-netcapabilityinfo))->Unit|是|-|回调函数，返回数据网络句柄（netHandle）和网络的能力信息（netCap）。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// 创建NetConnection对象
let netCon: NetConnection = createNetConnection()

// 先使用register接口注册订阅事件
netCon.register()

// 订阅网络能力变化事件。调用register后，才能接收到此事件通知
netCon.onNetCapabilitiesChange({ capabilities =>
    Hilog.info(0, "test", "capability changed")
})

// 使用unregister接口取消订阅
netCon.unregister()
```

### func onNetConnectionPropertiesChange((NetHandle,ConnectionProperties) -> Unit)

```cangjie
public func onNetConnectionPropertiesChange(callback: (NetHandle, ConnectionProperties) -> Unit): Unit
```

**功能：** 订阅网络连接信息变化事件。

**模型约束：** 此接口调用之前需要先调用register接口，使用unregister取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([NetHandle](#class-nethandle),[ConnectionProperties](#class-connectionproperties))->Unit|是|-|回调函数，返回数据网络句柄（netHandle）和网络的连接信息（connectionProperties）。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// 创建NetConnection对象
let netCon: NetConnection = createNetConnection()

// 先使用register接口注册订阅事件
netCon.register()

// 订阅网络连接信息变化事件。调用register后，才能接收到此事件通知
netCon.onNetConnectionPropertiesChange({ handle, properties =>
    Hilog.info(0, "test", "connection changed")
})

// 使用unregister接口取消订阅
netCon.unregister()
```

### func onNetLost((NetHandle) -> Unit)

```cangjie
public func onNetLost(callback: (NetHandle) -> Unit): Unit
```

**功能：** 订阅网络丢失事件。

**模型约束：** 此接口调用之前需要先调用register接口，使用unregister取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|([NetHandle](#class-nethandle))->Unit|是|-|回调函数，数据网络句柄（netHandle）。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// 创建NetConnection对象
let netCon: NetConnection = createNetConnection()

// 先使用register接口注册订阅事件
netCon.register()

// 订阅网络丢失事件。调用register后，才能接收到此事件通知
netCon.onNetLost({ handle =>
    Hilog.info(0, "test", "net of ${handle.netId} changed")
})

// 使用unregister接口取消订阅
netCon.unregister()
```

### func onNetUnavailable(() -> Unit)

```cangjie
public func onNetUnavailable(callback: () -> Unit): Unit
```

**功能：** 订阅网络不可用事件。

**模型约束：** 此接口调用之前需要先调用register接口，使用unregister取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|()->Unit|是|-|回调函数，无返回结果。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// 创建NetConnection对象
let netCon: NetConnection = createNetConnection()

// 先使用register接口注册订阅事件
netCon.register()

// 订阅网络不可用事件。调用register后，才能接收到此事件通知
netCon.onNetUnavailable({ =>
    Hilog.info(0, "test", "net unavailible")
})

// 使用unregister接口取消订阅
netCon.unregister()
```

### func register()

```cangjie
public func register(): Unit
```

**功能：** 订阅指定网络状态变化的通知。

**需要权限：** ohos.permission.GET_NETWORK_INFO

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Parameter error.|
  |2100002|Operation failed. Cannot connect to service.|
  |2100003|System internal error.|
  |2101008|The same callback exists.|
  |2101022|The number of requests exceeded the maximum.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let netCon: NetConnection = createNetConnection()
netCon.register()
```

### func unregister()

```cangjie
public func unregister(): Unit
```

**功能：** 取消订阅默认网络状态变化的通知。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Parameter error.|
  |2100002|Operation failed. Cannot connect to service.|
  |2100003|System internal error.|
  |2101007|The callback is not found.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let netCon: NetConnection = createNetConnection()
netCon.register()
netCon.unregister()
```

## class NetHandle

```cangjie
public class NetHandle <: ToString {
    public NetHandle(public let netId: Int32)
}
```

**功能：** 数据网络的句柄。在调用NetHandle的方法之前，需要先获取NetHandle对象。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**父类型：**

- ToString

### let netId

```cangjie
public let netId: Int32
```

**功能：** 网络ID，取值为0代表没有默认网络，其余取值必须大于等于100。

**类型：** Int32

**读写能力：** 只读

**起始版本：** 21

### NetHandle(Int32)

```cangjie
public NetHandle(public let netId: Int32)
```

**功能：** 构造NetHandle实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netId|Int32|是|-|网络ID，取值为0代表没有默认网络，其余取值必须大于等于100。|

### func getAddressByName(String)

```cangjie
public func getAddressByName(host: String): NetAddress
```

**功能：** 使用对应网络解析主机名以获取第一个IP地址。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|host|String|是|-|需要解析的主机名。|

**返回值：**

|类型|说明|
|:----|:----|
|[NetAddress](#class-netaddress)|返回第一个IP地址。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let handle = getDefaultNet()

let address = handle.getAddressByName("localhost")
```

### func getAddressesByName(String)

```cangjie
public func getAddressesByName(host: String): Array<NetAddress>
```

**功能：** 使用对应网络解析主机名以获取所有IP地址。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|host|String|是|-|需要解析的主机名。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[NetAddress](#class-netaddress)>|返回所有IP地址。|

**异常：**

- BusinessException：对应错误码如下表，详见[网络连接管理错误码](../../errorcodes/cj-errorcode-net-connection.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let handle = getDefaultNet()

let addresses = handle.getAddressesByName("localhost")
```

### func toString()

```cangjie
public func toString(): String
```

**功能：** 返回字符串形式的NetHandle。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回字符串形式的[NetHandle](#class-nethandle)。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

let handle = getDefaultNet()

AppLog.info(handle.toString())
```

## class NetSpecifier

```cangjie
public class NetSpecifier {
    public NetSpecifier(
        public let netCapabilities: NetCapabilities,
        public let bearerPrivateIdentifier!: ?String = None
    )
}
```

**功能：** 提供承载数据网络能力的实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let bearerPrivateIdentifier

```cangjie
public let bearerPrivateIdentifier:?String = None
```

**功能：** 网络标识符，Wi-Fi网络的标识符是"wifi"，蜂窝网络的标识符是"slot0"（对应SIM卡1）。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let netCapabilities

```cangjie
public let netCapabilities: NetCapabilities
```

**功能：** 存储数据网络的传输能力和承载类型。

**类型：** [NetCapabilities](#class-netcapabilities)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NetSpecifier(NetCapabilities, ?String)

```cangjie
public NetSpecifier(
    public let netCapabilities: NetCapabilities,
    public let bearerPrivateIdentifier!: ?String = None
)
```

**功能：** 构造NetSpecifier实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|netCapabilities|[NetCapabilities](#class-netcapabilities)|是|-|存储数据网络的传输能力和承载类型。|
|bearerPrivateIdentifier|?String|否|None|**命名参数。** 网络标识符，Wi-Fi网络的标识符是"wifi"，蜂窝网络的标识符是"slot0"（对应SIM卡1）。|

## class RouteInfo

```cangjie
public class RouteInfo {
    public RouteInfo(
        public let interfaceName: String,
        public let destination: LinkAddress,
        public let gateway: NetAddress,
        public let hasGateway: Bool,
        public let isDefaultRoute: Bool
    )
}
```

**功能：** 网络路由信息。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let destination

```cangjie
public let destination: LinkAddress
```

**功能：** 目的地址。

**类型：** [LinkAddress](#class-linkaddress)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let gateway

```cangjie
public let gateway: NetAddress
```

**功能：** 网关地址。

**类型：** [NetAddress](#class-netaddress)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let hasGateway

```cangjie
public let hasGateway: Bool
```

**功能：** 是否有网关。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let interfaceName

```cangjie
public let interfaceName: String
```

**功能：** 网卡名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### let isDefaultRoute

```cangjie
public let isDefaultRoute: Bool
```

**功能：** 是否为默认路由。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### RouteInfo(String, LinkAddress, NetAddress, Bool, Bool)

```cangjie
public RouteInfo(
    public let interfaceName: String,
    public let destination: LinkAddress,
    public let gateway: NetAddress,
    public let hasGateway: Bool,
    public let isDefaultRoute: Bool
)
```

**功能：** 构造RouteInfo实例。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|interfaceName|String|是|-|网卡名称。|
|destination|[LinkAddress](#class-linkaddress)|是|-|目的地址。|
|gateway|[NetAddress](#class-netaddress)|是|-|网关地址。|
|hasGateway|Bool|是|-|是否有网关。|
|isDefaultRoute|Bool|是|-|是否为默认路由。|

## enum NetBearType

```cangjie
public enum NetBearType {
    | BEARER_CELLULAR
    | BEARER_WIFI
    | BEARER_ETHERNET
}
```

**功能：** 网络类型。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### BEARER_CELLULAR

```cangjie
BEARER_CELLULAR
```

**功能：** 蜂窝网络。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### BEARER_ETHERNET

```cangjie
BEARER_ETHERNET
```

**功能：** 以太网网络。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### BEARER_WIFI

```cangjie
BEARER_WIFI
```

**功能：** Wi-Fi网络。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

## enum NetCap

```cangjie
public enum NetCap {
    | NET_CAPABILITY_MMS
    | NET_CAPABILITY_NOT_METERED
    | NET_CAPABILITY_INTERNET
    | NET_CAPABILITY_NOT_VPN
    | NET_CAPABILITY_VALIDATED
}
```

**功能：** 网络具体能力。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NET_CAPABILITY_INTERNET

```cangjie
NET_CAPABILITY_INTERNET
```

**功能：** 表示该网络应具有访问Internet的能力，该能力由网络提供者设置。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NET_CAPABILITY_MMS

```cangjie
NET_CAPABILITY_MMS
```

**功能：** 表示网络可以访问运营商的MMSC（Multimedia&nbsp;Message&nbsp;Service，多媒体短信服务）发送和接收彩信。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NET_CAPABILITY_NOT_METERED

```cangjie
NET_CAPABILITY_NOT_METERED
```

**功能：** 表示网络流量未被计费。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NET_CAPABILITY_NOT_VPN

```cangjie
NET_CAPABILITY_NOT_VPN
```

**功能：** 表示网络不使用VPN（Virtual&nbsp;Private&nbsp;Network，虚拟专用网络）。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21

### NET_CAPABILITY_VALIDATED

```cangjie
NET_CAPABILITY_VALIDATED
```

**功能：** 表示该网络访问Internet的能力被网络管理成功验证，该能力由网络管理模块设置。

**系统能力：** SystemCapability.Communication.NetManager.Core

**起始版本：** 21
