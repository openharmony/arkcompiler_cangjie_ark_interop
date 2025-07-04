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

foreign {
    // NumberFormat
    func FfiOHOSNumberFormatImplFormat(id: Int64, number: Float64): CString

    func FfiOHOSNumberFormatImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSNumberFormatImplConstructorwithLocale(locale: CString, options: CNumberOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSNumberFormatImplConstructorwithArrayLocale(locale: CArrString, options: CNumberOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSNumberFormatImplGetNumberResolvedOptions(id: Int64): CNumberOptions
    // RelativeTimeFormat
    func FfiOHOSRelativeTimeFormatImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSRelativeTimeFormatImplConstructorwithLocale(locale: CString, options: CRelativeTimeFormatInputOptions,
        flag: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSRelativeTimeFormatImplConstructorwithArrayLocale(locale: CArrString,
        options: CRelativeTimeFormatInputOptions, flag: Int64, errCode: CPointer<Int32>): Int64

    func FfiOHOSRelativeTimeFormatImplFormat(id: Int64, value: Float64, unit: CString): CString

    func FfiOHOSRelativeTimeFormatImplFormatToParts(id: Int64, value: Float64, unit: CString): CArrArrString

    func FfiOHOSRelativeTimeFormatImplResolvedOptions(id: Int64): CRelativeTimeFormatResolvedOptions
    // PluralRules
    func FfiOHOSPluralRulesImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSPluralRulesImplConstructorwithLocale(locale: CString, options: CPluralRulesOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSPluralRulesImplConstructorwithArrayLocale(locale: CArrString, options: CPluralRulesOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSPluralRulesImplSelect(id: Int64, n: Float64): CString
    // Collator
    func FfiOHOSCollatorImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSCollatorImplConstructorwithLocale(locale: CString, options: CCollatorOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSCollatorImplConstructorwithArrayLocale(locale: CArrString, options: CCollatorOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSCollatorImplCompare(id: Int64, first: CString, second: CString): Int32

    func FfiOHOSCollatorOptionsImplResolvedOptions(id: Int64): CCollatorOptions
    // DateTimeFormat
    func FfiOHOSDateTimeFormatImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSDateTimeFormatImplConstructorwithLocale(locale: CString, options: CDateTimeOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSDateTimeFormatImplConstructorwithArrayLocale(locale: CArrString, options: CDateTimeOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSDateTimeFormatOptionsImplResolvedOptions(id: Int64): CDateTimeOptions

    func FfiOHOSDateTimeFormatOptionsImplFormat(id: Int64, date: Int64): CString

    func FfiOHOSDateTimeFormatOptionsImplFormatRange(id: Int64, startDate: Int64, endDate: Int64): CString
    // Locale
    func FfiOHOSLocaleImplConstructor(errCode: CPointer<Int32>): Int64

    func FfiOHOSLocaleImplConstructorwithLocale(locale: CString, options: CLocaleOptions, flag: Int64,
        errCode: CPointer<Int32>): Int64

    func FfiOHOSLocaleImplToString(id: Int64): CString

    func FfiOHOSLocaleImplMaximize(id: Int64): CString

    func FfiOHOSLocaleImplMinimize(id: Int64): CString

    func FfiOHOSLocaleImplGetLanguage(id: Int64): CString

    func FfiOHOSLocaleImplGetScript(id: Int64): CString

    func FfiOHOSLocaleImplGetRegion(id: Int64): CString

    func FfiOHOSLocaleImplGetBaseName(id: Int64): CString

    func FfiOHOSLocaleImplGetCaseFirst(id: Int64): CString

    func FfiOHOSLocaleImplGetCalendar(id: Int64): CString

    func FfiOHOSLocaleImplGetCollation(id: Int64): CString

    func FfiOHOSLocaleImplGetHourCycle(id: Int64): CString

    func FfiOHOSLocaleImplGetNumberingSystem(id: Int64): CString

    func FfiOHOSLocaleImplGetNumeric(id: Int64): CString
}

@C
struct CNumberOptions {
    var locale: CString = CString(CPointer<UInt8>())
    var currency: CString = CString(CPointer<UInt8>())
    var currencySign: CString = CString(CPointer<UInt8>())
    var currencyDisplay: CString = CString(CPointer<UInt8>())
    var unit: CString = CString(CPointer<UInt8>())
    var unitDispaly: CString = CString(CPointer<UInt8>())
    var unitUsage: CString = CString(CPointer<UInt8>())
    var signDisplay: CString = CString(CPointer<UInt8>())
    var compactDisplay: CString = CString(CPointer<UInt8>())
    var notation: CString = CString(CPointer<UInt8>())
    var localeMather: CString = CString(CPointer<UInt8>())
    var style: CString = CString(CPointer<UInt8>())
    var numberingSystem: CString = CString(CPointer<UInt8>())
    let useGrouping: Bool
    let minimumIntegerDigits: Int64
    let minimumFractionDigits: Int64
    let maximumFractionDigits: Int64
    let minimumSignificantDigits: Int64
    let maximumSignificantDigits: Int64

    init(options: NumberOptions) {
        try {
            unsafe {
                this.locale = LibC.mallocCString(options.locale)
                this.currency = LibC.mallocCString(options.currency)
                this.currencySign = LibC.mallocCString(options.currencySign)
                this.currencyDisplay = LibC.mallocCString(options.currencyDisplay)
                this.unit = LibC.mallocCString(options.unit)
                this.unitDispaly = LibC.mallocCString(options.unitDispaly)
                this.unitUsage = LibC.mallocCString(options.unitUsage)
                this.signDisplay = LibC.mallocCString(options.signDisplay)
                this.compactDisplay = LibC.mallocCString(options.compactDisplay)
                this.notation = LibC.mallocCString(options.notation)
                this.localeMather = LibC.mallocCString(options.localeMather)
                this.style = LibC.mallocCString(options.style)
                this.numberingSystem = LibC.mallocCString(options.numberingSystem)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(locale)
                LibC.free(currency)
                LibC.free(currencySign)
                LibC.free(currencyDisplay)
                LibC.free(unit)
                LibC.free(unitDispaly)
                LibC.free(unitUsage)
                LibC.free(signDisplay)
                LibC.free(compactDisplay)
                LibC.free(notation)
                LibC.free(localeMather)
                LibC.free(style)
                LibC.free(numberingSystem)
            }
        }
        this.useGrouping = options.useGrouping
        this.minimumIntegerDigits = options.minimumIntegerDigits
        this.minimumFractionDigits = options.minimumFractionDigits
        this.maximumFractionDigits = options.maximumFractionDigits
        this.minimumSignificantDigits = options.minimumSignificantDigits
        this.maximumSignificantDigits = options.maximumSignificantDigits
    }

    func free() {
        unsafe {
            LibC.free(this.locale)
            LibC.free(this.currency)
            LibC.free(this.currencySign)
            LibC.free(this.currencyDisplay)
            LibC.free(this.unit)
            LibC.free(this.unitDispaly)
            LibC.free(this.unitUsage)
            LibC.free(this.signDisplay)
            LibC.free(this.compactDisplay)
            LibC.free(this.notation)
            LibC.free(this.localeMather)
            LibC.free(this.style)
            LibC.free(this.numberingSystem)
        }
    }

    func toCJ(): NumberOptions {
        return NumberOptions(locale: this.locale.toString(), currency: this.currency.toString(),
            currencySign: this.currencySign.toString(), currencyDisplay: this.currencyDisplay.toString(),
            unit: this.unit.toString(), unitDispaly: this.unitDispaly.toString(), unitUsage: this.unitUsage.toString(),
            signDisplay: this.signDisplay.toString(), compactDisplay: this.compactDisplay.toString(),
            notation: this.notation.toString(), localeMather: this.localeMather.toString(), style: this.style.toString(),
            numberingSystem: this.numberingSystem.toString(), useGrouping: this.useGrouping,
            minimumIntegerDigits: this.minimumIntegerDigits, minimumFractionDigits: this.minimumFractionDigits,
            maximumFractionDigits: this.maximumFractionDigits, minimumSignificantDigits: this.minimumSignificantDigits,
            maximumSignificantDigits: this.maximumSignificantDigits)
    }
}

@C
struct CRelativeTimeFormatInputOptions {
    var localeMatcher: CString = CString(CPointer<UInt8>())
    var numeric: CString = CString(CPointer<UInt8>())
    var style: CString = CString(CPointer<UInt8>())

    init(options: RelativeTimeFormatInputOptions) {
        try {
            unsafe {
                this.localeMatcher = LibC.mallocCString(options.localeMatcher)
                this.numeric = LibC.mallocCString(options.numeric)
                this.style = LibC.mallocCString(options.style)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.localeMatcher)
                LibC.free(this.numeric)
                LibC.free(this.style)
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(this.localeMatcher)
            LibC.free(this.numeric)
            LibC.free(this.style)
        }
    }
}

@C
struct CRelativeTimeFormatResolvedOptions {
    let localeMatcher: CString
    let numeric: CString
    let style: CString
    let numberingSystem: CString

    init(localeMatcher: CString, numeric: CString, style: CString, numberingSystem: CString) {
        this.localeMatcher = localeMatcher
        this.numeric = numeric
        this.style = style
        this.numberingSystem = numberingSystem
    }

    func free() {
        unsafe {
            LibC.free(this.localeMatcher)
            LibC.free(this.numeric)
            LibC.free(this.style)
            LibC.free(this.numberingSystem)
        }
    }

    func toCJ(): RelativeTimeFormatResolvedOptions {
        return RelativeTimeFormatResolvedOptions(this.localeMatcher.toString(), this.numeric.toString(),
            this.style.toString(), this.numberingSystem.toString())
    }
}

@C
struct CArrArrString {
    CArrArrString(
        let head: CPointer<CArrString>,
        let size: Int64
    ) {}

    func toStringArrayArray(): Array<Array<String>> {
        Array<Array<String>>(size) {i => unsafe { head.read(i) }.toStringArray()}
    }

    func free(): Unit {
        unsafe {
            for (i in 0..size) {
                head.read(i).free()
            }
            LibC.free<CArrString>(head)
        }
    }
}

@C
struct CPluralRulesOptions {
    var localeMatcher: CString = CString(CPointer<UInt8>())
    var ptype: CString = CString(CPointer<UInt8>())
    let minimumIntegerDigits: Int64
    let minimumFractionDigits: Int64
    let maximumFractionDigits: Int64
    let minimumSignificantDigits: Int64
    let maximumSignificantDigits: Int64

    init(options: PluralRulesOptions) {
        try {
            unsafe {
                this.localeMatcher = LibC.mallocCString(options.localeMatcher)
                this.ptype = LibC.mallocCString(options.ptype)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.localeMatcher)
                LibC.free(this.ptype)
            }
        }
        this.minimumIntegerDigits = options.minimumIntegerDigits
        this.minimumFractionDigits = options.minimumFractionDigits
        this.maximumFractionDigits = options.maximumFractionDigits
        this.minimumSignificantDigits = options.minimumSignificantDigits
        this.maximumSignificantDigits = options.maximumSignificantDigits
    }

    func free() {
        unsafe {
            LibC.free(this.localeMatcher)
            LibC.free(this.ptype)
        }
    }
}

@C
struct CCollatorOptions {
    var localeMatcher: CString = CString(CPointer<UInt8>())
    var usage: CString = CString(CPointer<UInt8>())
    var sensitivity: CString = CString(CPointer<UInt8>())
    let ignorePunctuation: Bool
    var collation: CString = CString(CPointer<UInt8>())
    let numeric: Bool
    var caseFirst: CString = CString(CPointer<UInt8>())

    init(options: CollatorOptions) {
        try {
            unsafe {
                this.localeMatcher = LibC.mallocCString(options.localeMatcher)
                this.usage = LibC.mallocCString(options.usage)
                this.sensitivity = LibC.mallocCString(options.sensitivity)
                this.collation = LibC.mallocCString(options.collation)
                this.caseFirst = LibC.mallocCString(options.caseFirst)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.localeMatcher)
                LibC.free(this.usage)
                LibC.free(this.sensitivity)
                LibC.free(this.collation)
                LibC.free(this.caseFirst)
            }
        }

        this.ignorePunctuation = options.ignorePunctuation
        this.numeric = options.numeric
    }

    func free() {
        unsafe {
            LibC.free(this.localeMatcher)
            LibC.free(this.usage)
            LibC.free(this.sensitivity)
            LibC.free(this.collation)
            LibC.free(this.caseFirst)
        }
    }

    func toCJ(): CollatorOptions {
        return CollatorOptions(localeMatcher: this.localeMatcher.toString(), usage: this.usage.toString(),
            sensitivity: this.sensitivity.toString(), ignorePunctuation: this.ignorePunctuation,
            collation: this.collation.toString(), numeric: this.numeric, caseFirst: this.caseFirst.toString())
    }
}

@C
struct CDateTimeOptions {
    var locale: CString = CString(CPointer<UInt8>())
    var dateStyle: CString = CString(CPointer<UInt8>())
    var timeStyle: CString = CString(CPointer<UInt8>())
    var hourCycle: CString = CString(CPointer<UInt8>())
    var timeZone: CString = CString(CPointer<UInt8>())
    var numberingSystem: CString = CString(CPointer<UInt8>())
    let hour12: Bool
    var weekday: CString = CString(CPointer<UInt8>())
    var era: CString = CString(CPointer<UInt8>())
    var year: CString = CString(CPointer<UInt8>())
    var month: CString = CString(CPointer<UInt8>())
    var day: CString = CString(CPointer<UInt8>())
    var hour: CString = CString(CPointer<UInt8>())
    var minute: CString = CString(CPointer<UInt8>())
    var second: CString = CString(CPointer<UInt8>())
    var timeZoneName: CString = CString(CPointer<UInt8>())
    var dayPeriod: CString = CString(CPointer<UInt8>())
    var localeMatcher: CString = CString(CPointer<UInt8>())
    var formatMatcher: CString = CString(CPointer<UInt8>())

    init(options: DateTimeOptions) {
        try {
            unsafe {
                this.locale = LibC.mallocCString(options.locale)
                this.dateStyle = LibC.mallocCString(options.dateStyle)
                this.timeStyle = LibC.mallocCString(options.timeStyle)
                this.hourCycle = LibC.mallocCString(options.hourCycle)
                this.timeZone = LibC.mallocCString(options.timeZone)
                this.numberingSystem = LibC.mallocCString(options.numberingSystem)
                this.weekday = LibC.mallocCString(options.weekday)
                this.era = LibC.mallocCString(options.era)
                this.year = LibC.mallocCString(options.year)
                this.month = LibC.mallocCString(options.month)
                this.day = LibC.mallocCString(options.day)
                this.hour = LibC.mallocCString(options.hour)
                this.minute = LibC.mallocCString(options.minute)
                this.second = LibC.mallocCString(options.second)
                this.timeZoneName = LibC.mallocCString(options.timeZoneName)
                this.dayPeriod = LibC.mallocCString(options.dayPeriod)
                this.localeMatcher = LibC.mallocCString(options.localeMatcher)
                this.formatMatcher = LibC.mallocCString(options.formatMatcher)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.locale)
                LibC.free(this.dateStyle)
                LibC.free(this.timeStyle)
                LibC.free(this.hourCycle)
                LibC.free(this.timeZone)
                LibC.free(this.numberingSystem)
                LibC.free(this.weekday)
                LibC.free(this.era)
                LibC.free(this.year)
                LibC.free(this.month)
                LibC.free(this.day)
                LibC.free(this.hour)
                LibC.free(this.minute)
                LibC.free(this.second)
                LibC.free(this.timeZoneName)
                LibC.free(this.dayPeriod)
                LibC.free(this.localeMatcher)
                LibC.free(this.formatMatcher)
            }
        }
        this.hour12 = options.hour12
    }

    func free() {
        unsafe {
            LibC.free(this.locale)
            LibC.free(this.dateStyle)
            LibC.free(this.timeStyle)
            LibC.free(this.hourCycle)
            LibC.free(this.timeZone)
            LibC.free(this.numberingSystem)
            LibC.free(this.weekday)
            LibC.free(this.era)
            LibC.free(this.year)
            LibC.free(this.month)
            LibC.free(this.day)
            LibC.free(this.hour)
            LibC.free(this.minute)
            LibC.free(this.second)
            LibC.free(this.timeZoneName)
            LibC.free(this.dayPeriod)
            LibC.free(this.localeMatcher)
            LibC.free(this.formatMatcher)
        }
    }

    func toCJ(): DateTimeOptions {
        return DateTimeOptions(locale: this.locale.toString(), dateStyle: this.dateStyle.toString(),
            timeStyle: this.timeStyle.toString(), hourCycle: this.hourCycle.toString(),
            timeZone: this.timeZone.toString(), numberingSystem: this.numberingSystem.toString(), hour12: this.hour12,
            weekday: this.weekday.toString(), era: this.era.toString(), year: this.year.toString(),
            month: this.month.toString(), day: this.day.toString(), hour: this.hour.toString(),
            minute: this.minute.toString(), second: this.second.toString(), timeZoneName: this.timeZoneName.toString(),
            dayPeriod: this.dayPeriod.toString(), localeMatcher: this.localeMatcher.toString(),
            formatMatcher: this.formatMatcher.toString())
    }
}

@C
struct CLocaleOptions {
    var calendar: CString = CString(CPointer<UInt8>())
    var collation: CString = CString(CPointer<UInt8>())
    var hourCycle: CString = CString(CPointer<UInt8>())
    var numberingSystem: CString = CString(CPointer<UInt8>())
    let numeric: Bool
    var caseFirst: CString = CString(CPointer<UInt8>())

    init(options: LocaleOptions) {
        try {
            unsafe {
                this.calendar = LibC.mallocCString(options.calendar)
                this.collation = LibC.mallocCString(options.collation)
                this.hourCycle = LibC.mallocCString(options.hourCycle)
                this.numberingSystem = LibC.mallocCString(options.numberingSystem)
                this.caseFirst = LibC.mallocCString(options.caseFirst)
            }
        } catch (e: Exception) {
            unsafe {
                LibC.free(this.calendar)
                LibC.free(this.collation)
                LibC.free(this.hourCycle)
                LibC.free(this.numberingSystem)
                LibC.free(this.caseFirst)
            }
        }
        this.numeric = options.numeric
    }

    func free() {
        unsafe {
            LibC.free(this.calendar)
            LibC.free(this.collation)
            LibC.free(this.hourCycle)
            LibC.free(this.numberingSystem)
            LibC.free(this.caseFirst)
        }
    }

    func toCJ(): LocaleOptions {
        return LocaleOptions(calendar: this.calendar.toString(), collation: this.collation.toString(),
            hourCycle: this.hourCycle.toString(), numberingSystem: this.numberingSystem.toString(),
            numeric: this.numeric, caseFirst: this.caseFirst.toString())
    }
}
