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

@Derive[Equatable]
@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum PropertyKey <: ToString {
    @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NEW_SUBFILE_TYPE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBFILE_TYPE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_WIDTH
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_LENGTH
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BITS_PER_SAMPLE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COMPRESSION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHOTOMETRIC_INTERPRETATION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_DESCRIPTION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MAKE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MODEL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    STRIP_OFFSETS
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ORIENTATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SAMPLES_PER_PIXEL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ROWS_PER_STRIP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    STRIP_BYTE_COUNTS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    X_RESOLUTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    Y_RESOLUTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PLANAR_CONFIGURATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RESOLUTION_UNIT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    TRANSFER_FUNCTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SOFTWARE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DATE_TIME
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ARTIST
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    WHITE_POINT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PRIMARY_CHROMATICITIES
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHOTO_MODE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    JPEG_INTERCHANGE_FORMAT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    JPEG_INTERCHANGE_FORMAT_LENGTH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_COEFFICIENTS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_SUB_SAMPLING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    YCBCR_POSITIONING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    REFERENCE_BLACK_WHITE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COPYRIGHT
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_TIME
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    F_NUMBER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_PROGRAM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SPECTRAL_SENSITIVITY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_VERSION_ID
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LATITUDE_REF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LATITUDE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LONGITUDE_REF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_LONGITUDE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_ALTITUDE_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_ALTITUDE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_TIME_STAMP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_SATELLITES
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_STATUS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_MEASURE_MODE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DOP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_SPEED_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_SPEED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_TRACK_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_TRACK
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_IMG_DIRECTION_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_IMG_DIRECTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_MAP_DATUM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_LATITUDE_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_LATITUDE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_LONGITUDE_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_LONGITUDE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_BEARING_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_BEARING
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_DISTANCE_REF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DEST_DISTANCE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_PROCESSING_METHOD
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_AREA_INFORMATION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DATE_STAMP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_DIFFERENTIAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GPS_H_POSITIONING_ERROR
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED_RATINGS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHOTOGRAPHIC_SENSITIVITY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OECF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SENSITIVITY_TYPE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    STANDARD_OUTPUT_SENSITIVITY
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RECOMMENDED_EXPOSURE_INDEX
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED_LATITUDE_YYY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ISO_SPEED_LATITUDE_ZZZ
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXIF_VERSION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DATE_TIME_ORIGINAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DATE_TIME_DIGITIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OFFSET_TIME
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OFFSET_TIME_ORIGINAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    OFFSET_TIME_DIGITIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COMPONENTS_CONFIGURATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COMPRESSED_BITS_PER_PIXEL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SHUTTER_SPEED
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    APERTURE_VALUE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BRIGHTNESS_VALUE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_BIAS_VALUE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MAX_APERTURE_VALUE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBJECT_DISTANCE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    METERING_MODE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LIGHT_SOURCE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FLASH
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_LENGTH
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBJECT_AREA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MAKER_NOTE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_POINTER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_VERSION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_FOOD_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_STAGE_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_BLUE_SKY_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_GREEN_PLANT_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_BEACH_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_SNOW_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_SUNSET_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_FLOWERS_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_NIGHT_CONF
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_TEXT_CONF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_POINTER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_VERSION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_COUNT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_CONF
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_SMILE_SCORE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_RECT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_LEYE_CENTER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_REYE_CENTER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FACE_MOUTH_CENTER
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CAPTURE_MODE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BURST_NUMBER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FRONT_CAMERA
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ROLL_ANGLE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PITCH_ANGLE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PHYSICAL_APERTURE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCUS_MODE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    USER_COMMENT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBSEC_TIME
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBSEC_TIME_ORIGINAL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBSEC_TIME_DIGITIZED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FLASHPIX_VERSION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COLOR_SPACE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PIXEL_X_DIMENSION
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    PIXEL_Y_DIMENSION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    RELATED_SOUND_FILE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FLASH_ENERGY
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SPATIAL_FREQUENCY_RESPONSE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_PLANE_X_RESOLUTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_PLANE_Y_RESOLUTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_PLANE_RESOLUTION_UNIT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBJECT_LOCATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_INDEX
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SENSING_METHOD
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FILE_SOURCE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_TYPE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CFA_PATTERN
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CUSTOM_RENDERED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    EXPOSURE_MODE
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    WHITE_BALANCE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DIGITAL_ZOOM_RATIO
    | @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FOCAL_LENGTH_IN_35_MM_FILM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SCENE_CAPTURE_TYPE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GAIN_CONTROL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CONTRAST
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SATURATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SHARPNESS
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DEVICE_SETTING_DESCRIPTION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SUBJECT_DISTANCE_RANGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IMAGE_UNIQUE_ID
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CAMERA_OWNER_NAME
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BODY_SERIAL_NUMBER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LENS_SPECIFICATION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LENS_MAKE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LENS_MODEL
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LENS_SERIAL_NUMBER
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    COMPOSITE_IMAGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GAMMA
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DNG_VERSION
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    DEFAULT_CROP_SIZE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GIF_LOOP_COUNT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    IS_XMAGE_SUPPORTED
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    XMAGE_MODE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    XMAGE_LEFT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    XMAGE_TOP
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    XMAGE_RIGHT
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    XMAGE_BOTTOM
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    CLOUD_ENHANCEMENT_MODE
    | @!APILevel[
        19,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    WIND_SNAPSHOT_MODE
    | ...

    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public func toString(): String {
        match (this) {
            case NEW_SUBFILE_TYPE => "NewSubfileType"
            case SUBFILE_TYPE => "SubfileType"
            case IMAGE_WIDTH => "ImageWidth"
            case IMAGE_LENGTH => "ImageLength"
            case BITS_PER_SAMPLE => "BitsPerSample"
            case COMPRESSION => "Compression"
            case PHOTOMETRIC_INTERPRETATION => "PhotometricInterpretation"
            case IMAGE_DESCRIPTION => "ImageDescription"
            case MAKE => "Make"
            case MODEL => "Model"
            case STRIP_OFFSETS => "StripOffsets"
            case ORIENTATION => "Orientation"
            case SAMPLES_PER_PIXEL => "SamplesPerPixel"
            case ROWS_PER_STRIP => "RowsPerStrip"
            case STRIP_BYTE_COUNTS => "StripByteCounts"
            case X_RESOLUTION => "XResolution"
            case Y_RESOLUTION => "YResolution"
            case PLANAR_CONFIGURATION => "PlanarConfiguration"
            case RESOLUTION_UNIT => "ResolutionUnit"
            case TRANSFER_FUNCTION => "TransferFunction"
            case SOFTWARE => "Software"
            case DATE_TIME => "DateTime"
            case ARTIST => "Artist"
            case WHITE_POINT => "WhitePoint"
            case PRIMARY_CHROMATICITIES => "PrimaryChromaticities"
            case PHOTO_MODE => "PhotoMode"
            case JPEG_INTERCHANGE_FORMAT => "JPEGInterchangeFormat"
            case JPEG_INTERCHANGE_FORMAT_LENGTH => "JPEGInterchangeFormatLength"
            case YCBCR_COEFFICIENTS => "YCbCrCoefficients"
            case YCBCR_SUB_SAMPLING => "YCbCrSubSampling"
            case YCBCR_POSITIONING => "YCbCrPositioning"
            case REFERENCE_BLACK_WHITE => "ReferenceBlackWhite"
            case COPYRIGHT => "Copyright"
            case EXPOSURE_TIME => "ExposureTime"
            case F_NUMBER => "FNumber"
            case EXPOSURE_PROGRAM => "ExposureProgram"
            case SPECTRAL_SENSITIVITY => "SpectralSensitivity"
            case GPS_VERSION_ID => "GPSVersionID"
            case GPS_LATITUDE_REF => "GPSLatitudeRef"
            case GPS_LATITUDE => "GPSLatitude"
            case GPS_LONGITUDE_REF => "GPSLongitudeRef"
            case GPS_LONGITUDE => "GPSLongitude"
            case GPS_ALTITUDE_REF => "GPSAltitudeRef"
            case GPS_ALTITUDE => "GPSAltitude"
            case GPS_TIME_STAMP => "GPSTimeStamp"
            case GPS_SATELLITES => "GPSSatellites"
            case GPS_STATUS => "GPSStatus"
            case GPS_MEASURE_MODE => "GPSMeasureMode"
            case GPS_DOP => "GPSDOP"
            case GPS_SPEED_REF => "GPSSpeedRef"
            case GPS_SPEED => "GPSSpeed"
            case GPS_TRACK_REF => "GPSTrackRef"
            case GPS_TRACK => "GPSTrack"
            case GPS_IMG_DIRECTION_REF => "GPSImgDirectionRef"
            case GPS_IMG_DIRECTION => "GPSImgDirection"
            case GPS_MAP_DATUM => "GPSMapDatum"
            case GPS_DEST_LATITUDE_REF => "GPSDestLatitudeRef"
            case GPS_DEST_LATITUDE => "GPSDestLatitude"
            case GPS_DEST_LONGITUDE_REF => "GPSDestLongitudeRef"
            case GPS_DEST_LONGITUDE => "GPSDestLongitude"
            case GPS_DEST_BEARING_REF => "GPSDestBearingRef"
            case GPS_DEST_BEARING => "GPSDestBearing"
            case GPS_DEST_DISTANCE_REF => "GPSDestDistanceRef"
            case GPS_DEST_DISTANCE => "GPSDestDistance"
            case GPS_PROCESSING_METHOD => "GPSProcessingMethod"
            case GPS_AREA_INFORMATION => "GPSAreaInformation"
            case GPS_DATE_STAMP => "GPSDateStamp"
            case GPS_DIFFERENTIAL => "GPSDifferential"
            case GPS_H_POSITIONING_ERROR => "GPSHPositioningError"
            case ISO_SPEED_RATINGS => "ISOSpeedRatings"
            case PHOTOGRAPHIC_SENSITIVITY => "PhotographicSensitivity"
            case OECF => "OECF"
            case SENSITIVITY_TYPE => "SensitivityType"
            case STANDARD_OUTPUT_SENSITIVITY => "StandardOutputSensitivity"
            case RECOMMENDED_EXPOSURE_INDEX => "RecommendedExposureIndex"
            case ISO_SPEED => "ISOSpeedRatings"
            case ISO_SPEED_LATITUDE_YYY => "ISOSpeedLatitudeyyy"
            case ISO_SPEED_LATITUDE_ZZZ => "ISOSpeedLatitudezzz"
            case EXIF_VERSION => "ExifVersion"
            case DATE_TIME_ORIGINAL => "DateTimeOriginal"
            case DATE_TIME_DIGITIZED => "DateTimeDigitized"
            case OFFSET_TIME => "OffsetTime"
            case OFFSET_TIME_ORIGINAL => "OffsetTimeOriginal"
            case OFFSET_TIME_DIGITIZED => "OffsetTimeDigitized"
            case COMPONENTS_CONFIGURATION => "ComponentsConfiguration"
            case COMPRESSED_BITS_PER_PIXEL => "CompressedBitsPerPixel"
            case SHUTTER_SPEED => "ShutterSpeedValue"
            case APERTURE_VALUE => "ApertureValue"
            case BRIGHTNESS_VALUE => "BrightnessValue"
            case EXPOSURE_BIAS_VALUE => "ExposureBiasValue"
            case MAX_APERTURE_VALUE => "MaxApertureValue"
            case SUBJECT_DISTANCE => "SubjectDistance"
            case METERING_MODE => "MeteringMode"
            case LIGHT_SOURCE => "LightSource"
            case FLASH => "Flash"
            case FOCAL_LENGTH => "FocalLength"
            case SUBJECT_AREA => "SubjectArea"
            case MAKER_NOTE => "MakerNote"
            case SCENE_POINTER => "HwMnoteScenePointer"
            case SCENE_VERSION => "HwMnoteSceneVersion"
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
            case FACE_POINTER => "HwMnoteFacePointer"
            case FACE_VERSION => "HwMnoteFaceVersion"
            case FACE_COUNT => "HwMnoteFaceCount"
            case FACE_CONF => "HwMnoteFaceConf"
            case FACE_SMILE_SCORE => "HwMnoteFaceSmileScore"
            case FACE_RECT => "HwMnoteFaceRect"
            case FACE_LEYE_CENTER => "HwMnoteFaceLeyeCenter"
            case FACE_REYE_CENTER => "HwMnoteFaceReyeCenter"
            case FACE_MOUTH_CENTER => "HwMnoteFaceMouthCenter"
            case CAPTURE_MODE => "HwMnoteCaptureMode"
            case BURST_NUMBER => "HwMnoteBurstNumber"
            case FRONT_CAMERA => "HwMnoteFrontCamera"
            case ROLL_ANGLE => "HwMnoteRollAngle"
            case PITCH_ANGLE => "HwMnotePitchAngle"
            case PHYSICAL_APERTURE => "HwMnotePhysicalAperture"
            case FOCUS_MODE => "HwMnoteFocusMode"
            case USER_COMMENT => "UserComment"
            case SUBSEC_TIME => "SubsecTime"
            case SUBSEC_TIME_ORIGINAL => "SubsecTimeOriginal"
            case SUBSEC_TIME_DIGITIZED => "SubsecTimeDigitized"
            case FLASHPIX_VERSION => "FlashpixVersion"
            case COLOR_SPACE => "ColorSpace"
            case PIXEL_X_DIMENSION => "PixelXDimension"
            case PIXEL_Y_DIMENSION => "PixelYDimension"
            case RELATED_SOUND_FILE => "RelatedSoundFile"
            case FLASH_ENERGY => "FlashEnergy"
            case SPATIAL_FREQUENCY_RESPONSE => "SpatialFrequencyResponse"
            case FOCAL_PLANE_X_RESOLUTION => "FocalPlaneXResolution"
            case FOCAL_PLANE_Y_RESOLUTION => "FocalPlaneYResolution"
            case FOCAL_PLANE_RESOLUTION_UNIT => "FocalPlaneResolutionUnit"
            case SUBJECT_LOCATION => "SubjectLocation"
            case EXPOSURE_INDEX => "ExposureIndex"
            case SENSING_METHOD => "SensingMethod"
            case FILE_SOURCE => "FileSource"
            case SCENE_TYPE => "SceneType"
            case CFA_PATTERN => "CFAPattern"
            case CUSTOM_RENDERED => "CustomRendered"
            case EXPOSURE_MODE => "ExposureMode"
            case WHITE_BALANCE => "WhiteBalance"
            case DIGITAL_ZOOM_RATIO => "DigitalZoomRatio"
            case FOCAL_LENGTH_IN_35_MM_FILM => "FocalLengthIn35mmFilm"
            case SCENE_CAPTURE_TYPE => "SceneCaptureType"
            case GAIN_CONTROL => "GainControl"
            case CONTRAST => "Contrast"
            case SATURATION => "Saturation"
            case SHARPNESS => "Sharpness"
            case DEVICE_SETTING_DESCRIPTION => "DeviceSettingDescription"
            case SUBJECT_DISTANCE_RANGE => "SubjectDistanceRange"
            case IMAGE_UNIQUE_ID => "ImageUniqueID"
            case CAMERA_OWNER_NAME => "CameraOwnerName"
            case BODY_SERIAL_NUMBER => "BodySerialNumber"
            case LENS_SPECIFICATION => "LensSpecification"
            case LENS_MAKE => "LensMake"
            case LENS_MODEL => "LensModel"
            case LENS_SERIAL_NUMBER => "LensSerialNumber"
            case COMPOSITE_IMAGE => "CompositeImage"
            case SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE => "SourceImageNumberOfCompositeImage"
            case SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE => "SourceExposureTimesOfCompositeImage"
            case GAMMA => "Gamma"
            case DNG_VERSION => "DNGVersion"
            case DEFAULT_CROP_SIZE => "DefaultCropSize"
            case GIF_LOOP_COUNT => "GIFLoopCount"
            case IS_XMAGE_SUPPORTED => "HwMnoteIsXmageSupported"
            case XMAGE_MODE => "HwMnoteXmageMode"
            case XMAGE_LEFT => "HwMnoteXmageLeft"
            case XMAGE_TOP => "HwMnoteXmageTop"
            case XMAGE_RIGHT => "HwMnoteXmageRight"
            case XMAGE_BOTTOM => "HwMnoteXmageBottom"
            case CLOUD_ENHANCEMENT_MODE => "HwMnoteCloudEnhancementMode"
            case WIND_SNAPSHOT_MODE => "HwMnoteWindSnapshotMode"
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

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum AntiAliasingLevel {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NONE
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    LOW
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    MEDIUM
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HIGH
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case NONE => return 0
                case LOW => return 1
                case MEDIUM => return 2
                case HIGH => return 3
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
public enum HdrMetadataKey {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HDR_METADATA_TYPE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HDR_STATIC_METADATA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HDR_DYNAMIC_METADATA
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    HDR_GAINMAP_METADATA
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case HDR_METADATA_TYPE => return 0
                case HDR_STATIC_METADATA => return 1
                case HDR_DYNAMIC_METADATA => return 2
                case HDR_GAINMAP_METADATA => return 3
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
public enum HdrMetadataType {
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    NONE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    BASE
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    GAINMAP
    | @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ALTERNATE
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case NONE => return 0
                case BASE => return 1
                case GAINMAP => return 2
                case ALTERNATE => return 3
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

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    public prop value: Int32 {
        get() {
            match (this) {
                case AUTO => return 0
                case SDR => return 1
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}

/**
 * Enumerates metadata type.
 *
 * @relation enum MetadataType
 */
@Derive[ToString, Equatable]
@!APILevel[
    20,
    stagemodelonly: true,
    syscap: "SystemCapability.Multimedia.Image.Core"
]
public enum MetadataType {
    /**
     * EXIF metadata.
     *
     * @relation EXIF_METADATA = 1
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    ExifMetadata
    /**
     * Fragment metadata.
     *
     * @relation FRAGMENT_METADATA = 2
     */
    | @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Multimedia.Image.Core"
    ]
    FragmentMetadata
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case ExifMetadata => 1
                case FragmentMetadata => 2
                case _ => throw IllegalArgumentException("The type is not supported yet.")
            }
        }
    }
}
