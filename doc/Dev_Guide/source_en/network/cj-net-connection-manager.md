# Network Connection Management

## Introduction

Network Connection Management provides fundamental capabilities for managing networks, including priority management for multiple network connections (WiFi, cellular, Ethernet, etc.), network quality assessment, subscription to default or specified network connection status changes, querying network connection information, DNS resolution, and other functionalities.

## Basic Concepts

- **Network Producer**: The provider of data networks, such as WiFi, cellular, Ethernet, etc.
- **Network Consumer**: The user of data networks, such as applications or system services.
- **Network Probing**: Detects network validity to avoid switching from an available network to an unavailable one. Includes bound network probing, DNS probing, HTTP probing, and HTTPS probing.
- **Network Optimization**: Selects the optimal network when multiple networks coexist. Triggered when network status, network information, or scoring changes.

## Constraints

Development Language: Cangjie

## Scenarios

Typical scenarios for Network Connection Management are as follows:

- Receiving notifications for specified network status changes.
- Retrieving all registered networks.
- Querying network connection information based on data networks.
- Resolving domain names using the corresponding network to obtain all IP addresses.

The specific development methods are described below.

## Interface Description

For the complete Cangjie API documentation and sample code, refer to [Network Connection Management](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md).

| Interface Name                                                                                | Description                                                                                                                                                            |
| --------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `getDefaultNet(): NetHandle`                                                                   | Retrieves a `NetHandle` object containing the `netId` of the default network.                                                                                   |
| `getAppNet(): NetHandle`                                                                       | Retrieves a `NetHandle` object containing the `netId` of the network bound to the app.                                                                          |
| `setAppNet(netHandle: NetHandle): Unit`                                                       | Binds the app to the specified network. After binding, the app can only access external networks through the specified network.                                |
| `getDefaultNetSync(): NetHandle`                                                              | Retrieves the default active data network synchronously. Use `getNetCapabilities` to obtain network type and capabilities.                                      |
| `hasDefaultNet(): Bool`                                                                        | Checks whether the default data network is active.                                                                                                              |
| `getAllNets(): Array<NetHandle>`                                                              | Retrieves a list of `NetHandle` objects for all connected networks.                                                                                             |
| `getConnectionProperties(netHandle: NetHandle): ConnectionProperties`                         | Queries the connection information for the network corresponding to `netHandle`.                                                                                |
| `getNetCapabilities(netHandle: NetHandle): NetCapabilities`                                   | Retrieves the capability information for the network corresponding to `netHandle`.                                                                              |
| `isDefaultNetMetered(): Bool`                                                                 | Checks whether data traffic on the current network is metered (asynchronous callback method).                                                                   |
| `reportNetConnected(netHandle: NetHandle): Unit`                                              | Reports to network management that the network is available. Indicates the app's view of network availability differs from network management.                  |
| `reportNetDisconnected(netHandle: NetHandle): Unit`                                           | Reports to network management that the network is unavailable. Indicates the app's view of network availability differs from network management.                |
| `getAddressesByName(host: String): Array<NetAddress>`                                          | Resolves a domain name using the corresponding network to obtain all IP addresses.                                                                              |
| `createNetConnection(netSpecifier: ?NetSpecifier = None, timeout: UInt32 = 0): NetConnection` | Returns a `NetConnection` object. `netSpecifier` specifies network characteristics to monitor. `timeout` (ms) requires `netSpecifier`. If neither is provided, monitors the default network. |
| `getAddressByName(host: String): NetAddress`                                                  | Resolves a domain name using the corresponding network to obtain one IP address (callback method).                                                              |
| `onNetAvailable(callback: (NetHandle) -> Unit): Unit`                                         | Subscribes to network availability events.                                                                                                                     |
| `onNetCapabilitiesChange(callback: (NetCapabilityInfo) -> Unit): Unit`                        | Subscribes to network capability change events.                                                                                                                 |
| `onNetConnectionPropertiesChange(callback: (NetHandle, ConnectionProperties) -> Unit): Unit`  | Subscribes to network connection property change events.                                                                                                        |
| `onNetBlockStatusChange(callback: (NetHandle, Bool) -> Unit): Unit`                           | Subscribes to network block status events (asynchronous callback method).                                                                                       |
| `onNetLost(callback: (NetHandle) -> Unit): Unit`                                               | Subscribes to network loss events.                                                                                                                              |
| `onNetUnavailable(callback: () -> Unit): Unit`                                                 | Subscribes to network unavailability events.                                                                                                                    |
| `register(): Unit`                                                                             | Subscribes to notifications for specified network status changes.                                                                                               |
| `unregister(): Unit`                                                                           | Unsubscribes from default network status change notifications.                                                                                                  |

## Receiving Notifications for Specified Network Status Changes

1. Declare the required permission: `ohos.permission.GET_NETWORK_INFO`. This is a normal-level permission. Ensure compliance with [Basic Principles of Permission Usage](../security/AccessToken/cj-app-permission-mgmt-overview.md#basic-principles-of-permission-usage) before applying. Then declare the permission as described in [Access Control - Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

2. Import `connection` from `@kit.NetworkKit`.

3. Call the [`createNetConnection`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-createnetconnectionnetspecifier-uint32) method, specifying network capabilities, network type, and timeout (optional; if not provided, defaults to the default network). This creates a `NetConnection` object.

4. Call the object's [`onXXX()`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-onnetavailablenethandle---unit) method, passing a callback to subscribe to the desired events.

5. Call the object's [`register()`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-register) method to subscribe to notifications for specified network status changes.

6. When the network becomes available, the `netAvailable` event callback is triggered; when unavailable, the `netUnavailable` callback is triggered.

7. When the network is no longer needed, call the object's [`unregister()`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-unregister) method to unsubscribe.

<!--compile-->
```cangjie
// index.cj
// Import packages.
import kit.NetworkKit.*
import ohos.base.*

let netSpecifier = NetSpecifier(NetCapabilities([NetBearType.BEARER_CELLULAR], networkCap: [NetCap.NET_CAPABILITY_INTERNET]))

// Set timeout to 10s (default is 0).
let timeout = UInt32(10 * 1000)

// Create a NetConnection object.
let conn = createNetConnection(netSpecifier: netSpecifier, timeout: timeout)

// Subscribe to notifications for specified network status changes.
conn.register()

// Subscribe to events. If the specified network is available, notify via on_netAvailable.
conn.onNetAvailable { netHandle =>
    AppLog.info("net is available, netId is ${netHandle.netId}")
}

// Subscribe to events. If the specified network is unavailable, notify via on_netUnavailable.
conn.onNetUnavailable { =>
    AppLog.info("net is unavailable")
}

// Unsubscribe when the network is no longer needed.
conn.unregister()
```

## Monitoring Default Network Changes and Proactively Rebuilding Network Connections

The default network may change based on current network status and quality, such as:

1. Switching from WiFi to cellular when WiFi signal is weak.
2. Switching from cellular to WiFi when cellular network quality is poor.
3. Switching to cellular after WiFi is turned off.
4. Switching to WiFi after cellular is turned off.
5. Switching to another WiFi when the current WiFi signal is weak (cross-network scenario).
6. Switching to another cellular network when the current cellular quality is poor (cross-network scenario).

This section describes how to monitor default network changes and ensure application traffic quickly migrates to the new default network.

### Monitoring Default Network Changes

<!--compile-->
```cangjie
// index.cj
import kit.NetworkKit.*
import ohos.base.*

func test() {
    let netConnection = createNetConnection()
    netConnection.onNetAvailable { netHandle =>
        AppLog.info("net is available, netId is ${netHandle.netId}")
    }
}
```

## Retrieving All Registered Networks

1. Declare the required permission: `ohos.permission.GET_NETWORK_INFO`. Ensure compliance with [Basic Principles of Permission Usage](../security/AccessToken/cj-app-permission-mgmt-overview.md#basic-principles-of-permission-usage) before applying. Then declare the permission as described in [Access Control - Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

2. Import `connection` from `kit.NetworkKit`.

3. Call the [`getAllNets`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getallnets) method to retrieve a list of all connected networks.

<!--compile-->
```cangjie
// index.cj
// Import packages.
import kit.NetworkKit.*
import ohos.base.*

// Retrieve a list of all connected networks.
let nets = getAllNets()
```

## Querying Network Capabilities and Connection Information Based on Data Networks

1. Declare the required permission: `ohos.permission.GET_NETWORK_INFO`. Ensure compliance with [Basic Principles of Permission Usage](../security/AccessToken/cj-app-permission-mgmt-overview.md#basic-principles-of-permission-usage) before applying. Then declare the permission as described in [Access Control - Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

2. Import `connection` from `kit.NetworkKit`.

3. Call [`getDefaultNet`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getdefaultnet) to retrieve the default data network (`NetHandle`), or call [`getAllNets`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getallnets) to retrieve a list of all connected networks (`Array<NetHandle>`).

4. Call [`getNetCapabilities`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getnetcapabilitiesnethandle) to retrieve capability information for the network corresponding to `NetHandle`. Capabilities include network type (cellular, WiFi, Ethernet) and specific network capabilities.

5. Call [`getConnectionProperties`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getconnectionpropertiesnethandle) to retrieve connection information for the network corresponding to `NetHandle`.

<!--compile-->
```cangjie
// index.cj
import kit.NetworkKit.*
import ohos.base.*

extend NetCap {
    public operator func ==(that: NetCap): Bool {
        match ((this, that)) {
            case (NET_CAPABILITY_MMS, NET_CAPABILITY_MMS) => true
            case (NET_CAPABILITY_NOT_METERED, NET_CAPABILITY_NOT_METERED) => true
            case (NET_CAPABILITY_INTERNET, NET_CAPABILITY_INTERNET) => true
            case (NET_CAPABILITY_NOT_VPN, NET_CAPABILITY_NOT_VPN) => true
            case (NET_CAPABILITY_VALIDATED, NET_CAPABILITY_VALIDATED) => true
            case _ => false
        }
    }
}

extend NetBearType {
    public operator func ==(that: NetBearType): Bool {
        match ((this, that)) {
            case (BEARER_CELLULAR, BEARER_CELLULAR) => true
            case (BEARER_WIFI, BEARER_WIFI) => true
            case (BEARER_ETHERNET, BEARER_ETHERNET) => true
            case _ => false
        }
    }
}

// Retrieve the default data network (NetHandle).
let netHandle = getDefaultNet()
if (netHandle.netId == 0) {
    // If no default network exists, the netId of the retrieved NetHandle is 0 (abnormal case requiring additional handling).
    return
}

let caps = getNetCapabilities(netHandle)
// Retrieve network types (bearerTypes).
for (item in caps.bearerTypes) {
    if (item == BEARER_CELLULAR) {
        // Cellular network.
        AppLog.info("BEARER_CELLULAR")
    } else if (item == BEARER_WIFI) {
        // WiFi network.
        AppLog.info("BEARER_WIFI")
    } else if (item == BEARER_ETHERNET) {
        // Ethernet network.
        AppLog.info("BEARER_ETHERNET")
    }
}

// Retrieve network capabilities (networkCap).
if (let Some(nwCap) <- caps.networkCap) {
    for (item in nwCap) {
        if (item == NET_CAPABILITY_MMS) {
            // Indicates the network can access the carrier's MMSC for sending/receiving MMS.
            AppLog.info("NET_CAPABILITY_MMS")
        } else if (item == NET_CAPABILITY_NOT_METERED) {
            // Indicates network traffic is not metered.
            AppLog.info("NET_CAPABILITY_NOT_METERED")
        } else if (item == NET_CAPABILITY_INTERNET) {
            // Indicates the network should have Internet access (set by the network provider).
            AppLog.info("NET_CAPABILITY_INTERNET")
        } else if (item == NET_CAPABILITY_NOT_VPN) {
            // Indicates the network does not use a VPN.
            AppLog.info("NET_CAPABILITY_NOT_VPN")
        } else if (item == NET_CAPABILITY_VALIDATED) {
            // Indicates the network's Internet access capability has been successfully validated by network management.
            AppLog.info("NET_CAPABILITY_VALIDATED")
        }
    }
}

// Retrieve connection information for the network corresponding to netHandle (includes link and routing info).
let props = getConnectionProperties(netHandle)

// Retrieve all connected networks (Array<NetHandle>).
let allNets = getAllNets()

for (item in allNets) {
    let curCap = getNetCapabilities(item)
    let curProp = getConnectionProperties(item)
}
```

## Resolving Domain Names Using the Corresponding Network to Obtain All IP Addresses

1. Declare the required permission: `ohos.permission.INTERNET`. This is a normal-level permission. Ensure compliance with [Basic Principles of Permission Usage](../security/AccessToken/cj-app-permission-mgmt-overview.md#basic-principles-of-permission-usage) before applying. Then declare the permission as described in [Access Control - Declaring Permissions](../security/AccessToken/cj-declare-permissions.md).

2. Import `connection` from `kit.NetworkKit`.

3. Call the [`getAddressesByName`](../../../API_Reference/source_en/apis/NetworkKit/cj-apis-net-connection.md#func-getaddressesbynamestring) method to resolve a hostname using the default network and retrieve all IP addresses.

<!--compile-->
```cangjie
// index.cj
// Import packages.
import kit.NetworkKit.*
import ohos.base.*

// Resolve a hostname using the default network to retrieve all IP addresses.
let addrs: Array<NetAddress> = getAddressesByName("xxx")
AppLog.info("Succeeded to get data")
```