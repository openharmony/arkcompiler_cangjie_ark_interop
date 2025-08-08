# ohos.distributed_kv_store (Distributed Key-Value Database)

The distributed key-value database provides applications with distributed collaboration capabilities for databases across different devices. By calling various interfaces of the distributed key-value database, applications can save data to the distributed key-value database and perform operations such as adding, deleting, modifying, querying, and synchronizing data in the distributed key-value database.

This module provides the following common functionalities related to distributed key-value databases:

- [KVManager](#class-kvmanager): A distributed key-value database management instance used to obtain database-related information.
- [KVStoreResultSet](#class-kvstoreresultset): Provides methods for obtaining database result sets, including querying and moving data reading positions.
- [Query](#class-query): Uses predicates to represent database queries, providing methods to create Query instances, query data in the database, and add predicates.
- [SingleKVStore](#class-singlekvstore): A single-version distributed key-value database that does not distinguish data by device. Modifications to the same key by different devices will overwrite each other. It provides methods for querying and synchronizing data.
- [DeviceKVStore](#class-devicekvstore): A device collaboration database that inherits from [SingleKVStore](#class-singlekvstore). It distinguishes data by device dimension, avoiding conflicts, and supports methods for querying and synchronizing data by device dimension.

## Import Module

```cangjie
import kit.ArkData.*
```

## Permission List

ohos.permission.DISTRIBUTED_DATASYNC

## Usage Instructions

API example code usage instructions:

- If the first line of the example code has a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example projects and configuration templates, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#cangjie-example-code-instructions).

## let MAX_BATCH_SIZE

```cangjie
public let MAX_BATCH_SIZE: Int64 = 128
```

**Function:** Maximum number of batch operations.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## let MAX_KEY_LENGTH

```cangjie
public let MAX_KEY_LENGTH: Int64 = 1024
```

**Function:** Maximum allowed length of a key in the database, in bytes. If there are duplicate symbols, it is recommended to use the alias: KV_MAX_KEY_LENGTH.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## let MAX_KEY_LENGTH_DEVICE

```cangjie
public let MAX_KEY_LENGTH_DEVICE: Int64 = 896
```

**Function:** Maximum allowed length of a key in the device collaboration database, in bytes.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## let MAX_QUERY_LENGTH

```cangjie
public let MAX_QUERY_LENGTH: Int64 = 512000
```

**Function:** Maximum query length, in bytes.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## let MAX_STORE_ID_LENGTH

```cangjie
public let MAX_STORE_ID_LENGTH: Int64 = 128
```

**Function:** Maximum allowed length of a database identifier, in bytes.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## let MAX_VALUE_LENGTH

```cangjie
public let MAX_VALUE_LENGTH: Int64 = 4194303
```

**Function:** Maximum allowed length of a value in the database, in bytes. It is recommended to use the alias: KV_MAX_VALUE_LENGTH.

**Type:** Int64

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

## class DeviceKVStore

```cangjie
public class DeviceKVStore <: SingleKVStore {}
```

**Function:** A device collaboration database that inherits from SingleKVStore, providing methods for querying and synchronizing data.

The device collaboration database distinguishes data by device dimension. Each device can only write and modify its own data. Data from other devices is read-only and cannot be modified or deleted.

For example, the device collaboration database can be used to implement image sharing between devices, allowing users to view images from other devices but not modify or delete them.

Before calling the methods of DeviceKVStore, you need to construct a DeviceKVStore instance via [getDeviceKVStore](#func-getdevicekvstorestring-kvoptions).

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore

**Since Version:** 21

**Parent Type:**

- [SingleKVStore](#class-singlekvstore)

### func get(String)

```cangjie
public func get(key: String): KVValueType
```

**Function:** Gets the value of the specified key for the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description                                                                 |
|:--------------|:-------|:---------|:--------------|:----------------------------------------------------------------------------|
| key           | String | Yes      | -             | The key of the data to query. Cannot be empty and length must not exceed [MAX_KEY_LENGTH_DEVICE](#let-max_key_length_device). |

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| [ValueType](#enum-valuetype) | Returns the queried value.      |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message                  |
  |:-------------|:-------------------------------|
  | 15100003     | Database corrupted.            |
  | 15100004     | Not found.                     |
  | 15100005     | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Requires obtaining the Context application context. See usage instructions for details.
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.get("key")
```

### func getEntries(String)

```cangjie
public func getEntries(keyPrefix: String): ArrayList<Entry>
```

**Function:** Gets the list of key-value pairs matching the specified prefix for the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description                     |
|:--------------|:-------|:---------|:--------------|:--------------------------------|
| keyPrefix     | String | Yes      | -             | The key prefix to match.        |

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| ArrayList\<[Entry](#struct-entry)> | Returns the list of key-value pairs matching the specified prefix. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message                  |
  |:-------------|:-------------------------------|
  | 15100003     | Database corrupted.            |
  | 15100005     | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Requires obtaining the Context application context. See usage instructions for details.
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.getEntries("key")
```

### func getEntries(Query)

```cangjie
public func getEntries(query: Query): ArrayList<Entry>
```

**Function:** Gets the list of key-value pairs matching the specified Query object for the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description                     |
|:--------------|:-------|:---------|:--------------|:--------------------------------|
| query         | [Query](#class-query) | Yes      | -             | The Query object to match.      |

**Return Value:**

| Type                     | Description                     |
|:-------------------------|:--------------------------------|
| ArrayList\<[Entry](#struct-entry)> | Returns the list of key-value pairs matching the specified Query object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message                  |
  |:-------------|:-------------------------------|
  | 15100003     | Database corrupted.            |
  | 15100005     | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Requires obtaining the Context application context. See usage instructions for details.
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.getEntries(Query())
```

### func getResultSet(String)

```cangjie
public func getResultSet(keyPrefix: String): KVStoreResultSet
```

**Function:** Gets the KVStoreResultSet object matching the specified prefix for the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since Version:** 21

**Parameters:**

| Parameter Name | Type   | Required | Default Value | Description                     |
|:--------------|:-------|:---------|:--------------|:--------------------------------|
| keyPrefix     | String | Yes      | -             | The key prefix to match.        |**Return Value:**

| Type | Description |
|:----|:----|
| [KVStoreResultSet](#class-kvstoreresultset) | Obtains the KVStoreResultSet object matching the specified Query object on the current device. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100001 | Over max limits. |
  | 15100003 | Database corrupted. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.getResultSet("key")
```

### func getResultSet(Query)

```cangjie
public func getResultSet(query: Query): KVStoreResultSet
```

**Function:** Obtains the KVStoreResultSet object matching the specified Query object on the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| query | [Query](#class-query) | Yes | - | Represents the query object. |

**Return Value:**

| Type | Description |
|:----|:----|
| [KVStoreResultSet](#class-kvstoreresultset) | Obtains the KVStoreResultSet object matching the specified Query object on the current device. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100001 | Over max limits. |
  | 15100003 | Database corrupted. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.getResultSet(Query())
```

### func getResultSize(Query)

```cangjie
public func getResultSize(query: Query): Int32
```

**Function:** Obtains the number of results matching the specified Query object on the current device.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| query | [Query](#class-query) | Yes | - | Represents the query object. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Obtains the number of results matching the specified Query object on the current device. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100003 | Database corrupted. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let manager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let store = manager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
store.getResultSize(Query())
```

## class DistributedKVStore

```cangjie
public class DistributedKVStore {}
```

**Function:** Used to create the KVManager class.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore

**Since:** 21

### static func createKVManager(KVManagerConfig)

```cangjie
public static func createKVManager(config: KVManagerConfig): KVManager
```

**Function:** Creates a KVManager object instance for managing database objects.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| config | [KVManagerConfig](#struct-kvmanagerconfig) | Yes | - | Provides configuration information for the KVManager instance, including the caller's package name and user information. |

**Return Value:**

| Type | Description |
|:----|:----|
| [KVManager](#class-kvmanager) | Returns the created KVManager object instance. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, see usage instructions in this document
```

## class KVManager

```cangjie
public class KVManager {}
```

**Function:** Distributed key-value database management instance, used to obtain information related to distributed key-value databases. Before calling methods of KVManager, you need to first build a KVManager instance via [createKVManager](#static-func-createkvmanagerkvmanagerconfig).

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

### func closeKVStore(String, String)

```cangjie
public func closeKVStore(appId: String, storeId: String): Unit
```

**Function:** Closes the specified distributed key-value database via the storeId value.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| appId | String | Yes | - | The package name of the database caller. |
| storeId | String | Yes | - | The unique identifier of the database to be closed, with a length not exceeding [MAX_STORE_ID_LENGTH](#let-max_store_id_length). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, see usage instructions in this document
kvManager.closeKVStore("com.example.myapplication", "myStore")
```

### func deleteKVStore(String, String)

```cangjie
public func deleteKVStore(appId: String, storeId: String): Unit
```

**Function:** Deletes the specified distributed key-value database via the storeId value.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| appId | String | Yes | - | The package name of the database caller. |
| storeId | String | Yes | - | The unique identifier of the database to be deleted, with a length not exceeding [MAX_STORE_ID_LENGTH](#let-max_store_id_length). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 15100004 | Not found. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, see usage instructions in this document
kvManager.deleteKVStore("com.example.myapplication", "myStore")
```

### func getAllKVStoreId(String)

```cangjie
public func getAllKVStoreId(appId: String): Array<String>
```

**Function:** Obtains all storeIds of distributed key-value databases created via [getSingleKVStore](#func-getsinglekvstorestring-kvoptions) or [getDeviceKVStore](#func-getdevicekvstorestring-kvoptions) methods and not deleted via [deleteKVStore](#func-deletekvstorestring-string).

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| appId | String | Yes | - | The package name of the database caller. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns all created distributed key-value database storeIds. |

**Example:**

<!-- compile -->

```cangjie
// index.cj
import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, refer to usage instructions in this document
kvManager.getAllKVStoreId("com.example.myapplication")
```

### func getDeviceKVStore(String, KVOptions)

```cangjie
public func getDeviceKVStore(storeId: String, options: KVOptions): DeviceKVStore
```

**Function:** Creates and retrieves a distributed key-value database by specifying Options and storeId.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| storeId | String | Yes | - | Unique identifier for the database, length not exceeding [MAX_STORE_ID_LENGTH](#let-max_store_id_length). |
| options | [KVOptions](#class-kvoptions) | Yes | - | Configuration information for creating a distributed key-value instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DeviceKVStore](#class-devicekvstore) | DeviceKVStore object. A multi-device collaborative database where data is managed per device without conflicts, supporting data queries. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 15100002 | Open existed database with changed options. |
  | 15100003 | Database corrupted. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, refer to usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let kvStore = kvManager.getDeviceKVStore("myStoreId", opt)
```

### func getSingleKVStore(String, KVOptions)

```cangjie
public func getSingleKVStore(storeId: String, options: KVOptions): SingleKVStore
```

**Function:** Creates and retrieves a distributed key-value database by specifying Options and storeId.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| storeId | String | Yes | - | Unique identifier for the database, length not exceeding [MAX_STORE_ID_LENGTH](#let-max_store_id_length). |
| options | [KVOptions](#class-kvoptions) | Yes | - | Configuration information for creating a distributed key-value instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| [SingleKVStore](#class-singlekvstore) | SingleKVStore object. A single-version distributed key-value database that does not distinguish data by device, providing methods for querying and synchronizing data. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 15100002 | Open existed database with changed options. |
  | 15100003 | Database corrupted. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "com.example.myapplication")) // Context application context required, refer to usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let kvStore = kvManager.getSingleKVStore("myStoreId", opt)
```

## class KVOptions

```cangjie
public class KVOptions {
    public init(securityLevel: SecurityLevel, createIfMissing!: Bool = true, encrypt!: Bool = false,
        backup!: Bool = true, autoSync!: Bool = false, schema!: Schema = Schema())
}
```

**Function:** Provides configuration information for creating a database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

### init(SecurityLevel, Bool, Bool, Bool, Bool, Schema)

```cangjie
public init(securityLevel: SecurityLevel, createIfMissing!: Bool = true, encrypt!: Bool = false,
    backup!: Bool = true, autoSync!: Bool = false, schema!: Schema = Schema())
```

**Function:** Constructor for creating a KVOptions instance.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| securityLevel | [SecurityLevel](cj-apis-relational_store.md#enum-relationalstoresecuritylevel) | Yes | - | Sets the database security level.<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core |
| createIfMissing | Bool | No | true | Whether to create the database if the file does not exist. Default is true (create).<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core |
| encrypt | Bool | No | false | Whether to encrypt the database file. Default is false (no encryption).<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core |
| backup | Bool | No | true | Whether to back up the database file. Default is true (backup).<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core |
| autoSync | Bool | No | false | Whether to automatically synchronize the database file. Default is false (manual sync).<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core<br>**Required Permission:** ohos.permission.DISTRIBUTED_DATASYNC |
| schema | [Schema](#struct-schema) | No | Schema() | Defines the values stored in the database. Default is undefined (no Schema).<br>**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore |

## class KVStoreResultSet

```cangjie
public class KVStoreResultSet {}
```

**Function:** Provides methods for obtaining database result sets, including queries and moving data read positions. The maximum number of open result sets is 8.

Before calling KVStoreResultSet methods, you must first build a SingleKVStore or DeviceKVStore instance via [getSingleKVStore](#func-getsinglekvstorestring-kvoptions) or [getDeviceKVStore](#func-getdevicekvstorestring-kvoptions).

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

### func getCount()

```cangjie
public func getCount(): Int32
```

**Function:** Gets the total number of rows in the result set.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the total number of rows. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, refer to usage instructions in this document
let store = kvManager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
store.put("key", KVValueType.STRING("value"))
var resultSet = store.getResultSet("key")
resultSet.getCount()
```

## class Query

```cangjie
public class Query {
    public init()
}
```

**Function:** Uses predicates to represent database queries, providing methods to create Query instances, query data in the database, and add predicates. The maximum number of predicates in a Query object is 256.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

### init()

```cangjie
public init()
```

**Function:** Constructor for creating a Query instance.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let query = Query()
```

## class SingleKVStore

```cangjie
public open class SingleKVStore {}
```

**Function:** SingleKVStore database instance, providing methods for adding data, deleting data, subscribing to data changes, and subscribing to data synchronization completion.

Before calling SingleKVStore methods, you must first build a SingleKVStore instance via [getSingleKVStore](#func-getsinglekvstorestring-kvoptions).

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

### func backup(String)

```cangjie
public open func backup(file: String): Unit
```

**Function:** Backs up the database with the specified name.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Specified name for backing up the database. Cannot be empty and length must not exceed [MAX_KEY_LENGTH](#let-max_key_length). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, refer to usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.backup("myBackupfile")
```

### func commit()

```cangjie
public open func commit(): Unit
```

**Function:** Commits the transaction in the SingleKVStore database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |15100004|Not found.|
  |15100005|Database or result set already closed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.commit()
```

### func delete(String)

```cangjie
public open func delete(key: String): Unit
```

**Function:** Deletes the data with the specified key from the database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|key|String|Yes|-|The key of the data to be deleted. Cannot be empty and length must not exceed [MAX_KEY_LENGTH](#let-max_key_length).|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |15100003|Database corrupted.|
  |15100005|Database or result set already closed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.delete("myKey")
```

### func deleteBatch(ArrayList\<String>)

```cangjie
public open func deleteBatch(keys: ArrayList<String>): Unit
```

**Function:** Batch deletes key-value pairs from the SingleKVStore database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|keys|ArrayList\<String>|Yes|-|Represents the key-value pairs to be batch deleted.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |15100003|Database corrupted.|
  |15100005|Database or result set already closed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
let entries = ArrayList<Entry>()
let keys = ArrayList<String>()
for (i in 0..10) {
    let key = "batch_test_string_key${i}"
    let entry = Entry(key, KVValueType.STRING("batch_test_string_value"))
    entries.add(entry)
    keys.add(key)
}
singleKVStore.putBatch(entries)
singleKVStore.deleteBatch(keys)
```

### func enableSync(Bool)

```cangjie
public open func enableSync(enabled: Bool): Unit
```

**Function:** Sets whether to enable synchronization.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|enabled|Bool|Yes|-|Sets whether to enable synchronization. `true` enables synchronization, `false` disables it.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.ArrayList

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
let key = "batch_test_string_key"
let entries = ArrayList<Entry>()
for (i in 0..10) {
    entries.add(Entry("${key}${i}", KVValueType.STRING("batch_test_string_value")))
}
singleKVStore.putBatch(entries)
let query = Query().prefixKey("batch_test_string_key")
let result = singleKVStore.getEntries(query)
```

### func get(String)

```cangjie
public open func get(key: String): KVValueType
```

**Function:** Gets the value of the specified key.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|key|String|Yes|-|The key of the data to be queried. Cannot be empty and length must not exceed [MAX_KEY_LENGTH](#let-max_key_length).|

**Return Value:**

|Type|Description|
|:----|:----|
|[KVValueType](#enum-kvvaluetype)|Returns the queried value.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |15100003|Database corrupted.|
  |15100004|Not found.|
  |15100005|Database or result set already closed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let kvManager = DistributedKVStore.createKVManager(KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let kvStore = kvManager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
try {
    let value = kvStore.get("myKey")
    match (value) {
        case STRING(v) => AppLog.info("The obtained value is a String: ${v}")
        case INTEGER(v) => AppLog.info("The obtained value is a Int32: ${v}")
        case DOUBLE(v) => AppLog.info("The obtained value is a Float64: ${v}")
        case _ => AppLog.info("The obtained value is of another type.")
    }
} catch (e: BusinessException) {
    AppLog.info("get failed.")
}
```

### func put(String, KVValueType)

```cangjie
public open func put(key: String, value: KVValueType): Unit
```

**Function:** Adds a key-value pair of the specified type to the database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default|Description|
|:---|:---|:---|:---|:---|
|key|String|Yes|-|The key of the data to be added. Cannot be empty and length must not exceed [MAX_KEY_LENGTH](#let-max_key_length).|
|value|[KVValueType](#enum-kvvaluetype)|Yes|-|The value of the data to be added. Supports Array\<UInt8>, String, Int32, Bool, Float32, Float64. The length of Array\<UInt8> and String must not exceed [MAX_VALUE_LENGTH](#let-max_value_length).|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error.|
  |15100003|Database corrupted.|
  |15100005|Database or result set already closed.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions for details
let kvStore = kvManager.getDeviceKVStore("test", KVOptions(KVSecurityLevel.S1))
try {
    kvStore.put("myKey", KVValueType.STRING("myValue"))
} catch (e: BusinessException) {
    AppLog.info("put failed.")
}
```

### func putBatch(ArrayList\<Entry>)

```cangjie
public open func putBatch(entries: ArrayList<Entry>): Unit
```

**Function:** Batch inserts key-value pairs into a SingleKVStore database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| entries | ArrayList\<[Entry](#struct-entry)> | Yes | - | Represents the key-value pairs to be inserted in batch. The maximum data volume allowed in an entries object is 512MB. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100003 | Database corrupted. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
let entries = ArrayList<Entry>()
for (i in 0..10) {
    let entry = Entry("batch_test_string_key${i}", KVValueType.STRING("batch_test_string_value")
    )
    entries.add(entry)
}
singleKVStore.putBatch(entries)
```

### func restore(String)

```cangjie
public open func restore(file: String): Unit
```

**Function:** Restores the database from a specified database file.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| file | String | Yes | - | Specified database file name, which cannot be empty and its length must not exceed [MAX_KEY_LENGTH](#let-max_key_length). |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.restore("myBackupfile")
```

### func rollback()

```cangjie
public open func rollback(): Unit
```

**Function:** Rolls back a transaction in the SingleKVStore database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100004 | Not found. |
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.rollback()
```

### func setSyncParam(UInt32)

```cangjie
public open func setSyncParam(defaultAllowedDelayMs: UInt32): Unit
```

**Function:** Sets the default allowed delay for database synchronization.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| defaultAllowedDelayMs | UInt32 | Yes | - | Represents the default allowed delay for database synchronization, in milliseconds. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.setSyncParam(500)
```

### func startTransaction()

```cangjie
public open func startTransaction(): Unit
```

**Function:** Starts a transaction in the SingleKVStore database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Distributed Key-Value Database Error Codes](../../errorcodes/cj-errorcode-distributed_kv_store.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 15100005 | Database or result set already closed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let kvManager = DistributedKVStore.createKVManager(
    KVManagerConfig(Global.getStageContext(), "test_kvstore")) // Context application context required, see usage instructions in this document
let opt = KVOptions(
    KVSecurityLevel.S4,
    createIfMissing: true,
    encrypt: false,
    backup: true,
    autoSync: false,
)
let singleKVStore = kvManager.getSingleKVStore("myStoreId", opt)
singleKVStore.startTransaction()
```

## struct Entry

```cangjie
public struct Entry <: ToString {
    public var key: String
    public var value: KVValueType
    public init(key: String, value: KVValueType)
}
```

**Function:** Key-value pair stored in the database.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

**Parent Type:**

- ToString

### var key

```cangjie
public var key: String
```

**Function:** Key value.

**Type:** String

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

### var value

```cangjie
public var value: KVValueType
```

**Function:** Value object.

**Type:** [KVValueType](#enum-kvvaluetype)

**Read-Write Access:** Read-Write

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core

**Since:** 21

### init(String, KVValueType)

```cangjie
public init(key: String, value: KVValueType)
```

**Function:** Constructor used to create an Entry instance.

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core
**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| key | String | Yes | - | Key value. |  
| value | [KVValueType](#enum-kvvaluetype) | Yes | - | Value object. |  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Converts to string format.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| String | Returns the converted string. |  

## struct FieldNode  

```cangjie  
public struct FieldNode {  
    public var nullable: Bool = true  
    public var default: String  
    public var type_: Int32 = 0  
    public init(name: String)  
}  
```  

**Function:** Represents a node of a Schema instance, providing methods to define values stored in the database.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var default  

```cangjie  
public var default: String  
```  

**Function:** Represents the default value of the FieldNode.  

**Type:** String  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var nullable  

```cangjie  
public var nullable: Bool = true  
```  

**Function:** Indicates whether the database field can be null.  

**Type:** Bool  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var type_  

```cangjie  
public var type_: Int32 = 0  
```  

**Function:** Represents the value corresponding to the data type of the specified node.  

**Type:** Int32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### init(String)  

```cangjie  
public init(name: String)  
```  

**Function:** Creates a FieldNode instance with a value.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| name | String | Yes | - | Value of the FieldNode. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import kit.ArkData.*  

var fieldNode = FieldNode("root")  
fieldNode.nullable = false  
```  

## struct KVManagerConfig  

```cangjie  
public struct KVManagerConfig {  
    public init(context: StageContext, bundleName: String)  
}  
```  

**Function:** Provides configuration information for a KVManager instance, including the caller's bundle name and application context.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### init(StageContext, String)  

```cangjie  
public init(context: StageContext, bundleName: String)  
```  

**Function:** Constructor used to create a KVManagerConfig.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter | Type | Required | Default | Description |  
|:---|:---|:---|:---|:---|  
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application context. |  
| bundleName | String | Yes | - | Caller's bundle name. |  

## struct Schema  

```cangjie  
public struct Schema {  
    public var root: FieldNode = FieldNode("undefined")  
    public var indexes: Array<String>=[]  
    public var mode: Int32 = 0  
    public var skip: Int32 = 0  
}  
```  

**Function:** Represents a database schema. Schema objects can be created and placed in [KVOptions](#class-kvoptions) when creating or opening a database.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var indexes  

```cangjie  
public var indexes: Array<String>=[]  
```  

**Function:** Represents an array of JSON-type strings.  

**Type:** Array\<String>  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var mode  

```cangjie  
public var mode: Int32 = 0  
```  

**Function:** Represents the mode of the Schema.  

**Type:** Int32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var root  

```cangjie  
public var root: FieldNode = FieldNode("undefined")  
```  

**Function:** Represents the root object of JSON.  

**Type:** [FieldNode](#struct-fieldnode)  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

### var skip  

```cangjie  
public var skip: Int32 = 0  
```  

**Function:** Skip size of the Schema.  

**Type:** Int32  

**Read-Write Capability:** Read-Write  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.DistributedKVStore  

**Initial Version:** 21  

## enum KVSecurityLevel  

```cangjie  
public enum KVSecurityLevel {  
    | S1  
    | S2  
    | S3  
    | S4  
    | ...  
}  
```  

**Function:** Enumeration of database security levels.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### S1  

```cangjie  
S1  
```  

**Function:** Indicates a low-level security level for the database. Data leakage, tampering, destruction, or loss may cause limited adverse effects on individuals or organizations. Examples include gender, nationality, user application records, etc.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### S2  

```cangjie  
S2  
```  

**Function:** Indicates a medium-level security level for the database. Data leakage, tampering, destruction, or loss may cause serious adverse effects on individuals or organizations. Examples include detailed personal communication addresses, nicknames, etc.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### S3  

```cangjie  
S3  
```  

**Function:** Indicates a high-level security level for the database. Data leakage, tampering, destruction, or loss may cause severe adverse effects on individuals or organizations. Examples include real-time precise location information, movement trajectories, etc.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### S4  

```cangjie  
S4  
```  

**Function:** Indicates a critical-level security level for the database, as defined by industry laws and regulations for special data types involving the most private information of individuals. Leakage, tampering, destruction, or loss may cause significant adverse effects on individuals or organizations. Examples include political views, religion, philosophical beliefs, union membership, genetic data, biometric information, health and sexual life status, sexual orientation, device authentication credentials, personal credit card or other financial information.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core**Initial Version:** 21  

## enum KVValueType  

```cangjie  
public enum KVValueType <: ToString {  
    | STRING(String)  
    | INTEGER(Int32)  
    | FLOAT(Float32)  
    | BYTE_ARRAY(Array<Byte>)  
    | BOOLEAN(Bool)  
    | DOUBLE(Float64)  
}  
```  

**Function:** Data type enumeration.  
**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

**Parent Type:**  

- ToString  

### BOOLEAN(Bool)  

```cangjie  
BOOLEAN(Bool)  
```  

**Function:** Represents a boolean value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### BYTE_ARRAY(Array\<Byte>)  

```cangjie  
BYTE_ARRAY(Array<Byte>)  
```  

**Function:** Represents a byte array value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### DOUBLE(Float64)  

```cangjie  
DOUBLE(Float64)  
```  

**Function:** Represents a Float64 floating-point value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### FLOAT(Float32)  

```cangjie  
FLOAT(Float32)  
```  

**Function:** Represents a Float32 floating-point value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### INTEGER(Int32)  

```cangjie  
INTEGER(Int32)  
```  

**Function:** Represents an Int32 integer value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### STRING(String)  

```cangjie  
STRING(String)  
```  

**Function:** Represents a string value type.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

### func toString()  

```cangjie  
public func toString(): String  
```  

**Function:** Converts to string format.  

**System Capability:** SystemCapability.DistributedDataManager.KVStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type   | Description                     |  
|:-------|:--------------------------------|  
| String | Returns the converted string.  |