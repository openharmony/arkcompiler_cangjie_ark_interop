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

import ohos.ffi.*
import std.collection.*
import ohos.base.*
import ohos.labels.*
import std.deriving.Derive
/**
 * Contains rawFile descriptor information.
 *
 * @relation export interface RawFileDescriptor
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class RawFileDescriptor {
    /**
     * rawfile descriptor
     *
     * @relation fd: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var fd: Int32
    /**
     * the offset from where the raw file starts in the HAP
     *
     * @relation offset: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var offset: Int64
    /**
     * the length of the raw file in the HAP
     *
     * @relation length: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var length: Int64

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(fd: Int32, offset: Int64, length: Int64) {
        this.fd = fd
        this.offset = offset
        this.length = length
    }

    init(raw: RetDataRawFileDescriptor) {
        this.fd = raw.fd
        this.offset = raw.offset
        this.length = raw.length
    }
}

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
public class Configuration <: ToString {
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
     * Indicates the device type.
     *
     * @relation deviceType: DeviceType
     */
    var deviceType: DeviceType
    /**
     * Indicates the screen density.
     *
     * @relation screenDensity: ScreenDensity
     */
    var screenDensity: ScreenDensity
    /**
     * Indicates the color mode.
     *
     * @relation colorMode: ColorMode
     */
    var colorMode: ColorMode
    /**
     * Indicates the mcc.
     *
     * @relation mcc: number
     */
    var mcc: UInt32
    /**
     * Indicates the mnc.
     *
     * @relation mnc: number
     */
    var mnc: UInt32

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(direction: Direction, locale: String) {
        this.direction = direction
        this.locale = locale
        this.deviceType = DeviceType.DeviceTypePhone
        this.screenDensity = ScreenDensity.ScreenSDPI
        this.colorMode = ColorMode.Dark
        this.mcc = 0
        this.mnc = 0
    }

    init(
        direction: Direction,
        locale: String,
        deviceType: DeviceType,
        screenDensity: ScreenDensity,
        colorMode: ColorMode,
        mcc: UInt32,
        mnc: UInt32
    ) {
        this.direction = direction
        this.locale = locale
        this.deviceType = deviceType
        this.screenDensity = screenDensity
        this.colorMode = colorMode
        this.mcc = mcc
        this.mnc = mnc
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func toString(): String {
        let builder = StringBuilder("Configuration(")
        builder.append("direction: ${direction.getValue()}, ")
        builder.append("locale: ${locale}, ")
        builder.append("deviceType: ${deviceType.getValue()}, ")
        builder.append("screenDensity: ${screenDensity.getValue()}, ")
        builder.append("colorMode: ${colorMode}, ")
        builder.append("mcc: ${mcc}, ")
        builder.append("mnc: ${mnc})")
        builder.toString()
    }

    func toRetConfigurationEx(): RetConfigurationEx {
        RetConfigurationEx(
            direction.getValue(),
            deviceType.getValue(),
            screenDensity.getValue(),
            colorMode.getValue(),
            mcc,
            mnc,
            unsafe { LibC.mallocCString(locale) }
        )
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
public class DeviceCapability <: ToString {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(screenDensity: ScreenDensity, deviceType: DeviceType) {
        this.screenDensity = screenDensity
        this.deviceType = deviceType
    }

    init(ret: RetDeviceCapability) {
        this.screenDensity = ScreenDensity.parse(ret.screenDensity)
        this.deviceType = DeviceType.parse(ret.deviceType)
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func toString(): String {
        "screenDensity:${screenDensity.getValue()}, deviceType ${deviceType.getValue()}"
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): ScreenDensity {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DeviceTypePhone => 0
            case DeviceTypeTablet => 1
            case DeviceTypeCar => 2
            case DeviceTypePC => 3
            case DeviceTypeTV => 4
            case DeviceTypeWearable => 6
            case DeviceType2In1 => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): DeviceType {
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

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DirectionVertical => 0
            case DirectionHorizontal => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): Direction {
        match (val) {
            case 0 => DirectionVertical
            case 1 => DirectionHorizontal
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@Derive[Equatable, ToString]
enum ColorMode {
    /**
     * Indicates dark mode.
     *
     * @relation DARK = 0
     */
    Dark
    /**
     * Indicates light mode.
     *
     * @relation LIGHT = 1
     */
    | Light
    | ...

    static func parse(val: Int32): ColorMode {
        match (val) {
            case 0 => Dark
            case 1 => Light
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    func getValue(): Int32 {
        match (this) {
            case Dark => 0
            case Light => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Contains resource descriptor information.
 *
 * @relation export interface Resource
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class AppResource <: Length & ResourceColor {
    /**
     * bundle name in hap
     *
     * @relation bundleName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var bundleName: String
    /**
     * module name in hap
     *
     * @relation moduleName: string
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var moduleName: String
    /**
     * resource id in hap
     *
     * @relation id: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var id: UInt32
    /**
     * Set params.
     *
     * @relation params?: any[]
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var params: ?Array<Any> = None
    /**
     * Set type.
     *
     * @relation type?: number
     */
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var resType: ?Int32 = None

    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(
        bundleName: String,
        moduleName: String,
        id: UInt32,
        params!: ?Array<Any> = None,
        resType!: ?Int32 = None
    ) {
        this.bundleName = bundleName
        this.moduleName = moduleName
        this.id = id
        this.params = params
        this.resType = resType
    }

    protected init(ret: CResource) {
        this.bundleName = ret.bundleName.toString()
        this.moduleName = ret.moduleName.toString()
        this.id = ret.resId
        this.params = None
        this.resType = None
    }
}

const RAWFILE_TYPE: Int32 = 30000
const HAR_TYPE = "har"
const DEFAULT_HAR_BUNDLE_NAME = "__harDefaultBundleName__"
const DEFAULT_HAR_MODULE_NAME = "__harDefaultModuleName__"

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public func __GenerateResource__(
    bundleName: String,
    moudleType: String,
    moduleName: String,
    resId: UInt32,
    resStr: String,
    params: Array<Any>,
    resType: Int32
): AppResource {
    if (moudleType == HAR_TYPE) {
        let paramsArr: ArrayList<Any> = ArrayList<Any>([resStr])
        paramsArr.add(all: params)
        return AppResource(DEFAULT_HAR_BUNDLE_NAME, DEFAULT_HAR_MODULE_NAME, 0, params: paramsArr.toArray(),
            resType: resType)
    } else if (resType == RAWFILE_TYPE) {
        return AppResource(bundleName, moduleName, resId, params: [resStr], resType: resType)
    } else {
        return AppResource(bundleName, moduleName, resId, params: params, resType: resType)
    }
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class DrawableDescriptor <: RemoteDataLite {
    init(id: Int64) {
        super(id)
        RES_LOG.info("DrawableDescriptor construct success")
    }

    ~init() {
        releaseFFIData(myDataId)
    }
}

let ERROR_CODE_MAP = HashMap<Int32, String>(
    [
        (9001001, "AppResource id invalid."),
        (9001002, "AppResource not found by id."),
        (9001003, "AppResource name invalid."),
        (9001004, "AppResource not found by name."),
        (9001005, "Rawfile path is invalid."),
        (9001006, "AppResource re-ref too much."),
        (9001007, "AppResource obtained by resId formatting error."),
        (9001008, "AppResource obtained by resName formatting error."),
        (9001009, "Get system resource manager failed."),
        (9001010, "Overlay resource path is invalid.")
    ]
)
const ERROR_CODE_RES_ID_FORMAT_ERROR: Int32 = 9001007
const ESCAPE_CHARACTER: Rune = r'%'
const ERROR_OUT_OF_MEMORY: Int32 = 10

func throwIfNotSuccess(code: Int32, errorMsg: String): Unit {
    if (code != SUCCESS_CODE) {
        if (code == -1) {
            throw IllegalStateException("invalid instance")
        }
        throw BusinessException(code, errorMsg)
    }
}

func throwIfNull(ptr: CString): Unit {
    if (ptr.isNull()) {
        throw IllegalMemoryException("Out of memory.")
    }
}

func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
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
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Int32Value(Int32)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Float32Value(Float32)
    | ...
}

@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum FormatArgs {
    @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Int32Value(Int32)
    | @!APILevel[
        21,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Float32Value(Float32)
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
