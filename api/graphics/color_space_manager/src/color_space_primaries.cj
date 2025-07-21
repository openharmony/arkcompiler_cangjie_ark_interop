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

package ohos.graphics.color_space_manager

import ohos.labels.*

import std.deriving.Derive

/**
 * Enumerates color space types.
 *
 * @relation enum ColorSpace
 */
@Derive[ToString, Equatable]
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public enum ColorSpace {
    /**
     * Indicates an unknown color space.
     *
     * @relation UNKNOWN = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Unknown
    |
    /**
     * Indicates the color space based on Adobe RGB (1998).
     *
     * @relation ADOBE_RGB_1998 = 1
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    AdobeRGB1998
    |
    /**
     * Indicates the color space based on SMPTE RP 431-2-2007 and IEC 61966-2.1:1999.
     *
     * @relation DCI_P3 = 2
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DCIP3
    |
    /**
     * Indicates the color space based on SMPTE RP 431-2-2007 and IEC 61966-2.1:1999.
     *
     * @relation DISPLAY_P3 = 3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3
    |
    /**
     * Indicates the standard red green blue (SRGB) color space based on IEC 61966-2.1:1999.
     *
     * @relation SRGB = 4
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    SRGB
    |
    /**
     * Indicates a customized color space.
     *
     * @relation CUSTOM = 5
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Custom
    |
    /**
     * Indicates the color space based on ITU-R BT.709.
     *
     * @relation BT709 = 6
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT709
    |
    /**
     * Indicates the color space based on ITU-R BT.601.
     *
     * @relation BT601_EBU = 7
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601EBU
    |
    /**
     * Indicates the color space based on ITU-R BT.601.
     *
     * @relation BT601_SMPTE_C = 8
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601SMPTEC
    |
    /**
     * Indicates the color space based on ITU-R BT.2020.
     *
     * @relation BT2020_HLG = 9
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020HLG
    |
    /**
     * Indicates the color space based on ITU-R BT.2020.
     *
     * @relation BT2020_PQ = 10
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020PQ
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_HLG | RANGE_FULL
     *
     * @relation P3_HLG = 11
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3HLG
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_PQ | RANGE_FULL
     *
     * @relation P3_PQ = 12
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3PQ
    |
    /**
     * PRIMARIES_ADOBE_RGB | TRANSFUNC_ADOBE_RGB | RANGE_LIMIT
     *
     * @relation ADOBE_RGB_1998_LIMIT = 13
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    AdobeRGB1998Limit
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_SRGB | RANGE_LIMIT
     *
     * @relation DISPLAY_P3_LIMIT = 14
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3Limit
    |
    /**
     * PRIMARIES_SRGB | TRANSFUNC_SRGB | RANGE_LIMIT
     *
     * @relation SRGB_LIMIT = 15
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    SRGBLimit
    |
    /**
     * PRIMARIES_BT709 | TRANSFUNC_BT709 | RANGE_LIMIT
     *
     * @relation BT709_LIMIT = 16
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT709Limit
    |
    /**
     * PRIMARIES_BT601_P | TRANSFUNC_BT709 | RANGE_LIMIT
     *
     * @relation BT601_EBU_LIMIT = 17
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601EBULimit
    |
    /**
     * PRIMARIES_BT601_N | TRANSFUNC_BT709 | RANGE_LIMIT
     *
     * @relation BT601_SMPTE_C_LIMIT = 18
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601SMPTECLimit
    |
    /**
     * PRIMARIES_BT2020 | TRANSFUNC_HLG | RANGE_LIMIT
     *
     * @relation BT2020_HLG_LIMIT = 19
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020HLGLimit
    |
    /**
     * PRIMARIES_BT2020 | TRANSFUNC_PQ | RANGE_LIMIT
     *
     * @relation BT2020_PQ_LIMIT = 20
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020PQLimit
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_HLG | RANGE_LIMIT
     *
     * @relation P3_HLG_LIMIT = 21
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3HLGLimit
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_PQ | RANGE_LIMIT
     *
     * @relation P3_PQ_LIMIT = 22
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3PQLimit
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_LINEAR
     *
     * @relation LINEAR_P3 = 23
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearP3
    |
    /**
     * PRIMARIES_SRGB | TRANSFUNC_LINEAR
     *
     * @relation LINEAR_SRGB = 24
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearSRGB
    |
    /**
     * PRIMARIES_BT709 | TRANSFUNC_LINEAR
     *
     * @relation LINEAR_BT709 = LINEAR_SRGB
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearBT709
    |
    /**
     * PRIMARIES_BT2020 | TRANSFUNC_LINEAR
     *
     * @relation LINEAR_BT2020 = 25
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearBT2020
    |
    /**
     * PRIMARIES_SRGB | TRANSFUNC_SRGB | RANGE_FULL
     *
     * @relation DISPLAY_SRGB = SRGB
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplaySRGB
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_SRGB | RANGE_FULL
     *
     * @relation DISPLAY_P3_SRGB = DISPLAY_P3
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3SRGB
    |
    /**
     * PRIMARIES_P3_D65 | TRANSFUNC_HLG | RANGE_FULL
     *
     * @relation DISPLAY_P3_HLG = P3_HLG
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3HLG
    |
    /**
     * PRIMARIES_DISPLAY_P3 | TRANSFUNC_PQ | RANGE_FULL
     *
     * @relation DISPLAY_P3_PQ = P3_PQ
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3PQ
    | ...

    protected func getValue(): UInt32 {
        return match (this) {
            case Unknown => 0
            case AdobeRGB1998 => 1
            case DCIP3 => 2
            case DisplayP3 => 3
            case SRGB => 4
            case Custom => 5
            case BT709 => 6
            case BT601EBU => 7
            case BT601SMPTEC => 8
            case BT2020HLG => 9
            case BT2020PQ => 10
            case P3HLG => 11
            case P3PQ => 12
            case AdobeRGB1998Limit => 13
            case DisplayP3Limit => 14
            case SRGBLimit => 15
            case BT709Limit => 16
            case BT601EBULimit => 17
            case BT601SMPTECLimit => 18
            case BT2020HLGLimit => 19
            case BT2020PQLimit => 20
            case P3HLGLimit => 21
            case P3PQLimit => 22
            case LinearP3 => 23
            case LinearSRGB => 24
            case LinearBT709 => 24
            case LinearBT2020 => 25
            case DisplaySRGB => 4
            case DisplayP3SRGB => 3
            case DisplayP3HLG => 11
            case DisplayP3PQ => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    protected static func parse(cs: UInt32): ColorSpace {
        return match (cs) {
            case 0 => Unknown
            case 1 => AdobeRGB1998
            case 2 => DCIP3
            case 3 => DisplayP3
            case 4 => SRGB
            case 5 => Custom
            case 6 => BT709
            case 7 => BT601EBU
            case 8 => BT601SMPTEC
            case 9 => BT2020HLG
            case 10 => BT2020PQ
            case 11 => P3HLG
            case 12 => P3PQ
            case 13 => AdobeRGB1998Limit
            case 14 => DisplayP3Limit
            case 15 => SRGBLimit
            case 16 => BT709Limit
            case 17 => BT601EBULimit
            case 18 => BT601SMPTECLimit
            case 19 => BT2020HLGLimit
            case 20 => BT2020PQLimit
            case 21 => P3HLGLimit
            case 22 => P3PQLimit
            case 23 => LinearP3
            case 24 => LinearSRGB
            case 25 => LinearBT2020
            case _ => throw IllegalArgumentException("Unrecognized ColorSpace type: ${cs}")
        }
    }
}

/**
 * Describes the primary colors red, green, blue and white point coordinated as (x, y)
  in color space, in terms of real world chromaticities.
 *
 * @relation interface ColorSpacePrimaries
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public class ColorSpacePrimaries {
    /**
     * Coordinate value x of red color.
     *
     * @relation redX: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var redX: Float32

    /**
     * Coordinate value y of red color.
     *
     * @relation redY: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var redY: Float32

    /**
     * Coordinate value x of green color.
     *
     * @relation greenX: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var greenX: Float32

    /**
     * Coordinate value y of green color.
     *
     * @relation greenY: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var greenY: Float32

    /**
     * Coordinate value x of blue color.
     *
     * @relation blueX: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var blueX: Float32

    /**
     * Coordinate value y of blue color.
     *
     * @relation blueY: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var blueY: Float32

    /**
     * Coordinate value x of white point.
     *
     * @relation whitePointX: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var whitePointX: Float32

    /**
     * Coordinate value y of white point.
     *
     * @relation whitePointY: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var whitePointY: Float32

    /**
     * ColorSpacePrimaries constructor.
     *
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public init(redX: Float32, redY: Float32, greenX: Float32, greenY: Float32, blueX: Float32, blueY: Float32, whitePointX: Float32, whitePointY: Float32) {
        this.redX = redX
        this.redY = redY
        this.greenX = greenX
        this.greenY = greenY
        this.blueX = blueX
        this.blueY = blueY
        this.whitePointX = whitePointX
        this.whitePointY = whitePointY
    }
}

@C
struct CJColorSpacePrimaries {
    CJColorSpacePrimaries(
        let redX!: Float32,
        let redY!: Float32,
        let greenX!: Float32,
        let greenY!: Float32,
        let blueX!: Float32,
        let blueY!: Float32,
        let whitePointX!: Float32,
        let whitePointY!: Float32
    ) {}

    init(primaries: ColorSpacePrimaries) {
        redX = primaries.redX
        redY = primaries.redY
        greenX = primaries.greenX
        greenY = primaries.greenY
        blueX = primaries.blueX
        blueY = primaries.blueY
        whitePointX = primaries.whitePointX
        whitePointY = primaries.whitePointY
    }
}
