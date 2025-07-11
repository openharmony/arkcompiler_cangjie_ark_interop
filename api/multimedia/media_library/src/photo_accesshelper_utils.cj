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

package ohos.multimedia.photo_accesshelper

import ohos.ability.*
import ohos.base.*
import ohos.bundle_manager.{BundleManager, BundleInfo, BundleFlag}
import ohos.data_share_predicates.*
import ohos.ffi.*
import ohos.hilog.*
import ohos.image.*
import ohos.multimedia.fetchdata.*
import ohos.resource_manager.ResourceManager
import std.collection.*
import std.deriving.*
import ohos.labels.*

let PHOTO_ACCESS_HELPER_LOG = HilogChannel(0, 0xD002B71, "CJ-Photo_AccessHelper")
let BASIC_FILE_IO_ERROR_CODES: HashMap<Int32, String> = HashMap<Int32, String>(
    (13900001, "Operation not permitted"),
    (13900002, "No such file or directory"),
    (13900003, "No such process"),
    (13900004, "Interrupted system call"),
    (13900005, "I/O error"),
    (13900006, "No such device or address"),
    (13900007, "Arg list too long"),
    (13900008, "Bad file descriptor"),
    (13900009, "No child processes"),
    (13900010, "Try again"),
    (13900011, "Out of memory"),
    (13900012, "Permission denied"),
    (13900013, "Bad address"),
    (13900014, "Device or resource busy"),
    (13900015, "File exists"),
    (13900016, "Cross-device link"),
    (13900017, "No such device"),
    (13900018, "Not a directory"),
    (13900019, "Is a directory"),
    (13900020, "Invalid argument"),
    (13900021, "File table overflow"),
    (13900022, "Too many open files"),
    (13900023, "Text file busy"),
    (13900024, "File too large"),
    (13900025, "No space left on device"),
    (13900026, "Illegal seek"),
    (13900027, "Read-only file system"),
    (13900028, "Too many links"),
    (13900029, "Resource deadlock would occur"),
    (13900030, "Filename too Long"),
    (13900031, "Function not implemented"),
    (13900032, "Directory not empty"),
    (13900033, "Too many symbolic links encountered"),
    (13900034, "Operation would block"),
    (13900035, "Invalid request descriptor"),
    (13900036, "Device not a stream"),
    (13900037, "No data available"),
    (13900038, "Value too large for defined data type"),
    (13900039, "File descriptor in bad state"),
    (13900040, "Interrupted system call should be restarted"),
    (13900041, "Quota exceeded"),
    (13900042, "Unknown error"),
    (13900043, "No record is locks available"),
    (13900044, "Network is unreachable"),
    (13900045, "Connection failed"),
    (13900046, "Software caused connection abort")
)
let USER_DATA_MANAGEMENT_ERROR_CODES = HashMap<Int32, String>(
    [
        (14000001, "Invalid file name"),
        (14000002, "Invalid URI"),
        (14000003, "Invalid file name extension"),
        (14000004, "File already in the recycle bin"),
        (14000011, "System inner fail"),
        (14000014, "Member is not a valid PhotoKey")
    ]
)
let SPACE_STATISTICS_ERROR_CODES = HashMap<Int32, String>(
    [
        (13600001, "IPC error"),
        (13600002, "File system not supported"),
        (13600003, "Unmount failed"),
        (13600004, "Unmount failed"),
        (13600005, "Incorrect volume state"),
        (13600006, "Failed to create the drectory or node"),
        (13600007, "Failed to delete the drectory or node"),
        (13600008, "No such object"),
        (13600009, "User ID out of range")
    ]
)
let USER_FILE_ACCESS_ERROR_CODES = HashMap<Int32, String>(
    [
        (14300001, "IPC error"),
        (14300002, "Invalid URI"),
        (14300003, "Failed to obtain the server ability information"),
        (14300004, "Incorrect result returned by js-server"),
        (14300005, "Failed to register Notify"),
        (14300006, "Failed to unregister Notify"),
        (14300007, "Failed to initialize the Notify agent"),
        (14300008, "Failed to notify the agent")
    ]
)
let DEVICE_CLOUD_SYNCHROIZATION_ERROR_CODES = HashMap<Int32, String>(
    [
        (22400001, "Cloud status not ready"),
        (22400002, "Network unavailable"),
        (22400003, "Network unavailable")
    ]
)

func getErrorMsg(code: Int32): String {
    let errorMsg = HashMap<Int32, String>()
    errorMsg.add(all: BASIC_FILE_IO_ERROR_CODES)
    errorMsg.add(all: USER_DATA_MANAGEMENT_ERROR_CODES)
    errorMsg.add(all: SPACE_STATISTICS_ERROR_CODES)
    errorMsg.add(all: USER_FILE_ACCESS_ERROR_CODES)
    errorMsg.add(all: DEVICE_CLOUD_SYNCHROIZATION_ERROR_CODES)
    errorMsg.add(all: UNIVERSAL_ERROR_MAP)
    match (errorMsg.get(code)) {
        case Some(v) => v
        case None => "Unknown error code: ${code}"
    }
}

func checkRet(errCode: Int32, funcName: String) {
    if (errCode != SUCCESS_CODE) {
        PHOTO_ACCESS_HELPER_LOG.error("${funcName} failed: ${getErrorMsg(errCode)}")
        throw BusinessException(errCode, getErrorMsg(errCode))
    }
}

/**
 * Indicates the type of photo asset member.
 *
 * @typedef { number | string | boolean } MemberType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum MemberType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    INT64(Int64)
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    STRING(String)
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BOOL(Bool)
    | ...

    func getType(): String {
        match (this) {
            case INT64(v) => "getNumber()"
            case STRING(v) => "getString()"
            case BOOL(v) => "getBool()"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getNumber(): Int64 {
        match (this) {
            case INT64(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not Int64 type. Please use ${getType()} to obtain the value.")
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getString(): String {
        match (this) {
            case STRING(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not String type. Please use ${getType()} to obtain the value.")
        }
    }

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getBool(): Bool {
        match (this) {
            case BOOL(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not Bool type. Please use ${getType()} to obtain the value.")
        }
    }
}

/**
 * Options to fetch assets or albums
 *
 * @interface FetchOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class FetchOptions {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public FetchOptions(
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var fetchColumns!: Array<String> = [],
        @!APILevel[
            19,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var predicates!: DataSharePredicates = DataSharePredicates()
    ) {}

    func toCFetchOptions(): CFetchOptions {
        unsafe {
            let cFetchColumns = toArrayCString(fetchColumns)
            CFetchOptions(cFetchColumns, predicates.getID())
        }
    }
}

/**
 * Album type.
 *
 * @enum { number } AlbumType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumType {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    USER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    SYSTEM
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case USER => 0
                case SYSTEM => 1024
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): AlbumType {
        match (value) {
            case 0 => USER
            case 1024 => SYSTEM
            case _ => throw IllegalArgumentException("Invalid AlbumType value.")
        }
    }
}

/**
 * Album subtype
 *
 * @enum { number } AlbumSubtype
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumSubtype {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    USER_GENERIC
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FAVORITE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VIDEO
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IMAGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ANY
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case USER_GENERIC => 1
                case FAVORITE => 1025
                case VIDEO => 1026
                case IMAGE => 1031
                case ANY => 2147483647
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): AlbumSubtype {
        match (value) {
            case 1 => USER_GENERIC
            case 1025 => FAVORITE
            case 1026 => VIDEO
            case 1031 => IMAGE
            case 2147483647 => ANY
            case _ => throw IllegalArgumentException("Invalid AlbumSubtype value.")
        }
    }
}

/**
 * Enumeration of different types of photos
 *
 * @enum { number } PhotoType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoType {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IMAGE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VIDEO
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case IMAGE => 1
                case VIDEO => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): PhotoType {
        match (value) {
            case 1 => IMAGE
            case 2 => VIDEO
            case _ => throw IllegalArgumentException("Invalid PhotoType value.")
        }
    }
}

/**
 * Enumeration of different categories of photos
 *
 * @enum { number } PhotoSubtype
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoSubtype {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DEFAULT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    MOVING_PHOTO
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BURST
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case DEFAULT => 0
                case MOVING_PHOTO => 3
                case BURST => 4
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Enumeration of delivery mode.
 *
 * @enum { number } DeliveryMode
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DeliveryMode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FAST_MODE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HIGH_QUALITY_MODE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BALANCE_MODE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case FAST_MODE => 0
                case HIGH_QUALITY_MODE => 1
                case BALANCE_MODE => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * PhotoViewMIMETypes represents the type of media resource that photo picker selects.
 *
 * @enum { string } PhotoViewMIMETypes
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoViewMIMETypes {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IMAGE_TYPE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VIDEO_TYPE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IMAGE_VIDEO_TYPE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    MOVING_PHOTO_IMAGE_TYPE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case IMAGE_TYPE => 0
                case VIDEO_TYPE => 1
                case IMAGE_VIDEO_TYPE => 2
                case MOVING_PHOTO_IMAGE_TYPE => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Enumeration of different recommendation type
 *
 * @enum { number } RecommendationType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum RecommendationType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QR_OR_BAR_CODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QR_CODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BAR_CODE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ID_CARD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PROFILE_PICTURE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PASSPORT
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BANK_CARD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DRIVER_LICENSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DRIVING_LICENSE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FEATURED_SINGLE_PORTRAIT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case QR_OR_BAR_CODE => 1
                case QR_CODE => 2
                case BAR_CODE => 3
                case ID_CARD => 4
                case PROFILE_PICTURE => 5
                case PASSPORT => 6
                case BANK_CARD => 7
                case DRIVER_LICENSE => 8
                case DRIVING_LICENSE => 9
                case FEATURED_SINGLE_PORTRAIT => 10
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Enumeration of dynamic range type
 *
 * @enum { number } DynamicRangeType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DynamicRangeType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    SDR
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HDR
    | ...
}

/**
 * Enumeration of resource type.
 *
 * @enum { number } ResourceType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum ResourceType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IMAGE_RESOURCE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VIDEO_RESOURCE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case IMAGE_RESOURCE => 1
                case VIDEO_RESOURCE => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }
}

/**
 * Config to create photo asset
 *
 * @interface PhotoCreationConfig
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoCreationConfig {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public PhotoCreationConfig(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let fileNameExtension: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let photoType: PhotoType,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let title!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let subtype!: PhotoSubtype = DEFAULT
    ) {}

    func toCPhotoCreationConfig(): CPhotoCreationConfig {
        var cFileNameExtension: CString = CString(CPointer())
        var cTitle: CString = CString(CPointer())
        unsafe {
            try {
                cFileNameExtension = LibC.mallocCString(fileNameExtension)
                cTitle = LibC.mallocCString(title)
            } catch (e: Exception) {
                LibC.free(cFileNameExtension)
                LibC.free(cTitle)
                throw e
            }
            CPhotoCreationConfig(cTitle, cFileNameExtension, photoType.value, subtype.value)
        }
    }
}

/**
 * Enumeration types of data change.
 *
 * @enum { number } NotifyType
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum NotifyType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NOTIFY_ADD
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NOTIFY_UPDATE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NOTIFY_REMOVE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NOTIFY_ALBUM_ADD_ASSET
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NOTIFY_ALBUM_REMOVE_ASSET
    | ...

    static func parse(value: Int32): NotifyType {
        match (value) {
            case 0 => NOTIFY_ADD
            case 1 => NOTIFY_UPDATE
            case 2 => NOTIFY_REMOVE
            case 3 => NOTIFY_ALBUM_ADD_ASSET
            case 4 => NOTIFY_ALBUM_REMOVE_ASSET
            case _ => throw IllegalArgumentException("Invalid NotifyType value.")
        }
    }
}

/**
 * Defines the change data
 *
 * @interface ChangeData
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class ChangeData {
    protected ChangeData(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let `type`: NotifyType,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let uris: Array<String>,
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let extraUris: Array<String>
    ) {}
}

/**
 * Options to create a photo asset
 *
 * @interface CreateOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class CreateOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public CreateOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var title!: ?String = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var subtype!: ?PhotoSubtype = None
    ) {}
}

/**
 * Options to request media asset
 *
 * @interface RequestOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RequestOptions {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public RequestOptions(
        @!APILevel[
            19,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var deliveryMode: DeliveryMode
    ) {}

    func toCRequestOptions(): CRequestOptions {
        return CRequestOptions(deliveryMode.value)
    }
}

/**
 * PhotoSelectResult Object
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectResult {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public PhotoSelectResult(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var photoUris: Array<String>,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var isOriginalPhoto: Bool
    ) {}
}

/**
 * Defines the text context info.
 *
 * @interface TextContextInfo
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class TextContextInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public TextContextInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public let text!: String = ""
    ) {}
}

/**
 * Options for recommend photos
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RecommendationOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public RecommendationOptions(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var recommendationType!: ?RecommendationType = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var textContextInfo!: ?TextContextInfo = None
    ) {}
}

/**
 * Class BaseSelectOptions, which is extracted from class PhotoSelectOptions
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public open class BaseSelectOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public BaseSelectOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var maxSelectNumber!: Int32 = 50,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var isPhotoTakingSupported!: Bool = true,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var isSearchSupported!: Bool = true,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var recommendationOptions!: RecommendationOptions = RecommendationOptions(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var preselectedUris!: Array<String> = Array<String>(),
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
        ]
        public var isPreviewForSingleSelectionSupported!: Bool = true
    ) {}
}

/**
 * PhotoSelectOptions extends base class BaseSelectOptions
 *
 * @extends BaseSelectOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectOptions <: BaseSelectOptions {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isEditSupported: Bool = true
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isOriginalSupported: Bool = false
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subWindowName: ?String = None
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(
        MIMEType!: PhotoViewMIMETypes = IMAGE_VIDEO_TYPE,
        maxSelectNumber!: Int32 = 50,
        isPhotoTakingSupported!: Bool = true,
        isSearchSupported!: Bool = true,
        recommendationOptions!: RecommendationOptions = RecommendationOptions(),
        preselectedUris!: Array<String> = Array<String>(),
        isPreviewForSingleSelectionSupported!: Bool = true,
        isEditSupported!: Bool = true,
        isOriginalSupported!: Bool = false,
        subWindowName!: ?String = None
    ) {
        super(
            MIMEType: MIMEType,
            maxSelectNumber: maxSelectNumber,
            isPhotoTakingSupported: isPhotoTakingSupported,
            isSearchSupported: isSearchSupported,
            recommendationOptions: recommendationOptions,
            preselectedUris: preselectedUris,
            isPreviewForSingleSelectionSupported: isPreviewForSingleSelectionSupported
        )
        this.isEditSupported = isEditSupported
        this.isOriginalSupported = isOriginalSupported
        this.subWindowName = subWindowName
    }
}

/**
 * Enumeration of photo asset members
 *
 * @enum { string } PhotoKeys
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@Derive[Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoKeys <: ToString {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    URI
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PHOTO_TYPE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DISPLAY_NAME
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    SIZE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DATE_ADDED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DATE_MODIFIED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DURATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    WIDTH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HEIGHT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DATE_TAKEN
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ORIENTATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FAVORITE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    TITLE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DATE_ADDED_MS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DATE_MODIFIED_MS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PHOTO_SUBTYPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DYNAMIC_RANGE_TYPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    COVER_POSITION
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BURST_KEY
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    LCD_SIZE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    THM_SIZE
    | ...

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case URI => 'uri'
            case PHOTO_TYPE => 'media_type'
            case DISPLAY_NAME => 'media_type'
            case SIZE => 'size'
            case DATE_ADDED => 'date_added'
            case DATE_MODIFIED => 'date_modified'
            case DURATION => 'duration'
            case WIDTH => 'width'
            case HEIGHT => 'height'
            case DATE_TAKEN => 'date_taken'
            case ORIENTATION => 'orientation'
            case FAVORITE => 'is_favorite'
            case TITLE => 'title'
            case DATE_ADDED_MS => 'date_added_ms'
            case DATE_MODIFIED_MS => 'date_modified_ms'
            case PHOTO_SUBTYPE => 'subtype'
            case DYNAMIC_RANGE_TYPE => 'dynamic_range_type'
            case COVER_POSITION => 'cover_position'
            case BURST_KEY => 'burst_key'
            case LCD_SIZE => 'lcd_size'
            case THM_SIZE => 'thumb_size'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumeration uris for registerChange.
 *
 * @enum { string } DefaultChangeUri
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DefaultChangeUri <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DEFAULT_PHOTO_URI
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DEFAULT_ALBUM_URI
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case DEFAULT_PHOTO_URI => 'file://media/Photo'
            case DEFAULT_ALBUM_URI => 'file://media/PhotoAlbum'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumeration of photo album members.
 *
 * @enum { string } AlbumKeys
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 */
@Derive[Equatable]
@!APILevel[
    19,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumKeys <: ToString {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    URI
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ALBUM_NAME
    | ...

    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case URI => 'uri'
            case ALBUM_NAME => 'album_name'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
