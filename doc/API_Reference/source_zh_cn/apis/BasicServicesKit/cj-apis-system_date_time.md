# ohos.system_date_time（系统时间、时区）

本模块主要由系统时间和系统时区功能组成。开发者可以设置、获取系统时间及系统时区。

## 导入模块

```cangjie
import kit.BasicServicesKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class SystemDateTime

```cangjie
public class SystemDateTime {}
```

**功能：** 系统时间、时区功能类。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

### static func getCurrentTime(Bool)

```cangjie
public static func getCurrentTime(isNano!: Bool = false): Int64
```

**功能：** 获取自Unix纪元以来经过的时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isNano|Bool|否|false|**命名参数。** 返回结果是否为纳秒数。<br>- true：表示返回结果为纳秒数（ns）。 <br>- false：表示返回结果为毫秒数（ms）。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|自Unix纪元以来到当前系统时间所经过的时间。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1.Incorrect parameter types. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getCurrentTime()
    Hilog.info(0, "testTag", "Succeeded in getting currentTime : ${time}")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to getCurrentTime: ${e.toString()}")
}
```

### static func getRealActiveTime(Bool)

```cangjie
public static func getRealActiveTime(isNano!: Bool = false): Int64
```

**功能：** 获取自系统启动以来经过的时间，不包括深度睡眠时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isNano|Bool|否|false|**命名参数。** 返回结果是否为纳秒数。<br/>- true：表示返回结果为纳秒数（ns）。<br/>- false：表示返回结果为毫秒数（ms）。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|自系统启动以来经过的时间，不包括深度睡眠时间。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1.Incorrect parameter types. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getRealActiveTime()
    Hilog.info(0, "testTag", "Succeeded in getting real active time : ${time}")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to get real active time: ${e.toString()}")
}
```

### static func getRealTime(Bool)

```cangjie
public static func getRealTime(isNano!: Bool = false): Int64
```

**功能：** 获取自系统启动以来经过的时间，包括深度睡眠时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isNano|Bool|否|false|**命名参数。** 返回结果是否为纳秒数。<br/>- true：表示返回结果为纳秒数（ns）。 <br/>- false：表示返回结果为毫秒数（ms）。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|自系统启动以来经过的时间，包括深度睡眠时间。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1.Incorrect parameter types. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getRealTime()
    Hilog.info(0, "testTag", "Succeeded in getting real time : ${time}")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to get real time: ${e.toString()}")
}
```

### static func getTime(Bool)

```cangjie
public static func getTime(isNano!: Bool = false): Int64
```

**功能：** 获取自Unix纪元以来经过的时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|isNano|Bool|否|false|**命名参数。** 返回结果是否为纳秒数。<br>- true：表示返回结果为纳秒数（ns）。 <br>- false：表示返回结果为毫秒数（ms）。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|自Unix纪元以来经过的时间。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getTime()
    Hilog.info(0, "testTag", "Succeeded in getting time : ${time}")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to get time: ${e.toString()}")
}
```

### static func getTimezone()

```cangjie
public static func getTimezone(): String
```

**功能：** 获取系统时区。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|返回系统时区。具体可见[支持的系统时区](#支持的系统时区) 。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getTimezone()
    Hilog.info(0, "testTag", "Succeeded to getTimezone, getTimezone is ${time} ")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to getTimezone: ${e.toString()}")
}
```

### static func getUptime(TimeType, Bool)

```cangjie
public static func getUptime(timeType: TimeType, isNano!: Bool = false): Int64
```

**功能：** 获取自系统启动以来经过的时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timeType|[TimeType](#enum-timetype)|是|-|获取时间的类型。|
|isNano|Bool|否|false|**命名参数。** 返回结果是否为纳秒数。<br/>- true：表示返回结果为纳秒数（ns）。 <br/>- false：表示返回结果为毫秒数（ms）。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|自系统启动以来经过的时间。|

**异常：**

- BusinessException：对应错误码如下表，详见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

| 错误码ID | 错误信息 |
| :---- | :--- |
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types;3. Parameter verification failed. This error code was added due to missing issues. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.*
import ohos.base.*

try {
    let time = SystemDateTime.getUptime(TimeType.ACTIVE)
    Hilog.info(0, "testTag", "Succeeded to getUptime : ${time}")
} catch (e: Exception) {
    Hilog.info(0, "testTag", "Failed to getUptime: ${e.toString()}")
}
```

## enum TimeType

```cangjie
public enum TimeType {
    | STARTUP
    | ACTIVE
    | ...
}
```

**功能：** 定义获取时间的枚举类型。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

### ACTIVE

```cangjie
ACTIVE
```

**功能：** 自系统启动以来经过的毫秒数，不包括深度睡眠时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

### STARTUP

```cangjie
STARTUP
```

**功能：** 自系统启动以来经过的毫秒数，包括深度睡眠时间。

**系统能力：** SystemCapability.MiscServices.Time

**起始版本：** 21

## 支持的系统时区

支持的系统时区及各时区与0时区相比的偏移量（单位：h）可见下表。

| 时区                           | 偏移量         |
| :------------------------------ | :--------------------- |
| Antarctica/McMurdo             | 12                    |
| America/Argentina/Buenos_Aires | -3                    |
| Australia/Sydney               | 10                    |
| America/Noronha                | -2                    |
| America/St_Johns               | -3                    |
| Africa/Kinshasa                | 1                     |
| America/Santiago               | -3                    |
| Asia/Shanghai                  | 8                     |
| Asia/Nicosia                   | 3                     |
| Europe/Berlin                  | 2                     |
| America/Guayaquil              | -5                    |
| Europe/Madrid                  | 2                     |
| Pacific/Pohnpei                | 11                    |
| America/Godthab                | -2                    |
| Asia/Jakarta                   | 7                     |
| Pacific/Tarawa                 | 12                    |
| Asia/Almaty                    | 6                     |
| Pacific/Majuro                 | 12                    |
| Asia/Ulaanbaatar               | 8                     |
| America/Mexico_City            | -5                    |
| Asia/Kuala_Lumpur              | 8                     |
| Pacific/Auckland               | 12                    |
| Pacific/Tahiti                 | -10                   |
| Pacific/Port_Moresby           | 10                    |
| Asia/Gaza                      | 3                     |
| Europe/Lisbon                  | 1                     |
| Europe/Moscow                  | 3                     |
| Europe/Kiev                    | 3                     |
| Pacific/Wake                   | 12                    |
| America/New_York               | -4                    |
| Asia/Tashkent                  | 5                     |
