# ohos.preferences (User Preferences)

User Preferences provides applications with Key-Value pair data processing capabilities, supporting lightweight data persistence for applications, along with modification and query operations.

Data is stored in key-value pairs, where keys are of string type, and values can be numeric, string, boolean, or arrays of these three types.

## Import Module

```cangjie
import kit.ArkData.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## let MAX_KEY_LENGTH

```cangjie
public let MAX_KEY_LENGTH: Int64 = 1024
```

**Function:** The maximum length limit for a Key is 1024 bytes.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## let MAX_VALUE_LENGTH

```cangjie
public let MAX_VALUE_LENGTH: Int64 = 16 * 1024 * 1024
```

**Function:** The maximum length limit for a Value is 16 * 1024 * 1024 bytes.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

## class Preferences

```cangjie
public class Preferences {}
```

**Function:** The Preferences class provides interfaces for obtaining and modifying stored data.

> **Note:**
>
> To obtain an instance, first call the [getPreferences](#static-func-getpreferencesstagecontext-string) function, then use the obtained instance to call other member functions.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### static func deletePreferences(StageContext, String)

```cangjie
public static func deletePreferences(context: StageContext, name: String): Unit
```

**Function:** Removes the specified Preferences instance from the cache. If the Preferences instance has a corresponding persistent file, the file is also deleted.

> **Note:**
>
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may cause data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |
| name | String | Yes | - | The name of the Preferences instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [User Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000 | Inner error. |
  | 15500010 | Failed to delete preferences file. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// Obtain Preferences instance
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // Requires obtaining Context application context; see usage instructions above.
try {
    // Delete Preferences instance
    Preferences.deletePreferences(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("delete Preferences failed")
}
```

### static func deletePreferences(StageContext, PreferencesOptions)

```cangjie
public static func deletePreferences(context: StageContext, options: PreferencesOptions): Unit
```

**Function:** Removes the specified Preferences instance from the cache. If the Preferences instance has a corresponding persistent file, the file is also deleted.

> **Note:**
>
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may cause data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |
| options | [PreferencesOptions](#struct-preferencesoptions) | Yes | - | Configuration options related to the Preferences instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [User Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000 | Inner error. |
  | 15500010 | Failed to delete preferences file. |
  | 15501002 | The data group id is not valid. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// Obtain Preferences instance
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // Requires obtaining Context application context; see usage instructions above.
try {
    // Delete Preferences instance
    Preferences.deletePreferences(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("delete Preferences failed")
}
```

### static func getPreferences(StageContext, String)

```cangjie
public static func getPreferences(context: StageContext, name: String): Preferences
```

**Function:** Removes the specified Preferences instance from the cache.

> **Note:**
>
> When an application first calls the [getPreferences](#static-func-getpreferencesstagecontext-string) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#static-func-getpreferencesstagecontext-string) will retrieve the instance directly from the cache instead of reading from the persistent file. After calling this interface to remove the instance from the cache, calling getPreferences again will re-read the persistent file and generate a new Preferences instance.
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may cause data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |
| name | String | Yes | - | The name of the Preferences instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Preferences](#class-preferences) | The Preferences instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [User Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // Requires obtaining Context application context; see usage instructions above.
try {
    // Remove Preferences instance from cache
    Preferences.removePreferencesFromCache(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### static func getPreferences(StageContext, PreferencesOptions)

```cangjie
public static func getPreferences(context: StageContext, options: PreferencesOptions): Preferences
```

**Function:** Removes the specified Preferences instance from the cache.

> **Note:**
>
> When an application first calls the [getPreferences](#static-func-getpreferencesstagecontext-string) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#static-func-getpreferencesstagecontext-string) will retrieve the instance directly from the cache instead of reading from the persistent file. After calling this interface to remove the instance from the cache, calling getPreferences again will re-read the persistent file and generate a new Preferences instance.
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may cause data consistency issues.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |
| options | [PreferencesOptions](#struct-preferencesoptions) | Yes | - | The name of the Preferences instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Preferences](#class-preferences) | The Preferences instance. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [User Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000 | Inner error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Requires obtaining Context application context; see usage instructions above.
try {
    // Remove Preferences instance from cache
    Preferences.removePreferencesFromCache(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID"))
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### static func removePreferencesFromCache(StageContext, String)

```cangjie
public static func removePreferencesFromCache(context: StageContext, name: String): Unit
```

**Function:** Removes the specified Preferences instance from the cache.

> **Note:**
>
> When an application first calls the [getPreferences](#static-func-getpreferencesstagecontext-string) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#static-func-getpreferencesstagecontext-string) will retrieve the instance directly from the cache instead of reading from the persistent file. After calling this interface to remove the instance from the cache, calling getPreferences again will re-read the persistent file and generate a new Preferences instance.
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as this may cause data consistency issues.**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |  
| name | String | Yes | - | Name of the Preferences instance. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  
import ohos.base.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // Context application context required, see usage instructions  
try {  
    // Remove Preferences instance from cache  
    Preferences.removePreferencesFromCache(Global.getStageContext(), "myStore")  
} catch (e: Exception) {  
    AppLog.info("Failed to remove cache for preferences")  
}  
```  

### static func removePreferencesFromCache(StageContext, PreferencesOptions)  

```cangjie  
public static func removePreferencesFromCache(context: StageContext, options: PreferencesOptions): Unit  
```  

**Function:** Removes the specified Preferences instance from the cache.  

> **Note:**  
>  
> When an application first calls the [getPreferences](#static-func-getpreferencesstagecontext-string) interface to obtain a Preferences instance, the instance is cached. Subsequent calls to [getPreferences](#static-func-getpreferencesstagecontext-string) will retrieve the instance directly from the cache instead of reading from the persistent file again. After calling this interface to remove the instance from the cache, the next getPreferences call will re-read the persistent file and generate a new Preferences instance.  
> After calling this interface, it is not recommended to continue using the old Preferences instance for data operations, as it may lead to data consistency issues.  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |  
| options | [PreferencesOptions](#struct-preferencesoptions) | Yes | - | Name of the Preferences instance. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |  
  | 15500000 | Inner error. |  
  | 15501002 | The data group id is not valid. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  
import ohos.base.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context required, see usage instructions  
try {  
    // Remove Preferences instance from cache  
    Preferences.removePreferencesFromCache(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID"))  
} catch (e: Exception) {  
    AppLog.info("Failed to remove cache for preferences")  
}  
```  

### func clear()  

```cangjie  
public func clear(): Unit  
```  

**Function:** Clears all data in the cached Preferences instance. The instance can be persisted using [flush](#func-flush).  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context required, see usage instructions  
preferences.put("myKey", PreferencesValueType.string("myValue"))  
preferences.clear()  
```  

### func delete(String)  

```cangjie  
public func delete(key: String): Unit  
```  

**Function:** Deletes the key-value pair with the specified key from the cached Preferences instance. The instance can be persisted using [flush](#func-flush).  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | String | Yes | - | Name of the key to delete. Cannot be empty. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  

// Get Preferences instance  
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // Context application context required, see usage instructions  
preferences.delete("startup")  
```  

### func flush()  

```cangjie  
public func flush(): Unit  
```  

**Function:** Stores the data in the cached Preferences instance into the persistent file for user preferences.  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context required, see usage instructions  
preferences.put("myKey", PreferencesValueType.string("myValue"))  
preferences.flush()  
```  

### func get(String, PreferencesValueType)  

```cangjie  
public func get(key: String, defValue: PreferencesValueType): PreferencesValueType  
```  

**Function:** Retrieves the value associated with the specified key from the cached Preferences instance. If the key does not exist, returns the default value defValue.  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| key | String | Yes | - | Name of the key to retrieve. |  
| defValue | [PreferencesValueType](#enum-preferencesvaluetype) | Yes | - | Default return value. Supports Int64, Float64, String, Bool, Array\<Bool>, Array\<Float64>, Array\<String>. |  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| [PreferencesValueType](#enum-preferencesvaluetype) | Returns the value associated with the key. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  
import ohos.base.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context required, see usage instructions  
var value = preferences.get("key", PreferencesValueType.integer(0))  
match (value) {  
    case PreferencesValueType.integer(n) => AppLog.info("Retrieved value: ${n}")  
    case _ => AppLog.info("Retrieved value is not Int")  
}  
```  

### func getAll()  

```cangjie  
public func getAll(): HashMap<String, PreferencesValueType>  
```  

**Function:** Retrieves all key-value pairs from the cached Preferences instance.  

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| HashMap\<String, [PreferencesValueType](#enum-preferencesvaluetype)> | HashMap object containing all key-value pairs. |  

**Exceptions:**  

- BusinessException: For detailed error codes, refer to [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).  

  | Error Code ID | Error Message |  
  | :-------- | :------------------------------|  
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |  
  | 15500000 | Inner error. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  
import ohos.base.*  

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context required, see usage instructions  
var values = preferences.getAll()  
for ((k, v) in values) {  
    match (v) {  
        case integer(n) => AppLog.info("Retrieved key-value pair key: ${k} value: ${n}")  
        case double(n) => AppLog.info("Retrieved key-value pair key: ${k} value: ${n}")  
        case string(n) => AppLog.info("Retrieved key-value pair key: ${k} value: ${n}")  
        case _ => AppLog.info("Other value")  
    }  
}  
```
### func has(String)

```cangjie
public func has(key: String): Bool
```

**Function:** Checks whether the cached Preferences instance contains a key-value pair with the specified key.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description                |
|:----------|:-------|:----------|:--------|:---------------------------|
| key       | String | Yes       | -       | The name of the key to check. |

**Return Value:**

| Type | Description                                                                 |
| :---------------------- | :-------------------------------------------------------------------------- |
| Bool | Boolean value. Returns whether the Preferences instance contains the key-value pair with the specified key. `true` means it exists; `false` means it does not. |

**Exceptions:**

- BusinessException: For details about error codes, see [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                              |
  | :------------ | :----------------------------------------- |
  | 401           | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000      | Inner error.                               |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context needs to be obtained. For details, see the usage instructions in this document.
let hasKey = preferences.has("startup")
if (hasKey) {
    AppLog.info("The key 'startup' is contained.")
} else {
    AppLog.info("The key 'startup' dose not contain.")
}
```

### func off(String, Callback1Argument\<String>)

```cangjie
public func off(tp: String, callback: Callback1Argument<String>): Unit
```

**Function:** Unsubscribes from data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description                |
|:----------|:-------|:----------|:--------|:---------------------------|
| tp        | String | Yes       | -       | Event type, fixed value "change" or "multiProcessChange".<br>"change": Unsubscribes from data changes.<br>"multiProcessChange": Unsubscribes from inter-process data changes. |
| callback  | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<String> | Yes | - | The callback function to be unsubscribed. If not specified, all callbacks will be unsubscribed. String: The type of the changed key. |

**Exceptions:**

- BusinessException: For details about error codes, see [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                              |
  | :------------ | :----------------------------------------- |
  | 401           | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000      | Inner error.                               |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PreferencesValueType as PValueType

// The following code can be added to the dependency definition
// Callback function
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // Context application context needs to be obtained. For details, see the usage instructions in this document.
var c = Callback()
a.on("change", c)
a.off("change", c)
a.put("kkk1", PValueType.string("vvv1"))
a.flush()
```

### func off(String)

```cangjie
public func off(tp: String): Unit
```

**Function:** Unsubscribes from data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description                |
|:----------|:-------|:----------|:--------|:---------------------------|
| tp        | String | Yes       | -       | Event type, fixed value "change" or "multiProcessChange".<br>"change": Unsubscribes from data changes.<br>"multiProcessChange": Unsubscribes from inter-process data changes. |

**Exceptions:**

- BusinessException: For details about error codes, see [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                              |
  | :------------ | :----------------------------------------- |
  | 401           | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000      | Inner error.                               |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PreferencesValueType as PValueType

// Callback function
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // Context application context needs to be obtained. For details, see the usage instructions in this document.
var c = Callback()
a.on("change", c)
a.off("change")
a.put("kkk1", PValueType.string("vvv1"))
a.flush()
```

### func on(String, Callback1Argument\<String>)

```cangjie
public func on(tp: String, callback: Callback1Argument<String>): Unit
```

**Function:** Subscribes to data changes.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description                |
|:----------|:-------|:----------|:--------|:---------------------------|
| tp        | String | Yes       | -       | Event type, fixed value "change" or "multiProcessChange".<br>"change": Subscribes to data changes. The callback is triggered after the `flush` method is executed when the value of the subscribed key changes.<br>"multiProcessChange": Subscribes to inter-process data changes. When multiple processes hold the same preferences file, the callback is triggered after the `flush` method is executed when the value of the subscribed key changes in any process. |
| callback  | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<String> | Yes | - | Callback function. String: The type of the changed key. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PferencesValueType as PValueType

// Callback function
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // Context application context needs to be obtained. For details, see the usage instructions in this document.
var c = Callback()
a.on("change", c)
a.put("kkk1", PValueType.string("vvv1"))
a.flush()
```

### func put(String, PreferencesValueType)

```cangjie
public func put(key: String, value: PreferencesValueType): Unit
```

**Function:** Writes data to the cached Preferences instance. The Preferences instance can be persisted using [flush](#func-flush).

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description                |
|:----------|:-------|:----------|:--------|:---------------------------|
| key       | String | Yes       | -       | The key of the data to be modified. It cannot be empty. |
| value     | [PreferencesValueType](#enum-preferencesvaluetype) | Yes | - | The new value to be stored. Supports Int64, Float64, String, Bool, Array\<Bool>, Array\<Float64>, and Array\<String>. |

**Exceptions:**

- BusinessException: For details about error codes, see [Preferences Error Codes](../../errorcodes/cj-errorcode-preferences.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message                              |
  | :------------ | :----------------------------------------- |
  | 401           | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed. |
  | 15500000      | Inner error.                               |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // Context application context needs to be obtained. For details, see the usage instructions in this document.
preferences.put("Monday", PreferencesValueType.string("Today's weather is nice"))
```

## struct PreferencesOptions

```cangjie
public struct PreferencesOptions {
    public let name: String
    public let dataGroupId: String
    public init(name: String)
    public init(name: String, dataGroupId: String)
}
```

**Function:** Configuration options for the Preferences instance.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### let dataGroupId

```cangjie
public let dataGroupId: String
```

**Function:** Application group ID, which needs to be obtained from the application market.

**Type:** String

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** The name of the Preferences instance.

**Type:** String

**Read/Write Attribute:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21
### init(String)

```cangjie
public init(name: String)
```

**Function:** Constructor for creating an Options instance. By default, it creates a Preferences instance in the application sandbox directory.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The name of the Preferences instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var options = PreferencesOptions("name")
```

### init(String, String)

```cangjie
public init(name: String, dataGroupId: String)
```

**Function:** Constructor for creating an Options instance.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The name of the Preferences instance. |
| dataGroupId | String | Yes | - | The application group ID, which needs to be obtained from the application market. Specifies the sandbox path under the corresponding dataGroupId to create the Preferences instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var options = PreferencesOptions("name", "dataGroupId")
```

## enum PreferencesValueType

```cangjie
public enum PreferencesValueType {
    | integer(Int64)
    | double(Float64)
    | string(String)
    | bool(Bool)
    | boolArray(Array<Bool>)
    | doubleArray(Array<Float64>)
    | stringArray(Array<String>)
    | ...
}
```

**Function:** Enumeration type representing allowed data fields.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### bool(Bool)

```cangjie
bool(Bool)
```

**Function:** Represents a boolean value type.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### boolArray(Array\<Bool>)

```cangjie
boolArray(Array<Bool>)
```

**Function:** Represents an array of boolean values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### double(Float64)

```cangjie
double(Float64)
```

**Function:** Represents a Float64 floating-point value type.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### doubleArray(Array\<Float64>)

```cangjie
doubleArray(Array<Float64>)
```

**Function:** Represents an array of Float64 values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### integer(Int64)

```cangjie
integer(Int64)
```

**Function:** Represents an Int64 numeric value type.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### string(String)

```cangjie
string(String)
```

**Function:** Represents a string value type.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21

### stringArray(Array\<String>)

```cangjie
stringArray(Array<String>)
```

**Function:** Represents an array of string values.

**System Capability:** SystemCapability.DistributedDataManager.Preferences.Core

**Since:** 21