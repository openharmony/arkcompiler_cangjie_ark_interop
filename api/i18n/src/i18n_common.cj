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

package ohos.i18n

import std.deriving.Derive
import std.time.DateTime
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*
import std.collection.HashMap

@Derive[ToString, Equatable]
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public enum NormalizerMode {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    NFC
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    NFD
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    NFKC
    | @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    NFKD
    | ...

    func getValue(): Int32 {
        match (this) {
            case NFC => 1
            case NFD => 2
            case NFKC => 3
            case NFKD => 4
            case _ => throw IllegalArgumentException("The type is not supported yet.")
        }
    }
}

protected const INVALID_PARAMETER = 890001i32
let ERROR_CODE_MAP = HashMap<Int32, String>(
    [(INVALID_PARAMETER, "Invalid parameter. Possible causes: Parameter verification failed.")])

protected func getErrorMsg(code: Int32): String {
    if (let Some(v) <- getUniversalErrorMsg(code)) {
        return v
    } else if (ERROR_CODE_MAP.contains(code)) {
        return ERROR_CODE_MAP[code]
    } else {
        return "Unknown error code ${code}"
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class EntityInfoItem {
    EntityInfoItem(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let `type`: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let begin: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let end: Int32
    ) {}

    init(info: CEntityInfoItem) {
        this.`type` = info.`type`.toString()
        this.begin = info.begin
        this.end = info.end
    }
}

@C
struct CEntityInfoItem {
    CEntityInfoItem(
        var `type`: CString,
        var begin: Int32,
        var end: Int32
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.`type`)
        }
    }
}

@C
struct EntityInfoItemArr {
    EntityInfoItemArr(
        let size: Int64,
        let head: CPointer<CEntityInfoItem>
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class HolidayLocalName {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public HolidayLocalName(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let name: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let language: String
    ) {}
}

@C
struct CDate {
    CDate(
        let year: Int64,
        let month: Int64,
        let day: Int64,
        let icuUdate: Float64,
        let isNull: Bool
    ) {}

    init(date: DateTime) {
        this.year = date.year
        this.month = date.month.toInteger()
        this.day = date.dayOfMonth
        this.icuUdate = Float64(date.toUnixTimeStamp().toMilliseconds())
        this.isNull = false
    }

    init() {
        this.year = 0
        this.month = 0
        this.day = 0
        this.icuUdate = 0.0
        this.isNull = true
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class HolidayInfoItem {
    HolidayInfoItem(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let baseName: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let year: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let month: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let day: Int32,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let localNames: ?Array<HolidayLocalName>
    ) {}
}

@C
struct CHolidayLocalName {
    CHolidayLocalName(
        let name: CString,
        let language: CString
    ) {}

    func toHolidayLocalName(): HolidayLocalName {
        let res = HolidayLocalName(this.name.toString(), this.language.toString())
        return res
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.language)
        }
    }
}

@C
struct CHolidayLocalNameArr {
    CHolidayLocalNameArr(
        let size: Int64,
        let head: CPointer<CHolidayLocalName>
    ) {}

    func toArrayHolidayLocalName(): ?Array<HolidayLocalName> {
        unsafe {
            cArr2cjArr<CHolidayLocalName, HolidayLocalName>(size, head) {
                ele => ele.toHolidayLocalName()
            }
        }
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@C
struct CHolidayInfoItem {
    CHolidayInfoItem(
        let baseName: CString,
        let year: Int32,
        let month: Int32,
        let day: Int32,
        let language: CString,
        let localNames: CHolidayLocalNameArr
    ) {}

    func toHolidayInfoItem(): HolidayInfoItem {
        HolidayInfoItem(
            baseName.toString(),
            year,
            month,
            day,
            localNames.toArrayHolidayLocalName()
        )
    }

    func free(): Unit {
        unsafe {
            LibC.free(this.baseName)
            LibC.free(this.language)
            localNames.free()
        }
    }
}

@C
struct CHolidayInfoItemArr {
    CHolidayInfoItemArr(
        let size: Int64,
        let head: CPointer<CHolidayInfoItem>
    ) {}

    func toArrayHolidayInfoItem(): Array<HolidayInfoItem> {
        unsafe {
            cArr2cjArr<CHolidayInfoItem, HolidayInfoItem>(size, head) {
                cHolidayInfo => return cHolidayInfo.toHolidayInfoItem()
            }
        }
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free(head)
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class UnitInfo {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public UnitInfo(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var unit: String,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var measureSystem: String
    ) {}
}

@C
struct CUnitInfo {
    CUnitInfo(
        var unit: CString,
        var measureSystem: CString
    ) {}

    func free(): Unit {
        unsafe {
            LibC.free(this.unit)
            LibC.free(this.measureSystem)
        }
    }
}

func unitInfo2C(info: UnitInfo): CUnitInfo {
    unsafe {
        let unit = LibC.mallocCString(info.unit)
        let measureSystem = try {
            LibC.mallocCString(info.measureSystem)
        } catch (e: Exception) {
            LibC.free(unit)
            throw e
        }
        return CUnitInfo(unit, measureSystem)
    }
}
