# ohos.i18n（国际化-I18n）

本模块提供系统相关的或者增强的国际化能力，包括区域管理、电话号码处理、日历等，相关接口为ECMA 402标准中未定义的补充接口。Intl模块提供了ECMA 402标准定义的基础国际化接口，与本模块共同使用可提供完整地国际化支持能力。

## 导入模块

```cangjie
import kit.LocalizationKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## class Calendar

```cangjie
public class Calendar {}
```

**功能：** 实体日历对象。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

### func add(String, Int32)

```cangjie
public func add(field: String, amount: Int32): Unit
```

**功能：** 在日历的给定字段进行加减操作。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|指定进行操作的日历字段，目前支持的field值有year, month, week_of_year, week_of_month, date, day_of_year, day_of_week, day_of_week_in_month, hour, hour_of_day, minute, second, millisecond。|
|amount|Int32|是|-|进行加减操作的具体数值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[I18n错误码](../../errorcodes/cj-errorcode-i18n.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types.|
  |890001|Invalid parameter. Possible causes: Parameter verification failed.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11) // set time to 2021.12.11
calendar.add("year", 3)
let res = calendar.get("year") // res = 2024
```

### func compareDays(DateTime)

```cangjie
public func compareDays(date: DateTime): Int32
```

**功能：** 比较日历和指定日期相差的天数（按毫秒级的精度，不足一天将按一天进行计算）。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|date|DateTime|是|-|时间、日期。说明：月份从0开始计数，如0表示一月。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|相差的天数，正数代表日历时间更早，负数代表日历时间更晚。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1.Mandatory parameters are left unspecified; 2.Incorrect parameter types.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar
import std.time.DateTime

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11) // set time to 2021.12.11
let date = DateTime.ofUTC(year: 2024, month: 12, dayOfMonth: 4, hour: 0, minute: 0, second: 0, nanosecond: 0)
let result = calendar.compareDays(date) // result = -8
```

### func get(String)

```cangjie
public func get(field: String): Int32
```

**功能：** 获取日历对象中与field相关联的值。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|field|String|是|-|通过field来获取日历对象相应的值。目前支持的field值请参考下表。 |

|field名称|说明|
|----- | ----------------------------------------|
|era|纪元，例如公历中的公元前或者公元后。|
|year|年。|
|month|月。说明：月份从0开始计数，如0表示一月。|
|date|日。|
|hour|挂钟小时数。|
|hour_of_day|一天中的第几小时。|
|minute|分。|
|second|秒。|
|millisecond|毫秒。|
|week_of_year|一年中的第几周，按照星期计算周，注意：第一周的归属算法各地有区别。|
|year_woy|一年中的第几周，按照数值计算周，例如一年中前1~7日属于第一周。|
|week_of_month|一个月中的第几周，按照星期计算周。|
|day_of_week_in_month|一月中的第几周，按照数值计算周，例如1-7日属于第一周。|
|day_of_year|一年中的第几天。|
|day_of_week|一周中的第几天（星期）。|
|milliseconds_in_day|一天中的第几毫秒。|
|zone_offset|以毫秒计时的时区固定偏移量（不含夏令时）。|
|dst_offset|以毫秒计时的夏令时偏移量。|
|dow_local|本地星期。|
|extended_year|扩展的年份数值，支持负数。|
|julian_day|儒略日，与当前时区相关。|
|is_leap_month|是否为闰月。|

**返回值：**

|类型|说明|
|:----|:----|
|Int32|与field相关联的值，如当前Calendar对象的内部日期的年份为1990，get(“year”)返回1990。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US")
calendar.set(2024, 1, 1, hour: 12, minute: 30, second: 30)
let year = calendar.get("year") // 2024
let month = calendar.get("month") // 1
let date = calendar.get("date") // 1
let hour = calendar.get("hour_of_day") // 12
let minute = calendar.get("minute") // 30
let second = calendar.get("second") // 30
```

### func getDisplayName(String)

```cangjie
public func getDisplayName(locale: String): String
```

**功能：** 获取日历对象在该区域的名字。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|locale|String|是|-|表示区域信息的字符串，由语言、脚本、国家或地区组成。|

**返回值：**

|类型|说明|
|:----|:----|
|String|日历在locale所指示区域的名字。如buddhist在en-US上显示的名称为“Buddhist Calendar”。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US", calendarType: "buddhist")
let res = calendar.getDisplayName("zh") // res = "佛历"
```

### func getFirstDayOfWeek()

```cangjie
public func getFirstDayOfWeek(): Int32
```

**功能：** 获取日历对象的一周起始日。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|获取一周的起始日，1代表周日，7代表周六。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US")
let res = calendar.getFirstDayOfWeek() // res = 1
```

### func getMinimalDaysInFirstWeek()

```cangjie
public func getMinimalDaysInFirstWeek(): Int32
```

**功能：** 获取一年中第一周的最小天数。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Int32|一年中第一周的最小天数。这表示为了确定一年中的第一周至少需要包含的天数。例如，如果这个值设置为4，那么一年的第一周必须至少包含4天，否则这些天将被算作上一年的最后一周。这一设定帮助确保周数的计算符合不同地区的习惯。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans")
let res = calendar.getMinimalDaysInFirstWeek() // res = 1
```

### func getTimeInMillis()

```cangjie
public func getTimeInMillis(): Float64
```

**功能：** 获取当前日历的UTC毫秒数。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Float64|当前日历的UTC毫秒数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US")
calendar.setTime(5000.0)
let millis = calendar.getTimeInMillis() // millis = 5000
```

### func getTimeZone()

```cangjie
public func getTimeZone(): String
```

**功能：** 获取日历对象的时区。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|合法的时区ID，如“Asia/Shanghai”。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans", calendarType: "chinese")
calendar.setTimeZone("Asia/Shanghai")
let timeZone = calendar.getTimeZone() // timeZone = "Asia/Shanghai"
```

### func isWeekend(?DateTime)

```cangjie
public func isWeekend(date!: ?DateTime = None): Bool
```

**功能：** 判断指定的日期在日历中是否为周末。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|date|?DateTime|否|None| **命名参数。** 指定的日期。若不填，则判断当前日期是否为周末。默认值为None时是系统日期。|

**返回值：**

|类型|说明|
|:----|:----|
|Bool|若判断指定日期为周末时，返回true，否则返回false。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar
import std.time.DateTime

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11)  // set time to 2021.12.11
calendar.isWeekend() // true
let date = DateTime.ofUTC(year: 2024, month: 11, dayOfMonth: 4, hour: 0, minute: 0, second: 0, nanosecond: 0)
calendar.isWeekend(date: date) // false
```

### func set(Int32, Int32, Int32, Int32, Int32, Int32)

```cangjie
public func set(year: Int32, month: Int32, day: Int32,
    hour!: Int32 = -1, minute!: Int32 = -1, second!: Int32 = -1): Unit
```

**功能：** 设置日历对象的年、月、日、时、分、秒。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|year|Int32|是|-|设置的年。|
|month|Int32|是|-|设置的月。说明：月份从0开始计数，如0表示一月。|
|day|Int32|是|-|设置的日。|
|hour|Int32|否|- 1| **命名参数。** 设置的小时。-1代表系统小时。|
|minute|Int32|否|- 1| **命名参数。** 设置的分钟。-1代表系统分钟。|
|second|Int32|否|- 1| **命名参数。** 设置的秒。-1代表系统秒。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11)  // set time to 2021.12.11
```

### func setFirstDayOfWeek(Int32)

```cangjie
public func setFirstDayOfWeek(value: Int32): Unit
```

**功能：** 设置每一周的起始日。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|设置一周的起始日，1代表周日，7代表周六。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.setFirstDayOfWeek(3)
let firstDayOfWeek = calendar.getFirstDayOfWeek() // firstDayOfWeek = 3
```

### func setMinimalDaysInFirstWeek(Int32)

```cangjie
public func setMinimalDaysInFirstWeek(value: Int32): Unit
```

**功能：** 设置一年中第一周的最小天数。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|value|Int32|是|-|一年中第一周的最小天数。这表示为了确定一年中的第一周至少需要包含的天数。例如，如果这个值为4，那么一年的第一周必须至少包含4天，否则这些天将被算作上一年的最后一周。这一设定帮助确保周数的计算符合不同地区的习惯。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.setMinimalDaysInFirstWeek(3)
let minimalDaysInFirstWeek = calendar.getMinimalDaysInFirstWeek() // minimalDaysInFirstWeek = 3
```

### func setTime(DateTime)

```cangjie
public func setTime(date: DateTime): Unit
```

**功能：** 设置日历对象内部的时间日期。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|date|DateTime|是|-|将要设置的日历对象的内部时间日期。说明：月份从0开始计数，如0表示一月。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar
import std.time.DateTime

let calendar = getCalendar("en-US")
let date: DateTime = DateTime.nowUTC()
calendar.setTime(date) // set time to nowUTC
```

### func setTime(Float64)

```cangjie
public func setTime(time: Float64): Unit
```

**功能：** 设置日历对象内部的时间日期，time为从1970.1.1 00:00:00 GMT逝去的毫秒数。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|time|Float64|是|-|time为从1970.1.1 00:00:00 GMT逝去的毫秒数。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US")
calendar.setTime(10540800000.0)
```

### func setTimeZone(String)

```cangjie
public func setTimeZone(timeZone: String): Unit
```

**功能：** 设置日历对象的时区。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|timeZone|String|是|-|合法的时区ID，如“Asia/Shanghai”。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.getCalendar

let calendar = getCalendar("en-US")
calendar.setTimeZone("Asia/Shanghai")
```

## class System

```cangjie
public class System {}
```

**功能：** I18n系统对象。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

### static func getAppPreferredLanguage()

```cangjie
public static func getAppPreferredLanguage(): String
```

**功能：** 获取应用的偏好语言。

**系统能力：** SystemCapability.Global.I18n

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|应用的偏好语言。|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.System

let appPreferredLanguage = System.getAppPreferredLanguage() // 获取应用偏好语言
```
