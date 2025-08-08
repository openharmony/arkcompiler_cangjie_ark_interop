# ohos.request.agent（上传下载）

request部件主要给应用提供上传下载文件、后台传输代理的基础能力。

## 导入模块

```cangjie
import kit.BasicServicesKit.*
```

## 权限列表

ohos.permission.INTERNET

## 使用说明

API示例代码使用说明：

- 若示例代码首行有“// index.cj”注释，表示该示例可在仓颉模板工程的“index.cj”文件中编译运行。
- 若示例需获取[Context](../AbilityKit/cj-apis-ability.md#class-context)应用上下文，需在仓颉模板工程中的“main_ability.cj”文件中进行配置。

上述示例工程及配置模板详见[仓颉示例代码说明](../../cj-development-intro.md#仓颉示例代码说明)。

## func create(StageContext, Config)

```cangjie
public func create(context: StageContext, config: Config): Task
```

**功能：** 创建要上传或下载的任务，并将其排入队列。每个应用最多支持创建10个未完成的任务。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|基于应用程序的上下文。 |
|config|[Config](#class-config)|是|-|上传/下载任务的配置信息。|

**返回值：**

|类型|说明|
|:----|:----|
|[Task](#class-task)|返回一个Task对象，里面包括任务id和任务的配置信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 201 | the permissions check fails.|
  | 401 | the parameters check fails.Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed.|
  | 13400001 | Failed to open file errno xx.|
  | 13400003 | task service ability error. |
  | 21900004 | application task queue full error. |
  | 21900005 | task mode error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.Action as RAction
import ohos.base.*

let fileSpec = FileSpec(
    path: "./createTest.avi",
    filename: "createTest.avi",
    mimeType: "application/octet-stream"
)
let attachments = FORMITEMS(
    [
        FormItem(
            name: "createTest",
            value: FormItemValueType.FILE(fileSpec)
        )
    ]
)
let config = Config(
    action: RAction.UPLOAD,
    url: "http://127.0.0.1",
    title: "createTest",
    mode: Mode.FOREGROUND,
    description: "Sample code for creating task",
    overwrite: false,
    method: "PUT",
    data: attachments,
    saveas: "./",
    network: Network.CELLULAR,
    metered: false,
    roaming: true,
    retry: true,
    redirect: true,
    index: 0,
    begins: 0,
    ends: -1,
    gauge: false,
    precise: false,
    token: "it is a secret"
)
try {
    let task = create(Global.getStageContext(), config)  // 需获取Context应用上下文，详见本文使用说明
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

## func getTask(StageContext, String, ?String)

```cangjie
public func getTask(context: StageContext, id: String, token!: ?String = None): Task
```

**功能：** 根据任务id查询任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|context|[StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext)|是|-|基于应用程序的上下文。|
|id|String|是|-|任务id。|
|token|?String|否|None| **命名参数。** 任务查询token。|

**返回值：**

|类型|说明|
|:----|:----|
|[Task](#class-task)|返回一个Task对象，里面包括任务id和任务的配置信息。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed.|
  | 13400003 | task service ability error. |
  | 21900006 | task not found. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.*

try {
    let task = getTask(Global.getStageContext(), "123456")  // 需获取Context应用上下文，详见本文使用说明
} catch (e: BusinessException) {
    Hilog.error(0, "GetTask", "Failed to get task, ${e}")
}
```

## func remove(String)

```cangjie
public func remove(id: String): Unit
```

**功能：** 移除属于调用方的指定任务。如果正在处理中，该任务将被迫停止。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|是|-|任务id。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900006 | task not found error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

try {
    remove("12345")
} catch (e: BusinessException) {
    Hilog.error(0, "TaskRemove", "${e}")
}
```

## func search()

```cangjie
public func search(): Array<String>
```

**功能：** 根据默认[Filter](#class-filter)过滤条件查找任务id。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回满足条件任务id。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | parameter error. Possible causes: 1. Incorrect parameter type 2. Parameter verification failed. |
  | 13400003 | task service ability error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

try {
    let tids = search()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskRemove", "${e}")
}
```

## func search(Filter)

```cangjie
public func search(filter: Filter): Array<String>
```

**功能：** 根据[Filter](#class-filter)过滤条件查找任务id。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|filter|[Filter](#class-filter)|是|-|过滤条件。|

**返回值：**

|类型|说明|
|:----|:----|
|Array\<String>|返回满足条件任务id。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | parameter error. Possible causes: 1. Incorrect parameter type 2. Parameter verification failed. |
  | 13400003 | task service ability error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.*

try {
    let tids: Array<String> = search(Filter(state: State.INITIALIZED))
} catch (e: BusinessException) {
    Hilog.error(0, "SearchTask", "Failed to search task, ${e}")
}
```

## func show(String)

```cangjie
public func show(id: String): TaskInfo
```

**功能：** 根据任务id查询任务的详细信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|是|-|任务id。|

**返回值：**

| 类型                | 说明                      |
| :------------------- | :------------------------- |
| [TaskInfo](#class-taskinfo) | 返回任务详细信息的TaskInfo对象。 |

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type. |
  | 13400003 | task service ability error. |
  | 21900006 | task not found. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.*

try {
    let taskInfo = show("123456")
} catch (e: BusinessException) {
    Hilog.error(0, "ShowTask", "Failed to show task, ${e}")
}
```

## func touch(String, String)

```cangjie
public func touch(id: String, token: String): TaskInfo
```

**功能：** 根据任务id和token查询任务的详细信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|id|String|是|-|任务id。|
|token|String|是|-|任务查询token。|

**返回值：**

| 类型                | 说明                      |
| :------------------- | :------------------------- |
| [TaskInfo](#class-taskinfo) | 返回任务详细信息的TaskInfo对象。 |

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)与[通用错误码说明文档](../../errorcodes/cj-errorcode-universal.md)

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |
  | 13400003 | task service ability error. |
  | 21900006 | task not found. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.*

try {
    let taskInfo = touch("123456", "token123456")
} catch (e: BusinessException) {
    Hilog.error(0, "TouchTask", "Failed to touch task, ${e}")
}
```

## class Config

```cangjie
public class Config {
    public Config(
        public var action!: Action,
        public var url!: String,
        public var title!: ?String = None,
        public var description!: ?String = None,
        public var mode!: ?Mode = None,
        public var overwrite!: Bool = false,
        public var method!: ?String= None,
        public var headers!: ?HashMap<String, String> = None,
        public var data!: ?ConfigDataType = None,
        public var saveas!: ?String = None,
        public var network!: Network = Network.ANY,
        public var metered!: Bool = false,
        public var roaming!: Bool = true,
        public var retry!: Bool = true,
        public var redirect!: Bool = true,
        public var index!: UInt32 = 0,
        public var begins!: Int64 = 0,
        public var ends!: Int64 = -1,
        public var gauge!: Bool = false,
        public var precise!: Bool = false,
        public var token!: ?String = None,
        public var priority!: UInt32 = 0,
        public var extras!: ?HashMap<String, String> = None
    )
}
```

**功能：** 上传/下载任务的配置信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var action

```cangjie
public var action: Action
```

**功能：** 任务操作选项，UPLOAD表示上传任务，DOWNLOAD表示下载任务。

**类型：** [Action](#enum-action)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var begins

```cangjie
public var begins: Int64 = 0
```

**功能：** 文件起点，通常用于断点续传。默认值为0，取值为闭区间。下载时，请求读取服务器开始下载文件时的起点位置（http协议中设置"Range"选项）。上传时，在上传开始时读取。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var data

```cangjie
public var data: ?ConfigDataType = None
```

**功能：** 下载时，data为字符串类型，通常使用json(object将被转换为json文本)，默认为空。上传时，data是表单项数组Array\<FormItem>，默认为空。

**类型：** ?[ConfigDataType](#enum-configdatatype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var description

```cangjie
public var description: ?String = None
```

**功能：** 任务的详细信息，其最大长度为1024个字符，默认值为空字符串。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var ends

```cangjie
public var ends: Int64 = - 1
```

**功能：** 文件终点，通常用于断点续传。默认值为-1，取值为闭区间。下载时，请求读取服务器开始下载文件时的结束位置（http协议中设置"Range"选项）。上传时，在上传时结束读取。

**类型：** Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var extras

```cangjie
public var extras: ?HashMap<String, String>= None
```

**功能：** 配置的附加功能，默认为空。

**类型：** ?HashMap&lt;String, String&gt;

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var gauge

```cangjie
public var gauge: Bool = false
```

**功能：** 后台任务的过程进度通知策略，仅应用于后台任务，默认值为false。false：代表仅完成或失败的通知。true：发出每个进度已完成或失败的通知。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var headers

```cangjie
public var headers: ?HashMap<String, String>= None
```

**功能：** 添加要包含在任务中的HTTP协议标志头。对于上传请求，默认的Content-Type为"multipart/form-data"。对于下载请求，默认的Content-Type为"application/json"。

**类型：** ?HashMap&lt;String, String&gt;

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var index

```cangjie
public var index: UInt32 = 0
```

**功能：** 任务的路径索引，通常用于任务断点续传，默认为0。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var metered

```cangjie
public var metered: Bool = false
```

**功能：** 是否允许在按流量计费的网络中工作，默认为false。true：是。false：否。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var method

```cangjie
public var method: ?String = None
```

**功能：** 上传或下载的HTTP标准方法，包括GET、POST和PUT，不区分大小写。上传时，使用PUT或POST，默认值为PUT。下载时，使用GET或POST，默认值为GET。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var mode

```cangjie
public var mode: ?Mode = None
```

**功能：** 任务模式, 默认为后台任务。

**类型：** ?[Mode](#enum-mode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var network

```cangjie
public var network: Network = Network.ANY
```

**功能：** 网络选项，当前支持无线网络WIFI和蜂窝数据网络CELLULAR，默认为ANY（WIFI或CELLULAR）。

**类型：** [Network](#enum-network)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var overwrite

```cangjie
public var overwrite: Bool = false
```

**功能：** 下载过程中路径已存在时的解决方案选择，默认为false。true：覆盖已存在的文件。false：下载失败。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var precise

```cangjie
public var precise: Bool = false
```

**功能：** 如果设置为true，在上传/下载无法获取文件大小时任务失败。如果设置为false，将文件大小设置为-1时任务继续。默认值为false。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var priority

```cangjie
public var priority: UInt32 = 0
```

**功能：** 任务的优先级。任务模式相同的情况下，该配置项的数字越小优先级越高，默认值为0。

**类型：** UInt32

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var redirect

```cangjie
public var redirect: Bool = true
```

**功能：** 是否允许重定向，默认为true。true：是。false：否。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var retry

```cangjie
public var retry: Bool = true
```

**功能：** 是否为后台任务启用自动重试，仅应用于后台任务，默认为true。true：是。false：否。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var roaming

```cangjie
public var roaming: Bool = true
```

**功能：** 是否允许在漫游网络中工作，默认为true。true：是。false：否。

**类型：** Bool

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var saveas

```cangjie
public var saveas: ?String = None
```

**功能：** 保存下载文件的路径，包括如下几种：
-相对路径，位于调用方的缓存路径下，如"./xxx/yyy/zzz.html"、"xxx/yyy/zzz.html"。
-internal协议路径，仅支持"internal://cache/"及其子路径，如"internal://cache/path/to/file.txt"。-应用沙箱目录，只支持到base及其子目录下，如"/data/storage/el1/base/path/to/file.txt"。
-file协议路径，必须匹配应用包名，只支持到base及其子目录下，如"file://com.example.test/data/storage/el2/base/file.txt"。
默认为相对路径，即下载至调用方当前缓存路径下。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var title

```cangjie
public var title: ?String = None
```

**功能：** 任务标题，其最大长度为256个字符，默认值为小写的upload或download，与上面的action保持一致。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var token

```cangjie
public var token: ?String = None
```

**功能：** 当创建了一个带有token的任务后，token则为正常查询期间必须提供的，否则将无法通过查询进行检索。其最小长度为8个字节，最大长度为2048个字节。默认为空。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var url

```cangjie
public var url: String
```

**功能：** 资源地址，其最大长度为2048个字符。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

### Config(Action, String, ?String, ?String, ?Mode, Bool, ?String, ?HashMap\<String, String>, ?ConfigDataType, ?String, Network, Bool, Bool, Bool, Bool, UInt32, Int64, Int64, Bool, Bool, ?String, UInt32, ?HashMap\<String, String>)

```cangjie
public Config(
    public var action!: Action,
    public var url!: String,
    public var title!: ?String = None,
    public var description!: ?String = None,
    public var mode!: ?Mode = None,
    public var overwrite!: Bool = false,
    public var method!: ?String= None,
    public var headers!: ?HashMap<String, String> = None,
    public var data!: ?ConfigDataType = None,
    public var saveas!: ?String = None,
    public var network!: Network = Network.ANY,
    public var metered!: Bool = false,
    public var roaming!: Bool = true,
    public var retry!: Bool = true,
    public var redirect!: Bool = true,
    public var index!: UInt32 = 0,
    public var begins!: Int64 = 0,
    public var ends!: Int64 = -1,
    public var gauge!: Bool = false,
    public var precise!: Bool = false,
    public var token!: ?String = None,
    public var priority!: UInt32 = 0,
    public var extras!: ?HashMap<String, String> = None
)
```

**功能：** 创建Config对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|action|[Action](#enum-action)|是|-| **命名参数。** 任务操作选项。<br>- UPLOAD表示上传任务。<br>- DOWNLOAD表示下载任务。|
|url|String|是|-| **命名参数。** 资源地址，其最大长度为2048个字符。|
|title|?String|否|None| **命名参数。** 任务标题，其最大长度为256个字符，默认值为小写的upload 或download，与上面的action 保持一致。|
|description|?String|否|None| **命名参数。** 任务的详细信息，其最大长度为1024个字符，默认值为空字符串。|
|mode|?[Mode](#enum-mode)|否|None| **命名参数。** 任务模式, 默认为后台任务。|
|overwrite|Bool|否|false| **命名参数。** 下载过程中路径已存在时的解决方案选择，默认为false。<br>- true，覆盖已存在的文件。<br>- false，下载失败。|
|method|?String|否|None| **命名参数。** 上传或下载的HTTP标准方法，包括GET、POST和PUT，不区分大小写。<br>-上传时，使用PUT或POST，默认值为PUT。<br>-下载时，使用GET或POST，默认值为GET。|
|headers|?HashMap&lt;String, String&gt;|否|None| **命名参数。** 添加要包含在任务中的HTTP协议标志头。<br>-对于上传请求，默认的Content-Type为"multipart/form-data"。<br>-对于下载请求，默认的Content-Type为"application/json"。 |
|data|?[ConfigDataType](#enum-configdatatype)|否|None| **命名参数。** -下载时，data为字符串类型，通常使用json(object将被转换为json文本)，默认为空。<br>-上传时，data是表单项数组Array&lt;FormItem&gt;，默认为空。|
|saveas|?String|否|None| **命名参数。** 保存下载文件的路径，包括如下几种：<br>-相对路径，位于调用方的缓存路径下，如"./xxx/yyy/zzz.html"、"xxx/yyy/zzz.html"。<br>-internal协议路径，仅支持"internal://cache/"及其子路径，如"internal://cache/path/to/file.txt"。<br>-应用沙箱目录，只支持到base及其子目录下，如"/data/storage/el1/base/path/to/file.txt"。<br>-file协议路径，必须匹配应用包名，只支持到base及其子目录下，如"file://com.example.test/data/storage/el2/base/file.txt"。<br>默认为相对路径，即下载至调用方当前缓存路径下。|
|network|[Network](#enum-network)|否|Network.ANY| **命名参数。** 网络选项，当前支持无线网络WIFI和蜂窝数据网络CELLULAR，默认为ANY（WIFI或CELLULAR）。|
|metered|Bool|否|false| **命名参数。** 是否允许在按流量计费的网络中工作，默认为false。<br>-true：是<br>-false：否|
|roaming|Bool|否|true| **命名参数。** 是否允许在漫游网络中工作，默认为true。<br>-true：是<br>-false：否|
|retry|Bool|否|true| **命名参数。** 是否为后台任务启用自动重试，仅应用于后台任务，默认为true。<br>-true：是<br>-false：否|
|redirect|Bool|否|true| **命名参数。** 是否允许重定向，默认为true。<br>-true：是<br>-false：否|
|index|UInt32|否|0| **命名参数。** 任务的路径索引，通常用于任务断点续传，默认为0。 |
|begins|Int64|否|0| **命名参数。** 文件起点，通常用于断点续传。默认值为0，取值为闭区间。<br>-下载时，请求读取服务器开始下载文件时的起点位置（http协议中设置"Range"选项）。<br>-上传时，在上传开始时读取。|
|ends|Int64|否|- 1| **命名参数。** 文件终点，通常用于断点续传。默认值为-1，取值为闭区间。<br>-下载时，请求读取服务器开始下载文件时的结束位置（http协议中设置"Range"选项）。<br>-上传时，在上传时结束读取。|
|gauge|Bool|否|false| **命名参数。** 后台任务的过程进度通知策略，仅应用于后台任务，默认值为false。<br>-false：代表仅完成或失败的通知。<br>-true：发出每个进度已完成或失败的通知。|
|precise|Bool|否|false| **命名参数。** -如果设置为true，在上传/下载无法获取文件大小时任务失败。<br>-如果设置为false，将文件大小设置为-1时任务继续。<br>默认值为false。|
|token|?String|否|None| **命名参数。** 当创建了一个带有token的任务后，token则为正常查询期间必须提供的，否则将无法通过查询进行检索。其最小为8个字节，最大为2048个字节。默认为空。|
|priority|UInt32|否|0| **命名参数。** 任务的优先级。任务模式相同的情况下，该配置项的数字越小优先级越高，默认值为0。|
|extras|?HashMap&lt;String, String&gt;|否|None| **命名参数。** 配置的附加功能，默认为空。|

## class FileSpec

```cangjie
public class FileSpec {
    public FileSpec(
        public var path!: String,
        public var mimeType!: ?String = None,
        public var filename!: ?String = None,
        public var extras!: ?HashMap<String, String> = None
    )
}
```

**功能：** 表单项的文件信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var extras

```cangjie
public var extras: ?HashMap<String, String>= None
```

**功能：** 文件信息的附加内容。

**类型：** ?HashMap\<String, String>

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var filename

```cangjie
public var filename: ?String = None
```

**功能：** 文件名，默认值通过路径获取。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var mimeType

```cangjie
public var mimeType: ?String = None
```

**功能：** 文件的mimetype通过文件名获取。

**类型：** ?String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var path

```cangjie
public var path: String
```

**功能：** 文件路径：位于调用方的缓存文件夹下的相对路径或用户公共文件，如"file://media/Photo/path/to/file.img"。
仅支持前端任务。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FileSpec(String, ?String, ?String, ?HashMap\<String, String>)

```cangjie
public FileSpec(
    public var path!: String,
    public var mimeType!: ?String = None,
    public var filename!: ?String = None,
    public var extras!: ?HashMap<String, String> = None
)
```

**功能：** 创建FileSpec对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|path|String|是|-| **命名参数。** 文件路径：<br>- 位于调用方的缓存文件夹下的相对路径。<br>- 用户公共文件，如"file://media/Photo/path/to/file.img"。仅支持前端任务。 |
|mimeType|?String|否|None| **命名参数。** 文件的mimetype通过文件名获取。|
|filename|?String|否|None| **命名参数。** 文件名，默认值通过路径获取。|
|extras|?HashMap\<String, String>|否|None| **命名参数。** 文件信息的附加内容。|

## class Filter

```cangjie
public class Filter {
    public Filter (
        var bundle!: ?String = None,
        public var before!: ?Int64 = None,
        public var after!: ?Int64 = None,
        public var state!: ?State = None,
        public var action!: ?Action = None,
        public var mode!: ?Mode = None
    )
}
```

**功能：** 过滤条件。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var action

```cangjie
public var action: ?Action = None
```

**功能：** 任务操作选项。UPLOAD表示上传任务。DOWNLOAD表示下载任务。

**类型：** ?[Action](#enum-action)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var after

```cangjie
public var after: ?Int64 = None
```

**功能：** 开始的Unix时间戳（毫秒），默认值为调用时刻减24小时。

**类型：** ?Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var before

```cangjie
public var before: ?Int64 = None
```

**功能：** 结束的Unix时间戳（毫秒），默认为调用时刻。

**类型：** ?Int64

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var mode

```cangjie
public var mode: ?Mode = None
```

**功能：** 任务模式。FOREGROUND表示前端任务。BACKGROUND表示后台任务。如果未填写，则查询所有任务。

**类型：** ?[Mode](#enum-mode)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var state

```cangjie
public var state: ?State = None
```

**功能：** 指定任务的状态。

**类型：** ?[State](#enum-state)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### Filter(?String, ?Int64, ?Int64, ?State, ?Action, ?Mode)

```cangjie
public Filter (
    var bundle!: ?String = None,
    public var before!: ?Int64 = None,
    public var after!: ?Int64 = None,
    public var state!: ?State = None,
    public var action!: ?Action = None,
    public var mode!: ?Mode = None
)
```

**功能：** 创建Filter对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|bundle|?String|否|None| **命名参数。** 应用程序的包名。|
|before|?Int64|否|None| **命名参数。** 结束的Unix时间戳（毫秒），默认为调用时刻。|
|after|?Int64|否|None| **命名参数。** 开始的Unix时间戳（毫秒），默认值为调用时刻减24小时。 |
|state|?[State](#enum-state)|否|None| **命名参数。** 指定任务的状态。|
|action|?[Action](#enum-action)|否|None| **命名参数。** 任务操作选项。<br>-UPLOAD表示上传任务。<br>-DOWNLOAD表示下载任务。|
|mode|?[Mode](#enum-mode)|否|None| **命名参数。** 任务模式。<br>-FOREGROUND表示前端任务。<br>-BACKGROUND表示后台任务。<br>-如果未填写，则查询所有任务。|

## class FormItem

```cangjie
public class FormItem {
    public FormItem(
        public var name!: String,
        public var value!: FormItemValueType
    )
}
```

**功能：** 上传/下载任务的配置信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var name

```cangjie
public var name: String
```

**功能：** 表单参数名。

**类型：** String

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### var value

```cangjie
public var value: FormItemValueType
```

**功能：** 表单参数值。

**类型：** [FormItemValueType](#enum-formitemvaluetype)

**读写能力：** 可读写

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FormItem(String, FormItemValueType)

```cangjie
public FormItem(
    public var name!: String,
    public var value!: FormItemValueType
)
```

**功能：** 创建FormItem对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|name|String|是|-| **命名参数。** 表单参数名。|
|value|[FormItemValueType](#enum-formitemvaluetype)|是|-| **命名参数。** 表单参数值。|

## class HttpResponseMessage

```cangjie
public class HttpResponseMessage {
    public let version: String,
    public let statusCode: Int32,
    public let reason: String,
    public let headers: HashMap<String, Array<String>>
}
```

**功能：** 任务响应头的数据结构。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let headers

```cangjie
public let headers: HashMap<String, Array<String>>
```

**功能：** Http响应头部。

**类型：** HashMap\<String, Array\<String>>

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let reason

```cangjie
public let reason: String
```

**功能：** Http响应原因。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let statusCode

```cangjie
public let statusCode: Int32
```

**功能：** Http响应状态码。

**类型：** Int32

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let version

```cangjie
public let version: String
```

**功能：** Http版本。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

## class Progress

```cangjie
public class Progress {
    public Progress(
        public let state!: State,
        public let index!: UInt32,
        public let processed!: Int64,
        public let sizes!: Array<Int64>,
        public let extras!: HashMap<String, String>
    )
}
```

**功能：** 任务进度的数据结构。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let extras

```cangjie
public let extras: HashMap<String, String>
```

**功能：** 交互的额外内容，例如来自服务器的响应的header和body。

**类型：** ?HashMap\<String, String>

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let index

```cangjie
public let index: UInt32
```

**功能：** 任务中当前正在处理的文件索引。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let processed

```cangjie
public let processed: Int64
```

**功能：** 任务中当前文件的已处理数据大小，单位为B。

**类型：** Int64

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let sizes

```cangjie
public let sizes: Array<Int64>
```

**功能：** 任务中文件的大小，单位为B。

**类型：** Array\<Int64>

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let state

```cangjie
public let state: State
```

**功能：** 任务当前的状态。

**类型：** [State](#enum-state)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### Progress(State, UInt32, Int64, Array\<Int64>, HashMap\<String, String>)

```cangjie
public Progress(
    public let state!: State,
    public let index!: UInt32,
    public let processed!: Int64,
    public let sizes!: Array<Int64>,
    public let extras!: HashMap<String, String>
)
```

**功能：** 创建Progress对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|state|[State](#enum-state)|是|-| **命名参数。** 任务当前的状态。|
|index|UInt32|是|-| **命名参数。** 任务中当前正在处理的文件索引。|
|processed|Int64|是|-| **命名参数。** 任务中当前文件的已处理数据大小，单位为B。|
|sizes|Array\<Int64>|是|-| **命名参数。** 任务中文件的大小，单位为B。|
|extras|?HashMap\<String, String>|是|-| **命名参数。** 交互的额外内容，例如来自服务器的响应的header和body。|

## class Task

```cangjie
public class Task {
    public Task(
        public let tid: String,
        public let config: Config
    )
}
```

**功能：** 上传或下载任务。使用该方法前需要先获取Task对象，通过create获取。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let config

```cangjie
public let config: Config
```

**功能：** 任务的配置信息。

**类型：** [Config](#class-config)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let tid

```cangjie
public let tid: String
```

**功能：** 任务id，在系统上是唯一的，由系统自动生成。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### Task(String, Config)

```cangjie
public Task(
    public let tid: String,
    public let config: Config
)
```

**功能：** 创建Task对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|tid|String|是|-|任务id，在系统上是唯一的，由系统自动生成。|
|config|[Config](#class-config)|是|-|任务的配置信息。|

### func off(String, ?CallbackObject)

```cangjie
public func off(event: String, callback!: ?CallbackObject = None): Unit
```

**功能：** 取消订阅任务事件。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|订阅的事件类型。<br>- 取值为'progress'，表示任务进度。<br>- 取值为'completed'，表示任务完成。<br>- 取值为'failed'，表示任务失败。<br>- 取值为'pause'，表示任务暂停。<br>- 取值为'resume'，表示任务恢复。<br>- 取值为'remove'，表示任务删除。<br>- 取值为'response'，表示任务响应。|
|callback|?[CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject)|否|None| **命名参数。** 需要取消订阅的回调函数。若无此参数，则取消订阅当前类型的所有回调函数。|

### func on(String, Callback1Argument\<HttpResponseMessage>)

```cangjie
public func on(event: String, callback: Callback1Argument<HttpResponseMessage>): Unit
```

**功能：** 订阅任务的事件。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|订阅的事件类型。<br>- 取值为'response'，表示任务响应。 |
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[HttpResponseMessage](#class-httpresponsemessage)>|是|-|发生相关的事件时触发该回调方法，返回任务响应头的数据结构。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[通用错误码](../../errorcodes/cj-errorcode-universal.md)

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.Action as RAction
import ohos.base.BusinessException

// 此处代码可添加在依赖项定义中
class ResponseCallback <: Callback1Argument<HttpResponseMessage> {
    public init() {}
    public open func invoke(arg: HttpResponseMessage): Unit {
        Hilog.info(0, "request", "response callback.")
    }
}
let fileSpec = FileSpec(
    path: "./taskOnTest.avi",
    filename: "taskOnTest.avi",
    mimeType: "application/octet-stream"
)
let attachments = ConfigDataType.FORMITEMS(
    [
        FormItem(
            name: "taskOnTest",
            value: FormItemValueType.FILE(fileSpec)
        )
    ]
)
let config = Config(
    action: RAction.UPLOAD,
    url: "http://127.0.0.1",
    title: "taskOnTest",
    mode: Mode.FOREGROUND,
    description: "Sample code for event listening",
    overwrite: false,
    method: "PUT",
    data: attachments,
    saveas: "./",
    network: Network.CELLULAR,
    metered: false,
    roaming: true,
    retry: true,
    redirect: true,
    index: 0,
    begins: 0,
    ends: -1,
    gauge: false,
    precise: false,
    token: "it is a secret"
)
let responseOnCallback = ResponseCallback()
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.on("response", responseOnCallback)
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

### func on(String, Callback1Argument\<Progress>)

```cangjie
public func on(event: String, callback: Callback1Argument<Progress>): Unit
```

**功能：** 订阅任务的事件。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|event|String|是|-|订阅的事件类型。<br>- 取值为'progress'，表示任务进度。<br>- 取值为'completed'，表示任务完成。<br>- 取值为'failed'，表示任务失败。<br>- 取值为'pause'，表示任务暂停。<br>- 取值为'resume'，表示任务恢复。<br>- 取值为'remove'，表示任务删除。|
|callback|[Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[Progress](#class-progress)>|是|-|发生相关的事件时触发该回调方法，返回任务信息的数据结构。|

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 21900005 | task mode error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.BasicServicesKit.Action as RAction
import kit.PerformanceAnalysisKit.*
import ohos.base.*

// 此处代码可添加在依赖项定义中
class ProgressCallback <: Callback1Argument<Progress> {
    public init() {}
    public open func invoke(arg: Progress): Unit {
        Hilog.info(0, "request", "progress callback.")
    }
}

let fileSpec = FileSpec(
    path: "./taskOnTest.avi",
    filename: "taskOnTest.avi",
    mimeType: "application/octet-stream"
)
let attachments = ConfigDataType.FORMITEMS(
    [
        FormItem(
            name: "taskOnTest",
            value: FormItemValueType.FILE(fileSpec)
        )
    ]
)
let config = Config(
    action: RAction.UPLOAD,
    url: "http://127.0.0.1",
    title: "taskOnTest",
    mode: Mode.FOREGROUND,
    description: "Sample code for event listening",
    overwrite: false,
    method: "PUT",
    data: attachments,
    saveas: "./",
    network: Network.CELLULAR,
    metered: false,
    roaming: true,
    retry: true,
    redirect: true,
    index: 0,
    begins: 0,
    ends: -1,
    gauge: false,
    precise: false,
    token: "it is a secret"
)
let createOnCallback =ProgressCallback()
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.on("progress", createOnCallback)
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

### func pause()

```cangjie
public func pause(): Unit
```

**功能：** 暂停任务，可以暂停正在等待/正在运行/正在重试的后台任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900005 | task mode error. |
  | 21900007 | task state error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

let config = Config(
    action: Action.DOWNLOAD,
    url: "http://127.0.0.1",
    overwrite: true
)
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.pause()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskPause", "${e}")
}
```

### func resume()

```cangjie
public func resume(): Unit
```

**功能：** 重新启动任务，可以恢复暂停的后台任务。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900005 | task mode error. |
  | 21900007 | task state error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

let config = Config(
    action: Action.DOWNLOAD,
    url: "http://127.0.0.1",
    overwrite: true
)
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.resume()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskResume", "${e}")
}
```

### func start()

```cangjie
public func start(): Unit
```

**功能：** 启动任务，无法启动已初始化的任务。可以启动一个已失败或已停止的下载任务，从上次的进度开始续传。

**需要权限：** ohos.permission.INTERNET

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900007 | task state error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

let config = Config(
    action: Action.DOWNLOAD,
    url: "http://127.0.0.1",
    overwrite: true
)
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.start()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskStart", e.toString())
}
```

### func stop()

```cangjie
public func stop(): Unit
```

**功能：** 停止任务，可以停止正在运行/正在等待/正在重试的任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**异常：**

- BusinessException：对应错误码的详细介绍请参见[上传下载错误码](../../errorcodes/cj-errorcode-request.md)。

  | 错误码ID | 错误信息 |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900007 | task state error. |

**示例：**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.BusinessException

let config = Config(
    action: Action.DOWNLOAD,
    url: "http://127.0.0.1",
)
try {
    let task = create(Global.getStageContext(), config) // 需获取Context应用上下文，详见本文使用说明
    task.stop()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskStop", "${e}")
}
```

## class TaskInfo

```cangjie
public class TaskInfo {
    public let uid: ?String
    public let bundle: ?String
    public let saveas: ?String
    public let url: ?String
    public let data: ?ConfigDataType
    public let tid: String
    public let title: String
    public let description: String
    public let action: Action
    public let mode: Mode
    public let priority: UInt32
    public let mimeType: String
    public let progress: Progress
    public let gauge: Bool
    public let ctime: UInt64
    public let mtime: UInt64
    public let retry: Bool
    public let tries: UInt32
    public let faults: ?Faults
    public let reason: String
    public let extras: ?HashMap<String, String>

    public init(
        uid!: ?String = None,
        bundle!: ?String = None,
        saveas!: ?String = None,
        url!: ?String = None,
        data!: ?ConfigDataType = None,
        tid!: String,
        title!: String,
        description!: String,
        action!: Action,
        mode!: Mode,
        priority!: UInt32,
        mimeType!: String,
        progress!: Progress,
        gauge!: Bool,
        ctime!: UInt64,
        mtime!: UInt64,
        retry!: Bool,
        tries!: UInt32,
        reason!: String,
        faults!: ?Faults,
        extras!: ?HashMap<String, String>
    )
}
```

**功能：** 查询结果的任务信息数据结构，提供普通查询和系统查询，两种字段的可见范围不同。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let action

```cangjie
public let action: Action
```

**功能：** 任务操作选项。UPLOAD表示上传任务。DOWNLOAD表示下载任务。

**类型：** [Action](#enum-action)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let bundle

```cangjie
public let bundle:?String
```

**功能：** **命名参数。** 应用程序的包名。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let ctime

```cangjie
public let ctime: UInt64
```

**功能：** 创建任务的Unix时间戳（毫秒），由当前设备的系统生成。

**类型：** UInt64

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let data

```cangjie
public let data: ?ConfigDataType = None
```

**功能：** 任务值。

**类型：** ?[ConfigDataType](#enum-configdatatype)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let description

```cangjie
public let description: String
```

**功能：** 任务描述。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let extras

```cangjie
public let extras: ?HashMap<String, String>
```

**功能：** 任务的额外部分。

**类型：** ?HashMap\<String, String>

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let faults

```cangjie
public let faults: ?Faults
```

**功能：** 任务的失败原因。OTHERS表示其他故障。DISCONNECT表示网络断开连接。TIMEOUT表示任务超时。PROTOCOL表示协议错误。FSIO表示文件系统io错误。

**类型：** ?[Faults](#enum-faults)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let gauge

```cangjie
public let gauge: Bool
```

**功能：** 后台任务的进度通知策略。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let mimeType

```cangjie
public let mimeType: String
```

**功能：** 任务配置中的mimetype。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let mode

```cangjie
public let mode: Mode
```

**功能：** 指定任务模式。FOREGROUND表示前端任务。BACKGROUND表示后台任务。

**类型：** [Mode](#enum-mode)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let mtime

```cangjie
public let mtime: UInt64
```

**功能：** 任务状态改变时的Unix时间戳（毫秒），由当前设备的系统生成。

**类型：** UInt64

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let priority

```cangjie
public let priority: UInt32
```

**功能：** 任务配置中的优先级。前端任务的优先级比后台任务高。相同模式的任务，数字越小优先级越高。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let progress

```cangjie
public let progress: Progress
```

**功能：** 任务的过程进度。

**类型：** [Progress](#class-progress)

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let reason

```cangjie
public let reason: String
```

**功能：** 等待/失败/停止/暂停任务的原因。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let retry

```cangjie
public let retry: Bool
```

**功能：** 任务的重试开关，仅应用于后台任务。

**类型：** Bool

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let saveas

```cangjie
public let saveas: ?String = None
```

**功能：** 保存下载文件的路径。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let tid

```cangjie
public let tid: String
```

**功能：** 任务id。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let title

```cangjie
public let title: String
```

**功能：** 任务标题。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let tries

```cangjie
public let tries: UInt32
```

**功能：** 任务的尝试次数。

**类型：** UInt32

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let uid

```cangjie
public let uid:?String
```

**功能：** **命名参数。** 任务uid。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### let url

```cangjie
public let url:?String
```

**功能：** 任务的url。

**类型：** ?String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### init(?String, ?String, ?String, ?String, ?ConfigDataType, String, String, String, Action, Mode, UInt32, String, Progress, Bool, UInt64, UInt64, Bool, UInt32, String, ?Faults, ?HashMap\<String, String>)

```cangjie
public init(
    uid!: ?String = None,
    bundle!: ?String = None,
    saveas!: ?String = None,
    url!: ?String = None,
    data!: ?ConfigDataType = None,
    tid!: String,
    title!: String,
    description!: String,
    action!: Action,
    mode!: Mode,
    priority!: UInt32,
    mimeType!: String,
    progress!: Progress,
    gauge!: Bool,
    ctime!: UInt64,
    mtime!: UInt64,
    retry!: Bool,
    tries!: UInt32,
    reason!: String,
    faults!: ?Faults,
    extras!: ?HashMap<String, String>
)
```

**功能：** 创建TaskInfo对象。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**参数：**

|参数名|类型|必填|默认值|说明|
|:---|:---|:---|:---|:---|
|uid|?String|否|None| **命名参数。** 任务uid。|
|bundle|?String|否|None| **命名参数。** 应用程序的包名。|
|saveas|?String|否|None| **命名参数。** 保存下载文件的路径。|
|url|?String|否|None| **命名参数。** 任务的url。|
|data|?[ConfigDataType](#enum-configdatatype)|否|None| **命名参数。** 任务值。|
|tid|String|是|-| **命名参数。** 任务id。|
|title|String|是|-| **命名参数。** 任务标题。|
|description|String|是|-| **命名参数。** 任务描述。|
|action|[Action](#enum-action)|是|-| **命名参数。** 任务操作选项。<br>-UPLOAD表示上传任务。<br>-DOWNLOAD表示下载任务。|
|mode|[Mode](#enum-mode)|是|-| **命名参数。** 指定任务模式。<br>-FOREGROUND表示前端任务。<br>-BACKGROUND表示后台任务。|
|priority|UInt32|是|-| **命名参数。** 任务配置中的优先级。前端任务的优先级比后台任务高。相同模式的任务，数字越小优先级越高。|
|mimeType|String|是|-| **命名参数。** 任务配置中的mimetype。|
|progress|[Progress](#class-progress)|是|-| **命名参数。** 任务的过程进度。|
|gauge|Bool|是|-| **命名参数。** 后台任务的进度通知策略。|
|ctime|UInt64|是|-| **命名参数。** 创建任务的Unix时间戳（毫秒），由当前设备的系统生成。|
|mtime|UInt64|是|-| **命名参数。** 任务状态改变时的Unix时间戳（毫秒），由当前设备的系统生成。|
|retry|Bool|是|-| **命名参数。** 任务的重试开关，仅应用于后台任务。|
|tries|UInt32|是|-| **命名参数。** 任务的尝试次数。|
|reason|String|是|-| **命名参数。** 等待/失败/停止/暂停任务的原因。|
|faults|?[Faults](#enum-faults)|是|-| **命名参数。** 任务的失败原因。<br>-OTHERS表示其他故障。<br>-DISCONNECT表示网络断开连接。<br>-TIMEOUT表示任务超时。<br>-PROTOCOL表示协议错误。<br>-FSIO表示文件系统io错误。|
|extras|?HashMap\<String, String>|是|-| **命名参数。** 任务的额外部分。|

## enum Action

```cangjie
public enum Action <: ToString {
    | DOWNLOAD
    | UPLOAD
    | ...
}
```

**功能：** 定义操作选项。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**父类型：**

- ToString

### DOWNLOAD

```cangjie
DOWNLOAD
```

**功能：** 表示下载任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### UPLOAD

```cangjie
UPLOAD
```

**功能：** 表示上传任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum BroadcastEvent

```cangjie
public enum BroadcastEvent {
    | COMPLETE
    | ...
}
```

**功能：** 定义自定义系统事件。用户可以使用公共事件接口获取该事件。上传下载SA具有'ohos.permission.SEND_TASK_COMPLETE_EVENT' 该权限，用户可以配置事件的metadata 指向的二级配置文件来拦截其他事件发送者。使用CommonEventData 类型传输公共事件相关数据。成员的内容填写和[CommonEventData介绍](./cj-apis-common_event_manager.md) 介绍的有所区别，其中CommonEventData.code 表示任务的状态，目前为0x40 COMPLETE或0x41 FAILED; CommonEventData.data 表示任务的taskId。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### COMPLETE

```cangjie
COMPLETE
```

**功能：** 表示任务完成事件。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### prop value

```cangjie
public prop value: String
```

**功能：** 返回该BroadcastEvent的字符串形式。

**类型：** String

**读写能力：** 只读

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

## enum ConfigDataType

```cangjie
public enum ConfigDataType {
    | STR(String)
    | FORMITEMS(Array<FormItem>)
    | ...
}
```

**功能：** 上传/下载任务的data配置枚举类型。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FORMITEMS(Array\<FormItem>)

```cangjie
FORMITEMS(Array<FormItem>)
```

**功能：** 表示上传时，data是表单项数组Array&lt;FormItem&gt;，默认为空。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### STR(String)

```cangjie
STR(String)
```

**功能：** 下载时，data为字符串类型，通常使用json(object将被转换为json文本)，默认为空。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

## enum Faults

```cangjie
public enum Faults <: ToString {
    | OTHERS
    | DISCONNECTED
    | TIMEOUT
    | PROTOCOL
    | FSIO
    | ...
}
```

**功能：** 定义任务失败的原因。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**父类型：**

- ToString

### DISCONNECTED

```cangjie
DISCONNECTED
```

**功能：** 表示网络断开连接。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FSIO

```cangjie
FSIO
```

**功能：** 表示文件系统io错误，例如打开/查找/读取/写入/关闭。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### OTHERS

```cangjie
OTHERS
```

**功能：** 表示其他故障。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### PROTOCOL

```cangjie
PROTOCOL
```

**功能：** 表示协议错误，例如：服务器内部错误（500）、无法处理的数据区间（416）等。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### TIMEOUT

```cangjie
TIMEOUT
```

**功能：** 表示任务超时。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum FormItemValueType

```cangjie
public enum FormItemValueType {
    | STR(String)
    | FILE(FileSpec)
    | FILES(Array<FileSpec>)
    | ...
}
```

**功能：** 表单项的文件信息枚举类型。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FILE(FileSpec)

```cangjie
FILE(FileSpec)
```

**功能：** 表示文件信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FILES(Array\<FileSpec>)

```cangjie
FILES(Array<FileSpec>)
```

**功能：** 表示多个文件信息。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### STR(String)

```cangjie
STR(String)
```

**功能：** 表示文件路径。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

## enum Mode

```cangjie
public enum Mode <: ToString {
    | BACKGROUND
    | FOREGROUND
    | ...
}
```

**功能：** 定义模式选项。前端任务在应用切换到后台一段时间后失败/暂停；后台任务不受影响。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**父类型：**

- ToString

### BACKGROUND

```cangjie
BACKGROUND
```

**功能：** 表示后台任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FOREGROUND

```cangjie
FOREGROUND
```

**功能：** 表示前端任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum Network

```cangjie
public enum Network <: ToString {
    | ANY
    | WIFI
    | CELLULAR
    | ...
}
```

**功能：** 定义网络选项。网络不满足设置条件时，未执行的任务等待执行，执行中的任务失败/暂停。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**父类型：**

- ToString

### ANY

```cangjie
ANY
```

**功能：** 表示不限网络类型。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### CELLULAR

```cangjie
CELLULAR
```

**功能：** 表示蜂窝数据网络。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### WIFI

```cangjie
WIFI
```

**功能：** 表示无线网络。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|

## enum State

```cangjie
public enum State <: ToString {
    | INITIALIZED
    | WAITING
    | RUNNING
    | RETRYING
    | PAUSED
    | STOPPED
    | COMPLETED
    | FAILED
    | REMOVED
    | ...
}
```

**功能：** 定义任务当前的状态。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**父类型：**

- ToString

### COMPLETED

```cangjie
COMPLETED
```

**功能：** 表示任务完成。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### FAILED

```cangjie
FAILED
```

**功能：** 表示任务失败。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### INITIALIZED

```cangjie
INITIALIZED
```

**功能：** 通过配置信息（Config）创建初始化任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### PAUSED

```cangjie
PAUSED
```

**功能：** 表示任务暂停，通常后续会恢复任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### REMOVED

```cangjie
REMOVED
```

**功能：** 表示任务移除。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### RETRYING

```cangjie
RETRYING
```

**功能：** 表示任务至少失败一次，现在正在再次处理中。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### RUNNING

```cangjie
RUNNING
```

**功能：** 表示正在处理的任务。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### STOPPED

```cangjie
STOPPED
```

**功能：** 表示任务停止。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### WAITING

```cangjie
WAITING
```

**功能：** 表示任务缺少运行或重试的资源与网络状态不匹配。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

### func toString()

```cangjie
public func toString(): String
```

**功能：** 获取当前枚举的字符串表示。

**系统能力：** SystemCapability.Request.FileTransferAgent

**起始版本：** 21

**返回值：**

|类型|说明|
|:----|:----|
|String|当前枚举的字符串表示。|
