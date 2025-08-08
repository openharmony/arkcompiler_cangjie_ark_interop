# ohos.ability（Ability）

程序框架服务提供了应用程序开发和运行的应用模型，是系统为开发者提供的应用程序所需能力的抽象提炼，它提供了应用程序必备的组件和运行机制。有了应用模型，开发者可以基于一套统一的模型进行应用开发，使应用开发更简单、高效。

## 导入模块

```cangjie
import kit.AbilityKit.*
```

## 权限列表

ohos.permission.DISTRIBUTED_DATASYNC

ohos.permission.PREPARE_APP_TERMINATE

ohos.permission.PRIVACY_WINDOW

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func getNapiValue(CPointer\<Unit>, StageContext)

```cangjie
public func getNapiValue(env: CPointer<Unit>, context: StageContext): CPointer<Unit>
```

**功能：** 根据上下文环境获取napi_value。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|env| CPointer\<Unit> |是|环境指针。|
|context| [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) |是|上下文信息。|

## func getStageContext(UIAbilityContext)

```cangjie
public func getStageContext(abilityContext: UIAbilityContext): StageContext
```

**功能：** 将仓颉上下文转换成ArkTS上下文。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|abilityContext|[UIAbilityContext](#class-uiabilitycontext)|是|仓颉上下文信息。|

**返回值：**

|类型|说明|
|:----|:----|
| [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) |ArkTS上下文。|

## func restartApp()

```cangjie
public func restartApp(): Unit
```

**功能：** 重启当前进程，并拉起应用启动时第一个Ability，如果该Ability存在已经保存的状态，这些状态数据会在Ability的OnCreate生命周期回调的want参数中作为wantParam属性传入。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** AbilityStage类提供在HAP加载的时候，通知开发者，可以在此进行该HAP的初始化（如资源预加载，线程创建等）能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop context

```cangjie
public prop context: AbilityStageContext
```

**功能：** 提供允许访问特定于`abilityStage`的资源的能力，包括获取[AbilityStage](#class-abilitystage)对应的`hapModuleInfo`对象、环境变化对象。

**类型：** [AbilityStageContext](#class-abilitystagecontext)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### static func registerCreator(String, () -> AbilityStage)

```cangjie
public static func registerCreator(moduleName: String, creator: () -> AbilityStage): Unit
```

**功能：** 注册[AbilityStage](#class-abilitystage)的对应的creator。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

| 参数名  | 类型   | 必填 | 说明 |
| :------ | :---- | :--- | :-- |
| moduleName | String | 是 | 注册AbilityStage的名称。 |
| creator | () -> [AbilityStage](#class-abilitystage) | 是 |  注册AbilityStage的对应的creator。 |

### func onCreate()

```cangjie
public open func onCreate(): Unit
```

**功能：** [AbilityStage](#class-abilitystage)创建时回调，执行初始化业务逻辑操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class AbilityStageContext

```cangjie
public class AbilityStageContext <: Context {}
```

**功能：** [AbilityStageContext](#class-abilitystagecontext)提供允许访问特定于`abilityStage`的资源的能力，包括获取[AbilityStage](#class-abilitystage)对应的`hapModuleInfo`对象、环境变化对象。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [Context](#class-context)

### prop currentHapModuleInfo

```cangjie
public prop currentHapModuleInfo: HapModuleInfo
```

**功能：** [AbilityStage](#class-abilitystage)对应的`hapModuleInfo`对象。

**类型：** [HapModuleInfo](cj-apis-bundle_manager.md#struct-hapmoduleinfo)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class ApplicationContext

```cangjie
public class ApplicationContext <: Context {}
```

**功能：** 提供应用级别的的上下文的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [Context](#class-context)

### func getApplicationInfo()

```cangjie
public func getApplicationInfo(): ApplicationInfo
```

**功能：** 获取应用信息。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[ApplicationInfo](./cj-apis-bundle_manager.md#struct-applicationinfo)|当前应用程序的信息。|

### func getArea()

```cangjie
public func getArea(): Int64
```

**功能：** 功能辅助函数，仅适用于UItest测试框架。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|文件分区信息。|

## class BaseAbility

```cangjie
abstract sealed class BaseAbility {}
```

**功能：** [UIAbility](#class-uiability)的基类，提供系统配置更新回调和系统内存调整回调。不支持开发者直接继承该基类。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### static func registerCreator(String, () -> BaseAbility)

```cangjie
public static func registerCreator(name: String, creator: () -> BaseAbility): Unit
```

**功能：** 注册BaseAbility的对应的creator。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|注册UIAbility的名称。|
|creator|()->[BaseAbility](#class-baseability)|是|-|注册BaseAbility的对应的creator。|

## class Context

```cangjie
public open class Context {
    public let eventhub: EventHub = EventHub()
}
```

**功能：** 提供ability或application的上下文的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let eventhub

```cangjie
public let eventhub: EventHub = EventHub()
```

**功能：** 事件中心，提供订阅、取消订阅、触发事件对象。

**类型：** [EventHub](./cj-apis-eventhub.md#ohoseventhub)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class DialogRequestResult

```cangjie
public class DialogRequestResult {}
```

**功能：** Diaglog请求结果对象，在调用[requestDialogService](#func-requestdialogservicewant-asynccallbackdialogrequestresult)时返回此对象表明此次申请的结果。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var resultCode

```cangjie
public var resultCode: ResultCode
```

**功能：** 此次请求的结果码。

**类型：** [ResultCode](#enum-resultcode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var want

```cangjie
public var want:?Want
```

**功能：** 请求的want信息。

**类型：** ?[Want](#class-want)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class ElementName

```cangjie
public class ElementName {
    public init(deviceId: String, bundleName: String, abilityName: String, moduleName: String)
    public init(deviceId: String, bundleName: String, abilityName: String)
}
```

**功能：** ElementName信息。

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

### prop abilityName

```cangjie
public prop abilityName: String
```

**功能：** Ability名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

### prop bundleName

```cangjie
public prop bundleName: String
```

**功能：** 应用Bundle名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

### prop deviceId

```cangjie
public prop deviceId: String
```

**功能：** 设备ID。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

### prop moduleName

```cangjie
public prop moduleName: String
```

**功能：** Ability所属的HAP的模块名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

### init(String, String, String, String)

```cangjie
public init(deviceId: String, bundleName: String, abilityName: String, moduleName: String)
```

**功能：** 通过指定设备ID，应用Bundle名称，Ability名称，模块名称构造ElementName。

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|是|-|设备ID。|
|bundleName|String|是|-|应用Bundle名称。|
|abilityName|String|是|-|Ability名称。|
|moduleName|String|是|-|Ability所属的HAP的模块名称。|

### init(String, String, String)

```cangjie
public init(deviceId: String, bundleName: String, abilityName: String)
```

**功能：** 通过指定设备ID，应用Bundle名称，Ability名称构造ElementName。

**系统能力：** SystemCapability.BundleManager.BundleFramework.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|是|-|设备ID。|
|bundleName|String|是|-|应用Bundle名称。|
|abilityName|String|是|-|Ability名称。|

## class ErrorManager

```cangjie
public class ErrorManager {}
```

**功能：** 提供注册和注销错误观察器方法的类。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### static func off(String, Int32)

```cangjie
public static func off(offType: String, observerId: Int32): Unit
```

**功能：** 注销主线程消息处理监听器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offType|String|是|-|填写"error"，表示错误观察器。|
|observerId|Int32|是|-|由on方法返回的观察器的index值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[元能力子系统错误码](../../errorcodes/cj-errorcode-ability.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3. Parameter verification failed.|
  |16200003|Id does not exist.|

**示例：**

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

**功能：** 注册错误观测器。注册后程序如果出现crash，会触发未捕获异常机制。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|onType|String|是|-|填写"error"，表示错误观察器。|
|observer|[ErrorObserver](#struct-errorobserver)|是|-|错误观察器。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|观察器的index值，和观察器一一对应。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[元能力子系统错误码](../../errorcodes/cj-errorcode-ability.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2.Incorrect parameter types; 3. Parameter verification failed.|
  |16200001|The caller has been released.|

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

**功能：** 启动参数。Ability启动时由系统自动传入，开发者无需修改。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var lastExitReason

```cangjie
public var lastExitReason: LastExitReason = LastExitReason.NORMAL
```

**功能：** 枚举类型，表示最后退出原因。

**类型：** [LastExitReason](#enum-lastexitreason)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var launchReason

```cangjie
public var launchReason: LaunchReason = LaunchReason.UNKNOWN
```

**功能：** 枚举类型，表示启动原因。

**类型：** [LaunchReason](#enum-launchreason)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### init(LaunchReason, LastExitReason)

```cangjie
public init(
    launchReason!: LaunchReason = LaunchReason.UNKNOWN,
    lastExitReason!: LastExitReason = LastExitReason.NORMAL
)
```

**功能：** LaunchParam结构的构造器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|launchReason|[LaunchReason](#enum-launchreason)|否|LaunchReason.UNKNOWN| **命名参数。** 表示启动原因。|
|lastExitReason|[LastExitReason](#enum-lastexitreason)|否|LastExitReason.NORMAL| **命名参数。** 表示最后退出原因。|

## class OpenLinkOptions

```cangjie
public class OpenLinkOptions {
    public OpenLinkOptions(
        public let appLinkingOnly!: Bool = false,
        public let parameters!: String = ""
    )
}
```

**功能：** 用于标识是否仅打开AppLinking和传递键值对可选参数。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let appLinkingOnly

```cangjie
public let appLinkingOnly: Bool = false
```

**功能：** 表示是否必须以AppLinking的方式启动Ability：

- 取值为true时，如果不存在与AppLinking相匹配的Ability，直接返回。

- 取值为false时，如果不存在与AppLinking相匹配的Ability，AppLinking会退化为DeepLink。默认值为false。

aa命令隐式拉起Ability时可以通过设置"--pb appLinkingOnly true/false"以AppLinking的方式进行启动。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let parameters

```cangjie
public let parameters: String = ""
```

**功能：** 表示WantParams参数。具体使用规则请参考[Want](#class-want)中的parameters属性。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### OpenLinkOptions(Bool, String)

```cangjie
public OpenLinkOptions(
    public let appLinkingOnly!: Bool = false,
    public let parameters!: String = ""
)
```

**功能：** OpenLinkOptions主构造器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|appLinkingOnly|Bool|否|false| **命名参数。** 表示是否必须以AppLinking的方式启动UIAbility。|
|parameters|String|否|""| **命名参数。** 表示WantParams参数|

## class PermissionRequestResult

```cangjie
public class PermissionRequestResult {
    public PermissionRequestResult(
        public let permissions: Array<String>,
        public let authResults: Array<Int32>
    )
}
```

**功能：** 权限请求结果对象，在调用[requestPermissionsFromUser](./cj-apis-ability_access_ctrl.md#func-requestpermissionsfromuserstagecontext-arraypermissions-asynccallbackaccessctrlpermissionrequestresult)申请权限时返回此对象表明此次权限申请的结果。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### let authResults

```cangjie
public let authResults: Array<Int32>
```

**功能：** 相应请求权限的结果。

**类型：** Array\<Int32>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### let permissions

```cangjie
public let permissions: Array<String>
```

**功能：** 用户传入的权限。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

### PermissionRequestResult(Array\<String>, Array\<Int32>)

```cangjie
public PermissionRequestResult(
    public let permissions: Array<String>,
    public let authResults: Array<Int32>
)
```

**功能：** PermissionRequestResult实例构造。

**系统能力：** SystemCapability.Security.AccessToken

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|permissions|Array\<String>|是|-|用户传入的权限。|
|authResults|Array\<Int32>|是|-|相应请求权限的结果：<br>- -1：未授权。①dialogShownResults返回为true，表示用户首次申请；②dialogShownResults返回为false，表示权限已设置，无需弹窗，需要用户在"设置"中修改。<br>- 0：已授权。<br>- 2：未授权，表示请求无效。可能原因有：①未在设置文件中声明目标权限；②权限名非法；③部分权限存在特殊申请条件，在申请对应权限时未满足其指定的条件，见[ohos.permission.LOCATION](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionlocation)与[ohos.permission.APPROXIMATELY_LOCATION](../../../../Dev_Guide/source_zh_cn/security/AccessToken/cj-permissions-for-all-user.md#ohospermissionapproximately_location)。|

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

**功能：** 用于指定目标Ability的窗口模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var displayId

```cangjie
public var displayId: Int32 = 0
```

**功能：** 屏幕ID模式。默认是0，表示当前屏幕。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var windowMode

```cangjie
public var windowMode: WindowMode = WINDOW_MODE_UNDEFINED
```

**功能：** 启动Ability时的窗口模式，详见[WindowMode](#enum-windowmode)。

**类型：** [WindowMode](#enum-windowmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### init(WindowMode, Int32)

```cangjie
public init(
    windowMode!: WindowMode = WINDOW_MODE_UNDEFINED,
    displayId!: Int32 = 0
)
```

**功能：** StartOptions的构造器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowMode|[WindowMode](#enum-windowmode)|否|WINDOW_MODE_UNDEFINED| **命名参数。** 启动Ability时的窗口模式。|
|displayId|Int32|否|0| **命名参数。** 屏幕ID模式。默认是0，表示当前屏幕。|

## class UIAbility

```cangjie
public open class UIAbility <: BaseAbility {}
```

**功能：** UIAbility是包含UI界面的应用组件，继承自BaseAbility，提供组件创建、销毁、前后台切换等生命周期回调，同时也具备组件协同的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [BaseAbility](#class-baseability)

### prop context

```cangjie
public prop context: UIAbilityContext
```

**功能：** 上下文。

**类型：** [UIAbilityContext](#class-uiabilitycontext)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop lastRequestWant

```cangjie
public prop lastRequestWant: Want
```

**功能：** UIAbility最后请求时的参数。

**类型：** [Want](#class-want)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop launchWant

```cangjie
public prop launchWant: Want
```

**功能：** UIAbility启动时的参数。

**类型：** [Want](#class-want)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func onBackground()

```cangjie
public open func onBackground(): Unit
```

**功能：** UIAbility生命周期回调，当应用从前台转到后台时触发。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** UIAbility创建时回调，执行初始化业务逻辑操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|want|[Want](#class-want)|是|当前UIAbility的Want类型信息，包括UIAbility名称、Bundle名称等。|
|launchParam|[LaunchParam](#class-launchparam)|是|创建 ability、上次异常退出的原因信息。|

**示例：**

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

**功能：** UIAbility销毁时回调，执行资源清理等操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** UIAbility生命周期回调，当应用从后台转到前台时触发。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** UIAbility实例已经启动并在前台运行过，由于某些原因切换到后台，再次启动该UIAbility实例时会回调执行该方法。即UIAbility实例热启动时进入该生命周期回调。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|说明|
|:---|:---|:---|:---|
|want|[Want](#class-want)|是|当前UIAbility的Want类型信息，包括ability名称、bundle名称等。|
|launchParams|[LaunchParam](#class-launchparam)|是|Ability启动的原因、上次异常退出的原因信息。|

**示例：**

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

**功能：** 当WindowStage创建后调用。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowStage|[WindowStage](../../arkui-cj/cj-apis-window.md#class-windowstage)|是|-|[WindowStage](../../arkui-cj/cj-apis-window.md#class-windowstage)相关信息。|

### func onWindowStageDestroy()

```cangjie
public open func onWindowStageDestroy(): Unit
```

**功能：** 当WindowStage销毁后调用。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** 提供允许访问特定UIAbility的资源的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [Context](#class-context)

### prop filesDir

```cangjie
public prop filesDir: String
```

**功能：** 文件目录。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func isTerminating()

```cangjie
public func isTerminating(): Bool
```

**功能：** 查询ability是否在terminating状态。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

| 类型      | 说明        |
| :--------------- | :--------------- |
| Bool | true：ability当前处于terminating状态；false：不处于terminating状态。 |

### func requestDialogService(Want, AsyncCallback\<DialogRequestResult>)

```cangjie
public func requestDialogService(want: Want, callback: AsyncCallback<DialogRequestResult>): Unit
```

**功能：** 启动支持模式对话框的ServiceExtensionAbility，并使用回调返回结果。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

| 参数名 | 参数类型 | 必填 | 默认值 | 描述 |
|:------|:------|:------|:------|:------|
| want | [Want](#class-want) |  是 | - |  需要启动的目标ServiceExtensionAbility的want信息。 |
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[DialogRequestResult](#class-dialogrequestresult)> | 是 | - | 用于返回结果的回调。 |

### func requestDialogService(Want)

```cangjie
public func requestDialogService(want: Want): Future<DialogRequestResult>
```

**功能：** 启动支持模式对话框的ServiceExtensionAbility，并返回结果。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

| 参数名 | 参数类型 | 必填 | 默认值 | 描述 |
|:------|:------|:------|:------|:------|
| want | [Want](#class-want) |  是 | - |  需要启动的目标ServiceExtensionAbility的want信息。 |

**返回值：**

|类型|说明|
|:----|:----|
|Future\<[DialogRequestResult](#class-dialogrequestresult)>| 返回执行结果。|

### func startAbility(Want)

```cangjie
public func startAbility(want: Want): Future<Unit>
```

**功能：** 携带启动参数，启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|启动Ability的want信息。|

### func startAbility(Want, StartOptions)

```cangjie
public func startAbility(want: Want, options: StartOptions): Future<Unit>
```

**功能：** 携带启动参数，启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|启动Ability的want信息。|
|options|[StartOptions](#class-startoptions)|是|-|启动Ability所携带的参数。|

### func startAbilityForResult(Want, AsyncCallback\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, callback: AsyncCallback<AbilityResult>): Unit
```

**功能：** 启动Ability并在该Ability退出的时候返回执行结果（callback形式）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

| 参数名  | 类型   | 必填 | 说明 |
| :------- | :------ | :---- | :---- |
| want | [Want](#class-want) |  是 |   启动Ability的want信息。|
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[AbilityResult](#struct-abilityresult)> |  是 |   执行结果回调函数。|

### func startAbilityForResult(Want, StartOptions, AsyncCallback\<AbilityResult>)

```cangjie
public func startAbilityForResult(want: Want, options: StartOptions, callback: AsyncCallback<AbilityResult>): Unit
```

**功能：** 启动Ability并在该Ability退出的时候返回执行结果（callback形式）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

| 参数名  | 类型   | 必填 | 说明 |
| :------- | :------ | :---- | :---- |
| want | [Want](#class-want) |  是 |  启动Ability的want信息。|
| options | [StartOptions](#class-startoptions) |  是 |   启动Ability所携带的参数。|
| callback | [AsyncCallback](../BasicServicesKit/cj-apis-base.md#type-asynccallback)\<[AbilityResult](#struct-abilityresult)> |  是 |   执行结果回调函数。|

### func terminateSelf()

```cangjie
public func terminateSelf(): Future<Unit>
```

**功能：** 停止UIAbility自身。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

| 类型       | 说明                       |
| :----------| :-------------------------- |
| Future\<Unit> | Future对象可以获取thread的结果。 |

### func terminateSelfWithResult(AbilityResult)

```cangjie
public func terminateSelfWithResult(parameter: AbilityResult): Future<Unit>
```

**功能：** 停止UIAbility，配合startAbilityForResult使用，返回给接口调用方AbilityResult信息。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|parameter|[AbilityResult](#struct-abilityresult)|是|-|停止Ability，配合startAbilityForResult使用，返回给接口调用方AbilityResult信息。|

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

**功能：** Want是对象间信息传递的载体，可以用于应用组件间的信息传递。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop `type`

```cangjie
public prop `type`: String
```

**功能：** MIME type类型描述，打开文件的类型，主要用于文管打开文件。比如："text/xml" 、 "image/\*"等，MIME定义参考：[Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop abilityName

```cangjie
public prop abilityName: String
```

**功能：** 待启动Ability名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop action

```cangjie
public prop action: String
```

**功能：** 要执行的通用操作（如：查看、分享、应用详情）。在隐式Want中，您可以定义该字段，配合uri或parameters来表示对数据要执行的操作。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop bundleName

```cangjie
public prop bundleName: String
```

**功能：** 待启动Ability所在的应用Bundle名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop deviceId

```cangjie
public prop deviceId: String
```

**功能：** 运行指定Ability的设备ID。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop entities

```cangjie
public prop entities: Array<String>
```

**功能：** 目标Ability额外的类别信息（如：浏览器、视频播放器），在隐式Want中是对action字段的补充。在隐式Want中，您可以定义该字段，来过滤匹配Ability类型。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop flags

```cangjie
public prop flags: UInt32
```

**功能：** 处理Want的方式，具体参考：[Flags](#enum-flags)。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop moduleName

```cangjie
public prop moduleName: String
```

**功能：** 待启动的Ability所属的模块名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop parameters

```cangjie
public prop parameters: String
```

**功能：** 开发者自行决定传入的json字符串形式。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### prop uri

```cangjie
public prop uri: String
```

**功能：** Uri描述。如果在Want中指定了Uri，则Want将匹配指定的Uri信息，包括scheme, schemeSpecificPart, authority和path信息。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

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

**功能：** Want的构造函数。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deviceId|String|否|""| **命名参数。** 表示运行指定Ability的设备ID。|
|bundleName|String|否|""| **命名参数。** 表示包描述。如果在Want中同时指定了BundleName和AbilityName，则Want可以直接匹配到指定的Ability。|
|abilityName|String|否|""| **命名参数。** 表示待启动的Ability名称。如果在Want中该字段同时指定了bundleName和abilityName，则Want可以直接匹配到指定的Ability。AbilityName需要在一个应用的范围内保证唯一。|
|moduleName|String|否|""| **命名参数。** 表示待启动的Ability所属的模块（module）。|
|flags|UInt32|否|0| **命名参数。** flags表示处理Want的方式，具体参考：[flags 说明](#enum-flags)。|
|uri|String|否|""| **命名参数。** 表示Uri描述。如果在Want中指定了Uri，则Want将匹配指定的Uri信息，包括scheme, schemeSpecificPart, authority和path信息。|
|action|String|否|""| **命名参数。** 表示要执行的通用操作（如：查看、分享、应用详情）。在隐式Want中，您可以定义该字段，配合uri或parameters来表示对数据要执行的操作。|
|entities|Array\<String>|否|[]| **命名参数。** 表示目标Ability额外的类别信息（如：浏览器、视频播放器），在隐式Want中是对action字段的补充。在隐式Want中，您可以定义该字段，来过滤匹配Ability类型。|
|type|String|否|""|表示MIME type类型描述，打开文件的类型，主要用于文管打开文件。比如："text/xml" 、 "image/\*"等，MIME定义参考：[Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)。|
|parameters|String|否|""| **命名参数。** 表示WantParams描述，由开发者自行决定传入的json风格的字符串。|

## struct AbilityResult

```cangjie
public struct AbilityResult {
    public AbilityResult(
        public let resultCode: Int32,
        public let want: Want
    )
}
```

**功能：** 定义Ability拉起、销毁之后返回的结果码和数据。
可以通过startAbilityForResult获取对端Ability销毁后返回的AbilityResult对象，被startAbilityForResult拉起的Ability对象可以通过terminateSelfWithResult返回AbilityResult对象。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### let resultCode

```cangjie
public let resultCode: Int32
```

**功能：** 表示ability拉起、销毁之后返回的结果码。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### let want

```cangjie
public let want: Want
```

**功能：** 表示ability销毁之后返回的数据。

**类型：** [Want](#class-want)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### AbilityResult(Int32, Want)

```cangjie
public AbilityResult(
    public let resultCode: Int32,
    public let want: Want
)
```

**功能：** AbilityResult构造函数。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|resultCode|Int32|是|-|表示ability拉起、销毁之后返回的结果码。|
|want|[Want](#class-want)|是|-|表示ability销毁之后返回的数据。|

## struct ErrorObject

```cangjie
public struct ErrorObject {
    public let name: String
    public let message: String
    public let stack: Option<String>
    public init(name: String, message: String, stack!: Option<String> = None)
}
```

**功能：** 异常事件信息。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let message

```cangjie
public let message: String
```

**功能：** 异常事件消息。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 异常事件名字。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let stack

```cangjie
public let stack: Option<String>
```

**功能：** 异常事件错误堆栈信息。默认是None。

**类型：** Option\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### init(String, String, Option\<String>)

```cangjie
public init(name: String, message: String, stack!: Option<String> = None)
```

**功能：** ErrorObject的构造函数。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|异常事件名字。|
|message|String|是|-|异常事件消息。|
|stack|Option\<String>|否|None| **命名参数。** 异常事件错误堆栈信息。默认是None。|

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

**功能：** 定义异常监听，可以作为ErrorManager.on的入参监听当前应用发生的异常。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let onException

```cangjie
public let onException: Option <(ErrorObject) -> Unit>
```

**功能：** 该回调函数调用场景：在程序运行中抛出异常且该异常未被任务‘try-catch’语句成功捕获。`errObject`中包含了该未被捕获的异常的异常名称、异常信息与栈追踪。

**类型：** Option\<([ErrorObject](#struct-errorobject))->Unit>

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### let onUnhandledException

```cangjie
public let onUnhandledException:(String) -> Unit
```

**功能：** 该回调函数调用场景：在程序运行中抛出异常且该异常未被任务‘try-catch’语句成功捕获。`errMsg`的内容固定为`Uncaught exception was found.`。

**类型：** (String)->Unit

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### init((String) -> Unit, Option\<(ErrorObject) -> Unit>)

```cangjie
public init(
    onUnhandledException: (String) -> Unit,
    onException!: Option<(ErrorObject) -> Unit> = None
)
```

**功能：** ErrorObserver的构造函数。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|onUnhandledException|(String)->Unit|是|-|该回调函数调用场景：在程序运行中抛出异常且该异常未被任务‘try-catch’语句成功捕获。errMsg的内容固定为Uncaught exception was found.。|
|onException|Option\<([ErrorObject](#struct-errorobject))->Unit>|否|None| **命名参数。** 该回调函数调用场景：在程序运行中抛出异常且该异常未被任务‘try-catch’语句成功捕获。errObject中包含了该未被捕获的异常的异常名称、异常信息与栈追踪。|

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

**功能：** Flags说明。用于表示处理[Want](#class-want)的方式。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**父类型：**

- Equatable\<Flags>
- ToString

### FLAG_AUTH_PERSISTABLE_URI_PERMISSION

```cangjie
FLAG_AUTH_PERSISTABLE_URI_PERMISSION
```

**功能：** 指示该URI可被接收方持久化。该字段仅在平板类设备上生效。值为：0x00000040。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FLAG_AUTH_READ_URI_PERMISSION

```cangjie
FLAG_AUTH_READ_URI_PERMISSION
```

**功能：** 指示对URI执行读取操作的授权。值为：0x00000001。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FLAG_AUTH_WRITE_URI_PERMISSION

```cangjie
FLAG_AUTH_WRITE_URI_PERMISSION
```

**功能：** 指示对URI执行写入操作的授权。值为：0x00000002。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FLAG_INSTALL_ON_DEMAND

```cangjie
FLAG_INSTALL_ON_DEMAND
```

**功能：** 如果未安装指定的功能，请安装该功能。值为：0x00000800。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FLAG_START_WITHOUT_TIPS

```cangjie
FLAG_START_WITHOUT_TIPS
```

**功能：** 如果隐式启动能力不能匹配任何应用程序，则不会弹出提示对话框。值为：0x40000000。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### func !=(Flags)

```cangjie
public operator func !=(other: Flags): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Flags](#enum-flags)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Flags)

```cangjie
public operator func ==(other: Flags): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Flags](#enum-flags)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func getValue()

```cangjie
public func getValue(): UInt32
```

**功能：** 获取当前枚举的所表示的值。用于表示处理[Want](#class-want)的方式。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|UInt32|当前枚举所表示的值。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

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

**功能：** Ability上次退出原因，该类型为枚举，可配合Ability的[onCreate(want, launchParam)](#func-oncreatewant-launchparam)方法根据launchParam.lastExitReason的不同类型执行相应操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### ABILITY_NOT_RESPONDING

```cangjie
ABILITY_NOT_RESPONDING
```

**功能：** ability未响应。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### CPP_CRASH

```cangjie
CPP_CRASH
```

**功能：** 本机异常信号，导致应用程序退出。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### NORMAL

```cangjie
NORMAL
```

**功能：** 用户主动关闭，应用程序正常退出。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知原因。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** Ability初次启动原因，该类型为枚举，可配合Ability的[onCreate(want, launchParam)](#func-oncreatewant-launchparam)方法根据launchParam.launchReason的不同类型执行相应操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### CALL

```cangjie
CALL
```

**功能：** 通过startAbilityByCall接口启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### CONTINUATION

```cangjie
CONTINUATION
```

**功能：** 跨端迁移启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### START_ABILITY

```cangjie
START_ABILITY
```

**功能：** 通过[startAbility](#func-startabilitywant)接口启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### UNKNOWN

```cangjie
UNKNOWN
```

**功能：** 未知原因。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## enum MemoryLevel

```cangjie
public enum MemoryLevel <: Equatable<MemoryLevel> & ToString {
    | MEMORY_LEVEL_MODERATE
    | MEMORY_LEVEL_LOW
    | MEMORY_LEVEL_CRITICAL
    | ...
}
```

**功能：** 内存级别，该类型为枚举。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- Equatable\<MemoryLevel>
- ToString

### MEMORY_LEVEL_CRITICAL

```cangjie
MEMORY_LEVEL_CRITICAL
```

**功能：** 内存占用高。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### MEMORY_LEVEL_LOW

```cangjie
MEMORY_LEVEL_LOW
```

**功能：** 内存占用低。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### MEMORY_LEVEL_MODERATE

```cangjie
MEMORY_LEVEL_MODERATE
```

**功能：** 内存占用适中。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func !=(MemoryLevel)

```cangjie
public operator func !=(other: MemoryLevel): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MemoryLevel](#enum-memorylevel)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(MemoryLevel)

```cangjie
public operator func ==(other: MemoryLevel): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[MemoryLevel](#enum-memorylevel)|是|-|另一个枚举值|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum OnContinueResult

```cangjie
public enum OnContinueResult {
    | AGREE
    | REJECT
    | MISMATCH
    | ...
}
```

**功能：** Ability迁移结果，该类型为枚举。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### AGREE

```cangjie
AGREE
```

**功能：** 表示同意。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### MISMATCH

```cangjie
MISMATCH
```

**功能：** 表示版本不匹配。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### REJECT

```cangjie
REJECT
```

**功能：** 表示拒绝。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** [Want](#class-want)的Params操作。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**父类型：**

- Equatable\<Params>
- ToString

### ABILITY_BACK_TO_OTHER_MISSION_STACK

```cangjie
ABILITY_BACK_TO_OTHER_MISSION_STACK
```

**功能：** 表示是否支持跨任务链返回。值为：ability.params.backToOtherMissionStack。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### ABILITY_RECOVERY_RESTART

```cangjie
ABILITY_RECOVERY_RESTART
```

**功能：** 指示当前Ability是否发生了故障恢复重启。值为：ohos.ability.params.abilityRecoveryRestart。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### CONTENT_TITLE_KEY

```cangjie
CONTENT_TITLE_KEY
```

**功能：** 指示元服务支持分享标题的参数的操作。值为：ohos.extra.param.key.contentTitle。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SHARE_ABSTRACT_KEY

```cangjie
SHARE_ABSTRACT_KEY
```

**功能：** 指示元服务支持分享内容的参数的操作。值为：ohos.extra.param.key.shareAbstract。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SHARE_URL_KEY

```cangjie
SHARE_URL_KEY
```

**功能：** 指示元服务支持分享链接的参数的操作。值为：ohos.extra.param.key.shareUrl。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SUPPORT_CONTINUE_PAGE_STACK_KEY

```cangjie
SUPPORT_CONTINUE_PAGE_STACK_KEY
```

**功能：** 指示在跨端迁移过程中是否迁移页面栈信息，默认值为true，自动迁移页面栈信息。值为：ohos.extra.param.key.supportContinuePageStack。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SUPPORT_CONTINUE_SOURCE_EXIT_KEY

```cangjie
SUPPORT_CONTINUE_SOURCE_EXIT_KEY
```

**功能：** 指示跨端迁移源端应用是否退出，默认值为true，源端应用自动退出。值为：ohos.extra.param.key.supportContinueSourceExit。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### func !=(Params)

```cangjie
public operator func !=(other: Params): Bool 
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Params](#enum-params)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(Params)

```cangjie
public operator func ==(other: Params): Bool 
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[Params](#enum-params)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值相等返回true，否则返回false。|

### func getValue()

```cangjie
public func getValue(): String
```

**功能：** 获取当前枚举的所表示的值。供[Want](#class-want)的Params操作使用。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举所表示的值。|

### func toString()

```cangjie
public func toString(): String 
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum ResultCode

```cangjie
public enum ResultCode {
    | RESULT_OK
    | RESULT_CANCEL
    | ...
}
```

**功能：** 模态弹框请求结果码。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### RESULT_CANCEL

```cangjie
RESULT_CANCEL
```

**功能：** 表示失败。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### RESULT_OK

```cangjie
RESULT_OK
```

**功能：** 表示成功。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** 启动Ability时的窗口模式，类型为枚举。可配合[startAbility](#func-startabilitywant-startoptions)使用，指定启动Ability的窗口模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WINDOW_MODE_FULLSCREEN

```cangjie
WINDOW_MODE_FULLSCREEN
```

**功能：** 全屏模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WINDOW_MODE_SPLIT_PRIMARY

```cangjie
WINDOW_MODE_SPLIT_PRIMARY
```

**功能：** 屏幕如果是水平方向表示左分屏，屏幕如果是竖直方向表示上分屏。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WINDOW_MODE_SPLIT_SECONDARY

```cangjie
WINDOW_MODE_SPLIT_SECONDARY
```

**功能：** 屏幕如果是水平方向表示右分屏，屏幕如果是竖直方向表示下分屏。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WINDOW_MODE_UNDEFINED

```cangjie
WINDOW_MODE_UNDEFINED
```

**功能：** 未定义窗口模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## type Ability<sup>(deprecated)</sup>

```cangjie
public type Ability = UIAbility
```

**功能：** UIAbility的别名。

> **注意：**
>
> 从19版本开始废弃不再使用，可使用[UIAbility](#class-uiability)替代。

## type AbilityContext<sup>(deprecated)</sup>

```cangjie
public type AbilityContext = UIAbilityContext
```

**功能：** UIAbilityContext的别名。

> **注意：**
>
> 从19版本开始废弃不再使用，可使用[UIAbilityContext](#class-uiabilitycontext)替代。
