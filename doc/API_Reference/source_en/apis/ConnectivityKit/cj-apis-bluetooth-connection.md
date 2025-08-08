# ohos.bluetooth.connection (Bluetooth Connection Module)

The connection module provides methods for Bluetooth operations and management.

## Import Module

```cangjie
import kit.ConnectivityKit.*
```

## Permission List

ohos.permission.ACCESS_BLUETOOTH

## Usage Instructions

API sample code usage instructions:

- If the sample code has a "// index.cj" comment in the first line, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the aforementioned sample projects and configuration templates, please refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func setLocalName(String)

```cangjie
public func setLocalName(name: String): Unit
```

**Function:** Sets the local Bluetooth device name.

**Required Permission:** ohos.permission.ACCESS_BLUETOOTH

**System Capability:** SystemCapability.Communication.Bluetooth.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type   | Mandatory | Description                                                                 |
|:---------------|:-------|:----------|:----------------------------------------------------------------------------|
| name           | String | Yes       | The Bluetooth name to be set, with a maximum length of 248 bytes.          |

**Exceptions:**

- BusinessException: For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Bluetooth Service Subsystem Error Codes](../../errorcodes/cj-errorcode-bluetooth_manager.md).

  | Error Code ID | Error Message                                                                 |
  |:--------------|:------------------------------------------------------------------------------|
  | 201           | Permission denied.                                                            |
  | 401           | Invalid parameter. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. 3. Parameter verification failed. |
  | 801           | Capability not supported.                                                     |
  | 2900001       | Service stopped.                                                              |
  | 2900003       | Bluetooth disabled.                                                           |
  | 2900099       | Operation failed.                                                             |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ConnectivityKit.*
import kit.PerformanceAnalysisKit.*

try {
    setLocalName("device_name")
} catch (e: BusinessException) {
    Hilog.info(0, "Bluetooth", "errCode: ${e.code}, errMessage: ${e.message}")
}
```