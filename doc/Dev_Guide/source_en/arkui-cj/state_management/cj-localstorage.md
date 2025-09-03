# LocalStorage: Page-level UI State Storage

LocalStorage is a page-level UI state storage. Parameters received through the `@Entry` macro can share the same LocalStorage instance within a page. LocalStorage supports state sharing among multiple pages within a UIAbility instance.

Before reading this document, it is recommended that developers have a basic understanding of the state management framework. It is advisable to read [State Management Overview](cj-state-management-overview.md) in advance.

LocalStorage also provides API interfaces, allowing developers to manually trigger additions, deletions, modifications, and queries of the corresponding key in Storage outside custom components. It is recommended to read this document in conjunction with the [LocalStorage API Documentation](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-appstatemanagement.md#localstorage页面级ui状态储存).

## Overview

LocalStorage is an in-memory "database" provided by Cangjie for constructing page-level state variables.

- Applications can create multiple LocalStorage instances. LocalStorage instances can be shared within a page or across pages and within a UIAbility instance.
- The root node of the component tree, i.e., the `@Component` decorated with `@Entry`, can be assigned a LocalStorage instance. All child component instances of this component will automatically gain access to this LocalStorage instance.
- A `@Component` decorated component can access at most one LocalStorage instance and AppStorage. Components not decorated with `@Entry` cannot be independently assigned a LocalStorage instance; they can only accept the LocalStorage instance passed from the parent component via `@Entry`. A single LocalStorage instance can be assigned to multiple components on the component tree.
- All properties in LocalStorage are mutable.

The application determines the lifecycle of the LocalStorage object. When the application releases the last reference to LocalStorage, such as destroying the last custom component, LocalStorage will be garbage collected.

LocalStorage provides two macros based on the synchronization type with the `@Component` decorated components:

- [`@LocalStorageProp`](#localstorageprop): Variables decorated with `@LocalStorageProp` establish a one-way synchronization relationship with the given property in LocalStorage.
- [`@LocalStorageLink`](#localstoragelink): Variables decorated with `@LocalStorageLink` establish a two-way synchronization relationship with the given property in LocalStorage.

## @LocalStorageProp

As mentioned earlier, to establish a connection between LocalStorage and custom components, the `@LocalStorageProp` and `@LocalStorageLink` macros are used. Variables within the component decorated with `@LocalStorageProp(key)`/`@LocalStorageLink(key)` will bind to the corresponding property in LocalStorage via the given key during initialization. Local initialization is necessary because there is no guarantee that LocalStorage will have the given key (this depends on whether the application logic stores the corresponding property in the LocalStorage instance before component initialization).

`@LocalStorageProp(key)` establishes one-way data synchronization with the corresponding property in LocalStorage. If the value of the corresponding property in LocalStorage changes, for example, through the `set` interface modifying the value in LocalStorage, the change will be synchronized to `@LocalStorageProp(key)` and override the local value.

### Macro Usage Rules

| @LocalStorageProp Variable Macro | Description |
|:---|:---|
| Macro Parameter | `key`: Constant string, required (the string must be quoted). |
| Allowed Variable Types | `class`, `String`, integer, floating-point, `Bool`, `enum` types, and arrays of these types.<br>Supports `Datetime`, `Map`, `Set` types. For nested types, see [Observing Changes and Behavior](#观察变化和行为表现).<br>The type must be specified. It is recommended to match the type of the corresponding property in LocalStorage; otherwise, implicit type conversion may occur, leading to abnormal application behavior.<br>`Any` is not supported. |
| Synchronization Type | One-way synchronization: From the corresponding property in LocalStorage to the component's state variable. Once the given property in LocalStorage changes, it will override the local changes. |
| Initial Value of Decorated Variable | Must be specified. If the property does not exist in the LocalStorage instance, this initial value will initialize the property and store it in LocalStorage. |

### Variable Passing/Access Rules

| Passing/Access | Description |
|:---|:---|
| Initialization and Update from Parent Node | Prohibited. `@LocalStorageProp` does not support initialization from the parent node. It can only be initialized from the corresponding property in LocalStorage. If there is no corresponding key, the local default value will be used for initialization. |
| Initializing Child Nodes | Supported. Can be used to initialize `@State`, `@Link`, `@Prop`, `@Provide`. |
| Support for External Component Access | No. |

**@LocalStorageProp Initialization Rule Diagram**

![LocalStorageProp](figures/LocalStorageProp.png)

### Observing Changes and Behavior

#### Observing Changes

- When the decorated data type is `Bool`, `String`, integer, or floating-point, numerical changes can be observed.
- When the decorated data type is `class`, object assignment and property changes can be observed (see [Using LocalStorage from UI](#从ui内部使用localstorage)).
- When the decorated object is an `Array`, additions, deletions, and updates to array elements can be observed.
- When the decorated object is `Datetime`, overall assignment of `Datetime` can be observed, and its properties can be updated by calling `Datetime` interfaces like `addYears`, `addMonths`, `addWeeks`, `addMinutes`, `addSeconds`, `addNanoseconds`. See [Decorating Datetime Type Variables](#装饰datetime类型变量).
- When the decorated variable is a `Map`, overall assignment of `Map` can be observed, and its values can be updated by calling `Map` interfaces like `add`, `clear`, `remove`. See [Decorating Map Type Variables](#装饰map类型变量).
- When the decorated variable is a `Set`, overall assignment of `Set` can be observed, and its values can be updated by calling `Set` interfaces like `add`, `clear`, `remove`. See [Decorating Set Type Variables](#装饰set类型变量).

#### Framework Behavior

- Variables decorated with `@LocalStorageProp` are immutable.
- Changes to variables decorated with `@LocalStorageProp` will refresh the associated components in the current custom component.
- Changes to `LocalStorage(key)` will trigger changes in all variables decorated with `@LocalStorageProp` corresponding to that key, overriding local changes made by `@LocalStorageProp`.

![LocalStorage(key)](figures/LocalStorage(key).png)

## @LocalStorageLink

If we need to synchronize updates from a custom component's state variables back to LocalStorage, we use `@LocalStorageLink`.

`@LocalStorageLink(key)` establishes two-way data synchronization with the corresponding property in LocalStorage:

1. Local modifications will be written back to LocalStorage.
2. Modifications in LocalStorage will be synchronized to all properties bound to the corresponding key in LocalStorage, including one-way (`@LocalStorageProp` and one-way binding variables created via `prop`) and two-way (`@LocalStorageLink` and two-way binding variables created via `link`) variables.

### Macro Usage Rules

| @LocalStorageLink Variable Macro | Description |
|:---|:---|
| Macro Parameter | `key`: Constant string, required (the string must be quoted). |
| Allowed Variable Types | `class`, `String`, integer, floating-point, `Bool`, `enum` types, and arrays of these types.<br>Supports `Datetime`, `Map`, `Set` types. For nested types, see [Observing Changes and Behavior](#观察变化和行为表现).<br>The type must be specified. It is recommended to match the type of the corresponding property in LocalStorage; otherwise, implicit type conversion may occur, leading to abnormal application behavior.<br>`Any` is not supported. |
| Synchronization Type | Two-way synchronization: From the corresponding property in LocalStorage to the custom component, and from the custom component to the corresponding property in LocalStorage. |
| Initial Value of Decorated Variable | Must be specified. If the property does not exist in the LocalStorage instance, this initial value will initialize the property and store it in LocalStorage. |

### Variable Passing/Access Rules

| Passing/Access | Description |
|:---|:---|
| Initialization and Update from Parent Node | Prohibited. `@LocalStorageLink` does not support initialization from the parent node. It can only be initialized from the corresponding property in LocalStorage. If there is no corresponding key, the local default value will be used for initialization. |
| Initializing Child Nodes | Supported. Can be used to initialize `@State`, `@Link`, `@Prop`, `@Provide`. |
| Support for External Component Access | No. |

**@LocalStorageLink Initialization Rule Diagram**

![LocalStorageLink](figures/LocalStorageLink.png)

### Observing Changes and Behavior

#### Observing Changes

- When the decorated data type is `Bool`, `String`, integer, or floating-point, numerical changes can be observed.
- When the decorated data type is `class`, object assignment and property changes can be observed (see [Using LocalStorage from UI](#从ui内部使用localstorage)).
- When the decorated object is an `Array`, additions, deletions, and updates to array elements can be observed.
- When the decorated object is `Datetime`, overall assignment of `Datetime` can be observed, and its properties can be updated by calling `Datetime` interfaces like `addYears`, `addMonths`, `addWeeks`, `addMinutes`, `addSeconds`, `addNanoseconds`. See [Decorating Datetime Type Variables](#装饰datetime类型变量).
- When the decorated variable is a `Map`, overall assignment of `Map` can be observed, and its values can be updated by calling `Map` interfaces like `add`, `clear`, `remove`. See [Decorating Map Type Variables](#装饰map类型变量).
- When the decorated variable is a `Set`, overall assignment of `Set` can be observed, and its values can be updated by calling `Set` interfaces like `add`, `clear`, `remove`. See [Decorating Set Type Variables](#装饰set类型变量).

#### Framework Behavior

1. When changes to the value decorated with `@LocalStorageLink(key)` are observed, the modifications will be synchronized back to the corresponding property in LocalStorage under the key `key`.
2. Once the data corresponding to the key `key` in LocalStorage changes, all data bound to this key (including two-way `@LocalStorageLink` and one-way `@LocalStorageProp`) will be synchronized.
3. If the data decorated with `@LocalStorageLink(key)` is itself a state variable, its changes will not only be synchronized back to LocalStorage but will also trigger a re-render of the associated custom component.

![LocalStorageLink(key)](figures/LocalStorageLink(key).png)

## Constraints

1. The parameters for `@LocalStorageProp`/`@LocalStorageLink` must be of type `string`; otherwise, a compilation error will occur.

    ```cangjie
    let storage =  LocalStorage()
    let temp = storage.setOrCreate("PropA", 48)

    // Incorrect usage, compilation error
    @LocalStorageProp[] let localStorageProp: Int64 = 1
    @LocalStorageLink[] var localStorageLink: Int64 = 2

    // Correct usage
    @LocalStorageProp["PropA"] let localStorageProp: Int64 = 1
    @LocalStorageLink["PropA"] var localStorageLink: Int64 = 2
    ```

2. `@LocalStorageProp` and `@LocalStorageLink` do not support decorating `func` type variables. The framework will throw a runtime error.
3. After LocalStorage is created, the type of named properties cannot be changed. Subsequent calls to `Set` must use values of the same type.
4. LocalStorage is page-level storage. For examples, see [Sharing LocalStorage Instances from UIAbility to One or More Views](#将localstorage实例从uiability共享到一个或多个视图).

## Usage Scenarios

### Using LocalStorage in Application Logic

```cangjie
let storage =  LocalStorage()
let temp = storage.setOrCreate("PropA", 47)             // Create a new instance and initialize with the given object
let propA = storage.get<Int64>("PropA")                 // propA == 47
let link1 = storage.link<Int64>("PropA").getOrThrow()   // link1.get() == 47
let link2 = storage.link<Int64>("PropA").getOrThrow()   // link2.get() == 47

let value1 = link1.set(48) // Two-way sync: link1.get() == link2.get() == prop1.get() == 48
let value2 = link1.set(49) // Two-way sync: link1.get() == link2.get() == prop.get() == 49
```

### Using LocalStorage from UI

In addition to using LocalStorage in application logic, the two macros `@LocalStorageProp` and `@LocalStorageLink` can be used to access state variables stored in LocalStorage instances within UI components.

This example demonstrates the following using `@LocalStorageLink`:

- Creating a LocalStorage instance `storage` using the constructor.
- Adding `storage` to the top-level `Parent` component using the `@Entry` macro.
- Binding `@LocalStorageLink` to the given property in LocalStorage to establish two-way data synchronization.

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
// Create a new instance and initialize with the given object
let storage =  LocalStorage()
let res1 = storage.setOrCreate("PropA", 47)
let res2 = storage.setOrCreate("PropB", Data(50))

@Component
class Child{
    // @LocalStorageLink variable macro establishes two-way binding with "PropA" in LocalStorage
    @LocalStorageLink["PropA"] var childLinkNumber: Int64 = 1
    // @LocalStorageLink variable macro establishes two-way binding with "PropB" in LocalStorage
    @LocalStorageLink["PropB"] var childLinkObject: Data = Data(0)
    func build() {
        Column(){
            Button("Child from LocalStorage ${this.childLinkNumber}") // Changes will sync to "PropA" in LocalStorage and Parent.parentLinkNumber
                .onClick({evt => this.childLinkNumber += 1;})
            Button("Child from LocalStorage ${this.childLinkObject.code}") // Changes will sync to "PropB" in LocalStorage and Parent.childLinkObject
                .onClick({evt =>
                    var temp = this.childLinkObject
                    temp.code += 1
                    this.childLinkObject = temp;
                    })
        }
    }
}
// Make LocalStorage accessible from @Component components
@Entry[storage]
@Component
class EntryView {
    // @LocalStorageLink variable macro establishes two-way binding with "PropA" in LocalStorage
    @LocalStorageLink["PropA"] var parentLinkNumber: Int64 = 1
    // @LocalStorageLink variable macro establishes two-way binding with "PropB" in LocalStorage
    @LocalStorageLink["PropB"] var parentLinkObject: Data = Data(0)
    func build() {
        Column(){
            Button("Parent from LocalStorage ${this.parentLinkNumber}") // Since PropA is already initialized in LocalStorage, this.parentLinkNumber is 47
                .onClick({evt => this.parentLinkNumber += 1;})
            Button("Parent from LocalStorage ${this.parentLinkObject.code}") // Since PropB is already initialized in LocalStorage, this.parentLinkObject.code is 50
                .onClick({evt =>
                    var temp = this.parentLinkObject
                    temp.code += 1
                    this.parentLinkObject = temp;
                    })
            // @Component child components automatically gain access to the Parent's LocalStorage instance.
            Child()
        }
    }
}
```

### Simple One-way Synchronization Between @LocalStorageProp and LocalStorage

The following example demonstrates one-way synchronization between data decorated with `@LocalStorageProp` and LocalStorage:

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

// Create a new instance and initialize with the given object
let storage =  LocalStorage()
let temp = storage.setOrCreate("PropA", 47)
// Make LocalStorage accessible from @Component components
@Entry[storage]
@Component
class EntryView {
    // @LocalStorageProp variable macro establishes one-way binding with "PropA" in LocalStorage
    @LocalStorageProp["PropA"] let storageProp1: Int64 = 1
    func build() {
        Column(){
            Button("Parent from LocalStorage ${this.storageProp1}")
                .onClick({evt => storage.set<Int64>("PropA", storageProp1+1)
                    ;})
        }
    }
}
```

### Simple Two-way Synchronization Between @LocalStorageLink and LocalStorage

The following example demonstrates two-way synchronization between data decorated with `@LocalStorageLink` and LocalStorage:

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

// Construct LocalStorage instance
let storage =  LocalStorage()
let temp = storage.setOrCreate("PropA", 47)
// Call link interface to construct two-way sync data for "PropA". linkToPropA is a global variable
let linkToPropA = storage.link<Int64>("PropA").getOrThrow()

// Make LocalStorage accessible from @Component components
@Entry[storage]
@Component
class EntryView {
    // @LocalStorageLink("PropA") creates two-way sync data for "PropA" in the Parent custom component. Initial value is 47 because LocalStorage was constructed with "PropA" set to 47.
    @LocalStorageLink["PropA"] var storageLink: Int64 = 1
    func build() {
        Column(){
            Text("incr @LocalStorageLink variable")
            // Clicking "incr @LocalStorageLink variable" increments this.storageLink by 1, syncing back to storage. Global variable linkToPropA will also sync.
                .onClick({evt => this.storageLink += 1;})
            // Using global variable linkToPropA.get() within components is not recommended due to potential lifecycle-related errors.
            Text("@LocalStorageLink: ${this.storageLink} - linkToPropA: ${linkToPropA.get()}")
        }
    }
}
```

### Synchronizing State Variables Between Sibling Components

The following example demonstrates two-way synchronization of state between sibling components via `@LocalStorageLink`.First, observe the changes in the Parent custom component:

1. Clicking "playCount ${this.playCount} dec by 1" decrements `this.playCount` by 1, synchronizes the modification back to LocalStorage, and triggers a refresh in the Child component bound to `playCountLink`.
2. Clicking "countStorage ${this.playCount} incr by 1" calls LocalStorage's `set` interface to update the property corresponding to "countStorage" in LocalStorage, which then refreshes the Child component bound to `playCountLink`.

Changes in the Child custom component:

Refreshes to `playCountLink` synchronize back to LocalStorage and trigger corresponding updates in sibling and parent components.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

let storage =  LocalStorage()
let temp = storage.setOrCreate("countStorage", 1)

@Component
class Child {
    let label: String
    @LocalStorageLink["countStorage"] var playCountLink: Int64 = 0
    func build() {
        Row(){
            Text(this.label)
                .width(50)
                .height(60)
                .fontSize(12)
            Text("playCountLink ${this.playCountLink}: inc by 1")
                .onClick({evt => this.playCountLink += 1;})
                .width(200)
                .height(60)
                .fontSize(12)
        }
        .width(300)
        .height(60)
    }
}
@Entry[storage]
@Component
class EntryView {
    @LocalStorageLink["countStorage"] var playCount: Int64 = 0
    func build() {
        Column(){
            Row(){
                Text("Parent")
                    .width(50)
                    .height(60)
                    .fontSize(12)
                Text("countStorage ${this.playCount} dec by 1")
                    .onClick({evt => this.playCount -= 1;})
                    .width(250)
                    .height(60)
                    .fontSize(12)
            }
            .width(300)
            .height(60)
            Child(label:"ChildA")
            Child(label:"ChildB")
        }
    }
}
```

### Sharing LocalStorage Instances from UIAbility to One or Multiple Views

In the above example, the LocalStorage instance is only shared within an `@Entry`-decorated component and its child components (a single page). To share it across multiple views, create the LocalStorage instance in the corresponding UIAbility.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
internal import ohos.base.AppLog
internal import ohos.ability.AbilityStage
internal import ohos.ability.LaunchReason
import kit.ArkUI.*

let storage =  LocalStorage()
let temp = storage.setOrCreate("PropA", 47)

class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        AppLog.info("MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.START_ABILITY => AppLog.info("START_ABILITY")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        AppLog.info("MainAbility onWindowStageCreate.")
        windowStage.loadContent("EntryView")
    }
}
```

> **Note:**
>
> Retrieve the shared LocalStorage instance via the `storage` interface in UI pages.

In the following example, `propA` in the `EntryView` page obtains the shared LocalStorage instance via `storage`. Clicking the Button navigates to the `Page` view. Clicking "Change propA" modifies `propA`, and upon returning to `EntryView`, the value of `propA` is synchronized.

 <!-- run -->

```cangjie
// index.cj

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

// Retrieve shared LocalStorage instance via storage
@Entry[storage]
@Component
class EntryView {
    @LocalStorageLink["PropA"] var propA: Int64 = 1
    func build() {
        Row(){
            Column(){
                Text("${this.propA}")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                Button("To page")
                    .onClick({evt => Router.push(url: "Page");})
            }
            .width(100.percent)
        }
        .height(100.percent)
    }
}
```

 <!-- run -->

```cangjie
//page.cj

package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

// Retrieve shared LocalStorage instance via storage
@Entry[storage]
@Component
class Page {
    @LocalStorageLink["PropA"] var propA: Int64 = 2
    func build() {
        Row(){
            Column(){
                Text("${this.propA}")
                    .fontSize(50)
                    .fontWeight(FontWeight.Bold)
                Button("Change propA")
                    .onClick({evt => this.propA = 100;})
                Button("Back EntryView")
                    .onClick({evt => Router.push(url: "EntryView");})
            }
        }
    }
}
```

> **Note:**
>
> Developers are recommended to use this approach to construct LocalStorage instances and set default values during creation. Default values serve as fallbacks for runtime exceptions and can be used for page unit testing.

### Decorating DateTime-Type Variables

In the following example, `selectedDate` decorated with `@LocalStorageLink` is of type `DateTime`. Clicking the Button changes `selectedDate`, and the view refreshes accordingly.

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*
import std.time.*

let Storage =  LocalStorage()

@Entry[Storage]
@Component
class EntryView {
    @LocalStorageLink["date"] var selectedDate: DateTime = DateTime.of(year: 2003, month: Month.of(6), dayOfMonth: 24)
    @State var count : Int64 = 0
    func build() {
        Column(){
            Button("set selectedDate to 2025-04-21")
                .margin(10)
                .onClick({evt => this.selectedDate = DateTime.of(year: 2025, month: Month.of(4), dayOfMonth: 21);})
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

In the following example, `message` decorated with `@LocalStorageLink` is of type `Map<Int64, string>`. Clicking the Button changes `message`, and the view refreshes accordingly.

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
    @LocalStorageLink["map"] var message: Map<Int64, String> = HashMap<Int64, String>([(0, "a"), (1, "b"), (3, "c")])
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

In the following example, `memberSet` decorated with `@LocalStorageLink` is of type `Set<Int64>`. Clicking the Button changes `memberSet`, and the view refreshes accordingly.

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
    @LocalStorageLink["set"] var message: Set<Int64> = HashSet<Int64>([0, 1, 2, 3, 4])
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

### Modifying State Variables Outside Custom Components

 <!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

let storage =  LocalStorage()
let temp = storage.setOrCreate("count", 47)

public class Model {
  let storage: LocalStorage = storage

  public func change(propName: String, value: Int64) {
    this.storage.setOrCreate<Int64>(propName, value)
  }
}

let model: Model = Model()

@Entry[storage]
@Component
class EntryView {
    @LocalStorageLink["count"] var count: Int64 = 0
    func build() {
        Column(){
            Text("count value: ${this.count}")
            Button("change")
                .onClick({evt => model.change("count",this.count+1);})
            }
    }
}
```

### Using ArkTS LocalStorage in Hybrid UI Development

In hybrid UI development, Cangjie can be used for partial page UI development. To share LocalStorage instances with ArkTS views, create a LocalStorage instance in the corresponding UIAbility and call windowStage.loadContent.

```ts
// EntryAbility.ets
import UIAbility from '@ohos.app.ability.UIAbility';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
    para:Record<string, string> = { 'PropA': '47' };
    storage: LocalStorage = new LocalStorage(this.para);

    onWindowStageCreate(windowStage: window.WindowStage) {
        windowStage.loadContent('pages/Index', this.storage);
    }
}
```

Meanwhile, register LocalStorage.getShared() to globalThis on the ArkTS side.

```ts
import { CJHybridComponentV2 } from "cjhybridview" // Import CJHybridComponentV2

globalThis.localStorageGetShared = LocalStorage.getShared // Register LocalStorage.getShared() to globalThis

// Get the shared LocalStorage instance from stage via getShared interface
let storage = LocalStorage.getShared()
@Entry(storage)
@Component
struct Index {
  build() {
    Column() {
      CJHybridComponentV2({
        library: "ohos_app",         // Specify the loaded so, corresponding to the Cangjie UI above
        component: "MyLocalStorage"  // Specify the loaded Cangjie class, corresponding to the @HybridComponentEntry annotated class in Cangjie UI
      })
    }
    .height('100%')
    .width('100%')
  }
}
```

On the Cangjie side, use macros `@LocalStorageProp["propName", "InterOp"]` and `@LocalStorageLink["propName", "InterOp"]` to establish one-way and two-way synchronization relationships with properties in the ArkTS view's LocalStorage instance.

```cangjie
package ohos_app
import kit.HybridUIKit.*
import ohos.arkui.state_macro_manage.*

@HybridComponentEntry
@Component
class MyLocalStorage {
    @State
    var text: String = "Text"
    @LocalStorageLink["PropA", "InterOp"] var storage: String = "b"
    @LocalStorageProp["PropB", "InterOp"] let storage2: String = "b"
    public func build() {
        Column {
            Text(text).onClick({ evt => storage = "88" })
            Text("PropA " + storage)
            Text("PropB " + storage2)
        }
    }
}
```