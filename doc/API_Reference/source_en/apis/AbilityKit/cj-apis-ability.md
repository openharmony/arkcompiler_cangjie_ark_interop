# ohos.app.ability

AbilityConstant provides enumerations related to Ability, including application launch reason LaunchReason, last exit reason LastExitReason, migration result OnContinueResult, etc.

## Import Module

```cangjie
import kit.AbilityKit.*
```

## Permission List

ohos.permission.DISTRIBUTED_DATASYNC

ohos.permission.PREPARE_APP_TERMINATE

ohos.permission.PRIVACY_WINDOW

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above sample project and configuration template, please refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## func createAbilityStageContextFromJSValue(JSContext, JSValue)

```cangjie
public func createAbilityStageContextFromJSValue(context: JSContext, input: JSValue): AbilityStageContext
```

**Function:** Converts from JSValue to AbilityStageContext type.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [AbilityStageContext](#class-abilitystagecontext) | Returns an instance of AbilityStageContext type. |

## func createApplicationContextFromJSValue(JSContext, JSValue)

```cangjie
public func createApplicationContextFromJSValue(context: JSContext, input: JSValue): ApplicationContext
```

**Function:** Converts from [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) to [ApplicationContext](#class-applicationcontext) type.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ApplicationContext](#class-applicationcontext) | Returns an instance of ApplicationContext type. |

## func createContextFromJSValue(JSContext, JSValue)

```cangjie
public func createContextFromJSValue(context: JSContext, input: JSValue): Context
```

**Function:** Converts from [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) to [Context](#class-context) type.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Context](#class-context) | Returns an instance of Context type. |

## func createUIAbilityContextFromJSValue(JSContext, JSValue)

```cangjie
public func createUIAbilityContextFromJSValue(context: JSContext, input: JSValue): UIAbilityContext
```

**Function:** Converts from [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) to [AbilityContext](#class-abilitycontext) type.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext) | Yes | - | ArkTS interoperability context. |
| input | [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) | Yes | - | ArkTS unified type. |

**Return Value:**

| Type | Description |
|:----|:----|
| [UIAbilityContext](#class-uiabilitycontext) | Returns an instance of AbilityContext type. |

## func restartApp()

```cangjie
public func restartApp(): Unit
```

**Function:** Restarts the current process and launches the first Ability when the application starts. If the Ability has saved state data, this data will be passed in the want parameter of the Ability's OnCreate lifecycle callback as the wantParam property.

Launches the Ability specified by [setRestartWant](#func-setrestartwantwant). If not specified, the following rules apply:

If the current application's foreground Ability supports recovery, it will be relaunched.

If multiple foreground Abilities support recovery, only the last one will be relaunched.

If no Ability is in the foreground, nothing will be launched.

Can be used with [ErrorManager](#class-errormanager) related interfaces. The interval between two restarts should be more than one minute. Calling this interface repeatedly within one minute will only exit the application without restarting it. Automatic restart behavior is consistent with active restart.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*

restartApp()
```

## class Ability

```cangjie
abstract sealed class Ability <: FFIData {}
```

**Function:** Base class for [UIAbility](#class-uiability) and ExtensionAbility, providing system configuration update callbacks and system memory adjustment callbacks. Developers cannot directly inherit from this base class.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### static func registerCreator(String, () -> Ability)

```cangjie
public static func registerCreator(name: String, creator: () -> Ability): Unit
```

**Function:** Registers the corresponding creator for BaseAbility.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name of the registered UIAbility. |
| creator | ()->[Ability](#class-ability) | Yes | - | Corresponding creator for BaseAbility. |

## class AbilityStage

```cangjie
public open class AbilityStage <: FFIData {}
```

**Function:** The AbilityStage class provides the ability to notify developers during HAP loading, allowing initialization of the HAP (such as resource preloading, thread creation, etc.).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [FFIData](<font color="red" face="bold">please add link</font>)

### prop context

```cangjie
public mut prop context: AbilityStageContext
```

**Function:** Defines the context of AbilityStage. This context is obtained through callbacks during Ability initialization.

**Type:** [AbilityStageContext](#class-abilitystagecontext)

**Read/Write Capability:** Read/Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func registerCreator(String, () -> AbilityStage)

```cangjie
public static func registerCreator(moduleName: String, creator: () -> AbilityStage): Unit
```

**Function:** Registers the corresponding creator for [AbilityStage](#class-abilitystage).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| moduleName | String | Yes | - | Name of the registered AbilityStage. |
| creator | ()->[AbilityStage](#class-abilitystage) | Yes | - | Corresponding creator for AbilityStage. |

### func onCreate()

```cangjie
public open func onCreate(): Unit
```

**Function:** Callback when [AbilityStage](#class-abilitystage) is created, executing initialization business logic operations.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class AbilityStageContext

```cangjie
public class AbilityStageContext <: Context {
    public var currentHapModuleInfo: HapModuleInfo
}
```

**Function:** [AbilityStageContext](#class-abilitystagecontext) provides the ability to access resources specific to `abilityStage`, including obtaining the `hapModuleInfo` object corresponding to AbilityStage and environment change objects.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

### var currentHapModuleInfo

```cangjie
public var currentHapModuleInfo: HapModuleInfo
```

**Function:** `hapModuleInfo` object corresponding to AbilityStage.

**Type:** [HapModuleInfo](./cj-apis-bundle_manager.md#class-hapmoduleinfo)

**Read/Write Capability:** Read/Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class ApplicationContext

```cangjie
public class ApplicationContext <: Context {}
```

**Function:** Provides application-level context capabilities.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

## class Context

```cangjie
public open class Context <: BaseContext {}
```

**Function:** Provides context capabilities for ability or application.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [BaseContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)

### prop applicationInfo

```cangjie
public prop applicationInfo: ApplicationInfo
```

**Function:** Information about the current application.

**Type:** [ApplicationInfo](./cj-apis-bundle_manager.md#class-applicationinfo)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop area

```cangjie
public mut prop area: AreaMode
```

**Function:** File partition information.

**Type:** [AreaMode](#enum-areamode)

**Read/Write Capability:** Read/Write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop filesDir

```cangjie
public prop filesDir: String
```

**Function:** File directory.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop resourceManager

```cangjie
public prop resourceManager: ResourceManager
```

**Function:** Resource management object.

**Type:** [ResourceManager](../LocalizationKit/cj-apis-resource_manager.md#class-resourcemanager)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class ErrorManager

```cangjie
public class ErrorManager {}
```

**Function:** Class providing methods to register and unregister error observers.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func off(ErrorManagerEvent, Int32)

```cangjie
public static func off(eventType: ErrorManagerEvent, observerId: Int32): Unit
```

**Function:** Unregisters the main thread message handler listener.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| eventType | [ErrorManagerEvent](#enum-errormanagerevent) | Yes | - | "Error", indicating the error observer. |
| observerId | Int32 | Yes | - | Index value of the observer returned by the on method. |

**Exceptions:**

- BusinessException: Corresponding error codes are as follows. For details, see [Ability Subsystem Error Codes](../../../source_zh_cn/errorcodes/cj-errorcode-ability.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 16000003 | The specified ID does not exist. |

### static func on(ErrorManagerEvent, ErrorObserver)

```cangjie
public static func on(eventType: ErrorManagerEvent, observer: ErrorObserver): Int32
```

**Function:** Registers an error observer. After registration, if the program crashes, the uncaught exception mechanism will be triggered.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| eventType | [ErrorManagerEvent](#enum-errormanagerevent) | Yes | - | "Error", indicating the error observer. |
| observer | [ErrorObserver](#interface-errorobserver) | Yes | - | Error observer. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Index value of the observer, corresponding one-to-one with the observer. |

**Exceptions:**

- BusinessException: Corresponding error codes are as follows. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 16000003 | The specified ID does not exist. |```markdown
## class LaunchParam

```cangjie
public class LaunchParam {
    public var launchReason: LaunchReason
    public var lastExitReason: LastExitReason
}
```

**Function:** Launch parameters. Automatically passed by the system when an Ability starts, requiring no modification by developers.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var lastExitReason

```cangjie
public var lastExitReason: LastExitReason
```

**Function:** Enumeration type indicating the last exit reason.

**Type:** [LastExitReason](#enum-lastexitreason)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var launchReason

```cangjie
public var launchReason: LaunchReason
```

**Function:** Enumeration type indicating the launch reason.

**Type:** [LaunchReason](#enum-launchreason)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class RequestResult

```cangjie
public class RequestResult {
    public var result: ResultCode
    public var want: Want
}
```

**Function:** Carries the request result of the `requestDialogService` asynchronous callback, containing the result code `result` and additional data `want`, used to transfer results and contextual information between the application and dialog service.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var result

```cangjie
public var result: ResultCode
```

**Function:** Indicates the passed request result, distinguishing states such as success or cancellation.

**Type:** [ResultCode](#enum-resultcode)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var want

```cangjie
public var want: Want
```

**Function:** Indicates the passed additional `Want` data, used to carry extra business parameters in the callback.

**Type:** [Want](#class-want)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class StartOptions

```cangjie
public open class StartOptions {
    public var windowMode:?WindowMode
    public var displayId: Int32
    public init(
        windowMode!: ?WindowMode = None,
        displayId!: Int32 = 0
    )
}
```

**Function:** Used to specify the window mode of the target Ability.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var displayId

```cangjie
public var displayId: Int32
```

**Function:** Screen ID mode. Default is 0, representing the current screen.

**Type:** Int32

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var windowMode

```cangjie
public var windowMode:?WindowMode
```

**Function:** Window mode when starting an Ability. For details, see [WindowMode](#enum-windowmode).

**Type:** ?[WindowMode](#enum-windowmode)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### init(?WindowMode, Int32)

```cangjie
public init(
    windowMode!: ?WindowMode = None,
    displayId!: Int32 = 0
)
```

**Function:** Constructor for StartOptions.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| windowMode | ?[WindowMode](#enum-windowmode) | No | None | **Named parameter.** Window mode when starting an Ability. |
| displayId | Int32 | No | 0 | **Named parameter.** Screen ID mode. Default is 0, representing the current screen. |

## class UIAbility

```cangjie
public open class UIAbility <: Ability {}
```

**Function:** UIAbility is an application component containing UI interfaces, inheriting from BaseAbility. It provides lifecycle callbacks for component creation, destruction, and foreground/background switching, as well as component collaboration capabilities. Component collaboration mainly provides the following common features:

- Caller: Returned by the startAbilityByCall interface. CallerAbility (the caller) can use Caller to communicate with CalleeAbility (the callee).

- Callee: An internal object of UIAbility. CalleeAbility (the callee) can communicate with Caller via Callee.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

**Parent Type:**

- [Ability](#class-ability)

### prop context

```cangjie
public mut prop context: UIAbilityContext
```

**Function:** Context.

**Type:** [UIAbilityContext](#class-uiabilitycontext)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### prop lastRequestWant

```cangjie
public mut prop lastRequestWant: Want
```

**Function:** Parameters of the last request by UIAbility.

**Type:** [Want](#class-want)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### prop launchWant

```cangjie
public mut prop launchWant: Want
```

**Function:** Parameters when UIAbility is launched.

**Type:** [Want](#class-want)

**Read/Write:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### func onBackground()

```cangjie
public open func onBackground(): Unit
```

**Function:** UIAbility lifecycle callback triggered when the application moves from foreground to background.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### func onCreate(Want, LaunchParam)

```cangjie
public open func onCreate(want: Want, launchParam: LaunchParam): Unit
```

**Function:** UIAbility creation callback for executing initialization business logic operations.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | Want-type information of the current UIAbility, including UIAbility name, Bundle name, etc. |
| launchParam | [LaunchParam](#class-launchparam) | Yes | - | Information about the Ability creation and the last abnormal exit reason. |

### func onDestroy()

```cangjie
public open func onDestroy(): Unit
```

**Function:** UIAbility destruction callback for executing resource cleanup operations.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### func onForeground()

```cangjie
public open func onForeground(): Unit
```

**Function:** UIAbility lifecycle callback triggered when the application moves from background to foreground.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

### func onNewWant(Want, LaunchParam)

```cangjie
public open func onNewWant(want: Want, launchParam: LaunchParam): Unit
```

**Function:** Callback executed when a UIAbility instance has been started and run in the foreground before, switched to the background for some reason, and then restarted. That is, this lifecycle callback is entered during the hot start of the UIAbility instance.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | Want-type information of the current UIAbility, including Ability name, Bundle name, etc. |
| launchParam | [LaunchParam](#class-launchparam) | Yes | - | Information about the Ability launch reason and the last abnormal exit reason. |

### func onWindowStageCreate(WindowStage)

```cangjie
public open func onWindowStageCreate(windowStage: WindowStage): Unit
```

**Function:** Called after WindowStage is created.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| windowStage | [WindowStage](#class-windowstage) | Yes | - | Information about [WindowStage](#class-windowstage). |

### func onWindowStageDestroy()

```cangjie
public open func onWindowStageDestroy(): Unit
```

**Function:** Called after WindowStage is destroyed.

**System Capability:** SystemCapability.Ability.AbilityRuntime.AbilityCore

**Since:** 21

## class UIAbilityContext

```cangjie
public open class UIAbilityContext <: Context {}
```

**Function:** Provides the capability to access resources specific to a particular UIAbility.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

### func isTerminating()

```cangjie
public func isTerminating(): Bool
```

**Function:** Queries whether the Ability is in the terminating state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | true: The Ability is currently in the terminating state; false: Not in the terminating state. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below.

| Error Code ID | Error Message |
| :---- | :--- |
| 16000011 | The context does not exist. |

### func requestDialogService(Want, AsyncCallbackEx\<RequestResult>)

```cangjie
public func requestDialogService(want: Want, result: AsyncCallbackEx<RequestResult>): Unit
```

**Function:** Starts a ServiceExtensionAbility supporting modal dialogs and returns the result via callback.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | Want information of the target ServiceExtensionAbility to be started. |
| result | [AsyncCallbackEx](#type-asynccallbackex)\<[RequestResult](#class-requestresult)> | Yes | - | Callback for returning results. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below.

| Error Code ID | Error Message |
| :---- | :--- |
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
| 16000001 | The specified ability does not exist. |
| 16000002 | Incorrect ability type. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000010 | The call with the continuation and prepare continuation flag is forbidden. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16200001 | The caller has been released. |
```### func requestDialogService(Want)

```cangjie
public func requestDialogService(want: Want): Future<RequestResult>
```

**Function:** Starts a ServiceExtensionAbility that supports modal dialogs and returns the result.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | The Want information of the target ServiceExtensionAbility to start. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Future](../../../../User_Manual/source_zh_cn/concurrency/use_thread.md#using-futuret-to-wait-for-thread-completion-and-get-return-value)\<[RequestResult](#class-requestresult)> | Returns the execution result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 16000001 | The specified ability does not exist. |
| 16000002 | Incorrect ability type. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000010 | The call with the continuation and prepare continuation flag is forbidden. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16200001 | The caller has been released. |

### func startAbility(Want)

```cangjie
public func startAbility(want: Want): Future<Unit>
```

**Function:** Starts an Ability with startup parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | The Want information of the Ability to start. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 16000001 | The specified ability does not exist. |
| 16000002 | Incorrect ability type. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000010 | The call with the continuation and prepare continuation flag is forbidden. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000018 | Redirection to a third-party application is not allowed in API version greater than 11. |
| 16000019 | No matching ability is found. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16000067 | The StartOptions check failed. |
| 16000068 | The ability is already running. |
| 16000071 | App clone is not supported. |
| 16000072 | App clone or multi-instance is not supported. |
| 16000073 | The app clone index is invalid. |
| 16000076 | The app instance key is invalid. |
| 16000077 | The number of app instances reaches the limit. |
| 16000078 | The multi-instance is not supported. |
| 16000079 | The APP_INSTANCE_KEY cannot be specified. |
| 16000080 | Creating a new instance is not supported. |
| 16200001 | The caller has been released. |
| 16300003 | The target application is not the current application. |

### func startAbility(Want, StartOptions)

```cangjie
public func startAbility(want: Want, options: StartOptions): Future<Unit>
```

**Function:** Starts an Ability with startup parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | The Want information of the Ability to start. |
| options | [StartOptions](#class-startoptions) | Yes | - | The parameters carried when starting the Ability. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 801 | Capability not supported. |
| 16000001 | The specified ability does not exist. |
| 16000002 | Incorrect ability type. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000010 | The call with the continuation and prepare continuation flag is forbidden. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000018 | Redirection to a third-party application is not allowed in API version greater than 11. |
| 16000019 | No matching ability is found. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16000067 | The StartOptions check failed. |
| 16000068 | The ability is already running. |
| 16000071 | App clone is not supported. |
| 16000072 | App clone or multi-instance is not supported. |
| 16000073 | The app clone index is invalid. |
| 16000076 | The app instance key is invalid. |
| 16000077 | The number of app instances reaches the limit. |
| 16000078 | The multi-instance is not supported. |
| 16000079 | The APP_INSTANCE_KEY cannot be specified. |
| 16000080 | Creating a new instance is not supported. |
| 16200001 | The caller has been released. |
| 16300003 | The target application is not the current application. |

### func startAbilityForResult(Want, AsyncCallbackEx\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, callback: AsyncCallbackEx<AbilityResult>): Unit
```

**Function:** Starts an Ability and returns the execution result when the Ability exits (callback form).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | The Want information of the Ability to start. |
| callback | [AsyncCallbackEx](#type-asynccallbackex)\<[AbilityResult](#class-abilityresult)> | Yes | - | The callback function for the execution result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 16000001 | The specified ability does not exist. |
| 16000002 | Incorrect ability type. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000010 | The call with the continuation and prepare continuation flag is forbidden. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000018 | Redirection to a third-party application is not allowed in API version greater than 11. |
| 16000019 | No matching ability is found. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16000071 | App clone is not supported. |
| 16000072 | App clone or multi-instance is not supported. |
| 16000073 | The app clone index is invalid. |
| 16000076 | The app instance key is invalid. |
| 16000077 | The number of app instances reaches the limit. |
| 16000078 | The multi-instance is not supported. |
| 16000079 | The APP_INSTANCE_KEY cannot be specified. |
| 16000080 | Creating a new instance is not supported. |
| 16200001 | The caller has been released. |

### func startAbilityForResult(Want, StartOptions, AsyncCallbackEx\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallbackEx<AbilityResult>): Unit
```

**Function:** Starts an Ability and returns the execution result when the Ability exits (callback form).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | - | The Want information of the Ability to start. |
| options | [StartOptions](#class-startoptions) | Yes | - | The parameters carried when starting the Ability. |
| callback | [AsyncCallbackEx](#type-asynccallbackex)\<[AbilityResult](#class-abilityresult)> | Yes | - | The callback function for the execution result. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 16000001 | The specified ability does not exist. |
| 16000004 | Cannot start an invisible component. |
| 16000005 | The specified process does not have the permission. |
| 16000006 | Cross-user operations are not allowed. |
| 16000008 | The crowdtesting application expires. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000011 | The context does not exist. |
| 16000012 | The application is controlled. |
| 16000013 | The application is controlled by EDM. |
| 16000018 | Redirection to a third-party application is not allowed in API version greater than 11. |
| 16000019 | No matching ability is found. |
| 16000050 | Internal error. |
| 16000053 | The ability is not on the top of the UI. |
| 16000055 | Installation-free timed out. |
| 16000071 | App clone is not supported. |
| 16000072 | App clone or multi-instance is not supported. |
| 16000073 | The app clone index is invalid. |
| 16000076 | The app instance key is invalid. |
| 16000077 | The number of app instances reaches the limit. |
| 16000078 | The multi-instance is not supported. |
| 16000079 | The APP_INSTANCE_KEY cannot be specified. |
| 16000080 | Creating a new instance is not supported. |
| 16200001 | The caller has been released. |

### func terminateSelf()

```cangjie
public func terminateSelf(): Future<Unit>
```

**Function:** Terminates the UIAbility itself.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000011 | The context does not exist. |
| 16000050 | Internal error. |

### func terminateSelfWithResult(AbilityResult)

```cangjie
public func terminateSelfWithResult(parameter: AbilityResult): Future<Unit>
```

**Function:** Terminates the UIAbility and returns AbilityResult information to the caller when used with startAbilityForResult.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| parameter | [AbilityResult](#class-abilityresult) | Yes | - | Terminates the Ability and returns AbilityResult information to the caller when used with startAbilityForResult. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified. 2. Incorrect parameter types. |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000011 | The context does not exist. |
| 16000050 | Internal error. |

## class Want

```cangjie
public class Want {
    public var deviceId: String
    public var bundleName: String
    public var abilityName: String
    public var moduleName: String
    public var flags: UInt32
    public var uri: String
    public var action: String
    public var entities: Array<String>
    public var wantType: String
    public var parameters: HashMap<String, WantValueType>


    public init(
        deviceId!: String = "",
        bundleName!: String = "",
        abilityName!: String = "",
        moduleName!: String = "",
        flags!: UInt32 = 0,
        uri!: String = "",
        action!: String = "",
        entities!: Array<String> = [],
        wantType!: String = "",
        parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>(),
        fds!: HashMap<String, Int32> = HashMap<String, Int32>()
    )
}
```

**Function:** Creates the corresponding Want.

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var abilityName

```cangjie
public var abilityName: String
```

**Function:** The name of the Ability to start.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var action

```cangjie
public var action: String
```

**Function:** The general action to perform (e.g., view, share, app details). In an implicit Want, you can define this field, along with uri or parameters, to indicate the action to perform on the data.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var bundleName

```cangjie
public var bundleName: String
```

**Function:** The bundle name of the application where the target Ability resides.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var deviceId

```cangjie
public var deviceId: String
```

**Function:** The device ID where the specified Ability runs.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var entities

```cangjie
public var entities: Array<String>
```

**Function:** Additional category information of the target Ability (e.g., browser, video player). In an implicit Want, this field supplements the action field to filter matching Ability types.

**Type:** Array\<String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### var flags

```cangjie
public var flags: UInt32
```

**Function:** The way to handle the Want. For details, refer to: [Flags](#enum-flags).

**Type:** UInt32

**Read## enum AreaMode

```cangjie
public enum AreaMode <: Equatable<AreaMode> & ToString {
    | El1
    | El2
    | El3
    | El4
    | El5
    | ...
}
```

**Function:** Data encryption level.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Types:**

- Equatable\<AreaMode>
- ToString

### El1

```cangjie
El1
```

**Function:** Device-level encrypted area, accessible data zone after device boot.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### El2

```cangjie
El2
```

**Function:** User-level encrypted area, accessible data zone only after device boot and initial password entry.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### El3

```cangjie
El3
```

**Function:** User-level encrypted area with the following file permissions in different scenarios:

Opened files: Read/write allowed when locked; read/write allowed after unlock.

Unopened files: Cannot open or read/write when locked; can open and read/write after unlock.

New file creation: Can create, open, write (no read) when locked; can create, open, read/write after unlock.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### El4

```cangjie
El4
```

**Function:** User-level encrypted area with the following file permissions in different scenarios:

Opened files: No read/write when locked; read/write allowed after unlock.

Unopened files: Cannot open or read/write when locked; can open and read/write after unlock.

New file creation: Cannot create when locked; can create, open, read/write after unlock.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### El5

```cangjie
El5
```

**Function:** Application-level encrypted area with the following file permissions in different scenarios:

Opened files: Read/write allowed when locked; read/write allowed after unlock.

Unopened files: When locked, can open and read/write after calling Access interface to obtain retained key, otherwise cannot open or read/write; can open and read/write after unlock.

New file creation: Can create, open, read/write when locked; can create, open, read/write after unlock.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func !=(AreaMode)

```cangjie
public operator func !=(other: AreaMode): Bool
```

**Function:** Determines whether two enum values are unequal.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|other|[AreaMode](#enum-areamode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise false.|

### func ==(AreaMode)

```cangjie
public operator func ==(other: AreaMode): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|other|[AreaMode](#enum-areamode)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enum.|

## enum ErrorManagerEvent

```cangjie
public enum ErrorManagerEvent {
    | Error
}
```

**Function:** Represents event callback types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Error

```cangjie
Error
```

**Function:** Indicates the registered callback type is "Error".

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## enum Flags

```cangjie
public enum Flags <: Equatable<Flags> & ToString {
    | FlagAuthReadUriPermission
    | FlagAuthWriteUriPermission
    | FlagAuthPersistableUriPermission
    | FlagInstallOnDemand
    | FlagStartWithoutTips
    | ...
}
```

**Function:** Flags description. Used to indicate how to handle [Want](#class-want).

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parent Types:**

- Equatable\<Flags>
- ToString

### FlagAuthPersistableUriPermission

```cangjie
FlagAuthPersistableUriPermission
```

**Function:** Indicates the URI can be persisted by the receiver. This field only takes effect on tablet devices. Value: 0x00000040.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### FlagAuthReadUriPermission

```cangjie
FlagAuthReadUriPermission
```

**Function:** Indicates authorization to perform read operations on the URI. Value: 0x00000001.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### FlagAuthWriteUriPermission

```cangjie
FlagAuthWriteUriPermission
```

**Function:** Indicates authorization to perform write operations on the URI. Value: 0x00000002.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### FlagInstallOnDemand

```cangjie
FlagInstallOnDemand
```

**Function:** If the specified feature is not installed, install it. Value: 0x00000800.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### FlagStartWithoutTips

```cangjie
FlagStartWithoutTips
```

**Function:** If an implicit ability start cannot match any application, no prompt dialog will pop up. Value: 0x40000000.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### func !=(Flags)

```cangjie
public operator func !=(other: Flags): Bool
```

**Function:** Determines whether two enum values are unequal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Flags](#enum-flags)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are unequal, otherwise false.|

### func ==(Flags)

```cangjie
public operator func ==(other: Flags): Bool
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

|Name|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Flags](#enum-flags)|Yes|-|Another enum value.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if two enum values are equal, otherwise false.|

### func getValue()

```cangjie
public func getValue(): UInt32
```

**Function:** Gets the value represented by the current enum. Used to indicate how to handle [Want](#class-want).

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|UInt32|Value represented by the current enum.|

**Exceptions:**

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  |fontSizeScale must >= 0.0|Input parameter is less than 0.|Input a number greater than or equal to 0.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enum.|

## enum LastExitReason

```cangjie
public enum LastExitReason {
    | Unknown
    | Normal
    | CppCrash
    | AppFreeze
    | ...
}
```

**Function:** Reason for the last exit of an Ability. This enum type can be used with Ability's [onCreate(want, launchParam)](#func-oncreatewant-launchparam) method to perform corresponding operations based on different launchParam.lastExitReason types.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### AppFreeze

```cangjie
AppFreeze
```

**Function:** Application exited due to watchdog detecting an application freeze fault.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### CppCrash

```cangjie
CppCrash
```

**Function:** Application exited due to native exception signals.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Normal

```cangjie
Normal
```

**Function:** Application exited normally due to user-initiated closure.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Function:** Unknown reason.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21## enum LaunchReason

```cangjie
public enum LaunchReason {
    | Unknown
    | StartAbility
    | Call
    | Continuation
    | AppRecovery
    | ...
}
```

**Description:** The reason for initial Ability launch. This enumeration type can be used with the [onCreate(want, launchParam)](#func-oncreatewant-launchparam) method of Ability to perform corresponding operations based on different types of launchParam.launchReason.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### AppRecovery

```cangjie
AppRecovery
```

**Description:** Automatically restarts the Ability after application recovery when a fault occurs.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Call

```cangjie
Call
```

**Description:** Launches the Ability through the startAbilityByCall interface.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Continuation

```cangjie
Continuation
```

**Description:** Launches the Ability for cross-device migration.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### StartAbility

```cangjie
StartAbility
```

**Description:** Launches the Ability through the [startAbility](#func-startabilitywant) interface.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Unknown

```cangjie
Unknown
```

**Description:** Unknown reason.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## enum MemoryLevel

```cangjie
public enum MemoryLevel <: Equatable<MemoryLevel> & ToString {
    | MemoryLevelModerate
    | MemoryLevelLow
    | MemoryLevelCritical
    | ...
}
```

**Description:** Memory level, represented as an enumeration.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Types:**

- Equatable\<MemoryLevel>
- ToString

### MemoryLevelCritical

```cangjie
MemoryLevelCritical
```

**Description:** High memory usage.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### MemoryLevelLow

```cangjie
MemoryLevelLow
```

**Description:** Low memory usage.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### MemoryLevelModerate

```cangjie
MemoryLevelModerate
```

**Description:** Moderate memory usage.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func !=(MemoryLevel)

```cangjie
public operator func !=(other: MemoryLevel): Bool
```

**Description:** Determines whether two enumeration values are not equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MemoryLevel](#enum-memorylevel) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(MemoryLevel)

```cangjie
public operator func ==(other: MemoryLevel): Bool
```

**Description:** Determines whether two enumeration values are equal.

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [MemoryLevel](#enum-memorylevel) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the string representation of the current enumeration.

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enumeration. |

## enum OnContinueResult

```cangjie
public enum OnContinueResult {
    | Agree
    | Reject
    | Mismatch
    | ...
}
```

**Description:** Indicates agreement.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Agree

```cangjie
Agree
```

**Description:** Indicates agreement.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Mismatch

```cangjie
Mismatch
```

**Description:** Indicates version mismatch: The migration initiator can obtain the version number of the migration target application in [onContinue](cj-apis-ability.md#func-oncontinuestring). If the versions are incompatible, this error can be returned.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### Reject

```cangjie
Reject
```

**Description:** Indicates rejection: If an exception occurs in the application during [onContinue](cj-apis-ability.md#func-oncontinuestring), which may cause data recovery issues after migration, REJECT is recommended.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## enum Params

```cangjie
public enum Params <: Equatable<Params> & ToString {
    | AbilityBackToOtherMissionStack
    | AbilityRecoveryRestart
    | ContentTitleKey
    | ShareAbstractKey
    | ShareUrlKey
    | SupportContinuePageStackKey
    | SupportContinueSourceExitKey
    | ...
}
```

**Description:** Operations for [Want](#class-want) Params.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parent Types:**

- Equatable\<Params>
- ToString

### AbilityBackToOtherMissionStack

```cangjie
AbilityBackToOtherMissionStack
```

**Description:** Indicates whether cross-mission stack return is supported. Value: ability.params.backToOtherMissionStack.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### AbilityRecoveryRestart

```cangjie
AbilityRecoveryRestart
```

**Description:** Indicates whether the current Ability has restarted due to fault recovery. Value: ohos.ability.params.abilityRecoveryRestart.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### ContentTitleKey

```cangjie
ContentTitleKey
```

**Description:** Indicates the parameter operation for sharing titles supported by atomic services. Value: ohos.extra.param.key.contentTitle.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### ShareAbstractKey

```cangjie
ShareAbstractKey
```

**Description:** Indicates the source file of the page. Value: ohos.param.atomicservice.pageSourceFile.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### ShareUrlKey

```cangjie
ShareUrlKey
```

**Description:** Indicates the parameter operation for sharing content supported by atomic services. Value: ohos.extra.param.key.shareAbstract.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### SupportContinuePageStackKey

```cangjie
SupportContinuePageStackKey
```

**Description:** Indicates whether to migrate page stack information during cross-device migration. Default value is true, meaning page stack information is automatically migrated. Value: ohos.extra.param.key.supportContinuePageStack.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### SupportContinueSourceExitKey

```cangjie
SupportContinueSourceExitKey
```

**Description:** Indicates whether the source application exits during cross-device migration. Default value is true, meaning the source application exits automatically. Value: ohos.extra.param.key.supportContinueSourceExit.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### func !=(Params)

```cangjie
public operator func !=(other: Params): Bool
```

**Description:** Determines whether two enumeration values are not equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Params](#enum-params) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are not equal, otherwise returns false. |

### func ==(Params)

```cangjie
public operator func ==(other: Params): Bool
```

**Description:** Determines whether two enumeration values are equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| other | [Params](#enum-params) | Yes | - | Another enumeration value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the two enumeration values are equal, otherwise returns false. |

### func getValue()

```cangjie
public func getValue(): String
```

**Description:** Gets the value represented by the current enumeration. Used for [Want](#class-want) Params operations.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The value represented by the current enumeration. |

**Exceptions:**

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
|:----|:---|:---|
| fontSizeScale must >= 0.0 | The input parameter is less than 0. | Input a number greater than or equal to 0. |

### func toString()

```cangjie
public func toString(): String
```

**Description:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enumeration. |## enum ResultCode

```cangjie
public enum ResultCode {
    | ResultOk
    | ResultCancel
    | ...
}
```

**Function:** Result codes for modal dialog requests.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### ResultCancel

```cangjie
ResultCancel
```

**Function:** Indicates failure.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### ResultOk

```cangjie
ResultOk
```

**Function:** Indicates success.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## enum WantValueType

```cangjie
public enum WantValueType {
    | Int64Value(Int64)
    | Float64Value(Float64)
    | StringValue(String)
    | BoolValue(Bool)
    | ArrayValue(Array<WantValueType>)
    | HashMapValue(HashMap<String, WantValueType>)
    | ...
}
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### ArrayValue(Array\<WantValueType>)

```cangjie
ArrayValue(Array<WantValueType>)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### BoolValue(Bool)

```cangjie
BoolValue(Bool)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### Float64Value(Float64)

```cangjie
Float64Value(Float64)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### HashMapValue(HashMap\<String, WantValueType>)

```cangjie
HashMapValue(HashMap<String, WantValueType>)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### Int64Value(Int64)

```cangjie
Int64Value(Int64)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

### StringValue(String)

```cangjie
StringValue(String)
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Ability.AbilityBase

**Since:** 21

## enum WindowMode

```cangjie
public enum WindowMode {
    | WindowModeFullscreen
    | WindowModeSplitPrimary
    | WindowModeSplitSecondary
    | ...
}
```

**Function:** The window mode when starting an Ability, defined as an enumeration. Can be used with [startAbility](#func-startabilitywant) to specify the window mode for launching an Ability.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### WindowModeFullscreen

```cangjie
WindowModeFullscreen
```

**Function:** Fullscreen mode.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### WindowModeSplitPrimary

```cangjie
WindowModeSplitPrimary
```

**Function:** If the screen is in horizontal orientation, it represents left split-screen; if in vertical orientation, it represents top split-screen.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### WindowModeSplitSecondary

```cangjie
WindowModeSplitSecondary
```

**Function:** If the screen is in horizontal orientation, it represents right split-screen; if in vertical orientation, it represents bottom split-screen.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## interface SystemObjectInteropTypeToJS

```cangjie
public interface SystemObjectInteropTypeToJS {
    func toJSValue(context: JSContext): JSValue
}
```

**Function:** A specialized extension interface for system objects to enable conversion with [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**Function:** Converts a Cangjie object to [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext) | Yes | - | ArkTS interoperability context. |

**Return Value:**

| Type | Description |
|:----|:----|
| [JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue) | ArkTS unified type. |