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
    func FfiI18nSystemGetAppPreferredLanguage(): CString

    func FfiI18nSystemGetSystemLanguage(): CString

    func FfiI18nSystemGetSystemRegion(): CString

    func FfiI18nSystemIsSuggested(language: CString, region: CString, parameterStatus: Int32): Bool

    func FfiI18nSystemGetSystemCountries(language: CString, errCode: CPointer<Int32>): CArrString

    func FfiI18nSystemGetDisplayCountry(country: CString, locale: CString, sentenceCase: Bool, errCode: CPointer<Int32>): CString

    func FfiI18nSystemGetUsingLocalDigit(): Bool

    func FfiI18nSystemSetAppPreferredLanguage(language: CString): Int32

    func FfiI18nSystemGetFirstPreferredLanguage(): CString

    func FfiI18nSystemGetPreferredLanguageList(): CArrString

    func FfiI18nSystemIs24HourClock(): Bool

    func FfiI18nSystemGetSystemLanguages(): CArrString

    func FfiI18nSystemGetDisplayLanguage(language: CString, locale: CString, sentenceCase: Bool,
        errCode: CPointer<Int32>): CString

    func FfiI18nSystemGetSystemLocale(): CString
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    form: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class System {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getAppPreferredLanguage(): String {
        let clanguage = unsafe { FfiI18nSystemGetAppPreferredLanguage() }
        try {
            let language = clanguage.toString()
            return language
        } finally {
            unsafe { LibC.free(clanguage) }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getSystemLanguage(): String {
        let cStr = unsafe { FfiI18nSystemGetSystemLanguage() }
        try {
            let str = cStr.toString()
            return str
        } finally {
            unsafe { LibC.free(cStr) }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getSystemRegion(): String {
        let cStr = unsafe { FfiI18nSystemGetSystemRegion() }
        try {
            let str = cStr.toString()
            return str
        } finally {
            unsafe { LibC.free(cStr) }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func isSuggested(language: String, region!: ?String = None): Bool {
        unsafe {
            var cLanguage = LibC.mallocCString(language)
            var cRegion = CString(CPointer<UInt8>())
            var parameterStatus: Int32 = 0 // 0 represents regoin is null, use system region instead
            if (let Some(v) <- region) {
                try {
                    cRegion = LibC.mallocCString(v)
                } catch (e: Exception) {
                    LibC.free(cLanguage)
                    throw e
                }
                parameterStatus = 1
            }
            let result = FfiI18nSystemIsSuggested(cLanguage, cRegion, parameterStatus)
            LibC.free(cLanguage)
            LibC.free(cRegion)
            return result;
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getSystemCountries(language: String): Array<String> {
        unsafe {
            var result = Array<String>()
            var errCode: Int32 = 0
            try (cLanguage = LibC.mallocCString(language).asResource()) {
                let cArrString = FfiI18nSystemGetSystemCountries(cLanguage.value, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    cArrString.free()
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                result = cArrString.toStringArray()
                cArrString.free()
            }
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
    public static func getDisplayCountry(country: String, locale: String, sentenceCase!: Bool = true): String {
        unsafe {
            var errCode: Int32 = 0
            var result = ""
            try (
                cCountry = LibC.mallocCString(country).asResource(),
                cLocale = LibC.mallocCString(locale).asResource()
            ) {
                let cStr = FfiI18nSystemGetDisplayCountry(cCountry.value, cLocale.value, sentenceCase, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                result = cStr.toString()
                LibC.free(cStr)
            }
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getUsingLocalDigit(): Bool {
        return unsafe { FfiI18nSystemGetUsingLocalDigit() }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func setAppPreferredLanguage(language: String): Unit {
        unsafe {
            try (cLanguage = LibC.mallocCString(language).asResource()) {
                let errCode = FfiI18nSystemSetAppPreferredLanguage(cLanguage.value)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
            }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getFirstPreferredLanguage(): String {
        let cStr = unsafe { FfiI18nSystemGetFirstPreferredLanguage() }
        try {
            let str = cStr.toString()
            return str
        } finally {
            unsafe { LibC.free(cStr) }
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getPreferredLanguageList(): Array<String> {
        unsafe {
            let cArrString = FfiI18nSystemGetPreferredLanguageList()
            let result = cArrString.toStringArray()
            cArrString.free()
            return result
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func is24HourClock(): Bool {
        return unsafe { FfiI18nSystemIs24HourClock() }
    }

    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getSystemLanguages(): Array<String> {
        unsafe {
            let cArrString = FfiI18nSystemGetSystemLanguages()
            let result = cArrString.toStringArray()
            cArrString.free()
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
    public static func getDisplayLanguage(language: String, locale: String, sentenceCase!: Bool = true): String {
        unsafe {
            var result = ""
            try (
                cLanguage = LibC.mallocCString(language).asResource(),
                cLocale = LibC.mallocCString(locale).asResource()
            ) {
                var errCode: Int32 = 0
                let cStr = FfiI18nSystemGetDisplayLanguage(cLanguage.value, cLocale.value, sentenceCase, inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, getErrorMsg(errCode))
                }
                result = cStr.toString()
                LibC.free(cStr)
            }
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
    public static func getSystemLocale(): String {
        let cStr = unsafe { FfiI18nSystemGetSystemLocale() }
        try {
            let str = cStr.toString()
            return str
        } finally {
            unsafe { LibC.free(cStr) }
        }
    }
}
