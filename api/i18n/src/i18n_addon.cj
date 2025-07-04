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
import ohos.hilog.*
import ohos.ffi.*
import ohos.labels.*

let I18N_LOG = HilogChannel(0, 0xD001E00, "CJ-I18n")

foreign {
    func FfiOHOSIsRTL(locale: CString): Bool

    func FfiOHOSGetLineInstance(locale: CString): Int64

    func FfiOHOSGetCalendar(locale: CString, `type`: CString): Int64
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public func getTimeZone(zoneID!: String = ""): TimeZone {
    return TimeZone.getTimeZoneFromeZoneId(zoneID)
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public func getInstance(locale!: String = ""): IndexUtil {
    return IndexUtil.getIndexUtil(locale)
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public func isRTL(locale: String): Bool {
    unsafe {
        let cLocale = LibC.mallocCString(locale)
        let res = FfiOHOSIsRTL(cLocale)
        LibC.free(cLocale)
        return res
    }
}

/**
 * Obtains a BreakIterator object for text segmentation.
 *
 * @param { locale } String - Valid locale value, for example, zh-Hans-CN. The BreakIterator object segments text according to the rules of the specified locale.
 * @returns { BreakIterator } returns the instance of the BreakIterator.
 * @syscap SystemCapability.Global.I18n
 */
@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public func getLineInstance(locale: String): BreakIterator {
    unsafe {
        let cLocale = LibC.mallocCString(locale)
        let id = FfiOHOSGetLineInstance(cLocale)
        LibC.free(cLocale)
        return BreakIterator(id)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public func getCalendar(locale: String, calendarType!: ?String = None): Calendar {
    unsafe {
        var id = -1
        try (cLocale = LibC.mallocCString(locale).asResource()) {
            var cType = CString(CPointer<UInt8>())
            if (let Some(v) <- calendarType) {
                cType = LibC.mallocCString(v)
            }
            id = FfiOHOSGetCalendar(cLocale.value, cType)
            LibC.free(cType)
        }
        return Calendar(id)
    }
}
