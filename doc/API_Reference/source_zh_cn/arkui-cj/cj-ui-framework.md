# 框架接口

此页面记录UI框架使用的公开接口，应用开发者禁止使用，否则会产生无法预期的结果。

## 导入模块

```cangjie
import kit.ArkUI.*
```

## func bind((CustomView) -> ViewBuilder, CustomView)

```cangjie
public func bind(builder: (CustomView) -> ViewBuilder, thisView: CustomView)
```

**功能：** 用于将@Builder修饰的函数与自定义组件对象进行绑定。详情见bind函数使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|([CustomView](#class-customview))->[ViewBuilder](#class-viewbuilder)|是|-|@Builder修饰的函数类型。|
|thisView|[CustomView](#class-customview)|是|-|当前自定义组件对象（一般为this）。|

## func bind\<T1, T2, T3>((CustomView,ObservedProperty\<T1>,ObservedProperty\<T2>,ObservedProperty\<T3>) -> ViewBuilder, CustomView)

```cangjie
public func bind<T1, T2, T3>(
    builder: (CustomView, ObservedProperty<T1>, ObservedProperty<T2>, ObservedProperty<T3>) -> ViewBuilder,
    thisView: CustomView
)
```

**功能：** 用于将@Builder修饰的函数与自定义组件对象进行绑定。详情见bind函数使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|([CustomView](#class-customview),[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T1>,[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T2>,[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T3>)->[ViewBuilder](#class-viewbuilder)|是|-|@Builder修饰的函数类型。|
|thisView|[CustomView](#class-customview)|是|-|当前自定义组件对象（一般为this）。|

## func bind\<T1, T2>((CustomView,ObservedProperty\<T1>,ObservedProperty\<T2>) -> ViewBuilder, CustomView)

```cangjie
public func bind<T1, T2>(
    builder: (CustomView, ObservedProperty<T1>, ObservedProperty<T2>) -> ViewBuilder,
    thisView: CustomView
)
```

**功能：** 用于将@Builder修饰的函数与自定义组件对象进行绑定。详情见bind函数使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|([CustomView](#class-customview),[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T1>,[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T2>)->[ViewBuilder](#class-viewbuilder)|是|-|@Builder修饰的函数类型。|
|thisView|[CustomView](#class-customview)|是|-|当前自定义组件对象（一般为this）。|

## func bind\<T1>((CustomView,ObservedProperty\<T1>) -> ViewBuilder, CustomView)

```cangjie
public func bind<T1>(builder: (CustomView, ObservedProperty<T1>) -> ViewBuilder, thisView: CustomView)
```

**功能：** 用于将@Builder修饰的函数与自定义组件对象进行绑定。详情见bind函数使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|builder|([CustomView](#class-customview),[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T1>)->[ViewBuilder](#class-viewbuilder)|是|-|@Builder修饰的函数类型。|
|thisView|[CustomView](#class-customview)|是|-|当前自定义组件对象（一般为this）。|

## func loadNativeView(CustomView)

```cangjie
public func loadNativeView(view: CustomView): Bool
```

**功能：** UI框架使用的基础函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|view|[CustomView](#class-customview)|是|-|-|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

## interface Observer

```cangjie
public interface Observer {
    func onStateUpdate(info: String, dependentElmtIds: ArrayList<Int64>): Unit
    func notifyRead(info: String): Unit
    func id(): Int64
    func aboutToBeDeleted(): Unit
}
```

**功能：** 持久化存储基类。内部接口，框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func aboutToBeDeleted()

```cangjie
func aboutToBeDeleted(): Unit
```

**功能：** 删除持久化存储对象，UI框架使用。

### func id()

```cangjie
func id(): Int64
```

**功能：** 获取持久化存储对象id。

**返回值：**

|类型|说明|
|:----|:----|
|Int64|持久化存储对象id。|

### func notifyRead(String)

```cangjie
func notifyRead(info: String): Unit
```

**功能：** UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|UI框架信息。|

### func onStateUpdate(String, ArrayList\<Int64>)

```cangjie
func onStateUpdate(info: String, dependentElmtIds: ArrayList<Int64>): Unit
```

**功能：** UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|-|
|dependentElmtIds|ArrayList\<Int64>|是|-|-|

## class CJEntry

```cangjie
public class CJEntry {}
```

**功能：** 用于提供被Native调用的全局函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func getInstance()

```cangjie
public static func getInstance(): CJEntry
```

**功能：** 创建并返回CJEntry对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[CJEntry](#class-cjentry)|对应的CJEntry对象。|

### func registerEntry(String, () -> Bool)

```cangjie
public func registerEntry(name: String, call: () -> Bool): Unit
```

**功能：** 设置应用开发者注册的应用入口。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|注册名称。|
|call|()->Bool|是|-|回调函数。|

## class CJPageEntry

```cangjie
public class CJPageEntry {}
```

**功能：** 用于提供被Native调用的全局函数。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func getInstance()

```cangjie
public static func getInstance(): CJPageEntry
```

**功能：** 创建并返回CJPageEntry对象。

**返回值：**

|类型|说明|
|:----|:----|
|[CJPageEntry](#class-cjpageentry)|对应的CJPageEntry对象。|

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func registerHybridPage(String, CustomView)

```cangjie
public func registerHybridPage(name: String, cjPage: CustomView): Unit
```

**功能：** 注册混合页面，UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|注册名称。|
|cjPage|[CustomView](#class-customview)|是|-|回调函数。|

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func removeHybridPage(String)

```cangjie
public func removeHybridPage(name: String): Unit
```

**功能：** 移除对应名称的混合页面。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|混合页面名称|

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class ContainerBase

```cangjie
public abstract class ContainerBase <: ViewBase {}
```

**功能：** UI框架使用的组件基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ViewBase](#class-viewbase)

### func initial()

```cangjie
public open override func initial()
```

**功能：** 初始化方法，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class CustomView

```cangjie
public abstract class CustomView <: RemoteView & Observer {
    public let nativeView: View
    public var isReusable: Bool = false
    public init(parent: Option<CustomView>, localStorage: Option<LocalStorage>)
}
```

**功能：** UI框架使用的组件基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- RemoteView
- Observer

### var isReusable

```cangjie
public var isReusable: Bool = false
```

**功能：** UI框架使用。

**类型：** Bool

**读写能力：** 可读写

### let nativeView

```cangjie
public let nativeView: View
```

**功能：** UI框架使用。

**类型：** [View](#class-view)

**读写能力：** 只读

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### init(Option\<CustomView>, Option\<LocalStorage>)

```cangjie
public init(parent: Option<CustomView>, localStorage: Option<LocalStorage>)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|parent|Option\<[CustomView](#class-customview)>|是|-|父组件。|
|localStorage|Option<[LocalStorage](./cj-state-rendering-appstatemanagement.md#class-localstorage)>|是|-|持久化存储对象。|

### static func create(CustomView)

```cangjie
public static func create(view: CustomView)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|view|[CustomView](#class-customview)|是|-|-|

### static func createRecycle(CustomView, Bool, String, () -> Unit)

```cangjie
public static func createRecycle(view: CustomView, isRecycling: Bool, name: String, callback: () -> Unit)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|view|[CustomView](#class-customview)|是|-|-|
|isRecycling|Bool|是|-|-|
|name|String|是|-|-|
|callback|()->Unit|是|-|-|

### func aboutToBeDeleted()

```cangjie
public func aboutToBeDeleted(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func aboutToRecycleInternal()

```cangjie
public override func aboutToRecycleInternal(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func aboutToReuseInternal(ReuseParams)

```cangjie
public override func aboutToReuseInternal(param: ReuseParams): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|param|[ReuseParams](../apis/BasicServicesKit/cj-apis-base.md#class-reuseparams)|是|-| -    |

### func addChildById(Int64, CustomView)

```cangjie
public func addChildById(id: Int64, child: CustomView): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|-|
|child|[CustomView](#class-customview)|是|-| -    |

### func addProvideVar(ObservedPropertyAbstract, String)

```cangjie
public func addProvideVar(value: ObservedPropertyAbstract, name: String)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|ObservedPropertyAbstract|是|-| -    |
|name|String|是| -      | -    |

### func build()

```cangjie
public func build(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func declareWatch\<T>(ObservedProperty\<T>, () -> Unit)

```cangjie
public func declareWatch<T>(propMember: ObservedProperty<T>, callBack: () -> Unit)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propMember|[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty)\<T>|是|-|-|
|callBack|()->Unit|是|-|-|

### func delayCompleteRerender(Bool)

```cangjie
public func delayCompleteRerender(deep: Bool)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deep|Bool|是|-| -    |

### func flushDelayCompleteRerender()

```cangjie
public func flushDelayCompleteRerender()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func forEachUpdateFunction\<T>(Int64, CollectionEx\<T>, (T,Int64) -> Unit, (T,Int64) -> String)

```cangjie
public func forEachUpdateFunction<T>(
    elmtId: Int64,
    arr: CollectionEx<T>,
    itemGenFunc!: (T, Int64) -> Unit,
    keyGeneratorFunc!: (T, Int64) -> String = {
        realData: T, idx: Int64 => match (realData) {
            case realDataStr: ToString => idx.toString() + "_" + realDataStr.toString()
            case _ => idx.toString()
        }
    }
): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elmtId|Int64|是|-|-|
|arr|[CollectionEx](../apis/BasicServicesKit/cj-apis-base.md#interface-collectionex)\<T>|是|-|-|
|itemGenFunc|(T,Int64)->Unit|是|-|**命名参数。** -|
|keyGeneratorFunc|(T,Int64)->String|否|{ realData: T, idx: Int64 => match(realData) { case realDataStr: ToString => idx.toString() + "_" + realDataStr.toString() case _ => idx.toString() } }|**命名参数。** -|

### func forceCompleteRerender(Bool)

```cangjie
public override func forceCompleteRerender(deep: Bool): Unit
```

**功能：** 强制刷新并重新渲染。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deep|Bool|是|-|是否递归刷新子组件。|

### func getLocalStorage()

```cangjie
public func getLocalStorage(): LocalStorage
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[LocalStorage](./cj-state-rendering-appstatemanagement.md#class-localstorage)|-|

### func id()

```cangjie
public func id(): Int64
```

**功能：** 设置目标控件id属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回指定目标控件id属性的对象。|

### func ifElseBranchUpdateFunction(Int32, () -> Unit)

```cangjie
public func ifElseBranchUpdateFunction(branchId: Int32, branchFunc: () -> Unit)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|branchId|Int32|是|-| -    |
|branchFunc|()->Unit|是|-|-|

### func initializeConsume(String)

```cangjie
public func initializeConsume(name: String): ObservedPropertyAbstract
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|-|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedPropertyAbstract|-|

### func markLazyForEachProcess(String)

```cangjie
public func markLazyForEachProcess(groupId: String): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|groupId|String|是|-|-|

### func notifyRead(String)

```cangjie
public func notifyRead(stateInfo: String): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|stateInfo|String|是|-|-|

### func observeComponentCreation(UpdateFuncNew)

```cangjie
public func observeComponentCreation(compilerAssignedUpdateFunc: UpdateFuncNew): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|compilerAssignedUpdateFunc|UpdateFuncNew|是|-|-|

### func observeRecycleComponentCreation(String, RecycleUpdateFunc)

```cangjie
public func observeRecycleComponentCreation(name: String, recycleUpdateFunc: RecycleUpdateFunc)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|-|
|recycleUpdateFunc|RecycleUpdateFunc|是|-|-|

### func onStateUpdate(String, ArrayList\<Int64>)

```cangjie
public func onStateUpdate(stateInfo: String, dependentElmtIds: ArrayList<Int64>): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|stateInfo|String|是|-|-|
|dependentElmtIds|ArrayList\<Int64>|是|-|-|

### func purgeDeletedElmtIds(ArrayList\<Int64>)

```cangjie
public func purgeDeletedElmtIds(rmElmtIds: ArrayList<Int64>)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rmElmtIds|ArrayList\<Int64>|是|-|-|

### func removeChildById(Int64)

```cangjie
public func removeChildById(id: Int64): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|-|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func removeChildGroupById(String)

```cangjie
public func removeChildGroupById(groupId: String): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|groupId|String|是|-|-|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func resetLazyForEachProcess()

```cangjie
public func resetLazyForEachProcess(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func resetRecycleCustomNode()

```cangjie
public func resetRecycleCustomNode()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func setParent(Option\<CustomView>)

```cangjie
public func setParent(parent: Option<CustomView>): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|parent|Option<[CustomView](#class-customview)>|是|-|-|

### func updateDirtyElements()

```cangjie
public func updateDirtyElements()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func updateElement(Int64)

```cangjie
public func updateElement(elmtId: Int64): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elmtId|Int64|是|-|-|

## class ForEach

```cangjie
public class ForEach <: UINodeBase {
    public init(subcomponent: () -> Unit)
}
```

**功能：** ForEach组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- UINodeBase

### init(() -> Unit)

```cangjie
public init(subcomponent: () -> Unit)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|subcomponent|()->Unit|是|-|子组件。|

### static func create\<T>(Int64, CustomView, CollectionEx\<T>, ItemGenFuncType\<T>, KeyGenFuncType\<T>)

```cangjie
public static func create<T>(viewID: Int64, parentView: CustomView, dataSource: CollectionEx<T>,
itemGeneratorFunc!: ItemGenFuncType<T>,
keyGeneratorFunc!: KeyGenFuncType<T> = {
    realData: T, idx: Int64 => match (realData) {
        case realDataStr: ToString => realDataStr.toString()
        case _ => idx.toString()
    }
}): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|viewID|Int64|是|-|组件id。|
|parentView|[CustomView](#class-customview)|是|-|父组件。|
|dataSource|[CollectionEx](../apis/BasicServicesKit/cj-apis-base.md#interface-collectionex)\<T>|是|-|数据源。|
|itemGeneratorFunc|ItemGenFuncType\<T>|是|-|**命名参数。** 组件生成函数。|
|keyGeneratorFunc|KeyGenFuncType\<T>|否|{ realData: T, idx: Int64 =>}|**命名参数。** 键值生成函数。|

### static func create()

```cangjie
public static func create()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func initial()

```cangjie
public func initial(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func pop()

```cangjie
public func pop(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func update()

```cangjie
public func update(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class HybridComponentBase

```cangjie
public open class HybridComponentBase <: SharedObject {}
```

**功能：** 混合组件基础类，供混合框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [SharedObject](../arkinterop/cj-apis-ark_interop.md#class-sharedobject)

### static func registerHybridComponent(String, () -> CPointer\<Unit>, () -> Unit)

```cangjie
public static func registerHybridComponent(compName: String, loadHandle: () -> CPointer<Unit>,
    unloadHandle: () -> Unit)
```

**功能：** 注册混合组件，UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|compName|String|是|-|组件名。|
|loadHandle|()->CPointer\<Unit>|是|-|组件加载处理器。|
|unloadHandle|()->Unit|是|-|组件卸载处理器。|

## class If

```cangjie
public class If <: UINodeBase {
    public init(subcomponent: () -> Unit)
}
```

**功能：** if/else组件的定义结构体，供UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- UINodeBase

### init(() -> Unit)

```cangjie
public init(subcomponent: () -> Unit)
```

**功能：**创建If类型对象。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|subcomponent|()->Unit|是|-|子组件。|

### static func branchId(Int32)

```cangjie
public static func branchId(value: Int32): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|-|

### static func getBranchId()

```cangjie
public static func getBranchId(): Int32
```

**功能：**UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|-|

### func initial()

```cangjie
public func initial(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func update()

```cangjie
public func update(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class InteractableView

```cangjie
abstract sealed class InteractableView {}
```

**功能：** 组件基类，更多方法详见仓颉组件的通用事件相关章节。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func onAppear(() -> Unit)

```cangjie
public func onAppear(event: () -> Unit): This
```

**功能：** 组件出现时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|组件出现时触发的回调函数。|

### func onAreaChange((Area,Area) -> Unit)

```cangjie
public func onAreaChange(event: (Area, Area) -> Unit): This
```

**功能：** 组件区域变化时触发该回调。仅会响应由布局变化所导致的组件大小、位置发生变化时的回调。

由绘制变化所导致的渲染属性变化不会响应回调，如translate、offset。若组件自身位置由绘制变化决定也不会响应回调，如bindSheet。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|([Area](./cj-common-types.md#class-area),[Area](./cj-common-types.md#class-area))->Unit|是|-|组件区域变化时触发该回调。<br/>参数一：变化前的组件区域信息。<br/>参数二：变化后的组件区域信息。|

### func onBlur(() -> Unit)

```cangjie
public func onBlur(event: () -> Unit): This
```

**功能：** 当前组件失去焦点时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|组件失去焦点时触发的回调函数。|

### func onDisAppear(() -> Unit)

```cangjie
public func onDisAppear(event: () -> Unit): This
```

**功能：** 组件消失时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|组件消失时触发的回调函数。|

### func onFocus(() -> Unit)

```cangjie
public func onFocus(event: () -> Unit): This
```

**功能：** 组件获得焦点时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|()->Unit|是|-|组件获得焦点时触发的回调函数。|

### func onVisibleAreaChange(Array\<Float64>, (Bool,Float64) -> Unit)

```cangjie
public func onVisibleAreaChange(raitos: Array<Float64>, event: (Bool, Float64) -> Unit): This
```

**功能：** 组件可见区域变化时触发该事件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|raitos|Array\<Float64>|是|-|可见区域比例数组。|
|event|(Bool,Float64)->Unit|是|-|可见区域变化时触发的回调函数。|

## class LocalStorageInterOp

```cangjie
class LocalStorageInterOp {}
```

**功能：** LocalStorage内部使用的类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func getOrCreate()

```cangjie

public static func getOrCreate(): LocalStorageInterOp
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[LocalStorageInterOp](#class-localstorageinterop)|获取或创建的LocalStorageInterOp对象。|

### func `prop`\<T>(String) where T \<: JSInteropType \<T>

```cangjie

public func `prop`<T>(propName: String): ObservedProperty<T> where T <: JSInteropType<T>
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|框架名称。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty\<T>|LocalStorageInterOp中的属性名。|

### func aboutToBeDeleted()

```cangjie

public func aboutToBeDeleted(): Bool
```

**功能：** 取消ObservedProperty实例对AppStorage/LocalStorage的单/双向同步关系，并无效化ObservedProperty实例，即当调用aboutToBeDeleted方法之后不能再使用ObservedProperty实例调用set或get方法。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func clear()

```cangjie

public func clear(): Bool
```

**功能：** 删除[LocalStorageInterOp](#class-localstorageinterop)中所有属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果LocalStorageInterOp中的属性已经没有订阅者则删除成功，返回true。否则返回false。|

### func delete(String)

```cangjie

public func delete(propName: String): Bool
```

**功能：** 在[LocalStorageInterOp](#class-localstorageinterop)中删除propName对应的属性。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorageInterOp中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果[LocalStorageInterOp](#class-localstorageinterop)中有对应的属性，且该属性已经没有订阅者，则删除成功，返回true。如果属性不存在，或者该属性还存在订阅者，则返回false。|

### func get\<T>(String) where T \<: JSInteropType \<T>

```cangjie

public func get<T>(propName: String): T where T <: JSInteropType<T>
```

**功能：** 获取propName在[LocalStorageInterOp](#class-localstorageinterop)中对应的属性值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|[LocalStorageInterOp](#class-localstorageinterop)中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|T|当前组件的实例。|

### func has(String)

```cangjie

public func has(propName: String): Bool
```

**功能：** 判断propName对应的属性是否在[LocalStorageInterOp](#class-localstorageinterop)中存在。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|[LocalStorageInterOp](#class-localstorageinterop)中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果propName对应的属性在[LocalStorageInterOp](#class-localstorageinterop)中存在，则返回true。不存在则返回false。|

### func hasChanged(JSContext, JSCallInfo)

```cangjie

public func hasChanged(context: JSContext, callInfo: JSCallInfo): JSValue
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|JSContext|是|-|互操作上下文。|
|callInfo|JSCallInfo|是|-|ArkTS函数调用的相关信息。|

**返回值：**

|类型|说明|
|:----|:----|
|JSValue|-|

### func keys()

```cangjie

public func keys()
```

**功能：** 返回LocalStorageInterOp中所有的属性名。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func link\<T>(String) where T \<: JSInteropType \<T>

```cangjie

public func link<T>(propName: String): ObservedProperty<T> where T <: JSInteropType<T>
```

**功能：** 与[LocalStorageInterOp](#class-localstorageinterop)中对应的propName建立双向数据绑定。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|LocalStorageInterOp中的属性名。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty\<T>|双向绑定的数据。|

### func set\<T>(String, T) where T \<: JSInteropType \<T>

```cangjie

public func set<T>(propName: String, value: T): Bool where T <: JSInteropType<T>
```

**功能：** 在[LocalStorageInterOp](#class-localstorageinterop)中设置propName对应属性的值。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|[LocalStorageInterOp](#class-localstorageinterop)中的属性名。|
|value|T|是|-|属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果[LocalStorageInterOp](#class-localstorageinterop)中不存在propName对应的属性，或设值失败，则返回false。设置成功则返回true。|

### func setAndLink\<T>(String, T) where T \<: JSInteropType \<T>

```cangjie

public func setAndLink<T>(propName: String, value: T): ObservedProperty<T> where T <: JSInteropType<T>
```

**功能：** 与[LocalStorageInterOp](#class-localstorageinterop)中对应的propName建立双向数据绑定。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|AppStorage中的属性名。|
|value|T|是|-|当propName在[LocalStorageInterOp](#class-localstorageinterop)中不存在时，使用defaultValue在[LocalStorageInterOp](#class-localstorageinterop)中初始化对应的propName。|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty\<T>|该propName对应的属性的双向绑定数据。|

### func setAndProp\<T>(String, T) where T \<: JSInteropType \<T>

```cangjie

public func setAndProp<T>(propName: String, value: T): ObservedProperty<T> where T <: JSInteropType<T>
```

**功能：** 与[LocalStorageInterOp](#class-localstorageinterop)中对应的propName建立单向属性绑定。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|[LocalStorageInterOp](#class-localstorageinterop)中的属性名。|
|value|T|是|-|当propName在[LocalStorageInterOp](#class-localstorageinterop)中不存在时，使用defaultValue在[LocalStorageInterOp](#class-localstorageinterop)中初始化对应的propName|

**返回值：**

|类型|说明|
|:----|:----|
|ObservedProperty\<T>|单向绑定的数据。|

### func setOrCreate\<T>(String, T) where T \<: JSInteropType \<T>

```cangjie

public func setOrCreate<T>(propName: String, value: T): Bool where T <: JSInteropType<T>
```

**功能：** 设置propName对应属性的值为newValue。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|propName|String|是|-|[LocalStorageInterOp](#class-localstorageinterop)中的属性名。|
|value|T|是|-|属性值。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|属性值设置结果。|

### func size()

```cangjie

public func size(): Int64
```

**功能：** 返回[LocalStorageInterOp](#class-localstorageinterop)中的属性数量。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|[LocalStorageInterOp](#class-localstorageinterop)中属性的数量。|

## class Observable

```cangjie
public open class Observable {}
```

**功能：** 框架状态管理使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func isSubscribed(Observer)

```cangjie

public func isSubscribed(observer: Observer): Bool
```

**功能：** 判断观察者是否订阅，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|订阅结果。|

### func numberOfSubscribers()

```cangjie

public func numberOfSubscribers(): Int64
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|观察者数量。|

### func subscribe(Observer)

```cangjie

public func subscribe(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

### func unsubscribe(Observer)

```cangjie

public func unsubscribe(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

### func unsubscribeAll()

```cangjie

public func unsubscribeAll(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class ObservedComplexAbstract

```cangjie
public abstract class ObservedComplexAbstract <: Observable {}
```

**功能：** 框架状态管理使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [Observable](#class-observable)

### func addPropsInfo(String)

```cangjie

public func addPropsInfo(info: String): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|属性信息。|

### func getInfo()

```cangjie

public func getInfo(): String
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|信息值。|

### func getPropsInfo()

```cangjie

public func getPropsInfo(): ArrayList<String>
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|ArrayList\<String>|属性信息数组。|

### func inheritObservers(ArrayList\<Observer>)

```cangjie

public func inheritObservers(newObservers: ArrayList<Observer>)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|newObservers|ArrayList\<[Observer](#interface-observer)>|是|-|观察者列表。|

### func notifyChanges()

```cangjie

public func notifyChanges()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func set(ObservedComplexAbstract)

```cangjie

public func set(v: ObservedComplexAbstract): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|v|[ObservedComplexAbstract](#class-observedcomplexabstract)|是|-|-|

### func setDependentElementIds(ArrayList\<Int64>)

```cangjie

public func setDependentElementIds(dependentElementIds: ArrayList<Int64>)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|dependentElementIds|ArrayList\<Int64>|是|-|-|

### func setInfo(String)

```cangjie

public func setInfo(info: String)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|-|

### func subscribeInner(Observer)

```cangjie

public func subscribeInner(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

### func unsubscribeInner(Observer)

```cangjie

public func unsubscribeInner(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

## class ObservedObject

```cangjie
public abstract class ObservedObject <: ObservedComplexAbstract {}
```

**功能：** 框架状态管理使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ObservedComplexAbstract](#class-observedcomplexabstract)

### func addPublishVar(ObservedPropertyAbstract)

```cangjie

public func addPublishVar(publishVar: ObservedPropertyAbstract)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|publishVar|[ObservedPropertyAbstract](#class-observedpropertyabstract)|是|-|-|

### func getPublishVar()

```cangjie

public func getPublishVar(): ArrayList<ObservedPropertyAbstract>
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|ArrayList\<[ObservedPropertyAbstract](#class-observedpropertyabstract)>|-|

### func subscribeInner(Observer)

```cangjie

public func subscribeInner(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

### func unsubscribeInner(Observer)

```cangjie

public func unsubscribeInner(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

## class ObservedPropertyAbstract

```cangjie
public abstract class ObservedPropertyAbstract <: Observable {

    public init(info: String)
}
```

**功能：** 框架状态管理使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [Observable](#class-observable)

### init(String)

```cangjie

public init(info: String)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|String|是|-|-|

### func getInfo()

```cangjie

public func getInfo(): String
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|-|

### func notifyChanges()

```cangjie

public func notifyChanges()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func purgeDependencyOnElmtId(Int64)

```cangjie

public func purgeDependencyOnElmtId(rmElmtId: Int64): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rmElmtId|Int64|是|-|-|

### func subscribeEx(Observer)

```cangjie

public func subscribeEx(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

### func unsubscribeEx(Observer)

```cangjie

public func unsubscribeEx(observer: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|observer|[Observer](#interface-observer)|是|-|观察者。|

## class SubscriberManager

```cangjie
public class SubscriberManager {}
```

**功能：** 框架状态管理使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func getInstance()

```cangjie

public static func getInstance(): SubscriberManager
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[SubscriberManager](#class-subscribermanager)|订阅管理器。|

### func add(Observer)

```cangjie

public func add(value: Observer): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Observer](#interface-observer)|是|-|观察者。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func delete(Observer)

```cangjie

public func delete(value: Observer): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|[Observer](#interface-observer)|是|-|观察者。|

### func dumpSubscriberInfo()

```cangjie

public func dumpSubscriberInfo(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func get(Int64)

```cangjie

public func get(id: Int64): Option<Observer>
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|观察者id。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<[Observer](#interface-observer)>|观察者。|

### func has(Int64)

```cangjie

public func has(id: Int64): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|观察者id。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|判断结果。|

### func makeId()

```cangjie

public func makeId(): Int64
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|id。|

### func sizeOfManager()

```cangjie

public func sizeOfManager(): Int64
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|管理器大小。|

## class LegalCallCheck

```cangjie
public class LegalCallCheck {}
```

**功能：** 检查组件生成是否合法，UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func check(ViewBuilder)

```cangjie
public static func check(_: ViewBuilder)
```

**功能：** UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|_|ViewBuilder|是|-|UI框架使用。|

### static func check(CustomView)

```cangjie
public static func check(_: CustomView)
```

**功能：** UI框架使用。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|_|CustomView|是|-|UI框架使用。|

## class View

```cangjie
public open class View <: ViewBase {}
```

**功能：** UI框架使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [ViewBase](#class-viewbase)

### static func create(View)

```cangjie
public static func create(view: View): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|view|[View](#class-view)|是|-|-|

### static func create(Int64)

```cangjie
public static func create(remoteId: Int64): View
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|remoteId|Int64|是|-|-|

**返回值：**

|类型|说明|
|:----|:----|
|[View](#class-view)|-|

### static func createRecycle(View, Bool, String, () -> Unit)

```cangjie
public static func createRecycle(componentCall: View, isRecycling: Bool, reuseId: String, callback: () -> Unit)
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|componentCall|[View](#class-view)|是|-|-|
|isRecycling|Bool|是|-|-|
|reuseId|String|是|-|-|
|callback|()->Unit|是|-|-|

### func deletedElmtIdsHaveBeenPurged(ArrayList\<Int64>)

```cangjie
public func deletedElmtIdsHaveBeenPurged(elmtIds: ArrayList<Int64>): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elmtIds|ArrayList\<Int64>|是|-|-|

### func destroy()

```cangjie
public func destroy(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func finishUpdateFunc(Int64)

```cangjie
public func finishUpdateFunc(elmtId: Int64): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elmtId|Int64|是|-|-|

### func getDeletedElemtIds()

```cangjie
public func getDeletedElemtIds(): ArrayList<Int64>
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|ArrayList\<Int64>|-|

### func isFirstRender()

```cangjie
public func isFirstRender(): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func isStatic()

```cangjie
public func isStatic(): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func markNeedUpdate()

```cangjie
public func markNeedUpdate(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func markStatic()

```cangjie
public func markStatic(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func needsUpdate()

```cangjie
public func needsUpdate(): Bool
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|-|

### func resetRecycleCustomNode()

```cangjie
public func resetRecycleCustomNode()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func restoreInstanceId()

```cangjie
public func restoreInstanceId(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func syncInstanceId()

```cangjie
public func syncInstanceId(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class ViewBase

```cangjie
public open class ViewBase <: InteractableView & UINodeBase {}
```

**功能：** 组件基类，更多方法详见仓颉组件的通用属性、手势处理、动画相关章节。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [InteractableView](#class-interactableview)
- UINodeBase

### func initial()

```cangjie
public open func initial(): Unit
```

**功能：** 初始化组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func update()

```cangjie
public open func update(): Unit
```

**功能：** 更新组件。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## class ViewBuilder

```cangjie
public class ViewBuilder {
    public ViewBuilder(public let build: () -> Unit)
}
```

**功能：** UI框架使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### let build

```cangjie
public let build:() -> Unit
```

**功能：** UI框架使用。

**类型：** ()->Unit

**读写能力：** 只读

### ViewBuilder(() -> Unit)

```cangjie
public ViewBuilder(public let build: () -> Unit)
```

**功能：** 创建ViewBuilder类型对象。

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|build|()->Unit|是|-|自定义组件。|

## class ViewStackProcessor

```cangjie
public class ViewStackProcessor {}
```

**功能：** UI框架使用的基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func AllocateNewElmetIdForNextComponent()

```cangjie

public static func AllocateNewElmetIdForNextComponent(): Int64
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|组件id。|

### static func GetElmtIdToAccountFor()

```cangjie

public static func GetElmtIdToAccountFor(): Int64
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int64|组件id。|

### static func ImplicitPopBeforeContinue()

```cangjie

public static func ImplicitPopBeforeContinue(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### static func StartGetAccessRecordingFor(Int64)

```cangjie

public static func StartGetAccessRecordingFor(elmtId: Int64): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|elmtId|Int64|是|-|-|

### static func StopGetAccessRecording()

```cangjie

public static func StopGetAccessRecording(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

## interface UINodeBase

```cangjie
public interface UINodeBase {
    func initial(): Unit
    func update(): Unit
}
```

**功能：** 组件的基类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func initial()

```cangjie
func initial(): Unit
```

**功能：** UI框架使用。

### func update()

```cangjie
func update(): Unit
```

**功能：** UI框架使用。

## class RemoteView

```cangjie
public abstract class RemoteView <: FFIData {
    public init()
}
```

**功能：** UI框架使用的组件基础类。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**父类型：**

- [FFIData](./cj-common-types.md#ffidata)

### init()

```cangjie
public init()
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func build()

```cangjie
public func build(): Unit // abstract
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

### func forceCompleteRerender(Bool)

```cangjie
public open func forceCompleteRerender(deep: Bool): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|deep|Bool|是|-|是否深度重新渲染。|

### func purgeVariableDependenciesOnElmtId(Int64)

```cangjie
public open func purgeVariableDependenciesOnElmtId(_: Int64): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|_|Int64|是|-|待移除元素id。|

### func rerender()

```cangjie
public open func rerender(): Unit
```

**功能：** UI框架使用。

**系统能力：** SystemCapability.ArkUI.ArkUI.Full

**起始版本：** 21
