# ohos.wifi_manager（WLAN）

该模块主要提供WLAN基础功能、P2P（peer-to-peer）功能和WLAN消息通知的相应服务，让应用可以通过WLAN和其他设备互联互通。

## 导入模块

```cangjie
import kit.ConnectivityKit.*
```

## 权限列表

ohos.permission.GET_WIFI_INFO

ohos.permission.SET_WIFI_INFO

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getScanInfoList()

```cangjie
public func getScanInfoList(): Array<WifiScanInfo>
```

**功能：** 获取扫描结果。

**需要权限：** ohos.permission.GET_WIFI_INFO

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[WifiScanInfo](#class-wifiscaninfo)>|返回扫描到的热点列表。如果应用申请了ohos.permission.GET_WIFI_PEERS_MAC权限（仅系统应用可申请），则返回结果中的bssid为真实设备地址，否则为随机设备地址。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[WIFI错误码](../../errorcodes/cj-errorcode-wifi-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2501000|Operation failed.|

**示例：**

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

**功能：** 查询WLAN是否已使能。

**需要权限：** ohos.permission.GET_WIFI_INFO

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true:已使能，false:未使能。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[WIFI错误码](../../errorcodes/cj-errorcode-wifi-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2501000|Operation failed.|

**示例：**

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

**功能：** 在P2P连接过程中，取消P2P连接。

**需要权限：** ohos.permission.GET_WIFI_INFO

**系统能力：** SystemCapability.Communication.WiFi.P2P

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[WIFI错误码](../../errorcodes/cj-errorcode-wifi-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2801000|Operation failed.|

**示例：**

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

**功能：** 开始发现设备。

**需要权限：** ohos.permission.GET_WIFI_INFO

**系统能力：** SystemCapability.Communication.WiFi.P2P

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[WIFI错误码](../../errorcodes/cj-errorcode-wifi-manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2801000|Operation failed.|

**示例：**

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

**功能：** WLAN热点信息。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**父类型：**

- ToString

### let content

```cangjie
public let content: Array<UInt8>
```

**功能：** 元素内容。

**类型：** Array\<UInt8>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let eid

```cangjie
public let eid: UInt32
```

**功能：** 元素ID。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前类的字符串表示。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前类的字符串表示。|

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

**功能：** WLAN热点信息。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**父类型：**

- ToString

### let band

```cangjie
public let band: Int32
```

**功能：** WLAN接入点的频段，1:2.4GHZ；2:5GHZ。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let bssid

```cangjie
public let bssid: String
```

**功能：** 热点的BSSID，例如：00:11:22:33:44:55。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let bssidType

```cangjie
public let bssidType: DeviceAddressType
```

**功能：** 热点的BSSID类型。

**类型：** [DeviceAddressType](#enum-deviceaddresstype)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let capabilities

```cangjie
public let capabilities: String
```

**功能：** 热点能力。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let centerFrequency0

```cangjie
public let centerFrequency0: Int32
```

**功能：** 热点的中心频率。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let centerFrequency1

```cangjie
public let centerFrequency1: Int32
```

**功能：** 热点的中心频率。如果热点使用两个不重叠的WLAN信道，则返回两个中心频率，分别用centerFrequency0和centerFrequency1表示。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let channelWidth

```cangjie
public let channelWidth: Int32
```

**功能：** WLAN接入点的带宽，具体定义参见[WifiChannelWidth](#enum-wifichannelwidth)。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let frequency

```cangjie
public let frequency: Int32
```

**功能：** WLAN接入点的频率。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let infoElems

```cangjie
public let infoElems: Array<WifiInfoElem>
```

**功能：** 信息元素。

**类型：** Array\<[WifiInfoElem](#class-wifiinfoelem)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let isHiLinkNetwork

```cangjie
public let isHiLinkNetwork: Bool
```

**功能：** 热点是否支持hiLink，true:支持，&nbsp;false:不支持。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let rssi

```cangjie
public let rssi: Int32
```

**功能：** 热点的信号强度(dBm)。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let securityType

```cangjie
public let securityType: WifiSecurityType
```

**功能：** WLAN加密类型。

**类型：** [WifiSecurityType](#enum-wifisecuritytype)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let ssid

```cangjie
public let ssid: String
```

**功能：** 热点的SSID，最大长度为32字节，编码格式为UTF-8。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let supportedWifiCategory

```cangjie
public let supportedWifiCategory: WifiCategory
```

**功能：** 热点支持的最高wifi级别。

**类型：** [WifiCategory](#enum-wificategory)

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### let timestamp

```cangjie
public let timestamp: Int64
```

**功能：** 时间戳。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前类的字符串表示。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前类的字符串表示。|

## enum DeviceAddressType

```cangjie
public enum DeviceAddressType <: ToString {
    | RANDOM_DEVICE_ADDRESS
    | REAL_DEVICE_ADDRESS
    | ...
}
```

**功能：** wifi 设备地址（mac/bssid）类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

**父类型：**

- ToString

### RANDOM_DEVICE_ADDRESS

```cangjie
RANDOM_DEVICE_ADDRESS
```

**功能：** 随机设备地址。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### REAL_DEVICE_ADDRESS

```cangjie
REAL_DEVICE_ADDRESS
```

**功能：** 真实设备地址。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum WifiCategory

```cangjie
public enum WifiCategory <: ToString {
    | DEFAULT
    | WIFI6
    | WIFI6_PLUS
    | ...
}
```

**功能：** 表示热点支持的最高wifi类别。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**父类型：**

- ToString

### DEFAULT

```cangjie
DEFAULT
```

**功能：** Default。Wifi6以下的wifi类别。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### WIFI6

```cangjie
WIFI6
```

**功能：** Wifi6。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### WIFI6_PLUS

```cangjie
WIFI6_PLUS
```

**功能：** Wifi6+。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Communication.WiFi.STA

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

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

**功能：** 表示加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

**父类型：**

- Equatable\<WifiSecurityType>
- ToString

### WIFI_SEC_TYPE_EAP

```cangjie
WIFI_SEC_TYPE_EAP
```

**功能：** EAP加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_EAP_SUITE_B

```cangjie
WIFI_SEC_TYPE_EAP_SUITE_B
```

**功能：** Suite-B 192位加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_INVALID

```cangjie
WIFI_SEC_TYPE_INVALID
```

**功能：** 无效加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_OPEN

```cangjie
WIFI_SEC_TYPE_OPEN
```

**功能：** 开放加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_OWE

```cangjie
WIFI_SEC_TYPE_OWE
```

**功能：** 机会性无线加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_PSK

```cangjie
WIFI_SEC_TYPE_PSK
```

**功能：** Pre-shared key (PSK)加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_SAE

```cangjie
WIFI_SEC_TYPE_SAE
```

**功能：** Simultaneous Authentication of Equals (SAE)加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_WAPI_CERT

```cangjie
WIFI_SEC_TYPE_WAPI_CERT
```

**功能：** WAPI-Cert加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_WAPI_PSK

```cangjie
WIFI_SEC_TYPE_WAPI_PSK
```

**功能：** WAPI-PSK加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### WIFI_SEC_TYPE_WEP

```cangjie
WIFI_SEC_TYPE_WEP
```

**功能：** Wired Equivalent Privacy (WEP)加密类型。候选网络配置不支持该加密类型。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

### func ==(WifiSecurityType)

```cangjie
public operator func ==(that: WifiSecurityType): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.WiFi.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|that|[WifiSecurityType](#enum-wifisecuritytype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

