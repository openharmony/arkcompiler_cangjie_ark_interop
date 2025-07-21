/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ohos.request

import std.collection.*
import std.sync.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*
import ohos.app.ability.ui_ability.{UIAbilityContext, getStageContext}

// ERRORCODE
const EXCEPTION_FILEIO: Int32 = 13400001
const EXCEPTION_FILEPATH: Int32 = 13400002
const EXCEPTION_SERVICE: Int32 = 13400003
const EXCEPTION_OTHERS: Int32 = 13499999

/**
 * The action options.
 *
 * @relation enum Action
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Action <: ToString {
    /**
     * Indicates download task.
     *
     * @relation DOWNLOAD = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Download
    /**
     * Indicates upload task.
     *
     * @relation UPLOAD = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Upload
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case Download => 0
                case Upload => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    /**
     * Gets the Action value represented in String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Download => "Download"
            case Upload => "Upload"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32): Action {
        match (v) {
            case 0 => Download
            case 1 => Upload
            case _ => throw Exception("Never reach here!")
        }
    }
}

/**
 * The mode options.
 *
 * @relation enum Mode
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Mode <: ToString {
    /**
     * Indicates background task.
     *
     * @relation BACKGROUND = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Background
    /**
     * Indicates foreground task.
     *
     * @relation FOREGROUND = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Foreground
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case Background => 0
                case Foreground => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    /**
     * Gets the Mode value represented in String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Background => "Background"
            case Foreground => "Foreground"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toMode(v: UInt32): Mode {
        match (v) {
            case 0 => Background
            case 1 => Foreground
            case _ => throw Exception("Never reach here!")
        }
    }

    static func toModeOption(v: UInt32): ?Mode {
        try {
            toMode(v)
        } catch (e: Exception) {
            None
        }
    }
}

/**
 * The network options.
 *
 * @relation enum Network
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Network <: ToString {
    /**
     * Indicates no restriction on network type.
     *
     * @relation ANY = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Any
    /**
     * Indicates Wi-Fi only.
     *
     * @relation WIFI
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Wifi
    /**
     * Indicates cellular only.
     *
     * @relation CELLULAR = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Cellular
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case Any => 0
                case Wifi => 1
                case Cellular => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: UInt32): Network {
        match (v) {
            case 0 => Any
            case 1 => Wifi
            case 2 => Cellular
            case _ => throw Exception("Invalid Network type!")
        }
    }

    /**
     * Gets the Network value represented in String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Any => "Any"
            case Wifi => "Wifi"
            case Cellular => "Cellular"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Broadcast events for the request.
 *
 * @relation enum BroadcastEvent
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum BroadcastEvent {
    /**
     * Completion event for the task.
     *
     * @relation COMPLETE = 'ohos.request.event.COMPLETE'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Complete | ...

    /**
     * Gets the corresponding mapping value.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Complete => "ohos.request.event.COMPLETE"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
/**
 * The file information for a form item.
 *
 * @relation interface FileSpec
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class FileSpec {
    /**
     * The path to save the uploaded file.
     * Currently support:
     * 1: relative path, like "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html", under caller's cache folder.
     * 2: internal protocol path, starting with "internal://", like "internal://cache/path/to/file.txt".
     * 3: application storage path, only the base directory and its subdirectories are supported, like "/data/storage/el1/base/path/to/file.txt".
     * 4: file protocol path with self bundle name, only the base directory and its subdirectories are supported, like "file://com.example.test/data/storage/el2/base/file.txt".
     * 5: user file url, like "file://media/Photo/path/to/file.png".
     *
     * @relation path: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var path: String

    /*
     * The MIME type of the file.
     * The default is obtained by the suffix of the filename.
     *
     * @relation mimeType?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var mimeType: ?String = None

    /*
     * The filename, the default is obtained by path.
     *
     * @relation filename?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var filename: ?String = None

    /*
     * The extras for the file information.
     *
     * @relation extras?: object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var extras: ?HashMap<String, String> = None

    /**
     * FileSpec constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(
        path!: String,
        mimeType!: ?String = None,
        filename!: ?String = None,
        extras!: ?HashMap<String, String> = None
    ) {
        this.path = path
        this.mimeType = mimeType
        this.filename = filename
        this.extras = extras
    }

    init(v: CFileSpec) {
        this.path = v.path.toString()

        if (v.mimeType.isNull()) {
            this.mimeType = None
        } else {
            this.mimeType = v.mimeType.toString()
        }

        if (v.filename.isNull()) {
            this.filename = None
        } else {
            this.filename = v.filename.toString()
        }

        this.extras = v.extras.toHashMapOption()
    }
}

/**
 * FormItem value
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum FormItemValue {
    /**
     * String type FormItem value
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    StringValue(String)
    /**
     * FileSpec type FormItem value
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    File(FileSpec)
    /**
     * Array<FileSpec> type FormItem value
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Files(Array<FileSpec>)
    | ...

    prop valueType: UInt32 {
        get() {
            match (this) {
                case StringValue(_) => 0
                case File(_) => 1
                case Files(_) => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * The form item information for a task.
 *
 * @relation interface FormItem
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class FormItem {
    /*
     * The item's name.
     *
     * @relation name: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var name: String

    /*
     * The item's value.
     *
     * @relation value: string | FileSpec | Array<FileSpec>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var value: FormItemValue

    /**
     * FormItem constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(name!: String, value!: FormItemValue) {
        this.name = name
        this.value = value
    }

    init(v: CFormItem) {
        this.name = v.name.toString()
        this.value = v.value.toCJValue()
    }
}

/**
 * Config data
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum ConfigData {
    /**
     * String type Config data
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    StringValue(String)
    /**
     * Array<FormItem> type Config data
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FormItems(Array<FormItem>)
    | ...

    prop valueType: UInt32 {
        get() {
            match (this) {
                case StringValue(_) => 0
                case FormItems(_) => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * The configurations for a task.
 * Provides the configuration information of an upload or download task.
 * Using a flexible configuration for clear upload and download functions.
 * If without emphasis, an option is for any task.
 *
 * @relation interface Config
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Config {
    /**
     * The Universal Resource Locator for a task.
     * The maximum length is 2048 characters.
     * Using raw `url` option, even url parameters in it.
     *
     * @relation action: Action
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var action: Action
    /**
     * The Universal Resource Locator for a task.
     * The maximum length is 2048 characters.
     * Using raw `url` option, even url parameters in it.
     *
     * @relation url: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var url: String
    /**
     * The title for a task, give a meaningful title please.
     * The maximum length is 256 characters.
     * The default is upload or download, consistent with its action.
     *
     * @relation title?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var title: ?String = None
    /**
     * The details for a task.
     * The maximum length is 1024 characters.
     * The default is empty string.
     *
     * @relation description?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var description: ?String = None
    /**
     * Indicates task's mode.
     * The default is Background.
     * For frontend task, it has callbacks.
     * For background task, it has notifications and fallback.
     * The cross-platform default is Foreground.
     *
     * @relation mode?: Mode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var mode: ?Mode = None
    /**
     * The solution choice when path already exists during download.
     * The default is false.
     * Currently support:
     * true, rewrite the existed file;
     * false, go to fail.
     *
     * @relation overwrite?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var overwrite: Bool
    /**
     * The HTTP standard method for upload or download: GET/POST/PUT.
     * Case insensitive.
     * For upload, use PUT/POST, the default is PUT.
     * For download, use GET/POST, the default is GET.
      *
     * @relation method?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var method: ?String
    /**
     * The HTTP headers.
     * For upload request, the `Content-Type` is forced to `multipart/form-data`.
     * For download request, the default `Content-Type` is `application/json`.
     *
     * @relation headers?: object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var headers: ?HashMap<String, String>
    /**
     * The arguments, it can be any text, uses json usually.
     * For download, it can be raw string, the default is empty string.
     * For upload, it can be form items, the default is a empty form.
     * There must be one `FileSpec` item at least or will be a parameter error.
     *
     * @relation data?: string | Array<FormItem>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var data: ?ConfigData
    /**
     * The path to save the downloaded file, the default is "./".
     * Currently support:
     * 1: relative path, like "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html", under caller's cache folder.
     * 2: internal protocol path, starting with "internal://", like "internal://cache/path/to/file.txt".
     * 3: application storage path, only the base directory and its subdirectories are supported, like "/data/storage/el1/base/path/to/file.txt".
     * 4: file protocol path with self bundle name, only the base directory and its subdirectories are supported, like "file://com.example.test/data/storage/el2/base/file.txt".
     *
     * @relation saveas?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var saveas: ?String = None
    /**
     * Network used for the task.
     * The default value is Any (Wi-Fi or cellular).
     *
     * @relation network?: Network
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var network: Network
    /**
     * Allows work in metered network or not.
     * The default is false
     *
     * @relation metered?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var metered: Bool
    /**
     * Allows work in roaming network or not.
     * The default is true.
     *
     * @relation roaming?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var roaming: Bool
    /**
     * Enable automatic retry or not for the background task.
     * The frontend task is always fast-fail.
     *
     * @relation retry?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var retry: Bool
    /**
     * Allows redirect or not.
     * The default is true.
     *
     * @relation redirect?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var redirect: Bool
    /**
     * The index of paths for a task.
     * Usually used for a continuous job.
     * The default is 0.
     *
     * @relation index?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var index: UInt32
    /**
     * The start point of a file.
     * Usually used for a continuous job.
     * It will set the "Range" header in download.
     * It will start read at the point in upload.
     * The default is 0.
     *
     * @relation begins?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var begins: Int64
    /**
     * The end point of a file.
     * Usually used for a continuous job.
     * It will set The "Range" header in download.
     * It will end read at the point in upload.
     * The default is -1 indicating the end of the data for upload or download.
     *
     * @relation ends?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var ends: Int64
    /**
     * The policy of the progress notification for background task.
     * If false: only completed or failed notification, the default.
     * If true, emits every progress, completed or failed notifications.
     *
     * @relation gauge?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var gauge: Bool
    /**
     * Breaks when fail to fetch filesize before upload/download or not.
     * Uses filesize for a precise gauge.
     * The default is false, set size as -1 indicating the case.
     *
     * @relation precise?: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var precise: Bool
    /**
     * For in-application layer isolation.
     * If given:
     *   the minimum is 8 bytes.
     *   the maximum is 2048 bytes.
     * Creates a task with token, then must provide it during normal query.
     * So saves the token carefully, it can not be retrieved by query.
     * Or leave it empty.
     *
     * @relation token?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var token: ?String
    /**
     * The priority of this task.
     * Front-end tasks have higher priority than back-end tasks.
     * In tasks of the same mode, the smaller the number, the higher the priority.
     * The default is 0.
     *
     * @relation priority?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var priority: UInt32
    /**
     * The extras for the configuration.
     * This parameter is left empty by default.
     *
     * @relation extras?: object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var extras: ?HashMap<String, String> = None

    /**
     * Config constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(action!: Action, url!: String, title!: ?String = None, description!: ?String = None,
        mode!: ?Mode = None, overwrite!: Bool = false, method!: ?String = None,
        headers!: ?HashMap<String, String> = None, data!: ?ConfigData = None, saveas!: ?String = None,
        network!: Network = Network.Any, metered!: Bool = false, roaming!: Bool = true, retry!: Bool = true,
        redirect!: Bool = true, index!: UInt32 = 0, begins!: Int64 = 0, ends!: Int64 = -1, gauge!: Bool = false,
        precise!: Bool = false, token!: ?String = None, priority!: UInt32 = 0,extras!: ?HashMap<String, String> = None
    ) {
        this.action = action
        this.url = url
        this.title = title
        this.description = description
        this.mode = mode
        this.overwrite = overwrite
        this.method = method
        this.headers = headers
        this.data = data
        this.saveas = saveas
        this.network = network
        this.metered = metered
        this.roaming = roaming
        this.retry = retry
        this.redirect = redirect
        this.index = index
        this.begins = begins
        this.ends = ends
        this.gauge = gauge
        this.precise = precise
        this.token = token
        this.priority = priority
        this.extras = extras
    }

    init(v: CConfig) {
        this.action = Action.parse(v.action)
        this.url = v.url.toString()
        this.title = v.title.toStringOption()
        this.description = v.description.toStringOption()
        this.mode = Mode.toModeOption(v.mode)
        this.overwrite = v.overwrite
        this.method = v.method.toStringOption()
        this.headers = v.headers.toHashMapOption()
        this.data = v.data.toCJValue(this.action)
        this.saveas = v.saveas.toStringOption()
        this.network = Network.parse(v.network)
        this.metered = v.metered
        this.roaming = v.roaming
        this.retry = v.retry
        this.redirect = v.redirect
        this.index = v.index
        this.begins = v.begins
        this.ends = v.ends
        this.gauge = v.gauge
        this.precise = v.precise
        this.token = v.token.toStringOption()
        this.priority = v.priority
        this.extras = v.extras.toHashMapOption()
    }
}

/**
 * Indicate the current state of the task.
 *
 * @relation enum State
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum State <: ToString {
    /**
     * Indicates a task created by `new Task(Config)`.
     *
     * @relation INITIALIZED = 0x00
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Initialized
    /**
     * Indicates a task lack of resources or conditions to run or retry.
     *
     * @relation WAITING = 0x10
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Waiting
    /**
     * Indicates a task in processing now.
     *
     * @relation RUNNING = 0x20
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Running
    /**
     * Indicates a task failed once at least and in processing again now.
     *
     * @relation RETRYING = 0x21
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Retrying
    /**
     * Indicates a paused task which tends to be resumed for continuous work.
     *
     * @relation PAUSED = 0x30
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Paused
    /**
     * Indicates a stopped task which must be started again.
     *
     * @relation STOPPED = 0x31
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Stopped
    /**
     * Indicates a completed task which finish its data transfer.
     *
     * @relation COMPLETED = 0x40
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Completed
    /**
     * Indicates a failed task which interrupted by some error.
     *
     * @relation FAILED = 0x41
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Failed
    /**
     * Indicates a removed task which can not be processed again.
     *
     * @relation REMOVED = 0x50
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Removed
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case Initialized => 0x00
                case Waiting => 0x10
                case Running => 0x20
                case Retrying => 0x21
                case Paused => 0x30
                case Stopped => 0x31
                case Completed => 0x40
                case Failed => 0x41
                case Removed => 0x50
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    /**
     * Gets the State value represented in String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Initialized => "Initialized"
            case Waiting => "Waiting"
            case Running => "Running"
            case Retrying => "Retrying"
            case Paused => "Paused"
            case Stopped => "Stopped"
            case Completed => "Completed"
            case Failed => "Failed"
            case Removed => "Removed"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32) {
        match (v) {
            case 0x0 => Initialized
            case 0x10 => Waiting
            case 0x20 => Running
            case 0x21 => Retrying
            case 0x30 => Paused
            case 0x40 => Completed
            case 0x41 => Failed
            case 0x50 => Removed
            case _ => Initialized
        }
    }
}

/**
 * The progress data structure.
 * Upload allows multiple files per upload task.
 * Only one file in a download task.
 * So using a unified data structure for progress.
 * Generally:
 * 1: sum(sizes) is total files size of the task.
 * 2: float(processed)/sizes[counter] is the progress for the current processing file.
 * 3: float(sum(sizes[:index])+processed)/sum(sizes) is the summary progress for a task.
 * If fetch file size in failure, the size of the file in sizes will be set as -1.
 *
 * @relation interface Progress
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Progress {
    /**
     * The current state of the task.
     *
     * @relation readonly state: State
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let state: State
    /**
     * The current processing file index in a task.
     *
     * @relation readonly index: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let index: UInt32
    /**
     * The processed data size for the current file in a task.
     *
     * @relation readonly processed: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let processed: Int64
    /**
     * The sizes of files in a task, in bytes.
     *
     * @relation readonly sizes: Array<number>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let sizes: Array<Int64>
    /**
     * The extras for an interaction.
     * Such as headers and body of response from server.
     * But when the Content-Disposition header responded, the body will be into the uri of its attachment only, the body here is empty.
     * {"headers": {"key": v}, "body": "contents"}.
     * The "body" field is not supported in cross-platform scenarios.
     *
     * @relation readonly extras?: object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let extras: HashMap<String, String>

    /**
     * Progress constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(state!: State, index!: UInt32, processed!: Int64, sizes!: Array<Int64>,
        extras!: HashMap<String, String>
    ) {
        this.state = state
        this.index = index
        this.processed = processed
        this.sizes = sizes
        this.extras = extras
    }

    init(v: CProgress) {
        this.state = State.parse(v.state)
        this.index = v.index
        this.processed = v.processd
        this.sizes = unsafe { cArr2cjArr<Int64, Int64>(v.sizeArrLen, v.sizeArr) {size => size} }
        this.extras = v.extras.toHashMap()
    }
}

/**
 * The HTTP response.
 * Describes the data structure of the task response header.
 *
 * @relation interface HttpResponse
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class HttpResponseMessage {
    /**
     * The version of the HTTP response.
     *
     * @relation readonly version: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let version: String
    /**
     * The status code of the HTTP response.
     *
     * @relation readonly statusCode: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let statusCode: Int32
    /**
     * The reason of the HTTP response.
     *
     * @relation readonly reason: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let reason: String
    /**
     * The headers of the HTTP response.
     *
     * @relation readonly headers: Map<string, Array<string>>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let headers: HashMap<String, Array<String>>

    init(version: String, statusCode: Int32, reason: String, headers: HashMap<String, Array<String>>) {
        this.version = version
        this.statusCode = statusCode
        this.reason = reason
        this.headers = headers
    }

    init(v: CHttpResponse) {
        this.version = v.version.toString()
        this.statusCode = v.statusCode
        this.reason = v.reason.toString()
        this.headers = v.headers.toHashMap()
    }
}

/**
 * Indicates the reason for the failure.
 *
 * @relation enum Faults
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Faults <: ToString {
    /**
     * Indicates others failure.
     *
     * @relation OTHERS = 0xFF
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Others
    /**
     * Indicates network disconnection.
     *
     * @relation DISCONNECTED = 0x00
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Disconnected
    /**
     * Indicates task timeout.
     *
     * @relation TIMEOUT = 0x10
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Timeout
    /**
     * Indicates protocol error, such as 5xx response from server.
     *
     * @relation PROTOCOL = 0x20
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    Protocol
    /**
     * Indicates filesystem io error, such as open/seek/read/write/close.
     *
     * @relation FSIO = 0x40
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FSIO
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case Others => 0xFF
                case Disconnected => 0x00
                case Timeout => 0x10
                case Protocol => 0x20
                case FSIO => 0x40
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    /**
     * Gets the Faults value represented in String.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case Others => "Others"
            case Disconnected => "Disconnected"
            case Timeout => "Timeout"
            case Protocol => "Protocol"
            case FSIO => "FSIO"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32): Faults {
        match (v) {
            case 0xFF => Others
            case 0x00 => Disconnected
            case 0x10 => Timeout
            case 0x20 => Protocol
            case 0x40 => FSIO
            case _ => throw Exception("Never reach here!")
        }
    }
}

/**
 * The filter data structure.
 * Used for search, given fields works as **LOGICAL AND**.
 * Invalid value may cause a parameter error.
 *
 * @relation interface Filter
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Filter {
    /**
     * Specify the package name of an application.
     * Only for advanced search, common search will be fixed to the caller.
     * A "*" means any bundle.
     *
     * @relation bundle?: string
     */
    var bundle: ?String
    /**
     * Specify the end Unix timestamp.
     * The default is the moment of calling.
     *
     * @relation before?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var before: ?Int64
    /**
     * Specify the start Unix timestamp.
     * The default is "`before` - 24 hours".
     *
     * @relation after?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var after: ?Int64
    /**
     * Specify the state of tasks.
     * The default is any state.
     *
     * @relation state?: State
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var state: ?State
    /**
     * Specify the action of tasks, "upload" or "download", case insensitive.
     * The default is upload and download.
     *
     * @relation action?: Action
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var action: ?Action
    /**
     * Specify task's mode.
     * The default is Foreground and Background.
     *
     * @relation mode?: Mode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var mode: ?Mode

    /**
     * Filter constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(bundle!: ?String = None, before!: ?Int64 = None, after!: ?Int64 = None, state!: ?State = None,
        action!: ?Action = None, mode!: ?Mode = None
    ) {
        this.bundle = bundle
        this.before = before
        this.after = after
        this.state = state
        this.action = action
        this.mode = mode
    }
}

/**
 * The task information data structure for query results.
 * Provides common query and advanced query, visible range of fields is different.
 *
 * @relation interface TaskInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class TaskInfo {
    /**
     * The UID of an application.
     * For system query only.
     *
     * @relation readonly uid?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let uid: ?String
    /**
     * The bundle name.
     * For system query only.
     *
     * @relation readonly bundle?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let bundle: ?String
    /**
     * The path to save the downloaded file.
     *
     * @relation readonly saveas?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let saveas: ?String
    /**
     * The url of a task.
     * For `${ show }` and `${ touch }`.
     *
     * @relation readonly url?: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let url: ?String
    /**
     * The arguments.
     * For `${ show }` and `${ touch }`.
     *
     * @relation readonly data?: string | Array<FormItem>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let data: ?ConfigData
    /**
     * The task id.
     *
     * @relation readonly tid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let tid: String
    /**
     * The task title.
     *
     * @relation readonly title: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let title: String
    /**
     * The task details.
     *
     * @relation readonly description: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let description: String
    /**
     * The task action.
     *
     * @relation readonly action: Action
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let action: Action
    /**
     * Specify task mode.
     * The default is frontend
     *
     * @relation readonly mode: Mode
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mode: Mode
    /**
     * The priority of this task.
     * Front-end tasks have higher priority than back-end tasks.
     * In tasks of the same mode, the smaller the number, the higher the priority.
     * The default is 0.
     *
     * @relation readonly priority: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let priority: UInt32
    /**
     * The MIME type in the configuration of the task.
     *
     * @relation readonly mimeType: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mimeType: String
    /**
     * An instance of `Progress` for a task.
     *
     * @relation readonly progress: Progress
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let progress: Progress
    /**
     * The progress notification policy of a background task.
     *
     * @relation readonly gauge: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let gauge: Bool
    /**
     * The creating date and time of a task in Unix timestamp.
     * It is generated by system of current device.
     *
     * @relation readonly ctime: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let ctime: UInt64
    /**
     * The modified date and time of a task in Unix timestamp.
     * It is generated by system of current device.
     *
     * @relation readonly mtime: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mtime: UInt64
    /**
     * The retry switch of a task.
     * Just for background, frontend always disable
     *
     * @relation readonly retry: boolean
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let retry: Bool
    /**
     * The tried times of a task.
     *
     * @relation readonly tries: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let tries: UInt32
    /**
     * The faults case of a task.
     *
     * @relation readonly faults: Faults
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let faults: ?Faults
    /**
     * The reason of a waiting/failed/stopped/paused task.
     *
     * @relation readonly reason: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let reason: String
    /**
     * The extras of a task.
     * For frontend, nothing now.
     *
     * @relation readonly extras?: object
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let extras: ?HashMap<String, String>

    /**
     * TaskInfo constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(
        uid!: ?String = None,
        bundle!: ?String = None,
        saveas!: ?String = None,
        url!: ?String = None,
        data!: ?ConfigData = None,
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
    ) {
        this.uid = uid
        this.bundle = bundle
        this.saveas = saveas
        this.url = url
        this.data = data
        this.tid = tid
        this.title = title
        this.description = description
        this.action = action
        this.mode = mode
        this.priority = priority
        this.mimeType = mimeType
        this.progress = progress
        this.gauge = gauge
        this.ctime = ctime
        this.mtime = mtime
        this.retry = retry
        this.tries = tries
        this.reason = reason
        this.faults = faults
        this.extras = extras
    }

    init(v: CTaskInfo) {
        this.uid = v.uid.toString()
        this.bundle = v.bundle.toString()
        this.saveas = v.saveas.toString()
        this.url = v.url.toString()
        this.tid = v.tid.toString()
        this.title = v.title.toString()
        this.description = v.description.toString()
        this.action = Action.parse(v.action)
        this.data = v.data.toCJValue(this.action)
        this.mode = Mode.toMode(v.mode)
        this.priority = v.priority
        this.mimeType = v.mimeType.toString()
        this.progress = Progress(v.progress)
        this.gauge = v.gauge
        this.ctime = v.ctime
        this.mtime = v.mtime
        this.retry = v.retry
        this.tries = v.tries
        this.faults = Faults.parse(v.faults)
        this.reason = v.reason.toString()
        this.extras = v.extras.toHashMapOption()
    }
}

class RequestEvent {
    let callbackList: ArrayList<(CallbackObject, Int64)>
    let callBackMutex: Mutex

    init() {
        callbackList = ArrayList<(CallbackObject, Int64)>()
        callBackMutex = Mutex()
    }

    func off(target: CallbackObject): Unit {
        synchronized(callBackMutex) {
            callbackList.removeIf({callback => refEq(callback[0], target)})
        }
    }

    func on(callback: CallbackObject, id: Int64): Unit {
        synchronized(callBackMutex) {
            callbackList.add((callback, id))
        }
    }

    func clear(): Unit {
        synchronized(callBackMutex) {
            callbackList.clear()
        }
    }

    func contains(target: CallbackObject): Bool {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return true
                }
            }
        }
        false
    }

    func getId(target: CallbackObject): Option<Int64> {
        synchronized(callBackMutex) {
            for (callback in callbackList) {
                if (refEq(callback[0], target)) {
                    return callback[1]
                }
            }
        }
        None
    }
}

class EventManage {
    let eventMap: HashMap<String, RequestEvent>
    let mutex: Mutex

    init() {
        eventMap = HashMap<String, RequestEvent>()
        mutex = Mutex()
    }

    func getOrCreate(eventName: String): RequestEvent {
        synchronized(mutex) {
            if (let Some(v) <- eventMap.get(eventName)) {
                return v
            }
            let event = RequestEvent()
            eventMap.add(eventName, event)
            event
        }
    }

    func remove(eventName: String) {
        synchronized(mutex) {
            eventMap.remove(eventName)
        }
    }
}

/**
 * The task entry.
 * New task' status is "initialized" and enqueue.
 * Can `start` a initialized task.
 * Can `pause` a waiting/running/retrying background task.
 * Can `resume` a paused background task.
 * Can `stop` a running/waiting/retrying task and dequeue it.
 *
 * @relation interface Task
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Task {
    /**
     * The task id, unique on system.
     * Generated automatically by system.
     *
     * @relation readonly tid: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let tid: String
    /**
     * The configurations for the task.
     *
     * @relation config: Config
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public var config: Config

    /**
     * Task constructor.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public init(tid: String, config: Config) {
        this.tid = tid
        this.config = config
    }

    private let eventMng_: EventManage = EventManage()
    ~init() {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                FfiOHOSRequestFreeTask(cTid.value)
            }
        }
    }

    /**
     * Enables the response callback.
     * Subscribes to task response headers.
     *
     * @param { String } event - event types.
     * @param { Callback1Argument<HttpResponseMessage> } callback - callback function with an `HttpResponseMessage` argument.
     * @throws { BusinessException } 401 - Parameter verification failed.
     * @relation on(event: 'response', callback: Callback<HttpResponse>): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func on(event: String, callback: Callback1Argument<HttpResponseMessage>): Unit {
        if (event != "response") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        if (eventMng_.getOrCreate(event).contains(callback)) {
            return
        }

        let wrapper = {
            response: CHttpResponse =>
            callback.invoke(HttpResponseMessage(response))
            response.free()
        }
        unsafe {
            try (
                cTid = LibC.mallocCString(tid).asResource(),
                cType = LibC.mallocCString(event).asResource()
            ) {
                let lambdaData = Callback1Param<CHttpResponse, Unit>(wrapper)
                let ret = FfiOHOSRequestTaskProgressOn(cType.value, cTid.value, lambdaData.getID()).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
                eventMng_.getOrCreate(event).on(callback, lambdaData.getID())
            }
        }
    }

    /**
     * Enables the specified callback.
     * Subscribes to task progress changes, completion events, failure events, pause events, resume events or removal events.
     *
     * @param { String } event - event types.
     * @param { Callback1Argument<Progress> } callback - callback function with a `Progress` argument.
     * @throws { BusinessException } 401 - Parameter verification failed.
     * @relation on(event: 'progress', callback: (progress: Progress) => void): void
     * @relation on(event: 'completed', callback: (progress: Progress) => void): void
     * @relation on(event: 'failed', callback: (progress: Progress) => void): void
     * @relation on(event: 'pause', callback: (progress: Progress) => void): void
     * @relation on(event: 'resume', callback: (progress: Progress) => void): void
     * @relation on(event: 'remove', callback: (progress: Progress) => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func on(event: String, callback: Callback1Argument<Progress>): Unit {
        if (event != "progress" && event != "completed" && event != "failed" && event != "pause" && event != "resume" &&
            event != "remove") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        if (eventMng_.getOrCreate(event).contains(callback)) {
            return
        }

        let wrapper = {
            progress: CProgress =>
            callback.invoke(Progress(progress))
            progress.free()
        }

        unsafe {
            try (
                cTid = LibC.mallocCString(tid).asResource(),
                cType = LibC.mallocCString(event).asResource()
            ) {
                let lambdaData = Callback1Param<CProgress, Unit>(wrapper)
                let ret = FfiOHOSRequestTaskProgressOn(cType.value, cTid.value, lambdaData.getID()).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
                eventMng_.getOrCreate(event).on(callback, lambdaData.getID())
            }
        }
    }

    /**
     * Disables the specified callback.
     * Unsubscribes task progress changes, completion events, failure events, pause events, resume events or removal events.
     *
     * @param { String } event - event types.
     * @param { CallbackObject } callback - callback function.
     * @relation off(event: 'progress', callback?: (progress: Progress) => void): void
     * @relation off(event: 'completed', callback?: (progress: Progress) => void): void
     * @relation off(event: 'failed', callback?: (progress: Progress) => void): void
     * @relation off(event: 'pause', callback?: (progress: Progress) => void): void
     * @relation off(event: 'resume', callback?: (progress: Progress) => void): void
     * @relation off(event: 'remove', callback?: (progress: Progress) => void): void
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func off(event: String, callback!: ?CallbackObject = None): Unit {
        if (event != "progress" && event != "completed" && event != "failed" && event != "pause" && event != "resume" &&
            event != "remove") {
            throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
        }

        let id: Int64 = match (callback) {
            case Some(v) =>
                if (let Some(v) <- eventMng_.getOrCreate(event).getId(v)) {
                    v
                } else {
                    return
                }
            case None => 0 // 0 is off all
        }

        unsafe {
            try (
                cType = LibC.mallocCString(event).asResource(),
                cTid = LibC.mallocCString(tid).asResource()
            ) {
                let ret = FfiOHOSRequestTaskProgressOff(cType.value, cTid.value, id).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
            }
        }

        if (let Some(v) <- callback) {
            eventMng_.getOrCreate(event).off(v)
        } else {
            eventMng_.remove(event)
        }
    }

    /**
     * Starts the task. The following tasks can be started:
     * 1. Tasks just created.
     * 2. Download tasks that are stopped or become FAILED.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 13400003 - Task service ability error.
     * @throws { BusinessException } 21900007 - Operation with wrong task state.
     * @relation start(): Promise<void>
     */
    @!APILevel[
        21,
        permission: "ohos.permission.INTERNET",
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func start(): Unit {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                let ret = FfiOHOSRequestTaskStart(cTid.value).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
            }
        }
    }

    /**
     * Pauses the background task.
     *
     * @throws { BusinessException } 13400003 - Task service ability error.
     * @throws { BusinessException } 21900005 - Operation with wrong task mode.
     * @throws { BusinessException } 21900007 - Operation with wrong task state.
     * @relation pause(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func pause(): Unit {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                let ret = FfiOHOSRequestTaskPause(cTid.value).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
            }
        }
    }

    /**
     * Resumes the background task.
     *
     * @throws { BusinessException } 201 - Permission denied.
     * @throws { BusinessException } 13400003 - Task service ability error.
     * @throws { BusinessException } 21900005 - Operation with wrong task mode.
     * @throws { BusinessException } 21900007 - Operation with wrong task state.
     * @relation resume(): Promise<void>
     */
    @!APILevel[
        21,
        permission: "ohos.permission.INTERNET",
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func resume(): Unit {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                let ret = FfiOHOSRequestTaskResume(cTid.value).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
            }
        }
    }

    /**
     * Stop a running, waiting, or retrying task.
     *
     * @throws { BusinessException } 13400003 - Task service ability error.
     * @throws { BusinessException } 21900007 - Operation with wrong task state.
     * @relation stop(): Promise<void>
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func stop(): Unit {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                let ret = FfiOHOSRequestTaskStop(cTid.value).asCMallocResource()
                if (ret.value.errCode != SUCCESS_CODE) {
                    throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
                }
            }
        }
    }
}

type StageContext = CPointer<Unit>

const TOKEN_MAX_BYTES = 2048
const TOKEN_MIN_BYTES = 8

func checkPara(config: Config): Unit {
    if (let Some(v) <- config.token) {
        if (v.size < TOKEN_MIN_BYTES || v.size > TOKEN_MAX_BYTES) {
            throw BusinessException(ERR_PARAMETER_ERROR,
                "Parameter verification failed, the length of token should between 8 and 2048 bytes")
        }
    }
}

/**
 * Creates a task for upload or download and enqueue it.
 * Only foreground application can create the frontend task.
 * It can deal only one frontend task at a time.
 * A in processing frontend task will be forced to stop when its application had switched to background.
 * A new frontend task will interrupt a existed in processing frontend task.
 * The background task is highly recommended.
 *
 * @param { UIAbilityContext } context - context of the caller.
 * @param { Config } config - configurations for a task.
 * @returns { Task } the upload or download task.
 * @throws { BusinessException } 201 - Permission denied.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type. 3. Parameter verification failed.
 * @throws { BusinessException } 13400001 - Invalid file or file system error.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @throws { BusinessException } 21900004 - the application task queue is full.
 * @throws { BusinessException } 21900005 - Operation with wrong task mode.
 * @relation function create(context: BaseContext, config: Config): Promise<Task>
 */
@!APILevel[
    21,
    permission: "ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func create(context: UIAbilityContext, config: Config): Task {
    let stageContext = getStageContext(context)
    if (stageContext.isNull()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    checkPara(config)
    try (ffiConfig = CConfig(config).asResource()) {
        let ret = unsafe { FfiOHOSRequestCreateTask(stageContext, ffiConfig.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }
        return Task(ret.value.taskId.toString(), config)
    }

    throw BusinessException(EXCEPTION_OTHERS, "Never reach here!")
}

/**
 * Removes specified task belongs to the caller.
 * The task will be forced to stop if in processing.
 *
 * @param { String } id - the task id.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @throws { BusinessException } 21900006 - Task removed or not found.
 * @relation function remove(id: string): Promise<void>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func remove(id: String): Unit {
    unsafe {
        try (cTid = LibC.mallocCString(id).asResource()) {
            let ret = FfiOHOSRequestRemoveTask(cTid.value).asCMallocResource()
            if (ret.value.errCode != SUCCESS_CODE) {
                throw BusinessException(ret.value.errCode, getErrorMsg(ret.value))
            }
        }
    }
}

/**
 * Gets the task with the specified id.
 * Obtains task information based on the task ID.
 *
 * @param { UIAbilityContext } context - context of the caller.
 * @param { String } id - the id of the task.
 * @param { String } token - the token of the task, length between 8 and 2048 bytes.
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type. 3. Parameter verification failed.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @throws { BusinessException } 21900006 - Task removed or not found.
 * @relation function getTask(context: BaseContext, id: string, token?: string): Promise<Task>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func getTask(context: UIAbilityContext, id: String, token!: ?String = None): Task {
    let stageContext = getStageContext(context)
    if (stageContext.isNull()) {
        throw BusinessException(ERR_PARAMETER_ERROR, getErrorMsg(ERR_PARAMETER_ERROR))
    }
    try (
        cToken = RequestNativeOptionCString(token).asResource(),
        cTid = unsafe { LibC.mallocCString(id).asResource() }
    ) {
        let ret = unsafe { FfiOHOSRequestGetTask(stageContext, cTid.value, cToken.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }

        return Task(id, Config(ret.value.task.config))
    }

    throw BusinessException(EXCEPTION_OTHERS, "Never reach here!")
}

/**
 * Shows specified task details belongs to the caller.
 * Queries a task details based on the task ID.
 *
 * @param { String } id - the task id.
 * @returns { TaskInfo } a task info base on the task ID
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @throws { BusinessException } 21900006 - Task removed or not found.
 * @relation function show(id: string): Promise<TaskInfo>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func show(id: String): TaskInfo {
    try (cTid = unsafe { LibC.mallocCString(id).asResource() }) {
        let ret = unsafe { FfiOHOSRequestShowTask(cTid.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }
        return TaskInfo(ret.value.task)
    }

    throw BusinessException(EXCEPTION_OTHERS, "Never reach here!")
}

/**
 * Touches specified task with token.
 * Queries the task details based on the task ID and token.
 *
 * @param { String } id - the task id.
 * @param { String } token - the in-application isolation key.
 * @returns { TaskInfo } a task info base on the task ID and token
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @throws { BusinessException } 21900006 - Task removed or not found.
 * @relation function touch(id: string, token: string): Promise<TaskInfo>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func touch(id: String, token: String): TaskInfo {
    var err: RetError = RetError()
    try (
        cToken = unsafe { LibC.mallocCString(token).asResource() },
        cTid = unsafe { LibC.mallocCString(id).asResource() }
    ) {
        let ret = unsafe { FfiOHOSRequestTouchTask(cTid.value, cToken.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }

        return TaskInfo(ret.value.task)
    }

    throw BusinessException(err.errCode, getErrorMsg(err))
}

/**
 * Searches tasks, for system.
 * Searches for task IDs based on Filter.
 *
 * @returns { Array<String> } task ids which matches filter
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @relation function search(callback: AsyncCallback<Array<string>>): void
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func search(): Array<String> {
    search(Filter())
}

/**
 * Searches tasks, for system.
 * Searches for task IDs based on Filter.
 *
 * @param { Filter } filter - an instance of `Filter`.
 * @returns { Array<String> } task ids which matches filter
 * @throws { BusinessException } 401 - Parameter error. Possible causes: 1. Missing mandatory parameters.
 * 2. Incorrect parameter type.
 * @throws { BusinessException } 13400003 - Task service ability error.
 * @relation function search(filter?: Filter): Promise<Array<string>>
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func search(filter: Filter): Array<String> {
    let ret = unsafe { FfiOHOSRequestSearchTask(CFilter(filter)).asCMallocResource() }
    if (ret.value.err.errCode != 0) {
        throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
    }
    ret.value.tasks.toStringArray()
}
