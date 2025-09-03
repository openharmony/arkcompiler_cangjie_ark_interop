# ohos.data.preferences

User Preferences provides applications with Key-Value pair data processing capabilities, supporting lightweight data persistence, modification, and query operations.

Data is stored in key-value pairs where keys are of string type, and values can be numeric, string, boolean, or arrays of these three types.

## Import Module

```cangjie
import kit.ArkData.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration must be done in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## const MAX_KEY_LENGTH

```cangjie
public const MAX_KEY_LENGTH: UInt32 = 1024
```

**Description:** Maximum key length limit of 1024 bytes.

**Type:** UInt32

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## const MAX_VALUE_LENGTH

```cangjie
public const MAX_VALUE_LENGTH: UInt32 = 16 * 1024 * 1024
```

**Description:** Maximum value length limit of 16 * 1024 * 1024 bytes.

**Type:** UInt32

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## class Options

```cangjie
public class Options {
    public var name: String
    public var dataGroupId: String
    public var storageType: StorageType
    public init(name: String, dataGroupId!: String = String.empty,
        storageType!: StorageType = StorageType.StorageTypeXml)
}
```

**Description:** Configuration options for Preferences instances.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### var dataGroupId

```cangjie
public var dataGroupId: String
```

**Description:** Application group ID, which needs to be obtained from the application market.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### var name

```cangjie
public var name: String
```

**Description:** Name of the Preferences instance.

**Type:** String

**Access:** Read-write

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### var storageType

```cangjie
public var storageType: StorageType
```

**Description:** Storage mode (optional parameter).

**Type:** [StorageType](#enum-storagetype)

**Access:** Read-write

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### init(String, String, StorageType)

```cangjie
public init(name: String, dataGroupId!: String = String.empty,
    storageType!: StorageType = StorageType.StorageTypeXml)
```

**Description:** Constructor for creating Options instances. By default creates Preferences instances in the application sandbox directory.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Name of the Preferences instance. |
| dataGroupId | String | No | String.empty | Application group ID (obtained from app market). |
| storageType | [StorageType](#enum-storagetype) | No | StorageType.StorageTypeXml | Storage mode (optional). |

## class Preferences

```cangjie
public class Preferences {}
```

**Description:** Preferences class providing interfaces for accessing and modifying stored data.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### static func deletePreferences(UIAbilityContext, String)

```cangjie
public static func deletePreferences(context: UIAbilityContext, name: String): Unit
```

**Description:** Removes specified Preferences instance from cache. If the instance has a corresponding persistent file, the file will also be deleted.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations to avoid consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| name | String | Yes | - | Name of the Preferences instance. |

**Exceptions:**

- BusinessException: Error codes as follows:

| Error Code | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes:1. Mandatory parameters missing; 2. Incorrect parameter types;3. Parameter verification failed. |
| 15500000 | Internal error. |
| 15500010 | Failed to delete user preferences persistence file. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Get Preferences instance
let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), "myStore")  // Requires Context (see Usage Instructions)
try {
    // Delete Preferences instance
    Preferences.deletePreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), "myStore")
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "delete Preferences failed")
}
```

### static func deletePreferences(UIAbilityContext, Options)

```cangjie
public static func deletePreferences(context: UIAbilityContext, options: Options): Unit
```

**Description:** Removes specified Preferences instance from cache. If the instance has a corresponding persistent file, the file will also be deleted.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations to avoid consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| options | [Options](#class-options) | Yes | - | Configuration options for the Preferences instance. |

**Exceptions:**

- BusinessException: Error codes as follows:

| Error Code | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes:1. Mandatory parameters missing; 2. Incorrect parameter types;3. Parameter verification failed. |
| 801 | Capability not supported. |
| 15500010 | Failed to delete user preferences persistence file. |
| 15501001 | Operation supported in stage mode only. |
| 15501002 | Invalid dataGroupId. |

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
| :---- | :--- | :--- |
| The context is invalid. | todo | todo |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Get Preferences instance
let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), "myStore")  // Requires Context (see Usage Instructions)
try {
    // Delete Preferences instance
    Preferences.deletePreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), "myStore")
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "delete Preferences failed")
}
```

### static func getPreferences(UIAbilityContext, String)

```cangjie
public static func getPreferences(context: UIAbilityContext, name: String): Preferences
```

**Description:** Removes specified Preferences instance from cache.

When an application first calls [getPreferences](#func-getpreferencesuiabilitycontext-string) to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#func-getpreferencesuiabilitycontext-string) will retrieve the instance directly from cache rather than reading from the persistent file. After removing the instance from cache via this interface, calling getPreferences again will re-read the persistent file and generate a new Preferences instance.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations to avoid consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| name | String | Yes | - | Name of the Preferences instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Preferences](#class-preferences) | Preferences instance. |

**Exceptions:**

- BusinessException: Error codes as follows:

| Error Code | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes:1. Mandatory parameters missing; 2. Incorrect parameter types;3. Parameter verification failed. |
| 15500000 | Internal error. |

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
| :---- | :--- | :--- |
| The context is invalid. | todo | todo |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Requires Context (see Usage Instructions)
try {
    // Remove Preferences instance from cache
    Preferences.removePreferencesFromCache(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID"))
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "Failed to remove cache for preferences")
}
```

### static func getPreferences(UIAbilityContext, Options)

```cangjie
public static func getPreferences(context: UIAbilityContext, options: Options): Preferences
```

**Description:** Removes specified Preferences instance from cache.

When an application first calls [getPreferences](#func-getpreferencesuiabilitycontext-options) to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#func-getpreferencesuiabilitycontext-options) will retrieve the instance directly from cache rather than reading from the persistent file. After removing the instance from cache via this interface, calling getPreferences again will re-read the persistent file and generate a new Preferences instance.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations to avoid consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Name | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| options | [Options](#class-options) | Yes | - | Name of the Preferences instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Preferences](#class-preferences) | Preferences instance. |

**Exceptions:**

- BusinessException: Error codes as follows:

| Error Code | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes:1. Mandatory parameters missing; 2. Incorrect parameter types;3. Parameter verification failed. |
| 15500000 | Internal error. |

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
| :---- | :--- | :--- |
| The context is invalid. | todo | todo |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Requires Context (see Usage Instructions)
try {
    // Remove Preferences instance from cache
    Preferences.removePreferencesFromCache(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID"))
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "Failed to remove cache for preferences")
}
```### static func removePreferencesFromCache(UIAbilityContext, String)

```cangjie
public static func removePreferencesFromCache(context: UIAbilityContext, name: String): Unit
```

**Function:** Removes the specified Preferences instance from the cache.

When an application first calls the [getPreferences](#func-getpreferencesuiabilitycontext-string) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#func-getpreferencesuiabilitycontext-string) will retrieve the Preferences instance directly from the cache without reading from the persistent file again. After calling this interface to remove the instance from the cache, the next call to getPreferences will re-read the persistent file and generate a new Preferences instance.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may lead to data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| name | String | Yes | - | Name of the Preferences instance. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
try {
    // Remove the Preferences instance from the cache
    Preferences.removePreferencesFromCache(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID"))
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "Failed to remove cache for preferences")
}
```

### static func removePreferencesFromCache(UIAbilityContext, Options)

```cangjie
public static func removePreferencesFromCache(context: UIAbilityContext, options: Options): Unit
```

**Function:** Removes the specified Preferences instance from the cache.

When an application first calls the [getPreferences](#func-getpreferencesuiabilitycontext-options) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#func-getpreferencesuiabilitycontext-options) will retrieve the Preferences instance directly from the cache without reading from the persistent file again. After calling this interface to remove the instance from the cache, the next call to getPreferences will re-read the persistent file and generate a new Preferences instance.

After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may lead to data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../AbilityKit/cj-apis-ability.md#class-uiabilitycontext) | Yes | - | Application context. |
| options | [Options](#class-options) | Yes | - | Name of the Preferences instance. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 801 | Capability not supported. |
| 15500000 | Inner error. |
| 15501001 | The operations is supported in stage mode only. |
| 15501002 | Invalid dataGroupId. |

- IllegalArgumentException:

| Error Message | Possible Causes | Handling Steps |
| :---- | :--- | :--- |
| The context is invalid. | todo | todo |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
try {
    // Remove the Preferences instance from the cache
    Preferences.removePreferencesFromCache(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID"))
} catch (e: Exception) {
    Hilog.error(0, "AppLogCj", "Failed to remove cache for preferences")
}
```

### func clear()

```cangjie
public func clear(): Unit
```

**Function:** Clears all data in the cached Preferences instance. The Preferences instance can be persisted via [flush](#func-flush).

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Mandatory parameters are left unspecified. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import kit.ArkData.ValueType as PreferencesValueType
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
preferences.put("myKey", PreferencesValueType.StringData("myValue"))
preferences.clear()
```

### func delete(String)

```cangjie
public func delete(key: String): Unit
```

**Function:** Deletes the key-value pair with the specified key from the cached Preferences instance. The Preferences instance can be persisted via [flush](#func-flush).

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | Name of the key to be deleted. Cannot be empty. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

// Get the Preferences instance
let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), "myStore") // Context application context needs to be obtained, see usage instructions in this document
preferences.delete("startup")
```

### func flush()

```cangjie
public func flush(): Unit
```

**Function:** Stores the data in the cached Preferences instance into the persistent file of user preferences.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Mandatory parameters are left unspecified. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import kit.ArkData.ValueType as PreferencesValueType
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
preferences.put("myKey", PreferencesValueType.StringData("myValue"))
preferences.flush()
```

### func get(String, ValueType)

```cangjie
public func get(key: String, defValue: ValueType): ValueType
```

**Function:** Retrieves the value corresponding to the specified key from the cached Preferences instance. If the key does not exist, returns the default value defValue.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | Name of the key to retrieve. |
| defValue | [ValueType](#enum-valuetype) | Yes | - | Default return value. Supports Int64, Float64, String, Bool, Array\<Bool>, Array\<Float64>, Array\<String>. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ValueType](#enum-valuetype) | Returns the value corresponding to the key. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import kit.ArkData.ValueType as PreferencesValueType
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end
import kit.PerformanceAnalysisKit.Hilog

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
var value = preferences.get("key", PreferencesValueType.integer(0))
match (value) {
    case PreferencesValueType.integer(n) => Hilog.info(0, "AppLogCj", "Retrieved value: ${n}")
    case _ => Hilog.info(0, "AppLogCj", "Retrieved value is not an Int")
}
```

### func getAll()

```cangjie
public func getAll(): HashMap<String, ValueType>
```

**Function:** Retrieves all key-value data from the cached Preferences instance.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String, [ValueType](#enum-valuetype)> | HashMap object containing all key-value data. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Mandatory parameters are left unspecified. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end
import kit.PerformanceAnalysisKit.Hilog

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
var values = preferences.getAll()
for ((k, v) in values) {
    match (v) {
        case Integer(n) => Hilog.info(0, "AppLogCj", "Retrieved key-value pair key: ${k} value: ${n}")
        case Double(n) => Hilog.info(0, "AppLogCj", "Retrieved key-value pair key: ${k} value: ${n}")
        case StringData(n) => Hilog.info(0, "AppLogCj", "Retrieved key-value pair key: ${k} value: ${n}")
        case _ => Hilog.info(0, "AppLogCj", "Other value")
    }
}
```

### func has(String)

```cangjie
public func has(key: String): Bool
```

**Function:** Checks whether the cached Preferences instance contains a key-value pair with the specified key.

**System Capability:** SystemCapability.DistributedDataManager.Pferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | Yes | - | Name of the key to check. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Boolean value. Returns whether the Preferences instance contains a key-value pair with the specified key. True indicates existence, false indicates non-existence. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.data.preferences.Options as PreferencesOptions
import ohos.base.*
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end
import kit.PerformanceAnalysisKit.Hilog

let preferences = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), PreferencesOptions("mystore", dataGroupId:"myGroupID")) // Context application context needs to be obtained, see usage instructions in this document
let hasKey = preferences.has("startup")
if (hasKey) {
    Hilog.info(0, "AppLogCj", "The key 'startup' is contained.")
} else {
    Hilog.info(0, "AppLogCj", "The key 'startup' does not contain.")
}
```

### func off(PreferencesEvent, ?Callback1Argument\<String>)

```cangjie
public func off(event: PreferencesEvent, callback: ?Callback1Argument<String> = None): Unit
```

**Function:** Unsubscribes from data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | [PreferencesEvent](#enum-preferencesevent) | Yes | - | Event type, indicating unsubscribing from data changes or inter-process data changes. |
| callback | ?[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argumentex)\<String> | No | None | Callback function to be unsubscribed. If not specified, all callbacks will be unsubscribed. <br> String: Type of the changed key. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed in the table below.

| Error Code ID | Error Message |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. |
| 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import ohos.callback_invoke.*
import ohos.business_exception.*
import kit.ArkData.ValueType as PValueType
import ohos.arkui.state_management.AppStorage
//// check redundant import
import kit.AbilityKit.UIAbilityContext
//// end
import kit.PerformanceAnalysisKit.Hilog

// This code can be added to dependency definitions
// Callback function
class Callback <: Callback1Argument<String> {
    public func invoke(err: ?BusinessException, arg: String): Unit {
        Hilog.info(0, "AppLogCj", "=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(AppStorage.get<UIAbilityContext>("abilityContext").getOrThrow(), str) // Context application context needs to be obtained, see usage instructions in this document
var c = Callback()
a.on(PreferencesEvent.PreferencesChange, c)
a.off(PreferencesEvent.PreferencesChange)
a.put("kkk1", PValueType.StringData("vvv1"))
a.flush()
```

### func on(PreferencesEvent, Callback1Argument\<String>)

```cangjie
public func on(event: PreferencesEvent, callback: Callback1Argument<String>): Unit
```

**Function:** Subscribes to data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Initial Version:** 21## enum PreferencesEvent

```cangjie
public enum PreferencesEvent {
    | PreferencesChange
    | PreferencesMultiProcessChange
}
```

**Description:** Enumeration of event types for Preferences.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### PreferencesChange

```cangjie
PreferencesChange
```

**Description:** Indicates data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### PreferencesMultiProcessChange

```cangjie
PreferencesMultiProcessChange
```

**Description:** Indicates data changes across multiple processes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## enum StorageType

```cangjie
public enum StorageType {
    | StorageTypeXml
    | StorageTypeGskv
}
```

**Description:** Enumeration of storage modes for Preferences.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### StorageTypeGskv

```cangjie
StorageTypeGskv
```

**Description:** Indicates GSKV storage mode.

**Characteristics:** Data is stored in GSKV database mode. Operations on data are immediately persisted to disk without requiring the `flush` interface for data persistence.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### StorageTypeXml

```cangjie
StorageTypeXml
```

**Description:** Indicates XML storage mode, which is the default storage mode for Preferences.

**Characteristics:** Data is stored in XML format. Operations on data occur in memory, requiring the `flush` interface for disk persistence.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## enum ValueType

```cangjie
public enum ValueType {
    | Integer(Int64)
    | Double(Float64)
    | StringData(String)
    | BoolData(Bool)
    | BoolArray(Array<Bool>)
    | DoubleArray(Array<Float64>)
    | StringArray(Array<String>)
}
```

**Description:** Represents supported value types.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### BoolArray(Array\<Bool>)

```cangjie
BoolArray(Array<Bool>)
```

**Description:** Indicates an array of boolean values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### BoolData(Bool)

```cangjie
BoolData(Bool)
```

**Description:** Indicates a boolean value.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### Double(Float64)

```cangjie
Double(Float64)
```

**Description:** Indicates a 64-bit floating-point value.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### DoubleArray(Array\<Float64>)

```cangjie
DoubleArray(Array<Float64>)
```

**Description:** Indicates an array of 64-bit floating-point values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### Integer(Int64)

```cangjie
Integer(Int64)
```

**Description:** Indicates a 64-bit signed integer value.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### StringArray(Array\<String>)

```cangjie
StringArray(Array<String>)
```

**Description:** Indicates an array of string values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### StringData(String)

```cangjie
StringData(String)
```

**Description:** Indicates a string value.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21