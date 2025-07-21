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

package ohos.file.photo_access_helper

import ohos.base.*
import ohos.data.data_share_predicates.*
import ohos.ffi.*
import ohos.hilog.*
import ohos.labels.*

import std.collection.*
import std.deriving.Derive

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
 * @relation type MemberType = number | string | boolean;
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

    func getNumber(): Int64 {
        match (this) {
            case Int64Value(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not Int64 type. Please use ${getType()} to obtain the value.")
        }
    }

    func getString(): String {
        match (this) {
            case StringValue(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not String type. Please use ${getType()} to obtain the value.")
        }
    }

    func getBool(): Bool {
        match (this) {
            case BoolValue(v) => v
            case _ => throw IllegalArgumentException(
                "This data is not Bool type. Please use ${getType()} to obtain the value.")
        }
    }
}

/**
 * Defines the options for fetching media files.
 *
 * @relation interface FetchOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class FetchOptions {
    /**
     * Indicates the members to query.
     *
     * @relation fetchColumns: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var fetchColumns: Array<String>

    /**
     * Predicates that specify the fetch criteria.
     *
     * @relation predicates: dataSharePredicates.DataSharePredicates;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var predicates: DataSharePredicates

    /**
     * Create fetchOptions instance.
     */
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
 * Enumerates the album types.
 *
 * @relation enum AlbumType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumType {
    /**
     * User album.
     *
     * @relation USER = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    User

    /**
     * System album.
     *
     * @relation SYSTEM = 1024
     */
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
 * Enumerate the album subtypes.
 *
 * @relation enum AlbumSubtype
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumSubtype {
    /**
     * Generic user-created albums.
     *
     * @relation USER_GENERIC = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    UserGeneric

    /**
     * Favorite album, which assets are marked as favorite.
     *
     * @relation FAVORITE = 1025
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Favorite

    /**
     * Video album, which contains all video assets.
     *
     * @relation VIDEO
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Video

    /**
     * Image album
     *
     * @relation IMAGE = 1031
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Image

    /**
     * Any album
     *
     * @relation ANY = 2147483647
     */
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
 * Enumerates media file types.
 *
 * @relation enum PhotoType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoType {
    /**
     * Image asset
     *
     * @relation IMAGE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Image

    /**
     * Video asset
     *
     * @relation VIDEO = 2
     */
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
 * Enumerates the PhotoAsset types.
 *
 * @relation enum PhotoSubtype
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoSubtype {
    /**
     * Default Photo Type
     *
     * @relation DEFAULT = 0
     */
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

    /**
     * Moving Photo Type
     *
     * @relation MOVING_PHOTO = 3
     */
    MovingPhoto
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]

    /**
     * Burst Photo Type
     *
     * @relation BURST = 4
     */
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
 * Enumerates the asset delivery modes.
 *
 * @relation enum DeliveryMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DeliveryMode {
    /**
     * Fast mode.
     *
     * @relation FAST_MODE = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    FastMode

    /**
     * High-quality mode.
     *
     * @relation HIGH_QUALITY_MODE = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HighQualityMode

    /**
     * Balance mode.
     *
     * @relation BALANCE_MODE = 2
     */
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
 * @relation export enum PhotoViewMIMETypes
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoViewMIMETypes {
    /**
     * IMAGE_TYPE indicates that the selected media resources are images.
     *
     * @relation IMAGE_TYPE = 'image/\*'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageType

    /**
     * VIDEO_TYPE indicates that the selected media resources are videos.
     *
     * @relation VIDEO_TYPE = 'video/\*'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    VideoType

    /**
     * IMAGE_VIDEO_TYPE indicates that the selected media resources are images and videos.
     *
     * @relation IMAGE_VIDEO_TYPE = '*\/\*',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageVideoType

    /**
     * MOVING_PHOTO_IMAGE_TYPE indicates that the selected media resources are moving photos.
     *
     * @relation MOVING_PHOTO_IMAGE_TYPE = 'image/movingPhoto'
     */
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
 * Enumerates the types of recommended images.
 *
 * @relation enum RecommendationType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum RecommendationType {
    /**
     * QR_OR_BAR_CODE indicates that QR code or barcode photos can be recommended
     *
     * @relation QR_OR_BAR_CODE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QROrBarCode

    /**
     * QR_CODE indicates that QR code photos can be recommended
     *
     * @relation QR_CODE = 2
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    QRCode

    /**
     * BAR_CODE indicates that barcode photos can be recommended
     *
     * @relation BAR_CODE = 3
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BarCode

    /**
     * ID_CARD indicates that QR code or barcode photos can be recommended
     *
     * @relation ID_CARD = 4
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    IDCard

    /**
     * PROFILE_PICTURE indicates that profile picture photos can be recommended
     *
     * @relation PROFILE_PICTURE = 5
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ProfilePicture

    /**
     * PASSPORT indicates that passport photos can be recommended
     *
     * @relation PASSPORT = 6
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PassPort

    /**
     * BANK_CARD indicates that bank card photos can be recommended
     *
     * @relation BANK_CARD = 7
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BankCard

    /**
     * DRIVER_LICENSE indicates that driver license photos can be recommended
     *
     * @relation DRIVER_LICENSE = 8
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DriverLicense

    /**
     * DRIVING_LICENSE indicates that driving license photos can be recommended
     *
     * @relation DRIVING_LICENSE = 9
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DrivingLicense

    /**
     * FEATURED_SINGLE_PORTRAIT indicates that featured single portrait photos can be recommended
     *
     * @relation FEATURED_SINGLE_PORTRAIT = 10
     */
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
                case QROrBarCode => 1
                case QRCode => 2
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
 * Enumerates the formats for displaying media assets.
 *
 * @relation enum DynamicRangeType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DynamicRangeType {
    /**
     * Standard dynamic range (SDR).
     *
     * @relation SDR = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    SDR

    /**
     * High dynamic range (HDR).
     *
     * @relation HDR = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    HDR
    | ...
}

/**
 * Enumerates the types of the resources to write.
 *
 * @relation enum ResourceType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum ResourceType {
    /**
     * Image resource
     *
     * @relation IMAGE_RESOURCE = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    ImageResource

    /**
     * Video resource
     *
     * @relation VIDEO_RESOURCE = 2,
     */
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
 * @relation interface PhotoCreationConfig
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoCreationConfig {
    /**
     * Extension of the asset
     *
     * @relation fileNameExtension: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var fileNameExtension: String

    /**
     * Specify photo type of the asset to create, include image or video
     *
     * @relation photoType: PhotoType;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var photoType: PhotoType

    /**
     * Title of the asset
     *
     * @relation title?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var title: String

    /**
     * Specify photo subtype of the asset to create, include default or moving_photo
     *
     * @relation subtype?: PhotoSubtype;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subtype: PhotoSubtype

    /**
     * Create PhotoCreationConfig instance
     */
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
 * @relation enum NotifyType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum NotifyType {
    /**
     * Data(assets or albums) have been newly created
     *
     * @relation NOTIFY_ADD
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyAdd

    /**
     * Data(assets or albums) have been modified
     *
     * @relation NOTIFY_UPDATE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyUpdate

    /**
     * Data(assets or albums) have been removed
     *
     * @relation NOTIFY_REMOVE
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyRemove

    /**
     * Assets have been added to an album.
     *
     * @relation NOTIFY_ALBUM_ADD_ASSET
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    NotifyAlbumAddAsset

    /**
     * Assets have been removed from an album.
     *
     * @relation NOTIFY_ALBUM_REMOVE_ASSET
     */
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
 * @relation interface ChangeData
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class ChangeData {
    /**
     * The NotifyType of ChangeData
     *
     * @relation type: NotifyType;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var notifyType: NotifyType

    /**
     * The changed uris
     *
     * @relation uris: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var uris: Array<String>

    /**
     * Change details of the asset uris to an album.
     *
     * @relation extraUris: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var extraUris: Array<String>

    protected ChangeData(notifyType: NotifyType, uris: Array<String>, extraUris: Array<String>) {
        this.notifyType = notifyType
        this.uris = uris
        this.extraUris = extraUris
    }
}

/**
 * Options for creating an image or video asset.
 *
 * @relation interface CreateOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class CreateOptions {
    /**
     * Title of the asset
     *
     * @relation title?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var title: ?String = None

    /**
     * Specify subtype of the asset to create
     *
     * @relation subtype?: PhotoSubtype;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subtype: ?PhotoSubtype

    /**
     * Create CreateOptions instance
     */
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
 * @relation interface RequestOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RequestOptions {
    /**
     * Indicates the delivery mode
     *
     * @relation deliveryMode: DeliveryMode;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var deliveryMode: DeliveryMode

    /**
     * Create RequestOptions instance
     */
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
 * Defines information about the images or videos selected.
 *
 * @relation class PhotoSelectResult
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectResult {
    /**
     * URIs of the images or videos selected. The URI array can be used only by calling photoAccessHelper.getAssets with temporary authorization.
     * For details about how to use the media file URI, see Using a Media File URI.
     *
     * @relation photoUris: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var photoUris: Array<String>

    /**
     * Whether the selected media asset is the original image.
     * The value true means that the selected media asset is the original image, and false means the opposite.
     * The default value is false.
     *
     * @relation isOriginalPhoto: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isOriginalPhoto: Bool

    /**
     * Create PhotoSelectResult instance
     */
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
 * Represents the text information about the recommended images.
 *
 * @relation interface TextContextInfo
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class TextContextInfo {
    /**
     * Text based on which images are recommended.
     * The text cannot exceed 250 characters. The default value is an empty string.
     *
     * @relation text?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var text: String

    /**
     * Create TextContextInfo instance
     */
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
 * Defines the image recommendation options.
 * The image recommendation feature depends on the image data analysis capability, which varies with devices.
 *
 * @relation class RecommendationOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class RecommendationOptions {
    /**
     * Type of the recommended image.
     *
     * @relation recommendationType?: RecommendationType;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var recommendationType: ?RecommendationType

    /**
     * Text based on which images are recommended.
     * If both recommendationType and textContextInfo are set, textContextInfo takes precedence over recommendationType.
     *
     * @relation textContextInfo?: TextContextInfo;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var textContextInfo: ?TextContextInfo

    /**
     * Create RecommendationOptions instance
     */
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
 * @relation class BaseSelectOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public open class BaseSelectOptions {
    /**
     * The Type of the file in the picker window.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation MIMEType?: PhotoViewMIMETypes;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var MIMEType: PhotoViewMIMETypes

    /**
     * Maximum number of images for a single selection.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation maxSelectNumber?: number;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var maxSelectNumber: Int32

    /**
     * Support taking photos.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation isPhotoTakingSupported?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isPhotoTakingSupported: Bool

    /**
     * Support search.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation isSearchSupported?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isSearchSupported: Bool

    /**
     * The recommendation options when use recommendation photo function.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation recommendationOptions?: RecommendationOptions;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var recommendationOptions: RecommendationOptions

    /**
     * The uri for the preselected files.
     * Move from class PhotoSelectOptions to it's base class BaseSelectOptions
     *
     * @relation preselectedUris?: Array<string>;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var preselectedUris: Array<String>

    /**
     * Support preview in single selection mode or not
     *
     * @relation isPreviewForSingleSelectionSupported?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isPreviewForSingleSelectionSupported: Bool

    private let impl_: BaseSelectOptionsImpl = BaseSelectOptionsImpl()

    /**
     * Create BaseSelectOptions instance
     */
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
 * @relation class PhotoSelectOptions extends BaseSelectOptions
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public class PhotoSelectOptions <: BaseSelectOptions {
    /**
     * Support editing photos.
     *
     * @relation isEditSupported?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isEditSupported: Bool

    /**
     * Support select original photo or not
     *
     * @relation isOriginalSupported?: boolean;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var isOriginalSupported: Bool

    /**
     * SubWindow name
     *
     * @relation subWindowName?: string;
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    public var subWindowName: ?String

    /**
     * Create PhotoSelectOptions instance 
     */
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
 * @relation enum PhotoKeys
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum PhotoKeys <: ToString {
    /**
     * Asset uri, read only
     *
     * @relation URI = 'uri'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Uri

    /**
     * Photo type of the asset, read only
     *
     * @relation PHOTO_TYPE = 'media_type'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PhotoType

    /**
     * Asset name, read only
     *
     * @relation DISPLAY_NAME = 'display_name'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DisplayName

    /**
     * Size of the asset, read only
     *
     * @relation SIZE = 'size'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Size

    /**
     * Creation date of the asset, read only
     *
     * @relation DATE_ADDED = 'date_added'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateAdded

    /**
     * Modified date of the asset, read only
     *
     * @relation DATE_MODIFIED = 'date_modified'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateModified

    /**
     * Duration of video files, read only
     *
     * @relation DURATION = 'duration'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Duration

    /**
     * Width of the image asset, read only
     *
     * @relation WIDTH = 'width'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Width

    /**
     * Height of the image asset, read only
     *
     * @relation HEIGHT = 'height'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Height

    /**
     * Date taken of the asset, read only
     *
     * @relation DATE_TAKEN = 'date_taken'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateTaken

    /**
     * Orientation of the image asset, read only
     *
     * @relation ORIENTATION = 'orientation'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Orientation

    /**
     * Favorite state of the asset, read only
     *
     * @relation FAVORITE = 'is_favorite'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Favorite

    /**
     * Title of the asset
     *
     * @relation TITLE = 'title'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Title

    /**
     * Creation time of the asset in milliseconds, read only
     *
     * @relation DATE_ADDED_MS = 'date_added_ms',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateAddedMs

    /**
     * Modified time of the asset in milliseconds, read only
     *
     * @relation DATE_MODIFIED_MS = 'date_modified_ms'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DateModifiedMs

    /**
     * Photo subtype of the asset, read only
     *
     * @relation PHOTO_SUBTYPE = 'subtype'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    PhotoSubType

    /**
     * Dynamic range type of the asset, read only
     *
     * @relation DYNAMIC_RANGE_TYPE = 'dynamic_range_type'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DynamicRangeType

    /**
     * Cover position of the asset, read only
     *
     * @relation COVER_POSITION = 'cover_position'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    CoverPosition

    /**
     * Unique uuid of the burst photos, read only
     *
     * @relation BURST_KEY = 'burst_key'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    BurstKey

    /**
     * Width and height information of lcd picture, read only
     *
     * @relation LCD_SIZE = 'lcd_size'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    LCDSize

    /**
     * Width and height information of thumbnail picture, read only
     *
     * @relation THM_SIZE = 'thm_size'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    THMSize
    | ...

    /**
     * Obtaining the string value of enum
     */
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
            case DateTaken => 'date_taken'
            case Orientation => 'orientation'
            case Favorite => 'is_favorite'
            case Title => 'title'
            case DateAddedMs => 'date_added_ms'
            case DateModifiedMs => 'date_modified_ms'
            case PhotoSubType => 'subtype'
            case DynamicRangeType => 'dynamic_range_type'
            case CoverPosition => 'cover_position'
            case BurstKey => 'burst_key'
            case LCDSize => 'lcd_size'
            case THMSize => 'thumb_size'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumeration uris for registerChange.
 *
 * @relation enum DefaultChangeUri
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum DefaultChangeUri <: ToString {
    /**
     * Uri for default PhotoAsset, use with forDescendant{true}, will receive all PhotoAsset's change notifications
     *
     * @relation DEFAULT_PHOTO_URI = 'file://media/Photo'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DefaultPhotoUri

    /**
     * Uri for default Album, use with forDescendant{true}, will receive all Album's change notifications
     *
     * @relation DEFAULT_ALBUM_URI = 'file://media/PhotoAlbum'
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    DefaultAlbumUri
    | ...

    /**
     * Obtaining the string value of enum
     */
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
 * Enumerates the key album attributes.
 *
 * @relation enum AlbumKeys
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
]
public enum AlbumKeys <: ToString {
    /**
     * URI of the album.
     *
     * @relation URI = 'uri'
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    Uri

     /**
     * Name of the album.
     *
     * @relation ALBUM_NAME = 'album_name',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.FileManagement.PhotoAccessHelper.Core"
    ]
    AlbumName
    | ...

    /**
     * Obtaining the string value of enum
     */
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
