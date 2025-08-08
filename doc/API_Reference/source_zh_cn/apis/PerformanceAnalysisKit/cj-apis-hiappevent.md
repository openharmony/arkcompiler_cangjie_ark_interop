# ohos.hiappevent（应用事件打点）

本模块提供了应用事件打点能力，包括应用事件落盘、应用事件订阅、应用事件清理、打点功能配置等功能。

## 导入模块

```cangjie
import kit.PerformanceAnalysisKit.*
```

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

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

**功能：** 提供了订阅返回的应用事件包的参数定义。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let data

```cangjie
public let data: Array<String>
```

**功能：** 事件包的事件信息。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let packageId

```cangjie
public let packageId: Int32
```

**功能：** 事件包ID，从0开始自动递增。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let row

```cangjie
public let row: Int32
```

**功能：** 事件包的事件数量。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let size

```cangjie
public let size: Int32
```

**功能：** 事件包的事件大小，单位为byte。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(Int32, Int32, Int32, Array\<String>)

```cangjie
public init(packageId: Int32, row: Int32, size: Int32, data: Array<String>)
```

**功能：** 创建[AppEventPackage](#class-appeventpackage)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|packageId|Int32|是|-|事件包ID，从0开始自动递增。|
|row|Int32|是|-|事件包的事件数量。|
|size|Int32|是|-|事件包的事件大小，单位为byte。|
|data|Array\<String>|是|-|事件包的事件信息。|

## class AppEventPackageHolder

```cangjie
public class AppEventPackageHolder {}
```

**功能：** 订阅数据持有者类，用于对订阅事件进行处理。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### static func constructor(String)

```cangjie
public static func constructor(watcherName: String): AppEventPackageHolder
```

**功能：** 类构造函数，创建订阅数据持有者实例，通过观察者名称关联到应用内已添加的观察者对象。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|watcherName|String|是|-|观察者名称。|

**返回值：**

|类型|说明|
|:----|:----|
|[AppEventPackageHolder](#class-appeventpackageholder)|订阅数据持有者类对象。|

**示例：**

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

**功能：** 设置每次取出的应用事件包的数据大小阈值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|size|Int32|否|512 * 1024|**命名参数。** 数据大小阈值，单位为byte，取值范围大于等于0，超出范围会抛异常。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[应用事件打点错误码](../../errorcodes/cj-errorcode-hiappevent.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |11104001|Invalid size value.|

**示例：**

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

**功能：** 根据设置的数据大小阈值来取出订阅事件数据，当订阅事件数据全部被取出时返回None作为标识。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Option\<[AppEventPackage](#class-appeventpackage)>|取出的事件包对象，订阅事件数据被全部取出后会返回None。|

**示例：**

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

**功能：** 该类提供了应用事件打点能力。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### static func addProcessor(Processor)

```cangjie
public static func addProcessor(processor: Processor): Int64
```

**功能：** 开发者可添加数据处理者，该数据处理者用于提供事件上云功能，数据处理者的实现可预置在设备中，开发者可根据数据处理者的约束设置属性。

Processor的配置信息需要由数据处理者提供，目前设备内暂未预置可供交互的数据处理者，因此当前事件上云功能不可用。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|processor|[Processor](#class-processor)|是|-|上报事件的数据处理者。|

**返回值：**

|类型|说明|
|:----|:----|
|Int64|所添加上报事件数据处理者的ID。添加失败返回-1，添加成功返回大于0的值。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 添加应用事件观察者方法，可用于订阅应用事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|watcher|[Watcher](#struct-watcher)|是|-|应用事件观察者。|

**返回值：**

|类型|说明|
|:----|:----|
|Option\<[AppEventPackageHolder](#class-appeventpackageholder)>|订阅数据持有者，订阅失败时返回None。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[应用事件打点错误码](../../errorcodes/cj-errorcode-hiappevent.md)和[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.|
  |11102001|Invalid watcher name.|
  |11102002|Invalid filtering event domain.|
  |11102003|Invalid row value.|
  |11102004|Invalid size value.|
  |11102005|Invalid timeout value.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

func f1(){
    // 如果观察者传入了回调的相关参数，则可以选择在自动触发的回调函数中对订阅事件进行处理
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
    // 如果观察者未传入回调的相关参数，则可以选择使用返回的holder对象手动去处理订阅事件
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
    // 观察者可以在实时回调函数onReceive中处理订阅事件
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

**功能：** 应用事件打点数据清理方法，将应用存储在本地的打点数据进行清除。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**示例：**

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

**功能：** 应用事件打点配置方法，可用于配置打点开关、目录存储配额大小等功能。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|config|[ConfigOption](#struct-configoption)|是|-|应用事件打点配置项对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[应用事件打点错误码](../../errorcodes/cj-errorcode-hiappevent.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |11103001|Invalid max storage quota value.|

**示例：**

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

**功能：** 获取之前通过[setUserId](#static-func-setuseridstring-string)接口设置的value值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|用户ID的key。只能包含大小写字母、数字、下划线和$，不能以数字开头，长度不超过256。|

**返回值：**

|类型|说明|
|:----|:----|
|String|用户ID的值。没有查到返回空字符串。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 获取之前通过[setUserProperty](#static-func-setuserpropertystring-string)接口设置的value值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|用户属性的key。只能包含大小写字母、数字、下划线和$，不能以数字开头，长度不超过256。|

**返回值：**

|类型|说明|
|:----|:----|
|String|用户属性的值。没有查到返回空字符串。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 删除上报事件的数据处理者。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|Int64|是|-|上报事件数据处理者ID。值大于0。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 移除应用事件观察者方法，可用于取消订阅应用事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|watcher|[Watcher](#struct-watcher)|是|-|应用事件观察者。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[应用事件打点错误码](../../errorcodes/cj-errorcode-hiappevent.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |11102001|Invalid watcher name.|

**示例：**

<!-- compile -->

```cangjie
// index.cj

import ohos.base.*
import kit.PerformanceAnalysisKit.*

// 定义一个应用事件观察者
let watcher= Watcher("watcher1")
// 添加一个应用事件观察者来订阅事件
HiAppEvent.addWatcher(watcher)
// 移除该应用事件观察者以取消订阅事件
HiAppEvent.removeWatcher(watcher)
```

### static func setUserId(String, String)

```cangjie
public static func setUserId(name: String, value: String): Unit
```

**功能：** 设置用户ID。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|用户ID的key。只能包含大小写字母、数字、下划线和$，不能以数字开头，长度非空且不超过256个字符。|
|value|String|是|-|用户ID的值。长度不超过256，当值为null或空字符串时，则清除用户ID。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 设置用户属性。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|用户属性的key。只能包含大小写字母、数字、下划线和$，不能以数字开头，长度非空且不超过256个字符。|
|value|String|是|-|用户属性的值。长度不超过1024，当值为null或空字符串时，则清除用户属性。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |401|Parameter error.|

**示例：**

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

**功能：** 应用事件打点方法，将事件写入到当天的事件文件中，可接收[AppEventInfo](#struct-appeventinfo)类型的事件对象。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|info|[AppEventInfo](#struct-appeventinfo)|是|-|应用事件对象。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[应用事件打点错误码](../../errorcodes/cj-errorcode-hiappevent.md)。

  |错误码ID|错误信息|
  |:---|:---|
  |11100001|Function is disabled.|
  |11101001|Invalid event domain.|
  |11101002|Invalid event name.|
  |11101003|Invalid number of event parameters.|
  |11101004|Invalid string length of the event parameter.|
  |11101005|Invalid event parameter name.|
  |11101006|Invalid array length of the event parameter.|

**示例：**

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

**功能：** 可以上报事件的数据处理者对象。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let appId

```cangjie
public let appId: String
```

**功能：** 应用id，默认为空字符串。传入字符串长度不能超过8KB，超过时会被置为默认值。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let batchReport

```cangjie
public let batchReport: Int64
```

**功能：** 事件上报阈值，当事件条数达到阈值时上报事件。传入数值必须大于0且小于1000，不在数值范围内会被置为默认值0，不进行上报。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let debugMode

```cangjie
public let debugMode: Bool
```

**功能：** 是否开启debug模式，默认值为false。配置值为true表示开启debug模式，false表示不开启debug模式。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let eventConfigs

```cangjie
public let eventConfigs: Array<AppEventReportConfig>
```

**功能：** 数据处理者可以上报的事件数组。

**类型：** Array\<[AppEventReportConfig](#struct-appeventreportconfig)>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 数据处理者的名称。名称只能包含大小写字母、数字、下划线和$，不能以数字开头，长度非空且不超过256个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let onBackgroundReport

```cangjie
public let onBackgroundReport: Bool
```

**功能：** 当应用程序进入后台时是否上报事件，默认值为false。配置值为true表示上报事件，false表示不上报事件。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let onStartReport

```cangjie
public let onStartReport: Bool
```

**功能：** 数据处理者在启动时是否上报事件，默认值为false。配置值为true表示上报事件，false表示不上报事件。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let periodReport

```cangjie
public let periodReport: Int64
```

**功能：** 事件定时上报时间周期，单位为秒。传入数值必须大于或等于0，小于0时会被置为默认值0，不进行定时上报。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let routeInfo

```cangjie
public let routeInfo: String
```

**功能：** 服务器位置信息，默认为空字符串。传入字符串长度不能超过8KB，超过时会被置为默认值。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let userIds

```cangjie
public let userIds: Array<String>
```

**功能：** 数据处理者可以上报的用户ID的name数组。name对应[setUserId](#static-func-setuseridstring-string)接口的name参数。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let userProperties

```cangjie
public let userProperties: Array<String>
```

**功能：** 数据处理者可以上报的用户属性的name数组。name对应[setUserProperty](#static-func-setuserpropertystring-string)接口的name参数。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(String, Bool, String, String, Bool, Bool, Int64, Int64, Array\<String>, Array\<String>, Array\<AppEventReportConfig>)

```cangjie
public init(name: String, debugMode!: Bool = false, routeInfo!: String = "", appId!: String = "",
    onStartReport!: Bool = false, onBackgroundReport!: Bool = false, periodReport!: Int64 = 0,
    batchReport!: Int64 = 0, userIds!: Array<String> = [], userProperties!: Array<String> = [],
    eventConfigs!: Array<AppEventReportConfig> = [])
```

**功能：** 创建[Processor](#class-processor)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|数据处理者的名称。名称只能包含大小写字母、数字、下划线和$，不能以数字开头，长度非空且不超过256个字符。|
|debugMode|Bool|否|false|**命名参数。** 是否开启debug模式，默认值为false。配置值为true表示开启debug模式，false表示不开启debug模式。|
|routeInfo|String|否|""|**命名参数。** 服务器位置信息，默认为空字符串。传入字符串长度不能超过8KB，超过时会被置为默认值。|
|appId|String|否|""|**命名参数。** 应用id，默认为空字符串。传入字符串长度不能超过8KB，超过时会被置为默认值。|
|onStartReport|Bool|否|false|**命名参数。** 数据处理者在启动时是否上报事件，默认值为false。配置值为true表示上报事件，false表示不上报事件。|
|onBackgroundReport|Bool|否|false|**命名参数。** 当应用程序进入后台时是否上报事件，默认值为false。配置值为true表示上报事件，false表示不上报事件。|
|periodReport|Int64|否|0|**命名参数。** 事件定时上报时间周期，单位为秒。传入数值必须大于或等于0，小于0时会被置为默认值0，不进行定时上报。|
|batchReport|Int64|否|0|**命名参数。** 事件上报阈值，当事件条数达到阈值时上报事件。传入数值必须大于0且小于1000，不在数值范围内会被置为默认值0，不进行上报。|
|userIds|Array\<String>|否|[]|**命名参数。** 数据处理者可以上报的用户ID的name数组。name对应[setUserId](#static-func-setuseridstring-string)接口的name参数。|
|userProperties|Array\<String>|否|[]|**命名参数。** 数据处理者可以上报的用户属性的name数组。name对应[setUserProperty](#static-func-setuserpropertystring-string)接口的name参数。|
|eventConfigs|Array\<[AppEventReportConfig](#struct-appeventreportconfig)>|否|[]|**命名参数。** 数据处理者可以上报的事件数组。|

## struct AppEventFilter

```cangjie
public struct AppEventFilter {
    public let domain: String
    public let eventTypes: Array<EventType>
    public let names: Array<String>
    public init(domain: String, eventTypes!: Array<EventType> = [], names!: Array<String> = [])
}
```

**功能：** 提供了过滤应用事件的参数选项。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let domain

```cangjie
public let domain: String
```

**功能：** 需要订阅的事件领域。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let eventTypes

```cangjie
public let eventTypes: Array<EventType>
```

**功能：** 需要订阅的事件类型集合。

**类型：** Array\<[EventType](#enum-eventtype)>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let names

```cangjie
public let names: Array<String>
```

**功能：** 需要订阅的事件名称集合。

**类型：** Array\<String>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(String, Array\<EventType>, Array\<String>)

```cangjie
public init(domain: String, eventTypes!: Array<EventType> = [], names!: Array<String> = [])
```

**功能：** 创建[AppEventFilter](#struct-appeventfilter)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|domain|String|是|-|需要订阅的事件领域。|
|eventTypes|Array\<[EventType](#enum-eventtype)>|否|[]|**命名参数。** 需要订阅的事件类型集合。|
|names|Array\<String>|否|[]|**命名参数。** 需要订阅的事件名称集合。|

## struct AppEventGroup

```cangjie
public struct AppEventGroup {
    public let name: String
    public let appEventInfos: Array<AppEventInfo>
    public init(name: String, appEventInfos: Array<AppEventInfo>)
}
```

**功能：** 提供了订阅返回的事件组的参数定义。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let appEventInfos

```cangjie
public let appEventInfos: Array<AppEventInfo>
```

**功能：** 事件对象集合。

**类型：** Array\<[AppEventInfo](#struct-appeventinfo)>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 事件名称。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(String, Array\<AppEventInfo>)

```cangjie
public init(name: String, appEventInfos: Array<AppEventInfo>)
```

**功能：** 创建[AppEventGroup](#struct-appeventgroup)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|事件名称。|
|appEventInfos|Array\<[AppEventInfo](#struct-appeventinfo)>|是|-|事件对象集合。|

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

**功能：** 提供了应用事件信息的参数选项。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let domain

```cangjie
public let domain: String
```

**功能：** 事件领域。事件领域名称支持数字、字母、下划线字符，需要以字母开头且不能以下划线结尾，长度非空且不超过32个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let event

```cangjie
public let event: EventType
```

**功能：** 事件类型。

**类型：** [EventType](#enum-eventtype)

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 事件名称。首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过48个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let params

```cangjie
public let params: Array<Parameters>
```

**功能：** 事件参数对象，每个事件参数包括参数名和参数值，其规格定义如下：

参数名为String类型，首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过32个字符。

参数值支持String、Int32、Float64、Bool、数组类型，String类型参数长度需在8*1024个字符以内；数组类型参数中的元素类型只能全为String、Int32、Float64、Bool中的一种，且元素个数需在100以内。

参数个数需在32个以内。

**类型：** Array\<[Parameters](#struct-parameters)>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### AppEventInfo(String, String, EventType, Array\<Parameters>)

```cangjie
public AppEventInfo(
    public let domain: String,
    public let name: String,
    public let event: EventType,
    public let params: Array<Parameters>
)
```

**功能：** 创建[AppEventInfo](#struct-appeventinfo)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|domain|String|是|-|事件领域。事件领域名称支持数字、字母、下划线字符，需要以字母开头且不能以下划线结尾，长度非空且不超过32个字符。|
|name|String|是|-|事件名称。首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过48个字符。|
|event|[EventType](#enum-eventtype)|是|-|事件类型。|
|params|Array\<[Parameters](#struct-parameters)>|是|-|事件参数对象，每个事件参数包括参数名和参数值，其规格定义如下：<br>- 参数名为String类型，首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过32个字符。<br>- 参数值支持String、Int32、Float64、Bool、数组类型，String类型参数长度需在8*1024个字符以内；数组类型参数中的元素类型只能全为String、Int32、Float64、Bool中的一种，且元素个数需在100以内。<br>- 参数个数需在32个以内。|

## struct AppEventReportConfig

```cangjie
public struct AppEventReportConfig {
    public let domain: String
    public let name: String
    public let isRealTime: Bool
    public init(domain!: String = "", name!: String = "", isRealTime!: Bool = false)
}
```

**功能：** 数据处理者可以上报事件的描述配置。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let domain

```cangjie
public let domain: String
```

**功能：** 事件领域。事件领域名称支持数字、字母、下划线字符，需要以字母开头且不能以下划线结尾，长度非空且不超过32个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let isRealTime

```cangjie
public let isRealTime: Bool
```

**功能：** 是否实时上报事件。配置值为true表示实时上报事件，false表示不实时上报事件。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 事件名称。首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过48个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(String, String, Bool)

```cangjie
public init(domain!: String = "", name!: String = "", isRealTime!: Bool = false)
```

**功能：** 创建[AppEventReportConfig](#struct-appeventreportconfig)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|domain|String|否|""|**命名参数。** 事件领域。事件领域名称支持数字、字母、下划线字符，需要以字母开头且不能以下划线结尾，长度非空且不超过32个字符。|
|name|String|否|""|**命名参数。** 事件名称。首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过48个字符。|
|isRealTime|Bool|否|false|**命名参数。** 是否实时上报事件。配置值为true表示实时上报事件，false表示不实时上报事件。|

## struct ConfigOption

```cangjie
public struct ConfigOption {
    public let disable: Bool
    public let maxStorage: String
    public ConfigOption(maxStorage: String, disable!: Bool = false)
}
```

**功能：** 提供了对应用事件打点功能的配置选项。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let disable

```cangjie
public let disable: Bool
```

**功能：** 打点功能开关，默认值为false。true：关闭打点功能，false：不关闭打点功能。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let maxStorage

```cangjie
public let maxStorage: String
```

**功能：** 打点数据存放目录的配额大小，默认值为“10M”。

在目录大小超出配额后，下次打点会触发对目录的清理操作：按从旧到新的顺序逐个删除打点数据文件，直到目录大小不超出配额时结束。

配额值字符串规格如下：

- 配额值字符串只由数字字符和大小单位字符（单位字符支持[b\|k\|kb\|m\|mb\|g\|gb\|t\|tb]，不区分大小写）构成。
- 配额值字符串必须以数字开头，后面可以选择不传单位字符（默认使用byte作为单位），或者以单位字符结尾。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ConfigOption(String, Bool)

```cangjie
public ConfigOption(maxStorage: String, disable!: Bool = false)
```

**功能：** 创建[ConfigOption](#struct-configoption)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|maxStorage|String|是|-|打点数据存放目录的配额大小，默认值为“10M”。<br>在目录大小超出配额后，下次打点会触发对目录的清理操作：按从旧到新的顺序逐个删除打点数据文件，直到目录大小不超出配额时结束。<br>配额值字符串规格如下：<br>- 配额值字符串只由数字字符和大小单位字符（单位字符支持[b\|k\|kb\|m\|mb\|g\|gb\|t\|tb]，不区分大小写）构成。<br>- 配额值字符串必须以数字开头，后面可以选择不传单位字符（默认使用byte作为单位），或者以单位字符结尾。|
|disable|Bool|否|false| **命名参数。** 打点功能开关，默认值为false。true：关闭打点功能，false：不关闭打点功能。|

## struct Parameters

```cangjie
public struct Parameters {
    public Parameters(
        public let key: String,
        public let value: ValueType
    )
}
```

**功能：** [AppEventInfo](#struct-appeventinfo)的事件参数对象。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let key

```cangjie
public let key: String
```

**功能：** 事件参数名，首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过32个字符。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let value

```cangjie
public let value: ValueType
```

**功能：** 事件参数值，String类型参数长度需在8*1024个字符以内，Array中元素个数需在100以内，超出会做丢弃处理。

**类型：** [ValueType](#enum-valuetype)

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### Parameters(String, ValueType)

```cangjie
public Parameters(
    public let key: String,
    public let value: ValueType
)
```

**功能：** 创建[Parameters](#struct-parameters)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|key|String|否|-|事件参数名，首字符必须为字母字符或$字符，中间字符必须为数字字符、字母字符或下划线字符，结尾字符必须为数字字符或字母字符，长度非空且不超过32个字符。|
|value|[ValueType](#enum-valuetype)|否|-|事件参数值，String类型参数长度需在8*1024个字符以内，Array中元素个数需在100以内，超出会做丢弃处理。|

## struct TriggerCondition

```cangjie
public struct TriggerCondition {
    public let row: Int32
    public let size: Int32
    public let timeOut: Int32
    public init(row!: Int32 = 0, size!: Int32 = 0, timeOut!: Int32 = 0)
}
```

**功能：** 提供了回调触发条件的参数选项，只要满足任一条件就会触发订阅回调。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let row

```cangjie
public let row: Int32
```

**功能：** 满足触发回调的事件总数量，正整数。默认值0，不触发回调。传入负值时，会被置为默认值。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let size

```cangjie
public let size: Int32
```

**功能：** 满足触发回调的事件总大小，正整数，单位为byte。默认值0，不触发回调。传入负值时，会被置为默认值。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let timeOut

```cangjie
public let timeOut: Int32
```

**功能：** 满足触发回调的超时时长，正整数，单位为30s。默认值0，不触发回调。传入负值时，会被置为默认值。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(Int32, Int32, Int32)

```cangjie
public init(row!: Int32 = 0, size!: Int32 = 0, timeOut!: Int32 = 0)
```

**功能：** 创建[TriggerCondition](#struct-triggercondition)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|row|Int32|否|0|**命名参数。** 满足触发回调的事件总数量，正整数。默认值0，不触发回调。传入负值时，会被置为默认值。|
|size|Int32|否|0|**命名参数。** 满足触发回调的事件总大小，正整数，单位为byte。默认值0，不触发回调。传入负值时，会被置为默认值。|
|timeOut|Int32|否|0|**命名参数。** 满足触发回调的超时时长，正整数，单位为30s。默认值0，不触发回调。传入负值时，会被置为默认值。|

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

**功能：** 提供了应用事件观察者的参数选项。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let appEventFilters

```cangjie
public let appEventFilters: Array<AppEventFilter>
```

**功能：** 订阅过滤条件，在需要对订阅事件进行过滤时传入。

**类型：** Array\<[AppEventFilter](#struct-appeventfilter)>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let name

```cangjie
public let name: String
```

**功能：** 观察者名称，用于唯一标识观察者。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let onReceive

```cangjie
public let onReceive: Option<(String, Array<AppEventGroup>) -> Unit>
```

**功能：** 订阅实时回调函数，与回调函数onTrigger同时存在时，只触发此回调。回调函数的第一个参数表示回调事件的领域名称，回调函数的第二个参数表示回调事件集合。

**类型：** Option\<(String, Array\<[AppEventGroup](#struct-appeventgroup)>) -> Unit>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let onTrigger

```cangjie
public let onTrigger: Option <(Int32, Int32, AppEventPackageHolder) -> Unit>
```

**功能：** 订阅回调函数，需要与回调触发条件triggerCondition一同传入才会生效。回调函数的第一个参数表示在本次回调触发时的订阅事件总数量。回调函数的第二个参数表示在本次回调触发时的订阅事件总大小，单位为byte。回调函数的第三个参数表示订阅数据持有者对象，可以通过其对订阅事件进行处理。

**类型：** Option\<(Int32, Int32, [AppEventPackageHolder](#class-appeventpackageholder)) -> Unit>

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### let triggerCondition

```cangjie
public let triggerCondition: TriggerCondition
```

**功能：** 订阅回调触发条件，需要与回调函数onTrigger一同传入才会生效。

**类型：** [TriggerCondition](#struct-triggercondition)

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### init(String, TriggerCondition, Array\<AppEventFilter>, Option\<(Int32,Int32,AppEventPackageHolder) -> Unit>, Option\<(String,Array\<AppEventGroup>) -> Unit>)

```cangjie
public init(name: String, triggerCondition!: TriggerCondition = TriggerCondition(),
    appEventFilters!: Array<AppEventFilter> = [],
    onTrigger!: Option<(Int32, Int32, AppEventPackageHolder) -> Unit> = None,
    onReceive!: Option<(String, Array<AppEventGroup>) -> Unit> = None)
```

**功能：** 创建[Watcher](#struct-watcher)实例。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-|观察者名称，用于唯一标识观察者。|
|triggerCondition|[TriggerCondition](#struct-triggercondition)|否|TriggerCondition()| **命名参数。** 订阅回调触发条件，需要与回调函数onTrigger一同传入才会生效。|
|appEventFilters|Array\<[AppEventFilter](#struct-appeventfilter)>|否|[]| **命名参数。** 订阅过滤条件，在需要对订阅事件进行过滤时传入。|
|onTrigger|Option\<(Int32, Int32, [AppEventPackageHolder](#class-appeventpackageholder)) -> Unit>|否|None| **命名参数。** 订阅回调函数，需要与回调触发条件triggerCondition一同传入才会生效，函数入参说明如下：<br>curRow：在本次回调触发时的订阅事件总数量； <br>curSize：在本次回调触发时的订阅事件总大小，单位为byte；<br/>holder：订阅数据持有者对象，可以通过其对订阅事件进行处理。|
|onReceive|Option\<(String, Array\<[AppEventGroup](#struct-appeventgroup)>) -> Unit>|否|None| **命名参数。** 订阅实时回调函数，与回调函数onTrigger同时存在时，只触发此回调，函数入参说明如下：<br>domain：回调事件的领域名称；<br>appEventGroups：回调事件集合。|

## enum Domain

```cangjie
public enum Domain {
    | OS
    | ...
}
```

**功能：** 提供了所有预定义事件的领域名称常量。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### OS

```cangjie
OS
```

**功能：** 系统领域。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### prop value

```cangjie
public prop value: String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**类型：** String

**读写能力：** 只读

**起始版本：** 21

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

**功能：** 提供了所有预定义事件的事件名称常量。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### APP_CRASH

```cangjie
APP_CRASH
```

**功能：** 应用崩溃事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### APP_FREEZE

```cangjie
APP_FREEZE
```

**功能：** 应用卡死事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### DISTRIBUTED_SERVICE_START

```cangjie
DISTRIBUTED_SERVICE_START
```

**功能：** 分布式服务启动事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### USER_LOGIN

```cangjie
USER_LOGIN
```

**功能：** 用户登录事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### USER_LOGOUT

```cangjie
USER_LOGOUT
```

**功能：** 用户登出事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### prop value

```cangjie
public prop value: String
```

**功能：** 获取枚举的值。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

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

**功能：** 事件类型枚举。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### BEHAVIOR

```cangjie
BEHAVIOR
```

**功能：** 行为类型事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### FAULT

```cangjie
FAULT
```

**功能：** 故障类型事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### SECURITY

```cangjie
SECURITY
```

**功能：** 安全类型事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### STATISTIC

```cangjie
STATISTIC
```

**功能：** 统计类型事件。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### prop value

```cangjie
public prop value: UInt32
```

**功能：** 获取枚举的值。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

## enum Param

```cangjie
public enum Param {
    | USER_ID
    | DISTRIBUTED_SERVICE_NAME
    | DISTRIBUTED_SERVICE_INSTANCE_ID
    | ...
}
```

**功能：** 提供了所有预定义参数的参数名称常量。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### DISTRIBUTED_SERVICE_INSTANCE_ID

```cangjie
DISTRIBUTED_SERVICE_INSTANCE_ID
```

**功能：** 分布式服务实例ID。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### DISTRIBUTED_SERVICE_NAME

```cangjie
DISTRIBUTED_SERVICE_NAME
```

**功能：** 分布式服务名称。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### USER_ID

```cangjie
USER_ID
```

**功能：** 用户自定义ID。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### prop value

```cangjie
public prop value: String
```

**功能：** 获取枚举的值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**类型：** String

**读写能力：** 只读

**起始版本：** 21

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

**功能：** 用于表示允许的数据字段类型。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ARRAYBOOL(Array\<Bool>)

```cangjie
ARRAYBOOL(Array<Bool>)
```

**功能：** 表示值类型为Bool类型的数组。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ARRAYF64(Array\<Float64>)

```cangjie
ARRAYF64(Array<Float64>)
```

**功能：** 表示值类型为Float64类型的数组。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ARRAYI32(Array\<Int32>)

```cangjie
ARRAYI32(Array<Int32>)
```

**功能：** 表示值类型为Int32类型的数组。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ARRAYI64(Array\<Int64>)

```cangjie
ARRAYI64(Array<Int64>)
```

**功能：** 表示值类型为Int64类型的数组。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### ARRSTRING(Array\<String>)

```cangjie
ARRSTRING(Array<String>)
```

**功能：** 表示值类型为字符串数组。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### BOOL(Bool)

```cangjie
BOOL(Bool)
```

**功能：** 表示值类型为布尔类型。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### FLOAT(Float64)

```cangjie
FLOAT(Float64)
```

**功能：** 表示值类型为浮点型数字。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### INT(Int32)

```cangjie
INT(Int32)
```

**功能：** 表示值类型为整型数字。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### INT(Int64)

```cangjie
INT(Int64)
```

**功能：** 表示值类型为Int64整型数字。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### STRING(String)

```cangjie
STRING(String)
```

**功能：** 表示值类型为字符。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**起始版本：** 21

### prop value

```cangjie
public prop value: String
```

**功能：** 以字符串形式返回该枚举的值。

**系统能力：** SystemCapability.HiviewDFX.HiAppEvent

**类型：** String

**读写能力：** 只读

**起始版本：** 21
