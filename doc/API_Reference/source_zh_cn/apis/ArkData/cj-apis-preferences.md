# ohos.preferences（用户首选项）

用户首选项为应用提供Key-Value键值型的数据处理能力，支持应用持久化轻量级数据，并对其修改和查询。

数据存储形式为键值对，键的类型为字符串型，值的存储数据类型包括数字型、字符型、布尔型以及这3种类型的数组类型。

## 导入模块

```cangjie
import kit.ArkData.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## let MAX_KEY_LENGTH

```cangjie
public let MAX_KEY_LENGTH: Int64 = 1024
```

**功能：** Key的最大长度限制为1024个字节。

**类型：** Int64

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

## let MAX_VALUE_LENGTH

```cangjie
public let MAX_VALUE_LENGTH: Int64 = 16 * 1024 * 1024
```

**功能：** Value的最大长度限制为16 * 1024 * 1024个字节。

**类型：** Int64

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

## class Preferences

```cangjie
public class Preferences {}
```

**功能：** 首选项类，提供获取和修改存储数据的接口。

> **说明：**
>
> 想获取实例首先调用[getPreferences](#static-func-getpreferencesstagecontext-string)函数，再通过获得的实例调用其他成员函数。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### static func deletePreferences(StageContext, String)

```cangjie
public static func deletePreferences(context: StageContext, name: String): Unit
```

**功能：** 从缓存中移出指定的Preferences实例，若Preferences实例有对应的持久化文件，则同时删除其持久化文件。

> **说明：**
>
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|name|String|是|-|Preferences实例的名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息|
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |
  | 15500010 | Failed to delete preferences file. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 获取 Preferences 实例
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例
    Preferences.deletePreferences(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("delete Preferences failed")
}
```

### static func deletePreferences(StageContext, PreferencesOptions)

```cangjie
public static func deletePreferences(context: StageContext, options: PreferencesOptions): Unit
```

**功能：** 从缓存中移出指定的Preferences实例，若Preferences实例有对应的持久化文件，则同时删除其持久化文件。

> **说明：**
>
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|options|[PreferencesOptions](#struct-preferencesoptions)|是|-|与Preferences实例相关的配置选项。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |
  | 15500010 | Failed to delete preferences file. |
  | 15501002 | The data group id is not valid.     |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

// 获取 Preferences 实例
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore")  // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例
    Preferences.deletePreferences(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("delete Preferences failed")
}
```

### static func getPreferences(StageContext, String)

```cangjie
public static func getPreferences(context: StageContext, name: String): Preferences
```

**功能：** 从缓存中移出指定的Preferences实例。

> **说明：**
>
> 应用首次调用[getPreferences](#static-func-getpreferencesstagecontext-string)接口获取某个Preferences实例后，该实例会被缓存起来，后续再次[getPreferences](#static-func-getpreferencesstagecontext-string)时不会再次从持久化文件中读取，直接从缓存中获取Preferences实例。调用此接口移出缓存中的实例之后，再次getPreferences将会重新读取持久化文件，生成新的Preferences实例。
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|name|String|是|-|Preferences实例的名称。|

**返回值：**

|类型|说明|
|:----|:----|
|[Preferences](#class-preferences)|Preferences实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例的缓存
    Preferences.removePreferencesFromCache(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### static func getPreferences(StageContext, PreferencesOptions)

```cangjie
public static func getPreferences(context: StageContext, options: PreferencesOptions): Preferences
```

**功能：** 从缓存中移出指定的Preferences实例。

> **说明：**
>
> 应用首次调用[getPreferences](#static-func-getpreferencesstagecontext-string)接口获取某个Preferences实例后，该实例会被会被缓存起来，后续再次[getPreferences](#static-func-getpreferencesstagecontext-string)时不会再次从持久化文件中读取，直接从缓存中获取Preferences实例。调用此接口移出缓存中的实例之后，再次getPreferences将会重新读取持久化文件，生成新的Preferences实例。
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|options|[PreferencesOptions](#struct-preferencesoptions)|是|-|Preferences实例的名称。|

**返回值：**

|类型|说明|
|:----|:----|
|[Preferences](#class-preferences)|Preferences实例。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例的缓存
    Preferences.removePreferencesFromCache(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID"))
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### static func removePreferencesFromCache(StageContext, String)

```cangjie
public static func removePreferencesFromCache(context: StageContext, name: String): Unit
```

**功能：** 从缓存中移出指定的Preferences实例。

> **说明：**
>
> 应用首次调用[getPreferences](#static-func-getpreferencesstagecontext-string)接口获取某个Preferences实例后，该实例会被缓存起来，后续再次[getPreferences](#static-func-getpreferencesstagecontext-string)时不会再次从持久化文件中读取，直接从缓存中获取Preferences实例。调用此接口移出缓存中的实例之后，再次getPreferences将会重新读取持久化文件，生成新的Preferences实例。
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|name|String|是|-|Preferences实例的名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例的缓存
    Preferences.removePreferencesFromCache(Global.getStageContext(), "myStore")
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### static func removePreferencesFromCache(StageContext, PreferencesOptions)

```cangjie
public static func removePreferencesFromCache(context: StageContext, options: PreferencesOptions): Unit
```

**功能：** 从缓存中移出指定的Preferences实例。

> **说明：**
>
> 应用首次调用[getPreferences](#static-func-getpreferencesstagecontext-string)接口获取某个Preferences实例后，该实例会被会被缓存起来，后续再次[getPreferences](#static-func-getpreferencesstagecontext-string)时不会再次从持久化文件中读取，直接从缓存中获取Preferences实例。调用此接口移出缓存中的实例之后，再次getPreferences将会重新读取持久化文件，生成新的Preferences实例。
> 调用该接口后，不建议再使用旧的Preferences实例进行数据操作，否则会出现数据一致性问题。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|应用上下文。|
|options|[PreferencesOptions](#struct-preferencesoptions)|是|-|Preferences实例的名称。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |
  | 15501002 | The data group id is not valid.     |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
try {
    // 删除 Preferences 实例的缓存
    Preferences.removePreferencesFromCache(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID"))
} catch (e: Exception) {
    AppLog.info("Failed to remove cache for preferences")
}
```

### func clear()

```cangjie
public func clear(): Unit
```

**功能：** 清除缓存的Preferences实例中的所有数据，可通过[flush](#func-flush)将Preferences实例持久化。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
preferences.put("myKey", PreferencesValueType.string("myValue"))
preferences.clear()
```

### func delete(String)

```cangjie
public func delete(key: String): Unit
```

**功能：** 从缓存的Preferences实例中删除名为给定Key的存储键值对，可通过[flush](#func-flush)将Preferences实例持久化。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|要删除的存储Key名称，不能为空。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

// 获取 Preferences 实例
let preferences = Preferences.getPreferences(Global.getStageContext(), "myStore") // 需获取Context应用上下文，详见本文使用说明
preferences.delete("startup")
```

### func flush()

```cangjie
public func flush(): Unit
```

**功能：** 将缓存的Preferences实例中的数据存储到用户首选项的持久化文件中。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
preferences.put("myKey", PreferencesValueType.string("myValue"))
preferences.flush()
```

### func get(String, PreferencesValueType)

```cangjie
public func get(key: String, defValue: PreferencesValueType): PreferencesValueType
```

**功能：** 从缓存的Preferences实例中获取键对应的值，如果该键不存在，返回默认数据defValue。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|要获取的存储Key名称。|
|defValue|[PreferencesValueType](#enum-preferencesvaluetype)|是|-|默认返回值。支持Int64、Float64、String、Bool、 Array\<Bool>、Array\<Float64>、Array\<String>。|

**返回值：**

|类型|说明|
|:----|:----|
|[PreferencesValueType](#enum-preferencesvaluetype)|返回键对应的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
var value = preferences.get("key", PreferencesValueType.integer(0))
match (value) {
    case PreferencesValueType.integer(n) => AppLog.info("获取到的值为${n}")
    case _ => AppLog.info("获取到的值并不是 Int")
}
```

### func getAll()

```cangjie
public func getAll(): HashMap<String, PreferencesValueType>
```

**功能：** 从缓存的Preferences实例中获取所有键值数据。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|HashMap\<String, [PreferencesValueType](#enum-preferencesvaluetype)>|HashMap对象，返回含有所有键值数据。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                       |
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
var values = preferences.getAll()
for ((k, v) in values) {
    match (v) {
        case integer(n) => AppLog.info("获得到的键值对key: ${k} value: ${n}")
        case double(n) => AppLog.info("获得到的键值对key: ${k} value: ${n}")
        case string(n) => AppLog.info("获得到的键值对key: ${k} value: ${n}")
        case _ => AppLog.info("其他值")
    }
}
```

### func has(String)

```cangjie
public func has(key: String): Bool
```

**功能：** 检查缓存的Preferences实例中是否包含名为给定Key的存储键值对。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|要检查的存储key名称。|

**返回值：**

| 类型| 说明|
| :---------------------- | :------------------------------------------------------------ |
| Bool | Bool值。返回Preferences实例是否包含给定key的存储键值对，true表示存在，false表示不存在。 |

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息|
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*

let preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消订阅数据变更。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tp|String|是|-|事件类型，固定值“change”或“multiProcessChange”。<br>change时，表示取消订阅数据变更。<br>multiProcessChange时，表示取消订阅进程间数据变更。                     |
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<String>|是|-|需要取消的回调函数，不填写则全部取消。String: 发生变化的Key的类型。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息|
  | :-------- | :-------------------------------------- |
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PreferencesValueType as PValueType

// 此处代码可添加在依赖项定义中
// 回调函数
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 取消订阅数据变更。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tp|String|是|-|事件类型，固定值“change”或“multiProcessChange”。<br>change时，表示取消订阅数据变更。<br>multiProcessChange时，表示取消订阅进程间数据变更。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息                               |
  | :-------- | :-------------------------------------- |
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PreferencesValueType as PValueType

// 此处代码可添加在依赖项定义中
// 回调函数
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // 需获取Context应用上下文，详见本文使用说明
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

**功能：** 订阅数据变更。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tp|String|是|-|事件类型，固定值“change”或“multiProcessChange”。<br>change时，表示订阅数据变更，订阅的Key的值发生变更后，在执行flush方法后，触发callback回调。<br>multiProcessChange时，表示订阅进程间数据变更，多个进程持有同一个首选项文件时，订阅的Key的值在任意一个进程发生变更后，执行flush方法后，触发callback回调。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<String>|是|-|回调函数。String: 发生变化的Key的类型。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*
import ohos.base.*
import kit.ArkData.PreferencesValueType as PValueType

// 回调函数
class Callback <: Callback1Argument<String> {
    public func invoke(arg: String): Unit {
        AppLog.info("=========callback========= ${arg.toString()}======================")
    }
}

var str = "container"
var a = Preferences.getPreferences(Global.getStageContext(), str) // 需获取Context应用上下文，详见本文使用说明
var c = Callback()
a.on("change", c)
a.put("kkk1", PValueType.string("vvv1"))
a.flush()
```

### func put(String, PreferencesValueType)

```cangjie
public func put(key: String, value: PreferencesValueType): Unit
```

**功能：** 将数据写入缓存的Preferences实例中，可通过[flush](#func-flush)将Preferences实例持久化。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|是|-|要修改的存储的Key，不能为空。|
|value|[PreferencesValueType](#enum-preferencesvaluetype)|是|-|存储的新值。支持Int64、Float64、String、Bool、 Array\<Bool>、Array\<Float64>、Array\<String>。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[用户首选项错误码](../../errorcodes/cj-errorcode-preferences.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息|
  | :-------- | :------------------------------|
  | 401 | Parameter error. Possible causes:<br>1. Mandatory parameters are left unspecified;<br>2. Parameter verification failed.   |
  | 15500000 | Inner error.                   |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.ArkData.*

var preferences = Preferences.getPreferences(Global.getStageContext(), PreferencesOptions("mystore", "myGroupID")) // 需获取Context应用上下文，详见本文使用说明
preferences.put("Monday", PreferencesValueType.string("今天天气真好"))
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

**功能：** Preferences实例配置选项。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### let dataGroupId

```cangjie
public let dataGroupId: String
```

**功能：** 应用组ID，需要向应用市场获取。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** Preferences实例的名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### init(String)

```cangjie
public init(name: String)
```

**功能：** 用于创建Options实例的构造函数。默认在本应用沙箱目录下创建Preferences实例。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|Preferences实例的名称。|

**示例：**

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

**功能：** 用于创建Options实例的构造函数。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|Preferences实例的名称。|
|dataGroupId|String|是|-|应用组ID，需要向应用市场获取。指定在此dataGroupId对应的沙箱路径下创建Preferences实例。|

**示例：**

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

**功能：** 用于表示允许的数据字段的枚举类型。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### bool(Bool)

```cangjie
bool(Bool)
```

**功能：** 表示值类型为布尔值。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### boolArray(Array\<Bool>)

```cangjie
boolArray(Array<Bool>)
```

**功能：** 表示值类型为布尔类型的数组。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### double(Float64)

```cangjie
double(Float64)
```

**功能：** 表示值类型为Float64浮点数。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### doubleArray(Array\<Float64>)

```cangjie
doubleArray(Array<Float64>)
```

**功能：** 表示值类型为Float64类型的数组。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### integer(Int64)

```cangjie
integer(Int64)
```

**功能：** 表示值类型为Int64数字。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### string(String)

```cangjie
string(String)
```

**功能：** 表示值类型为字符串。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21

### stringArray(Array\<String>)

```cangjie
stringArray(Array<String>)
```

**功能：** 表示值类型为字符串类型的数组。

**系统能力：** SystemCapability.DistributedDataManager.Preferences.Core

**起始版本：** 21
