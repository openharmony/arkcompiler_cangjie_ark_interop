# ohos.bluetooth.baseProfile (Bluetooth BaseProfile Module)

The baseProfile module provides fundamental Profile types and related methods.

## Import Module

```cangjie
import kit.ConnectivityKit.*
```

## Permission List

ohos.permission.ACCESS_BLUETOOTH

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration is needed in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## interface BaseProfile

```cangjie
public interface BaseProfile {
    func getConnectedDevices(): Array<String>
    func getConnectionState(deviceId: String): ProfileConnectionState
    func on(`type`: ProfileCallbackType, callback: Callback1Argument<StateChangeParam>): Unit
    func off(`type`: ProfileCallbackType, callback: CallbackObject): Unit
    func off(`type`: ProfileCallbackType): Unit
}
```

**Description:** Basic Profile type.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func getConnectedDevices()

```cangjie
func getConnectedDevices(): Array<String>
```

**Description:** Obtains the list of connected devices.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type          | Description |
| ------------- | ----------- |
| Array\<String> | Returns the addresses of currently connected devices. For security considerations, the device addresses obtained here are randomized MAC addresses. This randomized address remains unchanged after successful pairing but will change when a paired device is unpaired and rescanned or when the Bluetooth service is powered off. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  | ------------- | ------------- |
  | 201           | Permission denied. |
  | 801           | Capability not supported. |
  | 2900001       | Service stopped. |
  | 2900003       | Bluetooth disabled. |
  | 2900004       | Profile not supported. |
  | 2900099       | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let a2dpSrc = createA2dpSrcProfile()
    let retArray = a2dpSrc.getConnectedDevices()
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func getConnectionState(String)

```cangjie
func getConnectionState(deviceId: String): ProfileConnectionState
```

**Description:** Obtains the connection state of a device's Profile.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type   | Mandatory | Description |
| -------------- | ------ | --------- | ----------- |
| deviceId       | String | Yes       | Remote device address. |

**Return Value:**

| Type                                | Description |
| ----------------------------------- | ----------- |
| [ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate) | Returns the connection state of the Profile. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  | ------------- | ------------- |
  | 201           | Permission denied. |
  | 401           | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801           | Capability not supported. |
  | 2900001       | Service stopped. |
  | 2900003       | Bluetooth disabled. |
  | 2900004       | Profile not supported. |
  | 2900099       | Operation failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

try {
    let a2dpSrc = createA2dpSrcProfile()
    let retArray = a2dpSrc.getConnectionState("XX:XX:XX:XX:XX:XX")
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func off(ProfileCallbackType, CallbackObject)

```cangjie
func off(`type`: ProfileCallbackType, callback: CallbackObject): Unit
```

**Description:** Unsubscribes from all connection state change events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                                | Mandatory | Description |
| -------------- | ----------------------------------- | --------- | ----------- |
| \`type`        | [ProfileCallbackType](#enum-profilecallbacktype) | Yes       | Callback event type. |
| callback       | [CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject) | Yes       | Callback event. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  | ------------- | ------------- |
  | 201           | Permission denied. |
  | 401           | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801           | Capability not supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Define required dependencies here
class StateChangeCallback <: Callback1Argument<StateChangeParam> {
    public func invoke(arg: StateChangeParam): Unit {
        let connectionState = arg.state.toString()
        Hilog.info(0, "Bluetooth", "profile connection state has changed to ${connectionState}")
    }
}

let changeCallBack = StateChangeCallback()
let a2dp = createA2dpSrcProfile()
try {
    a2dp.on(ProfileCallbackType.CONNECTION_STATE_CHANGE, changeCallBack)
    a2dp.off(ProfileCallbackType.CONNECTION_STATE_CHANGE, changeCallBack)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func off(ProfileCallbackType)

```cangjie
func off(`type`: ProfileCallbackType): Unit
```

**Description:** Unsubscribes from all connection state change events.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                                | Mandatory | Description |
| -------------- | ----------------------------------- | --------- | ----------- |
| \`type`        | [ProfileCallbackType](#enum-profilecallbacktype) | Yes       | Callback event type. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message |
  | ------------- | ------------- |
  | 201           | Permission denied. |
  | 401           | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801           | Capability not supported. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Define required dependencies here
class StateChangeCallback <: Callback1Argument<StateChangeParam> {
    public func invoke(arg: StateChangeParam): Unit {
        let connectionState = arg.state.toString()
        Hilog.info(0, "Bluetooth", "profile connection state has changed to ${connectionState}")
    }
}

let changeCallBack = StateChangeCallback()
let a2dp = createA2dpSrcProfile()
try {
    a2dp.on(ProfileCallbackType.CONNECTION_STATE_CHANGE, changeCallBack)
    a2dp.off(ProfileCallbackType.CONNECTION_STATE_CHANGE)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

### func on(ProfileCallbackType, Callback1Argument\<StateChangeParam>)

```cangjie
func on(`type`: ProfileCallbackType, callback: Callback1Argument<StateChangeParam>): Unit
```

**Description:** Subscribes to connection state change events. Uses Callback for asynchronous notification.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type                                                                 | Mandatory | Description |
| -------------- | -------------------------------------------------------------------- | --------- | ----------- |
| \`type`        | [ProfileCallbackType](#enum-profilecallbacktype)                     | Yes       | Pass `CONNECTIONSTATECHANGE` to indicate the connection state change event type. |
| callback       | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[StateChangeParam](#class-statechangeparam)> | Yes       | Represents the input parameter of the callback function. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | ------------- | ------------- |
  | 201           | Permission denied. |
  | 401           | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  |801|Capability not supported.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import ohos.hilog.Hilog

// Define required dependencies here
class StateChangeCallback <: Callback1Argument<StateChangeParam> {
    public func invoke(arg: StateChangeParam): Unit {
        let connectionState = arg.state.toString()
        Hilog.info(0, "Bluetooth", "profile connection state has changed to ${connectionState}")
    }
}

let changeCallBack = StateChangeCallback()
let a2dp = createA2dpSrcProfile()
try {
    a2dp.on(ProfileCallbackType.CONNECTION_STATE_CHANGE, changeCallBack)
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```

## class StateChangeParam

```cangjie
public class StateChangeParam {}
```

**Function:** Describes profile state change parameters.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let cause

```cangjie
public let cause: DisconnectCause
```

**Function:** Indicates the reason for connection failure.

**Type:** [DisconnectCause](#enum-disconnectcause)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let deviceId

```cangjie
public let deviceId: String
```

**Function:** Indicates the Bluetooth device address.

**Type:** String

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### let state

```cangjie
public let state: ProfileConnectionState
```

**Function:** Indicates the profile connection state of the Bluetooth device.

**Type:** [ProfileConnectionState](cj-apis-bluetooth-constant.md#enum-profileconnectionstate)

**Read/Write Permission:** Read-only

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

## enum DisconnectCause

```cangjie
public enum DisconnectCause <: Equatable<DisconnectCause> & ToString {
    | USER_DISCONNECT
    | CONNECT_FROM_KEYBOARD
    | CONNECT_FROM_MOUSE
    | CONNECT_FROM_CAR
    | TOO_MANY_CONNECTED_DEVICES
    | CONNECT_FAIL_INTERNAL
    | ...
}
```

**Function:** Reasons for connection failure.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<DisconnectCause>
- ToString

### CONNECT_FAIL_INTERNAL

```cangjie
CONNECT_FAIL_INTERNAL
```

**Function:** Internal error.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CONNECT_FROM_CAR

```cangjie
CONNECT_FROM_CAR
```

**Function:** Connection should be initiated from the car side.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CONNECT_FROM_KEYBOARD

```cangjie
CONNECT_FROM_KEYBOARD
```

**Function:** Connection should be initiated from the keyboard side.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### CONNECT_FROM_MOUSE

```cangjie
CONNECT_FROM_MOUSE
```

**Function:** Connection should be initiated from the mouse side.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### TOO_MANY_CONNECTED_DEVICES

```cangjie
TOO_MANY_CONNECTED_DEVICES
```

**Function:** Current number of connections exceeds the limit.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### USER_DISCONNECT

```cangjie
USER_DISCONNECT
```

**Function:** User actively disconnected.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(DisconnectCause)

```cangjie
public operator func !=(other: DisconnectCause): Bool 
```

**Function:** Determines inequality of connection failure reasons.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Description|
|:---|:---|:---|:---|
|other|[DisconnectCause](#enum-disconnectcause)|Yes|Connection failure reason.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the connection failure reasons are different, otherwise returns false.|

### func ==(DisconnectCause)

```cangjie
public operator func ==(other: DisconnectCause): Bool 
```

**Function:** Determines equality of connection failure reasons.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Description|
|:---|:---|:---|:---|
|other|[DisconnectCause](#enum-disconnectcause)|Yes|Connection failure reason.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the connection failure reasons are the same, otherwise returns false.|

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Returns the string representation of the connection failure reason.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the connection failure reason.|

## enum ProfileCallbackType

```cangjie
public enum ProfileCallbackType <: Equatable<ProfileCallbackType> & Hashable & ToString {
    | CONNECTION_STATE_CHANGE
    | ...
}
```

**Function:** Bluetooth base profile callback events.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parent Types:**

- Equatable\<ProfileCallbackType>
- Hashable
- ToString

### CONNECTION_STATE_CHANGE

```cangjie
CONNECTION_STATE_CHANGE
```

**Function:** Indicates the connection state change event type.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

### func !=(ProfileCallbackType)

```cangjie
public operator func !=(other: ProfileCallbackType): Bool 
```

**Function:** Determines inequality of Bluetooth base profile callback events.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| other | [ProfileCallbackType](#enum-profilecallbacktype) | Yes | Bluetooth BaseProfile callback event. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the Bluetooth BaseProfile callback events are different, otherwise returns `false`. |

### func ==(ProfileCallbackType)

```cangjie
public operator func ==(other: ProfileCallbackType): Bool 
```

**Function:** Performs equality comparison for Bluetooth BaseProfile callback events.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Description |
|:---|:---|:---|:---|
| other | [ProfileCallbackType](#enum-profilecallbacktype) | Yes | Bluetooth BaseProfile callback event. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the Bluetooth BaseProfile callback events are the same, otherwise returns `false`. |

### func hashCode()

```cangjie
public func hashCode(): Int64 
```

**Function:** Retrieves the hash value of the callback event.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The hash value of the callback event. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Retrieves the string representation of the callback event type.

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the callback event type. |