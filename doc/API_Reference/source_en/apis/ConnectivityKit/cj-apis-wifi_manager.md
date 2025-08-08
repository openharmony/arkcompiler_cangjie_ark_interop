# ohos.wifi_manager (WLAN)

This module primarily provides WLAN basic functionalities, P2P (peer-to-peer) capabilities, and WLAN notification services, enabling applications to interconnect with other devices via WLAN.

## Import Module

```cangjie
import kit.ConnectivityKit.*
```

## Permission List

ohos.permission.GET_WIFI_INFO

ohos.permission.SET_WIFI_INFO

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and executed in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the aforementioned sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## func getScanInfoList()

```cangjie
public func getScanInfoList(): Array<WifiScanInfo>
```

**Function:** Obtains the scan results.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[WifiScanInfo](#class-wifiscaninfo)> | Returns the list of scanned hotspots. If the application has requested the ohos.permission.GET_WIFI_PEERS_MAC permission (only system applications can request this), the bssid in the returned results will be the real device address; otherwise, it will be a randomized device address. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [WIFI Error Codes](../../errorcodes/cj-errorcode-wifi-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 801 | Capability not supported. |
  | 2501000 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*

let scanInfoList = getScanInfoList()
```

## func isWifiActive()

```cangjie
public func isWifiActive(): Bool
```

**Function:** Checks whether WLAN is enabled.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: enabled, false: disabled. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [WIFI Error Codes](../../errorcodes/cj-errorcode-wifi-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 801 | Capability not supported. |
  | 2501000 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*

let isWifiActive = isWifiActive()
```

## func p2pCancelConnect()

```cangjie
public func p2pCancelConnect(): Unit
```

**Function:** Cancels a P2P connection during the connection process.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**System Capability:** SystemCapability.Communication.WiFi.P2P

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [WIFI Error Codes](../../errorcodes/cj-errorcode-wifi-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 801 | Capability not supported. |
  | 2801000 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*

p2pCancelConnect()
```

## func startDiscoverDevices()

```cangjie
public func startDiscoverDevices(): Unit
```

**Function:** Starts device discovery.

**Required Permission:** ohos.permission.GET_WIFI_INFO

**System Capability:** SystemCapability.Communication.WiFi.P2P

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [WIFI Error Codes](../../errorcodes/cj-errorcode-wifi-manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 801 | Capability not supported. |
  | 2801000 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import std.sync.Timer

startDiscoverDevices()
```

## class WifiInfoElem

```cangjie
public class WifiInfoElem <: ToString {
    public let eid: UInt32
    public let content: Array<UInt8>
}
```

**Function:** WLAN hotspot information.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Parent Type:**

- ToString

### let content

```cangjie
public let content: Array<UInt8>
```

**Function:** Element content.

**Type:** Array\<UInt8>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

### let eid

```cangjie
public let eid: UInt32
```

**Function:** Element ID.

**Type:** UInt32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Obtains the string representation of the current class.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String representation of the current class. |

## class WifiScanInfo

```cangjie
public class WifiScanInfo <: ToString {
    public let ssid: String
    public let bssid: String
    public let bssidType: DeviceAddressType
    public let capabilities: String
    public let securityType: WifiSecurityType
    public let rssi: Int32
    public let band: Int32
    public let frequency: Int32
    public let channelWidth: Int32
    public let centerFrequency0: Int32
    public let centerFrequency1: Int32
    public let infoElems: Array<WifiInfoElem>
    public let timestamp: Int64
    public let supportedWifiCategory: WifiCategory
    public let isHiLinkNetwork: Bool
}
```

**Function:** WLAN hotspot information.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Parent Type:**

- ToString

### let band

```cangjie
public let band: Int32
```

**Function:** The frequency band of the WLAN access point: 1: 2.4GHz; 2: 5GHz.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.WiFi.STA**Initial Version:** 21  

### let bssid  

```cangjie  
public let bssid: String  
```  

**Description:** The BSSID of the hotspot, e.g., 00:11:22:33:44:55.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let bssidType  

```cangjie  
public let bssidType: DeviceAddressType  
```  

**Description:** The BSSID type of the hotspot.  

**Type:** [DeviceAddressType](#enum-deviceaddresstype)  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let capabilities  

```cangjie  
public let capabilities: String  
```  

**Description:** Hotspot capabilities.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let centerFrequency0  

```cangjie  
public let centerFrequency0: Int32  
```  

**Description:** The center frequency of the hotspot.  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let centerFrequency1  

```cangjie  
public let centerFrequency1: Int32  
```  

**Description:** The center frequency of the hotspot. If the hotspot uses two non-overlapping WLAN channels, two center frequencies are returned, represented by centerFrequency0 and centerFrequency1 respectively.  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let channelWidth  

```cangjie  
public let channelWidth: Int32  
```  

**Description:** The bandwidth of the WLAN access point. For specific definitions, refer to [WifiChannelWidth](#enum-wifichannelwidth).  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let frequency  

```cangjie  
public let frequency: Int32  
```  

**Description:** The frequency of the WLAN access point.  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let infoElems  

```cangjie  
public let infoElems: Array<WifiInfoElem>  
```  

**Description:** Information elements.  

**Type:** Array\<[WifiInfoElem](#class-wifiinfoelem)>  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let isHiLinkNetwork  

```cangjie  
public let isHiLinkNetwork: Bool  
```  

**Description:** Whether the hotspot supports HiLink. true: supported, false: not supported.  

**Type:** Bool  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let rssi  

```cangjie  
public let rssi: Int32  
```  

**Description:** The signal strength (dBm) of the hotspot.  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let securityType  

```cangjie  
public let securityType: WifiSecurityType  
```  

**Description:** The encryption type of the WLAN.  

**Type:** [WifiSecurityType](#enum-wifisecuritytype)  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let ssid  

```cangjie  
public let ssid: String  
```  

**Description:** The SSID of the hotspot, with a maximum length of 32 bytes, encoded in UTF-8.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let supportedWifiCategory  

```cangjie  
public let supportedWifiCategory: WifiCategory  
```  

**Description:** The highest WiFi category supported by the hotspot.  

**Type:** [WifiCategory](#enum-wificategory)  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### let timestamp  

```cangjie  
public let timestamp: Int64  
```  

**Description:** Timestamp.  

**Type:** Int64  

**Access:** Read-only  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Description:** Obtains the string representation of the current class.  

**System Capability:** SystemCapability.Communication.WiFi.STA  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The string representation of the current class. |  

## enum DeviceAddressType  

```cangjie  
public enum DeviceAddressType <: ToString {  
    | RANDOM_DEVICE_ADDRESS  
    | REAL_DEVICE_ADDRESS  
    | ...  
}  
```  

**Description:** WiFi device address (MAC/BSSID) type.  

**System Capability:** SystemCapability.Communication.WiFi.Core  

**Initial Version:** 21  

**Parent Type:**  

- ToString  

### RANDOM_DEVICE_ADDRESS  

```cangjie  
RANDOM_DEVICE_ADDRESS  
```  

**Description:** Random device address.  

**System Capability:** SystemCapability.Communication.WiFi.Core  

**Initial Version:** 21  

### REAL_DEVICE_ADDRESS  

```cangjie  
REAL_DEVICE_ADDRESS  
```  

**Description:** Real device address.  

**System Capability:** SystemCapability.Communication.WiFi.Core  

**Initial Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Description:** Obtains the string representation of the current enumeration.  

**System Capability:** SystemCapability.Communication.WiFi.Core  

**Initial Version:** 21**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum WifiCategory

```cangjie
public enum WifiCategory <: ToString {
    | DEFAULT
    | WIFI6
    | WIFI6_PLUS
    | ...
}
```

**Function:** Represents the highest WiFi category supported by the hotspot.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Parent Type:**

- ToString

### DEFAULT

```cangjie
DEFAULT
```

**Function:** Default. WiFi categories below WiFi6.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

### WIFI6

```cangjie
WIFI6
```

**Function:** WiFi6.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

### WIFI6_PLUS

```cangjie
WIFI6_PLUS
```

**Function:** WiFi6+.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Communication.WiFi.STA

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum WifiSecurityType

```cangjie
public enum WifiSecurityType <: Equatable<WifiSecurityType> & ToString {
    | WIFI_SEC_TYPE_INVALID
    | WIFI_SEC_TYPE_OPEN
    | WIFI_SEC_TYPE_WEP
    | WIFI_SEC_TYPE_PSK
    | WIFI_SEC_TYPE_SAE
    | WIFI_SEC_TYPE_EAP
    | WIFI_SEC_TYPE_EAP_SUITE_B
    | WIFI_SEC_TYPE_OWE
    | WIFI_SEC_TYPE_WAPI_CERT
    | WIFI_SEC_TYPE_WAPI_PSK
    | ...
}
```

**Function:** Represents encryption types.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

**Parent Types:**

- Equatable\<WifiSecurityType>
- ToString

### WIFI_SEC_TYPE_EAP

```cangjie
WIFI_SEC_TYPE_EAP
```

**Function:** EAP encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_EAP_SUITE_B

```cangjie
WIFI_SEC_TYPE_EAP_SUITE_B
```

**Function:** Suite-B 192-bit encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_INVALID

```cangjie
WIFI_SEC_TYPE_INVALID
```

**Function:** Invalid encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_OPEN

```cangjie
WIFI_SEC_TYPE_OPEN
```

**Function:** Open encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_OWE

```cangjie
WIFI_SEC_TYPE_OWE
```

**Function:** Opportunistic Wireless Encryption (OWE) type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_PSK

```cangjie
WIFI_SEC_TYPE_PSK
```

**Function:** Pre-shared key (PSK) encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_SAE

```cangjie
WIFI_SEC_TYPE_SAE
```

**Function:** Simultaneous Authentication of Equals (SAE) encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_WAPI_CERT

```cangjie
WIFI_SEC_TYPE_WAPI_CERT
```

**Function:** WAPI-Cert encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_WAPI_PSK

```cangjie
WIFI_SEC_TYPE_WAPI_PSK
```

**Function:** WAPI-PSK encryption type.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### WIFI_SEC_TYPE_WEP

```cangjie
WIFI_SEC_TYPE_WEP
```

**Function:** Wired Equivalent Privacy (WEP) encryption type. This encryption type is not supported by candidate network configurations.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

### func ==(WifiSecurityType)

```cangjie
public operator func ==(that: WifiSecurityType): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Communication.WiFi.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Description|
|:---|:---|:---|:---|
|that|[WifiSecurityType](#enum-wifisecuritytype)|Yes|Another enumeration value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns `true` if the two enumeration values are equal, otherwise returns `false`.|