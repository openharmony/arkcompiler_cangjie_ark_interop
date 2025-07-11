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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum MemberType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Int64Value(Int64)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    StringValue(String)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BoolValue(Bool)
    | ...

    func getType(): String {
        match (this) {
            case Int64Value(v) => "getNumber()"
            case StringValue(v) => "getString()"
            case BoolValue(v) => "getBool()"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getNumber(): Int64 {
        match (this) {
            case Int64Value(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not Int64 type. Please use ${getType()} to obtain the value.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getString(): String {
        match (this) {
            case StringValue(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not String type. Please use ${getType()} to obtain the value.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func getBool(): Bool {
        match (this) {
            case BoolValue(v) => v
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class FetchOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var fetchColumns: Array<String>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var predicates: DataSharePredicates

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(fetchColumns: Array<String>, predicates: DataSharePredicates) {
        this.fetchColumns = fetchColumns
        this.predicates = predicates
    }

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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    User
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    System
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case User => 0
                case System => 1024
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): AlbumType {
        match (value) {
            case 0 => User
            case 1024 => System
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumSubtype {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    UserGeneric
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Favorite
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Video
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Image
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Any
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case UserGeneric => 1
                case Favorite => 1025
                case Video => 1026
                case Image => 1031
                case Any => 2147483647
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): AlbumSubtype {
        match (value) {
            case 1 => UserGeneric
            case 1025 => Favorite
            case 1026 => Video
            case 1031 => Image
            case 2147483647 => Any
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Image
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Video
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case Image => 1
                case Video => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): PhotoType {
        match (value) {
            case 1 => Image
            case 2 => Video
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoSubtype {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Default
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    MovingPhoto
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Burst
    | ...

    protected prop value: Int32 {
        get() {
            match (this) {
                case Default => 0
                case MovingPhoto => 3
                case Burst => 4
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DeliveryMode {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FastMode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HighQualityMode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BalanceMode
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case FastMode => 0
                case HighQualityMode => 1
                case BalanceMode => 2
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoViewMIMETypes {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VideoType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageVideoType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    MovingPhotoImageType
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ImageType => 0
                case VideoType => 1
                case ImageVideoType => 2
                case MovingPhotoImageType => 3
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum RecommendationType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QrOrBarCode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QrCode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BarCode
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IDCard
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ProfilePicture
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PassPort
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BankCard
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DriverLicense
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DrivingLicense
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FeaturedSinglePortrait
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case QrOrBarCode => 1
                case QrCode => 2
                case BarCode => 3
                case IDCard => 4
                case ProfilePicture => 5
                case PassPort => 6
                case BankCard => 7
                case DriverLicense => 8
                case DrivingLicense => 9
                case FeaturedSinglePortrait => 10
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DynamicRangeType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Sdr
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Hdr
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum ResourceType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageResource
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VideoResource
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ImageResource => 1
                case VideoResource => 2
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoCreationConfig {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var fileNameExtension: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var photoType: PhotoType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var title: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subtype: PhotoSubtype

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(fileNameExtension: String, photoType: PhotoType, title!: String = "", subtype!: PhotoSubtype = Default) {
        this.fileNameExtension = fileNameExtension
        this.photoType = photoType
        this.title = title
        this.subtype = subtype
    }

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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum NotifyType {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyAdd
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyUpdate
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyRemove
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyAlbumAddAsset
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyAlbumRemoveAsset
    | ...

    static func parse(value: Int32): NotifyType {
        match (value) {
            case 0 => NotifyAdd
            case 1 => NotifyUpdate
            case 2 => NotifyRemove
            case 3 => NotifyAlbumAddAsset
            case 4 => NotifyAlbumRemoveAsset
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class ChangeData {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var `type`: NotifyType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var uris: Array<String>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var extraUris: Array<String>

    protected ChangeData(`type`: NotifyType, uris: Array<String>, extraUris: Array<String>) {
        this.`type` = `type`
        this.uris = uris
        this.extraUris = extraUris
    }
}

/**
 * Options to create a photo asset
 *
 * @interface CreateOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class CreateOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var title: ?String = None

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subtype: ?PhotoSubtype

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(title!: ?String = None, subtype!: ?PhotoSubtype = None) {
        this.title = title
        this.subtype = subtype
    }
}

/**
 * Options to request media asset
 *
 * @interface RequestOptions
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RequestOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var deliveryMode: DeliveryMode

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(deliveryMode: DeliveryMode) {
        this.deliveryMode = deliveryMode
    }

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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectResult {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var photoUris: Array<String>

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isOriginalPhoto: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(photoUris: Array<String>, isOriginalPhoto: Bool) {
        this.photoUris = photoUris
        this.isOriginalPhoto = isOriginalPhoto
    }
}

/**
 * Defines the text context info.
 *
 * @interface TextContextInfo
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class TextContextInfo {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var text: String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(text!: String = "") {
        this.text = text
    }
}

/**
 * Options for recommend photos
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @atomicservice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RecommendationOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var recommendationType: ?RecommendationType

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var textContextInfo: ?TextContextInfo

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(recommendationType!: ?RecommendationType = None, textContextInfo!: ?TextContextInfo = None) {
        this.recommendationType = recommendationType
        this.textContextInfo = textContextInfo
    }
}

/**
 * Class BaseSelectOptions, which is extracted from class PhotoSelectOptions
 *
 * @syscap SystemCapability.FileManagement.PhotoAccessHelper.Core
 * @crossplatform
 * @atomicservice
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public open class BaseSelectOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var MIMEType: PhotoViewMIMETypes
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var maxSelectNumber: Int32
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isPhotoTakingSupported: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isSearchSupported: Bool
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var recommendationOptions: RecommendationOptions
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var preselectedUris: Array<String>
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isPreviewForSingleSelectionSupported: Bool

    private let impl_: BaseSelectOptionsImpl = BaseSelectOptionsImpl()

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(MIMEType!: PhotoViewMIMETypes = ImageVideoType, maxSelectNumber!: Int32 = 50,
        isPhotoTakingSupported!: Bool = true, isSearchSupported!: Bool = true,
        recommendationOptions!: RecommendationOptions = RecommendationOptions(), preselectedUris!: Array<String> = Array<String>(),
        isPreviewForSingleSelectionSupported!: Bool = true
    ) {
        this.MIMEType = MIMEType
        this.maxSelectNumber = maxSelectNumber
        this.isPhotoTakingSupported = isPhotoTakingSupported
        this.isSearchSupported = isSearchSupported
        this.recommendationOptions = recommendationOptions
        this.preselectedUris = preselectedUris
        this.isPreviewForSingleSelectionSupported = isPreviewForSingleSelectionSupported
    }
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectOptions <: BaseSelectOptions {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isEditSupported: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isOriginalSupported: Bool

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subWindowName: ?String

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public init(
        MIMEType!: PhotoViewMIMETypes = ImageVideoType,
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoKeys <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Uri
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PhotoType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DisplayName
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Size
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateAdded
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateModified
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Duration
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Width
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Height
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateToken
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Orientation
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Favorite
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Title
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateAddedMs
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateModifiedMs
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PhotoSubType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DynamicRangeType
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    CoverPosition
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BurstKey
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    LcdSize
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ThmSize
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case Uri => 'uri'
            case PhotoType => 'media_type'
            case DisplayName => 'media_type'
            case Size => 'size'
            case DateAdded => 'date_added'
            case DateModified => 'date_modified'
            case Duration => 'duration'
            case Width => 'width'
            case Height => 'height'
            case DateToken => 'date_taken'
            case Orientation => 'orientation'
            case Favorite => 'is_favorite'
            case Title => 'title'
            case DateAddedMs => 'date_added_ms'
            case DateModifiedMs => 'date_modified_ms'
            case PhotoSubType => 'subtype'
            case DynamicRangeType => 'dynamic_range_type'
            case CoverPosition => 'cover_position'
            case BurstKey => 'burst_key'
            case LcdSize => 'lcd_size'
            case ThmSize => 'thumb_size'
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DefaultChangeUri <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DefaultPhotoUri
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DefaultAlbumUri
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case DefaultPhotoUri => 'file://media/Photo'
            case DefaultAlbumUri => 'file://media/PhotoAlbum'
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
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumKeys <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Uri
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    AlbumName
    | ...

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public func toString(): String {
        match (this) {
            case Uri => 'uri'
            case AlbumName => 'album_name'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

class BaseSelectOptionsImpl {}
