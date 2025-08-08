# ohos.hiappevent (Application Event Logging)

This module provides application event logging capabilities, including application event persistence, event subscription, event cleanup, and logging configuration.

## Import Module

```cangjie
import kit.PerformanceAnalysisKit.*
```

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, it needs to be configured in the "main_ability.cj" file of the Cangjie template project.

For details about the aforementioned sample projects and configuration templates, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## class AppEventPackage

```cangjie
public class AppEventPackage {
    public let packageId: Int32
    public let row: Int32
    public let size: Int32
    public let data: Array<String>
    public init(packageId: Int32, row: Int32, size: Int32, data: Array<String>)
}
```

**Description:** Provides parameter definitions for subscribed application event packages.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let data

```cangjie
public let data: Array<String>
```

**Description:** Event information within the event package.

**Type:** Array\<String>

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let packageId

```cangjie
public let packageId: Int32
```

**Description:** Event package ID, auto-incremented starting from 0.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let row

```cangjie
public let row: Int32
```

**Description:** Number of events in the event package.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let size

```cangjie
public let size: Int32
```

**Description:** Size of events in the event package, in bytes.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### init(Int32, Int32, Int32, Array\<String>)

```cangjie
public init(packageId: Int32, row: Int32, size: Int32, data: Array<String>)
```

**Description:** Creates an [AppEventPackage](#class-appeventpackage) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| packageId | Int32 | Yes | - | Event package ID, auto-incremented starting from 0. |
| row | Int32 | Yes | - | Number of events in the event package. |
| size | Int32 | Yes | - | Size of events in the event package, in bytes. |
| data | Array\<String> | Yes | - | Event information within the event package. |

## class AppEventPackageHolder

```cangjie
public class AppEventPackageHolder {}
```

**Description:** Subscription data holder class for processing subscribed events.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### static func constructor(String)

```cangjie
public static func constructor(watcherName: String): AppEventPackageHolder
```

**Description:** Class constructor that creates a subscription data holder instance, associating it with an existing watcher object within the application via the watcher name.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| watcherName | String | Yes | - | Watcher name. |

**Return Value:**

| Type | Description |
|:----|:----|
| [AppEventPackageHolder](#class-appeventpackageholder) | Subscription data holder class object. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let holder = AppEventPackageHolder.constructor("watcher1")
```

### func setSize(Int32)

```cangjie
public func setSize(size!: Int32 = 512 * 1024): Unit
```

**Description:** Sets the data size threshold for each retrieved application event package.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| size | Int32 | No | 512 * 1024 | **Named parameter.** Data size threshold in bytes. Value must be ≥0. Out-of-range values will throw an exception. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Application Event Logging Error Codes](../../errorcodes/cj-errorcode-hiappevent.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 11104001 | Invalid size value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let holder = AppEventPackageHolder.constructor("watcher2")
holder.setSize(size: 100)
```

### func takeNext()

```cangjie
public func takeNext(): Option<AppEventPackage>
```

**Description:** Retrieves subscribed event data based on the set data size threshold. Returns None when all subscribed event data has been retrieved.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[AppEventPackage](#class-appeventpackage)> | Retrieved event package object. Returns None when all subscribed event data has been retrieved. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

let holder = AppEventPackageHolder.constructor("watcher3")
if (let Some(v) <- holder.takeNext()) {
    let eventPkg = v
    Hilog.info(0, "HiAppEnvent", "HiAppEvent packageId=${eventPkg.packageId}")
    Hilog.info(0, "HiAppEnvent", "HiAppEvent row=${eventPkg.row}")
    Hilog.info(0, "HiAppEnvent", "HiAppEvent size=${eventPkg.size}")
}
```

## class HiAppEvent

```cangjie
public class HiAppEvent {}
```

**Description:** This class provides application event logging capabilities.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### static func addProcessor(Processor)

```cangjie
public static func addProcessor(processor: Processor): Int64
```

**Description:** Developers can add data processors, which are used to provide event cloud reporting functionality. The implementation of data processors can be pre-installed on devices. Developers can set properties according to the constraints of the data processors.

The configuration information for Processor needs to be provided by the data processor. Currently, no interactive data processors are pre-installed on devices, so the event cloud reporting feature is currently unavailable.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| processor | [Processor](#class-processor) | Yes | - | Data processor for reporting events. |

**Return Value:**

| Type | Description |
|:----|:----|
| Int64 | ID of the added event reporting data processor. Returns -1 if addition fails, or a value >0 if successful. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj
import ohos.base.*
import kit.PerformanceAnalysisKit.*

var processor : Processor = Processor("test_processor")
let processorId = HiAppEvent.addProcessor(processor)
Hilog.info(0, "HiAppEvent", "HiAppEvent::processorId is ${processorId}.")
```

### static func addWatcher(Watcher)

```cangjie
public static func addWatcher(watcher: Watcher): Option<AppEventPackageHolder>
```

**Function:** Adds an application event watcher method, which can be used to subscribe to application events.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| watcher | [Watcher](#struct-watcher) | Yes | - | Application event watcher. |

**Return Value:**

| Type | Description |
|:----|:----|
| Option\<[AppEventPackageHolder](#class-appeventpackageholder)> | Subscription data holder. Returns None if subscription fails. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Application Event Logging Error Codes](../../errorcodes/cj-errorcode-hiappevent.md) and [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types. |
  | 11102001 | Invalid watcher name. |
  | 11102002 | Invalid filtering event domain. |
  | 11102003 | Invalid row value. |
  | 11102004 | Invalid size value. |
  | 11102005 | Invalid timeout value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

func f1(){
    // If the watcher passes callback-related parameters, you can choose to process subscribed events in the automatically triggered callback function
    var condition = TriggerCondition(row: 1)
    var appEventFilter = [AppEventFilter("button")]
    var watcher = Watcher("watcher1", triggerCondition: condition,
        onTrigger:  Some({ row, size, holder =>
            Hilog.info(0, "HiAppEnvent", "HiAppEvent onTrigger: curRow=${row}, curSize=${size}")
            while (let Some(v) <- holder.takeNext()) {
                let eventPkg = v
                Hilog.info(0, "HiAppEnvent", "HiAppEvent packageId=${eventPkg.packageId}")
                Hilog.info(0, "HiAppEnvent", "HiAppEvent row=${eventPkg.row}")
                Hilog.info(0, "HiAppEnvent", "HiAppEvent size=${eventPkg.size}")
                for (i in 0..eventPkg.data.size) {
                    Hilog.info(0, "HiAppEnvent", "HiAppEvent info=${eventPkg.data[i]}")
                }
             }
     }))
     HiAppEvent.addWatcher(watcher)
}

func f2(){
    // If the watcher does not pass callback-related parameters, you can choose to manually process subscribed events using the returned holder object
    let watcher =  Watcher("watcher2")
    let holder = HiAppEvent.addWatcher(watcher)
    if (let Some(v1) <- holder) {
       while (let Some(v2) <- v1.takeNext()) {
            let eventPkg = v2
            Hilog.info(0, "test_hiAppEvent_addWatcher", "HiAppEvent packageId=${eventPkg.packageId}")
            Hilog.info(0, "test_hiAppEvent_addWatcher", "HiAppEvent row=${eventPkg.row}")
            Hilog.info(0, "test_hiAppEvent_addWatcher", "HiAppEvent size=${eventPkg.size}")
            for (i in 0..eventPkg.data.size) {
                Hilog.info(0, "test_hiAppEvent_addWatcher", "HiAppEvent info=${eventPkg.data[i]}")
            }
        }
     }
}

func f3(){
    // The watcher can process subscribed events in the real-time callback function onReceive
    var condition = TriggerCondition(row: 1, size: 100)
    let watcher= Watcher("watcher", triggerCondition: condition,
             onTrigger: {row, size, holder =>
                Hilog.info(0, "HiAppEnvent", "HiAppEvent onTrigger: curRow=${row}, curSize=${size}")},
             onReceive: {domain, AppEventGroups =>
                Hilog.info(0, "HiAppEnvent", "domain =${domain}")
                let groupSize = AppEventGroups.size
                for (i in 0..groupSize) {
                    Hilog.info(0, "HiAppEnvent", "name =${AppEventGroups[i].name}")
                    let appInfosize = AppEventGroups[i].appEventInfos.size
                    for (j in 0..appInfosize) {
                        Hilog.info(0, "HiAppEnvent", "appEventInfo name=${AppEventGroups[i].appEventInfos[j].name}")
                        Hilog.info(0, "HiAppEnvent", "appEventInfo domain=${AppEventGroups[i].appEventInfos[j].domain}")
                        Hilog.info(0, "HiAppEnvent", "appEventInfo event=${AppEventGroups[i].appEventInfos[j].event.value}")
                        let paSize = AppEventGroups[i].appEventInfos[j].params.size
                        for (k in 0..paSize) {
                            Hilog.info(0, "HiAppEnvent", "key=${AppEventGroups[i].appEventInfos[j].params[k].key}")
                            let value = AppEventGroups[i].appEventInfos[j].params[k].value.value
                            Hilog.info(0, "HiAppEnvent", "value=${value}")
                        }
                    }
                }
            })
    HiAppEvent.addWatcher(watcher)
}

f1()
f2()
f3()
```

### static func clearData()

```cangjie
public static func clearData(): Unit
```

**Function:** Clears locally stored application event logging data.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

var params: Array<Parameters> = [Parameters("cangjie", INT(1001)), Parameters("cangjie2", STRING("1001"))]
var appInfo: AppEventInfo = AppEventInfo("cangjie1", "test_event", EventType.FAULT, params)
HiAppEvent.write(appInfo)
HiAppEvent.clearData()
```

### static func configure(ConfigOption)

```cangjie
public static func configure(config: ConfigOption): Unit
```

**Function:** Configures application event logging, including enabling/disabling logging and setting storage quota size.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| config | [ConfigOption](#struct-configoption) | Yes | - | Application event logging configuration object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Application Event Logging Error Codes](../../errorcodes/cj-errorcode-hiappevent.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 11103001 | Invalid max storage quota value. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

var config : ConfigOption = ConfigOption("100M", disable: true)
HiAppEvent.configure(config)
Hilog.info(0, "HiAppEvent", "HiAppEvent::configure.")
```

### static func getUserId(String)

```cangjie
public static func getUserId(name: String): String
```

**Function:** Retrieves the value previously set via the [setUserId](#static-func-setuseridstring-string) interface.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Key for the user ID. Can only contain letters, numbers, underscores, and $, cannot start with a number, and must be no longer than 256 characters. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Value of the user ID. Returns an empty string if not found. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

HiAppEvent.setUserId("test_getUserId_name", "test_getUserId_value")
let userIdName = HiAppEvent.getUserId("test_getUserId_name")
Hilog.info(0, "HiAppEvent", "HiAppEvent::test_getUserId is ${userIdName}.")
```

### static func getUserProperty(String)

```cangjie
public static func getUserProperty(name: String): String
```

**Function:** Retrieves the value previously set via the [setUserProperty](#static-func-setuserpropertystring-string) interface.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Key for the user property. Can only contain letters, numbers, underscores, and $, cannot start with a number, and must be no longer than 256 characters. |

**Return Value:**

| Type | Description |
|:----|:----|
| String | Value of the user property. Returns an empty string if not found. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:---|:---|
  | 401 | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

HiAppEvent.setUserProperty("test_setUserProperty_name", "test_setUserProperty_value")
let propertyName = HiAppEvent.getUserProperty("test_getUserProperty_name")
Hilog.info(0, "HiAppEvent", "HiAppEvent::test_getUserProperty is ${propertyName}.")
```

### static func removeProcessor(Int64)

```cangjie
public static func removeProcessor(id: Int64): Unit
```

**Function:** Removes the data processor for event reporting.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21**Parameters:**

| Parameter Name | Type    | Required | Default Value | Description |
|:---------------|:--------|:---------|:--------------|:------------|
| id             | Int64   | Yes      | -             | The ID of the event data processor. Must be greater than 0. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Common Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:-------------|
  | 401          | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

var processor : Processor = Processor("test_processor")
let processorId = HiAppEvent.addProcessor(processor)
HiAppEvent.removeProcessor(processorId)
Hilog.info(0, "HiAppEvent", "HiAppEvent::removeProcessor test over.")
```

### static func removeWatcher(Watcher)

```cangjie
public static func removeWatcher(watcher: Watcher): Unit
```

**Function:** Removes an application event watcher, which can be used to unsubscribe from application events.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type               | Required | Default Value | Description |
|:---------------|:-------------------|:---------|:--------------|:------------|
| watcher        | [Watcher](#struct-watcher) | Yes      | -             | The application event watcher. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Application Event Logging Error Codes](../../errorcodes/cj-errorcode-hiappevent.md).

  | Error Code ID | Error Message |
  |:-------------|:-------------|
  | 11102001     | Invalid watcher name. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

// Define an application event watcher
let watcher= Watcher("watcher1")
// Add the watcher to subscribe to events
HiAppEvent.addWatcher(watcher)
// Remove the watcher to unsubscribe from events
HiAppEvent.removeWatcher(watcher)
```

### static func setUserId(String, String)

```cangjie
public static func setUserId(name: String, value: String): Unit
```

**Function:** Sets the user ID.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type    | Required | Default Value | Description |
|:---------------|:--------|:---------|:--------------|:------------|
| name           | String  | Yes      | -             | The key of the user ID. Can only contain letters (uppercase and lowercase), digits, underscores, and $. Cannot start with a digit. Must be non-empty and no longer than 256 characters. |
| value          | String  | Yes      | -             | The value of the user ID. Must be no longer than 256 characters. If the value is null or an empty string, the user ID will be cleared. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Common Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:-------------|
  | 401          | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

HiAppEvent.setUserId("test_userID_name", "test_userID_value")
```

### static func setUserProperty(String, String)

```cangjie
public static func setUserProperty(name: String, value: String): Unit
```

**Function:** Sets a user property.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type    | Required | Default Value | Description |
|:---------------|:--------|:---------|:--------------|:------------|
| name           | String  | Yes      | -             | The key of the user property. Can only contain letters (uppercase and lowercase), digits, underscores, and $. Cannot start with a digit. Must be non-empty and no longer than 256 characters. |
| value          | String  | Yes      | -             | The value of the user property. Must be no longer than 1024 characters. If the value is null or an empty string, the user property will be cleared. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Common Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:-------------|:-------------|
  | 401          | Parameter error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

HiAppEvent.setUserProperty("test_setUserProperty_name", "test_setUserProperty_value")
```

### static func write(AppEventInfo)

```cangjie
public static func write(info: AppEventInfo): Unit
```

**Function:** Logs an application event, writing it to the daily event file. Accepts an event object of type [AppEventInfo](#struct-appeventinfo).

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type                     | Required | Default Value | Description |
|:---------------|:-------------------------|:---------|:--------------|:------------|
| info           | [AppEventInfo](#struct-appeventinfo) | Yes      | -             | The application event object. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Application Event Logging Error Codes](../../errorcodes/cj-errorcode-hiappevent.md).

  | Error Code ID | Error Message |
  |:-------------|:-------------|
  | 11100001     | Function is disabled. |
  | 11101001     | Invalid event domain. |
  | 11101002     | Invalid event name. |
  | 11101003     | Invalid number of event parameters. |
  | 11101004     | Invalid string length of the event parameter. |
  | 11101005     | Invalid event parameter name. |
  | 11101006     | Invalid array length of the event parameter. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

var params: Array<Parameters> = [Parameters("int_data", INT(100)), Parameters("str_data", STRING("strValue"))]
var appInfo : AppEventInfo = AppEventInfo("test_domain", "test_event", EventType.FAULT, params)
HiAppEvent.write(appInfo)
```

## class Processor

```cangjie
public class Processor {
    public let name: String
    public let debugMode: Bool
    public let routeInfo: String
    public let appId: String
    public let onStartReport: Bool
    public let onBackgroundReport: Bool
    public let periodReport: Int64
    public let batchReport: Int64
    public let userIds: Array<String>
    public let userProperties: Array<String>
    public let eventConfigs: Array<AppEventReportConfig>
    public init(name: String, debugMode!: Bool = false, routeInfo!: String = "", appId!: String = "",
        onStartReport!: Bool = false, onBackgroundReport!: Bool = false, periodReport!: Int64 = 0,
        batchReport!: Int64 = 0, userIds!: Array<String> = [], userProperties!: Array<String> = [],
        eventConfigs!: Array<AppEventReportConfig> = [])
}
```

**Function:** An object that can report event data.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let appId

```cangjie
public let appId: String
```

**Function:** The application ID, default is an empty string. The input string must not exceed 8KB; otherwise, it will be set to the default value.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let batchReport

```cangjie
public let batchReport: Int64
```

**Function:** The threshold for event reporting. Events are reported when the number of events reaches this threshold. The input value must be greater than 0 and less than 1000. Values outside this range will be set to the default value of 0, and no reporting will occur.

**Type:** Int64

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let debugMode

```cangjie
public let debugMode: Bool
```

**Function:** Whether debug mode is enabled. The default value is false. A value of true enables debug mode, while false disables it.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let eventConfigs

```cangjie
public let eventConfigs: Array<AppEventReportConfig>
```

**Function:** An array of events that the processor can report.

**Type:** Array\<[AppEventReportConfig](#struct-appeventreportconfig)>

**Access:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let name

```cangjie
public let name: String
```
**Function:** The name of the data processor. The name can only contain uppercase and lowercase letters, numbers, underscores, and $, cannot start with a number, and must be non-empty with a length not exceeding 256 characters.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let onBackgroundReport

```cangjie
public let onBackgroundReport: Bool
```

**Function:** Whether to report events when the application enters the background. The default value is false. A value of true indicates reporting events, while false indicates not reporting events.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let onStartReport

```cangjie
public let onStartReport: Bool
```

**Function:** Whether the data processor reports events upon startup. The default value is false. A value of true indicates reporting events, while false indicates not reporting events.

**Type:** Bool

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let periodReport

```cangjie
public let periodReport: Int64
```

**Function:** The periodic event reporting interval in seconds. The input value must be greater than or equal to 0. If the value is less than 0, it will be reset to the default value of 0, and periodic reporting will not occur.

**Type:** Int64

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let routeInfo

```cangjie
public let routeInfo: String
```

**Function:** Server location information. The default is an empty string. The input string length must not exceed 8KB; if it does, it will be reset to the default value.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let userIds

```cangjie
public let userIds: Array<String>
```

**Function:** An array of user ID names that the data processor can report. The name corresponds to the name parameter in the [setUserId](#static-func-setuseridstring-string) interface.

**Type:** Array\<String>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let userProperties

```cangjie
public let userProperties: Array<String>
```

**Function:** An array of user property names that the data processor can report. The name corresponds to the name parameter in the [setUserProperty](#static-func-setuserpropertystring-string) interface.

**Type:** Array\<String>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### init(String, Bool, String, String, Bool, Bool, Int64, Int64, Array\<String>, Array\<String>, Array\<AppEventReportConfig>)

```cangjie
public init(name: String, debugMode!: Bool = false, routeInfo!: String = "", appId!: String = "",
    onStartReport!: Bool = false, onBackgroundReport!: Bool = false, periodReport!: Int64 = 0,
    batchReport!: Int64 = 0, userIds!: Array<String> = [], userProperties!: Array<String> = [],
    eventConfigs!: Array<AppEventReportConfig> = [])
```

**Function:** Creates a [Processor](#class-processor) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The name of the data processor. The name can only contain uppercase and lowercase letters, numbers, underscores, and $, cannot start with a number, and must be non-empty with a length not exceeding 256 characters. |
| debugMode | Bool | No | false | **Named parameter.** Whether to enable debug mode. The default value is false. A value of true enables debug mode, while false disables it. |
| routeInfo | String | No | "" | **Named parameter.** Server location information. The default is an empty string. The input string length must not exceed 8KB; if it does, it will be reset to the default value. |
| appId | String | No | "" | **Named parameter.** Application ID. The default is an empty string. The input string length must not exceed 8KB; if it does, it will be reset to the default value. |
| onStartReport | Bool | No | false | **Named parameter.** Whether the data processor reports events upon startup. The default value is false. A value of true indicates reporting events, while false indicates not reporting events. |
| onBackgroundReport | Bool | No | false | **Named parameter.** Whether to report events when the application enters the background. The default value is false. A value of true indicates reporting events, while false indicates not reporting events. |
| periodReport | Int64 | No | 0 | **Named parameter.** The periodic event reporting interval in seconds. The input value must be greater than or equal to 0. If the value is less than 0, it will be reset to the default value of 0, and periodic reporting will not occur. |
| batchReport | Int64 | No | 0 | **Named parameter.** The event reporting threshold. Events are reported when the number of events reaches this threshold. The input value must be greater than 0 and less than 1000. If the value is outside this range, it will be reset to the default value of 0, and reporting will not occur. |
| userIds | Array\<String> | No | [] | **Named parameter.** An array of user ID names that the data processor can report. The name corresponds to the name parameter in the [setUserId](#static-func-setuseridstring-string) interface. |
| userProperties | Array\<String> | No | [] | **Named parameter.** An array of user property names that the data processor can report. The name corresponds to the name parameter in the [setUserProperty](#static-func-setuserpropertystring-string) interface. |
| eventConfigs | Array\<[AppEventReportConfig](#struct-appeventreportconfig)> | No | [] | **Named parameter.** An array of events that the data processor can report. |

## struct AppEventFilter

```cangjie
public struct AppEventFilter {
    public let domain: String
    public let eventTypes: Array<EventType>
    public let names: Array<String>
    public init(domain: String, eventTypes!: Array<EventType> = [], names!: Array<String> = [])
}
```

**Function:** Provides parameter options for filtering application events.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let domain

```cangjie
public let domain: String
```

**Function:** The domain of events to subscribe to.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let eventTypes

```cangjie
public let eventTypes: Array<EventType>
```

**Function:** The set of event types to subscribe to.

**Type:** Array\<[EventType](#enum-eventtype)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let names

```cangjie
public let names: Array<String>
```

**Function:** The set of event names to subscribe to.

**Type:** Array\<String>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### init(String, Array\<EventType>, Array\<String>)

```cangjie
public init(domain: String, eventTypes!: Array<EventType> = [], names!: Array<String> = [])
```

**Function:** Creates an [AppEventFilter](#struct-appeventfilter) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| domain | String | Yes | - | The domain of events to subscribe to. |
| eventTypes | Array\<[EventType](#enum-eventtype)> | No | [] | **Named parameter.** The set of event types to subscribe to. |
| names | Array\<String> | No | [] | **Named parameter.** The set of event names to subscribe to. |

## struct AppEventGroup

```cangjie
public struct AppEventGroup {
    public let name: String
    public let appEventInfos: Array<AppEventInfo>
    public init(name: String, appEventInfos: Array<AppEventInfo>)
}
```

**Function:** Provides parameter definitions for the event group returned by subscription.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let appEventInfos

```cangjie
public let appEventInfos: Array<AppEventInfo>
```

**Function:** The collection of event objects.

**Type:** Array\<[AppEventInfo](#struct-appeventinfo)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### let name

```cangjie
public let name: String
```

**Function:** The event name.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### init(String, Array\<AppEventInfo>)

```cangjie
public init(name: String, appEventInfos: Array<AppEventInfo>)
```

**Function:** Creates an [AppEventGroup](#struct-appeventgroup) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | The event name. |
| appEventInfos | Array\<[AppEventInfo](#struct-appeventinfo)> | Yes | - | The collection of event objects. |

## struct AppEventInfo

```cangjie
public struct AppEventInfo {
    public AppEventInfo(
        public let domain: String,
        public let name: String,
        public let event: EventType,
        public let params: Array<Parameters>
    )
}
```


**Function:** Provides parameter options for application event information.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let domain

```cangjie
public let domain: String
```

**Function:** Event domain. The domain name supports digits, letters, and underscores, must start with a letter and cannot end with an underscore, with a non-empty length not exceeding 32 characters.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let event

```cangjie
public let event: EventType
```

**Function:** Event type.

**Type:** [EventType](#enum-eventtype)

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** Event name. The first character must be a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 48 characters.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let params

```cangjie
public let params: Array<Parameters>
```

**Function:** Event parameter object, where each parameter includes a parameter name and value, defined as follows:

- Parameter name is of String type, must start with a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 32 characters.
- Parameter value supports String, Int32, Float64, Bool, and array types. String type parameters must be within 8*1024 characters; array type parameters must contain elements of only one type (String, Int32, Float64, or Bool), with no more than 100 elements.
- No more than 32 parameters are allowed.

**Type:** Array\<[Parameters](#struct-parameters)>

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### AppEventInfo(String, String, EventType, Array\<Parameters>)

```cangjie
public AppEventInfo(
    public let domain: String,
    public let name: String,
    public let event: EventType,
    public let params: Array<Parameters>
)
```

**Function:** Creates an instance of [AppEventInfo](#struct-appeventinfo).

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| domain | String | Yes | - | Event domain. The domain name supports digits, letters, and underscores, must start with a letter and cannot end with an underscore, with a non-empty length not exceeding 32 characters. |
| name | String | Yes | - | Event name. The first character must be a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 48 characters. |
| event | [EventType](#enum-eventtype) | Yes | - | Event type. |
| params | Array\<[Parameters](#struct-parameters)> | Yes | - | Event parameter object, where each parameter includes a parameter name and value, defined as follows:<br>- Parameter name is of String type, must start with a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 32 characters.<br>- Parameter value supports String, Int32, Float64, Bool, and array types. String type parameters must be within 8*1024 characters; array type parameters must contain elements of only one type (String, Int32, Float64, or Bool), with no more than 100 elements.<br>- No more than 32 parameters are allowed. |

## struct AppEventReportConfig

```cangjie
public struct AppEventReportConfig {
    public let domain: String
    public let name: String
    public let isRealTime: Bool
    public init(domain!: String = "", name!: String = "", isRealTime!: Bool = false)
}
```

**Function:** Configuration for reporting events by data processors.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let domain

```cangjie
public let domain: String
```

**Function:** Event domain. The domain name supports digits, letters, and underscores, must start with a letter and cannot end with an underscore, with a non-empty length not exceeding 32 characters.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let isRealTime

```cangjie
public let isRealTime: Bool
```

**Function:** Whether to report events in real time. A value of true indicates real-time reporting, false indicates non-real-time reporting.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** Event name. The first character must be a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 48 characters.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### init(String, String, Bool)

```cangjie
public init(domain!: String = "", name!: String = "", isRealTime!: Bool = false)
```

**Function:** Creates an instance of [AppEventReportConfig](#struct-appeventreportconfig).

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| domain | String | No | "" | **Named parameter.** Event domain. The domain name supports digits, letters, and underscores, must start with a letter and cannot end with an underscore, with a non-empty length not exceeding 32 characters. |
| name | String | No | "" | **Named parameter.** Event name. The first character must be a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 48 characters. |
| isRealTime | Bool | No | false | **Named parameter.** Whether to report events in real time. A value of true indicates real-time reporting, false indicates non-real-time reporting. |

## struct ConfigOption

```cangjie
public struct ConfigOption {
    public let disable: Bool
    public let maxStorage: String
    public ConfigOption(maxStorage: String, disable!: Bool = false)
}
```

**Function:** Provides configuration options for application event logging.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let disable

```cangjie
public let disable: Bool
```

**Function:** Logging function switch, default is false. true: Disable logging, false: Enable logging.

**Type:** Bool

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let maxStorage

```cangjie
public let maxStorage: String
```

**Function:** Quota size for the logging data storage directory, default is "10M".

When the directory size exceeds the quota, the next logging operation triggers a cleanup: files are deleted from oldest to newest until the directory size is within the quota.

Quota string specifications:

- The quota string consists of digits and size units (supported units: [b|k|kb|m|mb|g|gb|t|tb], case-insensitive).
- The quota string must start with a digit, optionally followed by a unit (default unit is byte).

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### ConfigOption(String, Bool)

```cangjie
public ConfigOption(maxStorage: String, disable!: Bool = false)
```

**Function:** Creates an instance of [ConfigOption](#struct-configoption).

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| maxStorage | String | Yes | - | Quota size for the logging data storage directory, default is "10M".<br>When the directory size exceeds the quota, the next logging operation triggers a cleanup: files are deleted from oldest to newest until the directory size is within the quota.<br>Quota string specifications:<br>- The quota string consists of digits and size units (supported units: [b|k|kb|m|mb|g|gb|t|tb], case-insensitive).<br>- The quota string must start with a digit, optionally followed by a unit (default unit is byte). |
| disable | Bool | No | false | **Named parameter.** Logging function switch, default is false. true: Disable logging, false: Enable logging. |

## struct Parameters

```cangjie
public struct Parameters {
    public Parameters(
        public let key: String,
        public let value: ValueType
    )
}
```

**Function:** Event parameter object for [AppEventInfo](#struct-appeventinfo).

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let key

```cangjie
public let key: String
```

**Function:** Event parameter name, must start with a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter, with a non-empty length not exceeding 32 characters.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Initial Version:** 21

### let value

```cangjie
public let value: ValueType
```

**Function:** Event parameter value. For String type parameters, the length must be within 8*1024 characters. For Array type parameters, the number of elements must be within 100. Exceeding values will be discarded.

**Type:** [ValueType](#enum-valuetype)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### Parameters(String, ValueType)

```cangjie
public Parameters(
    public let key: String,
    public let value: ValueType
)
```

**Function:** Creates a [Parameters](#struct-parameters) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| key | String | No | - | Event parameter name. The first character must be a letter or $, middle characters must be digits, letters, or underscores, and the last character must be a digit or letter. The length must be non-empty and not exceed 32 characters. |
| value | [ValueType](#enum-valuetype) | No | - | Event parameter value. For String type parameters, the length must be within 8*1024 characters. For Array type parameters, the number of elements must be within 100. Exceeding values will be discarded. |

## struct TriggerCondition

```cangjie
public struct TriggerCondition {
    public let row: Int32
    public let size: Int32
    public let timeOut: Int32
    public init(row!: Int32 = 0, size!: Int32 = 0, timeOut!: Int32 = 0)
}
```

**Function:** Provides parameter options for callback trigger conditions. Any condition being met will trigger the subscription callback.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let row

```cangjie
public let row: Int32
```

**Function:** The total number of events required to trigger the callback (positive integer). Default is 0, meaning no callback is triggered. Negative values will be reset to the default.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let size

```cangjie
public let size: Int32
```

**Function:** The total size of events required to trigger the callback (positive integer, unit: byte). Default is 0, meaning no callback is triggered. Negative values will be reset to the default.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let timeOut

```cangjie
public let timeOut: Int32
```

**Function:** The timeout duration required to trigger the callback (positive integer, unit: 30s). Default is 0, meaning no callback is triggered. Negative values will be reset to the default.

**Type:** Int32

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### init(Int32, Int32, Int32)

```cangjie
public init(row!: Int32 = 0, size!: Int32 = 0, timeOut!: Int32 = 0)
```

**Function:** Creates a [TriggerCondition](#struct-triggercondition) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| row | Int32 | No | 0 | **Named parameter.** The total number of events required to trigger the callback (positive integer). Default is 0, meaning no callback is triggered. Negative values will be reset to the default. |
| size | Int32 | No | 0 | **Named parameter.** The total size of events required to trigger the callback (positive integer, unit: byte). Default is 0, meaning no callback is triggered. Negative values will be reset to the default. |
| timeOut | Int32 | No | 0 | **Named parameter.** The timeout duration required to trigger the callback (positive integer, unit: 30s). Default is 0, meaning no callback is triggered. Negative values will be reset to the default. |

## struct Watcher

```cangjie
public struct Watcher {
    public let name: String
    public let triggerCondition: TriggerCondition
    public let appEventFilters: Array<AppEventFilter>
    public let onTrigger: Option <(Int32, Int32, AppEventPackageHolder) -> Unit>
    public let onReceive: Option <(String, Array<AppEventGroup>) -> Unit>
    public init(name: String, triggerCondition!: TriggerCondition = TriggerCondition(),
        appEventFilters!: Array<AppEventFilter> = [],
        onTrigger!: Option<(Int32, Int32, AppEventPackageHolder) -> Unit> = None,
        onReceive!: Option<(String, Array<AppEventGroup>) -> Unit> = None)
}
```

**Function:** Provides parameter options for application event watchers.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let appEventFilters

```cangjie
public let appEventFilters: Array<AppEventFilter>
```

**Function:** Subscription filter conditions, used when filtering subscribed events is required.

**Type:** Array\<[AppEventFilter](#struct-appeventfilter)>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let name

```cangjie
public let name: String
```

**Function:** Watcher name, used to uniquely identify the watcher.

**Type:** String

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let onReceive

```cangjie
public let onReceive: Option<(String, Array<AppEventGroup>) -> Unit>
```

**Function:** Real-time subscription callback function. If both this and the `onTrigger` callback exist, only this callback will be triggered. The first parameter of the callback function represents the domain name of the callback event, and the second parameter represents the collection of callback events.

**Type:** Option\<(String, Array\<[AppEventGroup](#struct-appeventgroup)>) -> Unit>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let onTrigger

```cangjie
public let onTrigger: Option <(Int32, Int32, AppEventPackageHolder) -> Unit>
```

**Function:** Subscription callback function, which takes effect only when used with the `triggerCondition`. The first parameter of the callback function represents the total number of subscribed events at the time of callback triggering. The second parameter represents the total size of subscribed events at the time of callback triggering (unit: byte). The third parameter represents the subscription data holder object, which can be used to process subscribed events.

**Type:** Option\<(Int32, Int32, [AppEventPackageHolder](#class-appeventpackageholder)) -> Unit>

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### let triggerCondition

```cangjie
public let triggerCondition: TriggerCondition
```

**Function:** Subscription callback trigger conditions, which take effect only when used with the `onTrigger` callback function.

**Type:** [TriggerCondition](#struct-triggercondition)

**Read/Write Capability:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### init(String, TriggerCondition, Array\<AppEventFilter>, Option\<(Int32,Int32,AppEventPackageHolder) -> Unit>, Option\<(String,Array\<AppEventGroup>) -> Unit>)

```cangjie
public init(name: String, triggerCondition!: TriggerCondition = TriggerCondition(),
    appEventFilters!: Array<AppEventFilter> = [],
    onTrigger!: Option<(Int32, Int32, AppEventPackageHolder) -> Unit> = None,
    onReceive!: Option<(String, Array<AppEventGroup>) -> Unit> = None)
```

**Function:** Creates a [Watcher](#struct-watcher) instance.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | Watcher name, used to uniquely identify the watcher. |
| triggerCondition | [TriggerCondition](#struct-triggercondition) | No | TriggerCondition() | **Named parameter.** Subscription callback trigger conditions, which take effect only when used with the `onTrigger` callback function. |
| appEventFilters | Array\<[AppEventFilter](#struct-appeventfilter)> | No | [] | **Named parameter.** Subscription filter conditions, used when filtering subscribed events is required. |
| onTrigger | Option\<(Int32, Int32, [AppEventPackageHolder](#class-appeventpackageholder)) -> Unit> | No | None | **Named parameter.** Subscription callback function, which takes effect only when used with the `triggerCondition`. Parameter descriptions:<br>curRow: Total number of subscribed events at the time of callback triggering;<br>curSize: Total size of subscribed events at the time of callback triggering (unit: byte);<br>holder: Subscription data holder object for processing subscribed events. |
| onReceive | Option\<(String, Array\<[AppEventGroup](#struct-appeventgroup)>) -> Unit> | No | None | **Named parameter.** Real-time subscription callback function. If both this and the `onTrigger` callback exist, only this callback will be triggered. Parameter descriptions:<br>domain: Domain name of the callback event;<br>appEventGroups: Collection of callback events. |

## enum Domain

```cangjie
public enum Domain {
    | OS
    | ...
}
```

**Function:** Provides predefined event domain name constants.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### OS

```cangjie
OS
```

**Function:** Operating system domain.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since Version:** 21

### prop value

```cangjie
public prop value: String
```

**Function:** Gets the enumeration value.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Type:** String

**Read/Write Capability:** Read-only

**Since Version:** 21

## enum Event

```cangjie
public enum Event {
    | USER_LOGIN
    | USER_LOGOUT
    | DISTRIBUTED_SERVICE_START
    | APP_CRASH
    | APP_FREEZE
    | ...
}
```

**Function:** Provides event name constants for all predefined events.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### APP_CRASH

```cangjie
APP_CRASH
```

**Function:** Application crash event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### APP_FREEZE

```cangjie
APP_FREEZE
```

**Function:** Application freeze event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### DISTRIBUTED_SERVICE_START

```cangjie
DISTRIBUTED_SERVICE_START
```

**Function:** Distributed service startup event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### USER_LOGIN

```cangjie
USER_LOGIN
```

**Function:** User login event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### USER_LOGOUT

```cangjie
USER_LOGOUT
```

**Function:** User logout event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### prop value

```cangjie
public prop value: String
```

**Function:** Gets the value of the enumeration.

**Type:** String

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

## enum EventType

```cangjie
public enum EventType {
    | FAULT
    | STATISTIC
    | SECURITY
    | BEHAVIOR
    | ...
}
```

**Function:** Event type enumeration.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### BEHAVIOR

```cangjie
BEHAVIOR
```

**Function:** Behavior-type event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### FAULT

```cangjie
FAULT
```

**Function:** Fault-type event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### SECURITY

```cangjie
SECURITY
```

**Function:** Security-type event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### STATISTIC

```cangjie
STATISTIC
```

**Function:** Statistical-type event.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### prop value

```cangjie
public prop value: UInt32
```

**Function:** Gets the value of the enumeration.

**Type:** UInt32

**Read-Write Attribute:** Read-only

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

## enum Param

```cangjie
public enum Param {
    | USER_ID
    | DISTRIBUTED_SERVICE_NAME
    | DISTRIBUTED_SERVICE_INSTANCE_ID
    | ...
}
```

**Function:** Provides parameter name constants for all predefined parameters.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### DISTRIBUTED_SERVICE_INSTANCE_ID

```cangjie
DISTRIBUTED_SERVICE_INSTANCE_ID
```

**Function:** Distributed service instance ID.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### DISTRIBUTED_SERVICE_NAME

```cangjie
DISTRIBUTED_SERVICE_NAME
```

**Function:** Distributed service name.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### USER_ID

```cangjie
USER_ID
```

**Function:** User-defined ID.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### prop value

```cangjie
public prop value: String
```

**Function:** Gets the value of the enumeration.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Type:** String

**Read-Write Attribute:** Read-only

**Since:** 21

## enum ValueType

```cangjie
public enum ValueType {
    | INT(Int32)
    | FLOAT(Float64)
    | STRING(String)
    | BOOL(Bool)
    | ARRSTRING(Array<String>)
    | ARRAYI32(Array<Int32>)
    | ARRAYBOOL(Array<Bool>)
    | ARRAYF64(Array<Float64>)
    | INT64(Int64)
    | ARRAYINT64(Array<Int64>)
    | ...
}
```

**Function:** Represents allowed data field types.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### ARRAYBOOL(Array\<Bool>)

```cangjie
ARRAYBOOL(Array<Bool>)
```

**Function:** Represents an array of Bool type values.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### ARRAYF64(Array\<Float64>)

```cangjie
ARRAYF64(Array<Float64>)
```

**Function:** Represents an array of Float64 type values.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### ARRAYI32(Array\<Int32>)

```cangjie
ARRAYI32(Array<Int32>)
```

**Function:** Represents an array of Int32 type values.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### ARRAYI64(Array\<Int64>)

```cangjie
ARRAYI64(Array<Int64>)
```
**Function:** Represents an array with value type of Int64.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### ARRSTRING(Array\<String>)

```cangjie
ARRSTRING(Array<String>)
```

**Function:** Represents an array with value type of string.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### BOOL(Bool)

```cangjie
BOOL(Bool)
```

**Function:** Represents a value type of boolean.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### FLOAT(Float64)

```cangjie
FLOAT(Float64)
```

**Function:** Represents a value type of floating-point number.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**Function:** Represents a value type of integer.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### INT(Int64)

```cangjie
INT(Int64)
```

**Function:** Represents a value type of Int64 integer.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### STRING(String)

```cangjie
STRING(String)
```

**Function:** Represents a value type of character.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Since:** 21

### prop value

```cangjie
public prop value: String
```

**Function:** Returns the value of this enumeration as a string.

**System Capability:** SystemCapability.HiviewDFX.HiAppEvent

**Type:** String

**Access:** Read-only

**Since:** 21