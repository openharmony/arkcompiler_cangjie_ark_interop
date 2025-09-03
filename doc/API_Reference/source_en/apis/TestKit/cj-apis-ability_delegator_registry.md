# ohos.app.ability.ability_delegator_registry

The AbilityDelegatorRegistry module provides the capability to globally register and store [AbilityDelegator](#class-abilitydelegator) and [AbilityDelegatorArgs](#class-abilitydelegatorargs) objects, including functions to retrieve the application's [AbilityDelegator](#class-abilitydelegator) object and unit test parameter objects. The interfaces in this module are exclusively for use within testing frameworks.

## Import Module

```cangjie
import kit.TestKit.*
```

## Usage Guidelines

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the example can be compiled and executed in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration must be done in the "main_ability.cj" file of the Cangjie template project.

For details about the aforementioned sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## class AbilityDelegator

```cangjie
public class AbilityDelegator {}
```

**Description:** AbilityDelegator is used to create and manage an [AbilityMonitor](#class-abilitymonitor) object (which monitors lifecycle state changes of specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)), including adding/removing [AbilityMonitor](#class-abilitymonitor) instances, waiting for [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to reach the OnCreate lifecycle, setting wait times, retrieving specified Ability's lifecycle state, obtaining the current top [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) of the application, and launching specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func addAbilityMonitor(AbilityMonitor)

```cangjie
public func addAbilityMonitor(monitor: AbilityMonitor): Unit
```

**Description:** Adds an [AbilityMonitor](#class-abilitymonitor) instance. Concurrent calls from multiple threads are not supported.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityMonitor](#class-abilitymonitor) | Yes | - | [AbilityMonitor](#class-abilitymonitor) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | AddAbilityMonitor failed. |

### func addAbilityStageMonitor(AbilityStageMonitor)

```cangjie
public func addAbilityStageMonitor(monitor: AbilityStageMonitor): Unit
```

**Description:** Adds an [AbilityStageMonitor](#class-abilitystagemonitor) object to monitor lifecycle state changes of specified [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | AddAbilityStageMonitor failed. |

### func doAbilityBackground(UIAbility)

```cangjie
public func doAbilityBackground(ability: UIAbility): Unit
```

**Description:** Schedules the specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to transition to the Background lifecycle state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| ability | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Yes | - | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | DoAbilityBackground failed. |

### func doAbilityForeground(UIAbility)

```cangjie
public func doAbilityForeground(ability: UIAbility): Unit
```

**Description:** Schedules the specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to transition to the Foreground lifecycle state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| ability | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Yes | - | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | DoAbilityForeground failed. |

### func executeShellCommand(String, Int64)

```cangjie
public func executeShellCommand(cmd: String, timeoutSecs!: Int64 = 0): ShellCmdResult
```

**Description:** Executes the specified Shell command.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| cmd | String | Yes | - | Shell command string. |
| timeoutSecs | Int64 | No | 0 | Command timeout duration in seconds (s). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ShellCmdResult](#class-shellcmdresult) | Returns the Shell command execution result as a [ShellCmdResult](#class-shellcmdresult) object. |

### func finishTest(String, Int64)

```cangjie
public func finishTest(msg: String, code: Int64): Unit
```

**Description:** Ends the test and prints log information to the unit test terminal console.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| msg | String | Yes | - | Log message string. |
| code | Int64 | Yes | - | Log code. |

### func getAbilityState(UIAbility)

```cangjie
public func getAbilityState(ability: UIAbility): AbilityLifecycleState
```

**Description:** Retrieves the lifecycle state of the specified ability.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| ability | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Yes | - | Specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object. |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [AbilityLifecycleState](#enum-abilitylifecyclestate) | Lifecycle state of the specified ability. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |

### func getAppContext()

```cangjie
public func getAppContext(): Context
```

**Description:** Retrieves the application Context.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [Context](../AbilityKit/cj-apis-ability.md#class-context) | Application Context. |

### func getCurrentTopAbility()

```cangjie
public func getCurrentTopAbility(): UIAbility
```

**Description:** Retrieves the current top [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) of the application.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
| :---- | :---- |
| [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | GetCurrentTopAbility failed. |

### func print(String)

```cangjie
public func print(msg: String): Unit
```

**Description:** Prints log information to the unit test terminal console.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| msg | String | Yes | - | Log message string. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |

### func removeAbilityMonitor(AbilityMonitor)

```cangjie
public func removeAbilityMonitor(monitor: AbilityMonitor): Unit
```

**Description:** Removes an added [AbilityMonitor](#class-abilitymonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityMonitor](#class-abilitymonitor) | Yes | - | [AbilityMonitor](#class-abilitymonitor) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | RemoveAbilityMonitor failed. |

### func removeAbilityStageMonitor(AbilityStageMonitor)

```cangjie
public func removeAbilityStageMonitor(monitor: AbilityStageMonitor): Unit
```

**Description:** Removes an added [AbilityStageMonitor](#class-abilitystagemonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | RemoveAbilityStageMonitor failed. |

### func startAbility(Want)

```cangjie
public func startAbility(want: Want): Future<Unit>
```

**Description:** Launches the specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| want | [Want](../AbilityKit/cj-apis-ability.md#class-want) | Yes | - | Parameters for launching [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability). |

### func waitAbilityMonitor(AbilityMonitor, Int64)

```cangjie
public func waitAbilityMonitor(monitor: AbilityMonitor, timeout!: Int64 = 5000): UIAbility
```

**Description:** Sets a wait time and waits for the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) matching the [AbilityMonitor](#class-abilitymonitor) instance to reach the [onCreate](../AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) lifecycle, then returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityMonitor](#class-abilitymonitor) | Yes | - | [AbilityMonitor](#class-abilitymonitor) instance. |
| timeout | Int64 | No | 5000 | Maximum wait time in milliseconds (ms). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | WaitAbilityMonitor failed. |

### func waitAbilityStageMonitor(AbilityStageMonitor, Int64)

```cangjie
public func waitAbilityStageMonitor(monitor: AbilityStageMonitor, timeout!: Int64 = 5000): AbilityStage
```

**Description:** Waits for and returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object that matches the conditions set in the given [AbilityStageMonitor](#class-abilitystagemonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Mandatory | Default | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |
| timeout | Int64 | No | 5000 | Maximum timeout wait time in milliseconds (ms). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) | Returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object. |

**Exceptions:**

For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are unspecified. 2. Incorrect parameter types. |
  | 16000100 | WaitAbilityStageMonitor failed. |## class AbilityDelegatorArgs

```cangjie
public class AbilityDelegatorArgs {}
```

**Description:** Test parameter information.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop bundleName

```cangjie
public mut prop bundleName: String
```

**Description:** Package name of the current application under test.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop parameters

```cangjie
public mut prop parameters: HashMap<String,String>
```

**Description:** Parameters for launching the current unit test.

**Type:** [HashMap<String,String>](../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md#HashMap)

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop testCaseNames

```cangjie
public mut prop testCaseNames: String
```

**Description:** Test case names.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop testRunnerClassName

```cangjie
public mut prop testRunnerClassName: String
```

**Description:** Name of the test executor for executing test cases.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class AbilityDelegatorRegistry

```cangjie
public class AbilityDelegatorRegistry {}
```

**Description:** [AbilityDelegatorRegistry](#class-abilitydelegatorregistry) provides the capability to store registered [AbilityDelegator](#class-abilitydelegator) and [AbilityDelegatorArgs](#class-abilitydelegatorargs) objects in a global registry.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func getAbilityDelegator()

```cangjie
public static func getAbilityDelegator(): AbilityDelegator
```

**Description:** Obtains the [AbilityDelegator](#class-abilitydelegator) object of the application, which can be used to dispatch test framework-related functionalities.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[AbilityDelegator](#class-abilitydelegator)|[AbilityDelegator](#class-abilitydelegator) object that can be used to dispatch test framework-related functionalities.|

### static func getArguments()

```cangjie
public static func getArguments(): AbilityDelegatorArgs
```

**Description:** Obtains the unit test parameter [AbilityDelegatorArgs](#class-abilitydelegatorargs) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[AbilityDelegatorArgs](#class-abilitydelegatorargs)|[AbilityDelegatorArgs](#class-abilitydelegatorargs) object that can be used to obtain test parameters.|

## class AbilityMonitor

```cangjie
public class AbilityMonitor <: FFIData {
    public var abilityName: String
    public var moduleName: String
    public var onAbilityCreate:?(UIAbility) -> Unit
    public var onAbilityForeground:?(UIAbility) -> Unit
    public var onAbilityBackground:?(UIAbility) -> Unit
    public var onAbilityDestroy:?(UIAbility) -> Unit
    public var onWindowStageCreate:?(UIAbility) -> Unit
    public var onWindowStageRestore:?(UIAbility) -> Unit
    public var onWindowStageDestroy:?(UIAbility) -> Unit
    public init(
        abilityName: String,
        moduleName!: String = "",
        onAbilityCreate!: ?(UIAbility) -> Unit = None,
        onAbilityForeground!: ?(UIAbility) -> Unit = None,
        onAbilityBackground!: ?(UIAbility) -> Unit = None,
        onAbilityDestroy!: ?(UIAbility) -> Unit = None,
        onWindowStageCreate!: ?(UIAbility) -> Unit = None,
        onWindowStageRestore!: ?(UIAbility) -> Unit = None,
        onWindowStageDestroy!: ?(UIAbility) -> Unit = None
    )
}
```

**Description:** The [AbilityMonitor](#class-abilitymonitor) module provides the capability to match monitored ability objects that meet specified conditions. The most recently matched ability object will be stored in [AbilityMonitor](#class-abilitymonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [FFIData](../AbilityKit/cj-apis-ability.md#class-ffidata)

### var abilityName

```cangjie
public var abilityName: String
```

**Description:** Name of the ability bound to the current [AbilityMonitor](#class-abilitymonitor).

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var moduleName

```cangjie
public var moduleName: String
```

**Description:** Name of the module bound to the current [AbilityMonitor](#class-abilitymonitor).

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onAbilityBackground

```cangjie
public var onAbilityBackground:?(UIAbility) -> Unit
```

**Description:** Callback function when the ability state changes to background. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onAbilityCreate

```cangjie
public var onAbilityCreate:?(UIAbility) -> Unit
```

**Description:** Callback function when the ability is initialized upon launch. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onAbilityDestroy

```cangjie
public var onAbilityDestroy:?(UIAbility) -> Unit
```

**Description:** Callback function before the ability is destroyed. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onAbilityForeground

```cangjie
public var onAbilityForeground:?(UIAbility) -> Unit
```

**Description:** Callback function when the ability state changes to foreground. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onWindowStageCreate

```cangjie
public var onWindowStageCreate:?(UIAbility) -> Unit
```

**Description:** Callback function when the window stage is created. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onWindowStageDestroy

```cangjie
public var onWindowStageDestroy:?(UIAbility) -> Unit
```

**Description:** Callback function before the window stage is destroyed. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var onWindowStageRestore

```cangjie
public var onWindowStageRestore:?(UIAbility) -> Unit
```

**Description:** Callback function when the window stage is reloaded. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability))->Unit

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### init(String, String, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit)

```cangjie
public init(
    abilityName: String,
    moduleName!: String = "",
    onAbilityCreate!: ?(UIAbility) -> Unit = None,
    onAbilityForeground!: ?(UIAbility) -> Unit = None,
    onAbilityBackground!: ?(UIAbility) -> Unit = None,
    onAbilityDestroy!: ?(UIAbility) -> Unit = None,
    onWindowStageCreate!: ?(UIAbility) -> Unit = None,
    onWindowStageRestore!: ?(UIAbility) -> Unit = None,
    onWindowStageDestroy!: ?(UIAbility) -> Unit = None
)
```

**Description:** Constructs an [AbilityMonitor](#class-abilitymonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|abilityName|String|Yes|-|Name of the ability bound to the current [AbilityMonitor](#class-abilitymonitor).|
|moduleName|String|No|""| **Named parameter.** Name of the module bound to the current [AbilityMonitor](#class-abilitymonitor).|
|onAbilityCreate|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function when the ability is initialized upon launch. None means this property is not set, and the lifecycle callback will not be received.|
|onAbilityForeground|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function when the ability state changes to foreground. None means this property is not set, and the lifecycle callback will not be received.|
|onAbilityBackground|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function when the ability state changes to background. None means this property is not set, and the lifecycle callback will not be received.|
|onAbilityDestroy|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function before the ability is destroyed. None means this property is not set, and the lifecycle callback will not be received.|
|onWindowStageCreate|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function when the window stage is created. None means this property is not set, and the lifecycle callback will not be received.|
|onWindowStageRestore|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function when the window stage is reloaded. None means this property is not set, and the lifecycle callback will not be received.|
|onWindowStageDestroy|?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit|No|None| **Named parameter.** Callback function before the window stage is destroyed. None means this property is not set, and the lifecycle callback will not be received.|

## class AbilityStageMonitor

```cangjie
public class AbilityStageMonitor <: FFIData {
    public var moduleName: String
    public var srcEntrance: String
    public init(
        moduleName: String,
        srcEntrance: String
    )
}
```

**Description:** The [AbilityStageMonitor](#class-abilitystagemonitor) module provides the capability to match monitored [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) objects that meet specified conditions. The most recently matched [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object will be stored in [AbilityStageMonitor](#class-abilitystagemonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [FFIData](../AbilityKit/cj-apis-ability.md#class-ffidata)

### var moduleName

```cangjie
public var moduleName: String
```

**Description:** Module name of the AbilityStage to be monitored.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var srcEntrance

```cangjie
public var srcEntrance: String
```

**Description:** Source path of the AbilityStage to be monitored.

**Type:** String

**Access:** Read-Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### init(String, String)

```cangjie
public init(
    moduleName: String,
    srcEntrance: String
)
```

**Description:** Constructs an [AbilityStageMonitor](#class-abilitystagemonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Required|Default Value|Description|
|:---|:---|:---|:---|:---|
|moduleName|String|Yes|-|Module name of the AbilityStage to be monitored.|
|srcEntrance|String|Yes|-|Source path of the AbilityStage to be monitored.|## class ShellCmdResult

```cangjie
public class ShellCmdResult {}
```

**Function:** Shell command execution result.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop exitCode

```cangjie
public mut prop exitCode: Int32
```

**Function:** Result code.

**Type:** Int32

**Access:** Read-write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop stdResult

```cangjie
public mut prop stdResult: String
```

**Function:** Standard output content.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## enum AbilityLifecycleState

```cangjie
public enum AbilityLifecycleState <: Equatable<AbilityLifecycleState> & ToString {
    | Uninitialized
    | Create
    | Foreground
    | Background
    | Destroy
    | ...
}
```

**Function:** [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) lifecycle state. This enumeration type can be used with the [getAbilityState](#func-getabilitystateuiability) method of [AbilityDelegator](#class-abilitydelegator) to return different ability lifecycle states.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Types:**

- Equatable\<AbilityLifecycleState>
- ToString

### Background

```cangjie
Background
```

**Function:** Indicates that [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the background state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Create

```cangjie
Create
```

**Function:** Indicates that [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the created state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Destroy

```cangjie
Destroy
```

**Function:** Indicates that [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the destroyed state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Foreground

```cangjie
Foreground
```

**Function:** Indicates that [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the foreground state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Uninitialized

```cangjie
Uninitialized
```

**Function:** Indicates that [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the invalid state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func !=(AbilityLifecycleState)

```cangjie
public operator func !=(other: AbilityLifecycleState): Bool
```

**Function:** Determines whether two enumeration values are unequal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AbilityLifecycleState](#enum-abilitylifecyclestate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are unequal, otherwise returns false. |

### func ==(AbilityLifecycleState)

```cangjie
public operator func ==(other: AbilityLifecycleState): Bool
```

**Function:** Determines whether two enumeration values are equal.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [AbilityLifecycleState](#enum-abilitylifecyclestate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enumeration. |