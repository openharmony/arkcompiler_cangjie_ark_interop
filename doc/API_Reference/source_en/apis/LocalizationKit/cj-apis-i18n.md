# ohos.i18n (Internationalization-I18n)

This module provides system-related or enhanced internationalization capabilities, including locale management, phone number processing, calendar, etc. The interfaces here supplement those not defined in the ECMA 402 standard. The Intl module offers basic internationalization interfaces as defined by ECMA 402, which when used together with this module provide comprehensive internationalization support.

## Importing the Module

```cangjie
import kit.LocalizationKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code begins with a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#cangjie-sample-code-instructions).

## class Calendar

```cangjie
public class Calendar {}
```

**Description:** A concrete calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

### func add(String, Int32)

```cangjie
public func add(field: String, amount: Int32): Unit
```

**Description:** Performs addition or subtraction operations on the specified field of the calendar.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| field     | String | Yes      | -       | Specifies the calendar field to operate on. Currently supported field values include year, month, week_of_year, week_of_month, date, day_of_year, day_of_week, day_of_week_in_month, hour, hour_of_day, minute, second, millisecond. |
| amount    | Int32  | Yes      | -       | The specific value for the addition or subtraction operation. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [I18n Error Codes](../../errorcodes/cj-errorcode-i18n.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 401          | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 890001       | Invalid parameter. Possible causes: Parameter verification failed. |

**Example:**

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

**Description:** Compares the number of days between the calendar and the specified date (with millisecond precision; fractions of a day are counted as a full day).

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type     | Required | Default | Description |
|:----------|:---------|:---------|:--------|:------------|
| date      | DateTime | Yes      | -       | The date and time. Note: Months start from 0, e.g., 0 represents January. |

**Return Value:**

| Type  | Description |
|:------|:------------|
| Int32 | The number of days difference. A positive number indicates the calendar time is earlier, while a negative number indicates the calendar time is later. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:--------------|
  | 401          | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |

**Example:**

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

**Description:** Retrieves the value associated with the specified field in the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| field     | String | Yes      | -       | The field used to retrieve the corresponding value from the calendar object. Currently supported field values are listed below. |

| Field Name              | Description |
|-------------------------|----------------------------------------|
| era                     | Era, e.g., BC or AD in the Gregorian calendar. |
| year                    | Year. |
| month                   | Month. Note: Months start from 0, e.g., 0 represents January. |
| date                    | Day. |
| hour                    | Wall clock hour. |
| hour_of_day             | The hour of the day. |
| minute                  | Minute. |
| second                  | Second. |
| millisecond             | Millisecond. |
| week_of_year            | The week number of the year, calculated by week. Note: The algorithm for the first week varies by region. |
| year_woy                | The week number of the year, calculated numerically, e.g., days 1-7 of the year belong to the first week. |
| week_of_month           | The week number of the month, calculated by week. |
| day_of_week_in_month    | The week number of the month, calculated numerically, e.g., days 1-7 belong to the first week. |
| day_of_year             | The day of the year. |
| day_of_week             | The day of the week. |
| milliseconds_in_day     | The millisecond of the day. |
| zone_offset             | The fixed timezone offset in milliseconds (excluding daylight saving time). |
| dst_offset              | The daylight saving time offset in milliseconds. |
| dow_local               | The local day of the week. |
| extended_year           | The extended year value, supporting negative numbers. |
| julian_day              | The Julian day, relative to the current timezone. |
| is_leap_month           | Whether it is a leap month. |

**Return Value:**

| Type  | Description |
|:------|:------------|
| Int32 | The value associated with the field. For example, if the internal date of the current Calendar object is 1990, get("year") returns 1990. |

**Example:**

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

**Description:** Retrieves the name of the calendar object in the specified locale.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| locale    | String | Yes      | -       | A string representing locale information, composed of language, script, country, or region. |

**Return Value:**

| Type   | Description |
|:-------|:------------|
| String | The name of the calendar in the locale specified by `locale`. For example, "Buddhist Calendar" is displayed for "buddhist" in "en-US". |

**Example:**

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

**Description:** Retrieves the first day of the week for the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Return Value:**

| Type  | Description |
|:------|:------------|
| Int32 | The first day of the week, where 1 represents Sunday and 7 represents Saturday. |

**Example:**

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

**Description:** Retrieves the minimal number of days required in the first week of the year.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Return Value:**

| Type  | Description |
|:------|:------------|
| Int32 | The minimal number of days required in the first week of the year. This indicates the minimum number of days needed to determine the first week of the year. For example, if this value is set to 4, the first week of the year must include at least 4 days; otherwise, those days are counted as part of the last week of the previous year. This setting ensures the week count aligns with regional customs. |

**Example:**

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

**Description:** Retrieves the current calendar's UTC time in milliseconds.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21**Return Value:**

| Type    | Description |
|:--------|:------------|
| Float64 | Current calendar's UTC time in milliseconds. |

**Example:**

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

**Function:** Gets the time zone of the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Return Value:**

| Type   | Description |
|:-------|:------------|
| String | A valid time zone ID, such as "Asia/Shanghai". |

**Example:**

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

**Function:** Determines whether the specified date is a weekend in the calendar.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type       | Required | Default | Description |
|:----------|:-----------|:---------|:--------|:------------|
| date      | ?DateTime  | No       | None    | **Named parameter.** The specified date. If not provided, checks whether the current date is a weekend. Defaults to the system date when None. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns `true` if the specified date is a weekend, otherwise `false`. |

**Example:**

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

**Function:** Sets the year, month, day, hour, minute, and second of the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description |
|:----------|:------|:---------|:--------|:------------|
| year      | Int32 | Yes      | -       | The year to set. |
| month     | Int32 | Yes      | -       | The month to set. Note: Months start from 0 (e.g., 0 represents January). |
| day       | Int32 | Yes      | -       | The day to set. |
| hour      | Int32 | No       | -1      | **Named parameter.** The hour to set. -1 represents the system hour. |
| minute    | Int32 | No       | -1      | **Named parameter.** The minute to set. -1 represents the system minute. |
| second    | Int32 | No       | -1      | **Named parameter.** The second to set. -1 represents the system second. |

**Example:**

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

**Function:** Sets the first day of the week.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description |
|:----------|:------|:---------|:--------|:------------|
| value     | Int32 | Yes      | -       | The first day of the week, where 1 represents Sunday and 7 represents Saturday. |

**Example:**

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

**Function:** Sets the minimal number of days required in the first week of the year.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description |
|:----------|:------|:---------|:--------|:------------|
| value     | Int32 | Yes      | -       | The minimal number of days required in the first week of the year. This determines how many days are needed to consider a week as the first week of the year. For example, if set to 4, the first week must contain at least 4 days; otherwise, those days are counted as part of the last week of the previous year. This setting ensures week numbering aligns with regional conventions. |

**Example:**

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

**Function:** Sets the internal date and time of the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type     | Required | Default | Description |
|:----------|:---------|:---------|:--------|:------------|
| date      | DateTime | Yes      | -       | The date and time to set for the calendar object. Note: Months start from 0 (e.g., 0 represents January). |

**Example:**

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

**Function:** Sets the internal date and time of the calendar object, where `time` is the number of milliseconds elapsed since 1970.1.1 00:00:00 GMT.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| time      | Float64 | Yes      | -       | The number of milliseconds elapsed since 1970.1.1 00:00:00 GMT. |

**Example:**

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

**Function:** Sets the time zone of the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| timeZone  | String | Yes      | -       | A valid time zone ID, such as "Asia/Shanghai". |

**Example:**

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

**Function:** I18n system object.

**System Capability:** SystemCapability.Global.I18n**Initial Version:** 21  

### static func getAppPreferredLanguage()  

```cangjie  
public static func getAppPreferredLanguage(): String  
```  

**Function:** Gets the preferred language of the application.  

**System Capability:** SystemCapability.Global.I18n  

**Initial Version:** 21  

**Return Value:**  

| Type   | Description                     |  
|:-------|:--------------------------------|  
| String | The preferred language of the application. |  

**Example:**  

<!-- compile -->  

```cangjie  
// index.cj  

import ohos.i18n.System  

let appPreferredLanguage = System.getAppPreferredLanguage() // Get the application's preferred language  
```