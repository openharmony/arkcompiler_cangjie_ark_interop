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

package ohos.multimedia.camera

import ohos.ffi.*
import ohos.hilog.*
import ohos.base.*
import std.collection.*
import std.sync.*
import std.deriving.*
import ohos.labels.*

const LOG_DOMAIN: UInt32 = 0xD002B00
let CAMERA_LOG = HilogChannel(0, LOG_DOMAIN, "CJ-Camera")

func paramError(needed: String, mustbe: String): String {
    return "Parameter error. The " + needed + " must be " + mustbe + "."
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (7400101, "Parameter missing or parameter type incorrect."),
        (7400102, "Operation not allowed."),
        (7400103, "Session not config."),
        (7400104, "Session not running."),
        (7400105, "Session config locked."),
        (7400106, "Device setting locked."),
        (7400107, "Can not use camera cause of conflict."),
        (7400108, "Camera disabled cause of security reason."),
        (7400109, "Can not use camera cause of preempted."),
        (7400110, "Unresolved conflicts with current configurations."),
        (7400201, "Camera service fatal error.")
    ]
)

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error. Error code is ${code}"
    }
}

func successOrThrow(errCode: Int32): Unit {
    if (errCode != SUCCESS_CODE) {
        throw BusinessException(errCode, getErrorMsg(errCode))
    }
}

func findCallbackObject(list: ArrayList<(CallbackObject, Int64)>, callback: CallbackObject): Bool {
    for (item in list) {
        if (refEq(callback, item[0])) {
            return true
        }
    }
    return false
}

/**
 * Enum for camera error code.
 *
 * @enum CameraErrorCode
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraErrorCode {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    INVALID_ARGUMENT
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    OPERATION_NOT_ALLOWED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SESSION_NOT_CONFIG
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SESSION_NOT_RUNNING
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SESSION_CONFIG_LOCKED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    DEVICE_SETTING_LOCKED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CONFLICT_CAMERA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    DEVICE_DISABLED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    DEVICE_PREEMPTED
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SERVICE_FATAL_ERROR
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func getValue(): Int32 {
        match (this) {
            case INVALID_ARGUMENT => 7400101
            case OPERATION_NOT_ALLOWED => 7400102
            case SESSION_NOT_CONFIG => 7400103
            case SESSION_NOT_RUNNING => 7400104
            case SESSION_CONFIG_LOCKED => 7400105
            case DEVICE_SETTING_LOCKED => 7400106
            case CONFLICT_CAMERA => 7400107
            case DEVICE_DISABLED => 7400108
            case DEVICE_PREEMPTED => 7400109
            case UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS => 7400110
            case SERVICE_FATAL_ERROR => 7400201
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Rectangle definition.
 *
 * @typedef Rect
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class Rect {
    /**
     * X coordinator of top left point.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var topLeftX: Float64
    /**
     * Y coordinator of top left point.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var topLeftY: Float64
    /**
     * Width of this rectangle.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var width: Float64
    /**
     * Height of this rectangle.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var height: Float64

    init(topLeftX: Float64, topLeftY: Float64, width: Float64, height: Float64) {
        this.topLeftX = topLeftX
        this.topLeftY = topLeftY
        this.width = width
        this.height = height
    }
}

/**
 * Metadata object basis.
 *
 * @typedef MetadataObject
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class MetadataObject {
    /**
     * Metadata object type.
     *
     * @type { MetadataObjectType }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let `type`: MetadataObjectType
    /**
     * Metadata object timestamp in milliseconds.
     *
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let timestamp: Int32
    /**
     * The axis-aligned bounding box of detected metadata object.
     *
     * @type { Rect }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let boundingBox: Rect

    init(`type`: MetadataObjectType, timestamp: Int32, boundingBox: Rect) {
        this.`type` = `type`
        this.timestamp = timestamp
        this.boundingBox = boundingBox
    }
}

/**
 * Enum for torch mode.
 *
 * @enum { TorchMode }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum TorchMode {
    /**
     * The device torch is always off.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    OFF
    |
        /**
         * The device torch is always on.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    ON
    |
        /**
         * The device continuously monitors light levels and uses the torch when necessary.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    AUTO
    | ...

    static func parse(val: Int32) {
        match (val) {
            case 0 => OFF
            case 1 => ON
            case 2 => AUTO
            case _ => throw IllegalArgumentException("Unkown value.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case OFF => 0
            case ON => 1
            case AUTO => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the image rotation angles.
 *
 * @enum { ImageRotation }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum ImageRotation {
    /**
     * The capture image rotates 0 degrees.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    ROTATION_0
    |
        /**
         * The capture image rotates 90 degrees.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    ROTATION_90
    |
        /**
         * The capture image rotates 180 degrees.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    ROTATION_180
    |
        /**
         * The capture image rotates 270 degrees.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    ROTATION_270
    | ...

    func getValue(): Int32 {
        match (this) {
            case ROTATION_0 => 0
            case ROTATION_90 => 90
            case ROTATION_180 => 180
            case ROTATION_270 => 270
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => ROTATION_0
            case 90 => ROTATION_90
            case 180 => ROTATION_180
            case 270 => ROTATION_270
            case _ => throw IllegalArgumentException("Unkown value.")
        }
    }
}

/**
 * Enum for camera status.
 *
 * @enum { CameraStatus }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraStatus {
    /**
     * Appear status.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_STATUS_APPEAR
    |
        /**
         * Disappear status.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_STATUS_DISAPPEAR
    |
        /**
         * Available status.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_STATUS_AVAILABLE
    |
        /**
         * Unavailable status.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_STATUS_UNAVAILABL
    | ...

    static func parse(val: Int32) {
        match (val) {
            case 0 => CAMERA_STATUS_APPEAR
            case 1 => CAMERA_STATUS_DISAPPEAR
            case 2 => CAMERA_STATUS_AVAILABLE
            case 3 => CAMERA_STATUS_UNAVAILABL
            case _ => throw IllegalArgumentException("Unkown value.")
        }
    }
}

/**
 * Torch status info.
 *
 * @typedef TorchStatusInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class TorchStatusInfo {
    /**
     * is torch available
     *
     * @type { Bool }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let isTorchAvailable: Bool
    /**
     * is torch active
     *
     * @type { Bool }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let isTorchActive: Bool
    /**
     * the current torch brightness level.
     *
     * @type { Float32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let torchLevel: Float32

    init(isTorchAvailable: Bool, isTorchActive: Bool, torchLevel: Float32) {
        this.isTorchAvailable = isTorchAvailable
        this.isTorchActive = isTorchActive
        this.torchLevel = torchLevel
    }
}

/**
 * Frame rate range.
 *
 * @typedef FrameRateRange
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class FrameRateRange {
    /**
     * Min frame rate.
     *
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let min: Int32
    /**
     * Max frame rate.
     *
     * @type { Int32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let max: Int32

    init(min_frame: Int32, max_frame: Int32) {
        min = min_frame
        max = max_frame
    }
}

/**
 * Size parameter.
 *
 * @typedef Size
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class Size {
    /**
     * Height.
     *
     * @type { UInt32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var width: UInt32
    /**
     * Width.
     *
     * @type { UInt32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var height: UInt32

    init(width: UInt32, height: UInt32) {
        this.width = width
        this.height = height
    }
}

/**
 * Profile for camera streams.
 *
 * @typedef Profile
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public open class Profile {
    /**
     * Camera format.
     *
     * @type { CameraFormat }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let format: CameraFormat
    /**
     * Picture size.
     *
     * @type { Size }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let size: Size

    init(cameraFormat: Int32, width: UInt32, height: UInt32) {
        format = CameraFormat.parse(cameraFormat)
        size = Size(width, height)
    }
}

/**
 * Video profile.
 *
 * @typedef VideoProfile
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class VideoProfile <: Profile {
    /**
     * Frame rate in unit fps (frames per second).
     *
     * @type { FrameRateRange }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let frameRateRange: FrameRateRange

    init(cameraFormat: Int32, width: UInt32, height: UInt32, min_frame: Int32, max_frame: Int32) {
        super(cameraFormat, width, height)
        frameRateRange = FrameRateRange(min_frame, max_frame)
    }
}

/**
 * Metadata object type.
 *
 * @enum { MetadataObjectType }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum MetadataObjectType {
    /**
     * Face detection type.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FACE_DETECTION | ...

    func getValue(): Int32 {
        match (this) {
            case MetadataObjectType.FACE_DETECTION => 0
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): MetadataObjectType {
        match (val) {
            case 0 => MetadataObjectType.FACE_DETECTION
            case _ => throw IllegalArgumentException("Unknown MetadataObjectType value ${val}")
        }
    }
}

/**
 * Camera output capability.
 *
 * @typedef CameraOutputCapability
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CameraOutputCapability {
    /**
     * Preview profiles.
     *
     * @type { Array<Profile> }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let previewProfiles: Array<Profile>
    /**
     * Photo profiles.
     *
     * @type { Array<Profile> }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let photoProfiles: Array<Profile>
    /**
     * Video profiles.
     *
     * @type { Array<VideoProfile> }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let videoProfiles: Array<VideoProfile>
    /**
     * All the supported metadata Object Types.
     *
     * @type { Array<MetadataObjectType> }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let supportedMetadataObjectTypes: Array<MetadataObjectType>

    init(previewProfiles: Array<Profile>, photoProfiles: Array<Profile>, videoProfiles: Array<VideoProfile>,
        supportedMetadataObjectTypes: Array<MetadataObjectType>) {
        this.previewProfiles = previewProfiles
        this.photoProfiles = photoProfiles
        this.videoProfiles = videoProfiles
        this.supportedMetadataObjectTypes = supportedMetadataObjectTypes
    }
}

/**
 * Enum for fold status.
 *
 * @enum { FoldStatus }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum FoldStatus {
    /**
     * Non-foldable status.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    NON_FOLDABLE
    |
        /**
         * Expanded status.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    EXPANDED
    |
        /**
         * Folded status.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FOLDED
    | ...

    static func parse(val: Int32): FoldStatus {
        match (val) {
            case 0 => NON_FOLDABLE
            case 1 => EXPANDED
            case 2 => FOLDED
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

/**
 * Fold status info.
 *
 * @typedef FoldStatusInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class FoldStatusInfo {
    /**
     * Gets supported camera devices under the current fold status.
     *
     * @type { Array<CameraDevice> }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let supportedCameras: Array<CameraDevice>
    /**
     * Current fold status.
     *
     * @type { FoldStatus }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let foldStatus: FoldStatus

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(supportedCameras: Array<CameraDevice>, foldStatus: FoldStatus) {
        this.supportedCameras = supportedCameras
        this.foldStatus = foldStatus
    }
}

/**
 * Enum for camera connection type.
 *
 * @enum { ConnectionType }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum ConnectionType {
    /**
     * Built-in camera.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_CONNECTION_BUILT_IN
    |
        /**
         * Camera connected using USB
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_CONNECTION_USB_PLUGIN
    |
        /**
         * Remote camera
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_CONNECTION_REMOTE
    | ...

    static func parse(val: Int32): ConnectionType {
        match (val) {
            case 0 => CAMERA_CONNECTION_BUILT_IN
            case 1 => CAMERA_CONNECTION_USB_PLUGIN
            case 2 => CAMERA_CONNECTION_REMOTE
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case CAMERA_CONNECTION_BUILT_IN => 0
            case CAMERA_CONNECTION_USB_PLUGIN => 1
            case CAMERA_CONNECTION_REMOTE => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for camera format type.
 *
 * @enum { CameraFormat }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraFormat {
    /**
     * YCRCB P010 Format.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_YCRCB_P010
    |
        /**
         * YCBCR P010 Format.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_YCBCR_P010
    |
        /**
         * HEIC Format.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_HEIC
    |
        /**
         * JPEG Format.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_JPEG
    |
        /**
         * YUV 420 Format.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_YUV_420_SP
    |
        /**
         * RGBA 8888 Format.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_FORMAT_RGBA_8888
    | ...

    func getValue(): Int32 {
        match (this) {
            case CAMERA_FORMAT_YCRCB_P010 => 2002
            case CAMERA_FORMAT_YCBCR_P010 => 2001
            case CAMERA_FORMAT_HEIC => 2003
            case CAMERA_FORMAT_JPEG => 2000
            case CAMERA_FORMAT_YUV_420_SP => 1003
            case CAMERA_FORMAT_RGBA_8888 => 3
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(val: Int32): CameraFormat {
        match (val) {
            case 2002 => CAMERA_FORMAT_YCRCB_P010
            case 2001 => CAMERA_FORMAT_YCBCR_P010
            case 2003 => CAMERA_FORMAT_HEIC
            case 2000 => CAMERA_FORMAT_JPEG
            case 1003 => CAMERA_FORMAT_YUV_420_SP
            case 3 => CAMERA_FORMAT_RGBA_8888
            case _ => throw IllegalArgumentException("Unknown value ${val}")
        }
    }
}

/**
 * Camera device object.
 *
 * @typedef CameraDevice
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CameraDevice {
    /**
     * Camera id attribute.
     *
     * @type { String }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let cameraId: String
    /**
     * Camera position attribute.
     *
     * @type { CameraPosition }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let cameraPosition: CameraPosition
    /**
     * Camera type attribute.
     *
     * @type { CameraType }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let cameraType: CameraType
    /**
     * Camera connection type attribute.
     *
     * @type { ConnectionType }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let connectionType: ConnectionType
    /**
     * Camera sensor orientation attribute.
     *
     * @type { UInt32 }
     * @readonly
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public let cameraOrientation: UInt32

    init(cameraId: String, cameraPosition: CameraPosition, cameraType: CameraType, connectionType: ConnectionType,
        cameraOrientation: UInt32) {
        this.cameraId = cameraId
        this.cameraPosition = cameraPosition
        this.cameraType = cameraType
        this.connectionType = connectionType
        this.cameraOrientation = cameraOrientation
    }
}

/**
 * Camera status info.
 *
 * @typedef CameraStatusInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CameraStatusInfo {
    /**
     * Camera instance.
     *
     * @type { CameraDevice }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var camera: CameraDevice
    /**
     * Current camera status.
     *
     * @type { CameraStatus }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var status: CameraStatus

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(camera: CameraDevice, status: CameraStatus) {
        this.camera = camera
        this.status = status
    }
}

@Derive[Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraCallbackType <: ToString {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CameraError
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CameraStatus
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FoldStatusChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    TorchStatusChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FrameStart
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FrameEnd
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CaptureStartWithInfo
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FrameShutter
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CaptureEnd
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FrameShutterEnd
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CaptureReady
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    EstimatedCaptureDuration
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    MetadataObjectsAvailable
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    FocusStateChange
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SmoothZoomInfoAvailable
    | ...

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public func toString(): String {
        return match (this) {
            case CameraError => "error"
            case CameraStatus => "cameraStatus"
            case FoldStatusChange => "foldStatusChange"
            case TorchStatusChange => "torchStatusChange"
            case FrameStart => "frameStart"
            case FrameEnd => "frameEnd"
            case CaptureStartWithInfo => "captureStartWithInfo"
            case FrameShutter => "frameShutter"
            case CaptureEnd => "captureEnd"
            case FrameShutterEnd => "frameShutterEnd"
            case CaptureReady => "captureReady"
            case EstimatedCaptureDuration => "estimatedCaptureDuration"
            case MetadataObjectsAvailable => "metadataObjectsAvailable"
            case FocusStateChange => "focusStateChange"
            case SmoothZoomInfoAvailable => "smoothZoomInfoAvailable"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for camera position.
 *
 * @enum { CameraPosition }
 * @syscap SystemCapability.Multimedia.Camera.Core
 * @atomicservice
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraPosition {
    /**
     * Unspecified position.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     * @atomicservice
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_POSITION_UNSPECIFIED
    |
        /**
         * Back position.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_POSITION_BACK
    |
        /**
         * Front position.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         * @atomicservice
         */
        @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_POSITION_FRONT
    | ...

    static func parse(code: Int32): CameraPosition {
        match (code) {
            case 0 => CAMERA_POSITION_UNSPECIFIED
            case 1 => CAMERA_POSITION_BACK
            case 2 => CAMERA_POSITION_FRONT
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case CAMERA_POSITION_UNSPECIFIED => 0
            case CAMERA_POSITION_BACK => 1
            case CAMERA_POSITION_FRONT => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enum for camera type.
 *
 * @enum { CameraType }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum CameraType {
    /**
     * Default camera type
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_TYPE_DEFAULT
    |
        /**
         * Wide camera
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_TYPE_WIDE_ANGLE
    |
        /**
         * Ultra wide camera
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_TYPE_ULTRA_WIDE
    |
        /**
         * Telephoto camera
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_TYPE_TELEPHOTO
    |
        /**
         * True depth camera
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    CAMERA_TYPE_TRUE_DEPTH
    | ...

    static func parse(code: Int32): CameraType {
        match (code) {
            case 0 => CAMERA_TYPE_DEFAULT
            case 1 => CAMERA_TYPE_WIDE_ANGLE
            case 2 => CAMERA_TYPE_ULTRA_WIDE
            case 3 => CAMERA_TYPE_TELEPHOTO
            case 4 => CAMERA_TYPE_TRUE_DEPTH
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case CAMERA_TYPE_DEFAULT => 0
            case CAMERA_TYPE_WIDE_ANGLE => 1
            case CAMERA_TYPE_ULTRA_WIDE => 2
            case CAMERA_TYPE_TELEPHOTO => 3
            case CAMERA_TYPE_TRUE_DEPTH => 4
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the camera scene modes.
 *
 * @enum { SceneMode }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum SceneMode {
    /**
     * Normal photo mode.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    NORMAL_PHOTO
    |
        /**
         * Normal video mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    NORMAL_VIDEO
    |
        /**
         * Secure camera mode.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    SECURE_PHOTO
    | ...

    static func parse(code: Int32): SceneMode {
        match (code) {
            case 1 => NORMAL_PHOTO
            case 2 => NORMAL_VIDEO
            case 12 => SECURE_PHOTO
            case _ => throw IllegalArgumentException("Unknown value.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case NORMAL_PHOTO => 1
            case NORMAL_VIDEO => 2
            case SECURE_PHOTO => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates the image quality levels.
 *
 * @enum { QualityLevel }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum QualityLevel {
    /**
     * High image quality.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    QUALITY_LEVEL_HIGH
    |
        /**
         * Medium image quality.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    QUALITY_LEVEL_MEDIUM
    |
        /**
         * Low image quality.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    QUALITY_LEVEL_LOW
    | ...

    func getValue(): Int32 {
        match (this) {
            case QUALITY_LEVEL_HIGH => 0
            case QUALITY_LEVEL_MEDIUM => 1
            case QUALITY_LEVEL_LOW => 2
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Photo capture location
 *
 * @typedef Location
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class Location {
    /**
     * Latitude.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var latitude: Float64
    /**
     * Longitude.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var longtitude: Float64
    /**
     * Altitude.
     *
     * @type { Float64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var altitude: Float64

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(latitude: Float64, longtitude: Float64, altitude: Float64) {
        this.latitude = latitude
        this.longtitude = longtitude
        this.altitude = altitude
    }

    func toExternal(): CLocation {
        return CLocation(latitude, longtitude, altitude)
    }
}

/**
 * Photo capture options to set.
 *
 * @typedef PhotoCaptureSetting
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class PhotoCaptureSetting {
    /**
     * Photo image quality.
     *
     * @type { QualityLevel }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var quality: QualityLevel
    /**
     * Photo rotation.
     *
     * @type { ImageRotation }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var rotation: ImageRotation
    /**
     * Photo location.
     *
     * @type { Location }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var location: Location
    /**
     * Set the mirror photo function switch, default to false.
     *
     * @type { Bool }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var mirror: Bool

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public init(
        quality!: QualityLevel = QualityLevel.QUALITY_LEVEL_MEDIUM,
        rotation!: ImageRotation = ImageRotation.ROTATION_0,
        location!: Location = Location(-1.0, -1.0, -1.0),
        mirror!: Bool = false
    ) {
        this.quality = quality
        this.rotation = rotation
        this.location = location
        this.mirror = mirror
    }
}

/**
 * Enumerates the camera video codec type.
 *
 * @enum { VideoCodecType }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum VideoCodecType {
    /**
     * Codec type AVC.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    AVC
    |
        /**
         * Codec type HEVC.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    HEVC
    | ...

    func getValue(): Int32 {
        match (this) {
            case AVC => 0
            case HEVC => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Capture start info.
 *
 * @typedef CaptureStartInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CaptureStartInfo {
    /**
     * Capture id.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var captureId: Int32
    /**
     * Time(in milliseconds) is the shutter time for the photo.
     *
     * @type { UInt32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var time: UInt32

    init(captureId: Int32, time: UInt32) {
        this.captureId = captureId
        this.time = time
    }
}

/**
 * Frame shutter callback info.
 *
 * @typedef FrameShutterInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class FrameShutterInfo {
    /**
     * Capture id.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var captureId: Int32
    /**
     * Timestamp for frame.
     *
     * @type { UInt64 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var timestamp: UInt64

    init(captureId: Int32, timestamp: UInt64) {
        this.captureId = captureId
        this.timestamp = timestamp
    }
}

/**
 * Capture end info.
 *
 * @typedef CaptureEndInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class CaptureEndInfo {
    /**
     * Capture id.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var captureId: Int32
    /**
     * Frame count.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var frameCount: Int32

    init(captureId: Int32, frameCount: Int32) {
        this.captureId = captureId
        this.frameCount = frameCount
    }
}

/**
 * Frame shutter end callback info.
 *
 * @typedef FrameShutterEndInfo
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public class FrameShutterEndInfo {
    /**
     * Capture id.
     *
     * @type { Int32 }
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    public var captureId: Int32

    init(captureId: Int32) {
        this.captureId = captureId
    }
}

/**
 * Types of preconfig, which used to configure session conveniently.
 * Preconfig type contains common use cases of camera output.
 *
 * @enum { Int32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum PreconfigType {
    /**
     * 720P output for preconfig.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_720P
    |
        /**
         * 1080P output for preconfig.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_1080P
    |
        /**
         * 4K output for preconfig.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_4K
    |
        /**
         * high quality output for preconfig.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_HIGH_QUALITY
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PRECONFIG_720P => 0
                case PRECONFIG_1080P => 1
                case PRECONFIG_4K => 2
                case PRECONFIG_HIGH_QUALITY => 3
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): PreconfigType {
        return match (value) {
            case 0 => PRECONFIG_720P
            case 1 => PRECONFIG_1080P
            case 2 => PRECONFIG_4K
            case 3 => PRECONFIG_HIGH_QUALITY
            case _ => throw IllegalArgumentException("Invalid PreconfigType ${value}")
        }
    }
}

/**
 * The aspect ratios of preconfig, which used to configure session conveniently.
 *
 * @enum { Float32 }
 * @syscap SystemCapability.Multimedia.Camera.Core
 */
@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Camera.Core"
]
public enum PreconfigRatio {
    /**
     * Aspect ratio 1:1 for preconfig.
     *
     * @syscap SystemCapability.Multimedia.Camera.Core
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_RATIO_1_1
    |
        /**
         * Aspect ratio 4:3 for preconfig.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_RATIO_4_3
    |
        /**
         * Aspect ratio 16:9 for preconfig.
         *
         * @syscap SystemCapability.Multimedia.Camera.Core
         */
        @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Camera.Core"
    ]
    PRECONFIG_RATIO_16_9
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case PRECONFIG_RATIO_1_1 => 0
                case PRECONFIG_RATIO_4_3 => 1
                case PRECONFIG_RATIO_16_9 => 2
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): PreconfigRatio {
        return match (value) {
            case 0 => PRECONFIG_RATIO_1_1
            case 1 => PRECONFIG_RATIO_4_3
            case 2 => PRECONFIG_RATIO_16_9
            case _ => throw IllegalArgumentException("Invalid PreconfigRatio ${value}")
        }
    }
}

func offAll(idClassInfo: IdClassInfo, callbackList: ArrayList<(CallbackObject, Int64)>, onOffMutex: Mutex,
    offAllFunc: CFunc<(Int64) -> Int32>): Unit {
    synchronized(onOffMutex) {
        if (callbackList.size == 0) {
            CAMERA_LOG.error("${idClassInfo.className} off failed: The event is not registered")
            return
        }
        unsafe {
            let errCode = offAllFunc(idClassInfo.id)
            if (errCode != SUCCESS_CODE) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            } else {
                callbackList.clear()
            }
        }
    }
}

func off(idClassInfo: IdClassInfo, callbackList: ArrayList<(CallbackObject, Int64)>, onOffMutex: Mutex,
    callback: CallbackObject, offFunc: CFunc<(Int64, Int64) -> Int32>): Unit {
    synchronized(onOffMutex) {
        if (callbackList.size == 0) {
            CAMERA_LOG.error("${idClassInfo.className} Off failed: The event is not registered")
            return
        }
        unsafe {
            callbackList.removeIf(
                {
                    item => if (refEq(item[0], callback)) {
                        let errCode = offFunc(idClassInfo.id, item[1])
                        successOrThrow(errCode)
                        true
                    } else {
                        CAMERA_LOG.error("${idClassInfo.className} Off failed: The callback is not registered")
                        false
                    }
                })
        }
    }
}

struct IdClassInfo {
    let id: Int64
    let className: String

    init(id: Int64, className: String) {
        this.id = id
        this.className = className
    }
}
