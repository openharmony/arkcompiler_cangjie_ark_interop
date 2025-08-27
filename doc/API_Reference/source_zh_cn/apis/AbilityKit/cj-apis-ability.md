# ohos.app.ability

AbilityConstant提供Ability相关的枚举，包括应用启动原因LaunchReason、上次退出原因LastExitReason、迁移结果OnContinueResult等。

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

- 若示例代码首行有"// index.cj"注释，表示该示例可在仓颉模板工程的"index.cj"文件中编译运行。
- 若示例需获取[Context](#class-context)应用上下文，需在仓颉模板工程中的"main_ability.cj"文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func createAbilityStageContextFromJSValue(JSContext, JSValue)

```cangjie
public func createAbilityStageContextFromJSValue(context: JSContext, input: JSValue): AbilityStageContext
```

**功能：** 从JSValue转换为AbilityStageContext类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext)|是|-|ArkTS互操作上下文。|
|input|[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)|是|-|ArkTS统一类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[AbilityStageContext](#class-abilitystagecontext)|返回AbilityStageContext类型实例。|

## func createApplicationContextFromJSValue(JSContext, JSValue)

```cangjie
public func createApplicationContextFromJSValue(context: JSContext, input: JSValue): ApplicationContext
```

**功能：** 从[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)转换为[ApplicationContext](#class-applicationcontext)类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext)|是|-| ArkTS互操作上下文。|
|input|[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)|是|-|ArkTS统一类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[ApplicationContext](#class-applicationcontext)|返回 ApplicationContext 类型实例。|

## func createContextFromJSValue(JSContext, JSValue)

```cangjie
public func createContextFromJSValue(context: JSContext, input: JSValue): Context
```

**功能：** 从[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)转换为[Context](#class-context)类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext)|是|-| ArkTS互操作上下文。|
|input|[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)|是|-| ArkTS统一类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[Context](#class-context)|返回Context类型实例。|

## func createUIAbilityContextFromJSValue(JSContext, JSValue)

```cangjie
public func createUIAbilityContextFromJSValue(context: JSContext, input: JSValue): UIAbilityContext
```

**功能：** 从[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)转换为[AbilityContext](#class-abilitycontext)类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext)|是|-|ArkTS互操作上下文。|
|input|[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)|是|-|ArkTS统一类型。|

**返回值：**

|类型|说明|
|:----|:----|
|[UIAbilityContext](#class-uiabilitycontext)|返回AbilityContext类型实例。|

## func restartApp()

```cangjie
public func restartApp(): Unit
```

**功能：** 重启当前进程，并拉起应用启动时第一个Ability，如果该Ability存在已经保存的状态，这些状态数据会在Ability的OnCreate生命周期回调的want参数中作为wantParam属性传入。

启动由[setRestartWant](#func-setrestartwantwant)指定的Ability。如果没有指定则按以下规则启动：

如果当前应用前台的Ability支持恢复，则重新拉起该Ability。

如果存在多个支持恢复的Ability处于前台，则只拉起最后一个。

如果没有Ability处于前台，则不拉起。

可以配合[ErrorManager](#class-errormanager)相关接口使用。两次重启的间隔应大于一分钟，一分钟之内重复调用此接口只会退出应用不会重启应用。自动重启的行为与主动重启一致。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**示例：**

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

**功能：** [UIAbility](#class-uiability)和ExtensionAbility的基类，提供系统配置更新回调和系统内存调整回调。不支持开发者直接继承该基类。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### static func registerCreator(String, () -> Ability)

```cangjie
public static func registerCreator(name: String, creator: () -> Ability): Unit
```

**功能：** 注册BaseAbility的对应的creator。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|注册 UIAbility 的名称。|
|creator|()->[Ability](#class-ability)|是|-|注册BaseAbility的对应的creator。|

## class AbilityStage

```cangjie
public open class AbilityStage <: FFIData {}
```

**功能：** AbilityStage类提供在HAP加载的时候，通知开发者，可以在此进行该HAP的初始化（如资源预加载，线程创建等）能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [FFIData](<font color="red" face="bold">please add link</font>)

### prop context

```cangjie
public mut prop context: AbilityStageContext
```

**功能：** 定义AbilityStage的上下文。该上下文在Ability启动期间执行初始化时通过回调获得。

**类型：** [AbilityStageContext](#class-abilitystagecontext)

**读写能力：** 可读写

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

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|moduleName|String|是|-|注册AbilityStage的名称。|
|creator|()->[AbilityStage](#class-abilitystage)|是|-|注册AbilityStage的对应的 creator。|

### func onCreate()

```cangjie
public open func onCreate(): Unit
```

**功能：** [AbilityStage](#class-abilitystage)创建时回调，执行初始化业务逻辑操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class AbilityStageContext

```cangjie
public class AbilityStageContext <: Context {
    public var currentHapModuleInfo: HapModuleInfo
}
```

**功能：** [AbilityStageContext](#class-abilitystagecontext)提供允许访问特定于`abilityStage`的资源的能力，包括获取AbilityStage对应的`hapModuleInfo`对象、环境变化对象。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [Context](#class-context)

### var currentHapModuleInfo

```cangjie
public var currentHapModuleInfo: HapModuleInfo
```

**功能：** AbilityStage对应的`hapModuleInfo`对象。

**类型：** [HapModuleInfo](./cj-apis-bundle_manager.md#class-hapmoduleinfo)

**读写能力：** 可读写

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

## class Context

```cangjie
public open class Context <: BaseContext {}
```

**功能：** 提供ability或application的上下文的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [BaseContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)

### prop applicationInfo

```cangjie
public prop applicationInfo: ApplicationInfo
```

**功能：** 当前应用程序的信息。

**类型：** [ApplicationInfo](./cj-apis-bundle_manager.md#class-applicationinfo)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop area

```cangjie
public mut prop area: AreaMode
```

**功能：** 文件分区信息。

**类型：** [AreaMode](#enum-areamode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop filesDir

```cangjie
public prop filesDir: String
```

**功能：** 文件目录。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### prop resourceManager

```cangjie
public prop resourceManager: ResourceManager
```

**功能：** 资源管理对象。

**类型：** [ResourceManager](../LocalizationKit/cj-apis-resource_manager.md#class-resourcemanager)

**读写能力：** 只读

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class ErrorManager

```cangjie
public class ErrorManager {}
```

**功能：** 提供注册和注销错误观察器方法的类。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### static func off(ErrorManagerEvent, Int32)

```cangjie
public static func off(eventType: ErrorManagerEvent, observerId: Int32): Unit
```

**功能：** 注销主线程消息处理监听器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|eventType|[ErrorManagerEvent](#enum-errormanagerevent)|是|-|"Error"，表示错误观察器。|
|observerId|Int32|是|-|由on方法返回的观察器的index值。|

**异常：**

- BusinessException：对应错误码如下表，详见[元能力子系统错误码](../../../source_zh_cn/errorcodes/cj-errorcode-ability.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
| 16000003 | The specified ID does not exist. |

### static func on(ErrorManagerEvent, ErrorObserver)

```cangjie
public static func on(eventType: ErrorManagerEvent, observer: ErrorObserver): Int32
```

**功能：** 注册错误观测器。注册后程序如果出现crash，会触发未捕获异常机制。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|eventType|[ErrorManagerEvent](#enum-errormanagerevent)|是|-|"Error"，表示错误观察器。|
|observer|[ErrorObserver](#interface-errorobserver)|是|-|错误观察器。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|观察器的index值，和观察器一一对应。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[元能力子系统错误码](../../errorcodes/cj-errorcode-ability.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified;2. Incorrect parameter types; 3. Parameter verification failed. |
| 16000003 | The specified ID does not exist. |

## class LaunchParam

```cangjie
public class LaunchParam {
    public var launchReason: LaunchReason
    public var lastExitReason: LastExitReason
}
```

**功能：** 启动参数。Ability启动时由系统自动传入，开发者无需修改。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var lastExitReason

```cangjie
public var lastExitReason: LastExitReason
```

**功能：** 枚举类型，表示最后退出原因。

**类型：** [LastExitReason](#enum-lastexitreason)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var launchReason

```cangjie
public var launchReason: LaunchReason
```

**功能：** 枚举类型，表示启动原因。

**类型：** [LaunchReason](#enum-launchreason)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## class RequestResult

```cangjie
public class RequestResult {
    public var result: ResultCode
    public var want: Want
}
```

**功能：** 承载 `requestDialogService` 异步回调的请求结果，包含结果码 `result` 与附加数据 `want`，用于在应用与对话框服务之间传递结果及上下文信息。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var result

```cangjie
public var result: ResultCode
```

**功能：** 表示传入的请求结果，区分成功或取消等状态。

**类型：** [ResultCode](#enum-resultcode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var want

```cangjie
public var want: Want
```

**功能：** 表示传入的附加 `Want` 数据，用于在回调中携带额外业务参数。

**类型：** [Want](#class-want)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** 用于指定目标Ability的窗口模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var displayId

```cangjie
public var displayId: Int32
```

**功能：** 屏幕ID模式。默认是0，表示当前屏幕。

**类型：** Int32

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### var windowMode

```cangjie
public var windowMode:?WindowMode
```

**功能：** 启动Ability时的窗口模式，详见[WindowMode](#enum-windowmode)。

**类型：** ?[WindowMode](#enum-windowmode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### init(?WindowMode, Int32)

```cangjie
public init(
    windowMode!: ?WindowMode = None,
    displayId!: Int32 = 0
)
```

**功能：** StartOptions的构造器。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowMode|?[WindowMode](#enum-windowmode)|否|None|**命名参数。** 启动Ability时的窗口模式。|
|displayId|Int32|否|0|**命名参数。** 屏幕ID模式。默认是0，表示当前屏幕。|

## class UIAbility

```cangjie
public open class UIAbility <: Ability {}
```

**功能：** UIAbility是包含UI界面的应用组件，继承自BaseAbility，提供组件创建、销毁、前后台切换等生命周期回调，同时也具备组件协同的能力。组件协同主要提供如下常用功能：

- Caller：由startAbilityByCall接口返回，CallerAbility(调用者)可使用Caller与CalleeAbility(被调用者)进行通信。

- Callee：UIAbility的内部对象，CalleeAbility(被调用者)可以通过Callee与Caller进行通信。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

**父类型：**

- [Ability](#class-ability)

### prop context

```cangjie
public mut prop context: UIAbilityContext
```

**功能：** 上下文。

**类型：** [UIAbilityContext](#class-uiabilitycontext)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### prop lastRequestWant

```cangjie
public mut prop lastRequestWant: Want
```

**功能：** UIAbility最后请求时的参数。

**类型：** [Want](#class-want)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### prop launchWant

```cangjie
public mut prop launchWant: Want
```

**功能：** UIAbility启动时的参数。

**类型：** [Want](#class-want)

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### func onBackground()

```cangjie
public open func onBackground(): Unit
```

**功能：** UIAbility生命周期回调，当应用从前台转到后台时触发。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### func onCreate(Want, LaunchParam)

```cangjie
public open func onCreate(want: Want, launchParam: LaunchParam): Unit
```

**功能：** UIAbility创建时回调，执行初始化业务逻辑操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|当前UIAbility的Want类型信息，包括UIAbility名称、Bundle名称等。|
|launchParam|[LaunchParam](#class-launchparam)|是|-|创建 ability、上次异常退出的原因信息。|

### func onDestroy()

```cangjie
public open func onDestroy(): Unit
```

**功能：** UIAbility销毁时回调，执行资源清理等操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### func onForeground()

```cangjie
public open func onForeground(): Unit
```

**功能：** UIAbility生命周期回调，当应用从后台转到前台时触发。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

### func onNewWant(Want, LaunchParam)

```cangjie
public open func onNewWant(want: Want, launchParam: LaunchParam): Unit
```

**功能：** UIAbility实例已经启动并在前台运行过，由于某些原因切换到后台，再次启动该UIAbility实例时会回调执行该方法。即UIAbility实例热启动时进入该生命周期回调。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|当前UIAbility的Want类型信息，包括ability名称、bundle名称等。|
|launchParam|[LaunchParam](#class-launchparam)|是|-|Ability启动的原因、上次异常退出的原因信息。|

### func onWindowStageCreate(WindowStage)

```cangjie
public open func onWindowStageCreate(windowStage: WindowStage): Unit
```

**功能：** 当WindowStage创建后调用。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|windowStage|[WindowStage](#class-windowstage)|是|-|[WindowStage](#class-windowstage)相关信息。|

### func onWindowStageDestroy()

```cangjie
public open func onWindowStageDestroy(): Unit
```

**功能：** 当WindowStage销毁后调用。

**系统能力：** SystemCapability.Ability.AbilityRuntime.AbilityCore

**起始版本：** 21

## class UIAbilityContext

```cangjie
public open class UIAbilityContext <: Context {}
```

**功能：** 提供允许访问特定UIAbility的资源的能力。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- [Context](#class-context)

### func isTerminating()

```cangjie
public func isTerminating(): Bool
```

**功能：** 查询ability是否在terminating状态。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|true：ability当前处于terminating状态；false：不处于terminating状态。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 16000011 | The context does not exist. |

### func requestDialogService(Want, AsyncCallbackEx\<RequestResult>)

```cangjie
public func requestDialogService(want: Want, result: AsyncCallbackEx<RequestResult>): Unit
```

**功能：** 启动支持模式对话框的ServiceExtensionAbility，并使用回调返回结果。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|需要启动的目标ServiceExtensionAbility的want信息。|
|result|[AsyncCallbackEx](#type-asynccallbackex)\<[RequestResult](#class-requestresult)>|是|-| 用于返回结果的回调。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
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

### func requestDialogService(Want)

```cangjie
public func requestDialogService(want: Want): Future<RequestResult>
```

**功能：** 启动支持模式对话框的ServiceExtensionAbility，并返回结果。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|需要启动的目标ServiceExtensionAbility的want信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[Future](../../../../User_Manual/source_zh_cn/concurrency/use_thread.md#使用-futuret-等待线程结束并获取返回值)\<[RequestResult](#class-requestresult)>|返回执行结果。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
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

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
| 801 | Capability not support. |
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

**功能：** 携带启动参数，启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|启动Ability的want信息。|
|options|[StartOptions](#class-startoptions)|是|-|启动Ability所携带的参数。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
| 801 | Capability not support. |
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

**功能：** 启动Ability并在该Ability退出的时候返回执行结果（callback形式）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|启动Ability的want信息。|
|callback|[AsyncCallbackEx](#type-asynccallbackex)\<[AbilityResult](#class-abilityresult)>|是|-| 执行结果回调函数。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
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

**功能：** 启动Ability并在该Ability退出的时候返回执行结果（callback形式）。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|want|[Want](#class-want)|是|-|启动Ability的want信息。|
|options|[StartOptions](#class-startoptions)|是|-|启动Ability所携带的参数。|
|callback|[AsyncCallbackEx](#type-asynccallbackex)\<[AbilityResult](#class-abilityresult)>|是|-|执行结果回调函数。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 201 | The application does not have permission to call the interface. |
| 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
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

**功能：** 停止UIAbility自身。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 16000009 | An ability cannot be started or stopped in Wukong mode. |
| 16000011 | The context does not exist. |
| 16000050 | Internal error. |

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
|parameter|[AbilityResult](#class-abilityresult)|是|-|停止Ability，配合startAbilityForResult使用，返回给接口调用方AbilityResult信息。|

**异常：**

- BusinessException：对应错误码如下表。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1.Mandatory parameters are left unspecified. 2.Incorrect parameter types. |
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

**功能：** 创建相应的 Want。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var abilityName

```cangjie
public var abilityName: String
```

**功能：** 待启动Ability名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var action

```cangjie
public var action: String
```

**功能：** 要执行的通用操作（如：查看、分享、应用详情）。在隐式Want中，您可以定义该字段，配合uri或parameters来表示对数据要执行的操作。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var bundleName

```cangjie
public var bundleName: String
```

**功能：** 待启动Ability所在的应用Bundle名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var deviceId

```cangjie
public var deviceId: String
```

**功能：** 运行指定Ability的设备ID。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var entities

```cangjie
public var entities: Array<String>
```

**功能：** 目标Ability额外的类别信息（如：浏览器、视频播放器），在隐式Want中是对action字段的补充。在隐式Want中，您可以定义该字段，来过滤匹配Ability类型。

**类型：** Array\<String>

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var flags

```cangjie
public var flags: UInt32
```

**功能：** 处理Want的方式，具体参考：[Flags](#enum-flags)。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var moduleName

```cangjie
public var moduleName: String
```

**功能：** 待启动的Ability所属的模块名称。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var parameters

```cangjie
public var parameters: HashMap<String, WantValueType>
```

**功能：** 开发者自行决定传入的json字符串形式。

**类型：** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md#HashMap)\<String,[WantValueType](#enum-wantvaluetype)>

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var uri

```cangjie
public var uri: String
```

**功能：** Uri描述。如果在Want中指定了Uri，则Want将匹配指定的Uri信息，包括scheme, schemeSpecificPart, authority和path信息。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### var wantType

```cangjie
public var wantType: String
```

**功能：** 表示MIME type类型描述，打开文件的类型，主要用于文管打开文件。比如："text/xml" 、 "image/\*"等

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### init(String, String, String, String, UInt32, String, String, Array\<String>, String, HashMap\<String,WantValueType>, HashMap\<String,Int32>)

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
    wantType!: String = "",
    parameters!: HashMap<String, WantValueType> = HashMap<String, WantValueType>(),
    fds!: HashMap<String, Int32> = HashMap<String, Int32>()
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
|wantType|String|否|""|表示MIME type类型描述，打开文件的类型，主要用于文管打开文件。比如："text/xml" 、 "image/\*"等，MIME定义参考：[Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml?utm_source=ld246.com)。|
|parameters|[HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,[WantValueType](#enum-wantvaluetype)>|否| **命名参数。** 表示WantParams描述，由开发者自行决定传入的json风格的字符串。<br />- ohos.aafwk.param.callerAppIdentifier：表示拉起应用的AppIdentifier信息，值为字符串类型。<br />- ohos.aafwk.param.callerToken：表示拉起方的token，值为字符串类型。<br />- ohos.aafwk.param.callerUid：表示[BundleInfo](./cj-apis-bundle_manager.md#class-bundleinfo)中的uid，应用包里应用程序的uid，值为数值类型。<br />- component.startup.newRules：表示是否启用新的管控规则，值为布尔类型。<br />- moduleName：表示拉起方的moduleName，值为字符串类型。<br />- ability.params.backToOtherMissionStack：表示是否支持跨任务链返回，值为布尔类型。<br />- ohos.ability.params.abilityRecoveryRestart：表示当前Ability是否发生了故障恢复重启，值为布尔类型。<br />- ohos.extra.param.key.contentTitle：表示原子化服务支持分享的标题，值为字符串类型。<br />- ohos.extra.param.key.shareAbstract：表示原子化服务支持分享的内容，值为字符串类型。<br />- ohos.extra.param.key.shareUrl：表示原子化服务支持分享的链接，值为字符串类型。<br />- ohos.extra.param.key.supportContinuePageStack：表示在跨端迁移过程中是否迁移页面栈信息，值为布尔类型，默认值为true，自动迁移页面栈信息。<br />- ohos.extra.param.key.supportContinueSourceExit：表示跨端迁移源端应用是否退出，值为布尔类型，默认值为true，源端应用自动退出。<br />- ohos.extra.param.key.showMode：表示拉起原子化服务的展示模式，值为枚举类型[ShowMode](#enum-showmode)。<br />- ohos.dlp.params.sandbox：表示数据防泄漏（DLP）文件才会涉及。仅系统应用涉及。<br />- ohos.dlp.params.bundleName：表示数据防泄漏（DLP）的BundleName，值为字符串类型。仅系统应用涉及。<br />- ohos.dlp.params.moduleName：表示数据防泄漏（DLP）的moduleName，值为字符串类型。仅系统应用涉及。<br />- ohos.dlp.params.abilityName：表示数据防泄漏（DLP）的AbilityName，值为字符串类型。仅系统应用涉及。<br />- ohos.dlp.params.index：表示数据防泄漏（DLP）的索引，值为数值类型。仅系统应用涉及。<br />- ohos.ability.params.asssertFaultSessionId：表示AssertFault的会话ID，值为字符串类型。仅系统应用涉及。<br /><br />二、以下是由系统定义、开发者按需赋值的Key。<br />- ability.params.stream：指示携带的文件URI要授权给目标方，值为string类型的文件URI数组。<br />- ohos.extra.param.key.appCloneIndex：指示分身应用索引。<br /><br />三、除了上述两种情况，应用间还可以相互约定传入的键值对。<br /><br />**说明**：<br/>want的Params操作的常量的具体信息请参考[wantConstant](#enum-params)。|
|fds|[HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,Int32>|否|HashMap<String,Int32>()|表示文件描述符，在启动场景中拉起方写入的FD，会设置到该参数中。|

## enum AreaMode

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

**功能：** 数据加密等级。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- Equatable\<AreaMode>
- ToString

### El1

```cangjie
El1
```

**功能：** 设备级加密区，设备开机后可访问的数据区。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### El2

```cangjie
El2
```

**功能：** 用户级加密区，设备开机，首次输入密码后才能够访问的数据区。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### El3

```cangjie
El3
```

**功能：** 用户级加密区，不同场景的文件权限如下：

已打开文件：锁屏时，可读写；解锁后，可读写。

未打开文件：锁屏时，不可打开、不可读写；解锁后，可打开、可读写。

创建新文件：锁屏时，可创建、可打开、可写不可读；解锁后，可创建、可打开、可读写。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### El4

```cangjie
El4
```

**功能：** 用户级加密区，不同场景的文件权限如下：

已打开文件：锁屏时，不可读写；解锁后，可读写。

未打开文件：锁屏时，不可打开、不可读写；解锁后，可打开、可读写。

创建新文件：锁屏时，不可创建；解锁后，可创建、可打开、可读写。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### El5

```cangjie
El5
```

**功能：** 应用级加密区，不同场景的文件权限如下：

已打开文件：锁屏时，可读写；解锁后，可读写。

未打开文件：锁屏时，调用Access接口获取保留密钥后，可打开、可读写，否则不可打开、不可读写；解锁后，可打开、可读写。

创建新文件：锁屏时，可创建、可打开、可读写；解锁后，可创建、可打开、可读写。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func !=(AreaMode)

```cangjie
public operator func !=(other: AreaMode): Bool
```

**功能：** 判断两个枚举值是否不相等。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AreaMode](#enum-areamode)|是|-|另一个枚举值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|两个枚举值不相等返回true，否则返回false。|

### func ==(AreaMode)

```cangjie
public operator func ==(other: AreaMode): Bool
```

**功能：** 判断两个枚举值是否相等。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|other|[AreaMode](#enum-areamode)|是|-|另一个枚举值。|

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

## enum ErrorManagerEvent

```cangjie
public enum ErrorManagerEvent {
    | Error
}
```

**功能：** 表示事件回调类型。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Error

```cangjie
Error
```

**功能：** 表示注册回调的类型是"Error"。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** Flags说明。用于表示处理[Want](#class-want)的方式。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**父类型：**

- Equatable\<Flags>
- ToString

### FlagAuthPersistableUriPermission

```cangjie
FlagAuthPersistableUriPermission
```

**功能：** 指示该URI可被接收方持久化。该字段仅在平板类设备上生效。值为：0x00000040。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FlagAuthReadUriPermission

```cangjie
FlagAuthReadUriPermission
```

**功能：** 指示对URI执行读取操作的授权。值为：0x00000001。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FlagAuthWriteUriPermission

```cangjie
FlagAuthWriteUriPermission
```

**功能：** 指示对URI执行写入操作的授权。值为：0x00000002。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FlagInstallOnDemand

```cangjie
FlagInstallOnDemand
```

**功能：** 如果未安装指定的功能，请安装该功能。值为：0x00000800。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### FlagStartWithoutTips

```cangjie
FlagStartWithoutTips
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

**异常：**

- IllegalArgumentException：

| 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  |fontSizeScale must >= 0.0|传入参数小于0。|传入大于等于0的数。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

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

**功能：** Ability上次退出原因，该类型为枚举，可配合Ability的[onCreate(want, launchParam)](#func-oncreatewant-launchparam)方法根据launchParam.lastExitReason的不同类型执行相应操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### AppFreeze

```cangjie
AppFreeze
```

**功能：** 由于watchdog检测出应用Freeze故障，导致应用程序退出。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### CppCrash

```cangjie
CppCrash
```

**功能：** 本机异常信号，导致应用程序退出。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Normal

```cangjie
Normal
```

**功能：** 用户主动关闭，应用程序正常退出。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知原因。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## enum LaunchReason

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

**功能：** Ability初次启动原因，该类型为枚举，可配合Ability的[onCreate(want, launchParam)](#func-oncreatewant-launchparam)方法根据launchParam.launchReason的不同类型执行相应操作。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### AppRecovery

```cangjie
AppRecovery
```

**功能：** 设置应用恢复后，应用故障时自动恢复启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Call

```cangjie
Call
```

**功能：** 通过startAbilityByCall接口启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Continuation

```cangjie
Continuation
```

**功能：** 跨端迁移启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### StartAbility

```cangjie
StartAbility
```

**功能：** 通过[startAbility](#func-startabilitywant)接口启动Ability。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Unknown

```cangjie
Unknown
```

**功能：** 未知原因。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## enum MemoryLevel

```cangjie
public enum MemoryLevel <: Equatable<MemoryLevel> & ToString {
    | MemoryLevelModerate
    | MemoryLevelLow
    | MemoryLevelCritical
    | ...
}
```

**功能：** 内存级别，该类型为枚举。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**父类型：**

- Equatable\<MemoryLevel>
- ToString

### MemoryLevelCritical

```cangjie
MemoryLevelCritical
```

**功能：** 内存占用高。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### MemoryLevelLow

```cangjie
MemoryLevelLow
```

**功能：** 内存占用低。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### MemoryLevelModerate

```cangjie
MemoryLevelModerate
```

**功能：** 内存占用适中。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func !=(MemoryLevel)

```cangjie
public operator func !=(other: MemoryLevel): Bool
```

**功能：** 判断两个枚举值是否不相等。

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

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum OnContinueResult

```cangjie
public enum OnContinueResult {
    | Agree
    | Reject
    | Mismatch
    | ...
}
```

**功能：** 表示同意。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Agree

```cangjie
Agree
```

**功能：** 表示同意。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Mismatch

```cangjie
Mismatch
```

**功能：** 表示版本不匹配：迁移发起端应用可以在[onContinue](cj-apis-ability.md#func-oncontinuestring)中获取到迁移目标端应用的版本号，进行协商后，如果版本不匹配导致无法迁移，可以返回该错误。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### Reject

```cangjie
Reject
```

**功能：** 表示拒绝：如应用在[onContinue](cj-apis-ability.md#func-oncontinuestring)中异常会导致迁移以后数据恢复时显示异常，则可以建议REJECT。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** [Want](#class-want)的Params操作。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**父类型：**

- Equatable\<Params>
- ToString

### AbilityBackToOtherMissionStack

```cangjie
AbilityBackToOtherMissionStack
```

**功能：** 表示是否支持跨任务链返回。值为：ability.params.backToOtherMissionStack。
**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### AbilityRecoveryRestart

```cangjie
AbilityRecoveryRestart
```

**功能：** 指示当前Ability是否发生了故障恢复重启。值为：ohos.ability.params.abilityRecoveryRestart。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### ContentTitleKey

```cangjie
ContentTitleKey
```

**功能：** 指示元服务支持分享标题的参数的操作。值为：ohos.extra.param.key.contentTitle。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### ShareAbstractKey

```cangjie
ShareAbstractKey
```

**功能：** 指示页面源文件。值为：ohos.param.atomicservice.pageSourceFile。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### ShareUrlKey

```cangjie
ShareUrlKey
```

**功能：** 指示元服务支持分享内容的参数的操作。值为：ohos.extra.param.key.shareAbstract。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SupportContinuePageStackKey

```cangjie
SupportContinuePageStackKey
```

**功能：** 指示在跨端迁移过程中是否迁移页面栈信息，默认值为true，自动迁移页面栈信息。值为：ohos.extra.param.key.supportContinuePageStack。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### SupportContinueSourceExitKey

```cangjie
SupportContinueSourceExitKey
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

**功能：**  获取当前枚举的所表示的值。供[Want](#class-want)的Params操作使用。

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举所表示的值。|

**异常：**

- IllegalArgumentException：

| 错误信息 | 可能原因 | 处理步骤 |
  | :---- | :--- | :--- |
  |fontSizeScale must >= 0.0|传入参数小于0。|传入大于等于0的数。|

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum ResultCode

```cangjie
public enum ResultCode {
    | ResultOk
    | ResultCancel
    | ...
}
```

**功能：** 模态弹框请求结果码。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### ResultCancel

```cangjie
ResultCancel
```

**功能：** 表示失败。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### ResultOk

```cangjie
ResultOk
```

**功能：** 表示成功。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

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

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### ArrayValue(Array\<WantValueType>)

```cangjie
ArrayValue(Array<WantValueType>)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### BoolValue(Bool)

```cangjie
BoolValue(Bool)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### Float64Value(Float64)

```cangjie
Float64Value(Float64)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### HashMapValue(HashMap\<String, WantValueType>)

```cangjie
HashMapValue(HashMap<String, WantValueType>)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### Int64Value(Int64)

```cangjie
Int64Value(Int64)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

### StringValue(String)

```cangjie
StringValue(String)
```

**功能：** <font color="red" face="bold">please add description</font>

**系统能力：** SystemCapability.Ability.AbilityBase

**起始版本：** 21

## enum WindowMode

```cangjie
public enum WindowMode {
    | WindowModeFullscreen
    | WindowModeSplitPrimary
    | WindowModeSplitSecondary
    | ...
}
```

**功能：** 启动Ability时的窗口模式，类型为枚举。可配合[startAbility](#func-startabilitywant)使用，指定启动Ability的窗口模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WindowModeFullscreen

```cangjie
WindowModeFullscreen
```

**功能：** 全屏模式。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WindowModeSplitPrimary

```cangjie
WindowModeSplitPrimary
```

**功能：** 屏幕如果是水平方向表示左分屏，屏幕如果是竖直方向表示上分屏。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### WindowModeSplitSecondary

```cangjie
WindowModeSplitSecondary
```

**功能：** 屏幕如果是水平方向表示右分屏，屏幕如果是竖直方向表示下分屏。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

## interface SystemObjectInteropTypeToJS

```cangjie
public interface SystemObjectInteropTypeToJS {
    func toJSValue(context: JSContext): JSValue
}
```

**功能：** 系统对象专用的拓展接口，以实现与[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)的互转。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

### func toJSValue(JSContext)

```cangjie
func toJSValue(context: JSContext): JSValue
```

**功能：** 将仓颉对象转换成[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)。

**系统能力：** SystemCapability.Ability.AbilityRuntime.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[JSContext](../../arkinterop/cj-apis-ark_interop.md#class-jscontext)|是|-|ArkTS互操作上下文。|

**返回值：**

|类型|说明|
|:----|:----|
|[JSValue](../../arkinterop/cj-apis-ark_interop.md#class-jsvalue)|ArkTS统一类型。|