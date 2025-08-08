# ohos.hilog (HiLog Logging)

The hilog logging system enables applications/services to output log content with specified levels, identifiers, and format strings, helping developers understand the operational status of applications/services and debug programs more effectively.

## Import Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the first line of sample code contains a "// index.cj" comment, it indicates that the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the above sample project and configuration template, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#Cangjie-Sample-Code-Instructions).

## class Hilog

```cangjie
public class Hilog {}
```

**Description:** The logging system object that enables applications/services to output log content with specified levels, identifiers, and format strings. Provides logging methods for different levels: DEBUG, INFO, WARN, ERROR, and FATAL.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

### static func debug(UInt32, String, String)

```cangjie
public static func debug(domain: UInt32, tag: String, format: String): Unit
```

**Description:** Prints DEBUG-level logs.

DEBUG-level logs are not printed by default in official release versions; they are only printed in debug versions or when the debug switch is enabled.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| format    | String  | Yes      | -       | The format string for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.debug(0, "hilog_test", "Debug: Hello world!")
```

### static func error(UInt32, String, String)

```cangjie
public static func error(domain: UInt32, tag: String, format: String): Unit
```

**Description:** Prints ERROR-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| format    | String  | Yes      | -       | The format string for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.error(0, "hilog_test", "Error: Hello world!")
```

### static func fatal(UInt32, String, String)

```cangjie
public static func fatal(domain: UInt32, tag: String, format: String): Unit
```

**Description:** Prints FATAL-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| format    | String  | Yes      | -       | The format string for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.fatal(0, "hilog_test", "Fatal: Hello world!")
```

### static func info(UInt32, String, String)

```cangjie
public static func info(domain: UInt32, tag: String, format: String): Unit
```

**Description:** Prints INFO-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| format    | String  | Yes      | -       | The format string for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.info(0, "hilog_test", "Info: Hello world!")
```

### static func isLoggable(UInt32, String, LogLevel)

```cangjie
public static func isLoggable(domain: UInt32, tag: String, level: LogLevel): Bool
```

**Description:** Calls this interface before printing logs to check whether logs with the specified domain identifier, log identifier, and level can be printed.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type      | Required | Default | Description |
|:----------|:----------|:---------|:--------|:------------|
| domain    | UInt32    | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String    | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| level     | LogLevel  | Yes      | -       | The log level. |

**Return Value:**

| Type | Description |
|:-----|:------------|
| Bool | Returns `true` if logs with the specified domain identifier, log identifier, and level can be printed; otherwise, returns `false`. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.isLoggable(0, "hilog_test", LogLevel.DEBUG)
```

### static func warn(UInt32, String, String)

```cangjie
public static func warn(domain: UInt32, tag: String, format: String): Unit
```

**Description:** Prints WARN-level logs.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |
| format    | String  | Yes      | -       | The format string for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

Hilog.warn(0, "hilog_test", "Warn: Hello world!")
```

## class HilogChannel

```cangjie
public class HilogChannel {
    public init(ty: UInt32, domain: UInt32, tag: String)
}
```

**Description:** The logging system object that enables applications/services to output log content with specified levels, identifiers, and format strings. Provides logging methods for different levels: DEBUG, INFO, WARN, ERROR, and FATAL. Supports constructing custom logging system objects by specifying the log type, business domain, and log identifier.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

### init(UInt32, UInt32, String)

```cangjie
public init(ty: UInt32, domain: UInt32, tag: String)
```

**Description:** Constructor for HilogChannel.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type    | Required | Default | Description |
|:----------|:--------|:---------|:--------|:------------|
| ty        | UInt32  | Yes      | -       | The log type. |
| domain    | UInt32  | Yes      | -       | The domain identifier for the log, ranging from 0x0 to 0xFFFF. It is recommended that developers customize the division as needed within the application. |
| tag       | String  | Yes      | -       | The log identifier, which can be any string. It is recommended to use it to identify the calling class or business behavior. |

### func debug\<T>(T) where T <: ToString

```cangjie
public func debug<T>(message: T): Unit where T <: ToString
```

**Description:** Prints DEBUG-level logs.

DEBUG-level logs are not printed by default in official release versions; they are only printed in debug versions or when the debug switch is enabled.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:----------|:-----|:---------|:--------|:------------|
| message   | T    | Yes      | -       | Type T must implement the ToString interface for log output formatting. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*
let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.debug("Debug: Hello world!")
```

### func error\<T>(T) where T <: ToString

```cangjie
public func error<T>(message: T): Unit where T <: ToString
```

**Function:** Prints logs at ERROR level.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | T | Yes | - | Type T must implement the ToString interface for formatted log output. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.error("Error: Hello world!")
```

### func fatal\<T>(T) where T <: ToString

```cangjie
public func fatal<T>(message: T): Unit where T <: ToString
```

**Function:** Prints logs at FATAL level.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | T | Yes | - | Type T must implement the ToString interface for formatted log output. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.fatal("Fatal: Hello world!")
```

### func info\<T>(T) where T <: ToString

```cangjie
public func info<T>(message: T): Unit where T <: ToString
```

**Function:** Prints logs at INFO level.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | T | Yes | - | Type T must implement the ToString interface for formatted log output. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.info("Info: Hello world!")
```

### func isLoggable(UInt32)

```cangjie
public func isLoggable(level: UInt32): Bool
```

**Function:** Checks whether logs with the specified domain ID, log tag, and level can be printed before logging.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| level | UInt32 | Yes | - | Log level. |

**Return Value:**

| Type | Description |
|:----|:----|
| Bool | Returns true if logs with the specified domain ID, log tag, and level can be printed; otherwise, returns false. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.isLoggable(0)
```

### func warn\<T>(T) where T <: ToString

```cangjie
public func warn<T>(message: T): Unit where T <: ToString
```

**Function:** Prints logs at WARN level.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| message | T | Yes | - | Type T must implement the ToString interface for formatted log output. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let testLog = HilogChannel(0, 0xD001200, "CJ-Test")
testLog.warn("Warn: Hello world!")
```

## enum LogLevel

```cangjie
public enum LogLevel {
    | DEBUG
    | INFO
    | WARN
    | ERROR
    | FATAL
    | ...
}
```

**Function:** Log levels.

**System Capability:** SystemCapability.HiviewDFX.HiLog

**Since:** 21

### DEBUG

```cangjie
DEBUG
```

**Function:** Detailed process records. Logs at this level allow for more detailed analysis of business processes and issue troubleshooting.

**Since:** 21

### ERROR

```cangjie
ERROR
```

**Function:** Indicates that an error has occurred in the application, affecting normal functionality or user experience. The error can be recovered from but at a high cost, such as data reset.

**Since:** 21

### FATAL

```cangjie
FATAL
```

**Function:** Indicates a critical fatal exception, meaning the application is about to crash and the failure cannot be recovered from.

**Since:** 21

### INFO

```cangjie
INFO
```

**Function:** Used to record key business process nodes, enabling the reconstruction of main business operations.

Also used to record expected abnormal situations, such as no network signal or login failures.

These logs should be recorded by the dominant module within the business to avoid duplicate logging across multiple called modules or low-level functions.

**Since:** 21

### WARN

```cangjie
WARN
```

**Function:** Used to record relatively severe unexpected situations that have minimal impact on users. The application can recover automatically or through simple user actions.

**Since:** 21