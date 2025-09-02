# AppStorage: Application-wide UI State Storage

AppStorage is an application-wide UI state storage that is bound to the application process. It is created by the UI framework when the application starts, providing centralized storage for the application's UI state properties.

Unlike AppStorage, LocalStorage is page-level and typically used for data sharing within a page. AppStorage serves as application-level global state sharing and acts as the "hub" of the entire application. Both [PersistentStorage](./cj-persiststorage.md) and [Environment](./cj-environment.md) variables interact with the UI through AppStorage.

> **Note:**
>
> AppStorage only supports pure Cangjie scenarios and is not compatible with ArkTS and Cangjie mixed development scenarios.

This document focuses on AppStorage usage scenarios and related macros: @StorageProp and @StorageLink.

As an application-wide UI state storage, AppStorage differs from macros like @State that only propagate within the component tree. Its purpose is to provide developers with broader cross-ability basic data sharing. Before reading this document, developers are advised to understand the positioning of AppStorage in the state management framework. It's recommended to first read: [State Management Overview](cj-state-management-overview.md).

AppStorage also provides API interfaces that allow developers to manually trigger CRUD operations for corresponding keys in AppStorage outside custom components. It's recommended to read alongside the [AppStorage API Documentation](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-appstatemanagement.md#appstorage应用全局的ui状态存储).

## Overview

AppStorage is a singleton created when the application launches. Its purpose is to provide centralized storage for application state data that is accessible at the application level. AppStorage maintains its properties throughout the application's runtime. Properties are accessed through unique string key values.

AppStorage can synchronize with UI components and can be accessed in application business logic.

Properties in AppStorage can be bidirectionally synchronized. Data may exist locally or on remote devices, with different functionalities like data persistence (see [PersistentStorage](./cj-persiststorage.md)). This data is implemented in business logic, decoupled from the UI. To use this data in the UI, [@StorageProp](#storageprop) and [@StorageLink](#storagelink) are required.

## @StorageProp

As mentioned earlier, to establish a connection between AppStorage and custom components, the @StorageProp and @StorageLink macros are needed. Decorating variables within components with @StorageProp(key)/@StorageLink(key) associates them with AppStorage properties, where key identifies the AppStorage property.

When a custom component initializes, the variables decorated with @StorageProp(key)/@StorageLink(key) are initialized using the corresponding key's property value in AppStorage. Due to differences in application logic, it's uncertain whether corresponding properties have been stored in AppStorage before component initialization. Therefore, AppStorage might not have properties for all keys, making local initialization of @StorageProp(key)/@StorageLink(key) decorated variables necessary.

@StorageProp(key) establishes one-way data synchronization with the corresponding key's property in AppStorage. If the property for the given key in AppStorage changes, the change will be synchronized to @StorageProp, overwriting local modifications.

### Macro Usage Rules

| @StorageProp Variable Macro | Description |
|:---|:---|
| Macro Parameters | key: Constant string, required (string must be quoted). |
| Allowed Variable Types | class, String, integer, float, Bool, enum types, and arrays of these types.<br>Supports Datetime, Map, and Set types. For nested types, see [Observing Changes and Behavior](#观察变化和行为表现).<br>Types must be specified. It's recommended to match the property type in LocalStorage to avoid implicit type conversion that could cause application behavior anomalies.<br>Any type is not supported. |
| Synchronization Type | One-way: From AppStorage's corresponding property to the component's state variable. Once the given property in AppStorage changes, it will overwrite local modifications. |
| Initial Value of Decorated Variable | Must be specified. If the property doesn't exist in AppStorage, this initial value will initialize the property and store it in AppStorage. |

### Variable Passing/Access Rules

| Passing/Access | Description |
|:---|:---|
| Initialization and Update from Parent Node | Prohibited. @StorageProp doesn't support initialization from parent nodes; it can only be initialized by the corresponding key's property in AppStorage. If the key doesn't exist, the local default value will be used. |
| Initializing Child Nodes | Supported. Can be used to initialize @State, @Link, @Prop, and @Provide. |
| Access Outside Component | No. |

**@StorageProp Initialization Rule Diagram**

![StorageProp](figures/StorageProp.png)

### Observing Changes and Behavior

#### Observing Changes

- When decorated data types are Bool, String, integer, or float, value changes can be observed.
- When decorated data type is class, object assignment and property changes can be observed (see [Using AppStorage and LocalStorage from UI](#从ui内部使用appstorage和localstorage)).
- When decorated object is Array, changes like adding, deleting, or updating array elements can be observed.
- When decorated object is Datetime, overall assignment can be observed. Datetime properties can be updated via interfaces like addYears, addMonths, addWeeks, addMinutes, addSeconds, and addNanoseconds. See [Decorating Datetime Type Variables](#装饰datetime类型变量).
- When decorated variable is Map, overall assignment can be observed. Map values can be updated via interfaces like add, clear, and remove. See [Decorating Map Type Variables](#装饰map类型变量).
- When decorated variable is Set, overall assignment can be observed. Set values can be updated via interfaces like add, clear, and remove. See [Decorating Set Type Variables](#装饰set类型变量).

#### Framework Behavior

- Variables decorated with @StorageProp are immutable.
- When the data decorated with @StorageProp(key) is itself a state variable, it will cause the associated custom component to re-render.
- When the property corresponding to the key in AppStorage changes, it will synchronize to all data decorated with @StorageProp(key), overwriting local modifications.

## @StorageLink

@StorageLink(key) establishes two-way data synchronization with the corresponding key's property in AppStorage:

1. Local modifications are written back to AppStorage.
2. Changes in AppStorage are synchronized to all properties bound to the corresponding key, including one-way (@StorageProp and one-way binding variables created via Prop), two-way (@StorageLink and two-way binding variables created via Link), and other instances (like PersistentStorage).

### Macro Usage Rules

| @StorageLink Variable Macro | Description |
|:---|:---|
| Macro Parameters | key: Constant string, required (string must be quoted). |
| Allowed Variable Types | class, String, integer, float, Bool, enum types, and arrays of these types.<br>Supports Datetime, Map, and Set types. For nested types, see [Observing Changes and Behavior](#观察变化和行为表现).<br>Types must be specified. It's recommended to match the property type in LocalStorage to avoid implicit type conversion that could cause application behavior anomalies.<br>Any type is not supported. |
| Synchronization Type | Two-way: From AppStorage's corresponding property to the custom component, and from the custom component back to AppStorage's corresponding property. |
| Initial Value of Decorated Variable | Must be specified. If the property doesn't exist in AppStorage, this initial value will initialize the property and store it in AppStorage. |

### Variable Passing/Access Rules

| Passing/Access | Description |
|:---|:---|
| Initialization and Update from Parent Node | Prohibited. |
| Initializing Child Nodes | Supported. Can be used to initialize regular variables, @State, @Link, @Prop, and @Provide. |
| Access Outside Component | No. |

**@StorageLink Initialization Rule Diagram**

![StorageLink](figures/StorageLink.png)

### Observing Changes and Behavior

#### Observing Changes

- When decorated data types are Bool, String, integer, or float, value changes can be observed.
- When decorated data type is class, object assignment and property changes can be observed (see [Using AppStorage and LocalStorage from UI](#从ui内部使用appstorage和localstorage)).
- When decorated object is Array, changes like adding, deleting, or updating array elements can be observed.
- When decorated object is Datetime, overall assignment can be observed. Datetime properties can be updated via interfaces like addYears, addMonths, addWeeks, addMinutes, addSeconds, and addNanoseconds. See [Decorating Datetime Type Variables](#装饰datetime类型变量).
- When decorated variable is Map, overall assignment can be observed. Map values can be updated via interfaces like add, clear, and remove. See [Decorating Map Type Variables](#装饰map类型变量).
- When decorated variable is Set, overall assignment can be observed. Set values can be updated via interfaces like add, clear, and remove. See [Decorating Set Type Variables](#装饰set类型变量).

#### Framework Behavior

1. When changes to the value decorated with @StorageLink(key) are observed, the modification will be synchronized back to the property corresponding to the key in AppStorage.
2. Once the data corresponding to the key in AppStorage changes, all data bound to that key (including two-way @StorageLink and one-way @StorageProp) will be synchronized.
3. When the data decorated with @StorageLink(key) is itself a state variable, its changes will not only synchronize back to AppStorage but also trigger re-rendering of the associated custom component.

## Constraints

1. The parameters for @StorageProp/@StorageLink must be of string type; otherwise, a compilation error will occur.

    ```cangjie
    let storage = AppStorage.setOrCreate("PropA", 47)
    let temp = AppStorage.get<Int64>("PropA").getOrThrow() // 47

    // Incorrect usage, compilation error
    @StorageProp[] let storageProp: Int64 = 1
    @StorageLink[] var storageLink: Int64 = 2

    // Correct usage
    @StorageProp["PropA"] let storageProp: Int64 = 1
    @StorageLink["PropA"] var storageLink: Int64 = 2
    ```

2. @StorageProp and @StorageLink do not support decorating Func-type variables. The framework will throw a runtime error.

3. When using AppStorage with [PersistentStorage](./cj-persiststorage.md) and [Environment](./cj-environment.md), note the following:

    a. After creating a property in AppStorage, calling PersistentStorage.persistProp() will use the existing value in AppStorage and overwrite the same-named property in PersistentStorage. Therefore, it's recommended to use the opposite calling order. For counterexamples, see [Accessing AppStorage Properties Before PersistentStorage](./cj-persiststorage.md#在persistentstorage之后访问appstorage中的属性).

    b. If a property is created in AppStorage before calling Environment.envProp() to create a same-named property, the call will fail. Since AppStorage already has the property, Environment variables won't write to AppStorage. It's recommended to avoid using Environment preset variable names for AppStorage properties.

4. State macro-decorated variables trigger UI re-rendering when changed. If the variable isn't used for UI updates but only for messaging, using emitter is recommended. For examples, see avoiding using @StorageLink's two-way synchronization for event notifications.

5. AppStorage is shared within the same process. Since UIAbility and UIExtensionAbility are separate processes, UIExtensionAbility doesn't share the main process's AppStorage.

## Usage Scenarios

### Using AppStorage and LocalStorage from Application Logic

AppStorage is a singleton, and all its APIs are static, similar to the corresponding non-static methods in LocalStorage.

```cangjie
let temp1 = AppStorage.setOrCreate<Int64>("PropA", 47)

let storage =  LocalStorage()
let temp2 = storage.setOrCreate("PropA", 17)
let propA = AppStorage.get<Int64>("PropA")                  // propA in AppStorage == 47, propA in LocalStorage == 17
let link1 = AppStorage.link<Int64>("PropA").getOrThrow()    // link1.get() == 47
let link2 = AppStorage.link<Int64>("PropA").getOrThrow()    // link2.get() == 47

let value1 = link1.set(48) // Two-way sync: link1.get() == link2.get() == prop.get() == 48
let value2 = link1.set(49) // Two-way sync: link1.get() == link2.get() == prop.get() == 49

let value3 = storage.get<Int64>("PropA") // == 17
let value4 = storage.set<Int64>("PropA", 101)
let value5 = storage.get<Int64>("PropA") // == 101

let value6 = AppStorage.get<Int64>("PropA") // == 49
let value7 = link1.get() // == 49
let value8 = link2.get() // == 49
```

### Using AppStorage and LocalStorage from UI

The @StorageLink macro works with AppStorage similarly to how @LocalStorageLink works with LocalStorage. This macro creates two-way data synchronization with properties in AppStorage.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

class Data{
    var code : Int64
    init(code: Int64){
        this.code = code
    }
}
let temp1 = AppStorage.setOrCreate("PropA", 47)
let temp2 = AppStorage.setOrCreate("PropB", Data(50))

let storage =  LocalStorage()
let res1 = storage.setOrCreate("LinkA", 47)
let res2 = storage.setOrCreate("LinkB", Data(50))

@Entry[storage]
@Component
class EntryView{
    @StorageLink["PropA"] var storageLink : Int64 = 1
    @LocalStorageLink["LinkA"] var localStorageLink : Int64 = 1
    @StorageLink["PropB"] var storageLinkObject : Data = Data(1)
    @LocalStorageLink["LinkB"] var localStorageLinkObject : Data = Data(1)

    func build() {
        Column(){
            Text("From AppStorage ${this.storageLink}")
                .onClick({evt => this.storageLink += 1;})
            Text("From LocalStorage ${this.localStorageLink}")
                .onClick({evt => this.localStorageLink += 1;})
            Text("From AppStorage ${this.storageLinkObject.code}")
                .onClick({evt =>
                    var temp = this.storageLinkObject
                    temp.code += 1
                    this.storageLinkObject = temp;
                    })
            Text("From LocalStorage ${this.localStorageLinkObject.code}")
                .onClick({evt =>
                    var temp = this.localStorageLinkObject
                    temp.code += 1
                    this.localStorageLinkObject = temp;
                    })
        }
    }
}
```

### Avoiding Using @StorageLink's Two-Way Sync for Event Notifications

It's not recommended to use @StorageLink and AppStorage's two-way synchronization for event notifications because AppStorage variables might be bound to components across multiple pages, but event notifications don't necessarily need to reach all these components. Additionally, when these @StorageLink-decorated variables are used in the UI, they trigger UI refreshes, causing unnecessary performance impacts.

In the example code, the click event in TapImage changes the tapIndex property in AppStorage. Because @StorageLink is two-way synchronized, the modification is written back to AppStorage, so all custom components bound to tapIndex in AppStorage can detect the change. Using @Watch to monitor tapIndex changes modifies the state variable tapColor, triggering a UI refresh (here, tapIndex isn't directly bound to the UI, so its changes don't directly trigger UI refreshes).

Using this mechanism for event notifications requires ensuring AppStorage variables aren't directly bound to the UI and controlling the complexity of @Watch functions (long execution times can affect UI refresh efficiency).

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource
import ohos.resource_manager.__GenerateResource__
import ohos.request.agent.State
import kit.PerformanceAnalysisKit.Hilog

class ViewData {
    var title: String
    var uri  : AppResource
    var color : Color = Color.BLACK

    init(title: String,uri  : AppResource){
        this.title = title
        this.uri   = uri
    }
}

@Entry
@Component
class EntryView{
    // "app.media.startIcon" here is just an example; developers should replace it, otherwise imageSource creation failure will prevent normal execution.
    let dataList : Array<ViewData> = [ViewData("flower",@r(app.media.startIcon)),ViewData("OMG",@r(app.media.image))]
    var gridScroller: Scroller = Scroller()

    func build() {
        Column(){
            Grid(this.gridScroller){
                ForEach(this.dataList, itemGeneratorFunc: {item : ViewData , idx : Int64 =>
                        GridItem(){
                            TapImage(index: idx,uri: item.uri)
                        }
                            .aspectRatio(1)
                        })
            }
        }
    }
}

@Component
class TapImage {
    @StorageLink["PropA"] @Watch[onTapIndexChange] var tapIndex : Int64 = -1
    @State var tapColor : Color = Color.BLACK
    var index: Int64
    var uri: AppResource

    func onTapIndexChange(){
        if(this.tapIndex >= 0 && this.index == this.tapIndex){
            Hilog.info(0, "tapindex", "${this.tapIndex}, index: ${this.index},red")
            this.tapColor = Color.RED
        }else{
            Hilog.info(0, "tapindex", "${this.tapIndex}, index: ${this.index},black")
            this.tapColor = Color.BLACK
        }
    }
    func build() {
        Column(){
            Image(this.uri)
                .objectFit(ImageFit.Cover)
                .onClick({evt =>this.tapIndex = this.index;})
                .border(width: 5, color: this.tapColor)
        }
    }
}
```

Compared to the bidirectional synchronization mechanism implemented via @StorageLink for event notification, developers can use the `emit` subscription approach to listen for specific events and receive event callbacks, thereby reducing overhead and improving code readability.

> **Note:**
>
> The `emit` interface is not supported in the Previewer.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import ohos.resource_manager.AppResource
import ohos.resource_manager.__GenerateResource__
import kit.PerformanceAnalysisKit.Hilog
import kit.BasicServicesKit.*
import std.collection.HashMap

class ViewData {
    var title: String
    var uri  : AppResource
    var color : Color = Color.BLACK

    init(title: String,uri: AppResource){
        this.title = title
        this.uri   = uri
    }
}

@Entry
@Component
class EntryView{
    // The "app.media.startIcon" here is for demonstration only. Developers should replace it accordingly; otherwise, imageSource creation failure may prevent subsequent normal execution.
    let dataList : Array<ViewData> = [ViewData("flower",@r(app.media.startIcon)),ViewData("OMG",@r(app.media.image))]
    var gridScroller: Scroller = Scroller()
    var preIndex : Int64 = -1
    func build() {
        Column(){
            Grid(this.gridScroller){
                ForEach(this.dataList, itemGeneratorFunc: {item : ViewData , idx : Int64 =>
                        GridItem(){
                            TapImage(index: idx,uri: item.uri)
                        }
                            .aspectRatio(1)
                            .onClick({evt =>
                                if(this.preIndex >= 0 && idx == this.preIndex){
                                    Hilog.info(0, "AppLogCj", "preIndex: ${this.preIndex}, index: ${idx}, red")
                                    let innerEvent: InnerEvent = InnerEvent(UInt32(this.preIndex))
                                    let p = HashMap<String, EventDataType>()
                                    p.add("red", INT64(0))
                                    let eventData = EventData(p)
                                    Emitter.emit(innerEvent,data: eventData)
                                }
                                else if(this.preIndex >= 0 && idx != this.preIndex){
                                    Hilog.info(0, "AppLogCj", "preIndex: ${this.preIndex}, index: ${idx}, black")
                                    let innerEvent: InnerEvent = InnerEvent(UInt32(this.preIndex))
                                    let p = HashMap<String, EventDataType>()
                                    p.add("black", INT64(0))
                                    let eventData = EventData(p)
                                    Emitter.emit(innerEvent,data: eventData)
                                }
                                this.preIndex = idx
                            ;})
                        })
            }
        }
    }
}

@Component
class TapImage {
    @State var tapColor : Color = Color.BLACK
    var index: Int64
    var uri: AppResource
    func onTapIndexChange(colorTag: EventData){
        if(colorTag.data.contains("red")){
            this.tapColor = Color.RED
        }else{
            this.tapColor = Color.BLACK
        }
    }
    public func aboutToAppear(){
        let innerEvent: InnerEvent = InnerEvent(UInt32(this.index), priority: EventPriority.IMMEDIATE)
        let f = EventCallback(
            "on",
            {
                data: EventData => this.onTapIndexChange(data)
            }
        )
        Emitter.on(innerEvent,f)
    }
    func build() {
        Column(){
            Image(this.uri)
                .objectFit(ImageFit.Cover)
                .border(width: 5, color: this.tapColor)
        }
    }
}
```

### Decorating DateTime-Type Variables

In the following example, the `selectedDate` variable decorated with @StorageLink is of type DateTime. Clicking the Button changes the value of `selectedDate`, and the view refreshes accordingly.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.time.*

@Entry
@Component
class EntryView {
    @StorageLink["date"] var selectedDate: DateTime = DateTime.of(year: 2003, month: Month.of(6), dayOfMonth: 24)
    func build() {
        Column(){
            Button("set selectedDate to 2025-04-21")
                .margin(10)
                .onClick({evt => AppStorage.setOrCreate<DateTime>("date",DateTime.of(year: 2025, month: Month.of(4), dayOfMonth: 21));})
             Button("increase the year by 1")
                .margin(10)
                .onClick({evt => this.selectedDate = this.selectedDate.addYears(1);})
            Button("increase the month by 1")
                .margin(10)
                .onClick({evt => this.selectedDate = this.selectedDate.addMonths(1);})
            Button("increase the day by 1")
                .margin(10)
                .onClick({evt => this.selectedDate = this.selectedDate.addDays(1);})
            DatePicker( start: DateTime.of(year: 1970, month: Month.of(1), dayOfMonth: 1),
                        end: DateTime.of(year: 2100, month: Month.of(1), dayOfMonth: 1),
                        selected: @Binder(this.selectedDate) )
        }
        .width(100.percent)
    }
}
```

### Decorating Map-Type Variables

In the following example, the `message` variable decorated with @StorageLink is of type `Map<Int64, String>`. Clicking the Button changes the value of `message`, and the view refreshes accordingly.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.Map
import std.collection.HashMap

@Entry
@Component
class EntryView {
    @StorageLink["map"] var message: Map<Int64, String> = HashMap<Int64, String>([(0, "a"), (1, "b"), (3, "c")])
    func build() {
        Row() {
            Column() {
                ForEach(
                    this.message.toArray(),itemGeneratorFunc: {item: (Int64, String), _: Int64 =>
                        Text("${item[0]}").fontSize(30)
                        Text("${item[1]}").fontSize(30)
                        Divider()
                    })
                Button("init map").onClick({evt =>
                    this.message = HashMap<Int64, String>([(0, "a"), (1, "b"), (3, "c")])
                })
                Button("add new one").onClick({evt =>
                        var temp = this.message
                        temp.add(4, "d")
                        this.message = temp
                    })
                Button("clear").onClick({evt =>
                        var temp = this.message
                        temp.clear()
                        this.message = temp
                    })
                Button("replace the first one").onClick({evt =>
                        var temp =this.message
                        temp.replace(0,"aa")
                        this.message=temp
                    })
                Button("remove the first one").onClick({evt =>
                        var temp = this.message
                        temp.remove(0)
                        this.message = temp
                })
            }
                .width(100.percent)
        }
        .height(100.percent)
    }
}
```

### Decorating Set-Type Variables

In the following example, the `memberSet` variable decorated with @StorageLink is of type `Set<Int64>`. Clicking the Button changes the value of `memberSet`, and the view refreshes accordingly.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.collection.HashSet
import std.collection.Set

@Entry
@Component
class EntryView {
    @StorageLink["set"] var message: Set<Int64> = HashSet<Int64>([0, 1, 2, 3, 4])
    func build() {
        Row() {
            Column() {
                ForEach(
                    this.message.toArray(),
                    itemGeneratorFunc: {
                        item: Int64, _: Int64 => Text("${item}")
                            .fontSize(30)
                    }
                )
                Button("init set").onClick({evt =>
                        var temp = this.message
                        temp = HashSet<Int64>([0, 1, 2, 3, 4])
                        this.message = temp
                    })
                Button("add new one").onClick({evt =>
                        var temp = this.message
                        temp.add(5)
                        this.message = temp
                    })
                Button("clear").onClick({evt =>
                        var temp = this.message
                        temp.clear()
                        this.message = temp
                    })
                Button("remove the first one").onClick({evt =>
                        var temp = this.message
                        temp.remove(0)
                        this.message = temp
                    })
            }
                .width(100.percent)
        }
        .height(100.percent)
    }
}
```