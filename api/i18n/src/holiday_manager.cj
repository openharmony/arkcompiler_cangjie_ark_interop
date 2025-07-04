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
    func FfiOHOSHolidayManagerImplConstructor(icsPath: CString): Int64

    func FfiOHOSHolidayManagerIsHoliday(id: Int64, date: CDate): Bool

    func FfiOHOSHolidayManagerGetHolidayInfoItemArray(id: Int64, year: Int32): CHolidayInfoItemArr
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class HolidayManager <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(icsPath: String) {
        super(
            unsafe {
                let cIcsPath = LibC.mallocCString(icsPath)
                var id = FfiOHOSHolidayManagerImplConstructor(cIcsPath)
                LibC.free(cIcsPath)
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func isHoliday(date!: ?DateTime = None): Bool {
        unsafe {
            var cDate: CDate = CDate()
            if (let Some(v) <- date) {
                cDate = CDate(v)
            }
            let res = FfiOHOSHolidayManagerIsHoliday(getID(), cDate)
            res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func getHolidayInfoItemArray(year!: ?Int32 = None): Array<HolidayInfoItem> {
        var cYear: Int32 = -1
        if (let Some(v) <- year) {
            if (v < 0) {
                throw BusinessException(INVALID_PARAMETER, getErrorMsg(INVALID_PARAMETER))
            }
            cYear = v
        }
        let cHolidayInfos = unsafe { FfiOHOSHolidayManagerGetHolidayInfoItemArray(getID(), cYear) }
        let holidayInfos = cHolidayInfos.toArrayHolidayInfoItem()
        cHolidayInfos.free()
        holidayInfos
    }
}
