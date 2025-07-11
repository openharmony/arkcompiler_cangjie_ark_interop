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

package ohos.image

import std.deriving.*
import ohos.labels.*
import ohos.color_manager.*
import ohos.ffi.*
import ohos.base.*

/**
 * Enumerates pixel map formats.
 *
 * @relation enum PixelMapFormat
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PixelMapFormat {
    /**
     * Indicates an unknown format.
     *
     * @relation UNKNOWN = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UNKNOWN
    |
    /**
     * Indicates that each pixel is stored on 16 bits. Only the R, G, and B components are encoded
     * from the higher-order to the lower-order bits: red is stored with 5 bits of precision,
     * green is stored with 6 bits of precision, and blue is stored with 5 bits of precision.
     *
     * @relation RGB_565 = 2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGB_565
    |
    /**
     * Indicates that each pixel is stored on 32 bits. Each pixel contains 4 components：B(8bits), G(8bits), R(8bits), A(8bits)
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation RGBA_8888 = 3,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_8888
    |
    /**
     * Indicates that each pixel is stored on 32 bits. Each pixel contains 4 components：B(8bits), G(8bits), R(8bits), A(8bits)
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation BGRA_8888 = 4,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BGRA_8888
    |
    /**
     * Indicates that each pixel is stored on 24 bits. Each pixel contains 3 components：R(8bits), G(8bits), B(8bits)
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation RGB_888 = 5,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGB_888
    |
    /**
     * Indicates that each pixel is stored on 8 bits. Each pixel contains 1 component：ALPHA(8bits)
     * and is stored from the higher-order to the lower-order bits.
     *
     * @relation ALPHA_8 = 6,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ALPHA_8
    |
    /**
     * Indicates that each pixel is stored on 32 bits. Each pixel contains 4 components：B(8bits), G(8bits), R(8bits), A(8bits)
     * and are stored from the higher-order to the lower-order bits in F16.
     *
     * @relation RGBA_F16 = 7,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_F16
    |
    /**
     * Indicates that the storage order is to store Y first and then V U alternately each occupies 8 bits
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation NV21 = 8,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NV21
    |
    /**
     * Indicates that the storage order is to store Y first and then U V alternately each occupies 8 bits
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation NV12 = 9,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NV12
    |
    /**
     * Indicates that each pixel is stored on 32 bits. Each pixel contains 4 components：
     * R(10bits), G(10bits), B(10bits), A(2bits) and are stored from the higher-order to the lower-order bits.
     *
     * @relation RGBA_1010102 = 10,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_1010102
    |
    /**
     * Indicates that the storage order is to store Y first and then U V alternately each occupies 10 bits
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation YCBCR_P010 = 11,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_P010
    |
    /**
     * Indicates that the storage order is to store Y first and then V U alternately each occupies 10 bits
     * and are stored from the higher-order to the lower-order bits.
     *
     * @relation YCRCB_P010 = 12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCRCB_P010
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN => 0
            case RGB_565 => 2
            case RGBA_8888 => 3
            case BGRA_8888 => 4
            case RGB_888 => 5
            case ALPHA_8 => 6
            case RGBA_F16 => 7
            case NV21 => 8
            case NV12 => 9
            case RGBA_1010102 => 10
            case YCBCR_P010 => 11
            case YCRCB_P010 => 12
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => UNKNOWN
            case 2 => RGB_565
            case 3 => RGBA_8888
            case 4 => BGRA_8888
            case 5 => RGB_888
            case 6 => ALPHA_8
            case 7 => RGBA_F16
            case 8 => NV21
            case 9 => NV12
            case 10 => RGBA_1010102
            case 11 => YCBCR_P010
            case 12 => YCRCB_P010
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates alpha types.
 *
 * @relation enum AlphaType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum AlphaType {
    /**
     * Indicates an unknown alpha type.
     *
     * @relation UNKNOWN = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UNKNOWN
    |
    /**
     * Indicates that the image has no alpha channel, or all pixels in the image are fully opaque.
     *
     * @relation OPAQUE = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OPAQUE
    |
    /**
     * Indicates that RGB components of each pixel in the image are premultiplied by alpha.
     *
     * @relation PREMUL = 2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PREMUL
    |
    /**
     * Indicates that RGB components of each pixel in the image are independent of alpha and are not premultiplied by alpha.
     *
     * @relation UNPREMUL = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UNPREMUL
    | ...

    func getValue(): Int32 {
        match (this) {
            case UNKNOWN => 0
            case OPAQUE => 1
            case PREMUL => 2
            case UNPREMUL => 3
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 0 => UNKNOWN
            case 1 => OPAQUE
            case 2 => PREMUL
            case 3 => UNPREMUL
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enum for image scale mode.
 *
 * @relation enum ScaleMode
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ScaleMode {
    /**
     * Indicates the effect that fits the image into the target size.
     *
     * @relation FIT_TARGET_SIZE = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FIT_TARGET_SIZE
    |
    /**
     * Indicates the effect that scales an image to fill the target image area and center-crops the part outside the area.
     *
     * @relation CENTER_CROP = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CENTER_CROP
    | ...

    func getValue(): Int32 {
        match (this) {
            case FIT_TARGET_SIZE => 0
            case CENTER_CROP => 1
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enum for image formats.
 *
 * @relation enum ImageFormat
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ImageFormat {
    /**
     * YCBCR422 semi-planar format.
     *
     * @relation YCBCR_422_SP = 1000,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_422_SP
    |
    /**
     * JPEG encoding format.
     *
     * @relation JPEG = 2000
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    JPEG
    | ...

    func getValue(): Int32 {
        match (this) {
            case YCBCR_422_SP => 1000
            case JPEG => 2000
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 1000 => YCBCR_422_SP
            case 2000 => JPEG
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * The component type of image.
 *
 * @relation enum ComponentType
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ComponentType {
    /**
     * Luma info.
     *
     * @relation YUV_Y = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_Y
    |
    /**
     * Chrominance info.
     *
     * @relation YUV_U = 2,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_U
    |
    /**
     * Chroma info.
     *
     * @relation YUV_V = 3,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_V
    |
    /**
     * Jpeg type.
     *
     * @relation JPEG = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    JPEG
    | ...

    func getValue(): Int32 {
        match (this) {
            case YUV_Y => 1
            case YUV_U => 2
            case YUV_V => 3
            case JPEG => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }

    static func parse(val: Int32) {
        match (val) {
            case 1 => YUV_Y
            case 2 => YUV_U
            case 3 => YUV_V
            case 4 => JPEG
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

/**
 * Enumerates exchangeable image file format (Exif) information types of an image.
 *
 * @relation enum PropertyKey
 */
@Derive[Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PropertyKey <: ToString {
    /**
     * Image width.
     *
     * @relation IMAGE_WIDTH = 'ImageWidth',
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ImageWidth
    |
    /**
     * Image length.
     *
     * @relation IMAGE_LENGTH = 'ImageLength',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ImageLength
    |
    /**
     * Number of bits in each pixel of an image.
     *
     * @relation BITS_PER_SAMPLE = 'BitsPerSample',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BitsPerSample
    |
    /**
     * Image description.
     *
     * @relation IMAGE_DESCRIPTION = 'ImageDescription',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ImageDescription
    |
    /**
     * Make.
     *
     * @relation MAKE = 'Make',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    Make
    |
    /**
     * Model.
     *
     * @relation MODEL = 'Model',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    Model
    |
    /**
     * Image rotation mode.
     *
     * @relation ORIENTATION = 'Orientation',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    Orientation
    |
    /**
     * Date time.
     *
     * @relation DATE_TIME = 'DateTime',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DateTime
    |
    /**
     * Photo mode.
     *
     * @relation PHOTO_MODE = 'PhotoMode',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PhotoMode
    |
    /**
     * Exposure time.
     *
     * @relation EXPOSURE_TIME = 'ExposureTime',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ExposureTime
    |
    /**
     * Aperture value.
     *
     * @relation F_NUMBER = 'FNumber',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FNumber
    |
    /**
     * GPS latitude reference. For example, N indicates north latitude and S indicates south latitude.
     *
     * @relation GPS_LATITUDE_REF = 'GPSLatitudeRef',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSLatitudeRef
    |
    /**
     * GPS latitude.
     *
     * @relation GPS_LATITUDE = 'GPSLatitude',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSLatitude
    |
    /**
     * GPS longitude reference. For example, E indicates east longitude and W indicates west longitude.
     *
     * @relation GPS_LONGITUDE_REF = 'GPSLongitudeRef',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSLongitudeRef
    |
    /**
     * GPS longitude.
     *
     * @relation GPS_LONGITUDE = 'GPSLongitude',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSLongitude
    |
    /**
     * GPS time stamp.
     *
     * @relation GPS_TIME_STAMP = 'GPSTimeStamp',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSTimeStamp
    |
    /**
     * GPS date stamp.
     *
     * @relation GPS_DATE_STAMP = 'GPSDateStamp',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPSDateStamp
    |
    /**
     * ISO speedratings.
     *
     * @relation ISO_SPEED_RATINGS = 'ISOSpeedRatings',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISOSpeedRatings
    |
    /**
     * Sensitivity type.
     *
     * @relation SENSITIVITY_TYPE = 'SensitivityType',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SensitivityType
    |
    /**
     * Standard output sensitivity.
     *
     * @relation STANDARD_OUTPUT_SENSITIVITY = 'StandardOutputSensitivity',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    StandardOutputSensitivity
    |
    /**
     * Recommended exposure index.
     *
     * @relation RECOMMENDED_EXPOSURE_INDEX = 'RecommendedExposureIndex',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RecommendedExposureIndex
    |
    /**
     * ISO speed.
     *
     * @relation ISO_SPEED = 'ISOSpeedRatings',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISOSpeed
    |
    /**
     * Shooting time.
     *
     * @relation DATE_TIME_ORIGINAL = 'DateTimeOriginal',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DateTimeOriginal
    |
    /**
     * Aperture value.
     *
     * @relation APERTURE_VALUE = 'ApertureValue',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ApertureValue
    |
    /**
     * Exposure bias value.
     *
     * @relation EXPOSURE_BIAS_VALUE = 'ExposureBiasValue',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ExposureBiasValue
    |
    /**
     * Metering mode.
     *
     * @relation METERING_MODE = 'MeteringMode',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MeteringMode
    |
    /**
     * Light source.
     *
     * @relation LIGHT_SOURCE = 'LightSource',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LightSource
    |
    /**
     * Flash.
     *
     * @relation FLASH = 'Flash',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    Flash
    |
    /**
     * Focal length.
     *
     * @relation FOCAL_LENGTH = 'FocalLength',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FocalLength
    |
    /**
     * Capture Scene: Food.
     *
     * @relation SCENE_FOOD_CONF = 'HwMnoteSceneFoodConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneFoodConf
    |
    /**
     * Capture Scene: Stage.
     *
     * @relation SCENE_STAGE_CONF = 'HwMnoteSceneStageConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneStageConf
    |
    /**
     * Capture Scene: Blue Sky.
     *
     * @relation SCENE_BLUE_SKY_CONF = 'HwMnoteSceneBlueSkyConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneBlueSkyConf
    |
    /**
     * Capture Scene: Green Plant.
     *
     * @relation SCENE_GREEN_PLANT_CONF = 'HwMnoteSceneGreenPlantConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneGreenPlantConf
    |
    /**
     * Capture Scene: Beach.
     *
     * @relation SCENE_BEACH_CONF = 'HwMnoteSceneBeachConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneBeachConf
    |
    /**
     * Capture Scene: Snow.
     *
     * @relation SCENE_SNOW_CONF = 'HwMnoteSceneSnowConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneSnowConf
    |
    /**
     * Capture Scene: Sunset.
     *
     * @relation SCENE_SUNSET_CONF = 'HwMnoteSceneSunsetConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneSunsetConf
    |
    /**
     * Capture Scene: Flowers.
     *
     * @relation SCENE_FLOWERS_CONF = 'HwMnoteSceneFlowersConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneFlowersConf
    |
    /**
     * Capture Scene: Night.
     *
     * @relation SCENE_NIGHT_CONF = 'HwMnoteSceneNightConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneNightConf
    |
    /**
     * Capture Scene: Text.
     *
     * @relation SCENE_TEXT_CONF = 'HwMnoteSceneTextConf',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneTextConf
    |
    /**
     * Face Count.
     *
     * @relation FACE_COUNT = 'HwMnoteFaceCount',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FaceCount
    |
    /**
     * Capture mode.
     *
     * @relation CAPTURE_MODE = 'HwMnoteCaptureMode',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CaptureMode
    |
    /**
     * Roll Angle.
     *
     * @relation ROLL_ANGLE = 'HwMnoteRollAngle',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RollAngle
    |
    /**
     * Pitch Angle.
     *
     * @relation PITCH_ANGLE = 'HwMnotePitchAngle',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PitchAngle
    |
    /**
     * Physical aperture.
     *
     * @relation PHYSICAL_APERTURE = 'HwMnotePhysicalAperture',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PhysicalAperture
    |
    /**
     * Focus Mode.
     *
     * @relation FOCUS_MODE = 'HwMnoteFocusMode',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FocusMode
    |
    /**
     * User comment.
     *
     * @relation USER_COMMENT = 'UserComment',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UserComment
    |
    /**
     * Pixel x dimension.
     *
     * @relation PIXEL_X_DIMENSION = 'PixelXDimension',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PixelXDimension
    |
    /**
     * Pixel y dimension.
     *
     * @relation PIXEL_Y_DIMENSION = 'PixelYDimension',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PixelYDimension
    |
    /**
     * Scene type.
     *
     * @relation SCENE_TYPE = 'SceneType',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SceneType
    |
    /**
     * White balance.
     *
     * @relation WHITE_BALANCE = 'WhiteBalance',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    WhiteBalance
    |
    /**
     * Focal length in 35mm film.
     *
     * @relation FOCAL_LENGTH_IN_35_MM_FILM = 'FocalLengthIn35mmFilm',
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FocalLengthIn35mmFilm
    | ...


    /**
     * Return a string of enumeration values.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func toString(): String {
        match (this) {
            case ImageWidth => "ImageWidth"
            case ImageLength => "ImageLength"
            case BitsPerSample => "BitsPerSample"
            case ImageDescription => "ImageDescription"
            case Make => "Make"
            case Model => "Model"
            case Orientation => "Orientation"
            case DateTime => "DateTime"
            case PhotoMode => "PhotoMode"
            case ExposureTime => "ExposureTime"
            case FNumber => "FNumber"
            case GPSLatitudeRef => "GPSLatitudeRef"
            case GPSLatitude => "GPSLatitude"
            case GPSLongitudeRef => "GPSLongitudeRef"
            case GPSLongitude => "GPSLongitude"
            case GPSTimeStamp => "GPSTimeStamp"
            case GPSDateStamp => "GPSDateStamp"
            case ISOSpeedRatings => "ISOSpeedRatings"
            case SensitivityType => "SensitivityType"
            case StandardOutputSensitivity => "StandardOutputSensitivity"
            case RecommendedExposureIndex => "RecommendedExposureIndex"
            case ISOSpeed => "ISOSpeedRatings"
            case DateTimeOriginal => "DateTimeOriginal"
            case ApertureValue => "ApertureValue"
            case ExposureBiasValue => "ExposureBiasValue"
            case MeteringMode => "MeteringMode"
            case LightSource => "LightSource"
            case Flash => "Flash"
            case FocalLength => "FocalLength"
            case SceneFoodConf => "HwMnoteSceneFoodConf"
            case SceneStageConf => "HwMnoteSceneStageConf"
            case SceneBlueSkyConf => "HwMnoteSceneBlueSkyConf"
            case SceneGreenPlantConf => "HwMnoteSceneGreenPlantConf"
            case SceneBeachConf => "HwMnoteSceneBeachConf"
            case SceneSnowConf => "HwMnoteSceneSnowConf"
            case SceneSunsetConf => "HwMnoteSceneSunsetConf"
            case SceneFlowersConf => "HwMnoteSceneFlowersConf"
            case SceneNightConf => "HwMnoteSceneNightConf"
            case SceneTextConf => "HwMnoteSceneTextConf"
            case FaceCount => "HwMnoteFaceCount"
            case CaptureMode => "HwMnoteCaptureMode"
            case RollAngle => "HwMnoteRollAngle"
            case PitchAngle => "HwMnotePitchAngle"
            case PhysicalAperture => "HwMnotePhysicalAperture"
            case FocusMode => "HwMnoteFocusMode"
            case UserComment => "UserComment"
            case PixelXDimension => "PixelXDimension"
            case PixelYDimension => "PixelYDimension"
            case SceneType => "SceneType"
            case WhiteBalance => "WhiteBalance"
            case FocalLengthIn35mmFilm => "FocalLengthIn35mmFilm"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}


/**
 * Enumerates decoding dynamic range.
 *
 * @relation enum DecodingDynamicRange
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum DecodingDynamicRange {
    /**
     * Decoding according to the content of the image.
     *
     * @relation AUTO = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    AUTO
    |
    /**
     * Decoding to standard dynamic range.
     *
     * @relation SDR = 1,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SDR
    |
    /**
     * Decoding to high dynamic range.
     *
     * @relation HDR = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HDR
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AUTO => return 0
                case SDR => return 1
                case HDR => return 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}


/**
 * Enumerates packing dynamic range.
 *
 * @relation enum PackingDynamicRange
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PackingDynamicRange {
    /**
     * Packing according to the content of the image.
     *
     * @relation AUTO = 0,
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    AUTO
    |
    /**
     * Packing to standard dynamic range.
     *
     * @relation SDR = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SDR
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case AUTO => return 0
                case SDR => return 1
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}
