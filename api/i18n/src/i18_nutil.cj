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
import ohos.labels.*

foreign {
    func FfiI18nUtilUnitConvert(fromUnit: CUnitInfo, toUnit: CUnitInfo, value: Float64, locale: CString, style: CString): CString

    func FfiI18nUtilGetDateOrder(locale: CString): CString

    func FfiI18nUtilGetTimePeriodName(hour: Int32, locale: CString, errCode: CPointer<Int32>): CString

    func FfiI18nUtilGetThreeLetterLanguage(locale: CString, errCode: CPointer<Int32>): CString

    func FfiI18nUtilGetThreeLetterRegion(locale: CString, errCode: CPointer<Int32>): CString

    func FfiI18nUtilGetBestMatchLocale(locale: CString, localeList: CArrString, errCode: CPointer<Int32>): CString
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class I18NUtil {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func unitConvert(fromUnit: UnitInfo, toUnit: UnitInfo, value: Float64, locale: String,
        style!: ?String = None): String {
        unsafe {
            var cFromUnit = CUnitInfo(CString(CPointer<UInt8>()), CString(CPointer<UInt8>()))
            var cToUnit = CUnitInfo(CString(CPointer<UInt8>()), CString(CPointer<UInt8>()))
            var clocale = CString(CPointer<UInt8>())
            var cStyle = CString(CPointer<UInt8>())
            try {
                cFromUnit = unitInfo2C(fromUnit)
                cToUnit = unitInfo2C(toUnit)
                clocale = LibC.mallocCString(locale)
                cStyle = if (let Some(v) <- style) {
                    LibC.mallocCString(v)
                } else {
                    LibC.mallocCString("short")
                }
                let cvalue = FfiI18nUtilUnitConvert(cFromUnit, cToUnit, value, clocale, cStyle)
                let res = cvalue.toString()
                LibC.free(cvalue)
                return res
            } finally {
                LibC.free(clocale)
                LibC.free(cStyle)
                cFromUnit.free()
                cToUnit.free()
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
    public static func getDateOrder(locale: String): String {
        unsafe {
            let clocale: CString = LibC.mallocCString(locale)
            let cvalue = FfiI18nUtilGetDateOrder(clocale)
            let res = cvalue.toString()
            LibC.free(clocale)
            LibC.free(cvalue)
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getTimePeriodName(hour: Int32, locale!: ?String = None): String {
        unsafe {
            var cLocale = CString(CPointer<UInt8>())
            if (let Some(v) <- locale) {
                cLocale = LibC.mallocCString(v)
            }
            var errCode: Int32 = 0
            let cvalue = FfiI18nUtilGetTimePeriodName(hour, cLocale, inout errCode)
            let res = cvalue.toString()
            LibC.free(cLocale)
            LibC.free(cvalue)
            if (errCode != 0) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getThreeLetterLanguage(locale: String): String {
        unsafe {
            let clocale: CString = LibC.mallocCString(locale)
            var errCode: Int32 = 0
            let cvalue = FfiI18nUtilGetThreeLetterLanguage(clocale, inout errCode)
            let res = cvalue.toString()
            LibC.free(clocale)
            LibC.free(cvalue)
            if (errCode != 0) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
            return res
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getThreeLetterRegion(locale: String): String {
        unsafe {
            let clocale: CString = LibC.mallocCString(locale)
            var errCode: Int32 = 0
            let cvalue = FfiI18nUtilGetThreeLetterRegion(clocale, inout errCode)
            let res = cvalue.toString()
            LibC.free(clocale)
            LibC.free(cvalue)
            if (errCode != 0) {
                throw BusinessException(errCode, getErrorMsg(errCode))
            }
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
    public static func getBestMatchLocale(locale: String, localeList: Array<String>): String {
        unsafe {
            var res = ""
            try (clocale = LibC.mallocCString(locale).asResource()) {
                let cArrString = toArrayCString(localeList)
                var errCode: Int32 = 0
                let cValue = FfiI18nUtilGetBestMatchLocale(clocale.value, cArrString, inout errCode)
                res = cValue.toString()
                cArrString.free()
                LibC.free(cValue)
                if (errCode != 0) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
            }
            return res
        }
    }
}
