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

package ohos.resource_manager

import ohos.labels.APILevel
import std.deriving.Derive
import ohos.hilog.HilogChannel
import ohos.base.BusinessException

type StageContext = CPointer<Unit>
const ESCAPE_CHARACTER: Rune = r'%'
const RAWFILE_TYPE: Int32 = 30000
const HAR_TYPE = "har"
const DEFAULT_HAR_BUNDLE_NAME = "__harDefaultBundleName__"
const DEFAULT_HAR_MODULE_NAME = "__harDefaultModuleName__"
let RES_LOG = HilogChannel(0, 0xD001E00, "CJ-ResourceManager")

/**
 * Provides the device configuration.
 *
 * @relation export class Configuration
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class Configuration {
    /**
     * Indicates the screen direction of the current device.
     *
     * @relation direction: Direction
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var direction: Direction
    /**
     * Indicates the current system language, for example, zh-Hans-CN.
     *
     * @relation locale: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var locale: String

    /**
     * Configuration constructor.
     */
    init(direction: Direction, locale: String) {
        this.direction = direction
        this.locale = locale
    }
}

/**
 * Provides the device capability.
 *
 * @relation export class DeviceCapability
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class DeviceCapability {
    /**
     * Indicates the screen density of the current device.
     *
     * @relation screenDensity: ScreenDensity
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var screenDensity: ScreenDensity
    /**
     * Indicates the type of the current device.
     *
     * @relation deviceType: DeviceType
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var deviceType: DeviceType

    /**
     * DeviceCapability constructor.
     */
    init(screenDensity: ScreenDensity, deviceType: DeviceType) {
        this.screenDensity = screenDensity
        this.deviceType = deviceType
    }
}

/**
 * Enumerates screen density types.
 *
 * export enum ScreenDensity
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum ScreenDensity {
    /**
     * Indicates small screen density.
     *
     * SCREEN_SDPI = 120
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenSDPI
    /**
     * Indicates medium screen density.
     *
     * SCREEN_MDPI = 160
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenMDPI
    /**
     * Indicates large screen density.
     *
     * SCREEN_LDPI = 240
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenLDPI
    /**
     * Indicates extra-large screen density.
     *
     * SCREEN_XLDPI = 320
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenXLDPI
    /**
     * Indicates extra-extra-large screen density.
     *
     * SCREEN_XXLDPI = 480
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenXXLDPI
    /**
     * Indicates extra-extra-extra-large screen density.
     *
     * SCREEN_XXXLDPI = 640
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    ScreenXXXLDPI
    | ...

    /**
     * Gets the corresponding mapping value.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case ScreenSDPI => 120
            case ScreenMDPI => 160
            case ScreenLDPI => 240
            case ScreenXLDPI => 320
            case ScreenXXLDPI => 480
            case ScreenXXXLDPI => 640
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    /**
     * Parses ScreenDensity from the corresponding mapping value.
     */
    static func parse(val: Int32): ScreenDensity {
        match (val) {
            case 120 => ScreenSDPI
            case 160 => ScreenMDPI
            case 240 => ScreenLDPI
            case 320 => ScreenXLDPI
            case 480 => ScreenXXLDPI
            case 640 => ScreenXXXLDPI
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates device types.
 *
 * @relation export enum DeviceType
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum DeviceType {
    /**
     * Indicates a phone.
     *
     * @relation DEVICE_TYPE_PHONE = 0x00
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypePhone
    /**
     * Indicates a tablet.
     *
     * @relation DEVICE_TYPE_TABLET = 0x01
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypeTablet
    /**
     * Indicates a car.
     *
     * @relation DEVICE_TYPE_CAR = 0x02
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypeCar
    /**
     * Indicates a PC.
     *
     * @relation DEVICE_TYPE_PC = 0x03
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypePC
    /**
     * Indicates a smart TV.
     *
     * @relation DEVICE_TYPE_TV = 0x04
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypeTV
    /**
     * Indicates a wearable device.
     *
     * @relation DEVICE_TYPE_WEARABLE = 0x06
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceTypeWearable
    /**
     * Indicates a 2in1 device.
     *
     * @relation DEVICE_TYPE_2IN1 = 0x07
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DeviceType2In1
    | ...

    /**
     * Parses DeviceType from the corresponding mapping value.
     */
    static func parse(val: Int32): DeviceType {
        match (val) {
            case 0 => DeviceTypePhone
            case 1 => DeviceTypeTablet
            case 2 => DeviceTypeCar
            case 3 => DeviceTypePC
            case 4 => DeviceTypeTV
            case 6 => DeviceTypeWearable
            case 7 => DeviceType2In1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates screen directions.
 *
 * @relation export enum Direction
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum Direction {
    /**
     * Enumerates screen directions.
     *
     * @relation DIRECTION_VERTICAL = 0
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DirectionVertical
    /**
     * Indicates the horizontal direction.
     *
     * @relation DIRECTION_HORIZONTAL = 1
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DirectionHorizontal
    | ...

    /**
     * Parses Direction from the corresponding mapping value.
     */
    static func parse(val: Int32): Direction {
        match (val) {
            case 0 => DirectionVertical
            case 1 => DirectionHorizontal
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * for some API returns two type : Int32 Float32
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum Number {
    /**
     * Represents Int32.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Int32Value(Int32)
    /**
     * Represents Float32.
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Float32Value(Float32)
    | ...
}

/**
 * For the formatting parameter using.
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum FormatArgs {
    /**
     * Formats %d.
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Int32Value(Int32)
    /**
     * Formats %f.
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Float32Value(Float32)
    /**
     * Formats %s.
     */
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    StringValue(String)
    | ...

    func shouldFormat(r: Rune): Bool {
        let l: Rune = match (this) {
            case Int32Value(_) => r'd'
            case Float32Value(_) => r'f'
            case StringValue(_) => r's'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
        return l == r
    }

    func toString(): String {
        match (this) {
            case Int32Value(v) => v.toString()
            case Float32Value(v) => v.toString()
            case StringValue(v) => v
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

func formatString(str: String, args: Array<FormatArgs>) {
    if (str.size == 0 || args.size == 0) {
        return str
    }
    let runeArr = str.toRuneArray()
    let sb = StringBuilder()
    var signIndex = runeArr.find(ESCAPE_CHARACTER, 0)
    var nonplaceholderStart = 0
    var countPlaceholder = 0
    // ignore ESCAPE_CHARACTER at the end of line
    while (signIndex < runeArr.size - 1) {
        var nonplaceholderSize = signIndex - nonplaceholderStart
        signIndex++
        var rune = runeArr[signIndex]
        // if input is "%%", output is "%"
        if (rune == ESCAPE_CHARACTER) {
            nonplaceholderSize++
            sb.append(runeArr.slice(nonplaceholderStart, nonplaceholderSize))
            signIndex++
            nonplaceholderStart = signIndex
            signIndex = runeArr.find(ESCAPE_CHARACTER, signIndex)
            continue
        }
        // ignore invalid ESCAPE_CHARACTER
        if (!(rune == r'd' || rune == r'f' || rune == r's')) {
            signIndex = runeArr.find(ESCAPE_CHARACTER, signIndex + 1)
            continue
        }
        // valid input list: %d %f %s, format it
        sb.append(runeArr.slice(nonplaceholderStart, nonplaceholderSize))
        if (countPlaceholder >= args.size || !args[countPlaceholder].shouldFormat(rune)) {
            throw BusinessException(ERROR_CODE_RES_ID_FORMAT_ERROR, "Resource manager: parameters error!")
        }
        sb.append(args[countPlaceholder].toString())
        signIndex++
        countPlaceholder++
        nonplaceholderStart = signIndex
        signIndex = runeArr.find(ESCAPE_CHARACTER, signIndex)
    }
    if (countPlaceholder != args.size) {
        throw BusinessException(ERROR_CODE_RES_ID_FORMAT_ERROR, "Resource manager: extra parameter!")
    }
    sb.append(runeArr.slice(nonplaceholderStart, runeArr.size - nonplaceholderStart))
    return sb.toString()
}

extend<T> Array<T> where T <: Comparable<T> {
    func find(c: T, index: Int64): Int64 {
        for (i in index..this.size) {
            if (this[i] == c) {
                return i
            }
        }
        return this.size - 1
    }
}
