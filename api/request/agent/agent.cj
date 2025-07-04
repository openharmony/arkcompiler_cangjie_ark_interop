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

package ohos.request.agent

import std.collection.*
import std.regex.*
import std.sync.*
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

// ERRORCODE
const EXCEPTION_FILEIO: Int32 = 13400001
const EXCEPTION_FILEPATH: Int32 = 13400002
const EXCEPTION_SERVICE: Int32 = 13400003
const EXCEPTION_OTHERS: Int32 = 13499999

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Action <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    DOWNLOAD
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    UPLOAD
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case DOWNLOAD => 0
                case UPLOAD => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case DOWNLOAD => "DOWNLOAD"
            case UPLOAD => "UPLOAD"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32): Action {
        match (v) {
            case 0 => DOWNLOAD
            case 1 => UPLOAD
            case _ => throw Exception("Never reach here!")
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Mode <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    BACKGROUND
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FOREGROUND
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case BACKGROUND => 0
                case FOREGROUND => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case BACKGROUND => "BACKGROUND"
            case FOREGROUND => "FOREGROUND"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func toMode(v: UInt32): Mode {
        match (v) {
            case 0 => BACKGROUND
            case 1 => FOREGROUND
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Network <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    ANY
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    WIFI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    CELLULAR
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case ANY => 0
                case WIFI => 1
                case CELLULAR => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(v: UInt32): Network {
        match (v) {
            case 0 => ANY
            case 1 => WIFI
            case 2 => CELLULAR
            case _ => throw Exception("Invalid Network type!")
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case ANY => "ANY"
            case WIFI => "WIFI"
            case CELLULAR => "CELLULAR"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum BroadcastEvent {
    COMPLETE | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public prop value: String {
        get() {
            match (this) {
                case COMPLETE => "ohos.request.event.COMPLETE"
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class FileSpec {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public FileSpec(
        /*
         * A relative path string, like "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html", in the caller's cache directory.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var path!: String,

        /*
         * The MIME type of the file.
         * The default is obtained by the suffix of the filename.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var mimeType!: ?String = None,

        /*
         * The filename, the default is obtained by path.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var filename!: ?String = None,

        /*
         * The extras for the file information.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var extras!: ?HashMap<String, String> = None
    ) {}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum FormItemValueType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    STR(String)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FILE(FileSpec)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FILES(Array<FileSpec>)
    | ...

    prop valueType: UInt32 {
        get() {
            match (this) {
                case STR(_) => 0
                case FILE(_) => 1
                case FILES(_) => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/*
 * The extras for the file information.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class FormItem {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public FormItem(
        /*
         * The item's name.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var name!: String,

        /*
         * The item's value.
         * @type { String  FileSpec  | Array<FileSpec>  |}
         * @throws { BusinessError } 401 - Parameter error.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var value!: FormItemValueType
    ) {}

    init(v: CFormItem) {
        this.name = v.name.toString()
        this.value = v.value.toCJValue()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum ConfigDataType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    STR(String)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FORMITEMS(Array<FormItem>)
    | ...

    prop valueType: UInt32 {
        get() {
            match (this) {
                case STR(_) => 0
                case FORMITEMS(_) => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/*
 * The configurations for a task.
 * Using a flexible configuration for clear upload and download functions.
 * If without emphasis, an option is for any task.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Config {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public Config(
        /*
         * The task action, upload or download.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var action!: Action,
        /*
         * The task action, upload or download.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var url!: String,
        /*
         * The title for a task, give a meaningful title please.
         * The maximum length is 256 characters.
         * The default is upload or download, consistent with its action.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var title!: ?String = None,
        /*
         * The details for a task.
         * The maximum length is 1024 characters.
         * The default is empty string.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var description!: ?String = None,
        /*
         * Indicates task's mode.
         * The default is BACKGROUND.
         * For frontend task, it has callbacks.
         * For background task, it has notifications and fallback.
         * The cross-platform default is FOREGROUND.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var mode!: ?Mode = None,
        /*
         * The solution choice when path already exists during download.
         * Currently support:
         * true, rewrite the existed file.
         * false, go to fail.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var overwrite!: Bool = false,
        /*
         * The HTTP standard method for upload or download: GET/POST/PUT.
         * Case insensitive.
         * For upload, use PUT/POST, the default is PUT.
         * For download, use GET/POST, the default is GET.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var method!: ?String = None,
        /*
         * The HTTP headers.
         * For upload request, the `Content-Type` is forced to `multipart/form-data`.
         * For download request, the default `Content-Type` is `application/json`.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var headers!: ?HashMap<String, String> = None,
        /*
         * The arguments, it can be any text, uses json usually.
         * For download, it can be raw string, the default is empty string.
         * For upload, it can be form items, the default is a empty form.
         * there must be one `FileSpec` item at least or will be a parameter error.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var data!: ?ConfigDataType = None,
        /*
         * The path to save the downloaded file, the default is "./".
         * Currently support:
         * 1: relative path, like "./xxx/yyy/zzz.html", "xxx/yyy/zzz.html", under caller's cache folder.
         * 2: uri path, like "datashare://bundle/xxx/yyy/zzz.html", the data provider must allow the caller's access.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var saveas!: ?String = None,
        /*
         * The network.
         * The default is Network.ANY
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var network!: Network = Network.ANY,
        /*
         * Allows work in metered network or not.
         * The default is false.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var metered!: Bool = false,
        /*
         * Allows work in roaming network or not.
         * The default is true.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var roaming!: Bool = true,
        /*
         * Enable automatic retry or not for the background task.
         * The frontend task is always fast-fail.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var retry!: Bool = true,
        /*
         * Allows redirect or not.
         * The default is true.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var redirect!: Bool = true,
        /*
         * The index of paths for a task.
         * Usually used for a continuous job.
         * The default is 0.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var index!: UInt32 = 0,
        /*
         * The start point of a file.
         * Usually used for a continuous job.
         * It will set the "Range" header in download.
         * It will start read at the point in upload.
         * The default is 0.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var begins!: Int64 = 0,
        /*
         * The end point of a file.
         * Usually used for a continuous job.
         * It will set The "Range" header in download.
         * It will end read at the point in upload.
         * The default is -1 indicating the end of the data for upload or download.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var ends!: Int64 = -1,
        /*
         * The policy of the progress notification for background task.
         * If false: only completed or failed notification, the default.
         * If true, emits every progress, completed or failed notifications.
         */
        @!APILevel[
            12,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var gauge!: Bool = false,
        /*
         * Breaks when fail to fetch filesize before upload/download or not.
         * Uses filesize for a precise gauge.
         * The default is false, set size as -1 indicating the case.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var precise!: Bool = false,
        /*
         * For in-application layer isolation.
         * If given:
         *   the minimum is 8 bytes.
         *   the maximum is 2048 bytes.
         * Creates a task with token, then must provide it during normal query.
         * So saves the token carefully, it can not be retrieved by query.
         * Or leave it empty.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var token!: ?String = None,
        /*
         * The priority of this task.
         * Front-end tasks have higher priority than back-end tasks.
         * In tasks of the same mode, the smaller the number, the higher the priority.
         * The default is 0.
         */
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var priority!: UInt32 = 0,
        /*
         * The extras for the configuration.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var extras!: ?HashMap<String, String> = None
    ) {}

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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum State <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    INITIALIZED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    WAITING
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    RUNNING
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    RETRYING
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    PAUSED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    STOPPED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    COMPLETED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FAILED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    REMOVED
    | ...

    prop value: UInt32 {
        get() {
            match (this) {
                case INITIALIZED => 0x00
                case WAITING => 0x10
                case RUNNING => 0x20
                case RETRYING => 0x21
                case PAUSED => 0x30
                case STOPPED => 0x31
                case COMPLETED => 0x40
                case FAILED => 0x41
                case REMOVED => 0x50
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case INITIALIZED => "INITIALIZED"
            case WAITING => "WAITING"
            case RUNNING => "RUNNING"
            case RETRYING => "RETRYING"
            case PAUSED => "PAUSED"
            case STOPPED => "STOPPED"
            case COMPLETED => "COMPLETED"
            case FAILED => "FAILED"
            case REMOVED => "REMOVED"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32) {
        match (v) {
            case 0x0 => INITIALIZED
            case 0x10 => WAITING
            case 0x20 => RUNNING
            case 0x21 => RETRYING
            case 0x30 => PAUSED
            case 0x40 => COMPLETED
            case 0x41 => FAILED
            case 0x50 => REMOVED
            case _ => INITIALIZED
        }
    }
}

/*
 * The progress data structure.
 * Upload allows multiple files per upload task.
 * Only one file in a download task.
 * So using a unified data structure for progress.
 * Generally:
 * 1: sum(sizes) is total files size of the task.
 * 2: float(processed)/sizes[counter] is the progress for the current processing file.
 * 3: float(sum(sizes[:index])+processed)/sum(sizes) is the summary progress for a task.
 * If fetch file size in failure, the size of the file in sizes will be set as -1.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Progress {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public Progress(
        /*
         * The current state of the task.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let state!: State,
        /*
         * The current processing file index in a task.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let index!: UInt32,
        /*
         * The processed data size for the current file in a task.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let processed!: Int64,
        /*
         * The sizes of files in a task.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let sizes!: Array<Int64>,
        /*
         * The extras for an interaction.
         * Such as headers and body of response from server.
         * But when the Content-Disposition header responded, the body will be into the uri of its attachment only, the body here is empty.
         * {"headers": {"key": v}, "body": "contents"}.
         * The "body" field is not supported in cross-platform scenarios.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let extras!: HashMap<String, String>
    ) {}

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
 *
 * @interface HttpResponseMessage
 * @syscap SystemCapability.Request.FileTransferAgent
 * @atomicservice
 */
@!APILevel[
    15,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class HttpResponseMessage {
    HttpResponseMessage(
        /**
         * The version of the HTTP response.
         *
         * @type { String }
         * @readonly
         * @syscap SystemCapability.Request.FileTransferAgent
         * @atomicservice
         */
        @!APILevel[
            15,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let version: String,
        /**
         * The status code of the HTTP response.
         *
         * @type { Int32 }
         * @readonly
         * @syscap SystemCapability.Request.FileTransferAgent
         * @atomicservice
         */
        @!APILevel[
            15,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let statusCode: Int32,
        /**
         * The reason of the HTTP response.
         *
         * @type { String }
         * @readonly
         * @syscap SystemCapability.Request.FileTransferAgent
         * @atomicservice
         */
        @!APILevel[
            15,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let reason: String,
        /**
         * The headers of the HTTP response.
         *
         * @type { HashMap<String, Array<String>> }
         * @readonly
         * @syscap SystemCapability.Request.FileTransferAgent
         * @atomicservice
         */
        @!APILevel[
            15,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let headers: HashMap<String, Array<String>>
    ) {}

    init(v: CHttpResponse) {
        this.version = v.version.toString()
        this.statusCode = v.statusCode
        this.reason = v.reason.toString()
        this.headers = v.headers.toHashMap()
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public enum Faults <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    OTHERS
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    DISCONNECTED
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    TIMEOUT
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    PROTOCOL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    FSIO
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    PARAM
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    REDIRECT
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    TCP
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    SSL
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    DNS
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case OTHERS => 0xFF
                case DISCONNECTED => 0x00
                case TIMEOUT => 0x10
                case PROTOCOL => 0x20
                case PARAM => 0x30
                case FSIO => 0x40
                case DNS => 0x50
                case TCP => 0x60
                case SSL => 0x70
                case REDIRECT => 0x80
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public func toString(): String {
        match (this) {
            case OTHERS => "OTHERS"
            case DISCONNECTED => "DISCONNECTED"
            case TIMEOUT => "TIMEOUT"
            case PROTOCOL => "PROTOCOL"
            case FSIO => "FSIO"
            case PARAM => "PARAM"
            case DNS => "DNS"
            case TCP => "TCP"
            case SSL => "SSL"
            case REDIRECT => "REDIRECT"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(v: UInt32): Faults {
        match (v) {
            case 0xFF => OTHERS
            case 0x00 => DISCONNECTED
            case 0x10 => TIMEOUT
            case 0x20 => PROTOCOL
            case 0x30 => PARAM
            case 0x40 => FSIO
            case 0x50 => DNS
            case 0x60 => TCP
            case 0x70 => SSL
            case 0x80 => REDIRECT
            case _ => throw Exception("Never reach here!")
        }
    }
}
/*
 * The filter data structure.
 * Used for search, given fields works as **LOGICAL AND**.
 * Invalid value may cause a parameter error.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Filter {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public Filter(
        /*
         * Specify the package name of an application.
         * Only for advanced search, common search will be fixed to the caller.
         * A "*" means any bundle.
         * Hide this for inner system use.
         */
        var bundle!: ?String = None,
        /*
         * Specify the end Unix timestamp.
         * The default is the moment of calling.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var before!: ?Int64 = None,
        /*
         * Specify the start Unix timestamp.
         * The default is "`before` - 24 hours".
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var after!: ?Int64 = None,
        /*
         * Specify the state of tasks.
         * The default is any state.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var state!: ?State = None,
        /*
         * Specify the action of tasks, "upload" or "download", case insensitive.
         * The default is upload and download.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var action!: ?Action = None,
        /*
         * Specify task's mode.
         * The default is FOREGROUND and BACKGROUND.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public var mode!: ?Mode = None
    ) {}
}

/*
 * The task information data structure for query results.
 * Provides common query and advanced query, visible range of fields is different.
 */
@!APILevel[
    15,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class TaskInfo {
    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let uid: ?String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let bundle: ?String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let saveas: ?String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let url: ?String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let data: ?ConfigDataType

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let tid: String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let title: String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let description: String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let action: Action

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mode: Mode

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let priority: UInt32

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mimeType: String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let progress: Progress

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let gauge: Bool

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let ctime: UInt64

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let mtime: UInt64

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let retry: Bool

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let tries: UInt32

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let faults: ?Faults

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let reason: String

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public let extras: ?HashMap<String, String>

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
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

/*
 * The task entry.
 * New task' status is "initialized" and enqueue.
 * Can `start` a initialized task.
 * Can `pause` a waiting/running/retrying background task.
 * Can `resume` a paused background task.
 * Can `stop` a running/waiting/retrying task and dequeue it.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public class Task {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Request.FileTransferAgent"
    ]
    public Task(
        /*
         * The task id, unique on system.
         * Generated automatically by system.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let tid: String,
        /*
         * The configurations for the task.
         */
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Request.FileTransferAgent"
        ]
        public let config: Config
    ) {}

    private let eventMng_: EventManage = EventManage()
    ~init() {
        unsafe {
            try (cTid = LibC.mallocCString(tid).asResource()) {
                FfiOHOSRequestFreeTask(cTid.value)
            }
        }
    }

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        15,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

    @!APILevel[
        12,
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

    @!APILevel[
        12,
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

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    permission: "ohos.permission.INTERNET",
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func create(context: StageContext, config: Config): Task {
    checkPara(config)
    try (ffiConfig = CConfig(config).asResource()) {
        let ret = unsafe { FfiOHOSRequestCreateTask(context, ffiConfig.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }
        return Task(ret.value.taskId.toString(), config)
    }

    throw BusinessException(EXCEPTION_OTHERS, "Never reach here!")
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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

@!APILevel[
    15,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func getTask(context: StageContext, id: String, token!: ?String = None): Task {
    try (
        cToken = RequestNativeOptionCString(token).asResource(),
        cTid = unsafe { LibC.mallocCString(id).asResource() }
    ) {
        let ret = unsafe { FfiOHOSRequestGetTask(context, cTid.value, cToken.value).asCMallocResource() }
        if (ret.value.err.errCode != 0) {
            throw BusinessException(ret.value.err.errCode, getErrorMsg(ret.value.err))
        }

        return Task(id, Config(ret.value.task.config))
    }

    throw BusinessException(EXCEPTION_OTHERS, "Never reach here!")
}

@!APILevel[
    15,
    crossplatform: true,
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

@!APILevel[
    15,
    crossplatform: true,
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

@!APILevel[
    15,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Request.FileTransferAgent"
]
public func search(): Array<String> {
    search(Filter())
}

@!APILevel[
    15,
    crossplatform: true,
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
