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

package ohos.input_method

import ohos.base.*
import ohos.labels.*
import ohos.hilog.*
import ohos.ffi.*
import std.collection.*
import std.sync.*
import ohos.ability.ElementName

let LOGGER = HilogChannel(0, 0xD001C10, "CJ-input-method")

// singleton
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getController(): InputMethodController {
    InputMethodController.INSTANCE
}

// singleton
@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getSetting(): InputMethodSetting {
    InputMethodSetting.INSTANCE
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getDefaultInputMethod(): InputMethodProperty {
    try (ptr = safeMalloc<CInputMethodProperty>().asResource()) {
        let code = unsafe { FfiInputMethodGetDefaultInputMethod(ptr.value) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "getDefaultInputMethod failed: ${errorCode}")
        }
        return unsafe { ptr.value.read().toInputMethodPropertyAndFree() }
    }
    throw BusinessException(EXCEPTION_IMENGINE, innerCodeToMsg(EXCEPTION_IMENGINE))
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getSystemInputMethodConfigAbility(): ElementName {
    try (ptr = safeMalloc<CElementName>().asResource()) {
        let code = unsafe { FfiInputMethodGetSystemInputMethodConfigAbility(ptr.value) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "getSystemInputMethodConfigAbility failed: ${errorCode}")
        }
        let ret = unsafe { ptr.value.read() }
        let result = ret.toElementName()
        ret.free()
        return result
    }
    throw BusinessException(EXCEPTION_IMENGINE, innerCodeToMsg(EXCEPTION_IMENGINE))
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getCurrentInputMethod(): InputMethodProperty {
    try (ptr = safeMalloc<CInputMethodProperty>().asResource()) {
        let code = unsafe { FfiInputMethodGetCurrentInputMethod(ptr.value) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "getCurrentInputMethod failed: ${errorCode}")
        }
        return unsafe { ptr.value.read().toInputMethodPropertyAndFree() }
    }
    throw BusinessException(EXCEPTION_IMENGINE, innerCodeToMsg(EXCEPTION_IMENGINE))
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public func getCurrentInputMethodSubtype(): InputMethodSubtype {
    try (ptr = safeMalloc<CInputMethodSubtype>().asResource()) {
        let code = unsafe { FfiInputMethodGetCurrentInputMethodSubtype(ptr.value) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "getCurrentInputMethodSubtype failed: ${errorCode}")
        }
        return unsafe { ptr.value.read().toInputMethodSubtypeAndFree() }
    }
    throw BusinessException(EXCEPTION_IMENGINE, innerCodeToMsg(EXCEPTION_IMENGINE))
}
