# ohos.bluetooth.ble (Bluetooth BLE Module)

The BLE module provides methods for Bluetooth operations and management.

## Importing the Module

```cangjie
import kit.ConnectivityKit.*
```

## Permission List

ohos.permission.ACCESS_BLUETOOTH

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## func createGattClientDevice(String)

```cangjie
public func createGattClientDevice(deviceId: String): GattClientDevice
```

**Description:** Creates a usable GattClientDevice instance.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| deviceId | String | Yes | Peer device address, e.g., "XX:XX:XX:XX:XX:XX". |

**Return Value:**

| Type | Description |
|:----|:----|
| [GattClientDevice](#class-gattclientdevice) | Client-side class. An instance of this class must be created to use client-side methods. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |

**Example:**

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

**Description:** Creates a usable GattServer instance.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [GattServer](#class-gattserver) | Returns a Gatt service instance. |

**Example:**

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

**Description:** Unsubscribes from BLE device events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| `type` | [BluetoothBleCallbackType](#enum-bluetoothblecallbacktype) | Yes | - | Callback event. |
| callback | ?[CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject) | No | None | **Named parameter.** Indicates unsubscribing from BLE events. If this parameter is omitted, all callbacks corresponding to the type will be unsubscribed. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900099 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Description:** Subscribes to BLE advertising state changes.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| `type` | [BluetoothBleCallbackType](#enum-bluetoothblecallbacktype) | Yes | Set to ADVERTISING_STATE_CHANGE, indicating the advertising state event. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[AdvertisingStateChangeInfo](#class-advertisingstatechangeinfo)> | Yes | Represents the callback function's parameter, the advertising state. The callback function is created by the user and registered via this interface. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900099 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Description:** Subscribes to BLE device discovery events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| `type` | [BluetoothBleCallbackType](#enum-bluetoothblecallbacktype) | Yes | Set to BLE_DEVICE_FIND, indicating the BLE device discovery event. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<Array\<[ScanResult](#class-scanresult)>> | Yes | Represents the callback function's parameter, the discovered device collection. The callback function is created by the user and registered via this interface. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900099 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Description:** Starts sending BLE advertisements.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| setting | [AdvertiseSetting](#class-advertisesetting) | Yes | - | Parameters related to BLE advertising. |
| advData | [AdvertiseData](#class-advertisedata) | Yes | - | Content of the BLE advertising packet. |
| advResponse | ?[AdvertiseData](#class-advertisedata) | No | None | **Named parameter.** BLE scan response to scan requests. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900001 | Service stopped. |
  | 2900003 | Bluetooth disabled. |
  | 2900099 | Operation failed. |

**Example:**

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

**Function:** Starts sending BLE advertisements.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| advertisingParams | [AdvertisingParams](#class-advertisingparams) | Yes | Parameters related to starting BLE advertising. |

**Return Value:**

| Type | Description |
|:----|:----|
| UInt32 | Advertising ID identifier. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900001 | Service stopped. |
  | 2900003 | Bluetooth disabled. |
  | 2900099 | Operation failed. |

**Example:**

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

**Function:** Initiates the BLE scanning process.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| filters | Array\<[ScanFilter](#class-scanfilter)> | Yes | - | Represents a collection of scan result filtering policies. Only device discoveries that match the filter conditions will be retained. |
| options | ?[ScanOptions](#class-scanoptions) | No | None | **Named parameter.** Represents the configuration parameters for scanning, optional. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900001 | Service stopped. |
  | 2900003 | Bluetooth disabled. |
  | 2900099 | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added in dependency definitions
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

**Function:** Stops sending BLE advertisements.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 801 | Capability not supported. |
  | 2900001 | Service stopped. |
  | 2900003 | Bluetooth disabled. |
  | 2900099 | Operation failed. |

**Example:**

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

**Function:** Stops sending BLE advertisements.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| advertisingId | UInt32 | Yes | The advertising ID identifier to be stopped. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 201 | Permission denied. |
  | 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801 | Capability not supported. |
  | 2900001 | Service stopped. |
  | 2900003 | Bluetooth disabled. |
  | 2900099 | Operation failed. |

**Example:**

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

**Function:** Stops the BLE scanning process.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |201|Permission denied.|
  |801|Capability not supported.|
  |2900001|Service stopped.|
  |2900003|Bluetooth disabled.|
  |2900099|Operation failed.|

**Example:**

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

**Function:** Describes the content of a BLE advertising packet, with a maximum length of 31 bytes.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var includeDeviceName

```cangjie
public var includeDeviceName: Bool = false
```

**Function:** Indicates whether to include the device name (optional parameter). true means include, false or unset means exclude. Note: The total length of the advertising packet must not exceed 31 bytes when including the device name.

**Type:** Bool

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var manufactureData

```cangjie
public var manufactureData: Array<ManufactureData>
```

**Function:** Represents the list of manufacturer information to be broadcast.

**Type:** Array\<[ManufactureData](#class-manufacturedata)>

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceData

```cangjie
public var serviceData: Array<ServiceData>
```

**Function:** Represents the list of service data to be broadcast.

**Type:** Array\<[ServiceData](#class-servicedata)>

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceUuids

```cangjie
public var serviceUuids: Array<String>
```

**Function:** Represents the list of service UUIDs to be broadcast.

**Type:** Array\<String>

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### AdvertiseData(Array\<String>, Array\<ManufactureData>, Array\<ServiceData>, Bool)

```cangjie
public AdvertiseData(
    public var serviceUuids: Array<String>,
    public var manufactureData: Array<ManufactureData>,
    public var serviceData: Array<ServiceData>,
    public var includeDeviceName!: Bool = false
)
```

**Function:** Constructor for AdvertiseData.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|serviceUuids|Array\<String>|Yes|-|List of service UUIDs to be broadcast.|
|manufactureData|Array\<[ManufactureData](#class-manufacturedata)>|Yes|-|List of manufacturer information to be broadcast.|
|serviceData|Array\<[ServiceData](#class-servicedata)>|Yes|-|List of service data to be broadcast.|
|includeDeviceName|Bool|No|false| **Named parameter.** Indicates whether to include the device name (optional). true means include, false or unset means exclude. Note: The total length of the advertising packet must not exceed 31 bytes when including the device name.|

## class AdvertiseSetting

```cangjie
public class AdvertiseSetting {
    public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL
    public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE
    public var connectable: Bool = true
    public init(interval: UInt16, txPower: Int8, connectable: Bool)
}
```

**Function:** Describes the parameters for Bluetooth Low Energy device advertising.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var connectable

```cangjie
public var connectable: Bool = true
```

**Function:** Indicates whether the advertisement is connectable. The default value is true (connectable), false means non-connectable.

**Type:** Bool

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var interval

```cangjie
public var interval: UInt16 = BLE_ADV_DEFAULT_INTERVAL
```

**Function:** Represents the advertising interval. The minimum value is 160 slots (100ms), the maximum is 16384 slots, and the default is 1600 slots (1s).

**Type:** UInt16

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var txPower

```cangjie
public var txPower: Int8 = BLE_ADV_TX_POWER_MEDIUM_VALUE
```

**Function:** Represents the transmission power. The minimum value is -127, the maximum is 1, and the default is -7 (unit: dBm). Recommended values: High (1), Medium (-7), Low (-15).

**Type:** Int8

**Read/Write Access:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### init(UInt16, Int8, Bool)

```cangjie
public init(interval: UInt16, txPower: Int8, connectable: Bool)
```

**Function:** Constructs parameters for Bluetooth Low Energy device advertising.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|interval|UInt16|Yes|-|Advertising interval. Minimum: 160 slots (100ms), Maximum: 16384 slots, Default: 1600 slots (1s).|
|txPower|Int8|Yes|-|Transmission power. Minimum: -127, Maximum: 1, Default: -7 (dBm). Recommended: High (1), Medium (-7), Low (-15).|
|connectable|Bool|Yes|-|Whether the advertisement is connectable. Default: true (connectable), false means non-connectable.|

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

**Function:** Describes the parameters for initial broadcast settings.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var advertisingData

```cangjie
public var advertisingData: AdvertiseData
```

**Function:** Represents the content of the broadcast data packet.

**Type:** [AdvertiseData](#class-advertisedata)

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var advertisingResponse

```cangjie
public var advertisingResponse: AdvertiseData
```

**Function:** Represents the response content for scan requests.

**Type:** [AdvertiseData](#class-advertisedata)

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var advertisingSettings

```cangjie
public var advertisingSettings: AdvertiseSetting
```

**Function:** Represents the parameters related to broadcasting.

**Type:** [AdvertiseSetting](#class-advertisesetting)

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var duration

```cangjie
public var duration: UInt16 = 0
```

**Function:** Represents the duration of the broadcast. Unit is 10ms, valid range is 1 (10ms) to 65535 (655350ms). If this parameter is not specified or set to 0, the broadcast will be sent continuously.

**Type:** UInt16

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Constructor for AdvertisingParams.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| advertisingSettings | [AdvertiseSetting](#class-advertisesetting) | No | - | Represents the parameters related to broadcasting. |
| advertisingData | [AdvertiseData](#class-advertisedata) | No | - | Represents the content of the broadcast data packet. |
| advertisingResponse | [AdvertiseData](#class-advertisedata) | No | - | Represents the response content for scan requests. |
| duration | UInt16 | No | 0 | **Named parameter.** Represents the duration of the broadcast. Unit is 10ms, valid range is 1 (10ms) to 65535 (655350ms). If this parameter is not specified or set to 0, the broadcast will be sent continuously. |

## class AdvertisingStateChangeInfo

```cangjie
public class AdvertisingStateChangeInfo {}
```

**Function:** Describes broadcast state changes such as start and stop.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var advertisingId

```cangjie
public var advertisingId: Int32
```

**Function:** Represents the broadcast ID identifier.

**Type:** Int32

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var state

```cangjie
public var state: AdvertisingState
```

**Function:** Represents the broadcast state.

**Type:** [AdvertisingState](#enum-advertisingstate)

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Describes the interface parameter definitions for a characteristic.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var characteristicUuid

```cangjie
public var characteristicUuid: String
```

**Function:** UUID of the specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb".

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var characteristicValue

```cangjie
public var characteristicValue: Array<Byte>
```

**Function:** Binary value corresponding to the characteristic.

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var descriptors

```cangjie
public var descriptors: Array<BLEDescriptor>
```

**Function:** List of descriptors for the specific characteristic.

**Type:** Array\<[BLEDescriptor](#class-bledescriptor)>

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var properties

```cangjie
public var properties: GattProperties
```

**Function:** Property description of the specific characteristic.

**Type:** [GattProperties](#class-gattproperties)

**Access:** Read-Write

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**Function:** UUID of the specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb".

**Type:** String

**Access:** Read-Write**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Function:** BLECharacteristic constructor.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| serviceUuid | String | No | - | UUID of the specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb". |  
| characteristicUuid | String | No | - | UUID of the specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb". |  
| characteristicValue | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Binary value corresponding to the characteristic. |  
| descriptors | Array\<[BLEDescriptor](#class-bledescriptor)> | No | - | List of descriptors for the specific characteristic. |  
| properties | [GattProperties](#class-gattproperties) | No | - | Property description of the specific characteristic. |  

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

**Function:** Describes the GATT profile connection state.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var state  

```cangjie  
public var state: ProfileConnectionState  
```  

**Function:** Enumeration representing the BLE connection state.  

**Type:** [ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate)  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### let deviceId  

```cangjie  
public let deviceId: String  
```  

**Function:** Represents the remote device address, e.g., "XX:XX:XX:XX:XX:XX".  

**Type:** String  

**Read/Write Capability:** Read-only  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Function:** BLEConnectionChangeState constructor.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| deviceId | String | No | - | Represents the remote device address, e.g., "XX:XX:XX:XX:XX:XX". |  
| state | [ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate) | No | - | Enumeration representing the BLE connection state. |  

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

**Function:** Interface parameter definition for describing a descriptor.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var characteristicUuid  

```cangjie  
public var characteristicUuid: String  
```  

**Function:** UUID of the specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb".  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var descriptorUuid  

```cangjie  
public var descriptorUuid: String  
```  

**Function:** UUID of the descriptor, e.g., "00002902-0000-1000-8000-00805f9b34fb".  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var descriptorValue  

```cangjie  
public var descriptorValue: Array<Byte>  
```  

**Function:** Binary value corresponding to the descriptor.  

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var serviceUuid  

```cangjie  
public var serviceUuid: String  
```  

**Function:** UUID of the specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb".  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Function:** BLEDescriptor constructor.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| serviceUuid | String | No | - | UUID of the specific service, e.g., 00001888-0000-1000-8000-00805f9b34fb. |
| characteristicUuid | String | No | - | UUID of the specific characteristic, e.g., 00002a11-0000-1000-8000-00805f9b34fb. |
| descriptorUuid | String | No | - | UUID of the descriptor, e.g., 00002902-0000-1000-8000-00805f9b34fb. |
| descriptorValue | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Binary value corresponding to the descriptor. |

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

**Function:** Describes the event parameter class for characteristic value read requests received after server-side subscription.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**Function:** UUID of the specific characteristic, e.g., 00002a11-0000-1000-8000-00805f9b34fb.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the remote device address that sent the characteristic value read request, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let offset

```cangjie
public let offset: Int32
```

**Function:** Represents the starting position for reading characteristic value data. For example, k indicates reading from the k-th byte. The server must return the same offset in its response.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**Function:** UUID of the specific service, e.g., 00001888-0000-1000-8000-00805f9b34fb.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let transId

```cangjie
public let transId: Int32
```

**Function:** Represents the transaction ID of the read request. The server must return the same transaction ID in its response.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** CharacteristicReadRequest constructor.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | No | - | Remote device address that sent the characteristic value read request, e.g., "XX:XX:XX:XX:XX:XX". |
| transId | Int32 | No | - | Transaction ID of the read request. The server must return the same transaction ID in its response. |
| offset | Int32 | No | - | Starting position for reading characteristic value data. For example, k indicates reading from the k-th byte. The server must return the same offset in its response. |
| characteristicUuid | String | No | - | UUID of the specific characteristic, e.g., 00002a11-0000-1000-8000-00805f9b34fb. |
| serviceUuid | String | No | - | UUID of the specific service, e.g., 00001888-0000-1000-8000-00805f9b34fb. |

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
**Function:** Describes the event parameter class for characteristic write requests received after server-side subscription.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**Function:** The UUID of a specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb".

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the address of the scanned device, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let isPrepared

```cangjie
public let isPrepared: Bool
```

**Function:** Indicates whether the write request should be executed immediately. `true` means immediate execution.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let needRsp

```cangjie
public let needRsp: Bool
```

**Function:** Indicates whether a response should be sent back to the client.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let offset

```cangjie
public let offset: Int32
```

**Function:** Represents the starting position for writing descriptor data. For example, `k` means writing starts from the k-th byte. The server must use the same offset when responding.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**Function:** The UUID of a specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb".

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let transId

```cangjie
public let transId: Int32
```

**Function:** Represents the transaction ID of the write request. The server must use the same transaction ID when responding.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let value

```cangjie
public let value: Array<Byte>
```

**Function:** Represents the binary data of the descriptor to be written.

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Constructor for CharacteristicWriteRequest.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | No | - | Represents the address of the remote device sending the characteristic write request, e.g., "XX:XX:XX:XX:XX:XX". |
| transId | Int32 | No | - | Represents the transaction ID of the write request. The server must use the same transaction ID when responding. |
| offset | Int32 | No | - | Represents the starting position for writing characteristic data. For example, `k` means writing starts from the k-th byte. The server must use the same offset when responding. |
| isPrepared | Bool | No | - | Indicates whether the write request should be executed immediately. `true` means immediate execution. |
| needRsp | Bool | No | - | Indicates whether a response should be sent back to the client. `true` means a response is required. |
| value | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Represents the binary data of the descriptor to be written. |
| characteristicUuid | String | No | - | The UUID of a specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb". |
| serviceUuid | String | No | - | The UUID of a specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb". |

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

**Function:** Describes the event parameter class for descriptor read requests received after server-side subscription.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**Function:** The UUID of a specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb".

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21### let descriptorUuid

```cangjie
public let descriptorUuid: String
```

**Function:** Represents the UUID of a descriptor, e.g., "00002902-0000-1000-8000-00805f9b34fb".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the address of the remote device that sent the descriptor read request, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let offset

```cangjie
public let offset: Int32
```

**Function:** Represents the starting position for reading descriptor data. For example, `k` indicates reading starts from the k-th byte. The server must use the same offset when responding.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**Function:** Represents the UUID of a specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let transId

```cangjie
public let transId: Int32
```

**Function:** Represents the transaction ID of the read request. The server must use the same transaction ID when responding.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Constructor for `DescriptorReadRequest`.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | No | - | Address of the remote device that sent the descriptor read request, e.g., "XX:XX:XX:XX:XX:XX". |
| transId | Int32 | No | - | Transaction ID of the read request. The server must use the same transaction ID when responding. |
| offset | Int32 | No | - | Starting position for reading descriptor data. The server must use the same offset when responding. |
| descriptorUuid | String | No | - | UUID of the descriptor, e.g., "00002902-0000-1000-8000-00805f9b34fb". |
| characteristicUuid | String | No | - | UUID of the specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb". |
| serviceUuid | String | No | - | UUID of the specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb". |

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

**Function:** Represents the event parameters for descriptor write requests received by the server after subscription.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let characteristicUuid

```cangjie
public let characteristicUuid: String
```

**Function:** Represents the UUID of a specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let descriptorUuid

```cangjie
public let descriptorUuid: String
```

**Function:** Represents the UUID of a descriptor, e.g., "00002902-0000-1000-8000-00805f9b34fb".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the address of the remote device that sent the descriptor write request, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let isPrepared

```cangjie
public let isPrepared: Bool
```

**Function:** Indicates whether the write request is executed immediately.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let needRsp
```cangjie
public let needRsp: Bool
```

**Function:** Indicates whether to send a response to the client.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let offset

```cangjie
public let offset: Int32
```

**Function:** Indicates the starting position for writing descriptor data. For example, `k` means writing starts from the k-th byte. The server must fill in the same offset when responding.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let serviceUuid

```cangjie
public let serviceUuid: String
```

**Function:** UUID of a specific service, e.g., `00001888-0000-1000-8000-00805f9b34fb`.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let transId

```cangjie
public let transId: Int32
```

**Function:** Indicates the transaction ID of the write request. The server must fill in the same transaction ID when responding.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let value

```cangjie
public let value: Array<Byte>
```

**Function:** Represents the binary data of the descriptor to be written.

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Constructor for DescriptorWriteRequest.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | No | - | Indicates the remote device address sending the descriptor write request, e.g., "XX:XX:XX:XX:XX:XX". |
| transId | Int32 | No | - | Indicates the transaction ID of the write request. The server must fill in the same transaction ID when responding. |
| offset | Int32 | No | - | Indicates the starting position for writing descriptor data. For example, `k` means writing starts from the k-th byte. The server must fill in the same offset when responding. |
| isPrepared | Bool | No | - | Indicates whether the write request should be executed immediately. |
| needRsp | Bool | No | - | Indicates whether to send a response to the client. |
| value | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Represents the binary data of the descriptor to be written. |
| descriptorUuid | String | No | - | Indicates the UUID of the descriptor, e.g., "00002902-0000-1000-8000-00805f9b34fb". |
| characteristicUuid | String | No | - | UUID of a specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb". |
| serviceUuid | String | No | - | UUID of a specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb". |

## class GattClientDevice

```cangjie
public class GattClientDevice {}
```

**Function:** Client-side class. An instance of this class must be created to use client-side methods, constructed via the [createGattClientDevice(String)](#func-creategattclientdevicestring) method.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Function:** Closes the client functionality, deregisters the client from the protocol stack. After calling this method, the [GattClientDevice](#class-gattclientdevice) instance can no longer be used.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Function:** Initiates a connection to a remote Bluetooth Low Energy (BLE) device from the client side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Function:** Disconnects the client from a remote Bluetooth Low Energy (BLE) device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. || 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Client retrieves the remote Bluetooth Low Energy (BLE) device name.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The peer server device name obtained by the client. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Client retrieves the Received Signal Strength Indication (RSSI) of the remote BLE device. This can only be used after successfully calling the [connect](#func-connect) interface.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| callback | (?[BusinessException](<font color="red" face="bold">please add link</font>),?Int32)->Unit | Yes | - | Returns the signal strength in dBm, obtained via the registered callback function. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 2900099 | Operation failed. |

**Example:**

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

**Description:** Client retrieves all services of the BLE device, i.e., service discovery.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[GattService](#class-gattservice)> | <font color="red" face="bold">please add description</font> |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Unsubscribes from client-side BLE device events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | ?[CallbackObject](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Unsubscribes from client-side BLE device events. If this parameter is not provided, all callbacks corresponding to the type will be unsubscribed. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Client subscribes to MTU state change events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLECharacteristic](#class-blecharacteristic)> | Yes | - | Returns the MTU byte count value, obtained via the registered callback function. |

**Exceptions:**

- BusinessException: Error codes are listed below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported.@syscap SystemCapability.Communication.Bluetooth.Core@atomicservice@since 12 |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Function:** Client subscribes to MTU state change events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLEConnectionChangeState](#class-bleconnectionchangestate)> | Yes | - | Returns the MTU byte count value, obtained through registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Function:** Client subscribes to MTU state change events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<Int32> | Yes | - | Returns the MTU byte count value, obtained through registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// This code can be added to dependency definitions
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

**Function:** Client reads the characteristic value of a specific service on a Bluetooth Low Energy (BLE) device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| characteristic | [BLECharacteristic](#class-blecharacteristic) | Yes | - | The characteristic value to be read. |
| callback | (?[BusinessException](<font color="red" face="bold">please add link</font>),?[BLECharacteristic](#class-blecharacteristic))->Unit | Yes | - | Client reads the characteristic value, obtained through registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901000 | Read forbidden. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")

// Create descriptors
let descBuffer: Array<Byte> = [31, 32]
let descriptor = BLEDescriptor(
    "00001810-0000-1000-8000-00805F9B34FB",
    "00001820-0000-1000-8000-00805F9B34FB",
    "00002902-0000-1000-8000-00805F9B34FB",
    Array<Byte>(2, repeat: 0)
)
// Create characteristics
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

**Function:** Client reads the descriptor contained in a specific characteristic of a BLE device.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| descriptor | [BLEDescriptor](#class-bledescriptor) | Yes | - | The descriptor to be read. |
| callback | (?[BusinessException](<font color="red" face="bold">please add link</font>),?[BLEDescriptor](#class-bledescriptor))->Unit | Yes | - | Client reads the descriptor, obtained through registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901000 | Read forbidden. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Function:** Client negotiates the Maximum Transmission Unit (MTU) with the remote BLE device. This can only be used after successfully calling the [connect](#func-connect) interface.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| mtu | Int32 | Yes | - | The setting range is 22~512 bytes. |  

**Exceptions:**  

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).  

| Error Code ID | Error Message |  
| :---- | :--- |  
| 201 | Permission denied. |  
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |  
| 801 | Capability not supported. |  
| 2900001 | Service stopped. |  
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |  

**Example:**  

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

**Function:** Sends a request to the server to set notifications for this characteristic value, requiring a response from the peer device.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| characteristic | [BLECharacteristic](#class-blecharacteristic) | Yes | - | Bluetooth Low Energy characteristic. |  
| enable | Bool | Yes | - | Set to `true` to enable receiving notifications, otherwise set to `false`. |  

**Exceptions:**  

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).  

| Error Code ID | Error Message |  
| :---- | :--- |  
| 201 | Permission denied. |  
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |  
| 801 | Capability not supported. |  
| 2900001 | Service stopped. |  
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.base.*  
import kit.ConnectivityKit.*  
import ohos.hilog.Hilog  

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")  

// Create descriptors  
let descBuffer: Array<Byte> = [31, 32]  
let descriptor = BLEDescriptor(  
    "00001810-0000-1000-8000-00805F9B34FB",  
    "00001820-0000-1000-8000-00805F9B34FB",  
    "00002902-0000-1000-8000-00805F9B34FB",  
    Array<Byte>(2, repeat: 0)  
)  
// Create characteristics  
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

**Function:** Sends a request to the server to set notifications for this characteristic value.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| characteristic | [BLECharacteristic](#class-blecharacteristic) | Yes | - | Bluetooth Low Energy characteristic. |  
| enable | Bool | Yes | - | Set to `true` to enable receiving notifications, otherwise set to `false`. |  

**Exceptions:**  

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).  

| Error Code ID | Error Message |  
| :---- | :--- |  
| 201 | Permission denied. |  
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |  
| 801 | Capability not supported. |  
| 2900001 | Service stopped. |  
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.base.*  
import kit.ConnectivityKit.*  
import ohos.hilog.Hilog  

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")  

// Create descriptors  
let descBuffer: Array<Byte> = [31, 32]  
let descriptor = BLEDescriptor(  
    "00001810-0000-1000-8000-00805F9B34FB",  
    "00001820-0000-1000-8000-00805F9B34FB",  
    "00002902-0000-1000-8000-00805F9B34FB",  
    Array<Byte>(2, repeat: 0)  
)  
// Create characteristics  
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

**Function:** The client writes a specific characteristic value to a Bluetooth Low Energy device.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| characteristic | [BLECharacteristic](#class-blecharacteristic) | Yes | - | The binary value and other parameters corresponding to the Bluetooth device characteristic. |  
| writeType | [GattWriteType](#enum-gattwritetype) | Yes | - | The write type for the Bluetooth device characteristic. |  
| callback | (?[BusinessException](<font color="red" face="bold">please add link</font>))->Unit | Yes | - | Callback function. |  

**Exceptions:**  

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).  

| Error Code ID | Error Message |  
| :---- | :--- |  
| 201 | Permission denied. |  
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |  
| 801 | Capability not supported. |  
| 2900001 | Service stopped. |  
| 2901001 | Write forbidden. |  
| 2900099 | Operation failed.@syscap SystemCapability.Communication.Bluetooth.Core |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.base.*  
import kit.ConnectivityKit.*  
import ohos.hilog.Hilog  

let gattClient = createGattClientDevice("XX:XX:XX:XX:XX:XX")  

// Create descriptors  
let descBuffer: Array<Byte> = [31, 32]  
let descriptor = BLEDescriptor(  
    "00001810-0000-1000-8000-00805F9B34FB",  
    "00001820-0000-1000-8000-00805F9B34FB",  
    "00002902-0000-1000-8000-00805F9B34FB",  
    Array<Byte>(2, repeat: 0)  
)  

// Create characteristics  
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

**Function:** The client writes binary data to a specific descriptor of a Bluetooth Low Energy device.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| descriptor | [BLEDescriptor](#class-bledescriptor) | Yes | - | The binary value and other parameters corresponding to the Bluetooth device descriptor. |  
| callback | (?[BusinessException](<font color="red" face="bold">please add link</font>))->Unit | Yes | - | Callback function. |  

**Exceptions:**  

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).  

| Error Code ID | Error Message |  
| :---- | :--- |  
| 201 | Permission denied. || 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2901001 | Write forbidden. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Describes the properties of a GATT characteristic.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Description:** Constructor for GattProperties.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| write | Bool | No | true | **Named parameter.** Indicates whether the characteristic supports write operations, where true indicates a response is required from the peer device. |
| writeNoResponse | Bool | No | true | **Named parameter.** True indicates the characteristic supports write operations without requiring a response from the peer device. |
| read | Bool | No | true | **Named parameter.** True indicates the characteristic supports read operations. |
| notify | Bool | No | false | **Named parameter.** True indicates the characteristic can notify the peer device. |
| indicate | Bool | No | false | **Named parameter.** True indicates the characteristic can notify the peer device and requires a response from the peer device. |

## class GattServer

```cangjie
public class GattServer {}
```

**Description:** Server-side class. An instance of this class must be created to perform server-side operations, constructed via the [createGattServer()](#func-creategattserver) method.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func addService(GattService)

```cangjie
public func addService(service: GattService): Unit
```

**Description:** Adds a service on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| service | [GattService](#class-gattservice) | Yes | - | Service data for the server side. Parameters related to BLE broadcasting. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Create descriptors
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

// Create characteristics
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
    // Construct gattServer
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

**Description:** Closes the server-side functionality and deregisters the server from the protocol stack. After calling this method, the [GattServer](#class-gattserver) instance can no longer be used.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Description:** Actively notifies connected client devices when a characteristic value changes on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| deviceId | String | Yes | - | Address of the client device to receive the notification, e.g., "XX:XX:XX:XX:XX:XX". |
| notifyCharacteristic | [NotifyCharacteristic](#class-notifycharacteristic) | Yes | - | Characteristic value data to be notified. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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
**Function:** Unsubscribe from server-side events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | ?[CallbackObject](<font color="red" face="bold">please add link</font>) | No | None | **Named parameter.** Indicates unsubscribing from event reporting. If this parameter is not provided, all callbacks corresponding to the specified type will be unsubscribed. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code here can be added to dependency definitions
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

**Function:** Subscribe to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[CharacteristicReadRequest](#class-characteristicreadrequest)> | Yes | - | Returns the MTU byte count value, obtained through the registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code here can be added to dependency definitions
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

**Function:** Subscribe to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[CharacteristicWriteRequest](#class-characteristicwriterequest)> | Yes | - | Returns the MTU byte count value, obtained through the registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code here can be added to dependency definitions
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

**Function:** Subscribe to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[DescriptorReadRequest](#class-descriptorreadrequest)> | Yes | - | Returns the MTU byte count value, obtained through the registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code here can be added to dependency definitions
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

**Function:** Subscribe to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[DescriptorWriteRequest](#class-descriptorwriterequest)> | Yes | - | Returns the MTU byte count value, obtained through the registered callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx error codes](link).

| Error Code ID | Error Message |
|:----|:---|
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code here can be added to dependency definitions
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

**Function:** Subscribe to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<[BLEConnectionChangeState](#class-bleconnectionchangestate)> | Yes | - | Returns the MTU byte count value, obtained by registering a callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code can be added in the dependency definition section
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

**Function:** Subscribes to MTU state change events on the server side.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| type | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | - | <font color="red" face="bold">please add description</font> |
| callback | [Callback1Argument](<font color="red" face="bold">please add link</font>)\<Int32> | Yes | - | Returns the MTU byte count value, obtained by registering a callback function. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Code can be added in the dependency definition section
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

**Function:** Removes an added service.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| serviceUuid | String | Yes | - | The UUID of the service, e.g., "00001810-0000-1000-8000-00805F9B34FB". |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900004 | Profile not supported. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Function:** The server responds to read/write requests from the client.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| serverResponse | [ServerResponse](#class-serverresponse) | Yes | - | The response data from the server. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below. For details, see [xxx Error Codes](link).

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | Permission denied. |
| 401 | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 2900001 | Service stopped. |
| 2900003 | Bluetooth disabled. |
| 2900099 | Operation failed. @syscap SystemCapability.Communication.Bluetooth.Core |

**Example:**

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

**Function:** Defines the interface parameters for describing a service.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var characteristics

```cangjie
public var characteristics: Array<BLECharacteristic>
```

**Function:** The list of characteristics included in the current service.

**Type:** Array\<[BLECharacteristic](#class-blecharacteristic)>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var includeServices

```cangjie
public var includeServices: Array<GattService>
```

**Function:** Other services that the current service depends on.

**Type:** Array\<[GattService](#class-gattservice)>

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var isPrimary

```cangjie
public var isPrimary: Bool
```

**Function:** Set to true if it is a primary service; otherwise, set to false.

**Type:** Bool**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var serviceUuid  

```cangjie  
public var serviceUuid: String  
```  

**Description:** The UUID of a specific service, e.g., `00001888-0000-1000-8000-00805f9b34fb`.  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Description:** Constructor for `GattService`.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| serviceUuid | String | No | - | The UUID of a specific service, e.g., `00001888-0000-1000-8000-00805f9b34fb`. |  
| isPrimary | Bool | No | - | Set to `true` if it is a primary service; otherwise, set to `false`. |  
| characteristics | Array\<[BLECharacteristic](#class-blecharacteristic)> | No | - | List of characteristics included in the current service. |  
| includeServices | Array\<[GattService](#class-gattservice)> | No | - | Other services that the current service depends on. |  

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

**Description:** Describes the content of a BLE advertisement packet.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var manufactureId  

```cangjie  
public var manufactureId: UInt16  
```  

**Description:** Represents the manufacturer's ID, assigned by the Bluetooth SIG.  

**Type:** UInt16  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var manufactureValue  

```cangjie  
public var manufactureValue: Array<Byte>  
```  

**Description:** Represents the manufacturer data sent by the manufacturer.  

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Description:** Constructor for `ManufactureData`.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| manufactureId | UInt16 | No | - | Represents the manufacturer's ID, assigned by the Bluetooth SIG. |  
| manufactureValue | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Represents the manufacturer data sent by the manufacturer. |  

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

**Description:** Defines the parameters for characteristic notifications sent when the server-side characteristic value changes.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var characteristicUuid  

```cangjie  
public var characteristicUuid: String  
```  

**Description:** The UUID of a specific characteristic, e.g., `00002a11-0000-1000-8000-00805f9b34fb`.  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var characteristicValue  

```cangjie  
public var characteristicValue: Array<Byte>  
```  

**Description:** The binary value corresponding to the characteristic.  

**Type:** Array\<[Byte](<font color="red" face="bold">please add link</font>)>  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var confirm  

```cangjie  
public var confirm: Bool  
```  

**Description:** Set to `true` if it is an indication requiring acknowledgment from the peer; set to `false` if it is a notification not requiring acknowledgment.  

**Type:** Bool  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

### var serviceUuid  

```cangjie  
public var serviceUuid: String  
```  

**Description:** The UUID of a specific service, e.g., `00001888-0000-1000-8000-00805f9b34fb`.  

**Type:** String  

**Read/Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Initial Version:** 21  

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

**Function:** NotifyCharacteristic constructor.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| serviceUuid | String | No | - | UUID of the specific service, e.g., "00001888-0000-1000-8000-00805f9b34fb". |
| characteristicUuid | String | No | - | UUID of the specific characteristic, e.g., "00002a11-0000-1000-8000-00805f9b34fb". |
| characteristicValue | Array\<[Byte](<font color="red" face="bold">please add link</font>)> | No | - | Binary value corresponding to the characteristic. |
| confirm | Bool | No | - | Set to true if the peer needs to acknowledge for indication; set to false if no acknowledgment is needed for notification. |

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

**Function:** Scan filtering parameters.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var deviceId

```cangjie
public var deviceId:?String = None
```

**Function:** Represents the filtered BLE device address, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var manufactureData

```cangjie
public var manufactureData:?Array<Byte>= None
```

**Function:** Represents filtering devices containing manufacturer-specific data, e.g., [0x1F,0x2F,0x3F].

**Type:** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var manufactureDataMask

```cangjie
public var manufactureDataMask:?Array<Byte>= None
```

**Function:** Represents filtering devices containing manufacturer-specific data mask, e.g., [0xFF,0xFF,0xFF].

**Type:** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var manufactureId

```cangjie
public var manufactureId: UInt16 = 0
```

**Function:** Represents filtering devices containing the manufacturer ID, e.g., 0x0006.

**Type:** UInt16

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var name

```cangjie
public var name:?String = None
```

**Function:** Represents the filtered BLE device name.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceData

```cangjie
public var serviceData:?Array<Byte>= None
```

**Function:** Represents filtering devices containing service-specific data, e.g., [0x90,0x00,0xF1,0xF2].

**Type:** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceDataMask

```cangjie
public var serviceDataMask:?Array<Byte>= None
```

**Function:** Represents filtering devices containing service-specific data mask, e.g., [0xFF,0xFF,0xFF,0xFF].

**Type:** ?Array\<[Byte](<font color="red" face="bold">please add link</font>)>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceSolicitationUuid

```cangjie
public var serviceSolicitationUuid:?String = None
```

**Function:** Represents filtering devices containing the UUID service solicitation, e.g., "00001888-0000-1000-8000-00805F9B34FB".

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceSolicitationUuidMask

```cangjie
public var serviceSolicitationUuidMask:?String = None
```

**Function:** Represents filtering devices containing the UUID service solicitation mask, e.g., "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF".

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceUuid

```cangjie
public var serviceUuid:?String = None
```

**Function:** Represents filtering devices containing the UUID service, e.g., "00001888-0000-1000-8000-00805f9b34fb".

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceUuidMask

```cangjie
public var serviceUuidMask:?String = None
```

**Function:** Represents filtering devices containing the UUID service mask, e.g., "FFFFFFFF-FFFF-FFFF-FFFF-FFFFFFFFFFFF".

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### init()

```cangjie
public init()
```

**Function:** Creates a ScanFilter structure for scan filtering parameters.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Configuration parameters for scanning.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var dutyMode

```cangjie
public var dutyMode: ScanDuty = SCAN_MODE_LOW_POWER
```

**Function:** Represents the scan mode, with a default value of SCAN_MODE_LOW_POWER.

**Type:** [ScanDuty](#enum-scanduty)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var interval

```cangjie
public var interval: Int32 = 0
```

**Function:** Represents the delay time for reporting scan results, with a default value of 0.

**Type:** Int32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21
### var matchMode

```cangjie
public var matchMode: MatchMode = MATCH_MODE_AGGRESSIVE
```

**Function:** Represents the hardware's filtering match mode, with a default value of MATCH_MODE_AGGRESSIVE.

**Type:** [MatchMode](#enum-matchmode)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var phyType

```cangjie
public var phyType: PhyType = PHY_LE_1M
```

**Function:** Represents the PHY type used during scanning.

**Type:** [PhyType](#enum-phytype)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### init(Int32, ScanDuty, MatchMode, PhyType)

```cangjie
public init(interval: Int32, dutyMode: ScanDuty, matchMode: MatchMode, phyType: PhyType)
```

**Function:** Creates a ScanOptions structure for configuring scan parameters.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| interval | Int32 | Yes | Represents the delay time for reporting scan results, with an initial value of 0. |
| dutyMode | [ScanDuty](#enum-scanduty) | Yes | Represents the scan mode, with an initial value of SCAN_MODE_LOW_POWER. |
| matchMode | [MatchMode](#enum-matchmode) | Yes | Represents the hardware's filtering match mode, with an initial value of MATCH_MODE_AGGRESSIVE. |
| phyType | [PhyType](#enum-phytype) | Yes | Represents the PHY type used during scanning. |

## class ScanResult

```cangjie
public class ScanResult {}
```

**Function:** Represents the data reported from scanning results.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let connectable

```cangjie
public let connectable: Bool
```

**Function:** Indicates whether the scanned device is connectable. `true` means connectable, `false` means not connectable.

**Type:** Bool

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let data

```cangjie
public let data: Array<Byte>
```

**Function:** Represents the advertisement packet sent by the scanned device.

**Type:** Array\<Byte>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the address of the scanned device, e.g., "XX:XX:XX:XX:XX:XX". For security considerations, the obtained device address is a randomized MAC address. This address remains unchanged after successful pairing. However, it will change when a paired device is unpaired and rescanned or when the Bluetooth service is powered off.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceName

```cangjie
public let deviceName: String
```

**Function:** Represents the name of the scanned device.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let rssi

```cangjie
public let rssi: Int32
```

**Function:** Represents the RSSI value of the scanned device.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Describes the response parameters class for read/write requests from the server to the client.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Represents the remote device address, e.g., "XX:XX:XX:XX:XX:XX".

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let offset

```cangjie
public let offset: Int32
```

**Function:** Represents the starting position of the read/write request, consistent with the `offset` carried in the subscribed read/write request event.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let status

```cangjie
public let status: Int32
```

**Function:** Represents the response status. Set to 0 to indicate normal.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let transId

```cangjie
public let transId: Int32
```

**Function:** Represents the transaction ID of the request, consistent with the ID carried in the subscribed read/write request event.

**Type:** Int32

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let value

```cangjie
public let value: Array<Byte>
```

**Function:** Represents the binary data of the response.

**Type:** Array\<Byte>

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

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

**Function:** Constructor for ServerResponse.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| deviceId | String | Yes | Represents the remote device address, e.g., "XX:XX:XX:XX:XX:XX". |
| transId | Int32 | Yes | Represents the transaction ID of the request, consistent with the ID carried in the subscribed read/write request event. |
| status | Int32 | Yes | Represents the response status. Set to 0 to indicate normal. |
| offset | Int32 | Yes | Represents the starting position of the read/write request, consistent with the `offset` carried in the subscribed read/write request event. |
| value | Array\<Byte> | Yes | Represents the binary data of the response. |

## class ServiceData

```cangjie
public class ServiceData {
    public ServiceData(
        public var serviceUuid: String,
        public var serviceValue: Array<Byte>
    )
}
```

**Function:** Describes the service data content in the advertisement packet.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### var serviceUuid

```cangjie
public var serviceUuid: String
```

**Function:** Represents the UUID of the service.

**Type:** String**Read-Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### var serviceValue  

```cangjie  
public var serviceValue: Array<Byte>  
```  

**Description:** Represents service data.  

**Type:** Array\<Byte>  

**Read-Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### ServiceData(String, Array\<Byte>)  

```cangjie  
public ServiceData(  
    public var serviceUuid: String,  
    public var serviceValue: Array<Byte>  
)  
```  

**Description:** Constructor for ServiceData.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| serviceUuid | String | Yes | Represents the UUID of the service. |  
| serviceValue | Array\<Byte> | Yes | Represents the service data. |  

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

**Description:** Advertising state.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parent Types:**  

- Equatable\<AdvertisingState>  
- ToString  

### DISABLED  

```cangjie  
DISABLED  
```  

**Description:** Represents the state after temporarily stopping advertising.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### ENABLED  

```cangjie  
ENABLED  
```  

**Description:** Represents the state after temporarily starting advertising.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### STARTED  

```cangjie  
STARTED  
```  

**Description:** Represents the state after initially starting advertising.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### STOPPED  

```cangjie  
STOPPED  
```  

**Description:** Represents the state after completely stopping advertising.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### func !=(AdvertisingState)  

```cangjie  
public operator func !=(other: AdvertisingState): Bool   
```  

**Description:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| other | [AdvertisingState](#enum-advertisingstate) | Yes | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |  

### func ==(AdvertisingState)  

```cangjie  
public operator func ==(other: AdvertisingState): Bool   
```  

**Description:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| other | [AdvertisingState](#enum-advertisingstate) | Yes | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func toString()  

```cangjie  
public func toString(): String   
```  

**Description:** Gets the value of the enum.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Description of the enum. |  

## enum BluetoothBleCallbackType  

```cangjie  
public enum BluetoothBleCallbackType <: Equatable<BluetoothBleCallbackType> & Hashable & ToString {  
    | ADVERTISING_STATE_CHANGE  
    | BLE_DEVICE_FIND  
    | ...  
}  
```  

**Description:** Event types for advertising and scanning subscriptions.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parent Types:**  

- Equatable\<BluetoothBleCallbackType>  
- Hashable  
- ToString  

### ADVERTISING_STATE_CHANGE  

```cangjie  
ADVERTISING_STATE_CHANGE  
```  

**Description:** Represents the advertising state event type.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### BLE_DEVICE_FIND  

```cangjie  
BLE_DEVICE_FIND  
```  

**Description:** Represents the BLE device discovery event type.  

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

### func !=(BluetoothBleCallbackType)  

```cangjie  
public operator func !=(other: BluetoothBleCallbackType): Bool   
```  

**Description:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| other | [BluetoothBleCallbackType](#enum-bluetoothblecallbacktype) | Yes | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |  

### func ==(BluetoothBleCallbackType)  

```cangjie  
public operator func ==(other: BluetoothBleCallbackType): Bool   
```  

**Description:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Description |  
|:---|:---|:---|:---|  
| other | [BluetoothBleCallbackType](#enum-bluetoothblecallbacktype) | Yes | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func hashCode()  

```cangjie  
public func hashCode(): Int64   
```  

**Description:** Gets the hash value of the input data.  

**System Capability:** SystemCapability.Communication.Bluetooth.Core  

**Since:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int64 | Hash value of the data. |  

### func toString()
```cangjie
public func toString(): String 
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type   | Description               |
|:------|:-------------------------|
| String | Description of the enumeration. |

## enum BluetoothBleGattClientDeviceCallbackType

```cangjie
public enum BluetoothBleGattClientDeviceCallbackType <: Equatable<BluetoothBleGattClientDeviceCallbackType> & Hashable & ToString {
    | BLE_CHARACTERISTIC_CHANGE
    | BLE_CONNECTION_STATE_CHANGE
    | BLE_MTU_CHANGE
    | ...
}
```

**Function:** Types of client on/off events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<BluetoothBleGattClientDeviceCallbackType>
- Hashable
- ToString

### BLE_CHARACTERISTIC_CHANGE

```cangjie
BLE_CHARACTERISTIC_CHANGE
```

**Function:** Indicates the characteristic value change event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### BLE_CONNECTION_STATE_CHANGE

```cangjie
BLE_CONNECTION_STATE_CHANGE
```

**Function:** Indicates the connection state change event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### BLE_MTU_CHANGE

```cangjie
BLE_MTU_CHANGE
```

**Function:** Indicates the MTU state change event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(BluetoothBleGattClientDeviceCallbackType)

```cangjie
public operator func !=(other: BluetoothBleGattClientDeviceCallbackType): Bool 
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Name  | Type                                                                 | Mandatory | Description               |
|:-----|:--------------------------------------------------------------------|:---------|:-------------------------|
| other | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes      | Another enumeration value. |

**Return Value:**

| Type | Description                                      |
|:----|:------------------------------------------------|
| Bool | Returns `true` if the two enumeration values are not equal; otherwise, returns `false`. |

### func ==(BluetoothBleGattClientDeviceCallbackType)

```cangjie
public operator func ==(other: BluetoothBleGattClientDeviceCallbackType): Bool 
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Name  | Type                                                                 | Mandatory | Description               |
|:-----|:--------------------------------------------------------------------|:---------|:-------------------------|
| other | [BluetoothBleGattClientDeviceCallbackType](#enum-bluetoothblegattclientdevicecallbacktype) | Yes      | Another enumeration value. |

**Return Value:**

| Type | Description                                  |
|:----|:--------------------------------------------|
| Bool | Returns `true` if the two enumeration values are equal; otherwise, returns `false`. |

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**Function:** Gets the hash value of the input data.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type   | Description         |
|:------|:-------------------|
| Int64 | Hash value of the data. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type   | Description               |
|:------|:-------------------------|
| String | Description of the enumeration. |

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

**Function:** Types of server on/off events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<BluetoothBleGattServerCallbackType>
- Hashable
- ToString

### BLE_MTU_CHANGE

```cangjie
BLE_MTU_CHANGE
```

**Function:** Indicates the MTU state change event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CHARACTERISTIC_READ

```cangjie
CHARACTERISTIC_READ
```

**Function:** Indicates the characteristic read request event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CHARACTERISTIC_WRITE

```cangjie
CHARACTERISTIC_WRITE
```

**Function:** Indicates the characteristic write request event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CONNECTION_STATE_CHANGE

```cangjie
CONNECTION_STATE_CHANGE
```

**Function:** Indicates the BLE connection state change event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### DESCRIPTOR_READ

```cangjie
DESCRIPTOR_READ
```

**Function:** Indicates the descriptor read request event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### DESCRIPTOR_WRITE

```cangjie
DESCRIPTOR_WRITE
```

**Function:** Indicates the descriptor write request event type.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(BluetoothBleGattServerCallbackType)

```cangjie
public operator func !=(other: BluetoothBleGattServerCallbackType): Bool 
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Name  | Type                                                                 | Mandatory | Description               |
|:-----|:--------------------------------------------------------------------|:---------|:-------------------------|
| other | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes      | Another enumeration value. || Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |

### func ==(BluetoothBleGattServerCallbackType)

```cangjie
public operator func ==(other: BluetoothBleGattServerCallbackType): Bool 
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [BluetoothBleGattServerCallbackType](#enum-bluetoothblegattservercallbacktype) | Yes | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**Function:** Obtains the hash value of the input data.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The hash value of the data. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Obtains the value of the enum.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum GattWriteType

```cangjie
public enum GattWriteType <: Equatable<GattWriteType> & ToString {
    | WRITE
    | WRITE_NO_RESPONSE
    | ...
}
```

**Function:** Represents the GATT write type.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<GattWriteType>
- ToString

### WRITE

```cangjie
WRITE
```

**Function:** Indicates writing a characteristic value, requiring a response from the peer device.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### WRITE_NO_RESPONSE

```cangjie
WRITE_NO_RESPONSE
```

**Function:** Indicates writing a characteristic value without requiring a response from the peer device.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(GattWriteType)

```cangjie
public operator func !=(other: GattWriteType): Bool 
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [GattWriteType](#enum-gattwritetype) | Yes | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |

### func ==(GattWriteType)

```cangjie
public operator func ==(other: GattWriteType): Bool 
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [GattWriteType](#enum-gattwritetype) | Yes | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Obtains the value of the enum.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum MatchMode

```cangjie
public enum MatchMode <: Equatable<MatchMode> & ToString {
    | MATCH_MODE_AGGRESSIVE
    | MATCH_MODE_STICKY
    | ...
}
```

**Function:** Hardware filter matching mode.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<MatchMode>
- ToString

### MATCH_MODE_AGGRESSIVE

```cangjie
MATCH_MODE_AGGRESSIVE
```

**Function:** Indicates a lower threshold for hardware reporting scan results, such as triggering reports even with lower scan power or fewer scan occurrences over a period (default value).

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### MATCH_MODE_STICKY

```cangjie
MATCH_MODE_STICKY
```

**Function:** Indicates a higher threshold for hardware reporting scan results, requiring higher power thresholds and multiple scan occurrences before reporting.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(MatchMode)

```cangjie
public operator func !=(other: MatchMode): Bool 
```

**Function:** Determines whether two enum values are not equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [MatchMode](#enum-matchmode) | Yes | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |

### func ==(MatchMode)

```cangjie
public operator func ==(other: MatchMode): Bool 
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [MatchMode](#enum-matchmode) | Yes | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Obtains the value of the enum.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enum. |

## enum PhyType

```cangjie
public enum PhyType <: Equatable<PhyType> & ToString {
    | PHY_LE_1M
    | PHY_LE_ALL_SUPPORTED
    | ...
}
```

**Function:** Broadcast state.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**
- Equatable\<PhyType>
- ToString

### PHY_LE_1M

```cangjie
PHY_LE_1M
```

**Function:** Indicates the use of 1M PHY during scanning.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### PHY_LE_ALL_SUPPORTED

```cangjie
PHY_LE_ALL_SUPPORTED
```

**Function:** Indicates the use of all PHY modes supported by the Bluetooth protocol during scanning.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(PhyType)

```cangjie
public operator func !=(other: PhyType): Bool 
```

**Function:** Determines whether two enumeration values are unequal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [PhyType](#enum-phytype) | Yes | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are unequal, otherwise returns `false`. |

### func ==(PhyType)

```cangjie
public operator func ==(other: PhyType): Bool 
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [PhyType](#enum-phytype) | Yes | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |

## enum ScanDuty

```cangjie
public enum ScanDuty <: Equatable<ScanDuty> & ToString {
    | SCAN_MODE_LOW_POWER
    | SCAN_MODE_BALANCED
    | SCAN_MODE_LOW_LATENCY
    | ...
}
```

**Function:** Scanning modes.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<ScanDuty>
- ToString

### SCAN_MODE_BALANCED

```cangjie
SCAN_MODE_BALANCED
```

**Function:** Indicates balanced mode.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### SCAN_MODE_LOW_LATENCY

```cangjie
SCAN_MODE_LOW_LATENCY
```

**Function:** Indicates low-latency mode.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### SCAN_MODE_LOW_POWER

```cangjie
SCAN_MODE_LOW_POWER
```

**Function:** Indicates low-power mode (default value).

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(ScanDuty)

```cangjie
public operator func !=(other: ScanDuty): Bool 
```

**Function:** Determines whether two enumeration values are unequal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [ScanDuty](#enum-scanduty) | Yes | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are unequal, otherwise returns `false`. |

### func ==(ScanDuty)

```cangjie
public operator func ==(other: ScanDuty): Bool 
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| other | [ScanDuty](#enum-scanduty) | Yes | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal, otherwise returns `false`. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Retrieves the value of the enumeration.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The description of the enumeration. |