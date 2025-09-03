# PersistentStorage: Persisting UI State

The first two sections introduced LocalStorage and AppStorage, which are runtime memory. However, it is a common scenario in application development to retain selected results even after the application exits and restarts. This requires the use of PersistentStorage.

PersistentStorage is an optional singleton object in an application. Its purpose is to persistently store selected AppStorage properties, ensuring these properties retain the same values when the application restarts as they had when the application was closed.

PersistentStorage provides the capability to persist state variables. However, it is important to note that both persistence and the ability to read back UI states rely on AppStorage. Before reading this documentation, it is recommended to review: [AppStorage](cj-appstorage.md) and [PersistentStorage API Documentation](../../../../API_Reference/source_zh_cn/arkui-cj/cj-state-rendering-appstatemanagement.md#persistentstorage持久化存储ui状态).

## Overview

PersistentStorage retains selected AppStorage properties on the device disk. Applications use APIs to determine which AppStorage properties should be persisted via PersistentStorage. The UI and business logic do not directly access properties in PersistentStorage. All property accesses are made through AppStorage, and changes in AppStorage are automatically synchronized to PersistentStorage.

PersistentStorage establishes a two-way synchronization with properties in AppStorage. Application development typically accesses PersistentStorage through AppStorage. Additionally, there are interfaces for managing persisted properties, but business logic always retrieves and sets properties through AppStorage.

## Constraints

PersistentStorage allows the following types and values:
- Simple types such as Bool, String, integer, float, etc.
- Objects that can be reconstructed using `JSON.stringify()` and `JSON.parse()`, but member methods within objects are not supported for persistence.

PersistentStorage does not allow the following types and values:
- Nested objects (arrays of objects, object properties that are objects, etc.). Currently, the framework cannot detect changes in nested objects (including arrays) within AppStorage, so they cannot be written back to PersistentStorage.

Persisting data is a relatively slow operation. Applications should avoid:
- Persisting large datasets.
- Persisting frequently changing variables.

PersistentStorage is best suited for persisting data smaller than 2KB. Avoid persisting large amounts of data because PersistentStorage writes to disk synchronously. Large-scale data read/write operations will execute synchronously on the UI thread, impacting UI rendering performance. If developers need to store large amounts of data, it is recommended to use database APIs.

## Usage Scenarios

### Accessing Properties Initialized by PersistentStorage from AppStorage

1. Initialize PersistentStorage:

```cangjie
PersistentStorage.persistProp("aProp", 47)
```

2. Retrieve the corresponding property from AppStorage:

```cangjie
AppStorage.get<Int64>("aProp")
```

   Or define it within a component:

```cangjie
@StorageLink["aProp"] var aProp : Int64 = 48
```

Complete code example:

<!-- run -->

```cangjie
package ohos_app_cangjie_entry
import kit.ArkUI.*
import ohos.arkui.state_macro_manage.*

@Entry
@Component
class EntryView {
    let temp = PersistentStorage.persistProp("aProp", 47)
    @State var message : String = "Hello World"
    @StorageLink["aProp"] var aProp : Int64 = 48
    func build() {
        Row(){
            Column(){
                Text("${this.aProp}")
                    .onClick({etv=> this.aProp += 1;})
            }
        }
    }
}
```

- First run after a new application installation:
  a. Call `persistProp` to initialize PersistentStorage. First, check if "aProp" exists in the PersistentStorage local file. The result is "does not exist" because the application is running for the first time.
  b. Next, check if the property "aProp" exists in AppStorage. It still does not exist.
  c. Create a property named "aProp" of type number in AppStorage, with the initial value set to the default value of 47.
  d. PersistentStorage writes the property "aProp" and its value 47 to disk. Subsequent changes to "aProp" in AppStorage will be persisted.
  e. In the Index component, create the state variable `@StorageLink("aProp") aProp`, which establishes two-way binding with "aProp" in AppStorage. During creation, it searches for "aProp" in AppStorage and successfully finds it, so it uses the value 47 found in AppStorage.

**Figure 1** PersistProp Initialization Rules Illustration

![PersistProp](figures/PersistProp.png)

- After triggering a click event:
  a. The state variable `@StorageLink("aProp") aProp` changes, triggering a refresh of the Text component.
  b. Variables decorated with `@StorageLink` are synchronized bidirectionally with AppStorage, so changes to `@StorageLink("aProp") aProp` are synchronized back to AppStorage.
  c. Changes to the "aProp" property in AppStorage are synchronized to all variables bound to "aProp" (unidirectional or bidirectional). In this example, there are no other variables bound to "aProp".
  d. Since the "aProp" property is persisted, changes to "aProp" in AppStorage trigger PersistentStorage to write the new changes to the local disk.

- Subsequent application launches:
  a. Execute `PersistentStorage.persistProp("aProp", 47)`. First, query the "aProp" property in the PersistentStorage local file, which is found.
  b. Write the value queried from PersistentStorage into AppStorage.
  c. Write the value queried from PersistentStorage into AppStorage.

### Accessing AppStorage Properties Before PersistentStorage

This example demonstrates an anti-pattern. Accessing properties in AppStorage before calling `PersistentStorage.persistProp` or `persistProps` is incorrect because this order of operations will lose the property values from the previous application run:

```cangjie
let aProp = AppStorage.setOrCreate("aProp", 47)
let temp = PersistentStorage.persistProp("aProp", 48)
```

For non-first runs of the application:
- First, execute `AppStorage.setOrCreate("aProp", 47)`: The property "aProp" is created in AppStorage with type number and the specified default value 47. Since "aProp" is a persisted property, it is written back to the PersistentStorage disk, overwriting the value from the previous application exit.
- Then, execute `PersistentStorage.persistProp("aProp", 48)`: "aProp" is found in PersistentStorage with the value 47, which was just written by the AppStorage interface.

### Accessing AppStorage Properties After PersistentStorage

Developers can first determine whether to overwrite the value previously saved in PersistentStorage. If overwriting is needed, call the AppStorage interface to modify it; otherwise, do not call the AppStorage interface.

```cangjie
let temp = PersistentStorage.persistProp("aProp", 48)
if(AppStorage.get<Int64>("aProp").getOrThrow() > 50){
    AppStorage.setOrCreate("aProp", 47)
}
```

This example reads the data stored in PersistentStorage and checks if the value of "aProp" is greater than 50. If it is, the AppStorage interface is used to set it to 47.