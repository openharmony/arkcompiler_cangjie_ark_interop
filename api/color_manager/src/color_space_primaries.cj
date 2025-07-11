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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public enum ColorSpace <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    UNKNOWN
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    ADOBE_RGB_1998
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DCI_P3
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_P3
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    SRGB
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    CUSTOM
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT709
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601_EBU
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601_SMPTE_C
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020_HLG
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020_PQ
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3_HLG
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3_PQ
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    ADOBE_RGB_1998_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_P3_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    SRGB_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT709_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601_EBU_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT601_SMPTE_C_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020_HLG_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    BT2020_PQ_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3_HLG_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    P3_PQ_LIMIT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LINEAR_P3
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LINEAR_SRGB
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LINEAR_BT709
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    LINEAR_BT2020
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_SRGB
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_P3_SRGB
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_P3_HLG
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    DISPLAY_P3_PQ
    | ...

    func getValue(): UInt32 {
        return match (this) {
            case UNKNOWN => 0
            case ADOBE_RGB_1998 => 1
            case DCI_P3 => 2
            case DISPLAY_P3 => 3
            case SRGB => 4
            case CUSTOM => 5
            case BT709 => 6
            case BT601_EBU => 7
            case BT601_SMPTE_C => 8
            case BT2020_HLG => 9
            case BT2020_PQ => 10
            case P3_HLG => 11
            case P3_PQ => 12
            case ADOBE_RGB_1998_LIMIT => 13
            case DISPLAY_P3_LIMIT => 14
            case SRGB_LIMIT => 15
            case BT709_LIMIT => 16
            case BT601_EBU_LIMIT => 17
            case BT601_SMPTE_C_LIMIT => 18
            case BT2020_HLG_LIMIT => 19
            case BT2020_PQ_LIMIT => 20
            case P3_HLG_LIMIT => 21
            case P3_PQ_LIMIT => 22
            case LINEAR_P3 => 23
            case LINEAR_SRGB => 24
            case LINEAR_BT709 => 24
            case LINEAR_BT2020 => 25
            case DISPLAY_SRGB => 4
            case DISPLAY_P3_SRGB => 3
            case DISPLAY_P3_HLG => 11
            case DISPLAY_P3_PQ => 12
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public static func parse(cs: UInt32): ColorSpace {
        return ColorSpace.parseInner(cs)
    }

    static func parseInner(cs: UInt32): ColorSpace {
        return match (cs) {
            case 0 => UNKNOWN
            case 1 => ADOBE_RGB_1998
            case 2 => DCI_P3
            case 3 => DISPLAY_P3
            case 4 => SRGB
            case 5 => CUSTOM
            case 6 => BT709
            case 7 => BT601_EBU
            case 8 => BT601_SMPTE_C
            case 9 => BT2020_HLG
            case 10 => BT2020_PQ
            case 11 => P3_HLG
            case 12 => P3_PQ
            case 13 => ADOBE_RGB_1998_LIMIT
            case 14 => DISPLAY_P3_LIMIT
            case 15 => SRGB_LIMIT
            case 16 => BT709_LIMIT
            case 17 => BT601_EBU_LIMIT
            case 18 => BT601_SMPTE_C_LIMIT
            case 19 => BT2020_HLG_LIMIT
            case 20 => BT2020_PQ_LIMIT
            case 21 => P3_HLG_LIMIT
            case 22 => P3_PQ_LIMIT
            case 23 => LINEAR_P3
            case 24 => LINEAR_SRGB
            case 25 => LINEAR_BT2020
            case _ => throw IllegalArgumentException("Unrecognized ColorSpace type: ${cs}")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public func toString(): String {
        return match (this) {
            case UNKNOWN => "UNKNOWN"
            case ADOBE_RGB_1998 => "ADOBE_RGB_1998"
            case DCI_P3 => "DCI_P3"
            case DISPLAY_P3 => "DISPLAY_P3"
            case SRGB => "SRGB"
            case CUSTOM => "CUSTOM"
            case BT709 => "BT709"
            case BT601_EBU => "BT601_EBU"
            case BT601_SMPTE_C => "BT601_SMPTE_C"
            case BT2020_HLG => "BT2020_HLG"
            case BT2020_PQ => "BT2020_PQ"
            case P3_HLG => "P3_HLG"
            case P3_PQ => "P3_PQ"
            case ADOBE_RGB_1998_LIMIT => "ADOBE_RGB_1998_LIMIT"
            case DISPLAY_P3_LIMIT => "DISPLAY_P3_LIMIT"
            case SRGB_LIMIT => "SRGB_LIMIT"
            case BT709_LIMIT => "BT709_LIMIT"
            case BT601_EBU_LIMIT => "BT601_EBU_LIMIT"
            case BT601_SMPTE_C_LIMIT => "BT601_SMPTE_C_LIMIT"
            case BT2020_HLG_LIMIT => "BT2020_HLG_LIMIT"
            case BT2020_PQ_LIMIT => "BT2020_PQ_LIMIT"
            case P3_HLG_LIMIT => "P3_HLG_LIMIT"
            case P3_PQ_LIMIT => "P3_PQ_LIMIT"
            case LINEAR_P3 => "LINEAR_P3"
            case LINEAR_SRGB => "LINEAR_SRGB"
            case LINEAR_BT709 => "LINEAR_BT709"
            case LINEAR_BT2020 => "LINEAR_BT2020"
            case DISPLAY_SRGB => "DISPLAY_SRGB"
            case DISPLAY_P3_SRGB => "DISPLAY_P3_SRGB"
            case DISPLAY_P3_HLG => "DISPLAY_P3_HLG"
            case DISPLAY_P3_PQ => "DISPLAY_P3_PQ"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    12,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
]
public class ColorSpacePrimaries {
    @!APILevel[
        12,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
    ]
    public ColorSpacePrimaries(
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let redX!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let redY!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let greenX!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let greenY!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let blueX!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let blueY!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let whitePointX!: Float32,
        @!APILevel[
            12,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Graphic.Graphic2D.ColorManager.Core"
        ]
        public let whitePointY!: Float32
    ) {}
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
