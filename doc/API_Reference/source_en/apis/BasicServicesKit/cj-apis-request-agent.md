# ohos.request.agent (Upload and Download)

The request component provides applications with fundamental capabilities for uploading/downloading files and background transfer proxy.

## Import Module

```cangjie
import kit.BasicServicesKit.*
```

## Permission List

ohos.permission.INTERNET

## Usage Instructions

API example code usage instructions:

- If the first line of example code contains a "// index.cj" comment, it indicates the example can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the example requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration is needed in the "main_ability.cj" file of the Cangjie template project.

For details about the example project and configuration template mentioned above, refer to [Cangjie Example Code Description](../../cj-development-intro.md#Cangjie-Example-Code-Description).

## func create(StageContext, Config)

```cangjie
public func create(context: StageContext, config: Config): Task
```

**Function:** Creates an upload or download task and enqueues it. Each application can create up to 10 unfinished tasks.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application-based context. |
| config | [Config](#class-config) | Yes | - | Configuration information for the upload/download task. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Task](#class-task) | Returns a Task object containing the task ID and configuration information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 201 | The permissions check fails. |
  | 401 | The parameters check fails. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |
  | 13400001 | Failed to open file errno xx. |
  | 13400003 | Task service ability error. |
  | 21900004 | Application task queue full error. |
  | 21900005 | Task mode error. |

**Example:**

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
    let task = create(Global.getStageContext(), config)  // Requires obtaining Context application context; see Usage Instructions above.
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

## func getTask(StageContext, String, ?String)

```cangjie
public func getTask(context: StageContext, id: String, token!: ?String = None): Task
```

**Function:** Queries a task by its ID.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| context | [StageContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application-based context. |
| id | String | Yes | - | Task ID. |
| token | ?String | No | None | **Named parameter.** Task query token. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Task](#class-task) | Returns a Task object containing the task ID and configuration information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |
  | 13400003 | Task service ability error. |
  | 21900006 | Task not found. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import ohos.base.*

try {
    let task = getTask(Global.getStageContext(), "123456")  // Requires obtaining Context application context; see Usage Instructions above.
} catch (e: BusinessException) {
    Hilog.error(0, "GetTask", "Failed to get task, ${e}")
}
```

## func remove(String)

```cangjie
public func remove(id: String): Unit
```

**Function:** Removes a specified task belonging to the caller. If the task is in progress, it will be forcibly stopped.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Task ID. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 13400003 | Task service ability error. |
  | 21900006 | Task not found error. |

**Example:**

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

**Function:** Searches for task IDs based on the default [Filter](#class-filter) conditions.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns task IDs that meet the conditions. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 401 | Parameter error. Possible causes: 1. Incorrect parameter type 2. Parameter verification failed. |
  | 13400003 | Task service ability error. |

**Example:**

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

**Function:** Searches for task IDs based on [Filter](#class-filter) conditions.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| filter | [Filter](#class-filter) | Yes | - | Filter conditions. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns task IDs that meet the conditions. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 401 | Parameter error. Possible causes: 1. Incorrect parameter type 2. Parameter verification failed. |
  | 13400003 | Task service ability error. |

**Example:**

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

**Function:** Queries detailed task information based on the task ID.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description       |
|:----------|:-------|:----------|:--------|:------------------|
| id        | String | Yes       | -       | The task ID.      |

**Return Value:**

| Type                | Description                      |
|:--------------------|:---------------------------------|
| [TaskInfo](#class-taskinfo) | Returns a TaskInfo object containing detailed task information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:--------------|:--------------|
  | 401           | Parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type. |
  | 13400003      | Task service ability error. |
  | 21900006      | Task not found. |

**Example:**

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

**Function:** Queries detailed task information based on the task ID and token.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type   | Mandatory | Default | Description       |
|:----------|:-------|:----------|:--------|:------------------|
| id        | String | Yes       | -       | The task ID.      |
| token     | String | Yes       | -       | The task query token. |

**Return Value:**

| Type                | Description                      |
|:--------------------|:---------------------------------|
| [TaskInfo](#class-taskinfo) | Returns a TaskInfo object containing detailed task information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  |:--------------|:--------------|
  | 401           | Parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |
  | 13400003      | Task service ability error. |
  | 21900006      | Task not found. |

**Example:**

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

**Function:** Configuration information for upload/download tasks.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var action

```cangjie
public var action: Action
```

**Function:** Task operation option. UPLOAD indicates an upload task, DOWNLOAD indicates a download task.

**Type:** [Action](#enum-action)

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var begins

```cangjie
public var begins: Int64 = 0
```

**Function:** File starting point, typically used for resumable transfers. Default value is 0 (inclusive). For downloads, it specifies the starting position for reading from the server (sets the "Range" option in HTTP protocol). For uploads, it specifies the starting position for reading during upload.

**Type:** Int64

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var data

```cangjie
public var data: ?ConfigDataType = None
```

**Function:** For downloads, data is of string type (typically JSON; objects will be converted to JSON text), default is empty. For uploads, data is an array of form items Array\<FormItem>, default is empty.

**Type:** ?[ConfigDataType](#enum-configdatatype)

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var description

```cangjie
public var description: ?String = None
```

**Function:** Detailed information about the task, with a maximum length of 1024 characters. Default is an empty string.

**Type:** ?String

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var ends

```cangjie
public var ends: Int64 = -1
```

**Function:** File ending point, typically used for resumable transfers. Default value is -1 (inclusive). For downloads, it specifies the ending position for reading from the server (sets the "Range" option in HTTP protocol). For uploads, it specifies the ending position for reading during upload.

**Type:** Int64

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var extras

```cangjie
public var extras: ?HashMap<String, String>= None
```

**Function:** Additional features of the configuration. Default is empty.

**Type:** ?HashMap&lt;String, String&gt;

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var gauge

```cangjie
public var gauge: Bool = false
```

**Function:** Progress notification strategy for background tasks (applies only to background tasks). Default is false. false: Only completion or failure notifications. true: Notifications for each progress completion or failure.

**Type:** Bool

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var headers

```cangjie
public var headers: ?HashMap<String, String>= None
```

**Function:** Adds HTTP protocol headers to be included in the task. For upload requests, the default Content-Type is "multipart/form-data". For download requests, the default Content-Type is "application/json".

**Type:** ?HashMap&lt;String, String&gt;

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var index

```cangjie
public var index: UInt32 = 0
```

**Function:** Path index of the task, typically used for resumable transfers. Default is 0.

**Type:** UInt32

**Read/Write Permission:** Read/Write

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var metered
```cangjie
public var metered: Bool = false
```

**Function:** Whether to allow operation in metered networks, default is false. true: Yes. false: No.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var method

```cangjie
public var method: ?String = None
```

**Function:** HTTP standard method for upload or download, including GET, POST, and PUT (case-insensitive). For uploads, use PUT or POST (default is PUT). For downloads, use GET or POST (default is GET).

**Type:** ?String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var mode

```cangjie
public var mode: ?Mode = None
```

**Function:** Task mode, default is background task.

**Type:** ?[Mode](#enum-mode)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var network

```cangjie
public var network: Network = Network.ANY
```

**Function:** Network options, currently supports WIFI and CELLULAR (mobile data), default is ANY (WIFI or CELLULAR).

**Type:** [Network](#enum-network)

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var overwrite

```cangjie
public var overwrite: Bool = false
```

**Function:** Solution for path conflicts during download, default is false. true: Overwrite existing file. false: Download fails.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var precise

```cangjie
public var precise: Bool = false
```

**Function:** If set to true, task fails when file size cannot be obtained during upload/download. If false, task continues with file size set to -1. Default is false.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var priority

```cangjie
public var priority: UInt32 = 0
```

**Function:** Task priority. For tasks with the same mode, lower values indicate higher priority. Default is 0.

**Type:** UInt32

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var redirect

```cangjie
public var redirect: Bool = true
```

**Function:** Whether to allow redirection, default is true. true: Yes. false: No.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var retry

```cangjie
public var retry: Bool = true
```

**Function:** Whether to enable automatic retry for background tasks (applies only to background tasks), default is true. true: Yes. false: No.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var roaming

```cangjie
public var roaming: Bool = true
```

**Function:** Whether to allow operation in roaming networks, default is true. true: Yes. false: No.

**Type:** Bool

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var saveas

```cangjie
public var saveas: ?String = None
```

**Function:** Path to save downloaded files, including:
- Relative path (under caller's cache path), e.g., "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html".
- Internal protocol path (only supports "internal://cache/" and subpaths), e.g., "internal://cache/path/to/file.txt".
- Application sandbox directory (only supports base and subdirectories), e.g., "/data/storage/el1/base/path/to/file.txt".
- File protocol path (must match application package name, only supports base and subdirectories), e.g., "file://com.example.test/data/storage/el2/base/file.txt".
Default is relative path (downloads to caller's current cache path).

**Type:** ?String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var title

```cangjie
public var title: ?String = None
```

**Function:** Task title (max 256 characters). Default is lowercase "upload" or "download", matching the action above.

**Type:** ?String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var token

```cangjie
public var token: ?String = None
```

**Function:** When a task is created with a token, the token is required for normal queries; otherwise, retrieval via query is impossible. Minimum length: 8 bytes. Maximum length: 2048 bytes. Default is empty.

**Type:** ?String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### var url

```cangjie
public var url: String
```

**Function:** Resource address (max 2048 characters).

**Type:** String

**Read/Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

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

**Function:** Creates a Config object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| action | [Action](#enum-action) | Yes | - | **Named parameter.** Task operation option.<br>- UPLOAD: Upload task.<br>- DOWNLOAD: Download task. |
| url | String | Yes | - | **Named parameter.** Resource address (max 2048 characters). |
| title | ?String | No | None | **Named parameter.** Task title (max 256 characters). Default is lowercase "upload" or "download", matching the action above. |
| description | ?String | No | None | **Named parameter.** Task details (max 1024 characters). Default is empty string. |
| mode | ?[Mode](#enum-mode) | No | None | **Named parameter.** Task mode, default is background task. |
| overwrite | Bool | No | false | **Named parameter.** Solution for path conflicts during download, default is false.<br>- true: Overwrite existing file.<br>- false: Download fails. |
| method | ?String | No | None | **Named parameter.** HTTP standard method for upload/download (GET, POST, PUT, case-insensitive).<br>- Upload: PUT or POST (default is PUT).<br>- Download: GET or POST (default is GET). |
| headers | ?HashMap\<String, String\> | No | None | **Named parameter.** HTTP headers to include in the task.<br>- For uploads, default Content-Type is "multipart/form-data".<br>- For downloads, default Content-Type is "application/json". |
| data | ?[ConfigDataType](#enum-configdatatype) | No | None | **Named parameter.**<br>- For downloads: String type (usually JSON; objects are converted to JSON text), default is empty.<br>- For uploads: Array of form items (Array\<FormItem\>), default is empty. |
| saveas | ?String | No | None | **Named parameter.** Path to save downloaded files (see above for details). Default is relative path (downloads to caller's current cache path). |
| network | [Network](#enum-network) | No | Network.ANY | **Named parameter.** Network options (WIFI or CELLULAR), default is ANY (WIFI or CELLULAR). |
| metered | Bool | No | false | **Named parameter.** Whether to allow operation in metered networks, default is false.<br>- true: Yes<br>- false: No |
| roaming | Bool | No | true | **Named parameter.** Whether to allow operation in roaming networks, default is true.<br>- true: Yes<br>- false: No |
| retry | Bool | No | true | **Named parameter.** Whether to enable automatic retry for background tasks (applies only to background tasks), default is true.<br>- true: Yes<br>- false: No |
| redirect | Bool | No | true | **Named parameter.** Whether to allow redirection, default is true.<br>- true: Yes<br>- false: No |
| index | UInt32 | No | 0 | **Named parameter.** Task path index (typically used for resumable tasks), default is 0. |
| begins | Int64 | No | 0 | **Named parameter.** File start point (typically for resumable tasks). Default is 0 (inclusive range).<br>- Download: Starting position for reading from the server (sets "Range" in HTTP).<br>- Upload: Starting position for reading during upload. |
| ends | Int64 | No | -1 | **Named parameter.** File end point (typically for resumable tasks). Default is -1 (inclusive range).<br>- Download: Ending position for reading from the server (sets "Range" in HTTP).<br>- Upload: Ending position for reading during upload. |
| gauge | Bool | No | false | **Named parameter.** Progress notification policy for background tasks (applies only to background tasks), default is false.<br>- false: Only completion/failure notifications.<br>- true: Notifications for each progress completion/failure. |
| precise | Bool | No | false | **Named parameter.**<br>- If true, task fails when file size cannot be obtained during upload/download.<br>- If false, task continues with file size set to -1.<br>Default is false. |
| token | ?String | No | None | **Named parameter.** When a task is created with a token, the token is required for normal queries. Minimum length: 8 bytes. Maximum length: 2048 bytes. Default is empty. |
| priority | UInt32 | No | 0 | **Named parameter.** Task priority. Lower values indicate higher priority for tasks with the same mode. Default is 0. |
| extras | ?HashMap\<String, String\> | No | None | **Named parameter.** Additional configuration features, default is empty. |

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

**Function:** File information for form items.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var extras

```cangjie
public var extras: ?HashMap<String, String>= None
```

**Function:** Additional content for file information.

**Type:** ?HashMap\<String, String>

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var filename

```cangjie
public var filename: ?String = None
```

**Function:** Filename, with the default value obtained from the path.

**Type:** ?String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var mimeType

```cangjie
public var mimeType: ?String = None
```

**Function:** The MIME type of the file, obtained from the filename.

**Type:** ?String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var path

```cangjie
public var path: String
```

**Function:** File path: A relative path under the caller's cache folder or a user public file, such as "file://media/Photo/path/to/file.img". Only supports foreground tasks.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FileSpec(String, ?String, ?String, ?HashMap\<String, String>)

```cangjie
public FileSpec(
    public var path!: String,
    public var mimeType!: ?String = None,
    public var filename!: ?String = None,
    public var extras!: ?HashMap<String, String> = None
)
```

**Function:** Creates a FileSpec object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | **Named parameter.** File path: <br>- A relative path under the caller's cache folder. <br>- A user public file, such as "file://media/Photo/path/to/file.img". Only supports foreground tasks. |
| mimeType | ?String | No | None | **Named parameter.** The MIME type of the file, obtained from the filename. |
| filename | ?String | No | None | **Named parameter.** Filename, with the default value obtained from the path. |
| extras | ?HashMap\<String, String> | No | None | **Named parameter.** Additional content for file information. |

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

**Function:** Filter conditions.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var action

```cangjie
public var action: ?Action = None
```

**Function:** Task operation option. UPLOAD indicates an upload task. DOWNLOAD indicates a download task.

**Type:** ?[Action](#enum-action)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var after

```cangjie
public var after: ?Int64 = None
```

**Function:** Start Unix timestamp (milliseconds), with the default value being the current time minus 24 hours.

**Type:** ?Int64

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var before

```cangjie
public var before: ?Int64 = None
```

**Function:** End Unix timestamp (milliseconds), with the default value being the current time.

**Type:** ?Int64

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var mode

```cangjie
public var mode: ?Mode = None
```

**Function:** Task mode. FOREGROUND indicates a foreground task. BACKGROUND indicates a background task. If not specified, all tasks will be queried.

**Type:** ?[Mode](#enum-mode)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var state

```cangjie
public var state: ?State = None
```

**Function:** Specifies the state of the task.

**Type:** ?[State](#enum-state)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

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

**Function:** Creates a Filter object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| bundle | ?String | No | None | **Named parameter.** The package name of the application. |
| before | ?Int64 | No | None | **Named parameter.** End Unix timestamp (milliseconds), with the default value being the current time. |
| after | ?Int64 | No | None | **Named parameter.** Start Unix timestamp (milliseconds), with the default value being the current time minus 24 hours. |
| state | ?[State](#enum-state) | No | None | **Named parameter.** Specifies the state of the task. |
| action | ?[Action](#enum-action) | No | None | **Named parameter.** Task operation option. <br>- UPLOAD indicates an upload task. <br>- DOWNLOAD indicates a download task. |
| mode | ?[Mode](#enum-mode) | No | None | **Named parameter.** Task mode. <br>- FOREGROUND indicates a foreground task. <br>- BACKGROUND indicates a background task. <br>- If not specified, all tasks will be queried. |

## class FormItem

```cangjie
public class FormItem {
    public FormItem(
        public var name!: String,
        public var value!: FormItemValueType
    )
}
```

**Function:** Configuration information for upload/download tasks.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var name

```cangjie
public var name: String
```

**Function:** Form parameter name.

**Type:** String

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var value

```cangjie
public var value: FormItemValueType
```

**Function:** Form parameter value.

**Type:** [FormItemValueType](#enum-formitemvaluetype)

**Read-Write Capability:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FormItem(String, FormItemValueType)

```cangjie
public FormItem(
    public var name!: String,
    public var value!: FormItemValueType
)
```

**Function:** Creates a FormItem object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | **Named parameter.** Form parameter name. |
| value | [FormItemValueType](#enum-formitemvaluetype) | Yes | - | **Named parameter.** Form parameter value. |
## class HttpResponseMessage

```cangjie
public class HttpResponseMessage {
    public let version: String,
    public let statusCode: Int32,
    public let reason: String,
    public let headers: HashMap<String, Array<String>>
}
```

**Description:** Data structure for task response headers.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let headers

```cangjie
public let headers: HashMap<String, Array<String>>
```

**Description:** HTTP response headers.

**Type:** HashMap\<String, Array\<String>>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let reason

```cangjie
public let reason: String
```

**Description:** HTTP response reason phrase.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let statusCode

```cangjie
public let statusCode: Int32
```

**Description:** HTTP response status code.

**Type:** Int32

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let version

```cangjie
public let version: String
```

**Description:** HTTP protocol version.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

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

**Description:** Data structure for task progress.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let extras

```cangjie
public let extras: HashMap<String, String>
```

**Description:** Additional interaction content, such as headers and body from server responses.

**Type:** ?HashMap\<String, String>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let index

```cangjie
public let index: UInt32
```

**Description:** Index of the currently processed file in the task.

**Type:** UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let processed

```cangjie
public let processed: Int64
```

**Description:** Size of processed data for the current file in the task, in bytes.

**Type:** Int64

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let sizes

```cangjie
public let sizes: Array<Int64>
```

**Description:** File sizes in the task, in bytes.

**Type:** Array\<Int64>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let state

```cangjie
public let state: State
```

**Description:** Current state of the task.

**Type:** [State](#enum-state)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

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

**Description:** Creates a Progress object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| state | [State](#enum-state) | Yes | - | **Named parameter.** Current state of the task. |
| index | UInt32 | Yes | - | **Named parameter.** Index of the currently processed file in the task. |
| processed | Int64 | Yes | - | **Named parameter.** Size of processed data for the current file in the task, in bytes. |
| sizes | Array\<Int64> | Yes | - | **Named parameter.** File sizes in the task, in bytes. |
| extras | ?HashMap\<String, String> | Yes | - | **Named parameter.** Additional interaction content, such as headers and body from server responses. |

## class Task

```cangjie
public class Task {
    public Task(
        public let tid: String,
        public let config: Config
    )
}
```

**Description:** Upload or download task. A Task object must be obtained via create() before using this method.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let config

```cangjie
public let config: Config
```

**Description:** Configuration information of the task.

**Type:** [Config](#class-config)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let tid

```cangjie
public let tid: String
```

**Description:** Unique task ID automatically generated by the system.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Task(String, Config)

```cangjie
public Task(
    public let tid: String,
    public let config: Config
)
```

**Description:** Creates a Task object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tid | String | Yes | - | Unique task ID automatically generated by the system. |
| config | [Config](#class-config) | Yes | - | Configuration information of the task. |

### func off(String, ?CallbackObject)

```cangjie
public func off(event: String, callback!: ?CallbackObject = None): Unit
```

**Description:** Unsubscribes from task events.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Event type to unsubscribe from.<br>- 'progress': Task progress<br>- 'completed': Task completion<br>- 'failed': Task failure<br>- 'pause': Task pause<br>- 'resume': Task resume<br>- 'remove': Task removal<br>- 'response': Task response |
| callback | ?[CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject) | No | None | **Named parameter.** Callback function to unsubscribe. If not specified, all callback functions of the current type will be unsubscribed. |
### func on(String, Callback1Argument\<HttpResponseMessage>)

```cangjie
public func on(event: String, callback: Callback1Argument<HttpResponseMessage>): Unit
```

**Function:** Subscribes to task events.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Type of event to subscribe to.<br>- Value 'response' indicates task response. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[HttpResponseMessage](#class-httpresponsemessage)> | Yes | - | Callback method triggered when the related event occurs, returning the data structure of the task response headers. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md)

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters 2. Incorrect parameter type 3. Parameter verification failed. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.PerformanceAnalysisKit.*
import kit.BasicServicesKit.Action as RAction
import ohos.base.BusinessException

// Code here can be added to dependency definitions
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
    let task = create(Global.getStageContext(), config) // Context application context required, see usage instructions
    task.on("response", responseOnCallback)
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

### func on(String, Callback1Argument\<Progress>)

```cangjie
public func on(event: String, callback: Callback1Argument<Progress>): Unit
```

**Function:** Subscribes to task events.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter Name | Type | Required | Default Value | Description |
|:---|:---|:---|:---|:---|
| event | String | Yes | - | Type of event to subscribe to.<br>- Value 'progress' indicates task progress.<br>- Value 'completed' indicates task completion.<br>- Value 'failed' indicates task failure.<br>- Value 'pause' indicates task pause.<br>- Value 'resume' indicates task resumption.<br>- Value 'remove' indicates task deletion. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[Progress](#class-progress)> | Yes | - | Callback method triggered when the related event occurs, returning the data structure of task information. |

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 21900005 | Task mode error. |

**Example:**

<!-- compile -->

```cangjie
// index.cj

import kit.BasicServicesKit.*
import kit.BasicServicesKit.Action as RAction
import kit.PerformanceAnalysisKit.*
import ohos.base.*

// Code here can be added to dependency definitions
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
let createOnCallback = ProgressCallback()
try {
    let task = create(Global.getStageContext(), config) // Context application context required, see usage instructions
    task.on("progress", createOnCallback)
} catch (e: BusinessException) {
    Hilog.error(0, "TaskCreate", e.toString())
}
```

### func pause()

```cangjie
public func pause(): Unit
```

**Function:** Pauses a task. Can pause background tasks that are waiting/running/retrying.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 13400003 | Task service ability error. |
  | 21900005 | Task mode error. |
  | 21900007 | Task state error. |

**Example:**

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
    let task = create(Global.getStageContext(), config) // Context application context required, see usage instructions
    task.pause()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskPause", "${e}")
}
```

### func resume()

```cangjie
public func resume(): Unit
```

**Function:** Restarts a task. Can resume paused background tasks.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 13400003 | Task service ability error. |
  | 21900005 | Task mode error. |
  | 21900007 | Task state error. |

**Example:**

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
    let task = create(Global.getStageContext(), config) // Context application context required, see usage instructions
    task.resume()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskResume", "${e}")
}
```

### func start()

```cangjie
public func start(): Unit
```

**Function:** Starts a task. Cannot start an already initialized task. Can start a failed or stopped download task, resuming from the last progress.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 13400003 | Task service ability error. |
  | 21900007 | Task state error. |

**Example:**<!-- compile -->

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
    let task = create(Global.getStageContext(), config) // Requires Context application context, refer to usage instructions in this document
    task.start()
} catch (e: BusinessException) {
    Hilog.error(0, "TaskStart", e.toString())
}
```

### func stop()

```cangjie
public func stop(): Unit
```

**Function:** Stops a task, which can terminate tasks that are running/waiting/retrying.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: For detailed error codes, refer to [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :-------- | :-------- |
  | 13400003 | task service ability error. |
  | 21900007 | task state error. |

**Example:**

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
    let task = create(Global.getStageContext(), config) // Requires Context application context, refer to usage instructions in this document
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

**Function:** Task information data structure for query results, providing both regular and system queries with different field visibility scopes.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let action

```cangjie
public let action: Action
```

**Function:** Task operation option. UPLOAD indicates upload tasks. DOWNLOAD indicates download tasks.

**Type:** [Action](#enum-action)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let bundle

```cangjie
public let bundle:?String
```

**Function:** **Named parameter.** The package name of the application.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let ctime

```cangjie
public let ctime: UInt64
```

**Function:** Unix timestamp (milliseconds) when the task was created, generated by the current device's system.

**Type:** UInt64

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let data

```cangjie
public let data: ?ConfigDataType = None
```

**Function:** Task value.

**Type:** ?[ConfigDataType](#enum-configdatatype)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let description

```cangjie
public let description: String
```

**Function:** Task description.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let extras

```cangjie
public let extras: ?HashMap<String, String>
```

**Function:** Additional parts of the task.

**Type:** ?HashMap\<String, String>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let faults

```cangjie
public let faults: ?Faults
```

**Function:** Failure reasons for the task. OTHERS indicates other failures. DISCONNECT indicates network disconnection. TIMEOUT indicates task timeout. PROTOCOL indicates protocol errors. FSIO indicates file system I/O errors.

**Type:** ?[Faults](#enum-faults)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let gauge

```cangjie
public let gauge: Bool
```

**Function:** Progress notification policy for background tasks.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let mimeType

```cangjie
public let mimeType: String
```

**Function:** The mimetype specified in the task configuration.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let mode

```cangjie
public let mode: Mode
```

**Function:** Specifies the task mode. FOREGROUND indicates foreground tasks. BACKGROUND indicates background tasks.

**Type:** [Mode](#enum-mode)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let mtime

```cangjie
public let mtime: UInt64
```

**Function:** Unix timestamp (milliseconds) when the task state changed, generated by the current device's system.

**Type:** UInt64

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21### let priority

```cangjie
public let priority: UInt32
```

**Function:** Priority in task configuration. Foreground tasks have higher priority than background tasks. For tasks in the same mode, a smaller number indicates higher priority.

**Type:** UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let progress

```cangjie
public let progress: Progress
```

**Function:** Progress status of the task.

**Type:** [Progress](#class-progress)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let reason

```cangjie
public let reason: String
```

**Function:** Reason for waiting/failed/stopped/paused tasks.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let retry

```cangjie
public let retry: Bool
```

**Function:** Retry switch for tasks, applicable only to background tasks.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let saveas

```cangjie
public let saveas: ?String = None
```

**Function:** Path to save downloaded files.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let tid

```cangjie
public let tid: String
```

**Function:** Task ID.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let title

```cangjie
public let title: String
```

**Function:** Task title.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let tries

```cangjie
public let tries: UInt32
```

**Function:** Number of attempts for the task.

**Type:** UInt32

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let uid

```cangjie
public let uid:?String
```

**Function:** **Named parameter.** Task UID.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let url

```cangjie
public let url:?String
```

**Function:** URL of the task.

**Type:** ?String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

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

**Function:** Creates a TaskInfo object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| uid | ?String | No | None | **Named parameter.** Task UID. |
| bundle | ?String | No | None | **Named parameter.** Application package name. |
| saveas | ?String | No | None | **Named parameter.** Path to save downloaded files. |
| url | ?String | No | None | **Named parameter.** URL of the task. |
| data | ?[ConfigDataType](#enum-configdatatype) | No | None | **Named parameter.** Task value. |
| tid | String | Yes | - | **Named parameter.** Task ID. |
| title | String | Yes | - | **Named parameter.** Task title. |
| description | String | Yes | - | **Named parameter.** Task description. |
| action | [Action](#enum-action) | Yes | - | **Named parameter.** Task operation option.<br>- UPLOAD indicates an upload task.<br>- DOWNLOAD indicates a download task. |
| mode | [Mode](#enum-mode) | Yes | - | **Named parameter.** Specifies task mode.<br>- FOREGROUND indicates a foreground task.<br>- BACKGROUND indicates a background task. |
| priority | UInt32 | Yes | - | **Named parameter.** Priority in task configuration. Foreground tasks have higher priority than background tasks. For tasks in the same mode, a smaller number indicates higher priority. |
| mimeType | String | Yes | - | **Named parameter.** MIME type in task configuration. |
| progress | [Progress](#class-progress) | Yes | - | **Named parameter.** Progress status of the task. |
| gauge | Bool | Yes | - | **Named parameter.** Progress notification policy for background tasks. |
| ctime | UInt64 | Yes | - | **Named parameter.** Unix timestamp (milliseconds) when the task was created, generated by the current device's system. |
| mtime | UInt64 | Yes | - | **Named parameter.** Unix timestamp (milliseconds) when the task status changed, generated by the current device's system. |
| retry | Bool | Yes | - | **Named parameter.** Retry switch for tasks, applicable only to background tasks. |
| tries | UInt32 | Yes | - | **Named parameter.** Number of attempts for the task. |
| reason | String | Yes | - | **Named parameter.** Reason for waiting/failed/stopped/paused tasks. |
| faults | ?[Faults](#enum-faults) | Yes | - | **Named parameter.** Failure reason for the task.<br>- OTHERS indicates other failures.<br>- DISCONNECT indicates network disconnection.<br>- TIMEOUT indicates task timeout.<br>- PROTOCOL indicates protocol error.<br>- FSIO indicates file system I/O error. |
| extras | ?HashMap\<String, String> | Yes | - | **Named parameter.** Additional parts of the task. |

## enum Action

```cangjie
public enum Action <: ToString {
    | DOWNLOAD
    | UPLOAD
    | ...
}
```

**Function:** Defines operation options.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Type:**

- ToString

### DOWNLOAD

```cangjie
DOWNLOAD
```

**Function:** Indicates a download task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### UPLOAD

```cangjie
UPLOAD
```

**Function:** Indicates an upload task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Return Value:**

| Type | Description |
|:----|:----|
| String | String representation of the current enumeration. |

## enum BroadcastEvent

```cangjie
public enum BroadcastEvent {
    | COMPLETE
    | ...
}
```

**Function:** Defines custom system events. Users can obtain this event using the common event interface. The upload/download SA has the 'ohos.permission.SEND_TASK_COMPLETE_EVENT' permission. Users can configure the metadata of the event to point to a secondary configuration file to intercept other event senders. The CommonEventData type is used to transmit common event-related data. The content of the members differs from the introduction in [CommonEventData](./cj-apis-common_event_manager.md). Here, CommonEventData.code indicates the task status, currently 0x40 COMPLETE or 0x41 FAILED; CommonEventData.data indicates the taskId of the task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### COMPLETE

```cangjie
COMPLETE
```
**Function:** Indicates a task completion event.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### prop value

```cangjie
public prop value: String
```

**Function:** Returns the string representation of this BroadcastEvent.

**Type:** String

**Read-Write Capability:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

## enum ConfigDataType

```cangjie
public enum ConfigDataType {
    | STR(String)
    | FORMITEMS(Array<FormItem>)
    | ...
}
```

**Function:** Enumeration type for data configuration in upload/download tasks.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### FORMITEMS(Array\<FormItem>)

```cangjie
FORMITEMS(Array<FormItem>)
```

**Function:** Indicates that during upload, the data is an array of form items Array&lt;FormItem&gt;, which is empty by default.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### STR(String)

```cangjie
STR(String)
```

**Function:** During download, the data is of string type (typically JSON, where objects are converted to JSON text), empty by default.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

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

**Function:** Defines reasons for task failure.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Parent Type:**

- ToString

### DISCONNECTED

```cangjie
DISCONNECTED
```

**Function:** Indicates network disconnection.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### FSIO

```cangjie
FSIO
```

**Function:** Indicates file system I/O errors, such as open/find/read/write/close operations.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### OTHERS

```cangjie
OTHERS
```

**Function:** Indicates other faults.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### PROTOCOL

```cangjie
PROTOCOL
```

**Function:** Indicates protocol errors, e.g., server internal errors (500), unprocessable data ranges (416), etc.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### TIMEOUT

```cangjie
TIMEOUT
```

**Function:** Indicates task timeout.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum FormItemValueType

```cangjie
public enum FormItemValueType {
    | STR(String)
    | FILE(FileSpec)
    | FILES(Array<FileSpec>)
    | ...
}
```

**Function:** Enumeration type for file information in form items.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### FILE(FileSpec)

```cangjie
FILE(FileSpec)
```

**Function:** Indicates file information.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### FILES(Array\<FileSpec>)

```cangjie
FILES(Array<FileSpec>)
```

**Function:** Indicates multiple file information.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### STR(String)

```cangjie
STR(String)
```

**Function:** Indicates file path.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

## enum Mode

```cangjie
public enum Mode <: ToString {
    | BACKGROUND
    | FOREGROUND
    | ...
}
```

**Function:** Defines mode options. Foreground tasks fail/pause when the app switches to the background for a period; background tasks are unaffected.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Parent Type:**

- ToString

### BACKGROUND

```cangjie
BACKGROUND
```

**Function:** Indicates a background task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### FOREGROUND

```cangjie
FOREGROUND
```

**Function:** Indicates a foreground task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Retrieves the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum Network

```cangjie
public enum Network <: ToString {
    | ANY
    | WIFI
    | CELLULAR
    | ...
}
```

**Function:** Defines network options. If the network does not meet the set conditions, unexecuted tasks wait for execution, while executing tasks fail/pause.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Initial Version:** 21

**Parent Type:**

- ToString- ToString

### ANY

```cangjie
ANY
```

**Function:** Indicates any network type is allowed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### CELLULAR

```cangjie
CELLULAR
```

**Function:** Indicates cellular data network.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### WIFI

```cangjie
WIFI
```

**Function:** Indicates wireless network.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enumeration.|

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

**Function:** Defines the current state of a task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Type:**

- ToString

### COMPLETED

```cangjie
COMPLETED
```

**Function:** Indicates the task is completed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FAILED

```cangjie
FAILED
```

**Function:** Indicates the task has failed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### INITIALIZED

```cangjie
INITIALIZED
```

**Function:** Creates an initialized task through configuration information (Config).

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### PAUSED

```cangjie
PAUSED
```

**Function:** Indicates the task is paused, usually to be resumed later.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### REMOVED

```cangjie
REMOVED
```

**Function:** Indicates the task is removed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### RETRYING

```cangjie
RETRYING
```

**Function:** Indicates the task has failed at least once and is currently being retried.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### RUNNING

```cangjie
RUNNING
```

**Function:** Indicates the task is being processed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### STOPPED

```cangjie
STOPPED
```

**Function:** Indicates the task is stopped.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### WAITING

```cangjie
WAITING
```

**Function:** Indicates the task lacks resources to run or retry, or the network state doesn't match requirements.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enumeration.|