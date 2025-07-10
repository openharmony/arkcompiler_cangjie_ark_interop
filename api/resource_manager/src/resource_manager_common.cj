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

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class RawFileDescriptor {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public RawFileDescriptor(
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let fd: Int32,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let offset: Int64,
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let length: Int64
    ) {}

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
    12,
    atomicservice: true,
    crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
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
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var locale: String
    /**
     * Indicates the device type.
     *
     * @relation deviceType: DeviceType
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var deviceType: DeviceType
    /**
     * Indicates the screen density.
     *
     * @relation screenDensity: ScreenDensity
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var screenDensity: ScreenDensity
    /**
     * Indicates the color mode.
     *
     * @relation colorMode: ColorMode
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var colorMode: ColorMode
    /**
     * Indicates the mcc.
     *
     * @relation mcc: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var mcc: UInt32
    /**
     * Indicates the mnc.
     *
     * @relation mnc: number
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public var mnc: UInt32

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(direction: Direction, locale: String) {
        this.direction = direction
        this.locale = locale
        this.deviceType = DeviceType.DEVICE_TYPE_PHONE
        this.screenDensity = ScreenDensity.SCREEN_SDPI
        this.colorMode = ColorMode.Dark
        this.mcc = 0
        this.mnc = 0
    }

    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public init(
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
        12,
        atomicservice: true,
        crossplatform: true,
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
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class DeviceCapability <: ToString {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public DeviceCapability(
        // Indicates the screen density of the current device.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let screenDensity: ScreenDensity,
        // Indicates the type of the current device.
        @!APILevel[
            12,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let deviceType: DeviceType
    ) {}

    init(ret: RetDeviceCapability) {
        this.screenDensity = ScreenDensity.parse(ret.screenDensity)
        this.deviceType = DeviceType.parse(ret.deviceType)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func toString(): String {
        "screenDensity:${screenDensity.getValue()}, deviceType ${deviceType.getValue()}"
    }
}

/**
 * Enumerates screen density types.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum ScreenDensity {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_SDPI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_MDPI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_LDPI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_XLDPI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_XXLDPI
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    SCREEN_XXXLDPI
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case SCREEN_SDPI => 120
            case SCREEN_MDPI => 160
            case SCREEN_LDPI => 240
            case SCREEN_XLDPI => 320
            case SCREEN_XXLDPI => 480
            case SCREEN_XXXLDPI => 640
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): ScreenDensity {
        match (val) {
            case 120 => SCREEN_SDPI
            case 160 => SCREEN_MDPI
            case 240 => SCREEN_LDPI
            case 320 => SCREEN_XLDPI
            case 480 => SCREEN_XXLDPI
            case 640 => SCREEN_XXXLDPI
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates device types.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum DeviceType {
    //Indicates a phone.
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_PHONE
    // Indicates a tablet.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_TABLET
    // Indicates a car.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_CAR
    // Indicates a PC.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_PC
    // Indicates a smart TV.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_TV
    // Indicates a wearable device.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_WEARABLE
    // Indicates a 2in1 device.
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DEVICE_TYPE_2IN1
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DEVICE_TYPE_PHONE => 0
            case DEVICE_TYPE_TABLET => 1
            case DEVICE_TYPE_CAR => 2
            case DEVICE_TYPE_PC => 3
            case DEVICE_TYPE_TV => 4
            case DEVICE_TYPE_WEARABLE => 6
            case DEVICE_TYPE_2IN1 => 7
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): DeviceType {
        match (val) {
            case 0 => DEVICE_TYPE_PHONE
            case 1 => DEVICE_TYPE_TABLET
            case 2 => DEVICE_TYPE_CAR
            case 3 => DEVICE_TYPE_PC
            case 4 => DEVICE_TYPE_TV
            case 6 => DEVICE_TYPE_WEARABLE
            case 7 => DEVICE_TYPE_2IN1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates screen directions.
 */
@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum Direction {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DIRECTION_VERTICAL
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    DIRECTION_HORIZONTAL
    | ...

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public func getValue(): Int32 {
        match (this) {
            case DIRECTION_VERTICAL => 0
            case DIRECTION_HORIZONTAL => 1
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public static func parse(val: Int32): Direction {
        match (val) {
            case 0 => DIRECTION_VERTICAL
            case 1 => DIRECTION_HORIZONTAL
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

/**
 * Enumerates color mode types.
 *
 * @relation export enum ColorMode
 */
@Derive[Equatable, ToString]
@!APILevel[
    20,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum ColorMode {
    /**
     * Indicates dark mode.
     *
     * @relation DARK = 0
     */
    @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Dark
    /**
     * Indicates light mode.
     *
     * @relation LIGHT = 1
     */
    | @!APILevel[
        20,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    Light
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

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public class AppResource <: Length & ResourceColor {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    public AppResource(
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let bundleName: String,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let moduleName: String,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let id: Int32,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let params!: ?Array<Any> = None,
        @!APILevel[
            12,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.ResourceManager"
        ]
        public let resType!: ?Int32 = None
    ) {}

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
    12,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public func __GenerateResource__(
    bundleName: String,
    moudleType: String,
    moduleName: String,
    resId: Int32,
    resStr: String,
    params: Array<Any>,
    resType: Int32
): AppResource {
    if (moudleType == HAR_TYPE) {
        let paramsArr: ArrayList<Any> = ArrayList<Any>([resStr])
        paramsArr.add(all: params)
        return AppResource(DEFAULT_HAR_BUNDLE_NAME, DEFAULT_HAR_MODULE_NAME, -1, params: paramsArr.toArray(),
            resType: resType)
    } else if (resType == RAWFILE_TYPE) {
        return AppResource(bundleName, moduleName, resId, params: [resStr], resType: resType)
    } else {
        return AppResource(bundleName, moduleName, resId, params: params, resType: resType)
    }
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
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
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum Number {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    INT(Int32)
    | @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    FLOAT(Float32)
    | ...
}

@!APILevel[
    12,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.ResourceManager"
]
public enum FormatArgs {
    @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    INT(Int32)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    FLOAT(Float32)
    | @!APILevel[
        12,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.ResourceManager"
    ]
    STRING(String)
    | ...

    func shouldFormat(r: Rune): Bool {
        let l: Rune = match (this) {
            case INT(_) => r'd'
            case FLOAT(_) => r'f'
            case STRING(_) => r's'
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
        return l == r
    }

    func toString(): String {
        match (this) {
            case INT(v) => v.toString()
            case FLOAT(v) => v.toString()
            case STRING(v) => v
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
