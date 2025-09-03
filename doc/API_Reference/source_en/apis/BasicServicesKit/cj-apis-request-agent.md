# ohos.request

The request component primarily provides applications with fundamental capabilities for uploading/downloading files and background transfer proxying.

## Import Module

```cangjie
import kit.BasicServicesKit.*
```

## Permission List

ohos.permission.INTERNET

## Usage Instructions

API sample code usage instructions:

- If the sample code's first line contains a "// index.cj" comment, it indicates the sample can be compiled and run in the "index.cj" file of the Cangjie template project.
- If the sample requires obtaining the [Context](../AbilityKit/cj-apis-ability.md#class-context) application context, configuration is needed in the "main_ability.cj" file of the Cangjie template project.

For details about the sample project and configuration template mentioned above, refer to [Cangjie Sample Code Instructions](../../cj-development-intro.md#仓颉示例代码说明).

## func create(UIAbilityContext, Config)

```cangjie
public func create(context: UIAbilityContext, config: Config): Task
```

**Function:** Creates an upload or download task and queues it. Each application can create up to 10 unfinished tasks.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application-based context. |
| config | [Config](#class-config) | Yes | - | Configuration information for upload/download tasks. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Task](#class-task) | Returns a Task object containing the task ID and configuration information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied. |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. 3. Parameter verification failed. |
  | 13400001 | Invalid file or file system error. |
  | 13400003 | Task service ability error. |
  | 21900004 | The application task queue is full. |
  | 21900005 | Operation with wrong task mode. |

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context is invalid. | todo | todo |

## func getTask(UIAbilityContext, String, String)

```cangjie
public func getTask(context: UIAbilityContext, id: String, token!: String = "null"): Task
```

**Function:** Queries a task by its ID.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| context | [UIAbilityContext](../../arkinterop/cj-apis-ark_interop_helper.md#type-stagecontext) | Yes | - | Application-based context. |
| id | String | Yes | - | Task ID. |
| token | String | No | "null" | **Named parameter.** Task query token. |

**Return Value:**

| Type | Description |
|:----|:----|
| [Task](#class-task) | Returns a Task object containing the task ID and configuration information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. 3. Parameter verification failed. |
  | 13400003 | Task service ability error. |
  | 21900006 | Task removed or not found. |

- IllegalArgumentException:

| Error Message | Possible Cause | Handling Steps |
  | :---- | :--- | :--- |
  | The context is invalid. | todo | todo |

## func remove(String)

```cangjie
public func remove(id: String): Unit
```

**Function:** Removes a specified task belonging to the caller. If the task is in progress, it will be forcibly stopped.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Task ID. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. |
  | 13400003 | Task service ability error. |
  | 21900006 | Task removed or not found. |

## func search(Filter)

```cangjie
public func search(filter!: Filter = Filter()): Array<String>
```

**Function:** Finds task IDs based on default [Filter](#class-filter) conditions.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| filter | [Filter](#class-filter) | No | Filter() | Filter conditions. |

**Return Value:**

| Type | Description |
|:----|:----|
| Array\<String> | Returns task IDs that meet the conditions. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. |
  | 13400003 | Task service ability error. |

## func show(String)

```cangjie
public func show(id: String): TaskInfo
```

**Function:** Queries detailed information of a task by its ID.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Task ID. |

**Return Value:**

| Type | Description |
|:----|:----|
| [TaskInfo](#class-taskinfo) | Returns a TaskInfo object containing detailed task information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. |
  | 13400003 | Task service ability error. |
  | 21900006 | Task removed or not found. |

## func touch(String, String)

```cangjie
public func touch(id: String, token: String): TaskInfo
```

**Function:** Queries detailed information of a task by its ID and token.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| id | String | Yes | - | Task ID. |
| token | String | Yes | - | Task query token. |

**Return Value:**

| Type | Description |
|:----|:----|
| [TaskInfo](#class-taskinfo) | Returns a TaskInfo object containing detailed task information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. See [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md) and [Universal Error Code Documentation](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter error. Possible causes: 1. Missing mandatory parameters. 2. Incorrect parameter type. |
  | 13400003 | Task service ability error. |
  | 21900006 | Task removed or not found. |

## class Config

```cangjie
public class Config {
    public var action: Action
    public var url: String
    public var title:?String
    public var description: String
    public var mode: Mode
    public var overwrite: Bool
    public var method:?String
    public var headers: HashMap<String, String>
    public var data:?ConfigData
    public var saveas:?String
    public var network: Network
    public var metered: Bool
    public var roaming: Bool
    public var retry: Bool
    public var redirect: Bool
    public var index: UInt32
    public var begins: Int64
    public var ends: Int64
    public var gauge: Bool
    public var precise: Bool
    public var token: String
    public var priority: UInt32
    public var extras: HashMap<String, String>


    public init(action: Action, url: String, title!: ?String = None, description!: String = "",
        mode!: Mode = Mode.Background, overwrite!: Bool = false, method!: ?String = None,
        headers!: HashMap<String, String> = HashMap<String, String>(), data!: ?ConfigData = None, saveas!: ?String = None,
        network!: Network = Network.AnyType, metered!: Bool = false, roaming!: Bool = true, retry!: Bool = true,
        redirect!: Bool = true, index!: UInt32 = 0, begins!: Int64 = 0, ends!: Int64 = -1, gauge!: Bool = false,
        precise!: Bool = false, token!: String = "", priority!: UInt32 = 0,extras!: HashMap<String, String> = HashMap<String, String>()
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

**Read/Write Capability:** Readable/Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var begins

```cangjie
public var begins: Int64
```

**Function:** File starting point, typically used for resumable transfers. Default value is 0 (inclusive). For downloads, it specifies the starting position when requesting to read the server file (setting the "Range" option in HTTP protocol). For uploads, it specifies the starting position when reading during upload.

**Type:** Int64

**Read/Write Capability:** Readable/Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var data

```cangjie
public var data:?ConfigData
```

**Function:** For downloads, data is of string type (typically JSON, with objects converted to JSON text), default is empty. For uploads, data is an array of form items Array\<FormItem>, default is empty.

**Type:** ?[ConfigData](#enum-configdata)

**Read/Write Capability:** Readable/Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var description

```cangjie
public var description: String
```

**Function:** Detailed information about the task, with a maximum length of 1024 characters. Default is an empty string.

**Type:** String

**Read/Write Capability:** Readable/Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var ends

```cangjie
public var ends: Int64
```

**Function:** File ending point, typically used for resumable transfers. Default value is -1 (inclusive). For downloads, it specifies the ending position when requesting to read the server file (setting the "Range" option in HTTP protocol). For uploads, it specifies the ending position when reading during upload.

**Type:** Int64

**Read/Write Capability:** Readable/Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21### var extras

```cangjie
public var extras: HashMap<String, String>
```

**Function:** Additional configuration features, empty by default.

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var gauge

```cangjie
public var gauge: Bool
```

**Function:** Background task progress notification strategy, applicable only to background tasks. Default is false.  
- false: Only completion or failure notifications.  
- true: Notifications for each progress completion or failure.

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var headers

```cangjie
public var headers: HashMap<String, String>
```

**Function:** Adds HTTP protocol headers to be included in the task.  
- For upload requests, the default Content-Type is "multipart/form-data".  
- For download requests, the default Content-Type is "application/json".

**Type:** [HashMap](../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var index

```cangjie
public var index: UInt32
```

**Function:** Task path index, typically used for task resumption. Default is 0.

**Type:** UInt32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var metered

```cangjie
public var metered: Bool
```

**Function:** Whether to allow operation in metered networks. Default is false.  
- true: Yes  
- false: No

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var method

```cangjie
public var method:?String
```

**Function:** HTTP standard methods for upload/download, including GET, POST, and PUT (case-insensitive).  
- For uploads: PUT or POST, default is PUT.  
- For downloads: GET or POST, default is GET.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var mode

```cangjie
public var mode: Mode
```

**Function:** Task mode, default is background task.

**Type:** [Mode](#enum-mode)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var network

```cangjie
public var network: Network
```

**Function:** Network options, currently supports WIFI and CELLULAR. Default is ANY (WIFI or CELLULAR).

**Type:** [Network](#enum-network)

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var overwrite

```cangjie
public var overwrite: Bool
```

**Function:** Solution when the path already exists during download. Default is false.  
- true: Overwrite existing file.  
- false: Download fails.

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var precise

```cangjie
public var precise: Bool
```

**Function:** If set to true, the task fails when file size cannot be obtained during upload/download. If false, continues with file size set to -1. Default is false.

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var priority

```cangjie
public var priority: UInt32
```

**Function:** Task priority. Lower numbers indicate higher priority for tasks in the same mode. Default is 0.

**Type:** UInt32

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var redirect

```cangjie
public var redirect: Bool
```

**Function:** Whether to allow redirection. Default is true.  
- true: Yes  
- false: No

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var retry

```cangjie
public var retry: Bool
```

**Function:** Whether to enable auto-retry for background tasks. Default is true.  
- true: Yes  
- false: No

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var roaming

```cangjie
public var roaming: Bool
```

**Function:** Whether to allow operation in roaming networks. Default is true.  
- true: Yes  
- false: No

**Type:** Bool

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var saveas

```cangjie
public var saveas:?String
```

**Function:** Path to save downloaded files, including:  
- Relative path under the caller's cache path, e.g., "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html".  
- Internal protocol path, only supports "internal://cache/" and subpaths, e.g., "internal://cache/path/to/file.txt".  
- Application sandbox directory, only supports base and subdirectories, e.g., "/data/storage/el1/base/path/to/file.txt".  
- File protocol path, must match the application package name, only supports base and subdirectories, e.g., "file://com.example.test/data/storage/el2/base/file.txt".  
Default is relative path, i.e., downloaded to the caller's current cache path.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var title

```cangjie
public var title:?String
```

**Function:** Task title, max length 256 characters. Default is lowercase "upload" or "download", matching the action above.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var token

```cangjie
public var token: String
```

**Function:** When a task is created with a token, the token is required for normal queries; otherwise, retrieval via query is impossible. Min length 8 bytes, max 2048 bytes. Default is empty.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var url

```cangjie
public var url: String
```

**Function:** Resource address, max length 2048 characters.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### init(Action, String, ?String, String, Mode, Bool, ?String, HashMap\<String,String>, ?ConfigData, ?String, Network, Bool, Bool, Bool, Bool, UInt32, Int64, Int64, Bool, Bool, String, UInt32, HashMap\<String,String>)

```cangjie

public init(action: Action, url: String, title!: ?String = None, description!: String = "",
    mode!: Mode = Mode.Background, overwrite!: Bool = false, method!: ?String = None,
    headers!: HashMap<String, String> = HashMap<String, String>(), data!: ?ConfigData = None, saveas!: ?String = None,
    network!: Network = Network.AnyType, metered!: Bool = false, roaming!: Bool = true, retry!: Bool = true,
    redirect!: Bool = true, index!: UInt32 = 0, begins!: Int64 = 0, ends!: Int64 = -1, gauge!: Bool = false,
    precise!: Bool = false, token!: String = "", priority!: UInt32 = 0,extras!: HashMap<String, String> = HashMap<String, String>()
)
```

**Function:** Creates a Config object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| action | [Action](#enum-action) | Yes | - | **Named parameter.** Task operation option.<br>- UPLOAD: Upload task.<br>- DOWNLOAD: Download task. |
| url | String | Yes | - | **Named parameter.** Resource address, max length 2048 characters. |
| title | ?String | No | None | **Named parameter.** Task title, max length 256 characters. Default is lowercase "upload" or "download", matching the action. |
| description | String | No | "" | **Named parameter.** Task details, max length 1024 characters. Default is empty string. |
| mode | [Mode](#enum-mode) | No | Mode.Background | **Named parameter.** Task mode, default is background task. |
| overwrite | Bool | No | false | **Named parameter.** Solution when path exists during download.<br>- true: Overwrite existing file.<br>- false: Download fails. |
| method | ?String | No | None | **Named parameter.** HTTP standard methods for upload/download (GET, POST, PUT, case-insensitive).<br>- Upload: PUT or POST, default PUT.<br>- Download: GET or POST, default GET. |
| headers | [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String> | No | HashMap<String,String>() | **Named parameter.** HTTP headers to include in the task.<br>- Upload: Default Content-Type "multipart/form-data".<br>- Download: Default Content-Type "application/json". |
| data | ?[ConfigData](#enum-configdata) | No | None | **Named parameter.**<br>- Download: Data is string type (typically JSON; objects are converted to JSON text). Default empty.<br>- Upload: Data is form item array Array&lt;FormItem&gt;. Default empty. |
| saveas | ?String | No | None | **Named parameter.** Path to save downloaded files:<br>- Relative path under caller's cache path, e.g., "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html".<br>- Internal protocol path, only "internal://cache/" and subpaths, e.g., "internal://cache/path/to/file.txt".<br>- App sandbox directory, only base and subdirectories, e.g., "/data/storage/el1/base/path/to/file.txt".<br>- File protocol path, must match app package name, only base and subdirectories, e.g., "file://com.example.test/data/storage/el2/base/file.txt".<br>Default is relative path (caller's current cache path). |
| network | [Network](#enum-network) | No | Network.AnyType | **Named parameter.** Network options (WIFI, CELLULAR). Default ANY (WIFI or CELLULAR). |
| metered | Bool | No | false | **Named parameter.** Allow operation in metered networks.<br>- true: Yes<br>- false: No |
| roaming | Bool | No | true | **Named parameter.** Allow operation in roaming networks.<br>- true: Yes<br>- false: No |
| retry | Bool | No | true | **Named parameter.** Enable auto-retry for background tasks.<br>- true: Yes<br>- false: No |
| redirect | Bool | No | true | **Named parameter.** Allow redirection.<br>- true: Yes<br>- false: No |
| index | UInt32 | No | 0 | **Named parameter.** Task path index (typically for resumption). Default 0. |
| begins | Int64 | No | 0 | **Named parameter.** File start point (typically for resumption). Default 0 (inclusive).<br>- Download: HTTP "Range" header start position.<br>- Upload: Read at upload start. |
| ends | Int64 | No | -1 | **Named parameter.** File end point (typically for resumption). Default -1 (inclusive).<br>- Download: HTTP "Range" header end position.<br>- Upload: Read at upload end. |
| gauge | Bool | No | false | **Named parameter.** Background task progress notification strategy.<br>- false: Only completion/failure notifications.<br>- true: Notifications for each progress. |
| precise | Bool | No | false | **Named parameter.**<br>- true: Task fails if file size cannot be obtained.<br>- false: Continues with file size -1. |
| token | String | No | "" | **Named parameter.** Required for querying tasks created with a token. Min 8 bytes, max 2048 bytes. Default empty. |
| priority | UInt32 | No | 0 | **Named parameter.** Task priority (lower number = higher priority for same mode). Default 0. |
| extras | [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String> | No | HashMap<String,String>() | **Named parameter.** Additional configuration features. Default empty. |

## class FileSpec

```cangjie
public class FileSpec {
    public var path: String
    public var mimeType:?String
    public var filename:?String
    public var extras: HashMap<String, String>


    public init(
        path: String,
        mimeType!: ?String = None,
        filename!: ?String = None,
        extras!: HashMap<String, String> = HashMap<String, String>()
    )
}
```

**Function:** File information for form items.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var extras

```cangjie
public var extras: HashMap<String, String>
```

**Function:** Additional content for file information.

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var filename

```cangjie
public var filename:?String
```

**Function:** Filename, default derived from path.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var mimeType

```cangjie
public var mimeType:?String
```

**Function:** File MIME type derived from filename.

**Type:** ?String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var path

```cangjie
public var path: String
```

**Function:** File path: Relative path under caller's cache folder or user public files, e.g., "file://media/Photo/path/to/file.img".  
Only supports foreground tasks.

**Type:** String

**Read/Write Permission:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### init(String, ?String, ?String, HashMap\<String,String>)

```cangjie

public init(
    path: String,
    mimeType!: ?String = None,
    filename!: ?String = None,
    extras!: HashMap<String, String> = HashMap<String, String>()
)
```

**Function:** Creates a FileSpec object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| path | String | Yes | - | **Named parameter.** File path:<br>- Relative path under caller's cache folder.<br>- User public files, e.g., "file://media/Photo/path/to/file.img". Only supports foreground tasks. |
| mimeType | ?String | No | None | **Named parameter.** File MIME type derived from filename. |
| filename | ?String | No | None | **Named parameter.** Filename, default derived from path. |
| extras | [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String> | No | HashMap<String,String>() | **Named parameter.** Additional content for file information. |## class Filter

```cangjie
public class Filter {
    public var before:?Int64
    public var after:?Int64
    public var state:?State
    public var action:?Action
    public var mode:?Mode


    public init(before!: ?Int64 = None, after!: ?Int64 = None, state!: ?State = None,
        action!: ?Action = None, mode!: ?Mode = None
    )
}
```

**Description:** Filter conditions.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var action

```cangjie
public var action:?Action
```

**Description:** Task operation options. UPLOAD indicates upload tasks. DOWNLOAD indicates download tasks.

**Type:** ?[Action](#enum-action)

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var after

```cangjie
public var after:?Int64
```

**Description:** Start Unix timestamp (milliseconds), default value is the current time minus 24 hours.

**Type:** ?Int64

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var before

```cangjie
public var before:?Int64
```

**Description:** End Unix timestamp (milliseconds), default value is the current time.

**Type:** ?Int64

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var mode

```cangjie
public var mode:?Mode
```

**Description:** Task mode. FOREGROUND indicates foreground tasks. BACKGROUND indicates background tasks. If not specified, all tasks will be queried.

**Type:** ?[Mode](#enum-mode)

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var state

```cangjie
public var state:?State
```

**Description:** Specifies the state of the task.

**Type:** ?[State](#enum-state)

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### init(?Int64, ?Int64, ?State, ?Action, ?Mode)

```cangjie

public init(before!: ?Int64 = None, after!: ?Int64 = None, state!: ?State = None,
    action!: ?Action = None, mode!: ?Mode = None
)
```

**Description:** Creates a Filter object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| before | ?Int64 | No | None | **Named parameter.** End Unix timestamp (milliseconds), default value is the current time. |
| after | ?Int64 | No | None | **Named parameter.** Start Unix timestamp (milliseconds), default value is the current time minus 24 hours. |
| state | ?[State](#enum-state) | No | None | **Named parameter.** Specifies the state of the task. |
| action | ?[Action](#enum-action) | No | None | **Named parameter.** Task operation options.<br>- UPLOAD indicates upload tasks.<br>- DOWNLOAD indicates download tasks. |
| mode | ?[Mode](#enum-mode) | No | None | **Named parameter.** Task mode.<br>- FOREGROUND indicates foreground tasks.<br>- BACKGROUND indicates background tasks.<br>- If not specified, all tasks will be queried. |

## class FormItem

```cangjie
public class FormItem {
    public var name: String
    public var value: FormItemValue


    public init(name: String, value: FormItemValue)
}
```

**Description:** Configuration information for upload/download tasks.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var name

```cangjie
public var name: String
```

**Description:** Form parameter name.

**Type:** String

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var value

```cangjie
public var value: FormItemValue
```

**Description:** Form parameter value.

**Type:** [FormItemValue](#enum-formitemvalue)

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### init(String, FormItemValue)

```cangjie

public init(name: String, value: FormItemValue)
```

**Description:** Creates a FormItem object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| name | String | Yes | - | **Named parameter.** Form parameter name. |
| value | [FormItemValue](#enum-formitemvalue) | Yes | - | **Named parameter.** Form parameter value. |

## class HttpResponse

```cangjie
public class HttpResponse {
    public let version: String
    public let statusCode: Int32
    public let reason: String
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

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,Array\<String>>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let reason

```cangjie
public let reason: String
```

**Description:** HTTP response reason.

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

**Description:** HTTP version.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

## class Progress

```cangjie
public class Progress {
    public let state: State
    public let index: UInt32
    public let processed: Int64
    public let sizes: Array<Int64>
    public let extras: HashMap<String, String>
}
```

**Description:** Data structure for task progress.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let extras

```cangjie
public let extras: HashMap<String, String>
```

**Description:** Additional interaction content, such as headers and body from the server's response.

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let index

```cangjie
public let index: UInt32
```

**Description:** Index of the current file being processed in the task.

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

**Description:** Size of files in the task, in bytes.

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

## class Task

```cangjie
public class Task {
    public let tid: String
    public var config: Config


    public init(tid: String, config: Config)
}
```

**Description:** Upload or download task. Before using this method, you need to obtain a Task object through create.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### var config

```cangjie
public var config: Config
```

**Description:** Configuration information for the task.

**Type:** [Config](#class-config)

**Access:** Readable and Writable

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let tid

```cangjie
public let tid: String
```

**Description:** Task ID, which is unique in the system and automatically generated by the system.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### init(String, Config)

```cangjie

public init(tid: String, config: Config)
```

**Description:** Creates a Task object.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| tid | String | Yes | - | Task ID, which is unique in the system and automatically generated by the system. |
| config | [Config](#class-config) | Yes | - | Configuration information for the task. |

### func off(EventCallbackType, ?CallbackObject)

```cangjie

public func off(event: EventCallbackType, callback!: ?CallbackObject = None): Unit
```

**Description:** Unsubscribes from task events.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [EventCallbackType](#enum-eventcallbacktype) | Yes | - | Event type to unsubscribe from.<br>- 'progress' indicates task progress.<br>- 'completed' indicates task completion.<br>- 'failed' indicates task failure.<br>- 'pause' indicates task pause.<br>- 'resume' indicates task resume.<br>- 'remove' indicates task removal.<br>- 'response' indicates task response. |
| callback | ?[CallbackObject](../BasicServicesKit/cj-apis-base.md#class-callbackobject) | No | None | **Named parameter.** Callback function to unsubscribe. If not specified, all callback functions of the current type will be unsubscribed. |

### func on(EventCallbackType, Callback1Argument\<HttpResponse>)

```cangjie

public func on(event: EventCallbackType, callback: Callback1Argument<HttpResponse>): Unit
```

**Description:** Subscribes to task response headers.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [EventCallbackType](#enum-eventcallbacktype) | Yes | - | Event type to subscribe to.<br>- 'response' indicates task response. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)> | Yes | - | Callback method triggered when the related event occurs, returning the data structure of the task response headers. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Universal Error Codes](../../errorcodes/cj-errorcode-universal.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter verification failed.
 |

### func on(EventCallbackType, Callback1Argument\<Progress>)

```cangjie

public func on(event: EventCallbackType, callback: Callback1Argument<Progress>): Unit
```

**Description:** Subscribes to task events.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parameters:**

| Parameter | Type | Required | Default | Description |
|:---|:---|:---|:---|:---|
| event | [EventCallbackType](#enum-eventcallbacktype) | Yes | - | Event type to subscribe to.<br>- 'progress' indicates task progress.<br>- 'completed' indicates task completion.<br>- 'failed' indicates task failure.<br>- 'pause' indicates task pause.<br>- 'resume' indicates task resume.<br>- 'remove' indicates task removal. |
| callback | [Callback1Argument](../BasicServicesKit/cj-apis-base.md#class-callback1argument)\<[Progress](#class-progress)> | Yes | - | Callback method triggered when the related event occurs, returning the data structure of the task information. |

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 401 | Parameter verification failed.
 |

### func pause()

```cangjie

public func pause(): Unit
```

**Description:** Pauses the task. Can pause background tasks that are waiting/running/retrying.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13400003 | Task service ability error.
 |
  | 21900005 | Operation with wrong task mode.
 |
  | 21900007 | Operation with wrong task state.
 |

### func resume()

```cangjie

public func resume(): Unit
```

**Description:** Restarts the task. Can resume paused background tasks.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied.
 |
  | 13400003 | Task service ability error.
 |
  | 21900005 | Operation with wrong task mode.
 |
  | 21900007 | Operation with wrong task state.
 |

### func start()

```cangjie

public func start(): Unit
```

**Description:** Starts the task. Cannot start an already initialized task. Can start a failed or stopped download task, resuming from the last progress.

**Required Permission:** ohos.permission.INTERNET

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 201 | Permission denied.
 |
  | 13400003 | Task service ability error.
 |
  | 21900007 | Operation with wrong task state.
 |

### func stop()

```cangjie

public func stop(): Unit
```

**Description:** Stops the task. Can stop tasks that are running/waiting/retrying.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Exceptions:**

- BusinessException: Corresponding error codes are listed below. For details, see [Upload/Download Error Codes](../../errorcodes/cj-errorcode-request.md).

  | Error Code ID | Error Message |
  | :---- | :--- |
  | 13400003 | Task service ability error.
 |
  | 21900007 | Operation with wrong task state.
 |## class TaskInfo

```cangjie
public class TaskInfo {
    public let saveas: String
    public let url: String
    public let data: ConfigData
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
    public let faults: Faults
    public let reason: String
    public let extras: HashMap<String, String>
}
```

**Function:** Data structure for querying task information, providing both regular and system queries with different field visibility scopes.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let action

```cangjie
public let action: Action
```

**Function:** Task operation options. UPLOAD indicates an upload task. DOWNLOAD indicates a download task.

**Type:** [Action](#enum-action)

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
public let data: ConfigData
```

**Function:** Task value.

**Type:** [ConfigData](#enum-configdata)

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
public let extras: HashMap<String, String>
```

**Function:** Additional parts of the task.

**Type:** [HashMap](../../.../../../../User_Manual/source_zh_cn/collections/collection_hashmap.md)\<String,String>

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let faults

```cangjie
public let faults: Faults
```

**Function:** Failure reasons for the task. OTHERS indicates other faults. DISCONNECT indicates network disconnection. TIMEOUT indicates task timeout. PROTOCOL indicates protocol errors. FSIO indicates file system I/O errors.

**Type:** [Faults](#enum-faults)

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

**Function:** MIME type in task configuration.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let mode

```cangjie
public let mode: Mode
```

**Function:** Specifies task mode. FOREGROUND indicates foreground tasks. BACKGROUND indicates background tasks.

**Type:** [Mode](#enum-mode)

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let mtime

```cangjie
public let mtime: UInt64
```

**Function:** Unix timestamp (milliseconds) when task status changes, generated by the current device's system.

**Type:** UInt64

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let priority

```cangjie
public let priority: UInt32
```

**Function:** Priority in task configuration. Foreground tasks have higher priority than background tasks. For tasks in the same mode, smaller numbers indicate higher priority.

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

**Function:** Retry switch for tasks, only applicable to background tasks.

**Type:** Bool

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### let saveas

```cangjie
public let saveas: String
```

**Function:** Path to save downloaded files.

**Type:** String

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

### let url

```cangjie
public let url: String
```

**Function:** Task URL.

**Type:** String

**Access:** Read-only

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

## enum Action

```cangjie
public enum Action <: Equatable<Action> & ToString {
    | Download
    | Upload
    | ...
}
```

**Function:** Defines operation options.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Types:**

- Equatable\<Action>
- ToString

### Download

```cangjie
Download
```

**Function:** Indicates a download task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Upload

```cangjie
Upload
```

**Function:** Indicates an upload task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func !=(Action)

```cangjie
public operator func !=(other: Action): Bool
```

**Function:** Determines whether two enum values are not equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Action](#enum-action)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are not equal, otherwise false.|

### func ==(Action)

```cangjie
public operator func ==(other: Action): Bool
```

**Function:** Determines whether two enum values are equal.

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Action](#enum-action)|Yes|-|Another enum value.|

**Returns:**

|Type|Description|
|:----|:----|
|Bool|Returns true if the enum values are equal, otherwise false.|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enum.

**Returns:**

|Type|Description|
|:----|:----|
|String|String representation of the current enum.|## enum BroadcastEvent

```cangjie
public enum BroadcastEvent <: ToString {
    | Complete
    | ...
}
```

**Function:** Defines custom system events. Users can obtain these events through the public event interface. Upload/download SAs with the 'ohos.permission.SEND_TASK_COMPLETE_EVENT' permission can intercept other event senders by configuring the secondary configuration file pointed to by the event metadata. Common event related data is transmitted using the CommonEventData type. The content filling of members differs from the [CommonEventData introduction](./cj-apis-common_event_manager.md), where CommonEventData.code represents the task status (currently 0x40 COMPLETE or 0x41 FAILED), and CommonEventData.data represents the task's taskId.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Type:**

- ToString

### Complete

```cangjie
Complete
```

**Function:** Indicates a task completion event.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Obtains the string representation of the current enumeration.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum ConfigData

```cangjie
public enum ConfigData {
    | StringValue(String)
    | FormItems(Array<FormItem>)
    | ...
}
```

**Function:** Enumeration type for data configuration in upload/download tasks.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FormItems(Array\<FormItem>)

```cangjie
FormItems(Array<FormItem>)
```

**Function:** Indicates that during upload, the data is an array of form items Array&lt;FormItem&gt;, which is empty by default.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### StringValue(String)

```cangjie
StringValue(String)
```

**Function:** Indicates that during download, the data is of string type (typically JSON, where objects will be converted to JSON text), which is empty by default.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

## enum EventCallbackType

```cangjie
public enum EventCallbackType <: Equatable<EventCallbackType> & Hashable & ToString {
    | Progress
    | Completed
    | Failed
    | Pause
    | Resume
    | Remove
    | Response
    | ...
}
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Types:**

- Equatable\<EventCallbackType>
- Hashable
- ToString

### Completed

```cangjie
Completed
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Failed

```cangjie
Failed
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Pause

```cangjie
Pause
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Progress

```cangjie
Progress
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Remove

```cangjie
Remove
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Response

```cangjie
Response
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Resume

```cangjie
Resume
```

**Function:** <font color="red" face="bold">please add description</font>

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func !=(EventCallbackType)

```cangjie
public operator func !=(other: EventCallbackType): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[EventCallbackType](#enum-eventcallbacktype)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func ==(EventCallbackType)

```cangjie
public operator func ==(other: EventCallbackType): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[EventCallbackType](#enum-eventcallbacktype)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func hashCode()

```cangjie
public func hashCode(): Int64
```

**Function:** <font color="red" face="bold">please add description</font>

**Return Value:**

|Type|Description|
|:----|:----|
|Int64|<font color="red" face="bold">please add description</font>|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Obtains the string representation of the current enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum Faults

```cangjie
public enum Faults <: ToString {
    | Others
    | Disconnected
    | Timeout
    | Protocol
    | Fsio
    | ...
}
```

**Function:** Defines reasons for task failures.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Type:**

- ToString

### Disconnected

```cangjie
Disconnected
```

**Function:** Indicates network disconnection.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Fsio

```cangjie
Fsio
```

**Function:** Indicates file system I/O errors, such as open/lookup/read/write/close operations.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Others

```cangjie
Others
```

**Function:** Indicates other faults.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Protocol

```cangjie
Protocol
```

**Function:** Indicates protocol errors, such as server internal errors (500), unprocessable data ranges (416), etc.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Timeout

```cangjie
Timeout
```

**Function:** Indicates task timeout.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Obtains the string representation of the current enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|String representation of the current enumeration.|

## enum FormItemValue

```cangjie
public enum FormItemValue {
    | StringItem(String)
    | FileItem(FileSpec)
    | FileItemArray(Array<FileSpec>)
    | ...
}
```

**Function:** Enumeration type for file information in form items.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FileItem(FileSpec)

```cangjie
FileItem(FileSpec)
```

**Function:** Indicates file information.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### FileItemArray(Array\<FileSpec>)

```cangjie
FileItemArray(Array<FileSpec>)
```

**Function:** Indicates multiple file information entries.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### StringItem(String)

```cangjie
StringItem(String)
```

**Function:** Indicates file path.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21## enum Mode

```cangjie
public enum Mode <: Equatable<Mode> & ToString {
    | Background
    | Foreground
    | ...
}
```

**Function:** Defines mode options. Frontend tasks fail/pause when the app switches to background for a period; background tasks remain unaffected.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Types:**

- Equatable\<Mode>
- ToString

### Background

```cangjie
Background
```

**Function:** Represents a background task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Foreground

```cangjie
Foreground
```

**Function:** Represents a foreground task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func !=(Mode)

```cangjie
public operator func !=(other: Mode): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Mode](#enum-mode)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func ==(Mode)

```cangjie
public operator func ==(other: Mode): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Mode](#enum-mode)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enumeration.|

## enum Network

```cangjie
public enum Network <: Equatable<Network> & ToString {
    | AnyType
    | Wifi
    | Cellular
    | ...
}
```

**Function:** Defines network options. When network conditions don't meet the settings, pending tasks wait for execution, while executing tasks fail/pause.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Types:**

- Equatable\<Network>
- ToString

### AnyType

```cangjie
AnyType
```

**Function:** Represents unrestricted network type.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Cellular

```cangjie
Cellular
```

**Function:** Represents cellular data network.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Wifi

```cangjie
Wifi
```

**Function:** Represents wireless network.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func !=(Network)

```cangjie
public operator func !=(other: Network): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Network](#enum-network)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func ==(Network)

```cangjie
public operator func ==(other: Network): Bool
```

**Function:** <font color="red" face="bold">please add description</font>

**Parameters:**

|Parameter|Type|Required|Default|Description|
|:---|:---|:---|:---|:---|
|other|[Network](#enum-network)|Yes|-|<font color="red" face="bold">please add description</font>|

**Return Value:**

|Type|Description|
|:----|:----|
|Bool|<font color="red" face="bold">please add description</font>|

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enumeration.|

## enum State

```cangjie
public enum State <: ToString {
    | Initialized
    | Waiting
    | Running
    | Retrying
    | Paused
    | Stopped
    | Completed
    | Failed
    | Removed
    | ...
}
```

**Function:** Defines the current state of a task.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

**Parent Types:**

- ToString

### Completed

```cangjie
Completed
```

**Function:** Indicates task completion.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Failed

```cangjie
Failed
```

**Function:** Indicates task failure.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Initialized

```cangjie
Initialized
```

**Function:** Creates and initializes a task through configuration (Config).

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Paused

```cangjie
Paused
```

**Function:** Indicates task pause, typically followed by task resumption.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Removed

```cangjie
Removed
```

**Function:** Indicates task removal.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Retrying

```cangjie
Retrying
```

**Function:** Indicates the task has failed at least once and is currently being reprocessed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Running

```cangjie
Running
```

**Function:** Indicates a task currently being processed.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Stopped

```cangjie
Stopped
```

**Function:** Indicates task stoppage.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### Waiting

```cangjie
Waiting
```

**Function:** Indicates the task lacks execution resources or the network state doesn't match for running/retrying.

**System Capability:** SystemCapability.Request.FileTransferAgent

**Since:** 21

### func toString()

```cangjie
public func toString(): String
```

**Function:** Gets the string representation of the current enumeration.

**Return Value:**

|Type|Description|
|:----|:----|
|String|The string representation of the current enumeration.|