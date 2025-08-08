# ohos.system_parameter_enhance (System Parameters)

SystemParameter provides a simple key-value pair access interface for various system services. Each system service can define system parameters to describe its state information or modify its behavior through these parameters. The basic operations are `get` and `set`, where `get` queries the value of a system parameter and `set` modifies it.

## Import Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Guidelines

API example code usage guidelines:

- If the first line of example code contains a `// index.cj` comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template, see [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class Systemparameter

```cangjie
public class Systemparameter {}
```

**Description:** System parameter instance.

**System Capability:** SystemCapability.Startup.SystemInfo

**Since:** 21

### static func get(String, String)

```cangjie
public static func get(key: String, def!: String = ""): String
```

**Description:** Obtains the value corresponding to the specified system parameter key.

**System Capability:** SystemCapability.Startup.SystemInfo

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | System parameter key to query. |
| def | String | No | "" | **Named parameter.** Default value of the system parameter to obtain. This is an optional parameter and takes effect only when the system parameter does not exist. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | System parameter value. If the key exists, the set value is returned. If the key does not exist and `def` is valid, `def` is returned. If `def` is not specified, an exception is thrown. |

**Exceptions:**

- BusinessException: For details about the error codes, see [System Parameter Error Codes](../../errorcodes/cj-errorcode-system-parameter.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14700101 | System parameter can not be found. |
  | 14700103 | System permission operation permission denied. |
  | 14700104 | System internal error including out of memory, deadlock etc. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

let value = Systemparameter.get("const.product.name")
AppLog.info("get product name: ${value}")
```

### static func set(String, String)

```cangjie
public static func set(key: String, value: String): Unit
```

**Description:** Sets the value corresponding to the specified system parameter key.

**System Capability:** SystemCapability.Startup.SystemInfo

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | System parameter key to set. |
| value | String | Yes | - | System parameter value to set. |

**Exceptions:**

- BusinessException: For details about the error codes, see [System Parameter Error Codes](../../errorcodes/cj-errorcode-system-parameter.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14700102 | System parameter value is invalid. |
  | 14700103 | System permission operation permission denied. |
  | 14700104 | System internal error including out of memory, deadlock etc. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import ohos.base.*

Systemparameter.set("param.key.test", "testtest")
let value = Systemparameter.get("param.key.test")
AppLog.info("get test: ${value}")
```