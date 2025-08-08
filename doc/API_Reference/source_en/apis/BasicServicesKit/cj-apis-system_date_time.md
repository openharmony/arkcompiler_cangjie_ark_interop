# ohos.system_date_time (System Time and Timezone)

This module primarily consists of system time and system timezone functionalities. Developers can set and retrieve system time and timezone.

## Importing the Module

```cangjie
import kit.BasicServicesKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code starts with a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details on the aforementioned sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## class SystemDateTime

```cangjie
public class SystemDateTime {}
```

**Description:** System time and timezone functionality class.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

### static func getCurrentTime(Bool)

```cangjie
public static func getCurrentTime(isNano!: Bool = false): Int64
```

**Description:** Retrieves the elapsed time since the Unix epoch.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isNano | Bool | No | false | **Named parameter.** Whether the result is in nanoseconds.<br>- true: Returns the result in nanoseconds (ns).<br>- false: Returns the result in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The elapsed time from the Unix epoch to the current system time. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. Possible causes: 1. Incorrect parameter types. |

**Example:**

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

**Description:** Retrieves the elapsed time since system boot, excluding deep sleep time.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isNano | Bool | No | false | **Named parameter.** Whether the result is in nanoseconds.<br/>- true: Returns the result in nanoseconds (ns).<br/>- false: Returns the result in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The elapsed time since system boot, excluding deep sleep time. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. Possible causes: 1. Incorrect parameter types. |

**Example:**

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

**Description:** Retrieves the elapsed time since system boot, including deep sleep time.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isNano | Bool | No | false | **Named parameter.** Whether the result is in nanoseconds.<br/>- true: Returns the result in nanoseconds (ns).<br/>- false: Returns the result in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The elapsed time since system boot, including deep sleep time. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. Possible causes: 1. Incorrect parameter types. |

**Example:**

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

**Description:** Retrieves the elapsed time since the Unix epoch.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| isNano | Bool | No | false | **Named parameter.** Whether the result is in nanoseconds.<br>- true: Returns the result in nanoseconds (ns).<br>- false: Returns the result in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The elapsed time since the Unix epoch. |

**Example:**

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

**Description:** Retrieves the system timezone.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | Returns the system timezone. For details, see [Supported System Timezones](#Supported-System-Timezones). |

**Example:**

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

**Description:** Retrieves the elapsed time since system boot.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| timeType | [TimeType](#enum-timetype) | Yes | - | The type of time to retrieve. |
| isNano | Bool | No | false | **Named parameter.** Whether the result is in nanoseconds.<br/>- true: Returns the result in nanoseconds (ns).<br/>- false: Returns the result in milliseconds (ms). |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | The elapsed time since system boot. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

| Error Code ID | Error Message |
|:----|:---|
| 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types; 3. Parameter verification failed. This error code was added due to missing issues. |

**Example:**

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

**Function:** Defines enumeration types for time retrieval.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

### ACTIVE

```cangjie
ACTIVE
```

**Function:** Milliseconds elapsed since system startup, excluding deep sleep time.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

### STARTUP

```cangjie
STARTUP
```

**Function:** Milliseconds elapsed since system startup, including deep sleep time.

**System Capability:** SystemCapability.MiscServices.Time

**Since:** 21

## Supported System Time Zones

The following table shows supported system time zones and their offsets (in hours) relative to UTC+0.

| Time Zone                      | Offset (h)    |
| :----------------------------- | :------------ |
| Antarctica/McMurdo             | 12            |
| America/Argentina/Buenos_Aires | -3            |
| Australia/Sydney               | 10            |
| America/Noronha                | -2            |
| America/St_Johns               | -3            |
| Africa/Kinshasa                | 1             |
| America/Santiago               | -3            |
| Asia/Shanghai                  | 8             |
| Asia/Nicosia                   | 3             |
| Europe/Berlin                  | 2             |
| America/Guayaquil              | -5            |
| Europe/Madrid                  | 2             |
| Pacific/Pohnpei                | 11            |
| America/Godthab                | -2            |
| Asia/Jakarta                   | 7             |
| Pacific/Tarawa                 | 12            |
| Asia/Almaty                    | 6             |
| Pacific/Majuro                 | 12            |
| Asia/Ulaanbaatar               | 8             |
| America/Mexico_City            | -5            |
| Asia/Kuala_Lumpur              | 8             |
| Pacific/Auckland               | 12            |
| Pacific/Tahiti                 | -10           |
| Pacific/Port_Moresby           | 10            |
| Asia/Gaza                      | 3             |
| Europe/Lisbon                  | 1             |
| Europe/Moscow                  | 3             |
| Europe/Kiev                    | 3             |
| Pacific/Wake                   | 12            |
| America/New_York               | -4            |
| Asia/Tashkent                  | 5             |