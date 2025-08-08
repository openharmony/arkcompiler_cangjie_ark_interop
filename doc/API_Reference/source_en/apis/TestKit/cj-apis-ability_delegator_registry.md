# ohos.ability_delegator_registry (AbilityDelegatorRegistry)

The AbilityDelegatorRegistry module provides the capability to store registered [AbilityDelegator](#class-abilitydelegator) and [AbilityDelegatorArgs](#class-abilitydelegatorargs) objects in a global registry, including obtaining the application's [AbilityDelegator](#class-abilitydelegator) object and unit test parameter objects. The interfaces in this module can only be used in test frameworks.

## Importing the Module

```cangjie
import kit.TestKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of the example code has a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example project and configuration template, please refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#cangjie-example-code-instructions).

## class AbilityDelegator

```cangjie
public class AbilityDelegator {}
```

**Description:** AbilityDelegator is used to create and manage an [AbilityMonitor](#class-abilitymonitor) object (which is used to monitor lifecycle state changes of a specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)), including adding and removing [AbilityMonitor](#class-abilitymonitor) instances, waiting for [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to reach the OnCreate lifecycle, setting wait times, obtaining the lifecycle state of a specified Ability, obtaining the top [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) of the current application, starting a specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability), etc.

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

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| monitor | [AbilityMonitor](#class-abilitymonitor) | Yes | - | [AbilityMonitor](#class-abilitymonitor) instance. |

**Exceptions:**

For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 16000100 | AddAbilityMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityMonitor(
        "EntryAbility", moduleName: "entry",
        onAbilityCreate: {ability => delegator.print("onAbilityCreate called, abilityName: ${ability.launchWant.abilityName}")}
)
delegator.addAbilityMonitor(monitor)
```

### func addAbilityStageMonitor(AbilityStageMonitor)

```cangjie
public func addAbilityStageMonitor(stageMonitor: AbilityStageMonitor): Unit
```

**Description:** Adds an [AbilityStageMonitor](#class-abilitystagemonitor) object to monitor lifecycle state changes of a specified [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| stageMonitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |

**Exceptions:**

For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 16000100 | AddAbilityStageMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityStageMonitor("entry", "ohos_app_cangjie_entry.MyAbilityStage")
delegator.addAbilityStageMonitor(monitor)
```

### func doAbilityBackground(UIAbility)

```cangjie
public func doAbilityBackground(ability: UIAbility): Unit
```

**Description:** Schedules the lifecycle state of a specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to the Background state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| ability | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Yes | - | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object. |

**Exceptions:**

For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 16000100 | DoAbilityBackground failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let ability = delegator.getCurrentTopAbility()
delegator.doAbilityBackground(ability)
```

### func doAbilityForeground(UIAbility)

```cangjie
public func doAbilityForeground(ability: UIAbility): Unit
```

**Description:** Schedules the lifecycle state of a specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) to the Foreground state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| ability | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Yes | - | [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object. |

**Exceptions:**

For detailed error code descriptions, please refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
  | 16000100 | DoAbilityForeground failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let ability = delegator.getCurrentTopAbility()
delegator.doAbilityForeground(ability)
```

### func executeShellCommand(String, Int64)

```cangjie
public func executeShellCommand(cmd: String, timeoutSec: Int64): ShellCmdResult
```

**Description:** Executes the specified Shell command.

Only the following Shell commands are supported: aa, bm, cp, mkdir, rm, uinput, hilog, ppwd, echo, uitest, acm, hidumper, wukong, pkill, ps, pidof.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| cmd | String | Yes | - | Shell command string. |
| timeoutSec | Int64 | Yes | - | Sets the command timeout period in seconds (s). |

**Return Value:**

| Type | Description |
| :---- | :---- |
| [ShellCmdResult](#class-shellcmdresult) | Returns the Shell command execution result as a [ShellCmdResult](#class-shellcmdresult) object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let cmd = "cmd"
delegator.executeShellCommand(cmd, 2)
```

### func finishTest(String, Int64)

```cangjie
public func finishTest(msg: String, code: Int64): Unit
```

**Description:** Ends the test and prints log information to the unit test terminal console.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- |
| msg | String | Yes | - | Log string. |
| code | Int64 | Yes | - | Log code. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let msg = "msg"
delegator.finishTest(msg, 0)
```

### func getAbilityState(UIAbility)

```cangjie
public func getAbilityState(ability: UIAbility): AbilityLifecycleState
```

**Description:** Obtains the lifecycle state of the specified ability.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
| :--- | :--- | :--- | :--- | :--- ||ability|[UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)|Yes|-|Specifies the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) object.|

**Return Value:**

|Type|Description|
|:----|:----|
|[AbilityLifecycleState](#enum-abilitylifecyclestate)|The lifecycle state of the specified ability.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message|
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let ability = delegator.getCurrentTopAbility()
delegator.getAbilityState(ability)
```

### func getAppContext()

```cangjie
public func getAppContext(): ApplicationContext
```

**Description:** Obtains the application context.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[ApplicationContext](../AbilityKit/cj-apis-ability.md#class-applicationcontext)|The application context.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let context = delegator.getAppContext()
```

### func getCurrentTopAbility()

```cangjie
public func getCurrentTopAbility(): UIAbility
```

**Description:** Obtains the top [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) of the current application.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|[UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)|Returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | GetCurrentTopAbility failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let ability = delegator.getCurrentTopAbility()
delegator.getAbilityState(ability)
```

### func print(String)

```cangjie
public func print(msg: String): Unit
```

**Description:** Prints log information to the unit test terminal console.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|msg|String|Yes|-|The log string.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let msg = "msg"
delegator.print(msg)
```

### func removeAbilityMonitor(AbilityMonitor)

```cangjie
public func removeAbilityMonitor(monitor: AbilityMonitor): Unit
```

**Description:** Removes an added [AbilityMonitor](#class-abilitymonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|monitor|[AbilityMonitor](#class-abilitymonitor)|Yes|-|The [AbilityMonitor](#class-abilitymonitor) instance.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | RemoveAbilityMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityMonitor(
    "EntryAbility", moduleName: "entry",
    onAbilityCreate: {ability => delegator.print("onAbilityCreate called, abilityName: ${ability.launchWant.abilityName}")}
)
delegator.removeAbilityMonitor(monitor)
```

### func removeAbilityStageMonitor(AbilityStageMonitor)

```cangjie
public func removeAbilityStageMonitor(stageMonitor: AbilityStageMonitor): Unit
```

**Description:** Removes an added [AbilityStageMonitor](#class-abilitystagemonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|stageMonitor|[AbilityStageMonitor](#class-abilitystagemonitor)|Yes|-|The [AbilityStageMonitor](#class-abilitystagemonitor) instance.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | RemoveAbilityStageMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityStageMonitor("entry", "ohos_app_cangjie_entry.MyAbilityStage")
delegator.removeAbilityStageMonitor(monitor)
```

### func startAbility(Want)

```cangjie
public func startAbility(want: Want): Future<Unit>
```

**Description:** Starts the specified [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|want|[Want](../AbilityKit/cj-apis-ability.md#class-want)|Yes|-|Parameters for starting the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability).|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let want = Want(bundleName: "com.example.myapplication", abilityName: "EntryAbility")
delegator.startAbility(want).get()
```

### func waitAbilityMonitor(AbilityMonitor)

```cangjie
public func waitAbilityMonitor(monitor: AbilityMonitor): UIAbility
```

**Description:** Waits for the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) that matches the [AbilityMonitor](#class-abilitymonitor) instance to reach the [onCreate](../AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) lifecycle and returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|monitor|[AbilityMonitor](#class-abilitymonitor)|Yes|-|The [AbilityMonitor](#class-abilitymonitor) instance.|

**Return Value:**

|Type|Description|
|:----|:----|
|[UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)|Returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance.|

**Exceptions:**

For details about the error codes, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | WaitAbilityMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityMonitor("EntryAbility", moduleName: "entry",
    onAbilityCreate: {ability => delegator.print("call onAbilityCreate success!")}
)
spawn {
    let ability = delegator.waitAbilityMonitor(monitor)
}
```

### func waitAbilityMonitor(AbilityMonitor, Int64)

```cangjie
public func waitAbilityMonitor(monitor: AbilityMonitor, timeout: Int64): UIAbility
```

**Function:** Sets a waiting time and waits for the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance matching the [AbilityMonitor](#class-abilitymonitor) to reach the [onCreate](../AbilityKit/cj-apis-ability.md#func-oncreatewant-launchparam) lifecycle, then returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| monitor | [AbilityMonitor](#class-abilitymonitor) | Yes | - | [AbilityMonitor](#class-abilitymonitor) instance. |
| timeout | Int64 | Yes | - | Maximum waiting time in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) | Returns the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) instance. |

**Exceptions:**

For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | WaitAbilityMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let monitor = AbilityMonitor("EntryAbility", moduleName: "entry",
    onAbilityCreate: {ability => delegator.print("call onAbilityCreate success!")}
)
spawn {
    let ability = delegator.waitAbilityMonitor(monitor, 2000)
}
```

### func waitAbilityStageMonitor(AbilityStageMonitor)

```cangjie
public func waitAbilityStageMonitor(stageMonitor: AbilityStageMonitor): AbilityStage
```

**Function:** Waits for and returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object that matches the conditions set in the given [AbilityStageMonitor](#class-abilitystagemonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| stageMonitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) | Returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object. |

**Exceptions:**

For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | WaitAbilityStageMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let stageMonitor = AbilityStageMonitor("entry", "ohos_app_cangjie_entry.MyAbilityStage")
spawn {
    let abilityStage = delegator.waitAbilityStageMonitor(stageMonitor)
}
```

### func waitAbilityStageMonitor(AbilityStageMonitor, Int64)

```cangjie
public func waitAbilityStageMonitor(stageMonitor: AbilityStageMonitor, timeout: Int64): AbilityStage
```

**Function:** Waits for and returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object that matches the conditions set in the given [AbilityStageMonitor](#class-abilitystagemonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| stageMonitor | [AbilityStageMonitor](#class-abilitystagemonitor) | Yes | - | [AbilityStageMonitor](#class-abilitystagemonitor) instance. |
| timeout | Int64 | Yes | - | Maximum waiting timeout in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) | Returns the [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object. |

**Exceptions:**

For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  | :--- | :--- |
  | 401| Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
  | 16000100 | WaitAbilityStageMonitor failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*
import kit.TestKit.*

let delegator = AbilityDelegatorRegistry.getAbilityDelegator()
let stageMonitor = AbilityStageMonitor("entry", "ohos_app_cangjie_entry.MyAbilityStage")
spawn {
    let abilityStage = delegator.waitAbilityStageMonitor(stageMonitor, 2000)
}
```

## class AbilityDelegatorArgs

```cangjie
public class AbilityDelegatorArgs {}
```

**Function:** Test parameter information.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop bundleName

```cangjie
public mut prop bundleName: String
```

**Function:** The package name of the currently tested application.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Type:** String

**Read-Write Access:** Readable and Writable

**Since:** 21

### prop parameters

```cangjie
public mut prop parameters: HashMap<String, String>
```

**Function:** Parameters for launching the current unit test.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Type:** HashMap\<String, String>

**Read-Write Access:** Readable and Writable

**Since:** 21

### prop testCaseNames

```cangjie
public mut prop testCaseNames: String
```

**Function:** Test case names.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Type:** String

**Read-Write Access:** Readable and Writable

**Since:** 21

### prop testRunnerClassName

```cangjie
public mut prop testRunnerClassName: String
```

**Function:** Name of the test runner that executes the test cases.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Type:** String

**Read-Write Access:** Readable and Writable

**Since:** 21

## class AbilityDelegatorRegistry

```cangjie
public class AbilityDelegatorRegistry {}
```

**Function:** [AbilityDelegatorRegistry](#class-abilitydelegatorregistry) provides the capability to store registered [AbilityDelegator](#class-abilitydelegator) and [AbilityDelegatorArgs](#class-abilitydelegatorargs) objects in a global registry.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func getAbilityDelegator()

```cangjie
public static func getAbilityDelegator(): AbilityDelegator
```

**Function:** Obtains the [AbilityDelegator](#class-abilitydelegator) object of the application, which can be used to dispatch test framework-related functionalities.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [AbilityDelegator](#class-abilitydelegator) | [AbilityDelegator](#class-abilitydelegator) object that can be used to dispatch test framework-related functionalities. |

### static func getArguments()

```cangjie
public static func getArguments(): AbilityDelegatorArgs
```

**Function:** Obtains the unit test parameter [AbilityDelegatorArgs](#class-abilitydelegatorargs) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21**Return Value:**

| Type | Description |
|:----|:----|
| [AbilityDelegatorArgs](#class-abilitydelegatorargs) | [AbilityDelegatorArgs](#class-abilitydelegatorargs) object. Can be used to obtain test parameters. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.TestKit.*

let args = AbilityDelegatorRegistry.getArguments()
AppLog.info("args is ${args.bundleName}")
AppLog.info("args is ${args.testCaseNames}")
AppLog.info("args is ${args.testRunnerClassName}")
AppLog.info("args is ${args.parameters}")
```

## class AbilityMonitor

```cangjie
public class AbilityMonitor {
    public AbilityMonitor(
        public var abilityName: String,
        public var moduleName!: String = "",
        public var onAbilityCreate!: ?(UIAbility) -> Unit = None,
        public var onAbilityForeground!: ?(UIAbility) -> Unit = None,
        public var onAbilityBackground!: ?(UIAbility) -> Unit = None,
        public var onAbilityDestroy!: ?(UIAbility) -> Unit = None,
        public var onWindowStageCreate!: ?(UIAbility) -> Unit = None,
        public var onWindowStageRestore!: ?(UIAbility) -> Unit = None,
        public var onWindowStageDestroy!: ?(UIAbility) -> Unit = None
    )
}
```

**Functionality:** The [AbilityMonitor](#class-abilitymonitor) module provides the capability to match monitored ability objects that meet specified conditions. The most recently matched ability object will be stored in [AbilityMonitor](#class-abilitymonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var abilityName

```cangjie
public var abilityName: String
```

**Functionality:** The name of the ability bound to the current [AbilityMonitor](#class-abilitymonitor).

**Type:** String

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var moduleName

```cangjie
public var moduleName: String = ""
```

**Functionality:** The module name bound to the current [AbilityMonitor](#class-abilitymonitor).

**Type:** String

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onAbilityBackground

```cangjie
public var onAbilityBackground: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function when the ability state changes to background. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onAbilityCreate

```cangjie
public var onAbilityCreate: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function when the ability is initialized upon startup. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onAbilityDestroy

```cangjie
public var onAbilityDestroy: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function before the ability is destroyed. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onAbilityForeground

```cangjie
public var onAbilityForeground: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function when the ability state changes to foreground. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onWindowStageCreate

```cangjie
public var onWindowStageCreate: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function when the window stage is created. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onWindowStageDestroy

```cangjie
public var onWindowStageDestroy: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function before the window stage is destroyed. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var onWindowStageRestore

```cangjie
public var onWindowStageRestore: ?(UIAbility) -> Unit = None
```

**Functionality:** Callback function when the window stage is restored. If this property is not set, the lifecycle callback will not be received.

**Type:** ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit

**Read/Write Permission:** Readable and Writable

**Since:** 21

### AbilityMonitor(String, String, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit, ?(UIAbility) -> Unit)

```cangjie
public AbilityMonitor(
    public var abilityName: String,
    public var moduleName!: String = "",
    public var onAbilityCreate!: ?(UIAbility) -> Unit = None,
    public var onAbilityForeground!: ?(UIAbility) -> Unit = None,
    public var onAbilityBackground!: ?(UIAbility) -> Unit = None,
    public var onAbilityDestroy!: ?(UIAbility) -> Unit = None,
    public var onWindowStageCreate!: ?(UIAbility) -> Unit = None,
    public var onWindowStageRestore!: ?(UIAbility) -> Unit = None,
    public var onWindowStageDestroy!: ?(UIAbility) -> Unit = None
)
```

**Functionality:** Constructs an [AbilityMonitor](#class-abilitymonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| abilityName | String | Yes | - | The name of the ability bound to the current [AbilityMonitor](#class-abilitymonitor). |
| moduleName | String | No | "" | **Named parameter.** The module name bound to the current [AbilityMonitor](#class-abilitymonitor). |
| onAbilityCreate | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function when the ability is initialized upon startup. If set to None, the lifecycle callback will not be received. |
| onAbilityForeground | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function when the ability state changes to foreground. If set to None, the lifecycle callback will not be received. |
| onAbilityBackground | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function when the ability state changes to background. If set to None, the lifecycle callback will not be received. |
| onAbilityDestroy | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function before the ability is destroyed. If set to None, the lifecycle callback will not be received. |
| onWindowStageCreate | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function when the window stage is created. If set to None, the lifecycle callback will not be received. |
| onWindowStageRestore | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function when the window stage is restored. If set to None, the lifecycle callback will not be received. |
| onWindowStageDestroy | ?([UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability)) -> Unit | No | None | **Named parameter.** Callback function before the window stage is destroyed. If set to None, the lifecycle callback will not be received. |

## class AbilityStageMonitor

```cangjie
public class AbilityStageMonitor {
    public AbilityStageMonitor(
        public var moduleName: String,
        public var srcEntrance: String
    )
}
```

**Functionality:** The [AbilityStageMonitor](#class-abilitystagemonitor) module provides methods for matching monitored [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) objects that meet specified conditions. The most recently matched [AbilityStage](../AbilityKit/cj-apis-ability.md#class-abilitystage) object will be stored in [AbilityStageMonitor](#class-abilitystagemonitor).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var moduleName

```cangjie
public var moduleName: String
```

**Functionality:** The module name of the abilityStage to be monitored.

**Type:** String

**Read/Write Permission:** Readable and Writable

**Since:** 21

### var srcEntrance

```cangjie
public var srcEntrance: String
```

**Functionality:** The source path of the abilityStage to be monitored.

**Type:** String

**Read/Write Permission:** Readable and Writable

**Since:** 21

### AbilityStageMonitor(String, String)

```cangjie
public AbilityStageMonitor(
    public var moduleName: String,
    public var srcEntrance: String
)
```

**Functionality:** Constructs an [AbilityStageMonitor](#class-abilitystagemonitor) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| moduleName | String | Yes | - | The module name of the abilityStage to be monitored. |
| srcEntrance | String | Yes | - | The source path of the abilityStage to be monitored. |

## class ShellCmdResult

```cangjie
public class ShellCmdResult {}
```

**Functionality:** Shell command execution result.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func dump()

```cangjie
public func dump(): String
```

**Functionality:** Obtains the string representation of the [ShellCmdResult](#class-shellcmdresult) object.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21**Return Value:**

| Type | Description |
|:----|:----|
| String | String representation of the [ShellCmdResult](#class-shellcmdresult) object. |

### func getExitCode()

```cangjie
public func getExitCode(): Int32
```

**Function:** Gets the result code.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The result code. |

### func getStdResult()

```cangjie
public func getStdResult(): String
```

**Function:** Gets the standard output content.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The standard output content. |

## enum AbilityLifecycleState

```cangjie
public enum AbilityLifecycleState <: Equatable<AbilityLifecycleState> & ToString {
    | UNINITIALIZED
    | CREATE
    | FOREGROUND
    | BACKGROUND
    | DESTROY
    | ...
}
```

**Function:** Lifecycle state of [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability). This enumeration type can be used with the [getAbilityState](#func-getabilitystateuiability) method of [AbilityDelegator](#class-abilitydelegator) to return different ability lifecycle states.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Types:**

- Equatable\<[AbilityLifecycleState](#enum-abilitylifecyclestate)>
- ToString

### BACKGROUND

```cangjie
BACKGROUND
```

**Function:** Indicates that the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the background state.

**Since:** 21

### CREATE

```cangjie
CREATE
```

**Function:** Indicates that the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the created state.

**Since:** 21

### DESTROY

```cangjie
DESTROY
```

**Function:** Indicates that the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the destroyed state.

**Since:** 21

### FOREGROUND

```cangjie
FOREGROUND
```

**Function:** Indicates that the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the foreground state.

**Since:** 21

### UNINITIALIZED

```cangjie
UNINITIALIZED
```

**Function:** Indicates that the [UIAbility](../AbilityKit/cj-apis-ability.md#class-uiability) is in the uninitialized state.

**Since:** 21

### func !=(AbilityLifecycleState)

```cangjie
public operator func !=(other: AbilityLifecycleState): Bool
```

**Function:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AbilityLifecycleState](#enum-abilitylifecyclestate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are not equal; otherwise, returns `false`. |

### func ==(AbilityLifecycleState)

```cangjie
public operator func ==(other: AbilityLifecycleState): Bool
```

**Function:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [AbilityLifecycleState](#enum-abilitylifecyclestate) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enumeration values are equal; otherwise, returns `false`. |

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enumeration. |