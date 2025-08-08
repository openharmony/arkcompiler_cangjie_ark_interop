# ohos.data_share_predicates (Data Sharing Predicates)

Predicates (data_share_predicates) are filtering conditions used by developers to query data in databases through DataShare. They are commonly applied in data updates, deletions, and queries.

The interface functions of predicates correspond one-to-one with database filtering conditions. Developers need to understand database-related knowledge before using them.

## Import Module

```cangjie
import kit.ArkData.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code has a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For the above example project and configuration template, refer to [Cangjie Example Code Instructions](../../cj-development-intro.md#Cangjie-example-code-instructions).

## class DataSharePredicates

```cangjie
public class DataSharePredicates {
    public init()
}
```

**Function:** Provides data sharing predicates for implementing different query methods.

> **Note:**
>
> This class is not thread-safe. If there are multiple threads in the application simultaneously operating instances derived from this class, ensure proper locking protection.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

### init()

```cangjie
public init()
```

**Function:** Initialization constructor for DataSharePredicates.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

### func \`in\`(String, Array\<VBValueType>)

```cangjie
public func `in`(field: String, values: Array<VBValueType>): DataSharePredicates
```

**Function:** Configures the predicate to match fields with values within the specified range. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |
| values | Array\<[VBValueType](cj-apis-values_bucket.md#enum-VBValueType)> | Yes | - | Values to match, specified as an array of ValueType. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DataSharePredicates](#class-datasharepredicates) | Returns the predicate matching the specified field. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.`in`("AGE", [VBValueType.Integer(18), VBValueType.Integer(20)])
```

### func and()

```cangjie
public func and(): DataSharePredicates
```

**Function:** Adds an AND condition to the predicate. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| [DataSharePredicates](#class-datasharepredicates) | Returns the predicate matching the specified field. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.equalTo("NAME", VBValueType.Str("lisi"))
        .and()
        .equalTo("SALARY", VBValueType.Double(200.5))
```

### func equalTo(String, ValueType)

```cangjie
public func equalTo(field: String, value: VBValueType): DataSharePredicates
```

**Function:** Configures the predicate to match fields with values equal to the specified value. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |
| value | [VBValueType](cj-apis-values_bucket.md#enum-VBValueType) | Yes | - | Value to match with the predicate. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DataSharePredicates](#class-datasharepredicates) | Returns the predicate matching the specified field. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.equalTo("NAME", VBValueType.Str("Rose"))
```

### func limit(Int32, Int32)

```cangjie
public func limit(total: Int32, offset: Int32): DataSharePredicates
```

**Function:** Configures the predicate to specify the number of results and the starting position. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| total | Int32 | Yes | - | Specifies the number of results. |
| offset | Int32 | Yes | - | Indicates the starting position. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DataSharePredicates](#class-datasharepredicates) | Returns the predicate matching the specified field. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.equalTo("NAME", VBValueType.Str("Rose")).limit(10, 3)
```

### func orderByAsc(String)

```cangjie
public func orderByAsc(field: String): DataSharePredicates
```

**Function:** Configures the predicate to match columns sorted in ascending order by their values. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |

**Return Value:**

| Type | Description |
|:----|:----|
| [DataSharePredicates](#class-datasharepredicates) | Returns the predicate matching the specified field. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.orderByAsc("AGE")
```

### func orderByDesc(String)

```cangjie
public func orderByDesc(field: String): DataSharePredicates
```

**Function:** Configures the predicate to match columns sorted in descending order by their values. Currently, only RDB and KVDB (schema) support this predicate.

**System Capability:** SystemCapability.DistributedDataManager.DataShare.Core

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| field | String | Yes | - | Column name in the database table. |

**Return Value:**
| Type | Description |
|:----|:----|
|[DataSharePredicates](#class-datasharepredicates)|Returns predicates matching the specified fields. |

**Exceptions:**

- BusinessException: Corresponding error codes are shown in the table below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.ArkData.*

let predicates = DataSharePredicates()
predicates.orderByDesc("AGE")
```