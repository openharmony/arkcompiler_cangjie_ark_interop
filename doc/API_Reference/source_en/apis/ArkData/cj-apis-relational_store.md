# ohos.relational_store (Relational Database)

A Relational Database (RDB) is a database that manages data based on the relational model. The relational database provides a complete set of mechanisms for managing local databases based on the SQLite component, offering a series of interfaces for operations such as insertion, deletion, modification, and query. It can also directly execute user-input SQL statements to meet complex scenario requirements. Worker threads are not supported.

Basic data types supported on the Cangjie side: Int64, Float64, String, binary data, Bool. To ensure successful data insertion and retrieval, it is recommended that a single piece of data does not exceed 2M. If the size exceeds this limit, insertion will succeed, but retrieval will fail.

This module provides the following common functionalities related to relational databases:

- [RdbPredicates](#class-rdbpredicates): Terms used in the database to represent the properties, characteristics of data entities, or relationships between data entities, primarily used to define database operation conditions.
- [RdbStore](#class-rdbstore): An interface that provides methods for managing relational databases (RDB).
- [ResultSet](#class-resultset): The result set returned after users call the relational database query interface.

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

For the above example project and configuration template, please refer to [Cangjie Example Code Description](../../cj-development-intro.md#仓颉示例代码说明).

## func deleteRdbStore(StageContext, String)

```cangjie
public func deleteRdbStore(context: StageContext, name: String): Unit
```

**Function:** Deletes the database using the specified database file configuration. After successful deletion, it is recommended to set the database object to None. When creating a database, if a custom path is configured in [StoreConfig](#class-storeconfig), calling this interface for deletion is invalid, and the [deleteRdbStore(StageContext, StoreConfig)](#func-deleterdbstorestagecontext-storeconfig) interface must be used for deletion.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | The application context. For how to obtain the context, see [getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext). |
| name | String | Yes | - | The database name. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :------------|
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000  | Inner error. |
  | 14800010  | Invalid database path. |
  | 14800011  | Database corrupted.  |
  | 14800017  | Config changed. |
  | 14800021  | SQLite: Generic error. |
  | 14800027  | SQLite: Attempt to write a readonly database. |
  | 14800028  | SQLite: Some kind of disk I/O error occurred. |
  | 14800029  | SQLite: The database is full. |
  | 14800030  | SQLite: Unable to open the database file. |
  | 14801001  | Only supported in stage mode.|
  | 14801002  | The data group id is not valid.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the Context application context; see usage instructions above.
deleteRdbStore(Global.getStageContext(), "RdbTest.db")
```

## func deleteRdbStore(StageContext, StoreConfig)

```cangjie
public func deleteRdbStore(context: StageContext, config: StoreConfig): Unit
```

**Function:** Deletes the database using the specified database file configuration. After successful deletion, it is recommended to set the database object to None. If the database file is in the public sandbox directory, this interface must be used for deletion. When multiple processes operate on the same database, it is recommended to send a database deletion notification to other processes to make them aware and handle it. When creating a database, if a custom path is configured in [StoreConfig](#class-storeconfig), this interface must be used for deletion.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | The application context. For how to obtain the context, see [getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext). |
| config | [StoreConfig](#class-storeconfig) | Yes | - | The database configuration related to this RDB store. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------|:----------|
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000  | Inner error. |
  | 14800010  | Invalid database path.|
  | 14801001  | Only supported in stage mode. |
  | 14801002  | The data group id is not valid. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the Context application context; see usage instructions above.
deleteRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1))
```

## func getRdbStore(StageContext, StoreConfig)

```cangjie
public func getRdbStore(context: StageContext, config: StoreConfig): RdbStore
```

**Function:** Obtains a related RdbStore to operate the relational database. Users can configure the parameters of the RdbStore according to their needs and then call the RdbStore interface to perform related data operations.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | The application context. For how to obtain the context, see [getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext). |
| config | [StoreConfig](#class-storeconfig) | Yes | - | The database configuration related to this RDB store. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbStore](#class-rdbstore) | Returns the RdbStore object. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800010 | Invalid database path. |
  | 14800011 | Database corrupted. |
  | 14801001 | Only supported in stage mode. |
  | 14801002 | The data group id is not valid. |
  | 14800017 | Config changed. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |

## class RdbPredicates

```cangjie
public class RdbPredicates {
    public init(name: String)
}
```

**Function:** Represents the predicates of a relational database (RDB). This class determines whether the value of a conditional expression in the RDB is true or false. This type is not thread-safe. If there are multiple threads in the application operating on instances derived from this class, ensure proper locking.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

### init(String)

```cangjie
public init(name: String)
```

**Function:** Constructor of the RdbPredicates class.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The database table name. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
```

### func `in`(String, Array\<RelationalStoreValueType>)

```cangjie
public func `in`(field: String, values: Array<RelationalStoreValueType>): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table where the values fall within the given range.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| values | Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | The values to match, specified as an array of RelationalStoreValueType. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

### func and()

```cangjie
public func and(): RdbPredicates
```

**Function:** Adds an AND condition to the predicate.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the Rdb predicate with the AND condition. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields where the "NAME" column value is "Lisa" and the "SALARY" column value is "200.5"
let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Lisa"))
    .and()
    .equalTo("SALARY", RelationalStoreValueType.double(200.5))
```
### func beginWrap()

```cangjie
public func beginWrap(): RdbPredicates
```

**Function:** Adds a left parenthesis to the predicate.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the Rdb predicate with a left parenthesis. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Lisa"))
    .beginWrap()
    .equalTo("AGE", RelationalStoreValueType.integer(18))
    .or()
    .equalTo("SALARY", RelationalStoreValueType.double(200.5))
    .endWrap()
```

### func beginsWith(String, String)

```cangjie
public func beginsWith(field: String, value: String): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table that start with the given value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | String | Yes | - | The value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields in the "NAME" column that start with "Li", such as "Lisa"
let predicates = RdbPredicates("EMPLOYEE")
predicates.beginsWith("NAME", "Li")
```

### func between(String, RelationalStoreValueType, RelationalStoreValueType)

```cangjie
public func between(field: String, lowValue: RelationalStoreValueType, highValue: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table where the value falls within the given range (inclusive of boundaries).

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| lowValue | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | The minimum value to match with the predicate. |
| highValue | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | The maximum value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches values in the "AGE" column that are greater than or equal to 10 and less than or equal to 50
let predicates = RdbPredicates("EMPLOYEE")
predicates.between("AGE", RelationalStoreValueType.integer(10), RelationalStoreValueType.integer(50))
```

### func contains(String, String)

```cangjie
public func contains(field: String, value: String): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table that contain the given value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | String | Yes | - | The value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields in the "NAME" column that contain "os", such as "Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.contains("NAME", "os")
```

### func distinct()

```cangjie
public func distinct(): RdbPredicates
```

**Function:** Configures the predicate to filter duplicate records and retain only one of them.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate that can be used to filter duplicate records. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Rose"))
    .distinct()
```

### func endWrap()

```cangjie
public func endWrap(): RdbPredicates
```

**Function:** Adds a right parenthesis to the predicate.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the Rdb predicate with a right parenthesis. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Lisa"))
    .beginWrap()
    .equalTo("AGE", RelationalStoreValueType.integer(18))
    .or()
    .equalTo("SALARY", RelationalStoreValueType.double(200.5))
    .endWrap()
```

### func endsWith(String, String)

```cangjie
public func endsWith(field: String, value: String): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table that end with the given value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | String | Yes | - | The value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields in the "NAME" column that end with "se", such as "Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.endsWith("NAME", "se")
```

### func equalTo(String, RelationalStoreValueType)

```cangjie
public func equalTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures the predicate to match fields in the specified column of the data table where the value equals the given value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | The value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields in the "NAME" column where the value is "Lisa"
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("Lisa"))
```

### func glob(String, String)

```cangjie
public func glob(field: String, value: String): RdbPredicates
```

**Description:** Configures a predicate to match the specified field where the data field equals the given value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| field     | String | Yes      | -       | The column name in the database table. |
| value     | String | Yes      | -       | Specifies the value to match with the predicate.<br>Wildcards are supported, where `*` represents zero, one, or multiple digits or characters, and `?` represents a single digit or character. |

**Return Value:**

| Type                | Description |
|:--------------------|:------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches fields in the "NAME" column of the data table where the type is string and the value matches "?h*g"
let predicates = RdbPredicates("EMPLOYEE")
predicates.glob("NAME", "?h*g")
```

### func greaterThan(String, RelationalStoreValueType)

```cangjie
public func greaterThan(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is greater than `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | Indicates the value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches values in the "AGE" column of the data table that are greater than 18
let predicates = RdbPredicates("EMPLOYEE")
predicates.greaterThan("AGE", RelationalStoreValueType.integer(18))
```

### func greaterThanOrEqualTo(String, RelationalStoreValueType)

```cangjie
public func greaterThanOrEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is greater than or equal to `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | Indicates the value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches values in the "AGE" column of the data table that are greater than or equal to 18
let predicates = RdbPredicates("EMPLOYEE")
predicates.greaterThanOrEqualTo("AGE", RelationalStoreValueType.integer(18))
```

### func groupBy(Array\<String>)

```cangjie
public func groupBy(fields: Array<String>): RdbPredicates
```

**Function:** Configures a predicate to group query results by specified columns.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| fields | Array\<String> | Yes | - | Specifies the column names for grouping. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate for grouping query columns. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.groupBy(["AGE", "NAME"])
```

### func inAllDevices()

```cangjie
public func inAllDevices(): RdbPredicates
```

**Function:** Connects to all remote devices in the network when synchronizing distributed databases.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.inAllDevices()
```

### func isNotNull(String)

```cangjie
public func isNotNull(field: String): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is not null.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.isNotNull("NAME")
```

### func isNull(String)

```cangjie
public func isNull(field: String): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is null.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.isNull("NAME")
```

### func lessThan(String, RelationalStoreValueType)

```cangjie
public func lessThan(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is less than `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | Indicates the value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns a predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Matches values in the "AGE" column of the data table that are less than 20
let predicates = RdbPredicates("EMPLOYEE")
predicates.lessThan("AGE", RelationalStoreValueType.integer(20))
```

### func lessThanOrEqualTo(String, RelationalStoreValueType)

```cangjie
public func lessThanOrEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures a predicate to match fields in the data table's column `field` where the value is less than or equal to `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | The column name in the database table. |
| value | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes | - | Indicates the value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|Returns the predicate matching the specified field.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match values in the "AGE" column of the data table that are less than or equal to 20
let predicates = RdbPredicates("EMPLOYEE")
predicates.lessThanOrEqualTo("AGE", RelationalStoreValueType.integer(20))
```

### func like(String, String)

```cangjie
public func like(field: String, value: String): RdbPredicates
```

**Function:** Configures the predicate to match fields in the `field` column of the data table where the value is similar to `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description                     |
|:----------|:-------|:---------|:--------|:--------------------------------|
| field     | String | Yes      | -       | The column name in the database table. |
| value     | String | Yes      | -       | The value to match with the predicate. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match fields in the "NAME" column of the data table where the value is similar to "os", such as "Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.like("NAME", "%os%")
```

### func limitAs(Int32)

```cangjie
public func limitAs(value: Int32): RdbPredicates
```

**Function:** Sets the predicate for the maximum number of data records.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description                     |
|:----------|:------|:---------|:--------|:--------------------------------|
| value     | Int32 | Yes      | -       | The maximum number of data records. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate that can be used to set the maximum number of data records. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Rose"))
    .limitAs(3)
```

### func notBetween(String, RelationalStoreValueType, RelationalStoreValueType)

```cangjie
public func notBetween(field: String, lowValue: RelationalStoreValueType, highValue: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures the predicate to match fields in the `field` column of the data table where the value is outside the given range (excluding the range boundaries).

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type                               | Required | Default | Description                     |
|:----------|:-----------------------------------|:---------|:--------|:--------------------------------|
| field     | String                             | Yes      | -       | The column name in the database table. |
| lowValue  | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes      | -       | The minimum value to match with the predicate. |
| highValue | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes      | -       | The maximum value to match with the predicate. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match values in the "AGE" column of the data table that are less than 10 or greater than 50
let predicates = RdbPredicates("EMPLOYEE")
predicates.notBetween("AGE", RelationalStoreValueType.integer(10), RelationalStoreValueType.integer(50))
```

### func notEqualTo(String, RelationalStoreValueType)

```cangjie
public func notEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**Function:** Configures the predicate to match fields in the `field` column of the data table where the value is not equal to `value`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type                               | Required | Default | Description                     |
|:----------|:-----------------------------------|:---------|:--------|:--------------------------------|
| field     | String                             | Yes      | -       | The column name in the database table. |
| value     | [RelationalStoreValueType](#enum-relationalstorevaluetype) | Yes      | -       | The value to match with the predicate. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match fields in the "NAME" column of the data table where the value is not "Lisa"
let predicates = RdbPredicates("EMPLOYEE")
predicates.notEqualTo("NAME", RelationalStoreValueType.string("Lisa"))
```

### func notIn(String, Array\<RelationalStoreValueType>)

```cangjie
public func notIn(field: String, values: Array<RelationalStoreValueType>): RdbPredicates
```

**Function:** Configures the predicate to match fields in the `field` column of the data table where the value is not in the specified range of `ValueType`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type                                      | Required | Default | Description                     |
|:----------|:------------------------------------------|:---------|:--------|:--------------------------------|
| field     | String                                    | Yes      | -       | The column name in the database table. |
| values    | Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes      | -       | The values to match with the predicate, specified as an array of `ValueType`. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match values in the "NAME" column of the data table that are not in ["Lisa", "Rose"]
let predicates = RdbPredicates("EMPLOYEE")
predicates.notIn("NAME", [RelationalStoreValueType.string("Lisa"), RelationalStoreValueType.string("Rose")])
```

### func offsetAs(Int32)

```cangjie
public func offsetAs(rowOffset: Int32): RdbPredicates
```

**Function:** Configures the predicate to specify the starting position of the returned results. This method must be used with [limitAs](#func-limitasint32).

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description                     |
|:----------|:------|:---------|:--------|:--------------------------------|
| rowOffset | Int32 | Yes      | -       | The starting position of the returned results, which must be a positive integer. |

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate with the specified starting position for the returned results. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Rose"))
    .offsetAs(3)
```

### func or()

```cangjie
public func or(): RdbPredicates
```

**Function:** Adds an OR condition to the predicate.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type                     | Description                          |
|:-------------------------|:-------------------------------------|
| [RdbPredicates](#class-rdbpredicates) | Returns the RDB predicate with the OR condition. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// Match fields in the "NAME" column of the data table where the value is "Lisa" OR "Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates
    .equalTo("NAME", RelationalStoreValueType.string("Lisa"))
    .or()
    .equalTo("NAME", RelationalStoreValueType.string("Rose"))
```

### func orderByAsc(String)

```cangjie
public func orderByAsc(field: String): RdbPredicates
```

**Function:** Configures the predicate to match columns in the `field` column of the data table sorted in ascending order.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**
| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.orderByAsc("NAME")
```

### func orderByDesc(String)

```cangjie
public func orderByDesc(field: String): RdbPredicates
```

**Function:** Configures the predicate to match the column values in the data table sorted in descending order by the specified field.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |

**Return Value:**

| Type | Description |
|:----|:----|
| [RdbPredicates](#class-rdbpredicates) | Returns the predicate matching the specified field. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
predicates.orderByDesc("AGE")
```

## class RdbStore

```cangjie
public class RdbStore {}
```

**Function:** Provides an interface for managing relational database (RDB) methods.

Before using the following related interfaces, initialize the database table structure and related data using the [executeSql](#func-executesqlstring) interface.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### func backup(String)

```cangjie
public func backup(destName: String): Unit
```

**Function:** Backs up the database with the specified name.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| destName | String | Yes | - | Specifies the backup file name of the database. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. The store must not be nullptr. |
  | 14800000 | Inner error. |
  | 14800010 | Invalid database path. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
rdbStore.backup("dbBackup.db")
```

### func batchInsert(String, Array\<Map\<String, RelationalStoreValueType>>)

```cangjie
public func batchInsert(table: String, values: Array<Map<String, RelationalStoreValueType>>): Int64
```

**Function:** Inserts a set of data into the target table.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| table | String | Yes | - | Specifies the target table name. |
| values | Array\<Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>> | Yes | - | Represents the set of data to be inserted into the table. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | If the operation is successful, returns the number of inserted data; otherwise, returns -1. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |
  | 14800047 | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap
import ohos.relational_store.ValueType as RValueType

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
var values1 = HashMap<String, RelationalStoreValueType>()
values1.add("ID", RelationalStoreValueType.integer(1))
values1.add("NAME", RelationalStoreValueType.string("Lisa"))
values1.add("AGE", RelationalStoreValueType.integer(18))
values1.add("SALARY", RelationalStoreValueType.double(100.5))
var values2 = HashMap<String, RelationalStoreValueType>()
values2.add("ID", RelationalStoreValueType.integer(2))
values2.add("NAME", RelationalStoreValueType.string("Jack"))
values2.add("AGE", RelationalStoreValueType.integer(19))
values2.add("SALARY", RelationalStoreValueType.double(101.5))
var values3 = HashMap<String, RelationalStoreValueType>()
values3.add("ID", RelationalStoreValueType.integer(3))
values3.add("NAME", RelationalStoreValueType.string("Tom"))
values3.add("AGE", RelationalStoreValueType.integer(20))
values3.add("SALARY", RelationalStoreValueType.double(102.5))
let valueBuckets: Array<Map<String, RValueType>>= [values1, values2, values3]
rdbStore.batchInsert("EMPLOYEE", valueBuckets)
```

### func beginTransaction()

```cangjie
public func beginTransaction(): Unit
```

**Function:** Starts a transaction before executing SQL statements. This interface does not support multi-process or multi-thread usage.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. The store must not be nullptr. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |
  | 14800047 | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
var values = HashMap<String, RelationalStoreValueType>()
rdbStore.beginTransaction()
values.add("ID", RelationalStoreValueType.integer(2))
values.add("NAME", RelationalStoreValueType.string("Sun"))
rdbStore.insert("THING", values)
rdbStore.commit()
```

### func commit()

```cangjie
public func commit(): Unit
```

**Function:** Commits the executed SQL statements. This interface does not support multi-process or multi-thread usage.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. The store must not be nullptr. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the application Context, refer to usage instructions in this document
rdbStore.executeSql("CREATE TABLE THING(ID int NOT NULL, NAME varchar(255) NOT NULL, PRIMARY KEY (Id))")
rdbStore.beginTransaction()
var values = HashMap<String, RelationalStoreValueType>()
values.add("ID", RelationalStoreValueType.integer(2))
values.add("NAME", RelationalStoreValueType.string("Sun"))
rdbStore.insert("THING", values)
rdbStore.commit()
```

### func delete(RdbPredicates)

```cangjie
public func delete(predicates: RdbPredicates): Int64
```

**Function:** Deletes data from the database based on the specified RdbPredicates conditions.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| predicates | [RdbPredicates](#class-rdbpredicates) | Yes | - | The RdbPredicates instance object specifying the deletion conditions. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The number of affected rows. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |
  | 14800047 | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the application Context, refer to usage instructions in this document
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("Lisa"))
rdbStore.delete(predicates)
```

### func emit(String)

```cangjie
public func emit(event: String): Unit
```

**Function:** Notifies inter-process or intra-process listeners registered via [on](#func-onstring-bool-callback0argument).

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | The name of the subscribed event to notify. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801 | Capability not supported. |
  | 14800000 | Inner error. |
  | 14800014 | Already closed. |
  | 14800050 | Failed to obtain subscription service. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// This code can be added to dependency definitions
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the application Context, refer to usage instructions in this document
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.emit("PRINT")
```

### func executeSql(String)

```cangjie
public func executeSql(sql: String): Unit
```

**Function:** Provides an interface for managing relational database (RDB) methods. Before using the following related interfaces, use [executeSql](#func-executesqlstring) to initialize the database table structure and related data.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| sql | String | Yes | - | Sets and gets the database version, which must be an integer greater than or equal to 0. |

### func executeSql(String, Array\<RelationalStoreValueType>)

```cangjie
public func executeSql(sql: String, bindArgs: Array<RelationalStoreValueType>): Unit
```

**Function:** Executes an SQL statement with specified parameters but does not return a value.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| sql | String | Yes | - | Specifies the SQL statement to execute. |
| bindArgs | Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | The values of the parameters in the SQL statement. These values correspond to the placeholders in the sql parameter statement. If the sql parameter statement is complete, this parameter is not required. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :------------------------------------------------------------ |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801       | Capability not supported the sql(attach, begin, commit, rollback etc.). |
  | 14800000  | Inner error. |
  | 14800011  | Database corrupted. |
  | 14800014  | Already closed. |
  | 14800015  | The database does not respond. |
  | 14800021  | SQLite: Generic error. |
  | 14800022  | SQLite: Callback routine requested an abort. |
  | 14800023  | SQLite: Access permission denied. |
  | 14800024  | SQLite: The database file is locked. |
  | 14800025  | SQLite: A table in the database is locked. |
  | 14800026  | SQLite: The database is out of memory. |
  | 14800027  | SQLite: Attempt to write a readonly database. |
  | 14800028  | SQLite: Some kind of disk I/O error occurred. |
  | 14800029  | SQLite: The database is full. |
  | 14800030  | SQLite: Unable to open the database file. |
  | 14800031  | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032  | SQLite: Abort due to constraint violation. |
  | 14800033  | SQLite: Data type mismatch. |
  | 14800034  | SQLite: Library used incorrectly. |
  | 14800047  | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the application Context, refer to usage instructions in this document
rdbStore.executeSql("DELETE FROM EMPLOYEE WHERE ID = ?", [RelationalStoreValueType.integer(3)])
```

### func insert(String, Map\<String, RelationalStoreValueType>)

```cangjie
public func insert(table: String, values: Map<String, RelationalStoreValueType>): Int64
```

**Function:** Inserts a row of data into the target table.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| table | String | Yes | - | The name of the target table. |
| values | Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | Represents the row of data to be inserted into the table. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | If the operation is successful, returns the row ID; otherwise, returns -1. |

**Exceptions:**

- BusinessException: For detailed error code descriptions, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :------------------------------------------------------------ |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000  | Inner error. |
  | 14800011  | Database corrupted. |
  | 14800014  | Already closed. |
  | 14800015  | The database does not respond. |
  | 14800021  | SQLite: Generic error. |
  | 14800022  | SQLite: Callback routine requested an abort. |
  | 14800023  | SQLite: Access permission denied. |
  | 14800024  | SQLite: The database file is locked. |
  | 14800025  | SQLite: A table in the database is locked. |
  | 14800026  | SQLite: The database is out of memory. |
  | 14800027  | SQLite: Attempt to write a readonly database. |
  | 14800028  | SQLite: Some kind of disk I/O error occurred. |
  | 14800029  | SQLite: The database is full. |
  | 14800030  | SQLite: Unable to open the database file. |
  | 14800031  | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032  | SQLite: Abort due to constraint violation. |
  | 14800033  | SQLite: Data type mismatch. |
  | 14800034  | SQLite: Library used incorrectly. |
  | 14800047  | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Requires obtaining the application Context, refer to usage instructions in this document
rdbStore.executeSql(
    "CREATE TABLE EMPLOYEE(ID int NOT NULL, NAME varchar(255) NOT NULL, AGE int, SALARY float NOT NULL, CODES Bit NOT NULL, PRIMARY KEY (Id))"
)
var values = HashMap<String, RelationalStoreValueType>()
values.add("ID", RelationalStoreValueType.integer(1))
values.add("NAME", RelationalStoreValueType.string("Lisa"))
values.add("AGE", RelationalStoreValueType.integer(18))
values.add("SALARY", RelationalStoreValueType.double(100.5))
values.add("CODES", RelationalStoreValueType.boolean(true))
rdbStore.insert("EMPLOYEE", values)
```

### func insert(String, Map\<String, RelationalStoreValueType>, ConflictResolution)

```cangjie
public func insert(table: String, values: Map<String, RelationalStoreValueType>, conflict: ConflictResolution): Int64
```

**Function:** Inserts a row of data into the target table.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| table | String | Yes | - | Specified target table name. |
| values | Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | Represents the data row to be inserted into the table. |
| conflict | [ConflictResolution](#enum-conflictresolution) | Yes | - | Specifies the conflict resolution method. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Returns the row ID if the operation is successful; otherwise, returns -1. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :---------------------------------------------------- |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000  | Inner error. |
  | 14800011  | Database corrupted. |
  | 14800014  | Already closed. |
  | 14800015  | The database does not respond. |
  | 14800021  | SQLite: Generic error. |
  | 14800022  | SQLite: Callback routine requested an abort. |
  | 14800023  | SQLite: Access permission denied. |
  | 14800024  | SQLite: The database file is locked. |
  | 14800025  | SQLite: A table in the database is locked. |
  | 14800026  | SQLite: The database is out of memory. |
  | 14800027  | SQLite: Attempt to write a readonly database. |
  | 14800028  | SQLite: Some kind of disk I/O error occurred. |
  | 14800029  | SQLite: The database is full. |
  | 14800030  | SQLite: Unable to open the database file. |
  | 14800031  | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032  | SQLite: Abort due to constraint violation. |
  | 14800033  | SQLite: Data type mismatch. |
  | 14800034  | SQLite: Library used incorrectly. |
  | 14800047  | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
rdbStore.executeSql(
    "CREATE TABLE EMPLOYEE(ID int NOT NULL, NAME varchar(255) NOT NULL, AGE int, SALARY float NOT NULL, CODES Bit NOT NULL, PRIMARY KEY (Id))"
)
var values = HashMap<String, RelationalStoreValueType>()
values.add("ID", RelationalStoreValueType.integer(1))
values.add("NAME", RelationalStoreValueType.string("Lisa"))
values.add("AGE", RelationalStoreValueType.integer(18))
values.add("SALARY", RelationalStoreValueType.double(100.5))
values.add("CODES", RelationalStoreValueType.boolean(true))
rdbStore.insert("EMPLOYEE", values, ON_CONFLICT_REPLACE)
```

### func off(String, Bool)

```cangjie
public func off(event: String, interProcess: Bool): Unit
```

**Function:** Unregisters all listener callbacks for the specified event.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Name of the event to unsubscribe. |
| interProcess | Bool | Yes | - | Specifies whether to unsubscribe inter-process or intra-process. true: inter-process. false: intra-process. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  | :------------ | :-------------------------------------- |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801       | Capability not supported. |
  | 14800000     | Inner error.                           |
  | 14800014  | Already closed.    |
  | 14800050     | Failed to obtain subscription service. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// This code can be added to the dependency definition
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.off("PRINT", false)
```

### func off(String, Bool, Callback0Argument)

```cangjie
public func off(event: String, interProcess: Bool, callback: Callback0Argument): Unit
```

**Function:** Unregisters the listener callback for data change events.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Name of the event to unsubscribe. |
| interProcess | Bool | Yes | - | Specifies whether to unsubscribe inter-process or intra-process. true: inter-process. false: intra-process. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Specifies the callback object to unregister. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  | :------------ | :-------------------------------------- |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801       | Capability not supported. |
  | 14800000     | Inner error.                           |
  | 14800014  | Already closed.    |
  | 14800050     | Failed to obtain subscription service. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// This code can be added to the dependency definition
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.off("PRINT", false, testCallback)
```

### func on(String, Bool, Callback0Argument)

```cangjie
public func on(event: String, interProcess: Bool, callback: Callback0Argument): Unit
```

**Function:** Registers an intra-process or inter-process event listener for the database. The callback will be invoked when the [emit](#func-emitstring) interface is called.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Name of the event to subscribe. |
| interProcess | Bool | Yes | - | Specifies whether to subscribe inter-process or intra-process.<br/> true: inter-process.<br/> false: intra-process. |
| callback | [Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument) | Yes | - | Callback function object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801 | Capability not supported. |
  | 14800000 | Inner error. |
  | 14800014 | Already closed. |
  | 14800050 | Failed to obtain subscription service. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// This code can be added to the dependency definition
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
```

### func query(RdbPredicates, Array\<String>)

```cangjie
public func query(predicates: RdbPredicates, columns: Array<String>): ResultSet
```

**Function:** Queries data in the database based on specified conditions.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| predicates | [RdbPredicates](#class-rdbpredicates) | Yes | - | Query conditions specified by the RdbPredicates instance object. |
| columns | Array\<String> | Yes | - | Represents the columns to query. If empty, the query applies to all columns. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ResultSet](#class-resultset) | ResultSet object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("Rose"))
let columns = ["ID", "NAME", "AGE", "SALARY", "CODES"]
let resultSet = rdbStore.query(predicates, columns)
resultSet.goToNextRow()
let id = resultSet.getLong(resultSet.getColumnIndex("ID"))
let name = resultSet.getString(resultSet.getColumnIndex("NAME"))
let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))
let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))
```

### func querySql(String, Array\<RelationalStoreValueType>)

```cangjie
public func querySql(sql: String, bindArgs!: Array<RelationalStoreValueType> = Array<RelationalStoreValueType>()): ResultSet
```

**Description:** Queries data in the database based on the specified SQL statement.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| sql | String | Yes | - | Specifies the SQL statement to execute. |
| bindArgs | Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)> | No | Array\< RelationalStoreValueType>() | **Named parameter.** Values of parameters in the SQL statement, corresponding to placeholders in the SQL statement. Omit when the SQL statement is complete. |

**Return Value:**

| Type | Description |
|:----|:----|
| [ResultSet](#class-resultset) | Returns a ResultSet object if the operation succeeds. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToNextRow()
let id = resultSet.getLong(resultSet.getColumnIndex("ID"))
let name = resultSet.getString(resultSet.getColumnIndex("NAME"))
let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))
let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))
```

### func restore(String)

```cangjie
public func restore(srcName: String): Unit
```

**Description:** Restores the database from a specified backup file.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| srcName | String | Yes | - | Specifies the database backup filename. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions
rdbStore.restore("dbBackup.db")
```

### func rollBack()

```cangjie
public func rollBack(): Unit
```

**Description:** Rolls back executed SQL statements. This interface does not support multi-process or multi-thread usage.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. The store must not be nullptr. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions
let predicates = RdbPredicates("THING")
var values = HashMap<String, RelationalStoreValueType>()
try {
    rdbStore.beginTransaction()
    values.add("ID", RelationalStoreValueType.integer(3))
    values.add("NAME", RelationalStoreValueType.string("Tom"))
    rdbStore.insert("THING", values)
    values.add("ID", RelationalStoreValueType.integer(4))
    values.add("NAME", RelationalStoreValueType.string("Wind"))
    rdbStore.insert("THING", values)
    rdbStore.commit()
} catch (e: Exception) {
    rdbStore.rollBack()
}
```

### func update(Map\<String, RelationalStoreValueType>, RdbPredicates)

```cangjie
public func update(values: Map<String, RelationalStoreValueType>, predicates: RdbPredicates): Int64
```

**Description:** Updates data in the database based on the specified RdbPredicates instance.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| values | Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | Key-value pairs representing data rows to update, associated with column names. |
| predicates | [RdbPredicates](#class-rdbpredicates) | Yes | - | Specifies update conditions via RdbPredicates instance. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Returns the number of affected rows. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :------------------------------------------------------------ |
  | 202 | Permission verification failed, application which is not a system application uses system API. |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |
  | 14800047 | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("TOM"))
var values = HashMap<String, RelationalStoreValueType>()
values.add("NAME", RelationalStoreValueType.string("TOM"))
values.add("AGE", RelationalStoreValueType.integer(88))
values.add("SALARY", RelationalStoreValueType.double(9999.513))
rdbStore.update(values, predicates)
```

### func update(Map\<String, RelationalStoreValueType>, RdbPredicates, ConflictResolution)

```cangjie
public func update(values: Map<String, RelationalStoreValueType>, predicates: RdbPredicates, conflict: ConflictResolution): Int64
```

**Description:** Updates data in the database based on the specified RdbPredicates instance with conflict resolution.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Mandatory | Default | Description |
|:---|:---|:---|:---|:---|
| values | Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)> | Yes | - | Key-value pairs representing data rows to update, associated with column names. |
| predicates | [RdbPredicates](#class-rdbpredicates) | Yes | - | Specifies update conditions via RdbPredicates instance. |
| conflict | [ConflictResolution](#enum-conflictresolution) | Yes | - | Specifies conflict resolution strategy. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | Returns the number of affected rows. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:-----------| :------------------------------------------------------------ |
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800014 | Already closed. |
  | 14800015 | The database does not respond. |
  | 14800022  | SQLite: Callback routine requested an abort. |
  | 14800023  | SQLite: Access permission denied. |
  | 14800024  | SQLite: The database file is locked. |
  | 14800025  | SQLite: A table in the database is locked. |
  | 14800026  | SQLite: The database is out of memory. |
  | 14800027  | SQLite: Attempt to write a readonly database. |
  | 14800028  | SQLite: Some kind of disk I/O error occurred. |
  | 14800029  | SQLite: The database is full. |
  | 14800030  | SQLite: Unable to open the database file. |
  | 14800031  | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032  | SQLite: Abort due to constraint violation. |
  | 14800033  | SQLite: Data type mismatch. |
  | 14800034  | SQLite: Library used incorrectly. |
  | 14800047  | The WAL file size exceeds the default limit. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application Context required, refer to usage instructions
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("TOM"))
var values = HashMap<String, RelationalStoreValueType>()
values.add("NAME", RelationalStoreValueType.string("TOM"))
values.add("AGE", RelationalStoreValueType.integer(88))
values.add("SALARY", RelationalStoreValueType.double(9999.513))
rdbStore.update(values, predicates, ON_CONFLICT_REPLACE)
```

## class ResultSet

```cangjie
public class ResultSet {}
```

**Description:** Provides access methods for database result sets generated by queries. A result set refers to the collection of results returned after invoking relational database query interfaces, offering flexible data access methods to retrieve various data.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop columnCount

```cangjie
public prop columnCount: Int32
```

**Description:** Gets the number of columns in the result set.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop columnNames

```cangjie
public prop columnNames: Array<String>
```

**Description:** Gets the names of all columns in the result set.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop isAtFirstRow

```cangjie
public prop isAtFirstRow: Bool
```

**Description:** Checks whether the result set is positioned at the first row.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop isAtLastRow

```cangjie
public prop isAtLastRow: Bool
```

**Description:** Checks whether the result set is positioned at the last row.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop isClosed

```cangjie
public prop isClosed: Bool
```

**Description:** Checks whether the current result set is closed.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop isEnded

```cangjie
public prop isEnded: Bool
```

**Description:** Checks whether the result set is positioned after the last row.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop isStarted

```cangjie
public prop isStarted: Bool
```

**Description:** Checks whether the cursor has moved.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop rowCount

```cangjie
public prop rowCount: Int32
```

**Description:** Gets the number of rows in the result set.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### prop rowIndex

```cangjie
public prop rowIndex: Int32
```

**Description:** Gets the index of the current row in the result set.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### func close()

```cangjie
public func close(): Unit
```

**Description:** Closes the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |14800000|Inner error.|
  |14800012|Row out of bounds.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application Context required, refer to usage instructions
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.close()
```

### func getAsset(Int32)

```cangjie
public func getAsset(columnIndex: Int32): Asset
```

**Description:** Gets the value of the specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|Yes|-|Specified column index, starting from 0.|

**Return Value:**

|Type|Description|
|:----|:----|
|[Asset](#struct-asset)|Returns the value of the specified column as an Asset.|

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800012|Row out of bounds.|
  |14800013|Column out of bounds.|
  |14800014|Already closed.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application Context required, refer to usage instructions
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let doc = resultSet.getAsset(resultSet.getColumnIndex("DOC"))
```

### func getAssets(Int32)

```cangjie
public func getAssets(columnIndex: Int32): Array<Asset>
```
**Function:** Get the value of a specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnIndex | Int32 | Yes | - | The specified column index, starting from 0. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<[Asset](#struct-asset)> | Returns the value of the specified column as an Array\<[Asset](#struct-asset)>. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800013 | Column out of bounds. |
  | 14800014 | Already closed. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context needs to be obtained; see usage instructions for details.
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let docs = resultSet.getAssets(resultSet.getColumnIndex("DOCS"))
```

### func getBlob(Int32)

```cangjie
public func getBlob(columnIndex: Int32): Array<UInt8>
```

**Function:** Get the value of a specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnIndex | Int32 | Yes | - | The specified column index, starting from 0. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<UInt8> | Returns the value of the specified column as a byte array. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800013 | Column out of bounds. |
  | 14800014 | Already closed. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
     StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context needs to be obtained; see usage instructions for details.
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let codes = resultSet.getBlob(resultSet.getColumnIndex("CODES"))
```

### func getColumnIndex(String)

```cangjie
public func getColumnIndex(columnName: String): Int32
```

**Function:** Get the column index based on the specified column name.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnName | String | Yes | - | The name of the specified column in the result set. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int32 | Returns the index of the specified column. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800013 | Column out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context needs to be obtained; see usage instructions for details.
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let id = resultSet.getLong(resultSet.getColumnIndex("ID"))
let name = resultSet.getString(resultSet.getColumnIndex("NAME"))
let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))
let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))
```

### func getColumnName(Int32)

```cangjie
public func getColumnName(columnIndex: Int32): String
```

**Function:** Get the column name based on the specified column index.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnIndex | Int32 | Yes | - | The index of the specified column in the result set. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the name of the specified column. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800013 | Column out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context needs to be obtained; see usage instructions for details.
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let id = resultSet.getColumnName(0)
let name = resultSet.getColumnName(1)
let age = resultSet.getColumnName(2)
```

### func getDouble(Int32)

```cangjie
public func getDouble(columnIndex: Int32): Float64
```

**Function:** Get the value of a specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnIndex | Int32 | Yes | - | The specified column index, starting from 0. |

**Return Value:**

| Type | Description |
|:----|:----|
| Float64 | Returns the value of the specified column as a Float64. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application context needs to be obtained, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))
```

### func getLong(Int32)

```cangjie
public func getLong(columnIndex: Int32): Int64
```

**Function:** Gets the value of the specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|Yes|-|Specified column index, starting from 0.|

**Return Value:**

|Type|Description|
|:----|:----|
|Int64|Returns the value of the specified column as Int64.<br>This interface supports data range: Number.MIN_SAFE_INTEGER ~ Number.MAX_SAFE_INTEGER. If beyond this range, it is recommended to use [getDouble](#func-getdoubleint32).|

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800012|Row out of bounds.|
  |14800013|Column out of bounds.|
  |14800014|Already closed.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application context needs to be obtained, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))
```

### func getRow()

```cangjie
public func getRow(): Map<String, RelationalStoreValueType>
```

**Function:** Gets the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|Returns the values of the specified row.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800012|Row out of bounds.|
  |14800013|Column out of bounds.|
  |14800014|Already closed.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application context needs to be obtained, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let value = resultSet.getRow()
```

### func getString(Int32)

```cangjie
public func getString(columnIndex: Int32): String
```

**Function:** Gets the value of the specified column in the current row.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|Yes|-|Specified column index, starting from 0.|

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the value of the specified column as a string.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800012|Row out of bounds.|
  |14800013|Column out of bounds.|
  |14800014|Already closed.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application context needs to be obtained, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let name = resultSet.getString(resultSet.getColumnIndex("NAME"))
```

### func goTo(Int32)

```cangjie
public func goTo(offset: Int32): Bool
```

**Function:** Moves forward or backward to the specified row in the result set, relative to its current position.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

|Parameter|Type|Mandatory|Default Value|Description|
|:---|:---|:---|:---|:---|
|offset|Int32|Yes|-|Represents the offset relative to the current position.|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the result set is successfully moved; otherwise returns false.|

**Exceptions:**

- BusinessException: For detailed error code descriptions, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  |Error Code ID|Error Message|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800012|Row out of bounds.|
  |14800014|Already closed.|
  |14800019|The SQL must be a query statement.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800024|SQLite: The database file is locked.|
  |14800025|SQLite: A table in the database is locked.|
  |14800026|SQLite: The database is out of memory.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|
  |14800031|SQLite: TEXT or BLOB exceeds size limit.|
  |14800032|SQLite: Abort due to constraint violation.|
  |14800033|SQLite: Data type mismatch.|
  |14800034|SQLite: Library used incorrectly.|

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Application context needs to be obtained, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goTo(1)
```

### func goToFirstRow()

```cangjie
public func goToFirstRow(): Bool
```

**Function:** Moves to the first row of the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**| Type | Description |
|:----|:----|
| Bool | Returns `true` if the result set is successfully moved; otherwise returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToFirstRow()
```

### func goToLastRow()

```cangjie
public func goToLastRow(): Bool
```

**Description:** Moves to the last row of the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the result set is successfully moved; otherwise returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToLastRow()
```

### func goToNextRow()

```cangjie
public func goToNextRow(): Bool
```

**Description:** Moves to the next row of the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the result set is successfully moved; otherwise returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToNextRow()
```

### func goToPreviousRow()

```cangjie
public func goToPreviousRow(): Bool
```

**Description:** Moves to the previous row of the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the result set is successfully moved; otherwise returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToPreviousRow()
```

### func goToRow(Int32)

```cangjie
public func goToRow(position: Int32): Bool
```

**Description:** Moves to the specified row in the result set.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| position | Int32 | Yes | - | Specifies the target position to move to. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the result set is successfully moved; otherwise returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800014 | Already closed. |
  | 14800019 | The SQL must be a query statement. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions in this document
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToRow(5)
```

### func isColumnNull(Int32)

```cangjie
public func isColumnNull(columnIndex: Int32): Bool
```

**Description:** Checks whether the value of the specified column in the current row is null.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| columnIndex | Int32 | Yes | - | Specified column index, starting from 0. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns `true` if the value of the specified column in the current row is null; otherwise, returns `false`. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md) and [Relational Database Error Codes](../../errorcodes/cj-errorcode-data-rdb.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000 | Inner error. |
  | 14800011 | Database corrupted. |
  | 14800012 | Row out of bounds. |
  | 14800013 | Column out of bounds. |
  | 14800014 | Already closed. |
  | 14800021 | SQLite: Generic error. |
  | 14800022 | SQLite: Callback routine requested an abort. |
  | 14800023 | SQLite: Access permission denied. |
  | 14800024 | SQLite: The database file is locked. |
  | 14800025 | SQLite: A table in the database is locked. |
  | 14800026 | SQLite: The database is out of memory. |
  | 14800027 | SQLite: Attempt to write a readonly database. |
  | 14800028 | SQLite: Some kind of disk I/O error occurred. |
  | 14800029 | SQLite: The database is full. |
  | 14800030 | SQLite: Unable to open the database file. |
  | 14800031 | SQLite: TEXT or BLOB exceeds size limit. |
  | 14800032 | SQLite: Abort due to constraint violation. |
  | 14800033 | SQLite: Data type mismatch. |
  | 14800034 | SQLite: Library used incorrectly. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // Context application context required, see usage instructions for details
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let isColumnNull = resultSet.isColumnNull(resultSet.getColumnIndex("CODES"))
```

## class StoreConfig

```cangjie
public class StoreConfig {
    public let name: String
    public let securityLevel: RelationalStoreSecurityLevel
    public let encrypt: Bool
    public let dataGroupId: String
    public let customDir: String
    public let autoCleanDirtyData: Bool
    public init(name: String, securityLevel: RelationalStoreSecurityLevel, encrypt!: Bool = false, dataGroupId!: String = "", customDir!: String = "", autoCleanDirtyData!: Bool = true)
}
```

**Function:** Manages relational database configurations.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let autoCleanDirtyData

```cangjie
public let autoCleanDirtyData: Bool
```

**Function:** Specifies whether to automatically clean up data synchronized from the cloud after deletion. `true` means automatic cleanup, `false` means manual cleanup (default is automatic). For cloud-device collaborative databases, when data deleted from the cloud is synchronized to the device, this parameter determines whether the device automatically cleans it up. Manual cleanup can be performed via the `cleanDirtyData` interface.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### let customDir

```cangjie
public let customDir: String
```

**Function:** Custom directory path for the database.

> **Note:**
>
> The database will be created in the following directory structure: `context.databaseDir + "/rdb/" + customDir`, where `context.databaseDir` is the application sandbox path, `"/rdb/"` indicates a relational database, and `customDir` is the custom path. If this parameter is not provided, the `RdbStore` instance is created in the application sandbox directory by default.
> The database path size is limited to 128 bytes. Exceeding this limit will cause the database to fail to open, returning an error.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let dataGroupId

```cangjie
public let dataGroupId: String
```

**Function:** Application group ID, which must be obtained from the application market.

> **Note:**
>
> This property is only available in the Stage model. Specifies the sandbox path under this `dataGroupId` to create the `RdbStore` instance. If this parameter is not provided, the `RdbStore` instance is created in the application sandbox directory by default.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let encrypt

```cangjie
public let encrypt: Bool
```

**Function:** Specifies whether the database is encrypted (default is unencrypted). `true`: Encrypted. `false`: Unencrypted.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** Database file name.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let securityLevel

```cangjie
public let securityLevel: RelationalStoreSecurityLevel
```

**Function:** Sets the database security level.

**Type:** [RelationalStoreSecurityLevel](#enum-relationalstoresecuritylevel)

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### init(String, RelationalStoreSecurityLevel, Bool, String, String, Bool)

```cangjie
public init(name: String, securityLevel: RelationalStoreSecurityLevel, encrypt!: Bool = false, dataGroupId!: String = "", customDir!: String = "", autoCleanDirtyData!: Bool = true)
```

**Function:** Constructs a `StoreConfig`.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Database file name.<br/>**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core |
| securityLevel | [RelationalStoreSecurityLevel](#enum-securirelationalstoresecurityleveltylevel) | Yes | - | Sets the database security level.<br/>**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core |
| encrypt | Bool | No | false | **Named parameter.** Specifies whether the database is encrypted (default is unencrypted).<br/> `true`: Encrypted.<br/> `false`: Unencrypted.<br/>**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core |
| dataGroupId | String | No | "" | **Named parameter.** Application group ID, which must be obtained from the application market.<br/>**Model Constraint:** This property is only available in the Stage model.<br/>Specifies the sandbox path under this `dataGroupId` to create the `RdbStore` instance. If this parameter is not provided, the `RdbStore` instance is created in the application sandbox directory by default.<br/>**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core |
| customDir | String | No | "" | Custom directory path for the database.<br/>**Usage Constraint:** The database path size is limited to 128 bytes. Exceeding this limit will cause the database to fail to open, returning an error.<br/>The database will be created in the following directory structure: `context.databaseDir + "/rdb/" + customDir`, where `context.databaseDir` is the application sandbox path, `"/rdb/"` indicates a relational database, and `customDir` is the custom path. If this parameter is not provided, the `RdbStore` instance is created in the application sandbox directory by default.<br/>**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core |
| autoCleanDirtyData | Bool | No | true | **Named parameter.** Specifies whether to automatically clean up data synchronized from the cloud after deletion. `true` means automatic cleanup, `false` means manual cleanup (default is automatic).<br/>For cloud-device collaborative databases, when data deleted from the cloud is synchronized to the device, this parameter determines whether the device automatically cleans it up. Manual cleanup can be performed via the `cleanDirtyData` interface.<br/>**System Capability:** SystemCapability.DistributedDataManager.CloudSync.Client |

## struct Asset

```cangjie
public struct Asset {
    public let name: String
    public let uri: String
    public let path: String
    public let createTime: String
    public let modifyTime: String
    public let size: String
    public let status: AssetStatus
    public init(name: String, uri: String, path: String, createTime: String, modifyTime: String, size: String, status!: AssetStatus = AssetStatus.ASSET_NORMAL)
}
```

**Function:** Records information about asset attachments (files, images, videos, etc.). Asset-related interfaces currently do not support Datashare.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let createTime

```cangjie
public let createTime: String
```

**Function:** The time when the asset was created.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let modifyTime

```cangjie
public let modifyTime: String
```

**Function:** The last time the asset was modified.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** The name of the asset.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let path

```cangjie
public let path: String
```

**Function:** The path of the asset in the application sandbox.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### let size

```cangjie
public let size: String
```

**Function:** The size of the asset.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21**Initial Version:** 21  

### let status  

```cangjie  
public let status: AssetStatus  
```  

**Function:** The status of the asset, with a default value of `ASSET_NORMAL`.  

**Type:** [AssetStatus](#enum-assetstatus)  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### let uri  

```cangjie  
public let uri: String  
```  

**Function:** The URI of the asset, representing its absolute path in the system.  

**Type:** String  

**Read/Write Permission:** Read-only  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### init(String, String, String, String, String, String, AssetStatus)  

```cangjie  
public init(name: String, uri: String, path: String, createTime: String, modifyTime: String, size: String, status!: AssetStatus = AssetStatus.ASSET_NORMAL)  
```  

**Function:** Constructs an `Asset`.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Parameters:**  

| Parameter Name | Type | Required | Default Value | Description |  
|:---|:---|:---|:---|:---|  
| name | String | Yes | - | The name of the asset. |  
| uri | String | Yes | - | The URI of the asset, representing its absolute path in the system. |  
| path | String | Yes | - | The path of the asset within the application sandbox. |  
| createTime | String | Yes | - | The time when the asset was created. |  
| modifyTime | String | Yes | - | The last time the asset was modified. |  
| size | String | Yes | - | The size of the space occupied by the asset. |  
| status | [AssetStatus](#enum-assetstatus) | No | AssetStatus.ASSET_NORMAL | **Named parameter.** The status of the asset, with a default value of `ASSET_NORMAL`. |  

## enum AssetStatus  

```cangjie  
public enum AssetStatus {  
    | ASSET_NORMAL  
    | ASSET_INSERT  
    | ASSET_UPDATE  
    | ASSET_DELETE  
    | ASSET_ABNORMAL  
    | ASSET_DOWNLOADING  
    | ...  
}  
```  

**Function:** Enumerates the statuses of asset attachments.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_ABNORMAL  

```cangjie  
ASSET_ABNORMAL  
```  

**Function:** Indicates that the asset status is abnormal.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_DELETE  

```cangjie  
ASSET_DELETE  
```  

**Function:** Indicates that the asset needs to be deleted from the cloud.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_DOWNLOADING  

```cangjie  
ASSET_DOWNLOADING  
```  

**Function:** Indicates that the asset is being downloaded to the local device.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_INSERT  

```cangjie  
ASSET_INSERT  
```  

**Function:** Indicates that the asset needs to be inserted into the cloud.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_NORMAL  

```cangjie  
ASSET_NORMAL  
```  

**Function:** Indicates that the asset status is normal.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_UPDATE  

```cangjie  
ASSET_UPDATE  
```  

**Function:** Indicates that the asset needs to be updated in the cloud.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Retrieves the value of this `AssetStatus` instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this `AssetStatus` instance. |  

## enum ChangeType  

```cangjie  
public enum ChangeType {  
    | DATA_CHANGE  
    | ASSET_CHANGE  
    | ...  
}  
```  

**Function:** Describes the types of data changes.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ASSET_CHANGE  

```cangjie  
ASSET_CHANGE  
```  

**Function:** Indicates that an asset attachment has changed.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### DATA_CHANGE  

```cangjie  
DATA_CHANGE  
```  

**Function:** Indicates that data has changed.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Retrieves the value of this `ChangeType` instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this `ChangeType` instance. |  

## enum ConflictResolution  

```cangjie  
public enum ConflictResolution {  
    | ON_CONFLICT_NONE  
    | ON_CONFLICT_ROLLBACK  
    | ON_CONFLICT_ABORT  
    | ON_CONFLICT_FAIL  
    | ON_CONFLICT_IGNORE  
    | ON_CONFLICT_REPLACE  
    | ...  
}  
```  

**Function:** Conflict resolution methods for insert and update operations.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ON_CONFLICT_ABORT  

```cangjie  
ON_CONFLICT_ABORT  
```  

**Function:** When a conflict occurs, aborts the current SQL statement and reverts any changes made by it, but retains changes caused by prior SQL statements in the same transaction and keeps the transaction active.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ON_CONFLICT_FAIL  

```cangjie  
ON_CONFLICT_FAIL  
```  

**Function:** When a conflict occurs, aborts the current SQL statement but does not revert changes made by the failed SQL statement or terminate the transaction.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ON_CONFLICT_IGNORE  

```cangjie  
ON_CONFLICT_IGNORE  
```  

**Function:** When a conflict occurs, skips the row that violates the constraint and continues processing subsequent rows in the SQL statement.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ON_CONFLICT_NONE  

```cangjie  
ON_CONFLICT_NONE  
```  

**Function:** When a conflict occurs, takes no action.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### ON_CONFLICT_REPLACE  

```cangjie  
ON_CONFLICT_REPLACE  
```
**Function:** Indicates that when a conflict occurs, the pre-existing row causing the constraint violation is deleted before inserting or updating the current row, and the command continues to execute normally.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### ON_CONFLICT_ROLLBACK

```cangjie
ON_CONFLICT_ROLLBACK
```

**Function:** Indicates that when a conflict occurs, the SQL statement is aborted and the current transaction is rolled back.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Retrieves the value of this ConflictResolution instance.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Returns the value of this ConflictResolution instance.|

## enum DistributedType

```cangjie
public enum DistributedType {
    | DISTRIBUTED_DEVICE
    | DISTRIBUTED_CLOUD
    | ...
}
```

**Function:** Describes the distributed type of a table.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### DISTRIBUTED_CLOUD

```cangjie
DISTRIBUTED_CLOUD
```

**Function:** Indicates a database table distributed between devices and the cloud.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### DISTRIBUTED_DEVICE

```cangjie
DISTRIBUTED_DEVICE
```

**Function:** Indicates a database table distributed among different devices.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Retrieves the value of this DistributedType instance.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Returns the value of this DistributedType instance.|

## enum Field

```cangjie
public enum Field {
    | CURSOR_FIELD
    | ORIGIN_FIELD
    | DELETED_FLAG_FIELD
    | OWNER_FIELD
    | PRIVILEGE_FIELD
    | SHARING_RESOURCE_FIELD
    | ...
}
```

**Function:** Special fields used for predicate query conditions.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### CURSOR_FIELD

```cangjie
CURSOR_FIELD
```

**Function:** Field name used for cursor lookup.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### DELETED_FLAG_FIELD

```cangjie
DELETED_FLAG_FIELD
```

**Function:** Field populated in the result set returned by cursor lookup, indicating whether data synchronized from the cloud to the local device has been cleaned up. In the returned result set, a value of `false` for this field indicates the data has not been cleaned up, while `true` indicates it has.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### ORIGIN_FIELD

```cangjie
ORIGIN_FIELD
```

**Function:** Field name used to specify the data source during cursor lookup.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### OWNER_FIELD

```cangjie
OWNER_FIELD
```

**Function:** Field populated in the result set when searching for the owner in a shared table, indicating the initiator of the current shared record.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### PRIVILEGE_FIELD

```cangjie
PRIVILEGE_FIELD
```

**Function:** Field populated in the result set when searching for data sharing permissions in a shared table, indicating the allowed operation permissions for the current shared record.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### SHARING_RESOURCE_FIELD

```cangjie
SHARING_RESOURCE_FIELD
```

**Function:** Field populated in the result set when searching for shared resource identifiers during data sharing, indicating the shared resource identifier of the shared data.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

### func getValue()

```cangjie
public func getValue(): String
```

**Function:** Retrieves the value of this Field instance.

**System Capability:** SystemCapability.CloudSync.Client

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the value of this Field instance.|

## enum Origin

```cangjie
public enum Origin {
    | LOCAL
    | CLOUD
    | REMOTE
    | ...
}
```

**Function:** Indicates the data source.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### CLOUD

```cangjie
CLOUD
```

**Function:** Indicates data synchronized from the cloud.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### LOCAL

```cangjie
LOCAL
```

**Function:** Indicates local data.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### REMOTE

```cangjie
REMOTE
```

**Function:** Indicates data synchronized between devices.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**Function:** Retrieves the value of this Origin instance.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|Int32|Returns the value of this Origin instance.|

## enum Progress

```cangjie
public enum Progress {
    | SYNC_BEGIN
    | SYNC_IN_PROGRESS
    | SYNC_FINISH
}
```

**Function:** Describes the device-cloud synchronization process.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core

**Since:** 21

### SYNC_BEGIN

```cangjie
SYNC_BEGIN
```

**Function:** Indicates the start of the device-cloud synchronization process.

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core**Initial Version:** 21  

### SYNC_FINISH  

```cangjie  
SYNC_FINISH  
```  

**Function:** Indicates the completion of the device-cloud synchronization process.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_IN_PROGRESS  

```cangjie  
SYNC_IN_PROGRESS  
```  

**Function:** Indicates that the device-cloud synchronization process is ongoing.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Retrieves the value of this Progress instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this Progress instance. |  

## enum ProgressCode  

```cangjie  
public enum ProgressCode {  
    | SUCCESS  
    | UNKNOWN_ERROR  
    | NETWORK_ERROR  
    | CLOUD_DISABLED  
    | LOCKED_BY_OTHERS  
    | RECORD_LIMIT_EXCEEDED  
    | NO_SPACE_FOR_ASSET  
    | ...  
}  
```  

**Function:** Represents the status of the device-cloud synchronization process.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### CLOUD_DISABLED  

```cangjie  
CLOUD_DISABLED  
```  

**Function:** Indicates that the cloud service is unavailable.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### LOCKED_BY_OTHERS  

```cangjie  
LOCKED_BY_OTHERS  
```  

**Function:** Indicates that another device is currently performing device-cloud synchronization, preventing this device from initiating the process. Ensure no other device is occupying cloud resources before attempting synchronization on this device.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### NETWORK_ERROR  

```cangjie  
NETWORK_ERROR  
```  

**Function:** Indicates a network error encountered during the device-cloud synchronization process.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### NO_SPACE_FOR_ASSET  

```cangjie  
NO_SPACE_FOR_ASSET  
```  

**Function:** Indicates that the remaining cloud storage space is insufficient for the asset to be synchronized.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### RECORD_LIMIT_EXCEEDED  

```cangjie  
RECORD_LIMIT_EXCEEDED  
```  

**Function:** Indicates that the number of records or size to be synchronized exceeds the maximum limit configured by the cloud.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SUCCESS  

```cangjie  
SUCCESS  
```  

**Function:** Indicates a successful device-cloud synchronization process.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### UNKNOWN_ERROR  

```cangjie  
UNKNOWN_ERROR  
```  

**Function:** Indicates an unknown error encountered during the device-cloud synchronization process.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Retrieves the value of this ProgressCode instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this ProgressCode instance. |  

## enum RelationalStoreSecurityLevel  

```cangjie  
public enum RelationalStoreSecurityLevel {  
    | S1  
    | S2  
    | S3  
    | S4  
    | ...  
}  
```  

**Function:** Enumerates the security levels of a database.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### S1  

```cangjie  
S1  
```  

**Function:** Indicates a low security level for the database, where data leakage would have minimal impact. For example, databases containing system data such as wallpapers.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### S2  

```cangjie  
S2  
```  

**Function:** Indicates a medium security level for the database, where data leakage would have significant impact. For example, databases containing user-generated data such as recordings, videos, or call logs.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### S3  

```cangjie  
S3  
```  

**Function:** Indicates a high security level for the database, where data leakage would have major impact. For example, databases containing user activity, health, or location data.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### S4  

```cangjie  
S4  
```  

**Function:** Indicates a critical security level for the database, where data leakage would have severe impact. For example, databases containing authentication credentials or financial data.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Function:** Retrieves the value of this SecurityLevel instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this SecurityLevel instance. |  

## enum SubscribeType  

```cangjie  
public enum SubscribeType {  
    | SUBSCRIBE_TYPE_REMOTE  
    | SUBSCRIBE_TYPE_CLOUD  
    | SUBSCRIBE_TYPE_CLOUD_DETAILS  
}  
```  

**Function:** Describes the subscription type.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SUBSCRIBE_TYPE_CLOUD  

```cangjie  
SUBSCRIBE_TYPE_CLOUD  
```  

**Function:** Subscribes to cloud data changes.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SUBSCRIBE_TYPE_CLOUD_DETAILS  

```cangjie  
SUBSCRIBE_TYPE_CLOUD_DETAILS  
```  

**Function:** Subscribes to detailed cloud data changes.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SUBSCRIBE_TYPE_REMOTE  

```cangjie  
SUBSCRIBE_TYPE_REMOTE  
```  

**Function:** Subscribes to remote data changes.**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Description:** Gets the value of this SubscribeType instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this SubscribeType instance. |  

## enum SyncMode  

```cangjie  
public enum SyncMode {  
    | SYNC_MODE_PUSH  
    | SYNC_MODE_PULL  
    | SYNC_MODE_TIME_FIRST  
    | SYNC_MODE_NATIVE_FIRST  
    | SYNC_MODE_CLOUD_FIRST  
    | ...  
}  
```  

**Description:** Indicates the database synchronization mode.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_MODE_CLOUD_FIRST  

```cangjie  
SYNC_MODE_CLOUD_FIRST  
```  

**Description:** Indicates data synchronization from the cloud to the local device.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_MODE_NATIVE_FIRST  

```cangjie  
SYNC_MODE_NATIVE_FIRST  
```  

**Description:** Indicates data synchronization from the local device to the cloud.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_MODE_PULL  

```cangjie  
SYNC_MODE_PULL  
```  

**Description:** Indicates pulling data from a remote device to the local device.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_MODE_PUSH  

```cangjie  
SYNC_MODE_PUSH  
```  

**Description:** Indicates pushing data from the local device to a remote device.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### SYNC_MODE_TIME_FIRST  

```cangjie  
SYNC_MODE_TIME_FIRST  
```  

**Description:** Indicates data synchronization from the end with the latest modification time to the end with the earlier modification time.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### func getValue()  

```cangjie  
public func getValue(): Int32  
```  

**Description:** Gets the value of this SyncMode instance.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

**Return Value:**  

| Type | Description |  
|:----|:----|  
| Int32 | Returns the value of this SyncMode instance. |  

## enum RelationalStoreValueType  

```cangjie  
public enum RelationalStoreValueType {  
    | null  
    | integer(Int64)  
    | double(Float64)  
    | string(String)  
    | boolean(Bool)  
    | Uint8Array(Array<UInt8>)  
    | AssetEnum(Asset)  
    | AssetsEnum(Array<Asset>)  
    | ...  
}  
```  

**Description:** Represents the allowed data field types. The specific type of interface parameters depends on their functionality.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### AssetEnum(Asset)  

```cangjie  
AssetEnum(Asset)  
```  

**Description:** Indicates the value type is an attachment [Asset](#struct-asset).  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### AssetsEnum(Array\<Asset>)  

```cangjie  
AssetsEnum(Array<Asset>)  
```  

**Description:** Indicates the value type is an array of attachments Array\<[Asset](#struct-asset)>.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### Uint8Array(Array\<UInt8>)  

```cangjie  
Uint8Array(Array<UInt8>)  
```  

**Description:** Indicates the value type is an array of UInt8.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### boolean(Bool)  

```cangjie  
boolean(Bool)  
```  

**Description:** Indicates the value type is a Boolean.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### double(Float64)  

```cangjie  
double(Float64)  
```  

**Description:** Indicates the value type is a floating-point number.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### integer(Int64)  

```cangjie  
integer(Int64)  
```  

**Description:** Indicates the value type is an integer.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### null  

```cangjie  
null  
```  

**Description:** Indicates the value type is null.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21  

### string(String)  

```cangjie  
string(String)  
```  

**Description:** Indicates the value type is a string.  

**System Capability:** SystemCapability.DistributedDataManager.RelationalStore.Core  

**Initial Version:** 21