# ohos.hilog (HiLog Printing)

The hilog logging system enables applications/services to output log content with specified levels, tags, and format strings, helping developers understand the operational status of applications/services and debug programs more effectively.

## Importing the Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates that the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## class Hilog

```cangjie
public class Hilog {}
```

**Function:** Logging system object that enables applications/services to output log content with specified levels, tags, and format strings. Provides logging methods for different levels: DEBUG, INFO, WARN, ERROR, and FATAL.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### static func debug(UInt32, String, String, Array\<String>)

```cangjie
public static func debug(domain: UInt32, tag: String, format: String, args: Array<String>): Unit
```

**Function:** Prints DEBUG-level logs.

DEBUG-level logs are not printed by default in official release versions. They are only printed in debug versions or when the debug switch is enabled.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| format | String | Yes | - | Format string for log output formatting. |
| args | Array\<String> | Yes | - | Arguments for the format string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.debug(0, "testTag", "Debug: Hello world!")
```

### static func error(UInt32, String, String, Array\<String>)

```cangjie
public static func error(domain: UInt32, tag: String, format: String, args: Array<String>): Unit
```

**Function:** Prints ERROR-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| format | String | Yes | - | Format string for log output formatting. |
| args | Array\<String> | Yes | - | Arguments for the format string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.error(0, "testTag", "Error: Hello world!")
```

### static func fatal(UInt32, String, String, Array\<String>)

```cangjie
public static func fatal(domain: UInt32, tag: String, format: String, args: Array<String>): Unit
```

**Function:** Prints FATAL-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| format | String | Yes | - | Format string for log output formatting. |
| args | Array\<String> | Yes | - | Arguments for the format string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.fatal(0, "testTag", "Fatal: Hello world!")
```

### static func info(UInt32, String, String, Array\<String>)

```cangjie
public static func info(domain: UInt32, tag: String, format: String, args: Array<String>): Unit
```

**Function:** Prints INFO-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| format | String | Yes | - | Format string for log output formatting. |
| args | Array\<String> | Yes | - | Arguments for the format string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.info(0, "testTag", "Info: Hello world!")
```

### static func isLoggable(UInt32, String, LogLevel)

```cangjie
public static func isLoggable(domain: UInt32, tag: String, level: LogLevel): Bool
```

**Function:** Calls this interface before printing logs to check whether logs with the specified domain identifier, tag, and level can be printed.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| level | [LogLevel](#enum-loglevel) | Yes | - | Log level. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if logs with the specified domain identifier, tag, and level can be printed; otherwise, returns false. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.isLoggable(0, "testTag", LogLevel.Debug)
```

### static func warn(UInt32, String, String, Array\<String>)

```cangjie
public static func warn(domain: UInt32, tag: String, format: String, args: Array<String>): Unit
```

**Function:** Prints WARN-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | UInt32 | Yes | - | Domain identifier for the log, ranging from 0x0 to 0xFFFF.<br/>Developers are advised to customize the division as needed within the application. |
| tag | String | Yes | - | Specifies the log tag, which can be any string. It is recommended to identify the calling class or business behavior. |
| format | String | Yes | - | Format string for log output formatting. |
| args | Array\<String> | Yes | - | Arguments for the format string. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.warn(0, "testTag", "Warn: Hello world!")
```

## enum LogLevel

```cangjie
public enum LogLevel {
    | Debug
    | Info
    | Warning
    | Error
    | Fatal
    | ...
}
```

**Function:** Log levels.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### Debug

```cangjie
Debug
```

**Function:** Detailed process records. Logs at this level allow for more detailed analysis of business processes and issue troubleshooting.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### Error

```cangjie
Error
```

**Function:** Indicates that an error has occurred in the application, which affects normal functionality or user experience. The error can be recovered but at a high cost, such as data reset.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### Fatal

```cangjie
Fatal
```

**Function:** Indicates a critical fatal exception, signaling that the application is about to crash and the fault cannot be recovered.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### Info

```cangjie
Info
```

**Function:** Used to record key business process nodes, enabling the reconstruction of the main operational flow of the business.

Also used to record expected abnormal conditions, such as no network signal or login failure.

These logs should be recorded by the dominant module within the business to avoid duplicate logging in multiple called modules or low-level functions.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21

### Warning

```cangjie
Warning
```

**Function:** Used to record more severe unexpected conditions that have minimal impact on users. The application can recover automatically or through simple operations.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Initial Version:** 21