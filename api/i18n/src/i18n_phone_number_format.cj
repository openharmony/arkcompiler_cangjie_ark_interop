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
    func FfiI18nPhoneNumberFormatConstructor(country: CString, formatType: CString): Int64

    func FfiI18nPhoneNumberFormatFormat(remoteDataID: Int64, number: CString): CString

    func FfiI18nPhoneNumberFormatIsValidNumber(remoteDataID: Int64, number: CString): Bool

    func FfiI18nPhoneNumberFormatGetLocationName(remoteDataID: Int64, number: CString, locale: CString): CString
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class PhoneNumberFormatOptions {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public PhoneNumberFormatOptions(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Global.I18n"
        ]
        public let formatType!: ?String = None
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class PhoneNumberFormat <: RemoteDataLite {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public init(country: String, options!: ?PhoneNumberFormatOptions = None) {
        super(
            unsafe {
                let cCountry = LibC.mallocCString(country)
                var formatType = CString(CPointer<UInt8>())
                if (let Some(v) <- options && let Some(t) <- v.formatType) {
                    try {
                        formatType = LibC.mallocCString(t)
                    } catch (e: Exception) {
                        LibC.free(cCountry)
                        throw e
                    }
                }
                let id = FfiI18nPhoneNumberFormatConstructor(cCountry, formatType)
                LibC.free(cCountry)
                LibC.free(formatType)
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
    public func format(number: String): String {
        unsafe {
            var result = ""
            try (cNumber = LibC.mallocCString(number).asResource()) {
                let cStr = FfiI18nPhoneNumberFormatFormat(getID(), cNumber.value)
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
    public func isValidNumber(number: String): Bool {
        unsafe {
            var result = false
            try (cNumber = LibC.mallocCString(number).asResource()) {
                result = FfiI18nPhoneNumberFormatIsValidNumber(getID(), cNumber.value)
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
    public func getLocationName(number: String, locale: String): String {
        unsafe {
            var result = ""
            try (
                cNumber = LibC.mallocCString(number).asResource(),
                cLocale = LibC.mallocCString(locale).asResource()
            ) {
                let cStr = FfiI18nPhoneNumberFormatGetLocationName(getID(), cNumber.value, cLocale.value)
                result = cStr.toString()
                LibC.free(cStr)
            }
            return result
        }
    }
}
