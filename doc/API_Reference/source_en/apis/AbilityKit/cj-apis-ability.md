# ohos.ability (Ability)

The application framework service provides an application model for application development and execution, which abstracts and refines the capabilities required by applications that the system offers to developers. It includes essential components and runtime mechanisms for applications. With this application model, developers can build applications based on a unified framework, making development simpler and more efficient.

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

- If the first line of a sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](#class-context) application context, it must be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## func getNapiValue(CPointer\<Unit>, StageContext)

```cangjie
public func getNapiValue(env: CPointer<Unit>, context: StageContext): CPointer<Unit>
```

**Description:** Retrieves the napi_value based on the context environment.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| env | CPointer\<Unit> | Yes | Environment pointer. |
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | Context information. |

## func getStageContext(UIAbilityContext)

```cangjie
public func getStageContext(abilityContext: UIAbilityContext): StageContext
```

**Description:** Converts the Cangjie context into an ArkTS context.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| abilityContext | [UIAbilityContext](#class-uiabilitycontext) | Yes | Cangjie context information. |

**Return Value:**

| Type | Description |
|:----|:----|
| [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | ArkTS context. |

## func restartApp()

```cangjie
public func restartApp(): Unit
```

**Description:** Restarts the current process and launches the first Ability when the application starts. If the Ability has saved state data, this data will be passed in the `wantParam` property of the `want` parameter in the Ability's `OnCreate` lifecycle callback.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*

AppLog.info("restartApp")
restartApp()
```

## class AbilityStage

```cangjie
public open class AbilityStage {}
```

**Description:** The AbilityStage class provides the capability to notify developers during HAP loading, allowing them to perform initialization tasks (such as resource preloading, thread creation, etc.) for the HAP.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### prop context

```cangjie
public prop context: AbilityStageContext
```

**Description:** Provides the ability to access resources specific to `AbilityStage`, including obtaining the `hapModuleInfo` object and environment change objects corresponding to [AbilityStage](#class-abilitystage).

**Type:** [AbilityStageContext](#class-abilitystagecontext)

**Access:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func registerCreator(String, () -> AbilityStage)

```cangjie
public static func registerCreator(moduleName: String, creator: () -> AbilityStage): Unit
```

**Description:** Registers the corresponding creator for [AbilityStage](#class-abilitystage).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:---|:---|:---|:---|
| moduleName | String | Yes | The name of the AbilityStage to register. |
| creator | () -> [AbilityStage](#class-abilitystage) | Yes | The corresponding creator for the AbilityStage. |

### func onCreate()

```cangjie
public open func onCreate(): Unit
```

**Description:** Callback triggered when [AbilityStage](#class-abilitystage) is created, used to execute initialization business logic.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class AbilityStageContext

```cangjie
public class AbilityStageContext <: Context {}
```

**Description:** [AbilityStageContext](#class-abilitystagecontext) provides the ability to access resources specific to `AbilityStage`, including obtaining the `hapModuleInfo` object and environment change objects corresponding to [AbilityStage](#class-abilitystage).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

### prop currentHapModuleInfo

```cangjie
public prop currentHapModuleInfo: HapModuleInfo
```

**Description:** The `hapModuleInfo` object corresponding to [AbilityStage](#class-abilitystage).

**Type:** [HapModuleInfo](cj-apis-bundle_manager.md#struct-hapmoduleinfo)

**Access:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class ApplicationContext

```cangjie
public class ApplicationContext <: Context {}
```

**Description:** Provides application-level context capabilities.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

### func getApplicationInfo()

```cangjie
public func getApplicationInfo(): ApplicationInfo
```

**Description:** Retrieves application information.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [ApplicationInfo](./cj-apis-bundle_manager.md#struct-applicationinfo) | Information about the current application. |

### func getArea()

```cangjie
public func getArea(): Int64
```

**Description:** A utility function, only applicable to the UItest testing framework.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | File partition information. |

## class BaseAbility

```cangjie
abstract sealed class BaseAbility {}
```

**Description:** The base class for [UIAbility](#class-uiability), providing system configuration update callbacks and system memory adjustment callbacks. Developers cannot directly inherit from this base class.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func registerCreator(String, () -> BaseAbility)

```cangjie
public static func registerCreator(name: String, creator: () -> BaseAbility): Unit
```

**Description:** Registers the corresponding creator for BaseAbility.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The name of the UIAbility to register. |
| creator | () -> [BaseAbility](#class-baseability) | Yes | - | The corresponding creator for BaseAbility. |

## class Context

```cangjie
public open class Context {
    public let eventhub: EventHub = EventHub()
}
```

**Description:** Provides context capabilities for abilities or applications.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### let eventhub

```cangjie
public let eventhub: EventHub = EventHub()
```

**Description:** Event hub, providing objects for subscribing, unsubscribing, and triggering events.

**Type:** [EventHub](./cj-apis-eventhub.md#ohoseventhub)

**Access:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21
## class DialogRequestResult

```cangjie
public class DialogRequestResult {}
```

**Function:** Dialog request result object, returned when invoking [requestDialogService](#func-requestdialogservicewant-asynccallbackdialogrequestresult) to indicate the outcome of this request.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var resultCode

```cangjie
public var resultCode: ResultCode
```

**Function:** Result code of this request.

**Type:** [ResultCode](#enum-resultcode)

**Access:** Read-write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var want

```cangjie
public var want:?Want
```

**Function:** The Want information of the request.

**Type:** ?[Want](#class-want)

**Access:** Read-write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

## class ElementName

```cangjie
public class ElementName {
    public init(deviceId: String, bundleName: String, abilityName: String, moduleName: String)
    public init(deviceId: String, bundleName: String, abilityName: String)
}
```

**Function:** ElementName information.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### prop abilityName

```cangjie
public prop abilityName: String
```

**Function:** Ability name.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### prop bundleName

```cangjie
public prop bundleName: String
```

**Function:** Application bundle name.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### prop deviceId

```cangjie
public prop deviceId: String
```

**Function:** Device ID.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### prop moduleName

```cangjie
public prop moduleName: String
```

**Function:** Module name of the HAP to which the Ability belongs.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

### init(String, String, String, String)

```cangjie
public init(deviceId: String, bundleName: String, abilityName: String, moduleName: String)
```

**Function:** Constructs an ElementName by specifying device ID, application bundle name, Ability name, and module name.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | Yes | - | Device ID. |
| bundleName | String | Yes | - | Application bundle name. |
| abilityName | String | Yes | - | Ability name. |
| moduleName | String | Yes | - | Module name of the HAP to which the Ability belongs. |

### init(String, String, String)

```cangjie
public init(deviceId: String, bundleName: String, abilityName: String)
```

**Function:** Constructs an ElementName by specifying device ID, application bundle name, and Ability name.

**System Capability:** SystemCapability.BundleManager.BundleFramework.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| deviceId | String | Yes | - | Device ID. |
| bundleName | String | Yes | - | Application bundle name. |
| abilityName | String | Yes | - | Ability name. |

## class ErrorManager

```cangjie
public class ErrorManager {}
```

**Function:** Class providing methods to register and unregister error observers.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### static func off(String, Int32)

```cangjie
public static func off(offType: String, observerId: Int32): Unit
```

**Function:** Unregisters the main thread message handler listener.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| offType | String | Yes | - | Enter "error" to indicate an error observer. |
| observerId | Int32 | Yes | - | The observer's index value returned by the on method. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 16200003 | Id does not exist. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.AbilityKit.*

try {
    let observerId: Int32 = 1
    ErrorManager.off("error", observerId)
} catch (e: BusinessException) {
    AppLog.info(e)
}
```

### static func on(String, ErrorObserver)

```cangjie
public static func on(onType: String, observer: ErrorObserver): Int32
```

**Function:** Registers an error observer. After registration, if the program crashes, the uncaught exception mechanism will be triggered.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| onType | String | Yes | - | Enter "error" to indicate an error observer. |
| observer | [ErrorObserver](#struct-errorobserver) | Yes | - | Error observer. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | The observer's index value, which corresponds one-to-one with the observer. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Ability Subsystem Error Codes](../../errorcodes/cj-errorcode-ability.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
  | 16200001 | The caller has been released. |

## class LaunchParam

```cangjie
public class LaunchParam {
    public var launchReason: LaunchReason = LaunchReason.UNKNOWN
    public var lastExitReason: LastExitReason = LastExitReason.NORMAL
    public init(
        launchReason!: LaunchReason = LaunchReason.UNKNOWN,
        lastExitReason!: LastExitReason = LastExitReason.NORMAL
    )
}
```

**Function:** Launch parameters. Automatically passed by the system when the Ability starts; developers do not need to modify them.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var lastExitReason

```cangjie
public var lastExitReason: LastExitReason = LastExitReason.NORMAL
```

**Function:** Enumeration type indicating the last exit reason.

**Type:** [LastExitReason](#enum-lastexitreason)

**Access:** Read-write

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### var launchReason

```cangjie
public var launchReason: LaunchReason = LaunchReason.UNKNOWN
```

**Function:** Enumeration type indicating the launch reason.

**Type:** [LaunchReason](#enum-launchreason)**Literacy:** Readable and Writable  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### init(LaunchReason, LastExitReason)  

```cangjie  
public init(  
    launchReason!: LaunchReason = LaunchReason.UNKNOWN,  
    lastExitReason!: LastExitReason = LastExitReason.NORMAL  
)  
```  

**Function:** Constructor for the LaunchParam structure.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| launchReason | [LaunchReason](#enum-launchreason) | No | LaunchReason.UNKNOWN | **Named parameter.** Indicates the launch reason. |  
| lastExitReason | [LastExitReason](#enum-lastexitreason) | No | LastExitReason.NORMAL | **Named parameter.** Indicates the last exit reason. |  

## class OpenLinkOptions  

```cangjie  
public class OpenLinkOptions {  
    public OpenLinkOptions(  
        public let appLinkingOnly!: Bool = false,  
        public let parameters!: String = ""  
    )  
}  
```  

**Function:** Used to identify whether to open only AppLinking and pass key-value pair optional parameters.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let appLinkingOnly  

```cangjie  
public let appLinkingOnly: Bool = false  
```  

**Function:** Indicates whether the Ability must be launched via AppLinking:  

- If set to `true`, returns directly if no matching Ability is found for AppLinking.  

- If set to `false`, AppLinking degrades to DeepLink if no matching Ability is found. Default value is `false`.  

When implicitly launching an Ability via the `aa` command, you can set `"--pb appLinkingOnly true/false"` to launch it via AppLinking.  

**Type:** Bool  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let parameters  

```cangjie  
public let parameters: String = ""  
```  

**Function:** Represents WantParams parameters. For specific usage rules, refer to the `parameters` property in [Want](#class-want).  

**Type:** String  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### OpenLinkOptions(Bool, String)  

```cangjie  
public OpenLinkOptions(  
    public let appLinkingOnly!: Bool = false,  
    public let parameters!: String = ""  
)  
```  

**Function:** Main constructor for OpenLinkOptions.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| appLinkingOnly | Bool | No | false | **Named parameter.** Indicates whether the UIAbility must be launched via AppLinking. |  
| parameters | String | No | "" | **Named parameter.** Represents WantParams parameters. |  

## class PermissionRequestResult  

```cangjie  
public class PermissionRequestResult {  
    public PermissionRequestResult(  
        public let permissions: Array<String>,  
        public let authResults: Array<Int32>  
    )  
}  
```  

**Function:** Permission request result object. This object is returned when calling [requestPermissionsFromUser](./cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult) to indicate the result of the permission request.  

**System Capability:** SystemCapability.Security.AccessToken  

**Initial Version:** 21  

### let authResults  

```cangjie  
public let authResults: Array<Int32>  
```  

**Function:** Results corresponding to the requested permissions.  

**Type:** Array\<Int32>  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Security.AccessToken  

**Initial Version:** 21  

### let permissions  

```cangjie  
public let permissions: Array<String>  
```  

**Function:** Permissions passed by the user.  

**Type:** Array\<String>  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Security.AccessToken  

**Initial Version:** 21  

### PermissionRequestResult(Array\<String>, Array\<Int32>)  

```cangjie  
public PermissionRequestResult(  
    public let permissions: Array<String>,  
    public let authResults: Array<Int32>  
)  
```  

**Function:** Constructor for PermissionRequestResult instance.  

**System Capability:** SystemCapability.Security.AccessToken  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| permissions | Array\<String> | Yes | - | Permissions passed by the user. |  
| authResults | Array\<Int32> | Yes | - | Results corresponding to the requested permissions: <br>- `-1`: Not authorized. ① If `dialogShownResults` returns `true`, it indicates the user's first request; ② If `dialogShownResults` returns `false`, it indicates the permission is already set, no popup is needed, and the user must modify it in "Settings". <br>- `0`: Authorized. <br>- `2`: Not authorized, indicating the request is invalid. Possible reasons: ① Target permission not declared in the configuration file; ② Invalid permission name; ③ Some permissions have special application conditions that were not met during the request, see [ohos.permission.LOCATION](../../../../Dev_Guide/source_en/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionlocation) and [ohos.permission.APPROXIMATELY_LOCATION](../../../../Dev_Guide/source_en/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionapproximately_location). |  

## class StartOptions  

```cangjie  
public open class StartOptions {  
    public var windowMode: WindowMode = WINDOW_MODE_UNDEFINED  
    public var displayId: Int32 = 0  
    public init(  
        windowMode!: WindowMode = WINDOW_MODE_UNDEFINED,  
        displayId!: Int32 = 0  
    )  
}  
```  

**Function:** Used to specify the window mode of the target Ability.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### var displayId  

```cangjie  
public var displayId: Int32 = 0  
```  

**Function:** Screen ID mode. Default is `0`, representing the current screen.  

**Type:** Int32  

**Read-Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### var windowMode  

```cangjie  
public var windowMode: WindowMode = WINDOW_MODE_UNDEFINED  
```  

**Function:** Window mode when launching the Ability. For details, see [WindowMode](#enum-windowmode).  

**Type:** [WindowMode](#enum-windowmode)  

**Read-Write Capability:** Readable and Writable  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### init(WindowMode, Int32)  

```cangjie  
public init(  
    windowMode!: WindowMode = WINDOW_MODE_UNDEFINED,  
    displayId!: Int32 = 0  
)  
```  

**Function:** Constructor for StartOptions.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| windowMode | [WindowMode](#enum-windowmode) | No | WINDOW_MODE_UNDEFINED | **Named parameter.** Window mode when launching the Ability. |  
| displayId | Int32 | No | 0 | **Named parameter.** Screen ID mode. Default is `0`, representing the current screen. |  

## class UIAbility  

```cangjie  
public open class UIAbility <: BaseAbility {}  
```  

**Function:** UIAbility is an application component that contains a UI interface. It inherits from BaseAbility and provides lifecycle callbacks such as component creation, destruction, and foreground/background switching, as well as component collaboration capabilities.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parent Type:**  

- [BaseAbility](#class-baseability)  

### prop context  

```cangjie  
public prop context: UIAbilityContext  
```  

**Function:** Context.  

**Type:** [UIAbilityContext](#class-uiabilitycontext)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### prop lastRequestWant  

```cangjie  
public prop lastRequestWant: Want  
```  

**Function:** Parameters from the last request of the UIAbility.  

**Type:** [Want](#class-want)  

**Read-Write Capability:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### prop launchWant
```cangjie
public prop launchWant: Want
```

**Description:** Parameters when starting a UIAbility.

**Type:** [Want](#class-want)

**Access:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func onBackground()

```cangjie
public open func onBackground(): Unit
```

**Description:** UIAbility lifecycle callback, triggered when the application transitions from foreground to background.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onBackground(): Unit {
        AppLog.info("onBackground called")
    }
}
```

### func onCreate(Want, LaunchParam)

```cangjie
public open func onCreate(want: Want, launchParam: LaunchParam): Unit
```

**Description:** Callback when UIAbility is created, used to execute initialization business logic operations.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Description |
|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | Want-type information of the current UIAbility, including UIAbility name, bundle name, etc. |
| launchParam | [LaunchParam](#class-launchparam) | Yes | Information about the reason for creating the ability and the last abnormal exit. |

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }
}
```

### func onDestroy()

```cangjie
public open func onDestroy(): Unit
```

**Description:** Callback when UIAbility is destroyed, used to perform resource cleanup and other operations.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onDestroy(): Unit {
        AppLog.info("onDestroy")
    }
}
```

### func onForeground()

```cangjie
public open func onForeground(): Unit
```

**Description:** UIAbility lifecycle callback, triggered when the application transitions from background to foreground.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onForeground(): Unit {
        AppLog.info("onForeground")
    }
}
```

### func onNewWant(Want, LaunchParam)

```cangjie
public open func onNewWant(want: Want, launchParams: LaunchParam): Unit
```

**Description:** Callback executed when a UIAbility instance has been started and run in the foreground before, transitions to the background for some reason, and is started again. This method is called during the hot start of the UIAbility instance.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Description |
|:---|:---|:---|:---|
| want | [Want](#class-want) | Yes | Want-type information of the current UIAbility, including ability name, bundle name, etc. |
| launchParams | [LaunchParam](#class-launchparam) | Yes | Information about the reason for starting the Ability and the last abnormal exit. |

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onNewWant(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility onNewWant.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }
}
```

### func onWindowStageCreate(WindowStage)

```cangjie
public open func onWindowStageCreate(windowStage: WindowStage): Unit
```

**Description:** Called after WindowStage is created.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| windowStage | [WindowStage](../../arkui-cj/cj-apis-window.md#class-windowstage) | Yes | - | Information about [WindowStage](../../arkui-cj/cj-apis-window.md#class-windowstage). |

### func onWindowStageDestroy()

```cangjie
public open func onWindowStageDestroy(): Unit
```

**Description:** Called after WindowStage is destroyed.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// main_ability.cj

import ohos.base.AppLog
import kit.AbilityKit.*

class MainAbility <: UIAbility {
    public override func onWindowStageDestroy(): Unit {
        AppLog.info("MainAbility onWindowStageDestroy.")
    }
}
```

## class UIAbilityContext

```cangjie
public open class UIAbilityContext <: Context {}
```

**Description:** Provides the capability to access resources specific to a UIAbility.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parent Type:**

- [Context](#class-context)

### prop filesDir

```cangjie
public prop filesDir: String
```

**Description:** File directory.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

### func isTerminating()

```cangjie
public func isTerminating(): Bool
```

**Description:** Queries whether the ability is in the terminating state.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Return Value:**

| Type      | Description        |
| :--------------- | :--------------- |
| Bool | true: The ability is currently in the terminating state; false: Not in the terminating state. |

### func requestDialogService(Want, AsyncCallback\<DialogRequestResult>)

```cangjie
public func requestDialogService(want: Want, callback: AsyncCallback<DialogRequestResult>): Unit
```

**Description:** Starts a ServiceExtensionAbility that supports modal dialogs and returns the result using a callback.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default | Description |
|:------|:------|:------|:------|:------|
| want | [Want](#class-want) |  Yes | - |  Want information of the target ServiceExtensionAbility to be started. |
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[DialogRequestResult](#class-dialogrequestresult)> | Yes | - | Callback used to return the result. |

### func requestDialogService(Want)

```cangjie
public func requestDialogService(want: Want): Future<DialogRequestResult>
```

**Function:** Starts a ServiceExtensionAbility that supports modal dialogs and returns the result.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:----------|:-----|:---------|:--------------|:------------|
| want | [Want](#class-want) | Yes | - | The Want information of the target ServiceExtensionAbility to be started. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Future\<[DialogRequestResult](#class-dialogrequestresult)> | Returns the execution result. |

### func startAbility(Want)

```cangjie
public func startAbility(want: Want): Future<Unit>
```

**Function:** Starts an Ability with startup parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:----------|:-----|:---------|:--------------|:------------|
| want | [Want](#class-want) | Yes | - | The Want information for starting the Ability. |

### func startAbility(Want, StartOptions)

```cangjie
public func startAbility(want: Want, options: StartOptions): Future<Unit>
```

**Function:** Starts an Ability with startup parameters.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:----------|:-----|:---------|:--------------|:------------|
| want | [Want](#class-want) | Yes | - | The Want information for starting the Ability. |
| options | [StartOptions](#class-startoptions) | Yes | - | The parameters carried when starting the Ability. |

### func startAbilityForResult(Want, AsyncCallback\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): Unit
```

**Function:** Starts an Ability and returns the execution result when the Ability exits (callback form).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:----------|:-----|:---------|:------------|
| want | [Want](#class-want) | Yes | The Want information for starting the Ability. |
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[AbilityResult](#struct-abilityresult)> | Yes | The callback function for the execution result. |

### func startAbilityForResult(Want, StartOptions, AsyncCallback\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): Unit
```

**Function:** Starts an Ability and returns the execution result when the Ability exits (callback form).

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Description |
|:----------|:-----|:---------|:------------|
| want | [Want](#class-want) | Yes | The Want information for starting the Ability. |
| options | [StartOptions](#class-startoptions) | Yes | The parameters carried when starting the Ability. |
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[AbilityResult](#struct-abilityresult)> | Yes | The callback function for the execution result. |

### func terminateSelf()

```cangjie
public func terminateSelf(): Future<Unit>
```

**Function:** Terminates the UIAbility itself.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:-----|:------------|
| Future\<Unit> | The Future object can obtain the thread result. |

### func terminateSelfWithResult(AbilityResult)

```cangjie
public func terminateSelfWithResult(parameter: AbilityResult): Future<Unit>
```

**Function:** Terminates the UIAbility and returns AbilityResult information to the caller when used with startAbilityForResult.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:----------|:-----|:---------|:--------------|:------------|
| parameter | [AbilityResult](#struct-abilityresult) | Yes | - | Terminates the Ability and returns AbilityResult information to the caller when used with startAbilityForResult. |

## class Want

```cangjie
public class Want {
    public init(
        deviceId!: String = "",
        bundleName!: String = "",
        abilityName!: String = "",
        moduleName!: String = "",
        flags!: UInt32 = 0,
        uri!: String = "",
        action!: String = "",
        entities!: Array<String> = [],
        `type`!: String = "",
        parameters!: String = ""
    )
}
```

**Function:** Want is a carrier for information transfer between objects and can be used for information transfer between application components.

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop `type`

```cangjie
public prop `type`: String
```

**Function:** MIME type description, mainly used for file management when opening files. For example: "text/xml", "image/*", etc. MIME definitions reference: [Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com).

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop abilityName

```cangjie
public prop abilityName: String
```

**Function:** The name of the Ability to be started.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop action

```cangjie
public prop action: String
```

**Function:** The general action to perform (e.g., view, share, app details). In implicit Want, you can define this field along with uri or parameters to indicate the action to perform on the data.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop bundleName

```cangjie
public prop bundleName: String
```

**Function:** The bundle name of the application where the target Ability resides.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop deviceId

```cangjie
public prop deviceId: String
```

**Function:** The device ID where the specified Ability runs.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop entities

```cangjie
public prop entities: Array<String>
```

**Function:** Additional category information for the target Ability (e.g., browser, video player), serving as a supplement to the action field in implicit Want. In implicit Want, you can define this field to filter matching Ability types.

**Type:** Array\<String>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop flags

```cangjie
public prop flags: UInt32
```

**Function:** The way to handle the Want, specific reference: [Flags](#enum-flags).

**Type:** UInt32

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop moduleName

```cangjie
public prop moduleName: String
```

**Function:** The module name to which the target Ability belongs.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

### prop parameters

```cangjie
public prop parameters: String
```

**Function:** A JSON string format determined by the developer.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Ability.AbilityBase
**Initial Version:** 21  

### prop uri  

```cangjie  
public prop uri: String  
```  

**Description:** URI description. If a URI is specified in the Want, the Want will match the specified URI information, including scheme, schemeSpecificPart, authority, and path.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### init(String, String, String, String, UInt32, String, String, Array\<String>, String, String)  

```cangjie  
public init(  
    deviceId!: String = "",  
    bundleName!: String = "",  
    abilityName!: String = "",  
    moduleName!: String = "",  
    flags!: UInt32 = 0,  
    uri!: String = "",  
    action!: String = "",  
    entities!: Array<String> = [],  
    `type`!: String = "",  
    parameters!: String = ""  
)  
```  

**Description:** Constructor for Want.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| deviceId | String | No | "" | **Named parameter.** Specifies the device ID for running the target Ability. |  
| bundleName | String | No | "" | **Named parameter.** Specifies the package description. If both BundleName and AbilityName are specified in the Want, the Want can directly match the target Ability. |  
| abilityName | String | No | "" | **Named parameter.** Specifies the name of the Ability to be started. If this field is specified along with bundleName in the Want, the Want can directly match the target Ability. The AbilityName must be unique within the scope of an application. |  
| moduleName | String | No | "" | **Named parameter.** Specifies the module to which the target Ability belongs. |  
| flags | UInt32 | No | 0 | **Named parameter.** Flags indicate how the Want is processed. For details, refer to: [Flags Description](#enum-flags). |  
| uri | String | No | "" | **Named parameter.** Specifies the URI description. If a URI is specified in the Want, the Want will match the specified URI information, including scheme, schemeSpecificPart, authority, and path. |  
| action | String | No | "" | **Named parameter.** Specifies the general action to be performed (e.g., view, share, app details). In an implicit Want, this field can be defined along with uri or parameters to indicate the action to be performed on the data. |  
| entities | Array\<String> | No | [] | **Named parameter.** Specifies additional category information for the target Ability (e.g., browser, video player). In an implicit Want, this field supplements the action field and filters matching Ability types. |  
| type | String | No | "" | Specifies the MIME type, mainly used for file management. For example: "text/xml", "image/\*", etc. MIME definitions refer to: [Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com). |  
| parameters | String | No | "" | **Named parameter.** Specifies the WantParams description, a JSON-style string defined by the developer. |  

## struct AbilityResult  

```cangjie  
public struct AbilityResult {  
    public AbilityResult(  
        public let resultCode: Int32,  
        public let want: Want  
    )  
}  
```  

**Description:** Defines the result code and data returned after an Ability is started or destroyed.  
The AbilityResult object can be obtained via startAbilityForResult after the target Ability is destroyed. The Ability started by startAbilityForResult can return the AbilityResult object via terminateSelfWithResult.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### let resultCode  

```cangjie  
public let resultCode: Int32  
```  

**Description:** Indicates the result code returned after the Ability is started or destroyed.  

**Type:** Int32  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### let want  

```cangjie  
public let want: Want  
```  

**Description:** Indicates the data returned after the Ability is destroyed.  

**Type:** [Want](#class-want)  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### AbilityResult(Int32, Want)  

```cangjie  
public AbilityResult(  
    public let resultCode: Int32,  
    public let want: Want  
)  
```  

**Description:** Constructor for AbilityResult.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| resultCode | Int32 | Yes | - | Indicates the result code returned after the Ability is started or destroyed. |  
| want | [Want](#class-want) | Yes | - | Indicates the data returned after the Ability is destroyed. |  

## struct ErrorObject  

```cangjie  
public struct ErrorObject {  
    public let name: String  
    public let message: String  
    public let stack: Option<String>  
    public init(name: String, message: String, stack!: Option<String> = None)  
}  
```  

**Description:** Defines exception event information.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let message  

```cangjie  
public let message: String  
```  

**Description:** Exception event message.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let name  

```cangjie  
public let name: String  
```  

**Description:** Exception event name.  

**Type:** String  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let stack  

```cangjie  
public let stack: Option<String>  
```  

**Description:** Exception event stack trace. Default is None.  

**Type:** Option\<String>  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### init(String, String, Option\<String>)  

```cangjie  
public init(name: String, message: String, stack!: Option<String> = None)  
```  

**Description:** Constructor for ErrorObject.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| name | String | Yes | - | Exception event name. |  
| message | String | Yes | - | Exception event message. |  
| stack | Option\<String> | No | None | **Named parameter.** Exception event stack trace. Default is None. |  

## struct ErrorObserver  

```cangjie  
public struct ErrorObserver {  
    public let onUnhandledException:(String) -> Unit  
    public let onException: Option <(ErrorObject) -> Unit>  
    public init(  
        onUnhandledException: (String) -> Unit,  
        onException!: Option<(ErrorObject) -> Unit> = None  
    )  
}  
```  

**Description:** Defines an exception listener, which can be passed as a parameter to ErrorManager.on to listen for exceptions in the current application.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let onException  

```cangjie  
public let onException: Option <(ErrorObject) -> Unit>  
```  

**Description:** This callback is triggered when an exception is thrown during program execution and not caught by any 'try-catch' block. `errObject` contains the uncaught exception's name, message, and stack trace.  

**Type:** Option\<([ErrorObject](#struct-errorobject))->Unit>  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### let onUnhandledException  

```cangjie  
public let onUnhandledException:(String) -> Unit  
```  

**Description:** This callback is triggered when an exception is thrown during program execution and not caught by any 'try-catch' block. `errMsg` is fixed as `Uncaught exception was found.`.  

**Type:** (String)->Unit  

**Access:** Read-only  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### init((String) -> Unit, Option\<(ErrorObject) -> Unit>)  

```cangjie  
public init(  
    onUnhandledException: (String) -> Unit,  
    onException!: Option<(ErrorObject) -> Unit> = None  
)  
```  

**Description:** Constructor for ErrorObserver.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| onUnhandledException | (String)->Unit | Yes | - | This callback is triggered when an exception is thrown during program execution and not caught by any 'try-catch' block. `errMsg` is fixed as `Uncaught exception was found.`. |  
| onException | Option\<([ErrorObject](#struct-errorobject))->Unit> | No | None | **Named parameter.** This callback is triggered when an exception is thrown during program execution and not caught by any 'try-catch' block. `errObject` contains the uncaught exception's name, message, and stack trace. |  

## enum Flags  

```cangjie  
public enum Flags <: Equatable<Flags> & ToString {  
    | FLAG_AUTH_READ_URI_PERMISSION  
    | FLAG_AUTH_WRITE_URI_PERMISSION  
    | FLAG_AUTH_PERSISTABLE_URI_PERMISSION  
    | FLAG_INSTALL_ON_DEMAND  
    | FLAG_START_WITHOUT_TIPS  
    | ...  
}  
```  

**Description:** Flags description. Used to indicate how a [Want](#class-want) is processed.**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parent Type:**  

- Equatable\<Flags>
- ToString  

### FLAG_AUTH_PERSISTABLE_URI_PERMISSION  

```cangjie  
FLAG_AUTH_PERSISTABLE_URI_PERMISSION  
```  

**Description:** Indicates that the URI can be persisted by the recipient. This flag only takes effect on tablet devices. Value: 0x00000040.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### FLAG_AUTH_READ_URI_PERMISSION  

```cangjie  
FLAG_AUTH_READ_URI_PERMISSION  
```  

**Description:** Indicates authorization to perform read operations on the URI. Value: 0x00000001.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### FLAG_AUTH_WRITE_URI_PERMISSION  

```cangjie  
FLAG_AUTH_WRITE_URI_PERMISSION  
```  

**Description:** Indicates authorization to perform write operations on the URI. Value: 0x00000002.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### FLAG_INSTALL_ON_DEMAND  

```cangjie  
FLAG_INSTALL_ON_DEMAND  
```  

**Description:** Installs the specified capability if it is not already installed. Value: 0x00000800.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### FLAG_START_WITHOUT_TIPS  

```cangjie  
FLAG_START_WITHOUT_TIPS  
```  

**Description:** If no application matches the implicit ability startup, no prompt dialog will be displayed. Value: 0x40000000.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### func !=(Flags)  

```cangjie  
public operator func !=(other: Flags): Bool  
```  

**Description:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:----------|:-----|:---------|:--------|:------------|  
| other | [Flags](#enum-flags) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |  

### func ==(Flags)  

```cangjie  
public operator func ==(other: Flags): Bool  
```  

**Description:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:----------|:-----|:---------|:--------|:------------|  
| other | [Flags](#enum-flags) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func getValue()  

```cangjie  
public func getValue(): UInt32  
```  

**Description:** Gets the value represented by the current enum. Used to indicate the processing method for [Want](#class-want).  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| UInt32 | The value represented by the current enum. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Description:** Gets the string representation of the current enum.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:-----|:------------|  
| String | The string representation of the current enum. |  

## enum LastExitReason  

```cangjie  
public enum LastExitReason {  
    | UNKNOWN  
    | ABILITY_NOT_RESPONDING  
    | NORMAL  
    | CPP_CRASH  
    | ...  
}  
```  

**Description:** The reason for the last exit of an Ability. This enum type can be used with the [onCreate(want, launchParam)](#func-oncreatewant-launchparam) method of an Ability to perform corresponding operations based on different types of `launchParam.lastExitReason`.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### ABILITY_NOT_RESPONDING  

```cangjie  
ABILITY_NOT_RESPONDING  
```  

**Description:** The Ability did not respond.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### CPP_CRASH  

```cangjie  
CPP_CRASH  
```  

**Description:** A native exception signal caused the application to exit.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### NORMAL  

```cangjie  
NORMAL  
```  

**Description:** The user actively closed the application, resulting in a normal exit.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### UNKNOWN  

```cangjie  
UNKNOWN  
```  

**Description:** Unknown reason.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

## enum LaunchReason  

```cangjie  
public enum LaunchReason {  
    | UNKNOWN  
    | START_ABILITY  
    | CALL  
    | CONTINUATION  
    | ...  
}  
```  

**Description:** The reason for the initial launch of an Ability. This enum type can be used with the [onCreate(want, launchParam)](#func-oncreatewant-launchparam) method of an Ability to perform corresponding operations based on different types of `launchParam.launchReason`.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### CALL  

```cangjie  
CALL  
```  

**Description:** The Ability was launched via the `startAbilityByCall` interface.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### CONTINUATION  

```cangjie  
CONTINUATION  
```  

**Description:** The Ability was launched via cross-device migration.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### START_ABILITY  

```cangjie  
START_ABILITY  
```  

**Description:** The Ability was launched via the [startAbility](#func-startabilitywant) interface.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### UNKNOWN  

```cangjie  
UNKNOWN  
```  

**Description:** Unknown reason.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

## enum MemoryLevel  

```cangjie  
public enum MemoryLevel <: Equatable<MemoryLevel> & ToString {  
    | MEMORY_LEVEL_MODERATE  
    | MEMORY_LEVEL_LOW  
    | MEMORY_LEVEL_CRITICAL  
    | ...  
}  
```  

**Description:** Memory level, represented as an enum.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core**Initial Version:** 21  

**Parent Types:**  

- Equatable\<MemoryLevel>  
- ToString  

### MEMORY_LEVEL_CRITICAL  

```cangjie  
MEMORY_LEVEL_CRITICAL  
```  

**Function:** High memory usage.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### MEMORY_LEVEL_LOW  

```cangjie  
MEMORY_LEVEL_LOW  
```  

**Function:** Low memory usage.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### MEMORY_LEVEL_MODERATE  

```cangjie  
MEMORY_LEVEL_MODERATE  
```  

**Function:** Moderate memory usage.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### func !=(MemoryLevel)  

```cangjie  
public operator func !=(other: MemoryLevel): Bool  
```  

**Function:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [MemoryLevel](#enum-memorylevel) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |  

### func ==(MemoryLevel)  

```cangjie  
public operator func ==(other: MemoryLevel): Bool  
```  

**Function:** Determines whether two enum values are equal.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [MemoryLevel](#enum-memorylevel) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Gets the string representation of the current enum.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | The string representation of the current enum. |  

## enum OnContinueResult  

```cangjie  
public enum OnContinueResult {  
    | AGREE  
    | REJECT  
    | MISMATCH  
    | ...  
}  
```  

**Function:** Ability migration result. This type is an enum.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### AGREE  

```cangjie  
AGREE  
```  

**Function:** Indicates agreement.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### MISMATCH  

```cangjie  
MISMATCH  
```  

**Function:** Indicates version mismatch.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

### REJECT  

```cangjie  
REJECT  
```  

**Function:** Indicates rejection.  

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core  

**Initial Version:** 21  

## enum Params  

```cangjie  
public enum Params <: Equatable<Params> & ToString {  
    | ABILITY_BACK_TO_OTHER_MISSION_STACK  
    | ABILITY_RECOVERY_RESTART  
    | CONTENT_TITLE_KEY  
    | SHARE_ABSTRACT_KEY  
    | SHARE_URL_KEY  
    | SUPPORT_CONTINUE_PAGE_STACK_KEY  
    | SUPPORT_CONTINUE_SOURCE_EXIT_KEY  
    | ...  
}  
```  

**Function:** [Want](#class-want) Params operations.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parent Types:**  

- Equatable\<Params>  
- ToString  

### ABILITY_BACK_TO_OTHER_MISSION_STACK  

```cangjie  
ABILITY_BACK_TO_OTHER_MISSION_STACK  
```  

**Function:** Indicates whether cross-mission stack return is supported. The value is: `ability.params.backToOtherMissionStack`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### ABILITY_RECOVERY_RESTART  

```cangjie  
ABILITY_RECOVERY_RESTART  
```  

**Function:** Indicates whether the current Ability has undergone recovery restart due to a fault. The value is: `ohos.ability.params.abilityRecoveryRestart`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### CONTENT_TITLE_KEY  

```cangjie  
CONTENT_TITLE_KEY  
```  

**Function:** Indicates the operation of the parameter for sharing titles supported by meta services. The value is: `ohos.extra.param.key.contentTitle`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### SHARE_ABSTRACT_KEY  

```cangjie  
SHARE_ABSTRACT_KEY  
```  

**Function:** Indicates the operation of the parameter for sharing content supported by meta services. The value is: `ohos.extra.param.key.shareAbstract`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### SHARE_URL_KEY  

```cangjie  
SHARE_URL_KEY  
```  

**Function:** Indicates the operation of the parameter for sharing URLs supported by meta services. The value is: `ohos.extra.param.key.shareUrl`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### SUPPORT_CONTINUE_PAGE_STACK_KEY  

```cangjie  
SUPPORT_CONTINUE_PAGE_STACK_KEY  
```  

**Function:** Indicates whether to migrate page stack information during cross-device migration. The default value is `true`, meaning page stack information is automatically migrated. The value is: `ohos.extra.param.key.supportContinuePageStack`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### SUPPORT_CONTINUE_SOURCE_EXIT_KEY  

```cangjie  
SUPPORT_CONTINUE_SOURCE_EXIT_KEY  
```  

**Function:** Indicates whether the source application exits during cross-device migration. The default value is `true`, meaning the source application automatically exits. The value is: `ohos.extra.param.key.supportContinueSourceExit`.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

### func !=(Params)  

```cangjie  
public operator func !=(other: Params): Bool  
```  

**Function:** Determines whether two enum values are not equal.  

**System Capability:** SystemCapability.Ability.AbilityBase  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| other | [Params](#enum-params) | Yes | - | Another enum value. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Bool | Returns `true` if the two enum values are not equal, otherwise returns `false`. |  

### func ==(Params)

```cangjie
public operator func ==(other: Params): Bool 
```

**Function:** Determines whether two enum values are equal.

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| other | [Params](#enum-params) | Yes | - | Another enum value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the two enum values are equal, otherwise returns `false`. |

### func getValue()

```cangjie
public func getValue(): String
```

**Function:** Retrieves the value represented by the current enum. Used for [Want](#class-want)'s Params operations.

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The value represented by the current enum. |

### func toString()

```cangjie
public func toString(): String 
```

**Function:** Retrieves the string representation of the current enum.

**System Capability:** SystemCapability.Ability.AbilityBase

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | The string representation of the current enum. |

## enum ResultCode

```cangjie
public enum ResultCode {
    | RESULT_OK
    | RESULT_CANCEL
    | ...
}
```

**Function:** Modal dialog request result codes.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### RESULT_CANCEL

```cangjie
RESULT_CANCEL
```

**Function:** Indicates failure.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### RESULT_OK

```cangjie
RESULT_OK
```

**Function:** Indicates success.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

## enum WindowMode

```cangjie
public enum WindowMode {
    | WINDOW_MODE_UNDEFINED
    | WINDOW_MODE_FULLSCREEN
    | WINDOW_MODE_SPLIT_PRIMARY
    | WINDOW_MODE_SPLIT_SECONDARY
    | ...
}
```

**Function:** Window mode when starting an Ability, represented as an enum. Can be used with [startAbility](#func-startabilitywant-startoptions) to specify the window mode for starting an Ability.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### WINDOW_MODE_FULLSCREEN

```cangjie
WINDOW_MODE_FULLSCREEN
```

**Function:** Full-screen mode.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### WINDOW_MODE_SPLIT_PRIMARY

```cangjie
WINDOW_MODE_SPLIT_PRIMARY
```

**Function:** If the screen is in horizontal orientation, it represents left split-screen; if vertical, it represents top split-screen.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### WINDOW_MODE_SPLIT_SECONDARY

```cangjie
WINDOW_MODE_SPLIT_SECONDARY
```

**Function:** If the screen is in horizontal orientation, it represents right split-screen; if vertical, it represents bottom split-screen.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

### WINDOW_MODE_UNDEFINED

```cangjie
WINDOW_MODE_UNDEFINED
```

**Function:** Undefined window mode.

**System Capability:** SystemCapability.Ability.AbilityRuntime.Core

**Initial Version:** 21

## type Ability<sup>(deprecated)</sup>

```cangjie
public type Ability = UIAbility
```

**Function:** Alias for UIAbility.

> **Note:**
>
> Deprecated since version 19 and no longer in use. Use [UIAbility](#class-uiability) instead.

## type AbilityContext<sup>(deprecated)</sup>

```cangjie
public type AbilityContext = UIAbilityContext
```

**Function:** Alias for UIAbilityContext.

> **Note:**
>
> Deprecated since version 19 and no longer in use. Use [UIAbilityContext](#class-uiabilitycontext) instead.