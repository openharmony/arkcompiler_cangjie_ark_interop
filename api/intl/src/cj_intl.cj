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

package ohos.intl

import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.time.*
import ohos.hilog.*
import ohos.labels.*

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public struct NumberOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public NumberOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var locale!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var currency!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var currencySign!: String = "standard",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var currencyDisplay!: String = "symbol",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var unit!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var unitDispaly!: String = "short",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var unitUsage!: String = "default",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var signDisplay!: String = "auto",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var compactDisplay!: String = "short",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var notation!: String = "standard",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMather!: String = "best fit",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var style!: String = "decimal",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numberingSystem!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var useGrouping!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumIntegerDigits!: Int64 = 1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumFractionDigits!: Int64 = 0,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var maximumFractionDigits!: Int64 = 3,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumSignificantDigits!: Int64 = 1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var maximumSignificantDigits!: Int64 = 21
    ) {}

    func toNative(): CNumberOptions {
        return CNumberOptions(this)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public struct RelativeTimeFormatInputOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public RelativeTimeFormatInputOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMatcher!: String = "best fit",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numeric!: String = "always",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var style!: String = "long"
    ) {}

    func toNative(): CRelativeTimeFormatInputOptions {
        return CRelativeTimeFormatInputOptions(this)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public struct RelativeTimeFormatResolvedOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public RelativeTimeFormatResolvedOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMatcher: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numeric: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var style: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numberingSystem: String
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public struct PluralRulesOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public PluralRulesOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMatcher!: String = "best fit",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var ptype!: String = "cardinal",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumIntegerDigits!: Int64 = 1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumFractionDigits!: Int64 = 0,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var maximumFractionDigits!: Int64 = 3,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minimumSignificantDigits!: Int64 = 1,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var maximumSignificantDigits!: Int64 = 21
    ) {}

    func toNative(): CPluralRulesOptions {
        return CPluralRulesOptions(this)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public struct CollatorOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public CollatorOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMatcher!: String = "best fit",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var usage!: String = "sort",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var sensitivity!: String = "variant",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var ignorePunctuation!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var collation!: String = "default",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numeric!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var caseFirst!: String = "false"
    ) {}

    func toNative(): CCollatorOptions {
        return CCollatorOptions(this)
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
public struct DateTimeOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public DateTimeOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var locale!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var dateStyle!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var timeStyle!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var hourCycle!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var timeZone!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numberingSystem!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var hour12!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var weekday!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var era!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var year!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var month!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var day!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var hour!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var minute!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var second!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var timeZoneName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var dayPeriod!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var localeMatcher!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var formatMatcher!: String = ""
    ) {}

    func toNative(): CDateTimeOptions {
        return CDateTimeOptions(this)
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
public struct LocaleOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public LocaleOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var calendar!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var collation!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var hourCycle!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numberingSystem!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var numeric!: Bool = false,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            form: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public var caseFirst!: String = ""
    ) {}

    func toNative(): CLocaleOptions {
        return CLocaleOptions(this)
    }
}

let INTL_LOG = HilogChannel(0, 0xD001E00, "CJ-Intl")

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class NumberFormat <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                var id = FfiOHOSNumberFormatImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl NumberFormat failed:${errCode}")
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?NumberOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, NumberOptions().toNative())
                    }
                    id = FfiOHOSNumberFormatImplConstructorwithLocale(cLocale.value, coptions, flag, inout errCode)
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl NumberFormat failed: ${errCode}")
                    }
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: Array<String>, options!: ?NumberOptions = None) {
        super(
            unsafe {
                let (flag, coptions) = match (options) {
                    case Some(v) => (0, v.toNative())
                    case None => (1, NumberOptions().toNative())
                }
                let localeArray: CArrString = try {
                    toArrayCString(locale)
                } catch (e: Exception) {
                    coptions.free()
                    throw e
                }
                var errCode = 0i32
                let id = FfiOHOSNumberFormatImplConstructorwithArrayLocale(localeArray, coptions, flag, inout errCode)
                coptions.free()
                localeArray.free()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl NumberFormat failed: ${errCode}")
                }
                id
            })
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
    public func resolvedOptions(): NumberOptions {
        unsafe {
            let cNumberOptions = FfiOHOSNumberFormatImplGetNumberResolvedOptions(getID())
            let numberFormat = cNumberOptions.toCJ()
            cNumberOptions.free()
            return numberFormat
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func format(number: Float64): String {
        unsafe {
            let cLanguage = FfiOHOSNumberFormatImplFormat(getID(), number)
            if (cLanguage.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let language = cLanguage.toString()
            LibC.free(cLanguage)
            return language
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
public class RelativeTimeFormat <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                let codeId = FfiOHOSRelativeTimeFormatImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl RelativeTimeFormat failed: ${errCode}")
                }
                codeId
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?RelativeTimeFormatInputOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, RelativeTimeFormatInputOptions().toNative())
                    }
                    id = FfiOHOSRelativeTimeFormatImplConstructorwithLocale(
                        cLocale.value,
                        coptions,
                        flag,
                        inout errCode
                    )
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl NumberForma failed: ${errCode}")
                    }
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: Array<String>, options!: ?RelativeTimeFormatInputOptions = None) {
        super(
            unsafe {
                let (flag, coptions) = match (options) {
                    case Some(v) => (0, v.toNative())
                    case None => (1, RelativeTimeFormatInputOptions().toNative())
                }
                let localeArray: CArrString = try {
                    toArrayCString(locale)
                } catch (e: Exception) {
                    coptions.free()
                    throw e
                }
                var errCode = 0i32
                let id = FfiOHOSRelativeTimeFormatImplConstructorwithArrayLocale(localeArray, coptions, flag,
                    inout errCode)
                coptions.free()
                localeArray.free()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl NumberForma failed: ${errCode}")
                }
                id
            })
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
    public func format(value: Float64, unit: String): String {
        unsafe {
            let cUnit = LibC.mallocCString(unit)
            let cLanguage = FfiOHOSRelativeTimeFormatImplFormat(getID(), value, cUnit)
            LibC.free(cUnit)
            if (cLanguage.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let language = cLanguage.toString()
            LibC.free(cLanguage)
            return language
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func resolvedOptions(): RelativeTimeFormatResolvedOptions {
        unsafe {
            let cRelativeTimeFormatResolvedOptions = FfiOHOSRelativeTimeFormatImplResolvedOptions(getID())
            let relativeTimeFormatResolvedOptions = cRelativeTimeFormatResolvedOptions.toCJ()
            cRelativeTimeFormatResolvedOptions.free()
            return relativeTimeFormatResolvedOptions
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func formatToParts(value: Float64, unit: String): Array<Array<String>> {
        unsafe {
            let cUnit = LibC.mallocCString(unit)
            var cparts = FfiOHOSRelativeTimeFormatImplFormatToParts(getID(), value, cUnit)
            LibC.free(cUnit)
            let res = cparts.toStringArrayArray()
            for (i in 0..res.size) {
                for (j in 0..res[i].size) {
                    let temp = res[i][j].trimStart(" ")
                    let t = temp.trimEnd(" ")
                    res[i][j] = t
                }
            }
            cparts.free()
            return res
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
public class PluralRules <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                let codeId = FfiOHOSPluralRulesImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                }
                codeId
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?PluralRulesOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, PluralRulesOptions().toNative())
                    }
                    id = FfiOHOSPluralRulesImplConstructorwithLocale(cLocale.value, coptions, flag, inout errCode)
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                    }
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: Array<String>, options!: ?PluralRulesOptions = None) {
        super(
            unsafe {
                let (flag, coptions) = match (options) {
                    case Some(v) => (0, v.toNative())
                    case None => (1, PluralRulesOptions().toNative())
                }
                let localeArray: CArrString = try {
                    toArrayCString(locale)
                } catch (e: Exception) {
                    coptions.free()
                    throw e
                }
                var errCode = 0i32
                let id = FfiOHOSPluralRulesImplConstructorwithArrayLocale(localeArray, coptions, flag, inout errCode)
                coptions.free()
                localeArray.free()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                }
                id
            })
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
    public func select(n: Float64): String {
        unsafe {
            let cLanguage = FfiOHOSPluralRulesImplSelect(getID(), n)
            if (cLanguage.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let language = cLanguage.toString()
            LibC.free(cLanguage)
            return language
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
public class Collator <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                let codeId = FfiOHOSCollatorImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl Collator failed: ${errCode}")
                }
                codeId
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?CollatorOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, CollatorOptions().toNative())
                    }
                    id = FfiOHOSCollatorImplConstructorwithLocale(cLocale.value, coptions, flag, inout errCode)
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                    }
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: Array<String>, options!: ?CollatorOptions = None) {
        super(
            unsafe {
                let (flag, coptions) = match (options) {
                    case Some(v) => (0, v.toNative())
                    case None => (1, CollatorOptions().toNative())
                }
                let localeArray: CArrString = try {
                    toArrayCString(locale)
                } catch (e: Exception) {
                    coptions.free()
                    throw e
                }
                var errCode = 0i32
                let id = FfiOHOSCollatorImplConstructorwithArrayLocale(localeArray, coptions, flag, inout errCode)
                coptions.free()
                localeArray.free()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl Collator failed: ${errCode}")
                }
                id
            })
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
    public func compare(first: String, second: String): Int32 {
        unsafe {
            var compareResult: Int32 = 0
            try (
                cfirst = LibC.mallocCString(first).asResource(),
                csecond = LibC.mallocCString(second).asResource()
            ) {
                compareResult = FfiOHOSCollatorImplCompare(getID(), cfirst.value, csecond.value)
            }
            return compareResult
        }
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func resolvedOptions(): CollatorOptions {
        unsafe {
            let cCollatorOptions = FfiOHOSCollatorOptionsImplResolvedOptions(getID())
            let collatorOptions = cCollatorOptions.toCJ()
            cCollatorOptions.free()
            return collatorOptions
        }
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
public class DateTimeFormat <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                let codeId = FfiOHOSDateTimeFormatImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl DateTimeFormat failed: ${errCode}")
                }
                codeId
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?DateTimeOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, DateTimeOptions().toNative())
                    }
                    id = FfiOHOSDateTimeFormatImplConstructorwithLocale(cLocale.value, coptions, flag, inout errCode)
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                    }
                }
                id
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: Array<String>, options!: ?DateTimeOptions = None) {
        super(
            unsafe {
                let (flag, coptions) = match (options) {
                    case Some(v) => (0, v.toNative())
                    case None => (1, DateTimeOptions().toNative())
                }
                let localeArray: CArrString = try {
                    toArrayCString(locale)
                } catch (e: Exception) {
                    coptions.free()
                    throw e
                }
                var errCode = 0i32
                let id = FfiOHOSDateTimeFormatImplConstructorwithArrayLocale(localeArray, coptions, flag, inout errCode)
                coptions.free()
                localeArray.free()
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl DateTimeFormat failed: ${errCode}")
                }
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func resolvedOptions(): DateTimeOptions {
        unsafe {
            let cDateTimeOptions = FfiOHOSDateTimeFormatOptionsImplResolvedOptions(getID())
            let dateTimeOptions = cDateTimeOptions.toCJ()
            cDateTimeOptions.free()
            return dateTimeOptions
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
    public func format(date: DateTime): String {
        unsafe {
            let duration = date.toUnixTimeStamp()
            let datems = duration.toMilliseconds()
            let cres = FfiOHOSDateTimeFormatOptionsImplFormat(getID(), datems)
            if (cres.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let res = cres.toString()
            LibC.free(cres)
            return res
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
    public func formatRange(startDate: DateTime, endDate: DateTime): String {
        unsafe {
            let duration = startDate.toUnixTimeStamp()
            let satrt_datems = duration.toMilliseconds()
            let duration1 = endDate.toUnixTimeStamp()
            let end_datems = duration1.toMilliseconds()
            let cress = FfiOHOSDateTimeFormatOptionsImplFormatRange(getID(), satrt_datems, end_datems)
            if (cress.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let ress = cress.toString()
            LibC.free(cress)
            return ress
        }
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
public class Locale <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public prop language: String {
        get() {
            unsafe {
                let cLanguage = FfiOHOSLocaleImplGetLanguage(getID())
                if (cLanguage.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cLanguage.toString()
                LibC.free(cLanguage)
                res
            }
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
    public prop script: String {
        get() {
            unsafe {
                let cScript = FfiOHOSLocaleImplGetScript(getID())
                if (cScript.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cScript.toString()
                LibC.free(cScript)
                res
            }
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
    public prop region: String {
        get() {
            unsafe {
                let cRegion = FfiOHOSLocaleImplGetRegion(getID())
                if (cRegion.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cRegion.toString()
                LibC.free(cRegion)
                res
            }
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
    public prop baseName: String {
        get() {
            unsafe {
                let cBaseName = FfiOHOSLocaleImplGetBaseName(getID())
                if (cBaseName.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cBaseName.toString()
                LibC.free(cBaseName)
                res
            }
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
    public prop caseFirst: String {
        get() {
            unsafe {
                let cCaseFirst = FfiOHOSLocaleImplGetCaseFirst(getID())
                if (cCaseFirst.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cCaseFirst.toString()
                LibC.free(cCaseFirst)
                res
            }
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
    public prop calendar: String {
        get() {
            unsafe {
                let cCalendar = FfiOHOSLocaleImplGetCalendar(getID())
                if (cCalendar.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cCalendar.toString()
                LibC.free(cCalendar)
                res
            }
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
    public prop collation: String {
        get() {
            unsafe {
                let cCollation = FfiOHOSLocaleImplGetCollation(getID())
                if (cCollation.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cCollation.toString()
                LibC.free(cCollation)
                res
            }
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
    public prop hourCycle: String {
        get() {
            unsafe {
                let cHourCycle = FfiOHOSLocaleImplGetHourCycle(getID())
                if (cHourCycle.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cHourCycle.toString()
                LibC.free(cHourCycle)
                res
            }
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
    public prop numberingSystem: String {
        get() {
            unsafe {
                let cNumberingSystem = FfiOHOSLocaleImplGetNumberingSystem(getID())
                if (cNumberingSystem.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = cNumberingSystem.toString()
                LibC.free(cNumberingSystem)
                res
            }
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
    public prop numeric: Bool {
        get() {
            unsafe {
                let cNumeric = FfiOHOSLocaleImplGetNumeric(getID())
                if (cNumeric.isNull()) {
                    throw IllegalMemoryException("Failed malloc in C code!")
                }
                let res = (cNumeric.toString() == "true")
                LibC.free(cNumeric)
                res
            }
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
    public init() {
        super(
            unsafe {
                var errCode = 0i32
                let codeId = FfiOHOSLocaleImplConstructor(inout errCode)
                if (errCode != SUCCESS_CODE) {
                    throw BusinessException(errCode, "intl Locale failed: ${errCode}")
                }
                codeId
            })
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(locale: String, options!: ?LocaleOptions = None) {
        super(
            unsafe {
                var id = 0
                try (cLocale = LibC.mallocCString(locale).asResource()) {
                    var errCode = 0i32
                    let (flag, coptions) = match (options) {
                        case Some(v) => (0, v.toNative())
                        case None => (1, LocaleOptions().toNative())
                    }
                    id = FfiOHOSLocaleImplConstructorwithLocale(cLocale.value, coptions, flag, inout errCode)
                    coptions.free()
                    if (errCode != SUCCESS_CODE) {
                        throw BusinessException(errCode, "intl PluralRules failed: ${errCode}")
                    }
                }
                id
            })
    }

    ~init() {
        releaseFFIData(myDataId)
    }

    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        form: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public func toString(): String {
        unsafe {
            let cstr = FfiOHOSLocaleImplToString(getID())
            if (cstr.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let str = cstr.toString()
            LibC.free(cstr)
            return str
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
    public func maximize(): Locale {
        unsafe {
            let cmaximize = FfiOHOSLocaleImplMaximize(getID())
            if (cmaximize.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let max = cmaximize.toString()
            LibC.free(cmaximize)
            return Locale(max)
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
    public func minimize(): Locale {
        unsafe {
            let cminimize = FfiOHOSLocaleImplMinimize(getID())
            if (cminimize.isNull()) {
                throw IllegalMemoryException("Failed malloc in C code!")
            }
            let min = cminimize.toString()
            LibC.free(cminimize)
            return Locale(min)
        }
    }
}
