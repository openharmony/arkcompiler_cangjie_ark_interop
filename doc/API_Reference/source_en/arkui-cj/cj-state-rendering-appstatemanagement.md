# Application-Level Variable State Management

The state management module provides capabilities for application data storage, persistent data management, UIAbility data storage, and the environmental state required by applications.

## Import Module

```cangjie
import warningwarning!.*
```

## Usage Instructions

AppStorage is a singleton created when the application starts. Its purpose is to provide centralized storage for application state data that is accessible at the application level. AppStorage retains its properties throughout the application's runtime. Properties are accessed via unique key string values.

AppStorage can synchronize with UI components and can be accessed within application business logic.

AppStorage supports state sharing among multiple UIAbility instances within the application's main thread.

Properties in AppStorage can be bidirectionally synchronized. Data may exist locally or on remote devices and serves different functions, such as data persistence (see [PersistentStorage](#persistentstorage-persistent-ui-state-storage)). This data is implemented in business logic, decoupled from the UI. To use this data in the UI, @StorageProp and @StorageLink are required.

## class AppStorage

```cangjie
public class AppStorage {}
```

**Function:** Establishes a one-way property binding with the corresponding propName in AppStorage. If the given propName exists in AppStorage, returns the one-way bound data corresponding to the propName property in AppStorage. If propName does not exist in AppStorage, returns None. Modifications to one-way bound data will not be synchronized back to AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### static func `prop`\<T>(String)

```cangjie
public static func `prop`<T>(propName: String): ?ObservedProperty<T>
```

**Function:** Establishes a one-way property binding with the corresponding propName in AppStorage. If the given propName exists in AppStorage, returns the one-way bound data corresponding to the propName property in AppStorage. If propName does not exist in AppStorage, returns None. Modifications to one-way bound data will not be synchronized back to AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | Returns the one-way bound data. If the corresponding property value does not exist in AppStorage, returns None. |

### static func clear()

```cangjie
public static func clear(): Bool
```

**Function:** Deletes all properties in AppStorage. The prerequisite for deleting all properties is that there are no subscribers left. If there are subscribers, clear will not take effect and returns false. If there are no subscribers, the deletion succeeds and returns true.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | If there are no subscribers left for the properties in AppStorage, the deletion succeeds and returns true. Otherwise, returns false. |

### static func delete(String)

```cangjie
public static func delete(propName: String): Bool
```

**Function:** Deletes the property corresponding to propName in AppStorage. The prerequisite for deleting the property in AppStorage is that the property has no subscribers. If there are subscribers, returns false. If there are no subscribers, the deletion succeeds and returns true.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | If the corresponding property exists in AppStorage and has no subscribers, the deletion succeeds and returns true. If the property does not exist or still has subscribers, returns false. |

### static func get\<T>(String)

```cangjie
public static func get<T>(propName: String): ?T
```

**Function:** Retrieves the property value corresponding to propName in AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?T | The property value corresponding to propName in AppStorage. If it does not exist, returns None. |

### static func has(String)

```cangjie
public static func has(propName: String): Bool
```

**Function:** Determines whether the property corresponding to propName exists in AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the property corresponding to propName exists in AppStorage. Otherwise, returns false. |

### static func keys()

```cangjie
public static func keys(): EquatableCollection<String>
```

**Function:** Returns all property names in AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [EquatableCollection](./cj-common-types.md#interface-equatablecollection) | All property names in AppStorage. |

### static func link\<T>(String)

```cangjie
public static func link<T>(propName: String): ?ObservedProperty<T>
```

**Function:** If the given propName exists in the AppStorage instance, returns the bidirectional bound data corresponding to the propName property in AppStorage.

Modifications to bidirectional bound data will be synchronized back to AppStorage, and AppStorage will propagate the changes to all data and Components bound to this propName.

If propName does not exist in AppStorage, returns None.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of Option\<ObservedProperty\<T>> representing the bidirectional bound data corresponding to the propName property in AppStorage. If the corresponding propName does not exist in AppStorage, returns None. |

### static func set\<T>(String, T)

```cangjie
public static func set<T>(propName: String, newValue: T): Bool
```

**Function:** Sets the value of the property corresponding to propName in AppStorage. If newValue is the same as the current value of the property corresponding to propName (i.e., no assignment is needed), the state variable will not notify the UI to refresh the property value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |
| newValue | T | Yes | - | The property value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns false if the property corresponding to propName does not exist in AppStorage. Returns true if the setting succeeds. |

### static func setAndLink\<T>(String, T)

```cangjie
public static func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**Function:** Similar to the link interface. If the given propName exists in AppStorage, returns the bidirectional bound data corresponding to the propName property. If it does not exist, creates and initializes the propName property in AppStorage using defaultValue and returns its bidirectional bound data.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |
| defaultValue | T | Yes | - | If propName does not exist in AppStorage, uses defaultValue to initialize the corresponding propName in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of ObservedProperty\<T> representing the bidirectional bound data corresponding to the propName property in AppStorage. |

### static func setAndProp\<T>(String, T)

```cangjie
public static func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**Function:** Similar to the Prop interface. If the given propName exists in AppStorage, returns the one-way bound data corresponding to the propName property. If it does not exist, creates and initializes the propName property in AppStorage using defaultValue and returns its one-way bound data.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |
| defaultValue | T | Yes | - | If propName does not exist in AppStorage, uses defaultValue to initialize the corresponding propName in AppStorage. defaultValue cannot be None. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of ObservedProperty\<T>. |

### static func setOrCreate\<T>(String, T)

```cangjie
public static func setOrCreate<T>(propName: String, newValue: T): Unit
```

**Function:** If propName already exists in AppStorage and newValue differs from the current value of the property corresponding to propName, sets the property value to newValue. Otherwise, the state variable will not notify the UI to refresh the property value.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in AppStorage. |
| newValue | T | Yes | - | The property value. |

### static func size()

```cangjie
public static func size(): Int64
```

**Function:** Returns the number of properties in AppStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The number of properties in AppStorage. |

## class Environment

```cangjie
public class Environment {}
```

**Function:** Stores the built-in environment variable key of Environment into AppStorage. If the system does not find the value of the environment variable key, uses the default value value. Returns true if the storage succeeds. If the corresponding key already exists in AppStorage, returns false.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### static func aboutToBeDeleted()

```cangjie
public static func aboutToBeDeleted(): Unit
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

### static func envProp\<T>(String, T)

```cangjie
public static func envProp<T>(key: String, defaultValue: T): Bool
```

**Function:** Stores the built-in environment variable key of Environment into AppStorage. If the system does not find the value of the environment variable key, uses the default value value. Returns true if the storage succeeds. If the corresponding key already exists in AppStorage, returns false.

It is recommended to call this interface when the program starts.

Using AppStorage to read environment variables without calling envProp is incorrect.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | The environment variable name. Supported ranges are detailed in the built-in environment variable description. |
| defaultValue | T | Yes | - | If the environment variable key is not found, uses defaultValue as the default value to store in AppStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | If the property corresponding to key exists in AppStorage, returns false. If it does not exist, creates the property in AppStorage using value as the default value and returns true. |

### static func keys()

```cangjie
public static func keys(): Array<String>
```

**Function:** Returns the collection of property keys for environment variables.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns the collection of associated system items. |

## class LocalStorage

```cangjie
public class LocalStorage {
    public init()
}
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Initial Version:** 21### init()

```cangjie

public init()
```

**Function:** Constructor.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func `prop`\<T>(String)

```cangjie
public func `prop`<T>(propName: String): ?ObservedProperty<T>
```

**Function:** If the given propName exists in LocalStorage, returns the one-way bound data corresponding to the property in LocalStorage. If propName does not exist in LocalStorage, returns None. Modifications to the one-way bound data will not be synchronized back to LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of ObservedProperty\<T>, representing the one-way bound data corresponding to the property in LocalStorage. If the propName does not exist in LocalStorage, returns None. |

### func aboutToBeDeleted()

```cangjie

public func aboutToBeDeleted(): Bool
```

**Function:** Deletes all properties in LocalStorage. The deletion will only succeed if there are no subscribers left. If there are subscribers, the clear operation will not take effect and return false. If there are no subscribers, the deletion will succeed and return true.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if all properties in LocalStorage have no subscribers and are successfully deleted. Otherwise, returns false. |

### func clear()

```cangjie

public func clear(): Bool
```

**Function:** Deletes all properties in LocalStorage. The deletion will only succeed if there are no subscribers left. If there are subscribers, the clear operation will not take effect and return false. If there are no subscribers, the deletion will succeed and return true.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if all properties in LocalStorage have no subscribers and are successfully deleted. Otherwise, returns false. |

### func delete(String)

```cangjie

public func delete(propName: String): Bool
```

**Function:** Deletes the property corresponding to propName in LocalStorage. The deletion will only succeed if the property has no subscribers. If there are subscribers, it returns false. If there are no subscribers, the deletion succeeds and returns true.

Subscribers include propName bound via interfaces like `link`, as well as `@LocalStorageLink["propName"]` and `@LocalStorageProp["propName"]`. If a custom component uses `@LocalStorageLink["propName"]`, `@LocalStorageProp["propName"]`, or an ObservedProperty instance (return type of the `link` interface) that still maintains a synchronization relationship with propName, the property cannot be deleted from LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the property exists in LocalStorage and has no subscribers, and is successfully deleted. Returns false if the property does not exist or still has subscribers. |

### func get\<T>(String)

```cangjie

public func get<T>(propName: String): ?T
```

**Function:** Retrieves the property value corresponding to propName in LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?T | The property value corresponding to propName in LocalStorage. Returns None if the property does not exist. |

### func has(String)

```cangjie

public func has(propName: String): Bool
```

**Function:** Checks whether the property corresponding to propName exists in LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if the property exists in LocalStorage. Otherwise, returns false. |

### func keys()

```cangjie

public func keys(): EquatableCollection<String>
```

**Function:** Returns all property names in LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [EquatableCollection](./cj-common-types.md#interface-equatablecollection) | All property names in LocalStorage. |

### func link\<T>(String)

```cangjie

public func link<T>(propName: String): ?ObservedProperty<T>
```

**Function:** If the given propName exists in the LocalStorage instance, returns the two-way bound data corresponding to the property in LocalStorage.

Modifications to the two-way bound data will be synchronized back to LocalStorage, and LocalStorage will propagate the changes to all data and Components bound to this propName.

If propName does not exist in LocalStorage, returns None.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |

**Return Value:**

| Type | Description |
|:----|:----|
| ?[ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of Option\<ObservedProperty\<T>>, representing the two-way bound data corresponding to the property in LocalStorage. Returns None if the propName does not exist in LocalStorage. |

### func set\<T>(String, T)

```cangjie

public func set<T>(propName: String, newValue: T): Bool
```

**Function:** Sets the value of the property corresponding to propName in LocalStorage. If newValue is the same as the current value of the property, no assignment operation is performed, and the state variable will not trigger a UI refresh for the property.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |
| newValue | T | Yes | - | The property value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns false if the property does not exist in LocalStorage. Returns true if the setting is successful. |

### func setAndLink\<T>(String, T)

```cangjie

public func setAndLink<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**Function:** Similar to the `link` interface. If the given propName exists in LocalStorage, returns the two-way bound data corresponding to the property. If it does not exist, creates and initializes the property in LocalStorage using defaultValue, then returns its two-way bound data.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |
| defaultValue | T | Yes | - | If propName does not exist in LocalStorage, initializes the property with defaultValue. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of ObservedProperty\<T>, representing the two-way bound data corresponding to the property in LocalStorage. |

### func setAndProp\<T>(String, T)

```cangjie

public func setAndProp<T>(propName: String, defaultValue: T): ObservedProperty<T>
```

**Function:** Similar to the `prop` interface. If propName exists in LocalStorage, returns the one-way bound data corresponding to the property. If it does not exist, creates and initializes the property in LocalStorage using defaultValue, then returns its one-way bound data.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |
| defaultValue | T | Yes | - | If propName does not exist in LocalStorage, initializes the property with defaultValue. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ObservedProperty](./cj-state-rendering-componentstatemanagement.md#class-observedproperty) | An instance of ObservedProperty\<T>, representing the one-way bound data corresponding to the property in LocalStorage. |

### func setOrCreate\<T>(String, T)

```cangjie

public func setOrCreate<T>(propName: String, newValue: T): Bool
```

**Function:** If propName already exists in LocalStorage and newValue differs from the current property value, sets the property value to newValue. Otherwise, the state variable will not trigger a UI refresh for the property. If propName does not exist, creates the property with newValue as its value. `setOrCreate` can only create a single LocalStorage key-value pair. To create multiple key-value pairs, call this method multiple times.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| propName | String | Yes | - | The property name in LocalStorage. |
| newValue | T | Yes | - | The property value. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if propName exists in LocalStorage and its value is updated to newValue. If propName does not exist, creates the property with newValue and returns true. |

### func size()

```cangjie

public func size(): Int64
```

**Function:** Returns the number of properties in LocalStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The number of properties in LocalStorage. |

## class PersistentStorage

```cangjie
public class PersistentStorage <: Observer {}
```

**Function:** Deletes the property corresponding to the key from PersistentStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parent Type:**

- [Observer](./cj-state-rendering-componentstatemanagement.md#class-observer)

### static func deleteProp(String)

```cangjie

public static func deleteProp(key: String): Unit
```

**Function:** Deletes the property corresponding to the key from PersistentStorage.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | The property name in PersistentStorage. |

### static func keys()

```cangjie

public static func keys(): Array<String>
```

**Function:** Returns a collection of all persistent property names.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | A collection of all persistent property names. |

### static func persistProp\<T>(String, T)

```cangjie

public static func persistProp<T>(key: String, defaultValue: T): Unit
```

**Function:** Persists the property corresponding to the key in AppStorage to a file. This method is typically called before accessing AppStorage.

The type and value of the property are determined as follows:

1. If the key exists in the PersistentStorage file, creates the corresponding propName in AppStorage and initializes it with the property value found in PersistentStorage.

2. If the key is not found in PersistentStorage, searches for the key in AppStorage. If found, persists the property.

3. If the key is not found in AppStorage either, creates the property in AppStorage, initializes it with defaultValue, and persists it.

According to this initialization flow, if the property exists in AppStorage, its value will override the value in the PersistentStorage file. Since AppStorage is in-memory data, this behavior may result in loss of persistence.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | The property name. |
| defaultValue | T | Yes | - | The default value used for initialization if the property is not found in PersistentStorage or AppStorage. |

### static func persistProps\<T>(Array\<(String,T)>)

```cangjie

public static func persistProps<T>(props: Array<(String, T)>): Unit
```

**Function:** Similar to `persistProp`, but allows persisting multiple data entries at once, suitable for initialization during application startup.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| props | Array\<(String,T)> | Yes | - | An array of persistent data, where each element is a tuple (key, defaultValue). |

### func aboutToBeDeleted()

```cangjie

public func aboutToBeDeleted(): Unit
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### func id()

```cangjie

public func id(): Int64
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | <font color="red" face="bold">please add description</font> |

### func notifyRead(String)

```cangjie

public func notifyRead(_: String): Unit
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| _ | String | Yes | - | <font color="red" face="bold">please add description</font> |

### func onStateUpdate(String, ArrayList\<Int64>)

```cangjie

public func onStateUpdate(_: String, _: ArrayList<Int64>): Unit
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| _ | String | Yes | - | <font color="red" face="bold">please add description</font> |
| _ | ArrayList\<Int64> | Yes | - | <font color="red" face="bold">please add description</font> |## enum ColorMode

```cangjie
public enum ColorMode {
    | Light
    | Dark
    | ...
}
```

**Description:** Color scheme type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Dark

```cangjie
Dark
```

**Description:** Dark mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Light

```cangjie
Light
```

**Description:** Light mode.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

## enum LayoutDirection

```cangjie
public enum LayoutDirection {
    | Ltr
    | Rtl
    | Auto
    | ...
}
```

**Description:** Layout direction type.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Auto

```cangjie
Auto
```

**Description:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Ltr

```cangjie
Ltr
```

**Description:** Left-to-right.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21

### Rtl

```cangjie
Rtl
```

**Description:** Right-to-left.

**System Capability:** SystemCapability.ArkUI.ArkUI.Full

**Since:** 21