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

package ohos.ability

import std.deriving.*
import ohos.ffi.*
import ohos.labels.*

@C
protected struct CConfiguration {
    CConfiguration(
        var language: CString,
        var colorMode: Int32,
        var direction: Int32,
        var screenDensity: Int32,
        var displayId: Int32,
        var hasPointerDevice: Bool,
        var fontSizeScale: Float64,
        var fontWeightScale: Float64,
        var mcc: CString,
        var mnc: CString
    ) {}

    init() {
        language = CString(CPointer())
        colorMode = 0
        direction = 0
        screenDensity = 0
        displayId = 0
        hasPointerDevice = false
        fontSizeScale = 0.0
        fontWeightScale = 0.0
        mcc = CString(CPointer())
        mnc = CString(CPointer())
    }

    protected func toConfiguration(): AbilityConfiguration {
        return AbilityConfiguration(
            language.toString(),
            ConfigurationColorMode.parse(colorMode),
            ConfigurationDirection.parse(direction),
            ConfigurationScreenDensity.parse(screenDensity),
            displayId,
            hasPointerDevice,
            fontSizeScale,
            fontWeightScale,
            mcc.toString(),
            mnc.toString()
        )
    }

    unsafe func free(): Unit {
        LibC.free(language)
        LibC.free(mcc)
        LibC.free(mnc)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public class AbilityConfiguration {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    public AbilityConfiguration(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var language: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var colorMode: ConfigurationColorMode,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var direction: ConfigurationDirection,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var screenDensity: ConfigurationScreenDensity,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var displayId: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var hasPointerDevice: Bool,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var fontSizeScale: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var fontWeightScale: Float64,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var mcc: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityBase"
        ]
        public var mnc: String
    ) {}
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ConfigurationColorMode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    COLOR_MODE_NOT_SET
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    COLOR_MODE_DARK
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    COLOR_MODE_LIGHT
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case COLOR_MODE_NOT_SET => -1
                case COLOR_MODE_DARK => 0
                case COLOR_MODE_LIGHT => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): ConfigurationColorMode {
        match (value) {
            case 0 => COLOR_MODE_DARK
            case 1 => COLOR_MODE_LIGHT
            case -1 => COLOR_MODE_NOT_SET
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ConfigurationDirection {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DIRECTION_NOT_SET
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DIRECTION_VERTICAL
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    DIRECTION_HORIZONTAL
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case DIRECTION_NOT_SET => -1
                case DIRECTION_VERTICAL => 0
                case DIRECTION_HORIZONTAL => 1
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): ConfigurationDirection {
        match (value) {
            case 0 => DIRECTION_VERTICAL
            case 1 => DIRECTION_HORIZONTAL
            case -1 => DIRECTION_NOT_SET
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityBase"
]
public enum ConfigurationScreenDensity {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_NOT_SET
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_SDPI
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_MDPI
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_LDPI
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_XLDPI
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_XXLDPI
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityBase"
    ]
    SCREEN_DENSITY_XXXLDPI
    | ...

    prop value: Int32 {
        get() {
            match (this) {
                case SCREEN_DENSITY_NOT_SET => 0
                case SCREEN_DENSITY_SDPI => 120
                case SCREEN_DENSITY_MDPI => 160
                case SCREEN_DENSITY_LDPI => 240
                case SCREEN_DENSITY_XLDPI => 320
                case SCREEN_DENSITY_XXLDPI => 480
                case SCREEN_DENSITY_XXXLDPI => 640
                case _ => throw IllegalArgumentException("The type is not supported.")
            }
        }
    }

    static func parse(value: Int32): ConfigurationScreenDensity {
        match (value) {
            case 120 => SCREEN_DENSITY_SDPI
            case 160 => SCREEN_DENSITY_MDPI
            case 240 => SCREEN_DENSITY_LDPI
            case 320 => SCREEN_DENSITY_XLDPI
            case 480 => SCREEN_DENSITY_XXLDPI
            case 640 => SCREEN_DENSITY_XXXLDPI
            case 0 => SCREEN_DENSITY_NOT_SET
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}
