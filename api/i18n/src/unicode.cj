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
    func FfiI18nUnicodeGetType(text: CString): CString

    func FfiI18nUnicodeIsUpperCase(text: CString): Bool

    func FfiI18nUnicodeIsLowerCase(text: CString): Bool

    func FfiI18nUnicodeIsLetter(text: CString): Bool

    func FfiI18nUnicodeIsIdeograph(text: CString): Bool

    func FfiI18nUnicodeIsRTL(text: CString): Bool

    func FfiI18nUnicodeIsWhitespace(text: CString): Bool

    func FfiI18nUnicodeIsSpaceChar(text: CString): Bool

    func FfiI18nUnicodeIsDigit(text: CString): Bool
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Global.I18n"
]
public class Unicode {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Global.I18n"
    ]
    public static func getType(text: String): String {
        unsafe {
            var result = ""
            try (cText = LibC.mallocCString(text).asResource()) {
                let cStr = FfiI18nUnicodeGetType(cText.value)
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
    public static func isUpperCase(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsUpperCase(cText.value)
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
    public static func isLowerCase(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsLowerCase(cText.value)
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
    public static func isLetter(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsLetter(cText.value)
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
    public static func isIdeograph(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsIdeograph(cText.value)
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
    public static func isRTL(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsRTL(cText.value)
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
    public static func isWhitespace(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsWhitespace(cText.value)
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
    public static func isSpaceChar(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsSpaceChar(cText.value)
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
    public static func isDigit(text: String): Bool {
        unsafe {
            var result = false
            try (cText = LibC.mallocCString(text).asResource()) {
                result = FfiI18nUnicodeIsDigit(cText.value)
            }
            return result
        }
    }
}
