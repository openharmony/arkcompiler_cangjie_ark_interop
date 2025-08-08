# ohos.bluetooth.ble（蓝牙ble模块）

ble模块提供了对蓝牙操作和管理的方法。

## 导入模块

```cangjie
import kit.ConnectivityKit.*
```

## 权限列表

ohos.permission.ACCESS_BLUETOOTH

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createGattClientDevice(String)

```cangjie
public func createGattClientDevice(deviceId: String): GattClientDevice
```

**功能：** 创建一个可使用的GattClientDevice实例。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|deviceId|String|是|对端设备地址，例如："XX:XX:XX:XX:XX:XX"。|

**返回值：**

|类型|说明|
|:----|:----|
|[GattClientDevice](#class-gattclientdevice)|client端类，使用client端方法之前需要创建该类的实例进行操作。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let device: GattClientDevice  = createGattClientDevice("XX:XX:XX:XX:XX:XX")
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func createGattServer()

```cangjie
public func createGattServer(): GattServer
```

**功能：** 创建一个可使用的GattServer实例。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[GattServer](#class-gattserver)|返回一个Gatt服务的实例。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattServer: GattServer = createGattServer()
```

## func off(BluetoothBleCallbackType, ?CallbackObject)

```cangjie
public func off(`type`: BluetoothBleCallbackType, callback!: ?CallbackObject = None): Unit
```

**功能：** 取消订阅BLE设备事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|\`type`|[BluetoothBleCallbackType](#enum-bluetoothblecallbacktype)|是|-|回调事件。|
|callback|?[CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject)|否|None| **命名参数。** 表示取消订阅BLE事件。不填该参数则取消订阅该type对应的所有回调。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class BLEDeviceFindCallback <: Callback1Argument<Array<ScanResult>> {
    public func invoke(devices: Array<ScanResult>): Unit {
        for (device in devices) {
            Hilog.info(0, "Bluetooth", "device has find, deviceID is ${device.deviceId}, name is ${device.deviceName}")
        }
    }
}

let bleDeviceFindCallback = BLEDeviceFindCallback()
try {
    on(BLE_DEVICE_FIND, bleDeviceFindCallback)
    off(BLE_DEVICE_FIND, callback: bleDeviceFindCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func on(BluetoothBleCallbackType, Callback1Argument\<AdvertisingStateChangeInfo>)

```cangjie
public func on(`type`: BluetoothBleCallbackType, callback: Callback1Argument<AdvertisingStateChangeInfo>): Unit
```

**功能：** 订阅BLE广播状态。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|\`type`|[BluetoothBleCallbackType](#enum-bluetoothblecallbacktype)|是|填写 ADVERTISING_STATE_CHANGE，表示广播状态事件。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[AdvertisingStateChangeInfo](#class-advertisingstatechangeinfo)>|是|表示回调函数的入参，广播状态。回调函数由用户创建通过该接口注册。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class AdvertisingStateChange <: Callback1Argument<AdvertisingStateChangeInfo> {
    public func invoke(info: AdvertisingStateChangeInfo): Unit {
        Hilog.info(0, "Bluetooth", "the advertising state is ${info.state}")
    }
}

let advertisingStateChange = AdvertisingStateChange()
try {
    on(ADVERTISING_STATE_CHANGE, advertisingStateChange)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func on(BluetoothBleCallbackType, Callback1Argument\<Array\<ScanResult>>)

```cangjie
public func on(`type`: BluetoothBleCallbackType, callback: Callback1Argument<Array<ScanResult>>): Unit
```

**功能：** 订阅BLE设备发现上报事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|\`type`|[BluetoothBleCallbackType](#enum-bluetoothblecallbacktype)|是|填写BLE_DEVICE_FIND，表示BLE设备发现事件。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[ScanResult](#class-scanresult)>>|是|表示回调函数的入参，发现的设备集合。回调函数由用户创建通过该接口注册。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class BLEDeviceFindCallback <: Callback1Argument<Array<ScanResult>> {
    public func invoke(devices: Array<ScanResult>): Unit {
        for (device in devices) {
            Hilog.info(0, "Bluetooth", "device has find, deviceID is ${device.deviceId}, name is ${device.deviceName}")
        }
    }
}

let bleDeviceFindCallback = BLEDeviceFindCallback()
try {
    on(BLE_DEVICE_FIND, bleDeviceFindCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func startAdvertising(AdvertiseSetting, AdvertiseData, ?AdvertiseData)

```cangjie
public func startAdvertising(setting: AdvertiseSetting, advData: AdvertiseData, advResponse!: ?AdvertiseData = None): Unit
```

**功能：** 开始发送BLE广播。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|setting|[AdvertiseSetting](#class-advertisesetting)|是|-|BLE广播的相关参数。|
|advData|[AdvertiseData](#class-advertisedata)|是|-|BLE广播包内容。|
|advResponse|?[AdvertiseData](#class-advertisedata)|否|None| **命名参数。** BLE回复扫描请求回复响应。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let advertisingSettings = AdvertiseSetting(32, 0, true)
let manufactureDataUnit = ManufactureData(
    4567u16,
    [1, 2, 3, 4]
)
let serviceDataUnit = ServiceData(
    "00001888-0000-1000-8000-00805f9b34fb",
    [5, 6, 7, 8]
)
let advertisingData = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit],
    includeDeviceName: true
)
let advertisingResponse = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit]
)
try {
    startAdvertising(advertisingSettings, advertisingData, advResponse: advertisingResponse)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func startAdvertising(AdvertisingParams)

```cangjie
public func startAdvertising(advertisingParams: AdvertisingParams): UInt32
```

**功能：** 开始发送BLE广播。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|advertisingParams|[AdvertisingParams](#class-advertisingparams)|是|启动BLE广播的相关参数。|

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|广播ID标识。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let advertisingSettings = AdvertiseSetting(32, 0, true)
let manufactureDataUnit = ManufactureData(
    4567u16,
    [1, 2, 3, 4]
)
let serviceDataUnit = ServiceData(
    "00001888-0000-1000-8000-00805f9b34fb",
    [5, 6, 7, 8]
)
let advertisingData = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit],
    includeDeviceName: true
)
let advertisingResponse = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit]
)
let advertisingParams = AdvertisingParams(
    advertisingSettings,
    advertisingData,
    advertisingResponse,
    duration: 300
)
try {
    let advHandle = startAdvertising(advertisingParams)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func startBLEScan(Array\<ScanFilter>, ?ScanOptions)

```cangjie
public func startBLEScan(filters: Array<ScanFilter>, options!: ?ScanOptions = None): Unit
```

**功能：** 发起BLE扫描流程。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|filters|Array\<[ScanFilter](#class-scanfilter)>|是|-|表示扫描结果过滤策略集合，符合过滤条件的设备发现会保留。|
|options|?[ScanOptions](#class-scanoptions)|否|None|**命名参数。** 表示扫描的参数配置，可选参数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class BLEDeviceFindCallback <: Callback1Argument<Array<ScanResult>> {
    public func invoke(devices: Array<ScanResult>): Unit {
        for (device in devices) {
            Hilog.info(0, "Bluetooth", "device has find, deviceID is ${device.deviceId}, name is ${device.deviceName}")
        }
    }
}

let bleDeviceFindCallback = BLEDeviceFindCallback()
try {
    on(BLE_DEVICE_FIND, bleDeviceFindCallback)
    var scanFilter = ScanFilter()
    scanFilter.serviceUuid = "00001888-0000-1000-8000-00805f9b34fb"
    let scanOptions = ScanOptions(0, SCAN_MODE_LOW_POWER, MATCH_MODE_AGGRESSIVE, PHY_LE_1M)
    startBLEScan([scanFilter], options: scanOptions)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func stopAdvertising()

```cangjie
public func stopAdvertising(): Unit
```

**功能：** 停止发送BLE广播。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    stopAdvertising()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func stopAdvertising(UInt32)

```cangjie
public func stopAdvertising(advertisingId: UInt32): Unit
```

**功能：** 停止发送BLE广播。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|advertisingId|UInt32|是|需要停止的广播ID标识。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |401|Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let advertisingSettings = AdvertiseSetting(32, 0, true)
let manufactureDataUnit = ManufactureData(
    4567u16,
    [1, 2, 3, 4]
)
let serviceDataUnit = ServiceData(
    "00001888-0000-1000-8000-00805f9b34fb",
    [5, 6, 7, 8]
)
let advertisingData = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit],
    includeDeviceName: true
)
let advertisingResponse = AdvertiseData(
    ["00001888-0000-1000-8000-00805f9b34fb"],
    [manufactureDataUnit],
    [serviceDataUnit]
)
let advertisingParams = AdvertisingParams(
    advertisingSettings,
    advertisingData,
    advertisingResponse,
    duration: 300
)
var advHandle: UInt32 = 0xFF
try {
    advHandle = startAdvertising(advertisingParams)
    stopAdvertising(advHandle)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## func stopBLEScan()

```cangjie
public func stopBLEScan(): Unit
```

**功能：** 停止BLE扫描流程。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[蓝牙服务子系统错误码](../../errorcodes/cj-errorcode-bluetooth_manager.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    stopBLEScan()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## class AdvertiseData

```cangjie
public class AdvertiseData {
    public AdvertiseData(
        public var serviceUuids: Array<String>,
        public var manufactureData: Array<ManufactureData>,
        public var serviceData: Array<ServiceData>,
        public var includeDeviceName!: Bool = false
    )
}
```

**功能：** 描述BLE广播数据包的内容，广播包数据长度为31个字节。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var includeDeviceName

```cangjie
public var includeDeviceName: Bool = false
```

**功能：** 表示是否携带设备名，可选参数。true表示携带，false或未设置此参数表示不携带。注意带上设备名时广播包长度不能超出31个字节。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureData

```cangjie
public var manufactureData: Array<ManufactureData>
```

**功能：** 表示要广播的广播的制造商信息列表。

**类型：** Array\<[ManufactureData](#class-manufacturedata)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceData

```cangjie
public var serviceData: Array<ServiceData>
```

**功能：** 表示要广播的服务数据列表。

**类型：** Array\<[ServiceData](#class-servicedata)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuids

```cangjie
public var serviceUuids: Array<String>
```

**功能：** 表示要广播的服务列表。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### AdvertiseData(Array\<String>, Array\<ManufactureData>, Array\<ServiceData>, Bool)

```cangjie
public AdvertiseData(
    public var serviceUuids: Array<String>,
    public var manufactureData: Array<ManufactureData>,
    public var serviceData: Array<ServiceData>,
    public var includeDeviceName!: Bool = false
)
```

**功能：** AdvertiseData 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuids|Array\<String>|是|-|表示要广播的服务 UUID 列表。|
|manufactureData|Array\<[ManufactureData](#class-manufacturedata)>|是|-|表示要广播的广播的制造商信息列表。|
|serviceData|Array\<[ServiceData](#class-servicedata)>|是|-|表示要广播的服务数据列表。|
|includeDeviceName|Bool|否|false| **命名参数。** 表示是否携带设备名，可选参数。true表示携带，false或未设置此参数表示不携带。注意带上设备名时广播包长度不能超出31个字节。|

## class AdvertiseSetting

```cangjie
public class AdvertiseSetting {
    public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL
    public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE
    public var connectable: Bool = true
    public init(interval: UInt16, txPower: Int8, connectable: Bool)
}
```

**功能：** 描述蓝牙低功耗设备发送广播的参数。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var connectable

```cangjie
public var connectable: Bool = true
```

**功能：** 表示是否是可连接广播，默认值设置为true，表示可连接，false表示不可连接。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var interval

```cangjie
public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL
```

**功能：** 表示广播间隔，最小值设置160个slot表示100ms，最大值设置16384个slot，默认值设置为1600个slot表示1s。

**类型：** UInt16

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var txPower

```cangjie
public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE
```

**功能：** 表示发送功率，最小值设置-127，最大值设置1，默认值设置-7，单位dbm。推荐值：高档（1），中档（-7），低档（-15）。

**类型：** Int8

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### init(UInt16, Int8, Bool)

```cangjie
public init(interval: UInt16, txPower: Int8, connectable: Bool)
```

**功能：** 构造蓝牙低功耗设备发送广播的参数结构。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|interval|UInt16|是|-|表示广播间隔，最小值设置160个slot表示100ms，最大值设置16384个slot，默认值设置为1600个slot表示1s。|
|txPower|Int8|是|-|表示发送功率，最小值设置-127，最大值设置1，默认值设置-7，单位dbm。推荐值：高档（1），中档（-7），低档（-15）。|
|connectable|Bool|是|-|表示是否是可连接广播，默认值设置为true，表示可连接，false表示不可连接。|

## class AdvertisingParams

```cangjie
public class AdvertisingParams {
    public AdvertisingParams(
        @!APILevel[
            21,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingSettings: AdvertiseSetting,
        @!APILevel[
            21,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingData: AdvertiseData,
        @!APILevel[
            21,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var advertisingResponse: AdvertiseData,
        @!APILevel[
            21,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var duration!: UInt16 = 0
    )
}
```

**功能：** 描述首次启动广播设置的参数。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var advertisingData

```cangjie
public var advertisingData: AdvertiseData
```

**功能：** 表示广播的数据包内容。

**类型：** [AdvertiseData](#class-advertisedata)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var advertisingResponse

```cangjie
public var advertisingResponse: AdvertiseData
```

**功能：** 表示回复扫描请求的响应内容。

**类型：** [AdvertiseData](#class-advertisedata)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var advertisingSettings

```cangjie
public var advertisingSettings: AdvertiseSetting
```

**功能：** 表示发送广播的相关参数。

**类型：** [AdvertiseSetting](#class-advertisesetting)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var duration

```cangjie
public var duration: UInt16 = 0
```

**功能：** 表示发送广播持续的时间。单位为10ms，有效范围为1(10ms)到65535(655350ms)，如果未指定此参数或者将其设置为0，则会连续发送广播。

**类型：** UInt16

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### AdvertisingParams(AdvertiseSetting, AdvertiseData, AdvertiseData, UInt16)

```cangjie
public AdvertisingParams(
    @!APILevel[
        21,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingSettings: AdvertiseSetting,
    @!APILevel[
        21,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingData: AdvertiseData,
    @!APILevel[
        21,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var advertisingResponse: AdvertiseData,
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var duration!: UInt16 = 0
)
```

**功能：** AdvertisingParams 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|advertisingSettings|[AdvertiseSetting](#class-advertisesetting)|否|-|表示发送广播的相关参数。|
|advertisingData|[AdvertiseData](#class-advertisedata)|否|-|表示广播的数据包内容。|
|advertisingResponse|[AdvertiseData](#class-advertisedata)|否|-|表示回复扫描请求的响应内容。|
|duration|UInt16|否|0|**命名参数。** 表示发送广播持续的时间。单位为10ms，有效范围为1(10ms)到65535(655350ms)，如果未指定此参数或者将其设置为0，则会连续发送广播。|

## class AdvertisingStateChangeInfo

```cangjie
public class AdvertisingStateChangeInfo {}
```

**功能：** 描述广播启动、停止等状态信息。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var advertisingId

```cangjie
public var advertisingId: Int32
```

**功能：** 表示广播ID标识。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var state

```cangjie
public var state: AdvertisingState
```

**功能：** 表示广播状态。

**类型：** [AdvertisingState](#enum-advertisingstate)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

## class BLECharacteristic

```cangjie
public class BLECharacteristic {
    public BLECharacteristic(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicUuid: String,
        

        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicValue: Array<Byte>,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptors: Array<BLEDescriptor>,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var properties: GattProperties
    )
}
```

**功能：** 描述characteristic的接口参数定义。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristicUuid

```cangjie
public var characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristicValue

```cangjie
public var characteristicValue: Array<Byte>
```

**功能：** 特征对应的二进制值。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var descriptors

```cangjie
public var descriptors: Array<BLEDescriptor>
```

**功能：** 特定特征的描述符列表。

**类型：** Array\<[BLEDescriptor](#class-bledescriptor)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var properties

```cangjie
public var properties: GattProperties
```

**功能：** 特定特征的属性描述。

**类型：** [GattProperties](#class-gattproperties)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLECharacteristic(String, String, Array\<Byte>, Array\<BLEDescriptor>, GattProperties)

```cangjie
public BLECharacteristic(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String,
    

    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptors: Array<BLEDescriptor>,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var properties: GattProperties
)
```

**功能：** BLECharacteristic 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|characteristicValue|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|特征对应的二进制值。|
|descriptors|Array\<[BLEDescriptor](#class-bledescriptor)>|否|-|特定特征的描述符列表。|
|properties|[GattProperties](#class-gattproperties)|否|-|特定特征的属性描述。|

## class BLEConnectionChangeState

```cangjie
public class BLEConnectionChangeState {
    public BLEConnectionChangeState(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var state: ProfileConnectionState
    )
}
```

**功能：** 描述Gatt profile连接状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var state

```cangjie
public var state: ProfileConnectionState
```

**功能：** 表示BLE连接状态的枚举。

**类型：** [ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示远端设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLEConnectionChangeState(String, ProfileConnectionState)

```cangjie
public BLEConnectionChangeState(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let deviceId: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var state: ProfileConnectionState
)
```

**功能：** BLEConnectionChangeState 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|-|表示远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|state|[ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate)|否|-|表示BLE连接状态的枚举。|

## class BLEDescriptor

```cangjie
public class BLEDescriptor {
    public BLEDescriptor(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptorUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var descriptorValue: Array<Byte>
    )
}
```

**功能：** 描述descriptor的接口参数定义。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristicUuid

```cangjie
public var characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var descriptorUuid

```cangjie
public var descriptorUuid: String
```

**功能：** 描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var descriptorValue

```cangjie
public var descriptorValue: Array<Byte>
```

**功能：** 描述符对应的二进制值。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLEDescriptor(String, String, String, Array\<Byte>)

```cangjie
public BLEDescriptor(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var descriptorValue: Array<Byte>
)
```

**功能：** BLEDescriptor 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|descriptorUuid|String|否|-|描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。|
|descriptorValue|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|描述符对应的二进制值。|

## class CharacteristicReadRequest

```cangjie
public class CharacteristicReadRequest {
    public CharacteristicReadRequest(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let transId: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    )
}
```

**功能：** 描述server端订阅后收到的特征值读请求事件参数类。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示发送特征值读请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let offset

```cangjie
public let offset: Int32
```

**功能：** 表示读特征值数据的起始位置。例如：k表示从第k个字节开始读，server端回复响应时需填写相同的offset。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let transId

```cangjie
public let transId: Int32
```

**功能：** 表示写请求的传输ID，server端回复响应时需填写相同的传输ID。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### CharacteristicReadRequest(String, Int32, Int32, String, String)

```cangjie
public CharacteristicReadRequest(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let deviceId: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let transId: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let offset: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let serviceUuid: String
)
```

**功能：** CharacteristicReadRequest 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|-|表示发送特征值读请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|transId|Int32|否|-|表示读请求的传输ID，server端回复响应时需填写相同的传输ID。|
|offset|Int32|否|-|表示读特征值数据的起始位置。例如：k表示从第k个字节开始读，server端回复响应时需填写相同的offset。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|

## class CharacteristicWriteRequest

```cangjie
public class CharacteristicWriteRequest {
    public CharacteristicWriteRequest(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let transId: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let isPrepared: Bool,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let needRsp: Bool,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let value: Array<Byte>,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    )
}
```

**功能：** 描述server端订阅后收到的特征值写请求事件参数类。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示扫描到的设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let isPrepared

```cangjie
public let isPrepared: Bool
```

**功能：** 表示写请求是否立即执行。true表示立即执行。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let needRsp

```cangjie
public let needRsp: Bool
```

**功能：** 表示是否要给client端回复响应。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let offset

```cangjie
public let offset: Int32
```

**功能：** 表示写描述符数据的起始位置。例如：k表示从第k个字节开始写，server端回复响应时需填写相同的offset。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let transId

```cangjie
public let transId: Int32
```

**功能：** 表示写请求的传输ID，server端回复响应时需填写相同的传输ID。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let value

```cangjie
public let value: Array<Byte>
```

**功能：** 表示写入的描述符二进制数据。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### CharacteristicWriteRequest(String, Int32, Int32, Bool, Bool, Array\<Byte>, String, String)

```cangjie
public CharacteristicWriteRequest(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let deviceId: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let transId: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let offset: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let isPrepared: Bool,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let needRsp: Bool,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let value: Array<Byte>,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let serviceUuid: String
)
```

**功能：** CharacteristicWriteRequest 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|-|表示发送特征值写请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|transId|Int32|否|-|表示写请求的传输ID，server端回复响应时需填写相同的传输ID。|
|offset|Int32|否|-|表示写特征值数据的起始位置。例如：k表示从第k个字节开始写，server端回复响应时需填写相同的offset。|
|isPrepared|Bool|否|-|表示写请求是否立即执行。true表示立即执行。|
|needRsp|Bool|否|-|表示是否要给client端回复响应。true表示需要回复。|
|value|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|表示写入的描述符二进制数据。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|

## class DescriptorReadRequest

```cangjie
public class DescriptorReadRequest {
    public DescriptorReadRequest(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let transId: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let descriptorUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    )
}
```

**功能：** 描述server端订阅后收到的描述符读请求事件参数类。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let descriptorUuid

```cangjie
public let descriptorUuid: String
```

**功能：** 表示描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示发送描述符读请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let offset

```cangjie
public let offset: Int32
```

**功能：** 表示读描述符数据的起始位置。例如：k表示从第k个字节开始读，server端回复响应时需填写相同的offset。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let transId

```cangjie
public let transId: Int32
```

**功能：** 表示读请求的传输ID，server端回复响应时需填写相同的传输ID。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### DescriptorReadRequest(String, Int32, Int32, String, String, String)

```cangjie
public DescriptorReadRequest(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let deviceId: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let transId: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let offset: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let descriptorUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let serviceUuid: String
)
```

**功能：** DescriptorReadRequest 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|-|表示发送描述符读请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|transId|Int32|否|-|表示读请求的传输ID，server端回复响应时需填写相同的传输ID。|
|offset|Int32|否|-|表示读描述符数据的起始位置。例如：k表示从第k个字节开始读，server端回复响应时需填写相同的offset。|
|descriptorUuid|String|否|-|表示描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|

## class DescriptorWriteRequest

```cangjie
public class DescriptorWriteRequest {
    public DescriptorWriteRequest(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let deviceId: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let transId: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let offset: Int32,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let isPrepared: Bool,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let needRsp: Bool,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let value: Array<Byte>,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let descriptorUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public let serviceUuid: String
    )
}
```

**功能：** 描述server端订阅后收到的描述符写请求事件参数类。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let descriptorUuid

```cangjie
public let descriptorUuid: String
```

**功能：** 表示描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示发送描述符写请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let isPrepared

```cangjie
public let isPrepared: Bool
```

**功能：** 表示写请求是否立即执行。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let needRsp

```cangjie
public let needRsp: Bool
```

**功能：** 表示是否要给client端回复响应。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let offset

```cangjie
public let offset: Int32
```

**功能：** 表示写描述符数据的起始位置。例如：k表示从第k个字节开始写，server端回复响应时需填写相同的offset。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let transId

```cangjie
public let transId: Int32
```

**功能：** 表示写请求的传输ID，server端回复响应时需填写相同的传输ID。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let value

```cangjie
public let value: Array<Byte>
```

**功能：** 表示写入的描述符二进制数据。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### DescriptorWriteRequest(String, Int32, Int32, Bool, Bool, Array\<Byte>, String, String, String)

```cangjie
public DescriptorWriteRequest(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let deviceId: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let transId: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let offset: Int32,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let isPrepared: Bool,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let needRsp: Bool,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let value: Array<Byte>,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let descriptorUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public let serviceUuid: String
)
```

**功能：** DescriptorWriteRequest 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|-|表示发送描述符写请求的远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|transId|Int32|否|-|表示写请求的传输ID，server端回复响应时需填写相同的传输ID。|
|offset|Int32|否|-|表示写描述符数据的起始位置。例如：k表示从第k个字节开始写，server端回复响应时需填写相同的offset。|
|isPrepared|Bool|否|-|表示写请求是否立即执行。|
|needRsp|Bool|否|-|表示是否要给client端回复响应。|
|value|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|表示写入的描述符二进制数据。|
|descriptorUuid|String|否|-|表示描述符（descriptor）的UUID，例如：00002902-0000-1000-8000-00805f9b34fb。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|

## class GattClientDevice

```cangjie
public class GattClientDevice {}
```

**功能：** client端类。使用client端方法之前需要创建该类的实例进行操作，通过[createGattClientDevice(String)](#func-creategattclientdevicestring)方法构造此实例。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 关闭客户端功能，注销client在协议栈的注册，调用该接口后[GattClientDevice](#class-gattclientdevice)实例将不能再使用。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    gattClient.close()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func connect()

```cangjie
public func connect(): Unit
```

**功能：** client端发起连接远端蓝牙低功耗设备。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    gattClient.connect()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func disconnect()

```cangjie
public func disconnect(): Unit
```

**功能：** client端断开与远端蓝牙低功耗设备的连接。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    gattClient.disconnect()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func getDeviceName()

```cangjie
public func getDeviceName(): String
```

**功能：** client获取远端蓝牙低功耗设备名。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|client获取对端server设备名。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter.Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    let server = gattClient.getDeviceName()
    Hilog.info(0, "Bluetooth", "device name " + server)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func getRssiValue((?BusinessException,?Int32) -> Unit)

```cangjie
public func getRssiValue(callback: (?BusinessException, ?Int32) -> Unit): Unit
```

**功能：** client获取远端蓝牙低功耗设备的信号强度（Received Signal Strength Indication, RSSI），调用[connect](#func-connect)接口连接成功后才能使用。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|callback|(?[BusinessException](<font color="red" face="bold">please add link</font>),?Int32)->Unit|是|-|返回信号强度，单位&nbsp;dBm，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 2900099 | Operation failed. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    gattClient.getRssiValue {
        error: ?BusinessException, rssi: ?Int32 =>
        if (let Some(e) <- error) {
            throw e
        }
        Hilog.info(0, "Bluetooth", "the rssi value is " + rssi.getOrThrow().toString())
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func getServices()

```cangjie
public func getServices(): Array<GattService>
```

**功能：** client端获取蓝牙低功耗设备的所有服务，即服务发现。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[GattService](#class-gattservice)>|<font color="red" face="bold">please add description</font>|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    let services = gattClient.getServices()
    Hilog.info(0, "Bluetooth", "getServices success")
    for (service in services) {
        Hilog.info(0, "Bluetooth", "find serviceUuid : ${service.serviceUuid}")
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func off(BluetoothBleGattClientDeviceCallbackType, ?CallbackObject)

```cangjie
public func off(`type`: BluetoothBleGattClientDeviceCallbackType, callback!: ?CallbackObject = None): Unit
```

**功能：** 取消订阅 client 端蓝牙低功耗设备事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|?[CallbackObject](<font color="red" face="bold">please add link</font>)|否|None|**命名参数。** 取消订阅 client 端蓝牙低功耗设备事件。不填该参数则取消订阅该type对应的所有回调。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
let device = "XX:XX:XX:XX:XX:XX"
var connectState = STATE_DISCONNECTED
class BLEConnectionStateChangeCallback <: Callback1Argument<BLEConnectionChangeState> {
    public func invoke(stateInfo: BLEConnectionChangeState): Unit {
        Hilog.info(0, "Bluetooth", "onGattServerStateChange: device=" + stateInfo.deviceId + ", state=" + stateInfo.state.toString())
        if (stateInfo.deviceId == device) {
            connectState = stateInfo.state
        }
    }
}

let bleConnectionStateChangeCallback = BLEConnectionStateChangeCallback()
try {
    gattClient.on(BLE_CONNECTION_STATE_CHANGE, bleConnectionStateChangeCallback)
    gattClient.off(BLE_CONNECTION_STATE_CHANGE, callback: bleConnectionStateChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattClientDeviceCallbackType, Callback1Argument\<BLECharacteristic>)

```cangjie
public func on(`type`: BluetoothBleGattClientDeviceCallbackType, callback: Callback1Argument<BLECharacteristic>): Unit
```

**功能：** client端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLECharacteristic](#class-blecharacteristic)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core@atomicservice@since 12 |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattClient.on(BluetoothBleGattClientDeviceCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattClientDeviceCallbackType, Callback1Argument\<BLEConnectionChangeState>)

```cangjie
public func on(
    `type`: BluetoothBleGattClientDeviceCallbackType,
    callback: Callback1Argument<BLEConnectionChangeState>
): Unit
```

**功能：** client端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLEConnectionChangeState](#class-bleconnectionchangestate)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattClient.on(BluetoothBleGattClientDeviceCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattClientDeviceCallbackType, Callback1Argument\<Int32>)

```cangjie
public func on(`type`: BluetoothBleGattClientDeviceCallbackType, callback: Callback1Argument<Int32>): Unit
```

**功能：** client端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<Int32>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattClient.on(BluetoothBleGattClientDeviceCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func readCharacteristicValue(BLECharacteristic, (?BusinessException,?BLECharacteristic) -> Unit)

```cangjie
public func readCharacteristicValue(
    characteristic: BLECharacteristic,
    callback: (?BusinessException, ?BLECharacteristic) -> Unit
): Unit
```

**功能：** client端读取蓝牙低功耗设备特定服务的特征值。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|characteristic|[BLECharacteristic](#class-blecharacteristic)|是|-|待读取的特征值。|
|callback|(?[BusinessException](<font color="red" face="bold">please add link</font>),?[BLECharacteristic](#class-blecharacteristic))->Unit|是|-|client读取特征值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901000 | Read forbidden. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

// 创建descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
// 创建characteristics
let descriptors: Array<BLEDescriptor> = [descriptor]
let charBuffer: Array<Byte> = [21, 22]
let properties = GattProperties()

let characteristic: BLECharacteristic = BLECharacteristic(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    charBuffer,
    descriptors,
    properties
)

try {
    gattClient.readCharacteristicValue(characteristic) {
        error: ?BusinessException, outData: ?BLECharacteristic =>
        if (let Some(e) <- error) {
            throw e
        }
        if (let Some(c) <- outData) {
            Hilog.info(0, "Bluetooth", "read characteristic value uuid is ${c.characteristicUuid}")
            let message = StringBuilder("logCharacteristic value: ")
            for (i in 0..c.characteristicValue.size) {
                message.append(c.characteristicValue[i])
            }
            Hilog.info(0, "Bluetooth", message.toString())
        }
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func readDescriptorValue(BLEDescriptor, (?BusinessException,?BLEDescriptor) -> Unit)

```cangjie
public func readDescriptorValue(descriptor: BLEDescriptor, callback: (?BusinessException, ?BLEDescriptor) -> Unit): Unit
```

**功能：** client端读取蓝牙低功耗设备特定的特征包含的描述符。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|[BLEDescriptor](#class-bledescriptor)|是|-|待读取的描述符。|
|callback|(?[BusinessException](<font color="red" face="bold">please add link</font>),?[BLEDescriptor](#class-bledescriptor))->Unit|是|-|client读取描述符，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901000 | Read forbidden. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002903-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)

try {
    gattClient.readDescriptorValue(descriptor) {
        error: ?BusinessException, outDescriptor: ?BLEDescriptor =>
        if (let Some(e) <- error) {
            throw e
        }
        if (let Some(d) <- outDescriptor) {
            Hilog.info(0, "Bluetooth", "read descriptor value uuid is ${d.descriptorUuid}")
            let message = StringBuilder("logDescriptor value: ")
            for (i in 0..d.descriptorValue.size) {
                message.append(d.descriptorValue[i])
            }
            Hilog.info(0, "Bluetooth", message.toString())
        }
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func setBLEMtuSize(Int32)

```cangjie
public func setBLEMtuSize(mtu: Int32): Unit
```

**功能：** client协商远端蓝牙低功耗设备的最大传输单元（Maximum Transmission Unit, MTU），调用[connect](#func-connect)接口连接成功后才能使用。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|mtu|Int32|是|-|设置范围为22~512字节。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")
    gattClient.setBLEMtuSize(100)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func setCharacteristicChangeIndication(BLECharacteristic, Bool)

```cangjie
public func setCharacteristicChangeIndication(characteristic: BLECharacteristic, enable: Bool): Unit
```

**功能：** 向服务端发送设置通知此特征值请求，需要对端设备的回复。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|characteristic|[BLECharacteristic](#class-blecharacteristic)|是|-|蓝牙低功耗特征。|
|enable|Bool|是|-|启用接收notify设置为true，否则设置为false。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

// 创建descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
// 创建characteristics
let descriptors: Array<BLEDescriptor> = [descriptor]
let charBuffer: Array<Byte> = [21, 22]
let properties = GattProperties()

let characteristic: BLECharacteristic = BLECharacteristic(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    charBuffer,
    descriptors,
    properties
)

try {
    gattClient.setCharacteristicChangeIndication(characteristic, false)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func setCharacteristicChangeNotification(BLECharacteristic, Bool)

```cangjie
public func setCharacteristicChangeNotification(characteristic: BLECharacteristic, enable: Bool): Unit
```

**功能：** 向服务端发送设置通知此特征值请求。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|characteristic|[BLECharacteristic](#class-blecharacteristic)|是|-|蓝牙低功耗特征。|
|enable|Bool|是|-|启用接收notify设置为true，否则设置为false。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

// 创建descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
// 创建characteristics
let descriptors: Array<BLEDescriptor> = [descriptor]
let charBuffer: Array<Byte> = [21, 22]
let properties = GattProperties()

let characteristic: BLECharacteristic = BLECharacteristic(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    charBuffer,
    descriptors,
    properties
)

try {
    gattClient.setCharacteristicChangeNotification(characteristic, false)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func writeCharacteristicValue(BLECharacteristic, GattWriteType, (?BusinessException) -> Unit)

```cangjie
public func writeCharacteristicValue(characteristic: BLECharacteristic, writeType: GattWriteType,
    callback: (?BusinessException) -> Unit): Unit
```

**功能：** client端向低功耗蓝牙设备写入特定的特征值。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|characteristic|[BLECharacteristic](#class-blecharacteristic)|是|-|蓝牙设备特征对应的二进制值及其它参数。|
|writeType|[GattWriteType](#enum-gattwritetype)|是|-|蓝牙设备特征的写入类型。|
|callback|(?[BusinessException](<font color="red" face="bold">please add link</font>))->Unit|是|-|回调函数。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901001 | Write forbidden. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

// 创建descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)

// 创建characteristics
let descriptors: Array<BLEDescriptor> = [descriptor]
let charBuffer: Array<Byte> = [21, 22]
let properties = GattProperties()

let characteristic: BLECharacteristic = BLECharacteristic(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    charBuffer,
    descriptors,
    properties
)

try {
    gattClient.writeCharacteristicValue(characteristic, GattWriteType.WRITE) {
        error: ?BusinessException => if (let Some(e) <- error) {
            throw e
        }
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func writeDescriptorValue(BLEDescriptor, (?BusinessException) -> Unit)

```cangjie
public func writeDescriptorValue(descriptor: BLEDescriptor, callback: (?BusinessException) -> Unit): Unit
```

**功能：** client端向低功耗蓝牙设备特定的描述符写入二进制数据。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|descriptor|[BLEDescriptor](#class-bledescriptor)|是|-|蓝牙设备描述符的二进制值及其它参数。|
|callback|(?[BusinessException](<font color="red" face="bold">please add link</font>))->Unit|是|-|回调函数。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901001 | Write forbidden. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002903-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
let descriptors: BLEDescriptor = descriptor
let charBuffer: Array<Byte> = [1, 2]
let properties = GattProperties()

try {
    gattClient.writeDescriptorValue(descriptors) {
        error: ?BusinessException => if (let Some(e) <- error) {
            throw e
        }
    }
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## class GattProperties

```cangjie
public class GattProperties {
    public GattProperties(
        let write!: Bool = true,
        let writeNoResponse!: Bool = true,
        let read!: Bool = true,
        let notify!: Bool = false,
        let indicate!: Bool = false
    )
}
```

**功能：** 描述gatt characteristic的属性。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### GattProperties(Bool, Bool, Bool, Bool, Bool)

```cangjie
public GattProperties(
    let write!: Bool = true,
    let writeNoResponse!: Bool = true,
    let read!: Bool = true,
    let notify!: Bool = false,
    let indicate!: Bool = false
)
```

**功能：** GattProperties构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|write|Bool|否|true|**命名参数。** 表示该特征支持写操作，true表示需要对端设备的回复。|
|writeNoResponse|Bool|否|true|**命名参数。** true表示该特征支持写操作，无需对端设备回复。|
|read|Bool|否|true|**命名参数。** true表示该特征支持读操作。|
|notify|Bool|否|false|**命名参数。** true表示该特征可通知对端设备。|
|indicate|Bool|否|false|**命名参数。** true表示该特征可通知对端设备，需要对端设备的回复。|

## class GattServer

```cangjie
public class GattServer {}
```

**功能：** server端类。使用server端方法之前需要创建该类的实例进行操作，通过[createGattServer()](#func-creategattserver)方法构造此实例。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func addService(GattService)

```cangjie
public func addService(service: GattService): Unit
```

**功能：** server端添加服务。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|service|[GattService](#class-gattservice)|是|-|服务端的service数据。BLE广播的相关参数。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 创建descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptors0 = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
let descriptors1 = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002903-0000-1000-8000-00805F9B34FB",
    descBuffer
)

// 创建characteristics
let descriptors: Array<BLEDescriptor> = [descriptors0, descriptors1]
let charBuffer: Array<Byte> = [21, 22]
let properties = GattProperties()

let characteristic: BLECharacteristic = BLECharacteristic(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    charBuffer,
    descriptors,
    properties
)

let characteristics: Array<BLECharacteristic> = [characteristic]
let gattService: GattService = GattService(
    "00001810-0000-1000-8000-00805F9B34FB",
    true,
    characteristics,
    Array<GattService>()
)

try {
    //构造gattServer
    let gattServer = createGattServer()
    gattServer.addService(gattService)
} catch (e: BusinessException) {
    AppLog.error("add Service error because ${e}")
}
```

### func close()

```cangjie
public func close(): Unit
```

**功能：** 关闭服务端功能，去掉server在协议栈的注册。调用该接口后[GattServer](#class-gattserver)实例将不能再使用。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattServer = createGattServer()
try {
    gattServer.close()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func notifyCharacteristicChanged(String, NotifyCharacteristic)

```cangjie
public func notifyCharacteristicChanged(deviceId: String, notifyCharacteristic: NotifyCharacteristic): Unit
```

**功能：** server端特征值发生变化时，主动通知已连接的client设备。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|是|-|接收通知的client端设备地址，例如“XX:XX:XX:XX:XX:XX”。|
|notifyCharacteristic|[NotifyCharacteristic](#class-notifycharacteristic)|是|-|通知的特征值数据。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattServer = createGattServer()
try {
    let charBuffer: Array<Byte> = [21, 22]
    let notifyCharacteristic = NotifyCharacteristic(
        "00001810-0000-1000-8000-00805F9B34FB",
        "00001820-0000-1000-8000-00805F9B34FB",
        charBuffer,
        false
    )
    gattServer.notifyCharacteristicChanged("XX:XX:XX:XX:XX:XX", notifyCharacteristic)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func off(BluetoothBleGattServerCallbackType, ?CallbackObject)

```cangjie
public func off(`type`: BluetoothBleGattServerCallbackType, callback!: ?CallbackObject = None): Unit
```

**功能：** server端取消订阅事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|?[CallbackObject](<font color="red" face="bold">please add link</font>)|否|None|**命名参数。** 表示取消订阅事件上报。不填该参数则取消订阅该type对应的所有回调。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
class StateChangeCallback <: Callback1Argument<BLEConnectionChangeState> {
    public func invoke(state: BLEConnectionChangeState): Unit {
        Hilog.info(0, "Bluetooth", "onGattServerStateChange: device=" + state.deviceId + ", state=" + state.state.toString())
    }
}

let stateChangeCallback = StateChangeCallback()
let gattServer = createGattServer()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.CONNECTION_STATE_CHANGE, stateChangeCallback)
    gattServer.off(BluetoothBleGattServerCallbackType.CONNECTION_STATE_CHANGE, callback: stateChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<CharacteristicReadRequest>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<CharacteristicReadRequest>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[CharacteristicReadRequest](#class-characteristicreadrequest)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<CharacteristicWriteRequest>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<CharacteristicWriteRequest>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[CharacteristicWriteRequest](#class-characteristicwriterequest)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<DescriptorReadRequest>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<DescriptorReadRequest>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[DescriptorReadRequest](#class-descriptorreadrequest)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<DescriptorWriteRequest>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<DescriptorWriteRequest>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[DescriptorWriteRequest](#class-descriptorwriterequest)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<BLEConnectionChangeState>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<BLEConnectionChangeState>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLEConnectionChangeState](#class-bleconnectionchangestate)>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(BluetoothBleGattServerCallbackType, Callback1Argument\<Int32>)

```cangjie
public func on(`type`: BluetoothBleGattServerCallbackType, callback: Callback1Argument<Int32>): Unit
```

**功能：** server端订阅MTU状态变化事件。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|type|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|-|<font color="red" face="bold">please add description</font>|
|callback|[Callback1Argument](<font color="red" face="bold">please add link</font>)\<Int32>|是|-|返回MTU字节数的值，通过注册回调函数获取。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// 此处代码可添加在依赖项定义中
let gattServer = createGattServer()
class BLEMtuChangeCallback <: Callback1Argument<Int32> {
    public func invoke(mtu: Int32): Unit {
        Hilog.info(0, "Bluetooth", "mtu change to ${mtu}")
    }
}

let bleMtuChangeCallback = BLEMtuChangeCallback()
try {
    gattServer.on(BluetoothBleGattServerCallbackType.BLE_MTU_CHANGE, bleMtuChangeCallback)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func removeService(String)

```cangjie
public func removeService(serviceUuid: String): Unit
```

**功能：** 删除已添加的服务。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuid|String|是|-|service的UUID，例如“00001810-0000-1000-8000-00805F9B34FB”。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900004 | Profile not supported. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattServer = createGattServer()
try {
    gattServer.removeService("00001810-0000-1000-8000-00805F9B34FB")
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func sendResponse(ServerResponse)

```cangjie
public func sendResponse(serverResponse: ServerResponse): Unit
```

**功能：** server端回复client端的读写请求。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serverResponse|[ServerResponse](#class-serverresponse)|是|-|server端回复的响应数据。|

**异常：**

- BusinessException：对应错误码如下表，详见[xxx错误码](link)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified.2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattServer = createGattServer()
try {
    let rspBuffer = Array<Byte>()
    let serverResponse: ServerResponse = ServerResponse(
        "XX:XX:XX:XX:XX:XX'", 0, 0, 0,
        rspBuffer
    )
    gattServer.sendResponse(serverResponse)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## class GattService

```cangjie
public class GattService {
    public GattService(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var isPrimary: Bool,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristics: Array<BLECharacteristic>,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var includeServices: Array<GattService>
    )
}
```

**功能：** 描述service的接口参数定义。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristics

```cangjie
public var characteristics: Array<BLECharacteristic>
```

**功能：** 当前服务包含的特征列表。

**类型：** Array\<[BLECharacteristic](#class-blecharacteristic)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var includeServices

```cangjie
public var includeServices: Array<GattService>
```

**功能：** 当前服务依赖的其它服务。

**类型：** Array\<[GattService](#class-gattservice)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var isPrimary

```cangjie
public var isPrimary: Bool
```

**功能：** 特如果是主服务设置为true，否则设置为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### GattService(String, Bool, Array\<BLECharacteristic>, Array\<GattService>)

```cangjie
public GattService(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var isPrimary: Bool,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristics: Array<BLECharacteristic>,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var includeServices: Array<GattService>
)
```

**功能：** GattService 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|
|isPrimary|Bool|否|-|如果是主服务设置为true，否则设置为false。|
|characteristics|Array\<[BLECharacteristic](#class-blecharacteristic)>|否|-|当前服务包含的特征列表。|
|includeServices|Array\<[GattService](#class-gattservice)>|否|-|当前服务依赖的其它服务。|

## class ManufactureData

```cangjie
public class ManufactureData {
    public ManufactureData(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var manufactureId: UInt16,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var manufactureValue: Array<Byte>
    )
}
```

**功能：** 描述BLE广播数据包的内容。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureId

```cangjie
public var manufactureId: UInt16
```

**功能：** 表示制造商的ID，由蓝牙SIG分配。

**类型：** UInt16

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureValue

```cangjie
public var manufactureValue: Array<Byte>
```

**功能：** 表示制造商发送的制造商数据。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### ManufactureData(UInt16, Array\<Byte>)

```cangjie
public ManufactureData(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureId: UInt16,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var manufactureValue: Array<Byte>
)
```

**功能：** ManufactureData 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|manufactureId|UInt16|否|-|表示制造商的ID，由蓝牙SIG分配。|
|manufactureValue|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|表示制造商发送的制造商数据。|

## class NotifyCharacteristic

```cangjie
public class NotifyCharacteristic {
    public NotifyCharacteristic(
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var serviceUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicUuid: String,
        @!APILevel[
            21,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var characteristicValue: Array<Byte>,
        @!APILevel[
            21,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Communication.Bluetooth.Core"
        ]
        public var confirm: Bool
    )
}
```

**功能：** 描述server端特征值变化时发送的特征通知参数定义。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristicUuid

```cangjie
public var characteristicUuid: String
```

**功能：** 特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var characteristicValue

```cangjie
public var characteristicValue: Array<Byte>
```

**功能：** 特征对应的二进制值。

**类型：** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var confirm

```cangjie
public var confirm: Bool
```

**功能：** 如果是indication，对端需要回复确认，则设置为true；如果是notification，对端不需要回复确认，则设置为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**功能：** 特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### NotifyCharacteristic(String, String, Array\<Byte>, Bool)

```cangjie
public NotifyCharacteristic(
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var serviceUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicUuid: String,
    @!APILevel[
        21,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var characteristicValue: Array<Byte>,
    @!APILevel[
        21,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Communication.Bluetooth.Core"
    ]
    public var confirm: Bool
)
```

**功能：** NotifyCharacteristic 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|serviceUuid|String|否|-|特定服务（service）的UUID，例如：00001888-0000-1000-8000-00805f9b34fb。|
|characteristicUuid|String|否|-|特定特征（characteristic）的UUID，例如：00002a11-0000-1000-8000-00805f9b34fb。|
|characteristicValue|Array\<[Byte](<font color="red" face="bold">please add link</font>)>|否|-|特征对应的二进制值。|
|confirm|Bool|否|-|如果是indication，对端需要回复确认，则设置为true；如果是notification，对端不需要回复确认，则设置为false。|

## class ScanFilter

```cangjie
public class ScanFilter {
    public var deviceId:?String = None
    public var name:?String = None
    public var serviceUuid:?String = None
    public var serviceUuidMask:?String = None
    public var serviceSolicitationUuid:?String = None
    public var serviceSolicitationUuidMask:?String = None
    public var serviceData:?Array<Byte>= None
    public var serviceDataMask:?Array<Byte>= None
    public var manufactureId: UInt16 = 0
    public var manufactureData:?Array<Byte>= None
    public var manufactureDataMask:?Array<Byte>= None
    public init()
}
```

**功能：** 扫描过滤参数。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var deviceId

```cangjie
public var deviceId:?String = None
```

**功能：** 表示过滤的BLE设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureData

```cangjie
public var manufactureData:?Array<Byte>= None
```

**功能：** 表示过滤包含该制造商相关数据的设备，例如：[0x1F,0x2F,0x3F]。

**类型：** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureDataMask

```cangjie
public var manufactureDataMask:?Array<Byte>= None
```

**功能：** 表示过滤包含该制造商相关数据掩码的设备，例如：[0xFF,0xFF,0xFF]。

**类型：** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var manufactureId

```cangjie
public var manufactureId: UInt16 = 0
```

**功能：** 表示过滤包含该制造商ID的设备，例如：0x0006。

**类型：** UInt16

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var name

```cangjie
public var name:?String = None
```

**功能：** 表示过滤的BLE设备名。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceData

```cangjie
public var serviceData:?Array<Byte>= None
```

**功能：** 表示过滤包含该服务相关数据的设备，例如：[0x90,0x00,0xF1,0xF2]。

**类型：** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceDataMask

```cangjie
public var serviceDataMask:?Array<Byte>= None
```

**功能：** 表示过滤包含该服务相关数据掩码的设备，例如：[0xFF,0xFF,0xFF,0xFF]。

**类型：** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceSolicitationUuid

```cangjie
public var serviceSolicitationUuid:?String = None
```

**功能：** 表示过滤包含该UUID服务请求的设备，例如：00001888-0000-1000-8000-00805F9B34FB。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceSolicitationUuidMask

```cangjie
public var serviceSolicitationUuidMask:?String = None
```

**功能：** 表示过滤包含该UUID服务请求掩码的设备，例如：FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid:?String = None
```

**功能：** 表示过滤包含该UUID服务的设备，例如：00001888-0000-1000-8000-00805f9b34fb。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuidMask

```cangjie
public var serviceUuidMask:?String = None
```

**功能：** 表示过滤包含该UUID服务掩码的设备，例如：FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### init()

```cangjie
public init()
```

**功能：** 创建扫描过滤参数结构体ScanFilter。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

## class ScanOptions

```cangjie
public class ScanOptions {
    public var interval: Int32 = 0
    public var dutyMode: ScanDuty = SCAN_MODE_LOW_POWER
    public var matchMode: MatchMode = MATCH_MODE_AGGRESSIVE
    public var phyType: PhyType = PHY_LE_1M
    public init(interval: Int32, dutyMode: ScanDuty, matchMode: MatchMode, phyType: PhyType)
}
```

**功能：** 扫描的配置参数。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var dutyMode

```cangjie
public var dutyMode: ScanDuty = SCAN_MODE_LOW_POWER
```

**功能：** 表示扫描模式，默认值为SCAN_MODE_LOW_POWER。

**类型：** [ScanDuty](#enum-scanduty)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var interval

```cangjie
public var interval: Int32 = 0
```

**功能：** 表示扫描结果上报延迟时间，默认值为0。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var matchMode

```cangjie
public var matchMode: MatchMode = MATCH_MODE_AGGRESSIVE
```

**功能：** 表示硬件的过滤匹配模式，默认值为MATCH_MODE_AGGRESSIVE。

**类型：** [MatchMode](#enum-matchmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var phyType

```cangjie
public var phyType: PhyType = PHY_LE_1M
```

**功能：** 表示扫描中使用的PHY类型。

**类型：** [PhyType](#enum-phytype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### init(Int32, ScanDuty, MatchMode, PhyType)

```cangjie
public init(interval: Int32, dutyMode: ScanDuty, matchMode: MatchMode, phyType: PhyType)
```

**功能：** 创建扫描的配置参数结构体ScanOptions。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|interval|Int32|是|表示扫描结果上报延迟时间，初始值为0。|
|dutyMode|[ScanDuty](#enum-scanduty)|是|表示扫描模式，初始值为SCAN_MODE_LOW_POWER。|
|matchMode|[MatchMode](#enum-matchmode)|是|表示硬件的过滤匹配模式，初始值为MATCH_MODE_AGGRESSIVE。|
|phyType|[PhyType](#enum-phytype)|是|表示扫描中使用的PHY类型。|

## class ScanResult

```cangjie
public class ScanResult {}
```

**功能：** 扫描结果上报数据。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let connectable

```cangjie
public let connectable: Bool
```

**功能：** 表示扫描到的设备是否可连接。true表示可连接，false表示不可连接。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let data

```cangjie
public let data: Array<Byte>
```

**功能：** 表示扫描到的设备发送的广播包。

**类型：** Array\<Byte>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示扫描到的设备地址，例如："XX:XX:XX:XX:XX:XX"。基于信息安全考虑，此处获取的设备地址为随机MAC地址。配对成功后，该地址不会变更；已配对设备取消配对后重新扫描或蓝牙服务下电时，该随机地址会变更。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceName

```cangjie
public let deviceName: String
```

**功能：** 表示扫描到的设备名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let rssi

```cangjie
public let rssi: Int32
```

**功能：** 表示扫描到的设备的rssi值。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

## class ServerResponse

```cangjie
public class ServerResponse {
    public ServerResponse(
        public let deviceId: String,
        public let transId: Int32,
        public let status: Int32,
        public let offset: Int32,
        public let value: Array<Byte>
    )
}
```

**功能：** 描述server端回复client端读/写请求的响应参数类。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let deviceId

```cangjie
public let deviceId: String
```

**功能：** 表示远端设备地址，例如："XX:XX:XX:XX:XX:XX"。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let offset

```cangjie
public let offset: Int32
```

**功能：** 表示请求的读/写起始位置，与订阅的读/写请求事件携带的offset保持一致。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let status

```cangjie
public let status: Int32
```

**功能：** 表示响应的状态，设置为0即可，表示正常。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let transId

```cangjie
public let transId: Int32
```

**功能：** 表示请求的传输ID，与订阅的读/写请求事件携带的ID保持一致。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### let value

```cangjie
public let value: Array<Byte>
```

**功能：** 表示回复响应的二进制数据。

**类型：** Array\<Byte>

**读写能力：** 只读

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### ServerResponse(String, Int32, Int32, Int32, Array\<Byte>)

```cangjie
public ServerResponse(
    public let deviceId: String,
    public let transId: Int32,
    public let status: Int32,
    public let offset: Int32,
    public let value: Array<Byte>
)
```

**功能：** ServerResponse 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|deviceId|String|是|表示远端设备地址，例如："XX:XX:XX:XX:XX:XX"。|
|transId|Int32|是|表示请求的传输ID，与订阅的读/写请求事件携带的ID保持一致。|
|status|Int32|是|表示响应的状态，设置为0即可，表示正常。|
|offset|Int32|是|表示请求的读/写起始位置，与订阅的读/写请求事件携带的offset保持一致。|
|value|Array\<Byte>|是|表示回复响应的二进制数据。|

## class ServiceData

```cangjie
public class ServiceData {
    public ServiceData(
        public var serviceUuid: String,
        public var serviceValue: Array<Byte>
    )
}
```

**功能：** 描述广播包中服务数据内容。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**功能：** 表示服务的UUID。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### var serviceValue

```cangjie
public var serviceValue: Array<Byte>
```

**功能：** 表示服务数据。

**类型：** Array\<Byte>

**读写能力：** 可读写

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### ServiceData(String, Array\<Byte>)

```cangjie
public ServiceData(
    public var serviceUuid: String,
    public var serviceValue: Array<Byte>
)
```

**功能：** ServiceData 构造器。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|serviceUuid|String|是|表示服务的UUID。|
|serviceValue|Array\<Byte>|是|表示服务数据。|

## enum AdvertisingState

```cangjie
public enum AdvertisingState <: Equatable<AdvertisingState> & ToString {
    | STARTED
    | ENABLED
    | DISABLED
    | STOPPED
    | ...
}
```

**功能：** 广播状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<AdvertisingState>
- ToString

### DISABLED

```cangjie
DISABLED
```

**功能：** 表示临时停止广播后的状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### ENABLED

```cangjie
ENABLED
```

**功能：** 表示临时启动广播后的状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### STARTED

```cangjie
STARTED
```

**功能：** 表示首次启动广播后的状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### STOPPED

```cangjie
STOPPED
```

**功能：** 表示完全停止广播后的状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(AdvertisingState)

```cangjie
public operator func !=(other: AdvertisingState): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[AdvertisingState](#enum-advertisingstate)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AdvertisingState)

```cangjie
public operator func ==(other: AdvertisingState): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[AdvertisingState](#enum-advertisingstate)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum BluetoothBleCallbackType

```cangjie
public enum BluetoothBleCallbackType <: Equatable<BluetoothBleCallbackType> & Hashable & ToString {
    | ADVERTISING_STATE_CHANGE
    | BLE_DEVICE_FIND
    | ...
}
```

**功能：** 广播扫描订阅事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<BluetoothBleCallbackType>
- Hashable
- ToString

### ADVERTISING_STATE_CHANGE

```cangjie
ADVERTISING_STATE_CHANGE
```

**功能：** 表示广播状态事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLE_DEVICE_FIND

```cangjie
BLE_DEVICE_FIND
```

**功能：** 表示BLE设备发现事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(BluetoothBleCallbackType)

```cangjie
public operator func !=(other: BluetoothBleCallbackType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleCallbackType](#enum-bluetoothblecallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(BluetoothBleCallbackType)

```cangjie
public operator func ==(other: BluetoothBleCallbackType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleCallbackType](#enum-bluetoothblecallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**功能：** 获取输入数据的哈希值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|数据的哈希值。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum BluetoothBleGattClientDeviceCallbackType

```cangjie
public enum BluetoothBleGattClientDeviceCallbackType <: Equatable<BluetoothBleGattClientDeviceCallbackType> & Hashable & ToString {
    | BLE_CHARACTERISTIC_CHANGE
    | BLE_CONNECTION_STATE_CHANGE
    | BLE_MTU_CHANGE
    | ...
}
```

**功能：** 客户端 on/off 事件的类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<BluetoothBleGattClientDeviceCallbackType>
- Hashable
- ToString

### BLE_CHARACTERISTIC_CHANGE

```cangjie
BLE_CHARACTERISTIC_CHANGE
```

**功能：** 表示特征值变化事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLE_CONNECTION_STATE_CHANGE

```cangjie
BLE_CONNECTION_STATE_CHANGE
```

**功能：** 表示连接状态变化事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### BLE_MTU_CHANGE

```cangjie
BLE_MTU_CHANGE
```

**功能：** 表示MTU状态变化事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(BluetoothBleGattClientDeviceCallbackType)

```cangjie
public operator func !=(other: BluetoothBleGattClientDeviceCallbackType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(BluetoothBleGattClientDeviceCallbackType)

```cangjie
public operator func ==(other: BluetoothBleGattClientDeviceCallbackType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**功能：** 获取输入数据的哈希值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|数据的哈希值。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum BluetoothBleGattServerCallbackType

```cangjie
public enum BluetoothBleGattServerCallbackType <: Equatable<BluetoothBleGattServerCallbackType> & Hashable & ToString {
    | CHARACTERISTIC_READ
    | CHARACTERISTIC_WRITE
    | DESCRIPTOR_READ
    | DESCRIPTOR_WRITE
    | CONNECTION_STATE_CHANGE
    | BLE_MTU_CHANGE
    | ...
}
```

**功能：** 服务端 on/off 事件的类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<BluetoothBleGattServerCallbackType>
- Hashable
- ToString

### BLE_MTU_CHANGE

```cangjie
BLE_MTU_CHANGE
```

**功能：** 表示MTU状态变化事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### CHARACTERISTIC_READ

```cangjie
CHARACTERISTIC_READ
```

**功能：** 表示特征值读请求事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### CHARACTERISTIC_WRITE

```cangjie
CHARACTERISTIC_WRITE
```

**功能：** 表示特征值写请求事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### CONNECTION_STATE_CHANGE

```cangjie
CONNECTION_STATE_CHANGE
```

**功能：** 表示BLE连接状态变化事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### DESCRIPTOR_READ

```cangjie
DESCRIPTOR_READ
```

**功能：** 表示描述符读请求事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### DESCRIPTOR_WRITE

```cangjie
DESCRIPTOR_WRITE
```

**功能：** 表示描述符写请求事件类型。

**需要权限：** ohos.permission.ACCESS_BLUETOOTH

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(BluetoothBleGattServerCallbackType)

```cangjie
public operator func !=(other: BluetoothBleGattServerCallbackType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(BluetoothBleGattServerCallbackType)

```cangjie
public operator func ==(other: BluetoothBleGattServerCallbackType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**功能：** 获取输入数据的哈希值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|数据的哈希值。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum GattWriteType

```cangjie
public enum GattWriteType <: Equatable<GattWriteType> & ToString {
    | WRITE
    | WRITE_NO_RESPONSE
    | ...
}
```

**功能：** 表示gatt写入类型。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<GattWriteType>
- ToString

### WRITE

```cangjie
WRITE
```

**功能：** 表示写入特征值，需要对端设备的回复。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### WRITE_NO_RESPONSE

```cangjie
WRITE_NO_RESPONSE
```

**功能：** 表示写入特征值，不需要对端设备的回复。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(GattWriteType)

```cangjie
public operator func !=(other: GattWriteType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[GattWriteType](#enum-gattwritetype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(GattWriteType)

```cangjie
public operator func ==(other: GattWriteType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21
**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[GattWriteType](#enum-gattwritetype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum MatchMode

```cangjie
public enum MatchMode <: Equatable<MatchMode> & ToString {
    | MATCH_MODE_AGGRESSIVE
    | MATCH_MODE_STICKY
    | ...
}
```

**功能：** 硬件过滤匹配模式。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<MatchMode>
- ToString

### MATCH_MODE_AGGRESSIVE

```cangjie
MATCH_MODE_AGGRESSIVE
```

**功能：** 表示硬件上报扫描结果门限较低，比如扫描到的功率较低或者一段时间扫描到的次数较少也触发上报，默认值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### MATCH_MODE_STICKY

```cangjie
MATCH_MODE_STICKY
```

**功能：** 表示硬件上报扫描结果门限较高，更高的功率门限以及扫描到多次才会上报。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(MatchMode)

```cangjie
public operator func !=(other: MatchMode): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[MatchMode](#enum-matchmode)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MatchMode)

```cangjie
public operator func ==(other: MatchMode): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core
**起始版本：** 21
**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[MatchMode](#enum-matchmode)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum PhyType

```cangjie
public enum PhyType <: Equatable<PhyType> & ToString {
    | PHY_LE_1M
    | PHY_LE_ALL_SUPPORTED
    | ...
}
```

**功能：** 广播状态。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<PhyType>
- ToString

### PHY_LE_1M

```cangjie
PHY_LE_1M
```

**功能：** 表示扫描中使用1M PHY。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### PHY_LE_ALL_SUPPORTED

```cangjie
PHY_LE_ALL_SUPPORTED
```

**功能：** 表示扫描中使用蓝牙协议支持的PHY模式。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(PhyType)

```cangjie
public operator func !=(other: PhyType): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[PhyType](#enum-phytype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(PhyType)

```cangjie
public operator func ==(other: PhyType): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[PhyType](#enum-phytype)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|

## enum ScanDuty

```cangjie
public enum ScanDuty <: Equatable<ScanDuty> & ToString {
    | SCAN_MODE_LOW_POWER
    | SCAN_MODE_BALANCED
    | SCAN_MODE_LOW_LATENCY
    | ...
}
```

**功能：** 扫描模式。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**父类型：**

- Equatable\<ScanDuty>
- ToString

### SCAN_MODE_BALANCED

```cangjie
SCAN_MODE_BALANCED
```

**功能：** 表示均衡模式。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### SCAN_MODE_LOW_LATENCY

```cangjie
SCAN_MODE_LOW_LATENCY
```

**功能：** 表示低延迟模式。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### SCAN_MODE_LOW_POWER

```cangjie
SCAN_MODE_LOW_POWER
```

**功能：** 表示低功耗模式，默认值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

### func !=(ScanDuty)

```cangjie
public operator func !=(other: ScanDuty): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[ScanDuty](#enum-scanduty)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(ScanDuty)

```cangjie
public operator func ==(other: ScanDuty): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|other|[ScanDuty](#enum-scanduty)|是|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.Communication.Bluetooth.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|枚举的说明。|
