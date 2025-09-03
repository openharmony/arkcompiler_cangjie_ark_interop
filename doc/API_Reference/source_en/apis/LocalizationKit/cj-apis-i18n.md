# ohos.i18n (Internationalization-I18n)

This module provides system-related or enhanced internationalization capabilities, including locale management, phone number processing, calendars, etc. The interfaces here supplement those not defined in the ECMA 402 standard. The Intl module offers basic internationalization interfaces as defined by ECMA 402, which when used together with this module provide comprehensive internationalization support.

## Importing the Module

```cangjie
import kit.LocalizationKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of a Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration must be done in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class Calendar

```cangjie
public class Calendar {}
```

**Description:** A physical calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

### func add(String, Int32)

```cangjie
public func add(field: String, amount: Int32): Unit
```

**Description:** Performs addition or subtraction operations on a specified field of the calendar.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| field     | String | Yes      | -       | Specifies the calendar field to operate on. Currently supported field values include year, month, week_of_year, week_of_month, date, day_of_year, day_of_week, day_of_week_in_month, hour, hour_of_day, minute, second, millisecond. |
| amount    | Int32  | Yes      | -       | The specific value for the addition or subtraction operation. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11) // set time to 2021.12.11
calendar.add("year", 3)
let res = calendar.get("year") // res = 2024
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
| field     | String | Yes      | -       | The field used to retrieve the corresponding value from the calendar object. For currently supported field values, refer to the table below. |

**Return Value:**

| Type  | Description |
|:------|:------------|
| Int32 | The value associated with the field. For example, if the internal date year of the current Calendar object is 1990, get("year") returns 1990. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("en-US")
calendar.set(2024, 1, 1, hour: 12, minute: 30, second: 30)
let year = calendar.get("year") // 2024
let month = calendar.get("month") // 1
let date = calendar.get("date") // 1
let hour = calendar.get("hour_of_day") // 12
let minute = calendar.get("minute") // 30
let second = calendar.get("second") // 30
```

### func getCalendar(String, ?CalendarType)

```cangjie
public func getCalendar(locale: String, calendarType!: ?CalendarType = None): Calendar
```

**Description:** Retrieves a calendar object corresponding to the specified locale and calendar type.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter     | Type         | Required | Default | Description |
|:--------------|:-------------|:---------|:--------|:------------|
| locale        | String       | Yes      | -       | A string representing locale information, composed of language, script, country, or region. |
| calendarType  | CalendarType | No       | None    | The calendar type. |

**Return Value:**

| Type     | Description |
|:---------|:------------|
| Calendar | Returns the calendar object corresponding to the specified locale and calendar type. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.i18n.*

let calendar = getCalendar("en-US", calendarType: CalendarType.Buddhist) // Obtains a Buddhist calendar object based on the en-US locale.
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
| String | The name of the calendar in the locale specified by `locale`. For example, "Buddhist Calendar" is the display name for "buddhist" in en-US. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar
import ohos.i18n.CalendarType

let calendar = getCalendar("en-US", calendarType: CalendarType.Buddhist)
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

import kit.LocalizationKit.getCalendar

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
| Int32 | The minimal number of days required in the first week of the year. This indicates the minimum number of days needed to determine the first week of the year. For example, if this value is set to 4, the first week of the year must contain at least 4 days; otherwise, those days will be counted as part of the last week of the previous year. This setting ensures the week count calculation aligns with regional customs. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("zh-Hans")
let res = calendar.getMinimalDaysInFirstWeek() // res = 1
```

### func getTimeInMillis()

```cangjie
public func getTimeInMillis(): Float64
```

**Description:** Retrieves the current calendar's UTC time in milliseconds.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Return Value:**

| Type    | Description |
|:--------|:------------|
| Float64 | The current calendar's UTC time in milliseconds. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("en-US")
calendar.setTime(5000.0)
let millis = calendar.getTimeInMillis() // millis = 5000
```

### func getTimeZone()

```cangjie
public func getTimeZone(): String
```

**Description:** Retrieves the time zone of the calendar object.

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

import kit.LocalizationKit.getCalendar
import ohos.i18n.CalendarType

let calendar = getCalendar("zh-Hans", calendarType: CalendarType.Chinese)
calendar.setTimeZone("Asia/Shanghai")
let timeZone = calendar.getTimeZone() // timeZone = "Asia/Shanghai"
```

### func set(Int32, Int32, Int32, Int32, Int32, Int32)

```cangjie
public func set(year: Int32, month: Int32, date: Int32, hour!: ?Int32 = None, minute!: ?Int32 = None, second!: ?Int32 = None): Unit
```

**Description:** Sets the year, month, day, hour, minute, and second of the calendar object.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type   | Required | Default | Description |
|:----------|:-------|:---------|:--------|:------------|
| year      | Int32  | Yes      | -       | The year to set. |
| month     | Int32  | Yes      | -       | The month to set. Note: Months are zero-indexed, e.g., 0 represents January. |
| day       | Int32  | Yes      | -       | The day to set. |
| hour      | Int32  | No       | None    | **Named parameter.** The hour to set. -1 represents the system hour. |
| minute    | Int32  | No       | None    | **Named parameter.** The minute to set. -1 represents the system minute. |
| second    | Int32  | No       | None    | **Named parameter.** The second to set. -1 represents the system second. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.set(2021,11,11)  // set time to 2021.12.11
```

### func setFirstDayOfWeek(Int32)

```cangjie
public func setFirstDayOfWeek(value: Int32): Unit
```

**Description:** Sets the first day of the week.

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

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.setFirstDayOfWeek(3)
let firstDayOfWeek = calendar.getFirstDayOfWeek() // firstDayOfWeek = 3
```

### func setMinimalDaysInFirstWeek(Int32)

```cangjie
public func setMinimalDaysInFirstWeek(value: Int32): Unit
```

**Description:** Sets the minimal number of days required in the first week of the year.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type  | Required | Default | Description |
|:----------|:------|:---------|:--------|:------------|
| value     | Int32 | Yes      | -       | The minimal number of days required in the first week of the year. This indicates the minimum number of days needed to determine the first week of the year. For example, if this value is set to 4, the first week of the year must contain at least 4 days; otherwise, those days will be counted as part of the last week of the previous year. This setting ensures the week count calculation aligns with regional customs. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("zh-Hans")
calendar.setMinimalDaysInFirstWeek(3)
let minimalDaysInFirstWeek = calendar.getMinimalDaysInFirstWeek() // minimalDaysInFirstWeek = 3
```

### func setTime(Float64)

```cangjie
public func setTime(time: Float64): Unit
```

**Description:** Sets the internal date and time of the calendar object, where `time` is the number of milliseconds elapsed since 1970.1.1 00:00:00 GMT.

**System Capability:** SystemCapability.Global.I18n

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| time      | Float64 | Yes      | -       | The number of milliseconds elapsed since 1970.1.1 00:00:00 GMT. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("en-US")
calendar.setTime(10540800000.0)
```

### func setTimeZone(String)

```cangjie
public func setTimeZone(timeZone: String): Unit
```

**Description:** Sets the time zone of the calendar object.

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

import kit.LocalizationKit.getCalendar

let calendar = getCalendar("en-US")
calendar.setTimeZone("Asia/Shanghai")
```## class System

```cangjie
public class System {}
```

**Functionality:** I18n system object.

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### static func getAppPreferredLanguage()

```cangjie
public static func getAppPreferredLanguage(): String
```

**Functionality:** Gets the preferred language of the application.

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The preferred language of the application.|

**Example:**

<!-- compile -->

```cangjie
// index.cj
import ohos.i18n.*
import kit.LocalizationKit.getCalendar

let appPreferredLanguage = System.getAppPreferredLanguage() // Get the application's preferred language
```

## enum CalendarType

```cangjie
public enum CalendarType {
    | Buddhist
    | Chinese
    | Coptic
    | Ethiopic
    | Hebrew
    | Gregory
    | Indian
    | IslamicCivil
    | IslamicTbla
    | IslamicUmalqura
    | Japanese
    | Persian
    | ...
}
```

**Functionality:** Calendar type enumeration, used to specify different calendar systems.

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21


### Buddhist

```cangjie
Buddhist
```

**Functionality:** Buddhist calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### Chinese

```cangjie
Chinese
```

**Functionality:** Chinese calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### Coptic

```cangjie
Coptic
```

**Functionality:** Coptic calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21


### Ethiopic

```cangjie
Ethiopic
```

**Functionality:** Ethiopic calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21


### Hebrew

```cangjie
Hebrew
```

**Functionality:** Hebrew calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### Gregory

```cangjie
Gregory
```

**Functionality:** Gregorian calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### Indian

```cangjie
Indian
```

**Functionality:** Indian calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### IslamicCivil

```cangjie
IslamicCivil
```

**Functionality:** Islamic Civil calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### IslamicTbla

```cangjie
IslamicTbla
```

**Functionality:** Islamic Tabular calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### IslamicUmalqura

```cangjie
IslamicUmalqura
```

**Functionality:** Islamic Umm al-Qura calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### Japanese

```cangjie
Japanese
```

**Functionality:** Japanese calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21


### Persian

```cangjie
Persian
```

**Functionality:** Persian calendar type

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

### func toString()
```cangjie
public func toString(): String
```
**Functionality:** Gets the string representation corresponding to the current enumeration value.

**System Capability:** SystemCapability.Global.I18n

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|Returns the string corresponding to the enumeration value.|