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

package ohos.color_manager

import ohos.base.*
import ohos.labels.*

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public enum ColorSpace <: ToString {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Unknown
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    AdobeRgb1998
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DciP3
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Srgb
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Custom
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt709
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt601Ebu
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt601SmpteC
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt2020Hlg
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt2020Pq
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3Hlg
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3Pq
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    AdobeRgb1998Limit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3Limit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    SrgbLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt709Limit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt601EbuLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt601SmpteCLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt2020HlgLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    Bt2020PqLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3HlgLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3PqLimit
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearP3
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearSrgb
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearBt709
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LinearBt2020
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplaySrgb
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3Srgb
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3Hlg
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DisplayP3Pq
    | ...

    func getValue(): UInt32 {
        return match (this) {
            case Unknown => 0
            case AdobeRgb1998 => 1
            case DciP3 => 2
            case DisplayP3 => 3
            case Srgb => 4
            case Custom => 5
            case Bt709 => 6
            case Bt601Ebu => 7
            case Bt601SmpteC => 8
            case Bt2020Hlg => 9
            case Bt2020Pq => 10
            case P3Hlg => 11
            case P3Pq => 12
            case AdobeRgb1998Limit => 13
            case DisplayP3Limit => 14
            case SrgbLimit => 15
            case Bt709Limit => 16
            case Bt601EbuLimit => 17
            case Bt601SmpteCLimit => 18
            case Bt2020HlgLimit => 19
            case Bt2020PqLimit => 20
            case P3HlgLimit => 21
            case P3PqLimit => 22
            case LinearP3 => 23
            case LinearSrgb => 24
            case LinearBt709 => 24
            case LinearBt2020 => 25
            case DisplaySrgb => 4
            case DisplayP3Srgb => 3
            case DisplayP3Hlg => 11
            case DisplayP3Pq => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    static func parse(cs: UInt32): ColorSpace {
        return match (cs) {
            case 0 => Unknown
            case 1 => AdobeRgb1998
            case 2 => DciP3
            case 3 => DisplayP3
            case 4 => Srgb
            case 5 => Custom
            case 6 => Bt709
            case 7 => Bt601Ebu
            case 8 => Bt601SmpteC
            case 9 => Bt2020Hlg
            case 10 => Bt2020Pq
            case 11 => P3Hlg
            case 12 => P3Pq
            case 13 => AdobeRgb1998Limit
            case 14 => DisplayP3Limit
            case 15 => SrgbLimit
            case 16 => Bt709Limit
            case 17 => Bt601EbuLimit
            case 18 => Bt601SmpteCLimit
            case 19 => Bt2020HlgLimit
            case 20 => Bt2020PqLimit
            case 21 => P3HlgLimit
            case 22 => P3PqLimit
            case 23 => LinearP3
            case 24 => LinearSrgb
            case 25 => LinearBt2020
            case _ => throw IllegalArgumentException("Unrecognized ColorSpace type: ${cs}")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public func toString(): String {
        return match (this) {
            case Unknown => "UNKNOWN"
            case AdobeRgb1998 => "ADOBE_RGB_1998"
            case DciP3 => "DCI_P3"
            case DisplayP3 => "DISPLAY_P3"
            case Srgb => "SRGB"
            case Custom => "CUSTOM"
            case Bt709 => "BT709"
            case Bt601Ebu => "BT601_EBU"
            case Bt601SmpteC => "BT601_SMPTE_C"
            case Bt2020Hlg => "BT2020_HLG"
            case Bt2020Pq => "BT2020_PQ"
            case P3Hlg => "P3_HLG"
            case P3Pq => "P3_PQ"
            case AdobeRgb1998Limit => "ADOBE_RGB_1998_LIMIT"
            case DisplayP3Limit => "DISPLAY_P3_LIMIT"
            case SrgbLimit => "SRGB_LIMIT"
            case Bt709Limit => "BT709_LIMIT"
            case Bt601EbuLimit => "BT601_EBU_LIMIT"
            case Bt601SmpteCLimit => "BT601_SMPTE_C_LIMIT"
            case Bt2020HlgLimit => "BT2020_HLG_LIMIT"
            case Bt2020PqLimit => "BT2020_PQ_LIMIT"
            case P3HlgLimit => "P3_HLG_LIMIT"
            case P3PqLimit => "P3_PQ_LIMIT"
            case LinearP3 => "LINEAR_P3"
            case LinearSrgb => "LINEAR_SRGB"
            case LinearBt709 => "LINEAR_BT709"
            case LinearBt2020 => "LINEAR_BT2020"
            case DisplaySrgb => "DISPLAY_SRGB"
            case DisplayP3Srgb => "DISPLAY_P3_SRGB"
            case DisplayP3Hlg => "DISPLAY_P3_HLG"
            case DisplayP3Pq => "DISPLAY_P3_PQ"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public class ColorSpacePrimaries {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var redX: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var redY: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var greenX: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var greenY: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var blueX: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var blueY: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var whitePointX: Float32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public var whitePointY: Float32

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
