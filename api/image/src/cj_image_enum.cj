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

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PixelMapFormat {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGB_565
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_8888
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BGRA_8888
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGB_888
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ALPHA_8
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_F16
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NV21
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NV12
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RGBA_1010102
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_P010
    | @!APILevel[
        19,
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

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum AlphaType {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OPAQUE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PREMUL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

@Derive[ToString, Equatable]
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ScaleMode {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FIT_TARGET_SIZE
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        form: true,
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

@Derive[ToString, Equatable]
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ImageFormat {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_422_SP
    | @!APILevel[
        12,
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

@Derive[ToString, Equatable]
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum ComponentType {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_Y
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_U
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YUV_V
    | @!APILevel[
        12,
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

@Derive[Equatable]
@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PropertyKey <: ToString {
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_WIDTH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_LENGTH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BITS_PER_SAMPLE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_DESCRIPTION
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MAKE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MODEL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ORIENTATION
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DATE_TIME
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHOTO_MODE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_TIME
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    F_NUMBER
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LATITUDE_REF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LATITUDE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LONGITUDE_REF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LONGITUDE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_TIME_STAMP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DATE_STAMP
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED_RATINGS
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SENSITIVITY_TYPE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    STANDARD_OUTPUT_SENSITIVITY
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RECOMMENDED_EXPOSURE_INDEX
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DATE_TIME_ORIGINAL
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    APERTURE_VALUE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_BIAS_VALUE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    METERING_MODE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LIGHT_SOURCE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FLASH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_LENGTH
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_FOOD_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_STAGE_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_BLUE_SKY_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_GREEN_PLANT_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_BEACH_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_SNOW_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_SUNSET_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_FLOWERS_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_NIGHT_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_TEXT_CONF
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_COUNT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CAPTURE_MODE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ROLL_ANGLE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PITCH_ANGLE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHYSICAL_APERTURE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCUS_MODE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    USER_COMMENT
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PIXEL_X_DIMENSION
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PIXEL_Y_DIMENSION
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_TYPE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    WHITE_BALANCE
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_LENGTH_IN_35_MM_FILM
    | ...

    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func toString(): String {
        match (this) {
            case IMAGE_WIDTH => "ImageWidth"
            case IMAGE_LENGTH => "ImageLength"
            case BITS_PER_SAMPLE => "BitsPerSample"
            case IMAGE_DESCRIPTION => "ImageDescription"
            case MAKE => "Make"
            case MODEL => "Model"
            case ORIENTATION => "Orientation"
            case DATE_TIME => "DateTime"
            case PHOTO_MODE => "PhotoMode"
            case EXPOSURE_TIME => "ExposureTime"
            case F_NUMBER => "FNumber"
            case GPS_LATITUDE_REF => "GPSLatitudeRef"
            case GPS_LATITUDE => "GPSLatitude"
            case GPS_LONGITUDE_REF => "GPSLongitudeRef"
            case GPS_LONGITUDE => "GPSLongitude"
            case GPS_TIME_STAMP => "GPSTimeStamp"
            case GPS_DATE_STAMP => "GPSDateStamp"
            case ISO_SPEED_RATINGS => "ISOSpeedRatings"
            case SENSITIVITY_TYPE => "SensitivityType"
            case STANDARD_OUTPUT_SENSITIVITY => "StandardOutputSensitivity"
            case RECOMMENDED_EXPOSURE_INDEX => "RecommendedExposureIndex"
            case ISO_SPEED => "ISOSpeedRatings"
            case DATE_TIME_ORIGINAL => "DateTimeOriginal"
            case APERTURE_VALUE => "ApertureValue"
            case EXPOSURE_BIAS_VALUE => "ExposureBiasValue"
            case METERING_MODE => "MeteringMode"
            case LIGHT_SOURCE => "LightSource"
            case FLASH => "Flash"
            case FOCAL_LENGTH => "FocalLength"
            case SCENE_FOOD_CONF => "HwMnoteSceneFoodConf"
            case SCENE_STAGE_CONF => "HwMnoteSceneStageConf"
            case SCENE_BLUE_SKY_CONF => "HwMnoteSceneBlueSkyConf"
            case SCENE_GREEN_PLANT_CONF => "HwMnoteSceneGreenPlantConf"
            case SCENE_BEACH_CONF => "HwMnoteSceneBeachConf"
            case SCENE_SNOW_CONF => "HwMnoteSceneSnowConf"
            case SCENE_SUNSET_CONF => "HwMnoteSceneSunsetConf"
            case SCENE_FLOWERS_CONF => "HwMnoteSceneFlowersConf"
            case SCENE_NIGHT_CONF => "HwMnoteSceneNightConf"
            case SCENE_TEXT_CONF => "HwMnoteSceneTextConf"
            case FACE_COUNT => "HwMnoteFaceCount"
            case CAPTURE_MODE => "HwMnoteCaptureMode"
            case ROLL_ANGLE => "HwMnoteRollAngle"
            case PITCH_ANGLE => "HwMnotePitchAngle"
            case PHYSICAL_APERTURE => "HwMnotePhysicalAperture"
            case FOCUS_MODE => "HwMnoteFocusMode"
            case USER_COMMENT => "UserComment"
            case PIXEL_X_DIMENSION => "PixelXDimension"
            case PIXEL_Y_DIMENSION => "PixelYDimension"
            case SCENE_TYPE => "SceneType"
            case WHITE_BALANCE => "WhiteBalance"
            case FOCAL_LENGTH_IN_35_MM_FILM => "FocalLengthIn35mmFilm"
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum DecodingDynamicRange {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    AUTO
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SDR
    | @!APILevel[
        19,
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

@Derive[ToString, Equatable]
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PackingDynamicRange {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    AUTO
    | @!APILevel[
        19,
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
