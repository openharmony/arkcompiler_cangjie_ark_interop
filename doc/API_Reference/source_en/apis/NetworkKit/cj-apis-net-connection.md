# ohos.net.connection (Network Connection Management)

Network connection management provides fundamental capabilities for managing networks, including obtaining the default active data network, retrieving a list of all active data networks, enabling/disabling airplane mode, obtaining network capability information, and more.

For detailed error code descriptions in this section, please refer to [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md).

## Import Module

```cangjie
import kit.NetworkKit.*
```

## Permission List

ohos.permission.GET_NETWORK_INFO

ohos.permission.INTERNET

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the aforementioned sample projects and configuration templates, see [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## func createNetConnection(?NetSpecifier, UInt32)

```cangjie
public func createNetConnection(netSpecifier!: ?NetSpecifier = None, timeout!: UInt32 = 0): NetConnection
```

**Function:** Creates a NetConnection object. `netSpecifier` specifies the characteristics of the network to monitor; `timeout` is the timeout duration (in milliseconds). `netSpecifier` is a prerequisite for `timeout`. If neither is provided, it monitors the default network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| netSpecifier | ?[NetSpecifier](#class-netspecifier) | No | None | **Named parameter.** Specifies network characteristics. If None, monitors the default network. |
| timeout | UInt32 | No | 0 | **Named parameter.** Timeout duration for obtaining the network specified by `netSpecifier`. Only effective when `netSpecifier` is provided. Default value is 0. |

**Return Value:**

| Type | Description |
|:----|:----|
| [NetConnection](#class-netconnection) | Handle to the monitored network. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*

// Monitor default network, no parameters needed
let netConnection = createNetConnection()

// Monitor cellular network, requires passing network characteristics. Since timeout parameter is not provided, timeout is 0
let netspecifier = NetSpecifier(NetCapabilities([NetBearType.BEARER_CELLULAR]))
let netConnectionCellular = createNetConnection(netSpecifier: netspecifier)
```

## func getAddressesByName(String)

```cangjie
public func getAddressesByName(host: String): Array<NetAddress>
```

**Function:** Resolves a hostname to obtain all IP addresses using the corresponding network.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| host | String | Yes | - | Hostname to resolve. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[NetAddress](#class-netaddress)> | Returns all IP addresses. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Retrieves a list of all currently connected networks.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[NetHandle](#class-nethandle)> | Returns a list of active data networks. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Binds an app to a specified network. After binding, the app can only access external networks through the specified network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [NetHandle](#class-nethandle) | Returns the data network bound to the app. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Retrieves connection information for the network corresponding to `netHandle`.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Handle to the data network. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ConnectionProperties](#class-connectionproperties) | Returns the network's connection information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Retrieves the default proxy configuration for the network. If a global proxy is set, it returns the global proxy configuration. If the process is bound to a specific network using `setAppNet`, it returns the proxy configuration for that network. In other cases, it returns the proxy configuration for the default network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [HttpProxy](#class-httpproxy) | Returns the default proxy configuration for the network. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error.@syscap SystemCapability.Communication.NetManager.Core |

**Example:**

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

**Description:** Gets the default activated data network. Use getNetCapabilities to obtain network type and capability information.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [NetHandle](#class-nethandle) | Returns the default activated data network. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Obtains capability information of the network corresponding to netHandle.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Handle of the data network. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [NetCapabilities](#class-netcapabilities) | Returns network capability information. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Checks whether the default data network is activated. Returns true if activated.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if the default data network is activated. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Checks whether data usage on the current network is metered.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| Bool | Returns true if data usage on the current network is metered, otherwise returns false. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Reports to network management that the network is available.

**Required Permission:** ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Handle of the data network. See [NetHandle](#class-nethandle). |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Reports to network management that the network is unavailable.

**Required Permission:** ohos.permission.GET_NETWORK_INFO & ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Handle of the data network. See [NetHandle](#class-nethandle). |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Description:** Binds an app to the specified network. After binding, the app can only access external networks through the specified network.**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Handle of the data network. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Network connection information class.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let dnses

```cangjie
public let dnses: Array<NetAddress>
```

**Function:** Network address, refer to [NetAddress](#class-netaddress).

**Type:** Array\<[NetAddress](#class-netaddress)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let domains

```cangjie
public let domains: String
```

**Function:** Domain, default is "".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let interfaceName

```cangjie
public let interfaceName: String
```

**Function:** Network interface name.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let linkAddresses

```cangjie
public let linkAddresses: Array<LinkAddress>
```

**Function:** Link information.

**Type:** Array\<[LinkAddress](#class-linkaddress)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let mtu

```cangjie
public let mtu: UInt16
```

**Function:** Maximum transmission unit.

**Type:** UInt16

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let routes

```cangjie
public let routes: Array<RouteInfo>
```

**Function:** Routing information.

**Type:** Array\<[RouteInfo](#class-routeinfo)>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

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

**Function:** Constructs a ConnectionProperties instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| interfaceName | String | Yes | - | Network interface name. |
| domains | String | Yes | - | Domain, default is "". |
| linkAddresses | Array\<[LinkAddress](#class-linkaddress)> | Yes | - | Link information. |
| dnses | Array\<[NetAddress](#class-netaddress)> | Yes | - | Network address, refer to NetAddress. |
| routes | Array\<[RouteInfo](#class-routeinfo)> | Yes | - | Routing information. |
| mtu | UInt16 | Yes | - | Maximum transmission unit. |

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

**Function:** Network proxy configuration information.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let exclusionList

```cangjie
public let exclusionList:?Array<String>= None
```

**Function:** List of hostnames that do not use the proxy. Hostnames support domain names, IP addresses, and wildcards. Detailed matching rules are as follows:

1. Domain name matching rules:

    (1) Exact match: The proxy server hostname matches if it is exactly the same as any hostname in the list.

    (2) Partial match: The proxy server hostname matches if it contains any hostname in the list.

    For example, if "ample.com" is set in the hostname list, then "ample.com", "www.ample.com", and "ample.com:80" will all match, while "www.example.com" and "ample.com.org" will not.

2. IP address matching rules: The proxy server hostname matches if it is exactly the same as any IP address in the list.

3. Both domain names and IP addresses can be added to the list for matching.

4. The single "*" is the only valid wildcard. When the list contains only the wildcard, it matches all proxy server hostnames, indicating that the proxy is disabled. The wildcard must be added alone and cannot be combined with other domain names or IP addresses in the list; otherwise, the wildcard will not take effect.

5. Matching rules are case-insensitive.

6. Protocol prefixes such as http and https are not considered when matching hostnames.

**Type:** ?Array\<String>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let host

```cangjie
public let host:?String = None
```

**Function:** Proxy server hostname.

**Type:** ?String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let port

```cangjie
public let port:?UInt16 = None
```

**Function:** Host port.

**Type:** ?UInt16

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### HttpProxy(?String, ?UInt16, ?Array\<String>)

```cangjie
public HttpProxy(
    public let host!: ?String = None,
    public let port!: ?UInt16 = None,
    public let exclusionList!: ?Array<String> = None
)
```

**Function:** Constructs an HttpProxy instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| host | ?String | No | None | **Named parameter.** Proxy server hostname. |
| port | ?UInt16 | No | None | **Named parameter.** Host port. |
| exclusionList | ?Array\<String> | No | None | **Named parameter.** List of hostnames that do not use the proxy. Hostnames support domain names, IP addresses, and wildcards. Detailed matching rules are as follows:<br>1. Domain name matching rules:<br>(1) Exact match: The proxy server hostname matches if it is exactly the same as any hostname in the list.<br>(2) Partial match: The proxy server hostname matches if it contains any hostname in the list.<br>For example, if "ample.com" is set in the hostname list, then "ample.com", "www.ample.com", and "ample.com:80" will all match, while "www.example.com" and "ample.com.org" will not.<br>2. IP address matching rules: The proxy server hostname matches if it is exactly the same as any IP address in the list.<br>3. Both domain names and IP addresses can be added to the list for matching.<br>4. The single "*" is the only valid wildcard. When the list contains only the wildcard, it matches all proxy server hostnames, indicating that the proxy is disabled. The wildcard must be added alone and cannot be combined with other domain names or IP addresses in the list; otherwise, the wildcard will not take effect.<br>5. Matching rules are case-insensitive.<br>6. Protocol prefixes such as http and https are not considered when matching hostnames. |

## class LinkAddress
```cangjie
public class LinkAddress {
    public LinkAddress(
        public let address: NetAddress,
        public let prefixLength: Int32
    )
}
```

**Function:** Network link information.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let address

```cangjie
public let address: NetAddress
```

**Function:** Link address.

**Type:** [NetAddress](#class-netaddress)

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let prefixLength

```cangjie
public let prefixLength: Int32
```

**Function:** Prefix length of the link address.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### LinkAddress(NetAddress, Int32)

```cangjie
public LinkAddress(
    public let address: NetAddress,
    public let prefixLength: Int32
)
```

**Function:** Constructs a LinkAddress instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| address | [NetAddress](#class-netaddress) | Yes | - | Link address. |
| prefixLength | Int32 | Yes | - | Prefix length of the link address. |

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

**Function:** Network address.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let address

```cangjie
public let address: String
```

**Function:** Address.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let family

```cangjie
public let family:?UInt32
```

**Function:** IPv4 = 1, IPv6 = 2, default is IPv4.

**Type:** ?UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let port

```cangjie
public let port:?UInt16
```

**Function:** Port number, range [0, 65535].

**Type:** ?UInt16

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### NetAddress(String, ?UInt32, ?UInt16)

```cangjie
public NetAddress(
    public let address: String,
    public let family: ?UInt32,
    public let port: ?UInt16
)
```

**Function:** Constructs a NetAddress instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| address | String | Yes | - | Address. |
| family | ?UInt32 | Yes | - | IPv4 = 1, IPv6 = 2, default is IPv4. |
| port | ?UInt16 | Yes | - | Port number, range [0, 65535]. |

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

**Function:** Network capability set.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let bearerTypes

```cangjie
public let bearerTypes: Array<NetBearType>
```

**Function:** Network type.

**Type:** Array\<[NetBearType](#enum-netbeartype)>

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let linkDownBandwidthKbps

```cangjie
public let linkDownBandwidthKbps:?UInt32 = None
```

**Function:** Downlink (network to device) bandwidth. 0 indicates inability to evaluate current network bandwidth.

**Type:** ?UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let linkUpBandwidthKbps

```cangjie
public let linkUpBandwidthKbps:?UInt32 = None
```

**Function:** Uplink (device to network) bandwidth. 0 indicates inability to evaluate current network bandwidth.

**Type:** ?UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let networkCap

```cangjie
public let networkCap:?Array<NetCap>= None
```

**Function:** Specific network capabilities.

**Type:** ?Array\<[NetCap](#enum-netcap)>

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### NetCapabilities(Array\<NetBearType>, ?UInt32, ?UInt32, ?Array\<NetCap>)

```cangjie
public NetCapabilities(
    public let bearerTypes: Array<NetBearType>,
    public let linkUpBandwidthKbps!: ?UInt32 = None,
    public let linkDownBandwidthKbps!: ?UInt32 = None,
    public let networkCap!: ?Array<NetCap> = None
)
```

**Function:** Constructs a NetCapabilities instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bearerTypes | Array\<[NetBearType](#enum-netbeartype)> | Yes | - | Network type. |
| linkUpBandwidthKbps | ?UInt32 | No | None | **Named parameter.** Uplink (device to network) bandwidth. 0 indicates inability to evaluate current network bandwidth. |
| linkDownBandwidthKbps | ?UInt32 | No | None | **Named parameter.** Downlink (network to device) bandwidth. 0 indicates inability to evaluate current network bandwidth. |
| networkCap | ?Array\<[NetCap](#enum-netcap)> | No | None | **Named parameter.** Specific network capabilities. |

## class NetCapabilityInfo

```cangjie
public class NetCapabilityInfo {
    public NetCapabilityInfo(
        public let netHandle: NetHandle,
        public let netCap!: ?NetCapabilities = None
    )
}
```

**Function:** Provides an instance of data network bearer capabilities.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let netCap

```cangjie
public let netCap:?NetCapabilities = None
```

**Function:** Stores the transmission capabilities and bearer types of the data network.

**Type:** ?[NetCapabilities](#class-netcapabilities)

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21### let netHandle

```cangjie
public let netHandle: NetHandle
```

**Function:** Data network handle.

**Type:** [NetHandle](#class-nethandle)

**Access:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### NetCapabilityInfo(NetHandle, ?NetCapabilities)

```cangjie
public NetCapabilityInfo(
    public let netHandle: NetHandle,
    public let netCap!: ?NetCapabilities = None
)
```

**Function:** Constructs a NetCapabilityInfo instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| netHandle | [NetHandle](#class-nethandle) | Yes | - | Data network handle. |
| netCap | ?[NetCapabilities](#class-netcapabilities) | No | None | **Named parameter.** Stores the transmission capabilities and bearer types of the data network. |

## class NetConnection

```cangjie
public class NetConnection {}
```

**Function:** Handle for network connections; When a device transitions from no network to having a network, the `netAvailable`, `netCapabilitiesChange`, and `netConnectionPropertiesChange` events will be triggered; When a device transitions from having a network to no network, the `netLost` event will be triggered; When a device switches from WiFi to cellular, the `netLost` event (WiFi lost) will be triggered first, followed by the `netAvailable` event (cellular available).

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### func onNetAvailable((NetHandle) -> Unit)

```cangjie
public func onNetAvailable(callback: (NetHandle) -> Unit): Unit
```

**Function:** Subscribes to network availability events.

**Model Constraint:** The `register` interface must be called before invoking this interface. Use `unregister` to unsubscribe from notifications about default network status changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([NetHandle](#class-nethandle))->Unit | Yes | - | Callback function that returns the data network handle. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// Create a NetConnection object
let netCon: NetConnection = createNetConnection()

// First, register the subscription event using the register interface
netCon.register()

// Subscribe to network availability events. After calling register, you can receive notifications for this event
netCon.onNetAvailable({ netHandle =>
    Hilog.info(0, "test", "${netHandle.netId}")
})

// Use the unregister interface to unsubscribe
netCon.unregister()
```

### func onNetBlockStatusChange((NetHandle,Bool) -> Unit)

```cangjie
public func onNetBlockStatusChange(callback: (NetHandle, Bool) -> Unit): Unit
```

**Function:** Subscribes to network blocking status events.

**Model Constraint:** The `register` interface must be called before invoking this interface. Use `unregister` to unsubscribe from notifications about default network status changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([NetHandle](#class-nethandle),Bool)->Unit | Yes | - | Callback function that returns the data network handle (`netHandle`) and network blocking status (`blocked`). |

### func onNetCapabilitiesChange((NetCapabilityInfo) -> Unit)

```cangjie
public func onNetCapabilitiesChange(callback: (NetCapabilityInfo) -> Unit): Unit
```

**Function:** Subscribes to network capability change events.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([NetCapabilityInfo](#class-netcapabilityinfo))->Unit | Yes | - | Callback function that returns the data network handle (`netHandle`) and network capability information (`netCap`). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// Create a NetConnection object
let netCon: NetConnection = createNetConnection()

// First, register the subscription event using the register interface
netCon.register()

// Subscribe to network capability change events. After calling register, you can receive notifications for this event
netCon.onNetCapabilitiesChange({ capabilities =>
    Hilog.info(0, "test", "capability changed")
})

// Use the unregister interface to unsubscribe
netCon.unregister()
```

### func onNetConnectionPropertiesChange((NetHandle,ConnectionProperties) -> Unit)

```cangjie
public func onNetConnectionPropertiesChange(callback: (NetHandle, ConnectionProperties) -> Unit): Unit
```

**Function:** Subscribes to network connection property change events.

**Model Constraint:** The `register` interface must be called before invoking this interface. Use `unregister` to unsubscribe from notifications about default network status changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([NetHandle](#class-nethandle),[ConnectionProperties](#class-connectionproperties))->Unit | Yes | - | Callback function that returns the data network handle (`netHandle`) and network connection properties (`connectionProperties`). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// Create a NetConnection object
let netCon: NetConnection = createNetConnection()

// First, register the subscription event using the register interface
netCon.register()

// Subscribe to network connection property change events. After calling register, you can receive notifications for this event
netCon.onNetConnectionPropertiesChange({ handle, properties =>
    Hilog.info(0, "test", "connection changed")
})

// Use the unregister interface to unsubscribe
netCon.unregister()
```

### func onNetLost((NetHandle) -> Unit)

```cangjie
public func onNetLost(callback: (NetHandle) -> Unit): Unit
```

**Function:** Subscribes to network loss events.

**Model Constraint:** The `register` interface must be called before invoking this interface. Use `unregister` to unsubscribe from notifications about default network status changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ([NetHandle](#class-nethandle))->Unit | Yes | - | Callback function that returns the data network handle (`netHandle`). |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// Create a NetConnection object
let netCon: NetConnection = createNetConnection()

// First, register the subscription event using the register interface
netCon.register()

// Subscribe to network loss events. After calling register, you can receive notifications for this event
netCon.onNetLost({ handle =>
    Hilog.info(0, "test", "net of ${handle.netId} changed")
})

// Use the unregister interface to unsubscribe
netCon.unregister()
```

### func onNetUnavailable(() -> Unit)

```cangjie
public func onNetUnavailable(callback: () -> Unit): Unit
```

**Function:** Subscribes to network unavailability events.

**Model Constraint:** The `register` interface must be called before invoking this interface. Use `unregister` to unsubscribe from notifications about default network status changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| callback | ()->Unit | Yes | - | Callback function with no return value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.NetworkKit.*
import kit.PerformanceAnalysisKit.*

// Create a NetConnection object
let netCon: NetConnection = createNetConnection()

// First, register the subscription event using the register interface
netCon.register()

// Subscribe to network unavailability events. After calling register, you can receive notifications for this event
netCon.onNetUnavailable({ =>
    Hilog.info(0, "test", "net unavailable")
})

// Use the unregister interface to unsubscribe
netCon.unregister()
```

### func register()
```cangjie
public func register(): Unit
```

**Function:** Subscribes to notifications for specified network state changes.

**Required Permission:** ohos.permission.GET_NETWORK_INFO

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |201|Permission denied.|
  |401|Parameter error.|
  |2100002|Operation failed. Cannot connect to service.|
  |2100003|System internal error.|
  |2101008|The same callback exists.|
  |2101022|The number of requests exceeded the maximum.|

**Example:**

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

**Function:** Unsubscribes from notifications for default network state changes.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |201|Permission denied.|
  |401|Parameter error.|
  |2100002|Operation failed. Cannot connect to service.|
  |2100003|System internal error.|
  |2101007|The callback is not found.|

**Example:**

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

**Function:** A handle for data networks. Before calling methods of NetHandle, a NetHandle object must be obtained first.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parent Type:**

- ToString

### let netId

```cangjie
public let netId: Int32
```

**Function:** Network ID, where 0 indicates no default network, and other values must be greater than or equal to 100.

**Type:** Int32

**Read-Write Capability:** Read-only

**Since:** 21

### NetHandle(Int32)

```cangjie
public NetHandle(public let netId: Int32)
```

**Function:** Constructs a NetHandle instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|netId|Int32|Yes|-|Network ID, where 0 indicates no default network, and other values must be greater than or equal to 100.|

### func getAddressByName(String)

```cangjie
public func getAddressByName(host: String): NetAddress
```

**Function:** Resolves a hostname using the corresponding network to obtain the first IP address.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|host|String|Yes|-|The hostname to be resolved.|

**Return Value:**

|Type|Description|
|:----|:----|
|[NetAddress](#class-netaddress)|Returns the first IP address.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Resolves a hostname using the corresponding network to obtain all IP addresses.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Parameters:**

|Parameter Name|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|host|String|Yes|-|The hostname to be resolved.|

**Return Value:**

|Type|Description|
|:----|:----|
|Array\<[NetAddress](#class-netaddress)>|Returns all IP addresses.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Network Connection Management Error Codes](../../errorcodes/cj-errorcode-net-connection.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. |
  | 2100001 | Invalid parameter value. |
  | 2100002 | Operation failed. Cannot connect to service. |
  | 2100003 | System internal error. |

**Example:**

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

**Function:** Returns the NetHandle as a string.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the [NetHandle](#class-nethandle) as a string.|

**Example:**

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

**Function:** Provides an instance with data network bearer capabilities.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21

### let bearerPrivateIdentifier

```cangjie
public let bearerPrivateIdentifier:?String = None
```

**Function:** Network identifier, where "wifi" is the identifier for Wi-Fi networks and "slot0" (corresponding to SIM card 1) is the identifier for cellular networks.

**Type:** ?String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Since:** 21### let netCapabilities

```cangjie
public let netCapabilities: NetCapabilities
```

**Function:** Stores the transmission capabilities and bearer types of data networks.

**Type:** [NetCapabilities](#class-netcapabilities)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NetSpecifier(NetCapabilities, ?String)

```cangjie
public NetSpecifier(
    public let netCapabilities: NetCapabilities,
    public let bearerPrivateIdentifier!: ?String = None
)
```

**Function:** Constructs a NetSpecifier instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| netCapabilities | [NetCapabilities](#class-netcapabilities) | Yes | - | Stores the transmission capabilities and bearer types of data networks. |
| bearerPrivateIdentifier | ?String | No | None | **Named parameter.** Network identifier. The identifier for Wi-Fi networks is "wifi", and for cellular networks, it is "slot0" (corresponding to SIM card 1). |

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

**Function:** Network routing information.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### let destination

```cangjie
public let destination: LinkAddress
```

**Function:** Destination address.

**Type:** [LinkAddress](#class-linkaddress)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### let gateway

```cangjie
public let gateway: NetAddress
```

**Function:** Gateway address.

**Type:** [NetAddress](#class-netaddress)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### let hasGateway

```cangjie
public let hasGateway: Bool
```

**Function:** Whether a gateway exists.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### let interfaceName

```cangjie
public let interfaceName: String
```

**Function:** Network interface name.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### let isDefaultRoute

```cangjie
public let isDefaultRoute: Bool
```

**Function:** Whether it is the default route.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

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

**Function:** Constructs a RouteInfo instance.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| interfaceName | String | Yes | - | Network interface name. |
| destination | [LinkAddress](#class-linkaddress) | Yes | - | Destination address. |
| gateway | [NetAddress](#class-netaddress) | Yes | - | Gateway address. |
| hasGateway | Bool | Yes | - | Whether a gateway exists. |
| isDefaultRoute | Bool | Yes | - | Whether it is the default route. |

## enum NetBearType

```cangjie
public enum NetBearType {
    | BEARER_CELLULAR
    | BEARER_WIFI
    | BEARER_ETHERNET
}
```

**Function:** Network type.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### BEARER_CELLULAR

```cangjie
BEARER_CELLULAR
```

**Function:** Cellular network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### BEARER_ETHERNET

```cangjie
BEARER_ETHERNET
```

**Function:** Ethernet network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### BEARER_WIFI

```cangjie
BEARER_WIFI
```

**Function:** Wi-Fi network.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

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

**Function:** Specific network capabilities.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NET_CAPABILITY_INTERNET

```cangjie
NET_CAPABILITY_INTERNET
```

**Function:** Indicates that the network should have the capability to access the Internet, which is set by the network provider.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NET_CAPABILITY_MMS

```cangjie
NET_CAPABILITY_MMS
```

**Function:** Indicates that the network can access the carrier's MMSC (Multimedia Message Service) to send and receive MMS.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NET_CAPABILITY_NOT_METERED

```cangjie
NET_CAPABILITY_NOT_METERED
```

**Function:** Indicates that the network traffic is not metered.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NET_CAPABILITY_NOT_VPN

```cangjie
NET_CAPABILITY_NOT_VPN
```

**Function:** Indicates that the network does not use a VPN (Virtual Private Network).

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21

### NET_CAPABILITY_VALIDATED

```cangjie
NET_CAPABILITY_VALIDATED
```

**Function:** Indicates that the network's capability to access the Internet has been successfully validated by the network management module, which is set by the network management module.

**System Capability:** SystemCapability.Communication.NetManager.Core

**Initial Version:** 21