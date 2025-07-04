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

import ohos.base.*
import ohos.ffi.*
import std.time.DateTime
import ohos.labels.*

foreign {
    func FfiOHOSCalendarSetTime(id: Int64, time: Float64): Unit

    func FfiOHOSCalendarSetDate(id: Int64, year: Int32, month: Int32, day: Int32): Unit

    func FfiOHOSCalendarSetOfDay(id: Int64, hour: Int32, minute: Int32, second: Int32): Unit

    func FfiOHOSCalendarSetTimeZone(id: Int64, timeZone: CString): Unit

    func FfiOHOSCalendarGetTimeZone(id: Int64): CString

    func FfiOHOSCalendarGetFirstDayOfWeek(id: Int64): Int32

    func FfiOHOSCalendarSetFirstDayOfWeek(id: Int64, value: Int32): Unit

    func FfiOHOSCalendarGetMinimalDaysInFirstWeek(id: Int64): Int32

    func FfiOHOSCalendarSetMinimalDaysInFirstWeek(id: Int64, value: Int32): Unit

    func FfiOHOSCalendarGet(id: Int64, field: CString): Int32

    func FfiOHOSCalendarGetDisplayName(id: Int64, locale: CString): CString

    func FfiOHOSCalendarIsWeekend(id: Int64, date: CDate): Bool

    func FfiOHOSCalendarAdd(id: Int64, field: CString, amount: Int32, code: CPointer<Int32>): Unit

    func FfiOHOSCalendarGetTimeInMillis(id: Int64): Float64

    func FfiOHOSCalendarCompareDays(id: Int64, date: CDate): Int32
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class Calendar <: RemoteDataLite {
    init(id: Int64) {
        super(id)
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setTime(date: DateTime): Unit {
        unsafe {
            FfiOHOSCalendarSetTime(getID(), Float64(date.toUnixTimeStamp().toMilliseconds()))
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setTime(time: Float64): Unit {
        unsafe {
            FfiOHOSCalendarSetTime(getID(), time)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func set(year: Int32, month: Int32, day: Int32, hour!: Int32 = -1, minute!: Int32 = -1, second!: Int32 = -1): Unit {
        unsafe {
            FfiOHOSCalendarSetDate(getID(), year, month, day)
            FfiOHOSCalendarSetOfDay(getID(), hour, minute, second)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setTimeZone(timeZone: String): Unit {
        unsafe {
            let cTimeZone = LibC.mallocCString(timeZone)
            FfiOHOSCalendarSetTimeZone(getID(), cTimeZone)
            LibC.free(cTimeZone)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getTimeZone(): String {
        unsafe {
            let timeZone = FfiOHOSCalendarGetTimeZone(getID())
            let res = timeZone.toString()
            LibC.free(timeZone)
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getFirstDayOfWeek(): Int32 {
        unsafe {
            return FfiOHOSCalendarGetFirstDayOfWeek(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setFirstDayOfWeek(value: Int32): Unit {
        unsafe {
            FfiOHOSCalendarSetFirstDayOfWeek(getID(), value)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getMinimalDaysInFirstWeek(): Int32 {
        unsafe {
            return FfiOHOSCalendarGetMinimalDaysInFirstWeek(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func setMinimalDaysInFirstWeek(value: Int32): Unit {
        unsafe {
            FfiOHOSCalendarSetMinimalDaysInFirstWeek(getID(), value)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func get(field: String): Int32 {
        unsafe {
            let cField = LibC.mallocCString(field)
            let result = FfiOHOSCalendarGet(getID(), cField)
            LibC.free(cField)
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getDisplayName(locale: String): String {
        unsafe {
            let cLocale = LibC.mallocCString(locale)
            let result = FfiOHOSCalendarGetDisplayName(getID(), cLocale)
            let res = result.toString()
            LibC.free(cLocale)
            LibC.free(result)
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func isWeekend(date!: ?DateTime = None): Bool {
        unsafe {
            var cDate = CDate()
            if (let Some(v) <- date) {
                cDate = CDate(v)
            }
            return FfiOHOSCalendarIsWeekend(getID(), cDate)
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func add(field: String, amount: Int32): Unit {
        unsafe {
            let cField = LibC.mallocCString(field)
            var errCode: Int32 = 0
            FfiOHOSCalendarAdd(getID(), cField, amount, inout errCode)
            LibC.free(cField)
            if (errCode != 0) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getTimeInMillis(): Float64 {
        unsafe {
            return FfiOHOSCalendarGetTimeInMillis(getID())
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func compareDays(date: DateTime): Int32 {
        unsafe {
            let cDate = CDate(date)
            let result = FfiOHOSCalendarCompareDays(getID(), cDate)
            return result
        }
    }
}
