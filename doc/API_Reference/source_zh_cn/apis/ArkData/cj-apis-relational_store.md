# ohos.relational_store（关系型数据库）

关系型数据库（Relational Database，RDB）是一种基于关系模型来管理数据的数据库。关系型数据库基于SQLite组件提供了一套完整的对本地数据库进行管理的机制，对外提供了一系列的增、删、改、查等接口，也可以直接运行用户输入的SQL语句来满足复杂的场景需要。不支持Worker线程。

仓颉侧支持的基本数据类型：Int64、Float64、String、二进制类型数据、Bool。为保证插入并读取数据成功，建议一条数据不要超过2M。超出该大小，插入成功，读取失败。

该模块提供以下关系型数据库相关的常用功能：

- [RdbPredicates](#class-rdbpredicates)： 数据库中用来代表数据实体的性质、特征或者数据实体之间关系的词项，主要用来定义数据库的操作条件。
- [RdbStore](#class-rdbstore)：提供管理关系数据库(RDB)方法的接口。
- [ResultSet](#class-resultset)：提供用户调用关系型数据库查询接口之后返回的结果集合。

## 导入模块

```cangjie
import kit.ArkData.*
```

## 权限列表

ohos.permission.DISTRIBUTED_DATASYNC

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func deleteRdbStore(StageContext, String)

```cangjie
public func deleteRdbStore(context: StageContext, name: String): Unit
```

**功能：** 使用指定的数据库文件配置删除数据库。删除成功后，建议将数据库对象置为None。建立数据库时，若在[StoreConfig](#class-storeconfig)中配置了自定义路径，则调用此接口进行删库无效，必须使用[deleteRdbStore(StageContext, StoreConfig)](#func-deleterdbstorestagecontext-storeconfig)接口进行删库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-| 应用的上下文。context的获取方式请参见[getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext)。|
|name|String|是|-|数据库名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
deleteRdbStore(Global.getStageContext(), "RdbTest.db")
```

## func deleteRdbStore(StageContext, StoreConfig)

```cangjie
public func deleteRdbStore(context: StageContext, config: StoreConfig): Unit
```

**功能：** 使用指定的数据库文件配置删除数据库。删除成功后，建议将数据库对象置为None。若数据库文件处于公共沙箱目录下，则删除数据库时必须使用该接口，当存在多个进程操作同一个数据库的情况，建议向其他进程发送数据库删除通知使其感知并处理。建立数据库时，若在[StoreConfig](#class-storeconfig)中配置了自定义路径，则必须调用此接口进行删库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用的上下文。context的获取方式请参见[getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext)。|
|config|[StoreConfig](#class-storeconfig)|是|-|与此RDB存储相关的数据库配置。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息          |
  |:-----------|:----------|
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 14800000  | Inner error.        |
  | 14800010  | Invalid database path.|
  | 14801001  | Only supported in stage mode.         |
  | 14801002  | The data group id is not valid.        |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
deleteRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1))
```

## func getRdbStore(StageContext, StoreConfig)

```cangjie
public func getRdbStore(context: StageContext, config: StoreConfig): RdbStore
```

**功能：** 获得一个相关的RdbStore，操作关系型数据库，用户可以根据自己的需求配置RdbStore的参数，然后调用RdbStore接口执行相关的数据操作。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用的上下文。context的获取方式请参见[getStageContext](../AbilityKit/cj-apis-ability.md#func-getstagecontextabilitycontext)。|
|config|[StoreConfig](#class-storeconfig)|是|-|与此RDB存储相关的数据库配置。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbStore](#class-rdbstore)|返回RdbStore对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800010|Invalid database path.|
  |14800011|Database corrupted.|
  |14801001|Only supported in stage mode.|
  |14801002|The data group id is not valid.|
  |14800017|Config changed.|
  |14800021|SQLite: Generic error.|
  |14800022|SQLite: Callback routine requested an abort.|
  |14800023|SQLite: Access permission denied.|
  |14800027|SQLite: Attempt to write a readonly database.|
  |14800028|SQLite: Some kind of disk I/O error occurred.|
  |14800029|SQLite: The database is full.|
  |14800030|SQLite: Unable to open the database file.|

## class RdbPredicates

```cangjie
public class RdbPredicates {
    public init(name: String)
}
```

**功能：** 表示关系型数据库（RDB）的谓词。该类确定RDB中条件表达式的值是true还是false。该类型不是多线程安全的，如果应用中存在多线程同时操作该类派生出的实例，注意加锁保护。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### init(String)

```cangjie
public init(name: String)
```

**功能：** RdbPredicates类的构造函数。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|数据库表名。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let predicates = RdbPredicates("EMPLOYEE")
```

### func \`in\`(String, Array\<RelationalStoreValueType>)

```cangjie
public func `in`(field: String, values: Array<RelationalStoreValueType>): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值在给定范围内的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|values|Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|以RelationalStoreValueType数组形式指定的要匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

### func and()

```cangjie
public func and(): RdbPredicates
```

**功能：** 向谓词添加和条件。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回带有和条件的Rdb谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中的值为"Lisa"且"SALARY"列中的值为"200.5"的字段
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

**功能：** 向谓词添加左括号。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回带有左括号的Rdb谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中以value开头的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|String|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中以"Li"开头的字段，如"Lisa"
let predicates = RdbPredicates("EMPLOYEE")
predicates.beginsWith("NAME", "Li")
```

### func between(String, RelationalStoreValueType, RelationalStoreValueType)

```cangjie
public func between(field: String, lowValue: RelationalStoreValueType, highValue: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值在给定范围内的字段（包含范围边界）。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|lowValue|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示与谓词匹配的最小值。|
|highValue|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示与谓词匹配的最大值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"AGE"列中大于等于10且小于等于50的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.between("AGE", RelationalStoreValueType.integer(10), RelationalStoreValueType.integer(50))
```

### func contains(String, String)

```cangjie
public func contains(field: String, value: String): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中包含value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|String|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中包含"os"的字段，如"Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.contains("NAME", "os")
```

### func distinct()

```cangjie
public func distinct(): RdbPredicates
```

**功能：** 配置谓词，以过滤重复记录并仅保留其中一个。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回可用于过滤重复记录的谓词。|

**示例：**

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

**功能：** 向谓词添加右括号。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回带有右括号的Rdb谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中以value结尾的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|String|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中以"se"结尾的字段，如"Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.endsWith("NAME", "se")
```

### func equalTo(String, RelationalStoreValueType)

```cangjie
public func equalTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值为value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中的值为"Lisa"的字段
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("Lisa"))
```

### func glob(String, String)

```cangjie
public func glob(field: String, value: String): RdbPredicates
```

**功能：** 配置谓词，以匹配数据字段为value的指定字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|String|是|-|指示要与谓词匹配的值。<br>支持通配符，*表示0个、1个或多个数字或字符，?表示1个数字或字符。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"NAME"列中类型为string且值为"?h*g"的字段
let predicates = RdbPredicates("EMPLOYEE")
predicates.glob("NAME", "?h*g")
```

### func greaterThan(String, RelationalStoreValueType)

```cangjie
public func greaterThan(field: String, value: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值大于value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"AGE"列中大于18的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.greaterThan("AGE", RelationalStoreValueType.integer(18))
```

### func greaterThanOrEqualTo(String, RelationalStoreValueType)

```cangjie
public func greaterThanOrEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值大于或者等于value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"AGE"列中大于18的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.greaterThanOrEqualTo("AGE", RelationalStoreValueType.integer(18))
```

### func groupBy(Array\<String>)

```cangjie
public func groupBy(fields: Array<String>): RdbPredicates
```

**功能：** 配置谓词，按指定列分组查询结果。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|fields|Array\<String>|是|-|指定分组依赖的列名。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回分组查询列的谓词。|

**示例：**

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

**功能：** 同步分布式数据库时，连接到组网内所有的远程设备。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中的值不为null的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中的值为null的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中的值小于value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"AGE"列中小于20的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.lessThan("AGE", RelationalStoreValueType.integer(20))
```

### func lessThanOrEqualTo(String, RelationalStoreValueType)

```cangjie
public func lessThanOrEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值小于或者等于value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 匹配数据表的"AGE"列中小于等于20的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.lessThanOrEqualTo("AGE", RelationalStoreValueType.integer(20))
```

### func like(String, String)

```cangjie
public func like(field: String, value: String): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值类似于value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|String|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 数据表的"NAME"列中的值类似于"os"的字段，如"Rose"
let predicates = RdbPredicates("EMPLOYEE")
predicates.like("NAME", "%os%")
```

### func limitAs(Int32)

```cangjie
public func limitAs(value: Int32): RdbPredicates
```

**功能：** 设置最大数据记录数的谓词。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|最大数据记录数。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回可用于设置最大数据记录数的谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中的值超出给定范围的字段（不包含范围边界）。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|lowValue|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示与谓词匹配的最小值。|
|highValue|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的最大值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 数据表的"AGE"列中小于10或大于50的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.notBetween("AGE", RelationalStoreValueType.integer(10), RelationalStoreValueType.integer(50))
```

### func notEqualTo(String, RelationalStoreValueType)

```cangjie
public func notEqualTo(field: String, value: RelationalStoreValueType): RdbPredicates
```

**功能：** 配置谓词，以匹配数据表的field列中的值不为value的字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|value|[RelationalStoreValueType](#enum-relationalstorevaluetype)|是|-|指示要与谓词匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 数据表的"NAME"列中的值不为"Lisa"的字段
let predicates = RdbPredicates("EMPLOYEE")
predicates.notEqualTo("NAME", RelationalStoreValueType.string("Lisa"))
```

### func notIn(String, Array\<RelationalStoreValueType>)

```cangjie
public func notIn(field: String, values: Array<RelationalStoreValueType>): RdbPredicates
```

**功能：** 将谓词配置为匹配数据字段为ValueType且值超出给定范围的指定字段。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|
|values|Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|以ValueType数组形式指定的要匹配的值。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 数据表的"NAME"列中不在["Lisa", "Rose"]中的值
let predicates = RdbPredicates("EMPLOYEE")
predicates.notIn("NAME", [RelationalStoreValueType.string("Lisa"), RelationalStoreValueType.string("Rose")])
```

### func offsetAs(Int32)

```cangjie
public func offsetAs(rowOffset: Int32): RdbPredicates
```

**功能：** 配置谓词以指定返回结果的起始位置，此方法必须与[limitAs](#func-limitasint32)一起使用。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|rowOffset|Int32|是|-|返回结果的起始位置，取值为正整数。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回具有指定返回结果起始位置的谓词。|

**示例：**

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

**功能：** 将或条件添加到谓词中。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回带有或条件的Rdb谓词。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 数据表的"NAME"列中的值为"Lisa"或"Rose"的字段
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

**功能：** 配置谓词，以匹配数据表的field列中的值按升序排序的列。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

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

**功能：** 配置谓词，以匹配数据表的field列中的值按降序排序的列。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|数据库表中的列名。|

**返回值：**

|类型|说明|
|:----|:----|
|[RdbPredicates](#class-rdbpredicates)|返回与指定字段匹配的谓词。|

**示例：**

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

**功能：** 提供管理关系数据库（RDB）方法的接口。

在使用以下相关接口前，请使用[executeSql](#func-executesqlstring)接口初始化数据库表结构和相关数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func backup(String)

```cangjie
public func backup(destName: String): Unit
```

**功能：** 以指定名称备份数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|destName|String|是|-|指定数据库的备份文件名。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. The store must not be nullptr.|
  |14800000|Inner error.|
  |14800010|Invalid database path.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
rdbStore.backup("dbBackup.db")
```

### func batchInsert(String, Array\<Map\<String, RelationalStoreValueType>>)

```cangjie
public func batchInsert(table: String, values: Array<Map<String, RelationalStoreValueType>>): Int64
```

**功能：** 向目标表中插入一组数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|table|String|是|-|指定的目标表名。|
|values|Array\<Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>>|是|-|表示要插入到表中的一组数据。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|如果操作成功，返回插入的数据个数，否则返回-1。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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
  |14800047|The WAL file size exceeds the default limit.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap
import ohos.relational_store.ValueType as RValueType

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 在开始执行SQL语句之前，开始事务。此接口不支持在多进程或多线程中使用。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. The store must not be nullptr.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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
  |14800047|The WAL file size exceeds the default limit.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提交已执行的SQL语句。此接口不支持在多进程或多线程中使用。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. The store must not be nullptr.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 根据RdbPredicates删除条件，从数据库中删除数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|predicates|[RdbPredicates](#class-rdbpredicates)|是|-|RdbPredicates的实例对象指定的删除条件。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|受影响的行数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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
  |14800047|The WAL file size exceeds the default limit.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let predicates = RdbPredicates("EMPLOYEE")
predicates.equalTo("NAME", RelationalStoreValueType.string("Lisa"))
rdbStore.delete(predicates)
```

### func emit(String)

```cangjie
public func emit(event: String): Unit
```

**功能：** 通知通过[on](#func-onstring-bool-callback0argument)注册的进程间或者进程内监听事件。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|通知订阅事件的名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |801|Capability not supported.|
  |14800000|Inner error.|
  |14800014|Already closed.|
  |14800050|Failed to obtain subscription service.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.emit("PRINT")
```

### func executeSql(String)

```cangjie
public func executeSql(sql: String): Unit
```

**功能：** 提供管理关系数据库(RDB)方法的接口。在使用以下相关接口前，请使用[executeSql](#func-executesqlstring)接口初始化数据库表结构和相关数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sql|String|是|-|设置和获取数据库版本，值为大于等于0的整数。|

### func executeSql(String, Array\<RelationalStoreValueType>)

```cangjie
public func executeSql(sql: String, bindArgs: Array<RelationalStoreValueType>): Unit
```

**功能：** 执行包含指定参数但不返回值的SQL语句。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sql|String|是|-|指定要执行的SQL语句。|
|bindArgs|Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|SQL语句中参数的值。该值与sql参数语句中的占位符相对应。当sql参数语句完整时，该参数不填。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
rdbStore.executeSql("DELETE FROM EMPLOYEE WHERE ID = ?", [RelationalStoreValueType.integer(3)])
```

### func insert(String, Map\<String, RelationalStoreValueType>)

```cangjie
public func insert(table: String, values: Map<String, RelationalStoreValueType>): Int64
```

**功能：** 向目标表中插入一行数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|table|String|是|-|指定的目标表名。|
|values|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|表示要插入到表中的数据行。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|如果操作成功，返回行ID；否则返回-1。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                                                 |
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 向目标表中插入一行数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|table|String|是|-|指定的目标表名。|
|values|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|表示要插入到表中的数据行。|
|conflict|[ConflictResolution](#enum-conflictresolution)|是|-|指定冲突解决方式。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|如果操作成功，返回行ID；否则返回-1。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                                                 |
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消该event事件的所有监听回调。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|取消订阅事件名称。|
|interProcess|Bool|是|-|指定是进程间还是本进程取消订阅。true：进程间。false：本进程。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                           |
  | :------------ | :-------------------------------------- |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801       | Capability not supported. |
  | 14800000     | Inner error.                           |
  | 14800014  | Already closed.    |
  | 14800050     | Failed to obtain subscription service. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.off("PRINT", false)
```

### func off(String, Bool, Callback0Argument)

```cangjie
public func off(event: String, interProcess: Bool, callback: Callback0Argument): Unit
```

**功能：** 取消数据变更的事件监听。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|取消订阅事件名称。|
|interProcess|Bool|是|-|指定是进程间还是本进程取消订阅。true：进程间。false：本进程。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|取消指定监听回调对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                           |
  | :------------ | :-------------------------------------- |
  | 401       | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 801       | Capability not supported. |
  | 14800000     | Inner error.                           |
  | 14800014  | Already closed.    |
  | 14800050     | Failed to obtain subscription service. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(), StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
rdbStore.off("PRINT", false, testCallback)
```

### func on(String, Bool, Callback0Argument)

```cangjie
public func on(event: String, interProcess: Bool, callback: Callback0Argument): Unit
```

**功能：** 注册数据库的进程内或者进程间事件监听。当调用[emit](#func-emitstring)接口时，将调用回调。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|订阅事件名称。|
|interProcess|Bool|是|-|指定是进程间还是本进程订阅。<br/> true：进程间。<br/> false：本进程。|
|callback|[Callback0Argument](../BasicServicesKit/cj-apis-base.md#class-callback0argument)|是|-|回调函数对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |801|Capability not supported.|
  |14800000|Inner error.|
  |14800014|Already closed.|
  |14800050|Failed to obtain subscription service.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class TestCallback <: Callback0Argument {
    public init() {}
    public open func invoke(): Unit {
        AppLog.info("Call invoke.")
    }
}

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let testCallback = TestCallback()
rdbStore.on("PRINT", false, testCallback)
```

### func query(RdbPredicates, Array\<String>)

```cangjie
public func query(predicates: RdbPredicates, columns: Array<String>): ResultSet
```

**功能：** 根据指定条件查询数据库中的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|predicates|[RdbPredicates](#class-rdbpredicates)|是|-|RdbPredicates的实例对象指定的查询条件。|
|columns|Array\<String>|是|-|表示要查询的列。如果值为空，则查询应用于所有列。|

**返回值：**

|类型|说明|
|:----|:----|
|[ResultSet](#class-resultset)|ResultSet对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 根据指定SQL语句查询数据库中的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|sql|String|是|-|指定要执行的SQL语句。|
|bindArgs|Array\<[RelationalStoreValueType](#enum-relationalstorevaluetype)>|否|Array\< RelationalStoreValueType>()| **命名参数。** SQL语句中参数的值。该值与sql参数语句中的占位符相对应。当sql参数语句完整时，该参数不填。|

**返回值：**

|类型|说明|
|:----|:----|
|[ResultSet](#class-resultset)|如果操作成功，则返回ResultSet对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 从指定的数据库备份文件恢复数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|srcName|String|是|-|指定数据库的备份文件名。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
rdbStore.restore("dbBackup.db")
```

### func rollBack()

```cangjie
public func rollBack(): Unit
```

**功能：** 回滚已经执行的SQL语句。此接口不支持在多进程或多线程中使用。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. The store must not be nullptr.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800014|Already closed.|
  |14800015|The database does not respond.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 根据RdbPredicates的指定实例对象更新数据库中的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|values|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|values指示数据库中要更新的数据行。键值对与数据库表的列名相关联。|
|predicates|[RdbPredicates](#class-rdbpredicates)|是|-|RdbPredicates的实例对象指定的更新条件。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回受影响的行数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                                                 |
  |:-----------| :------------------------------------------------------------ |
  | 202       | Permission verification failed, application which is not a system application uses system API. |
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 根据RdbPredicates的指定实例对象更新数据库中的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|values|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|是|-|values指示数据库中要更新的数据行。键值对与数据库表的列名相关联。|
|predicates|[RdbPredicates](#class-rdbpredicates)|是|-|RdbPredicates的实例对象指定的更新条件。|
|conflict|[ConflictResolution](#enum-conflictresolution)|是|-|指定冲突解决方式。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|返回受影响的行数。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  | 错误码ID | 错误信息                                                 |
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import std.collection.HashMap

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 提供通过查询数据库生成的数据库结果集的访问方法。结果集是指用户调用关系型数据库查询接口之后返回的结果集合，提供了多种灵活的数据访问方式，以便用户获取各项数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop columnCount

```cangjie
public prop columnCount: Int32
```

**功能：** 获取结果集中的列数。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop columnNames

```cangjie
public prop columnNames: Array<String>
```

**功能：** 获取结果集中所有列的名称。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop isAtFirstRow

```cangjie
public prop isAtFirstRow: Bool
```

**功能：** 检查结果集是否位于第一行。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop isAtLastRow

```cangjie
public prop isAtLastRow: Bool
```

**功能：** 检查结果集是否位于最后一行。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop isClosed

```cangjie
public prop isClosed: Bool
```

**功能：** 检查当前结果集是否关闭。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop isEnded

```cangjie
public prop isEnded: Bool
```

**功能：** 检查结果集是否位于最后一行之后。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop isStarted

```cangjie
public prop isStarted: Bool
```

**功能：** 检查指针是否移动过。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop rowCount

```cangjie
public prop rowCount: Int32
```

**功能：** 获取结果集中的行数。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### prop rowIndex

```cangjie
public prop rowIndex: Int32
```

**功能：** 获取结果集当前行的索引。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func close()

```cangjie
public func close(): Unit
```

**功能：** 关闭结果集。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |14800000|Inner error.|
  |14800012|Row out of bounds.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.close()
```

### func getAsset(Int32)

```cangjie
public func getAsset(columnIndex: Int32): Asset
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|[Asset](#struct-asset)|以Asset形式返回指定列的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let doc = resultSet.getAsset(resultSet.getColumnIndex("DOC"))
```

### func getAssets(Int32)

```cangjie
public func getAssets(columnIndex: Int32): Array<Asset>
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<[Asset](#struct-asset)>|以Array\<[Asset](#struct-asset)>形式返回指定列的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let docs = resultSet.getAssets(resultSet.getColumnIndex("DOCS"))
```

### func getBlob(Int32)

```cangjie
public func getBlob(columnIndex: Int32): Array<UInt8>
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<UInt8>|以字节数组的形式返回指定列的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
     StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let codes = resultSet.getBlob(resultSet.getColumnIndex("CODES"))
```

### func getColumnIndex(String)

```cangjie
public func getColumnIndex(columnName: String): Int32
```

**功能：** 根据指定的列名获取列索引。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnName|String|是|-|表示结果集中指定列的名称。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回指定列的索引。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800013|Column out of bounds.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 根据指定的列索引获取列名。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|表示结果集中指定列的索引。|

**返回值：**

|类型|说明|
|:----|:----|
|String|返回指定列的名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |14800000|Inner error.|
  |14800011|Database corrupted.|
  |14800013|Column out of bounds.|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let id = resultSet.getColumnName(0)
let name = resultSet.getColumnName(1)
let age = resultSet.getColumnName(2)
```

### func getDouble(Int32)

```cangjie
public func getDouble(columnIndex: Int32): Float64
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|Float64|以Float64形式返回指定列的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let salary = resultSet.getDouble(resultSet.getColumnIndex("SALARY"))
```

### func getLong(Int32)

```cangjie
public func getLong(columnIndex: Int32): Int64
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|以Int64形式返回指定列的值。<br>该接口支持的数据范围是：Number.MIN_SAFE_INTEGER ~ Number.MAX_SAFE_INTEGER，若超出该范围，建议使用[getDouble](#func-getdoubleint32)。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let age = resultSet.getLong(resultSet.getColumnIndex("AGE"))
```

### func getRow()

```cangjie
public func getRow(): Map<String, RelationalStoreValueType>
```

**功能：** 获取当前行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Map\<String, [RelationalStoreValueType](#enum-relationalstorevaluetype)>|返回指定行的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let value = resultSet.getRow()
```

### func getString(Int32)

```cangjie
public func getString(columnIndex: Int32): String
```

**功能：** 获取当前行中指定列的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|String|以字符串形式返回指定列的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
let name = resultSet.getString(resultSet.getColumnIndex("NAME"))
```

### func goTo(Int32)

```cangjie
public func goTo(offset: Int32): Bool
```

**功能：** 向前或向后转至结果集的指定行，相对于其当前位置偏移。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|offset|Int32|是|-|表示相对于当前位置的偏移量。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goTo(1)
```

### func goToFirstRow()

```cangjie
public func goToFirstRow(): Bool
```

**功能：** 转到结果集的第一行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToFirstRow()
```

### func goToLastRow()

```cangjie
public func goToLastRow(): Bool
```

**功能：** 转到结果集的最后一行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToLastRow()
```

### func goToNextRow()

```cangjie
public func goToNextRow(): Bool
```

**功能：** 转到结果集的下一行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToNextRow()
```

### func goToPreviousRow()

```cangjie
public func goToPreviousRow(): Bool
```

**功能：** 转到结果集的上一行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
  |:---|:---|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToPreviousRow()
```

### func goToRow(Int32)

```cangjie
public func goToRow(position: Int32): Bool
```

**功能：** 转到结果集的指定行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|position|Int32|是|-|表示要移动到的指定位置。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果成功移动结果集，则为true；否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
let resultSet = rdbStore.querySql("SELECT * FROM EMPLOYEE WHERE NAME = 'Peter'")
resultSet.goToRow(5)
```

### func isColumnNull(Int32)

```cangjie
public func isColumnNull(columnIndex: Int32): Bool
```

**功能：** 检查当前行中指定列的值是否为null。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|columnIndex|Int32|是|-|指定的列索引，从0开始。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|如果当前行中指定列的值为null，则返回true，否则返回false。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)和[关系型数据库错误码](../../errorcodes/cj-errorcode-data-rdb.md)。

  |错误码ID|错误信息|
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

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var rdbStore: RdbStore = getRdbStore(Global.getStageContext(),
    StoreConfig("RdbTest.db", RelationalStoreSecurityLevel.S1)) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 管理关系数据库配置。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let autoCleanDirtyData

```cangjie
public let autoCleanDirtyData: Bool
```

**功能：** 指定是否自动清理云端删除后同步到本地的数据，true表示自动清理，false表示手动清理，默认自动清理。对于端云协同的数据库，当云端删除的数据同步到设备端时，可通过该参数设置设备端是否自动清理。手动清理可以通过cleanDirtyData接口清理。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### let customDir

```cangjie
public let customDir: String
```

**功能：** 数据库自定义路径。

> **说明：**
>
> 数据库将在如下的目录结构中被创建：context.databaseDir + "/rdb/" + customDir，其中context.databaseDir是应用沙箱对应的路径，"/rdb/"表示创建的是关系型数据库，customDir表示自定义的路径。当此参数不填时，默认在本应用沙箱目录下创建RdbStore实例。
> 数据库路径大小限制为128字节，如果超过该大小会开库失败，返回错误。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let dataGroupId

```cangjie
public let dataGroupId: String
```

**功能：** 应用组ID，需要向应用市场获取。

> **说明：**
>
> 此属性仅在Stage模型下可用。指定在此dataGroupId对应的沙箱路径下创建RdbStore实例，当此参数不填时，默认在本应用沙箱目录下创建RdbStore实例。
**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let encrypt

```cangjie
public let encrypt: Bool
```

**功能：** 指定数据库是否加密，默认不加密。true: 加密。false: 非加密。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 数据库文件名。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let securityLevel

```cangjie
public let securityLevel: RelationalStoreSecurityLevel
```

**功能：** 设置数据库安全级别。

**类型：** [RelationalStoreSecurityLevel](#enum-relationalstoresecuritylevel)

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### init(String, RelationalStoreSecurityLevel, Bool, String, String, Bool)

```cangjie
public init(name: String, securityLevel: RelationalStoreSecurityLevel, encrypt!: Bool = false, dataGroupId!: String = "", customDir!: String = "", autoCleanDirtyData!: Bool = true)
```

**功能：** 构建StoreConfig。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|数据库文件名。<br/>**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core|
|securityLevel|[RelationalStoreSecurityLevel](#enum-securirelationalstoresecurityleveltylevel)|是|-|设置数据库安全级别。<br/>**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core|
|encrypt|Bool|否|false|**命名参数。** 指定数据库是否加密，默认不加密。<br/> true: 加密。<br/> false: 非加密。<br/>**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core|
|dataGroupId|String|否|""|**命名参数。** 应用组ID，需要向应用市场获取。<br/>**模型约束：** 此属性仅在Stage模型下可用。<br/>指定在此dataGroupId对应的沙箱路径下创建RdbStore实例，当此参数不填时，默认在本应用沙箱目录下创建RdbStore实例。<br/>**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core|
|customDir|String|否|""|数据库自定义路径。<br/>**使用约束：** 数据库路径大小限制为128字节，如果超过该大小会开库失败，返回错误。<br/>数据库将在如下的目录结构中被创建：context.databaseDir + "/rdb/" + customDir，其中context.databaseDir是应用沙箱对应的路径，"/rdb/"表示创建的是关系型数据库，customDir表示自定义的路径。当此参数不填时，默认在本应用沙箱目录下创建RdbStore实例。<br/>**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core|
|autoCleanDirtyData|Bool|否|true|**命名参数。** 指定是否自动清理云端删除后同步到本地的数据，true表示自动清理，false表示手动清理，默认自动清理。<br/>对于端云协同的数据库，当云端删除的数据同步到设备端时，可通过该参数设置设备端是否自动清理。手动清理可以通过cleanDirtyData接口清理。<br/>**系统能力：** SystemCapability.DistributedDataManager.CloudSync.Client|

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

**功能：** 记录资产附件（文件、图片、视频等类型文件）的相关信息。资产类型的相关接口暂不支持Datashare。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let createTime

```cangjie
public let createTime: String
```

**功能：** 资产被创建出来的时间。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let modifyTime

```cangjie
public let modifyTime: String
```

**功能：** 资产最后一次被修改的时间。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 资产的名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let path

```cangjie
public let path: String
```

**功能：** 资产在应用沙箱里的路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let size

```cangjie
public let size: String
```

**功能：** 资产占用空间的大小。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let status

```cangjie
public let status: AssetStatus
```

**功能：** 资产的状态，默认值为ASSET_NORMAL。

**类型：** [AssetStatus](#enum-assetstatus)

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### let uri

```cangjie
public let uri: String
```

**功能：** 资产的uri，在系统里的绝对路径。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### init(String, String, String, String, String, String, AssetStatus)

```cangjie
public init(name: String, uri: String, path: String, createTime: String, modifyTime: String, size: String, status!: AssetStatus = AssetStatus.ASSET_NORMAL)
```

**功能：** 构建Asset。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|资产的名称。|
|uri|String|是|-|资产的uri，在系统里的绝对路径。|
|path|String|是|-|资产在应用沙箱里的路径。|
|createTime|String|是|-|资产被创建出来的时间。|
|modifyTime|String|是|-|资产最后一次被修改的时间。|
|size|String|是|-|资产占用空间的大小。|
|status|[AssetStatus](#enum-assetstatus)|否|AssetStatus.ASSET_NORMAL|**命名参数。** 资产的状态，默认值为ASSET_NORMAL。|

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

**功能：** 描述资产附件的状态枚举。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_ABNORMAL

```cangjie
ASSET_ABNORMAL
```

**功能：** 表示资产状态异常。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_DELETE

```cangjie
ASSET_DELETE
```

**功能：** 表示资产需要在云端删除。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_DOWNLOADING

```cangjie
ASSET_DOWNLOADING
```

**功能：** 表示资产正在下载到本地设备。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_INSERT

```cangjie
ASSET_INSERT
```

**功能：** 表示资产需要插入到云端。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_NORMAL

```cangjie
ASSET_NORMAL
```

**功能：** 表示资产状态正常。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_UPDATE

```cangjie
ASSET_UPDATE
```

**功能：** 表示资产需要更新到云端。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该AssetStatus实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该AssetStatus实例的值。|

## enum ChangeType

```cangjie
public enum ChangeType {
    | DATA_CHANGE
    | ASSET_CHANGE
    | ...
}
```

**功能：** 描述数据变更类型。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ASSET_CHANGE

```cangjie
ASSET_CHANGE
```

**功能：** 表示是资产附件发生了变更。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### DATA_CHANGE

```cangjie
DATA_CHANGE
```

**功能：** 表示是数据发生变更。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该ChangeType实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该ChangeType实例的值。|

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

**功能：** 插入和修改接口的冲突解决方式。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_ABORT

```cangjie
ON_CONFLICT_ABORT
```

**功能：** 表示当冲突发生时，中止当前SQL语句，并撤销当前SQL语句所做的任何更改，但是由同一事务中先前的SQL语句引起的更改被保留并且事务保持活动状态。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_FAIL

```cangjie
ON_CONFLICT_FAIL
```

**功能：** 表示当冲突发生时，中止当前SQL语句。但它不会撤销失败的SQL语句的先前更改，也不会结束事务。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_IGNORE

```cangjie
ON_CONFLICT_IGNORE
```

**功能：** 表示当冲突发生时，跳过包含违反约束的行并继续处理SQL语句的后续行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_NONE

```cangjie
ON_CONFLICT_NONE
```

**功能：** 表示当冲突发生时，不做任何处理。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_REPLACE

```cangjie
ON_CONFLICT_REPLACE
```

**功能：** 表示当冲突发生时，在插入或更新当前行之前删除导致约束违例的预先存在的行，并且命令会继续正常执行。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### ON_CONFLICT_ROLLBACK

```cangjie
ON_CONFLICT_ROLLBACK
```

**功能：** 表示当冲突发生时，中止SQL语句并回滚当前事务。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该ConflictResolution实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该ConflictResolution实例的值。|

## enum DistributedType

```cangjie
public enum DistributedType {
    | DISTRIBUTED_DEVICE
    | DISTRIBUTED_CLOUD
    | ...
}
```

**功能：** 描述表的分布式类型。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### DISTRIBUTED_CLOUD

```cangjie
DISTRIBUTED_CLOUD
```

**功能：** 表示在设备和云端之间分布式的数据库表。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### DISTRIBUTED_DEVICE

```cangjie
DISTRIBUTED_DEVICE
```

**功能：** 表示在不同设备之间分布式的数据库表。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该DistributedType实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该DistributedType实例的值。|

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

**功能：** 用于谓词查询条件的特殊字段。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### CURSOR_FIELD

```cangjie
CURSOR_FIELD
```

**功能：** 用于cursor查找的字段名。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### DELETED_FLAG_FIELD

```cangjie
DELETED_FLAG_FIELD
```

**功能：** 用于cursor查找的结果集返回时填充的字段，表示云端删除的数据同步到本地后数据是否清理。返回的结果集中，该字段对应的value为false表示数据未清理，true表示数据已清理。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### ORIGIN_FIELD

```cangjie
ORIGIN_FIELD
```

**功能：** 用于cursor查找时指定数据来源的字段名。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### OWNER_FIELD

```cangjie
OWNER_FIELD
```

**功能：** 用于共享表中查找owner时返回的结果集中填充的字段，表示当前共享记录的共享发起者。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### PRIVILEGE_FIELD

```cangjie
PRIVILEGE_FIELD
```

**功能：** 用于共享表中查找共享数据权限时返回的结果集中填充的字段，表示当前共享记录的允许的操作权限。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### SHARING_RESOURCE_FIELD

```cangjie
SHARING_RESOURCE_FIELD
```

**功能：** 用于数据共享时查找共享数据的共享资源时返回的结果集中填充的字段，表示共享数据的共享资源标识。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): String
```

**功能：** 获取该Field实例的值。

**系统能力：** SystemCapability.CloudSync.Client

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回该Field实例的值。|

## enum Origin

```cangjie
public enum Origin {
    | LOCAL
    | CLOUD
    | REMOTE
    | ...
}
```

**功能：** 表示数据来源。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### CLOUD

```cangjie
CLOUD
```

**功能：** 表示云端同步的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### LOCAL

```cangjie
LOCAL
```

**功能：** 表示本地数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### REMOTE

```cangjie
REMOTE
```

**功能：** 表示端端同步的数据。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该Origin实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该Origin实例的值。|

## enum Progress

```cangjie
public enum Progress {
    | SYNC_BEGIN
    | SYNC_IN_PROGRESS
    | SYNC_FINISH
}
```

**功能：** 描述端云同步过程。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_BEGIN

```cangjie
SYNC_BEGIN
```

**功能：** 表示端云同步过程开始。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_FINISH

```cangjie
SYNC_FINISH
```

**功能：** 表示端云同步过程已完成。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_IN_PROGRESS

```cangjie
SYNC_IN_PROGRESS
```

**功能：** 表示正在端云同步过程中。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该Progress实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该Progress实例的值。|

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

**功能：** 表示端云同步过程的状态。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### CLOUD_DISABLED

```cangjie
CLOUD_DISABLED
```

**功能：** 表示云端不可用。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### LOCKED_BY_OTHERS

```cangjie
LOCKED_BY_OTHERS
```

**功能：** 表示有其他设备正在端云同步，本设备无法进行端云同步。请确保无其他设备占用云端资源后，再使用本设备进行端云同步任务。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### NETWORK_ERROR

```cangjie
NETWORK_ERROR
```

**功能：** 表示端云同步过程遇到网络错误。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### NO_SPACE_FOR_ASSET

```cangjie
NO_SPACE_FOR_ASSET
```

**功能：** 表示云空间剩余空间小于待同步的资产大小。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### RECORD_LIMIT_EXCEEDED

```cangjie
RECORD_LIMIT_EXCEEDED
```

**功能：** 表示本次端云同步需要同步的条目或大小超出最大值。由云端配置最大值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SUCCESS

```cangjie
SUCCESS
```

**功能：** 表示端云同步过程成功。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### UNKNOWN_ERROR

```cangjie
UNKNOWN_ERROR
```

**功能：** 表示端云同步过程遇到未知错误。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该ProgressCode实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该ProgressCode实例的值。|

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

**功能：** 数据库的安全级别枚举。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### S1

```cangjie
S1
```

**功能：** 表示数据库的安全级别为低级别，当数据泄露时会产生较低影响。例如，包含壁纸等系统数据的数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### S2

```cangjie
S2
```

**功能：** 表示数据库的安全级别为中级别，当数据泄露时会产生较大影响。例如，包含录音、视频等用户生成数据或通话记录等信息的数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### S3

```cangjie
S3
```

**功能：** 表示数据库的安全级别为高级别，当数据泄露时会产生重大影响。例如，包含用户运动、健康、位置等信息的数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### S4

```cangjie
S4
```

**功能：** 表示数据库的安全级别为关键级别，当数据泄露时会产生严重影响。例如，包含认证凭据、财务数据等信息的数据库。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该SecurityLevel实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该SecurityLevel实例的值。|

## enum SubscribeType

```cangjie
public enum SubscribeType {
    | SUBSCRIBE_TYPE_REMOTE
    | SUBSCRIBE_TYPE_CLOUD
    | SUBSCRIBE_TYPE_CLOUD_DETAILS
}
```

**功能：** 描述订阅类型。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SUBSCRIBE_TYPE_CLOUD

```cangjie
SUBSCRIBE_TYPE_CLOUD
```

**功能：** 订阅云端数据更改。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SUBSCRIBE_TYPE_CLOUD_DETAILS

```cangjie
SUBSCRIBE_TYPE_CLOUD_DETAILS
```

**功能：** 订阅云端数据更改详情。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SUBSCRIBE_TYPE_REMOTE

```cangjie
SUBSCRIBE_TYPE_REMOTE
```

**功能：** 订阅远程数据更改。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该SubscribeType实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该SubscribeType实例的值。|

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

**功能：** 指数据库同步模式。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_MODE_CLOUD_FIRST

```cangjie
SYNC_MODE_CLOUD_FIRST
```

**功能：** 表示数据从云端同步到本地设备。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_MODE_NATIVE_FIRST

```cangjie
SYNC_MODE_NATIVE_FIRST
```

**功能：** 表示数据从本地设备同步到云端。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_MODE_PULL

```cangjie
SYNC_MODE_PULL
```

**功能：** 表示数据从远程设备拉至本地设备。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_MODE_PUSH

```cangjie
SYNC_MODE_PUSH
```

**功能：** 表示数据从本地设备推送到远程设备。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### SYNC_MODE_TIME_FIRST

```cangjie
SYNC_MODE_TIME_FIRST
```

**功能：** 表示数据从修改时间较近的一端同步到修改时间较远的一端。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### func getValue()

```cangjie
public func getValue(): Int32
```

**功能：** 获取该SyncMode实例的值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|返回该SyncMode实例的值。|

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

**功能：** 用于表示允许的数据字段类型，接口参数具体类型根据其功能而定。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### AssetEnum(Asset)

```cangjie
AssetEnum(Asset)
```

**功能：** 表示值类型为附件[Asset](#struct-asset)。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### AssetsEnum(Array\<Asset>)

```cangjie
AssetsEnum(Array<Asset>)
```

**功能：** 表示值类型为附件数组Array\<[Asset](#struct-asset)>。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### Uint8Array(Array\<UInt8>)

```cangjie
Uint8Array(Array<UInt8>)
```

**功能：** 表示值类型为UInt8类型的数组。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### boolean(Bool)

```cangjie
boolean(Bool)
```

**功能：** 表示值类型为布尔值。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### double(Float64)

```cangjie
double(Float64)
```

**功能：** 表示值类型为浮点型数字。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### integer(Int64)

```cangjie
integer(Int64)
```

**功能：** 表示值类型为整型数字。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### null

```cangjie
null
```

**功能：** 表示值类型为空。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21

### string(String)

```cangjie
string(String)
```

**功能：** 表示值类型为字符。

**系统能力：** SystemCapability.DistributedDataManager.RelationalStore.Core

**起始版本：** 21
