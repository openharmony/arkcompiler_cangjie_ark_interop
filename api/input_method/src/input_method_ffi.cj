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
import ohos.ffi.*
import ohos.ability.ElementName

foreign {
    func FfiInputMethodGetDefaultInputMethod(props: CPointer<CInputMethodProperty>): Int32

    func FfiInputMethodGetCurrentInputMethod(props: CPointer<CInputMethodProperty>): Int32

    func FfiInputMethodSwitchInputMethod(result: CPointer<Bool>, target: CInputMethodProperty): Int32

    func FfiInputMethodSwitchCurrentInputMethodSubtype(result: CPointer<Bool>, target: CInputMethodSubtype): Int32

    func FfiInputMethodGetCurrentInputMethodSubtype(props: CPointer<CInputMethodSubtype>): Int32

    func FfiInputMethodSwitchCurrentInputMethodAndSubtype(result: CPointer<Bool>, target: CInputMethodProperty,
        subType: CInputMethodSubtype): Int32

    func FfiInputMethodGetSystemInputMethodConfigAbility(result: CPointer<CElementName>): Int32

    func FfiInputMethodSettingListInputMethodSubtype(props: CInputMethodProperty): RetInputMethodSubtype

    func FfiInputMethodSettingListCurrentInputMethodSubtype(): RetInputMethodSubtype

    func FfiInputMethodSettingGetInputMethods(enable: Bool): RetInputMethodProperty

    func FfiInputMethodSettingGetAllInputMethods(): RetInputMethodProperty

    func FfiInputMethodSettingOn(callbackType: UInt32, id: Int64): Int32

    func FfiInputMethodSettingOff(callbackType: UInt32): Int32

    func FfiInputMethodSettingShowOptionalInputMethods(result: CPointer<Bool>): Int32

    func FfiInputMethodControllerOn(callbackType: Int8, id: Int64): Int32

    func FfiInputMethodControllerOff(callbackType: Int8): Int32

    func FfiInputMethodControllerAttach(showKeyboard: Bool, textConfig: CTextConfig): Int32

    func FfiInputMethodControllerAttachWithReason(showKeyboard: Bool, textConfig: CTextConfig, reason: Int32): Int32

    func FfiInputMethodControllerDetach(): Int32

    func FfiInputMethodControllerShowTextInput(): Int32

    func FfiInputMethodControllerShowTextInputWithReason(reason: Int32): Int32

    func FfiInputMethodControllerHideTextInput(): Int32

    func FfiInputMethodControllerSetCallingWindow(windowId: UInt32): Int32

    func FfiInputMethodControllerUpdateCursor(cursor: CCursorInfo): Int32

    func FfiInputMethodControllerChangeSelection(text: CString, start: Int32, end: Int32): Int32

    func FfiInputMethodControllerUpdateAttribute(inputArrtibute: CInputAttribute): Int32

    func FfiInputMethodControllerShowSoftKeyboard(): Int32

    func FfiInputMethodControllerHideSoftKeyboard(): Int32

    func FfiInputMethodControllerStopInputSession(): Int32
}

@C
struct CInputMethodProperty {
    CInputMethodProperty(
        var name: CString,
        var id: CString,
        var label: CString,
        var labelId: UInt32,
        var icon: CString,
        var iconId: UInt32
    ) {}

    unsafe func toInputMethodPropertyAndFree(): InputMethodProperty {
        return try {
            InputMethodProperty(name.toString(), id.toString(), label.toString(), labelId, icon.toString(), iconId)
        } finally {
            free()
        }
    }

    init(props: InputMethodProperty) {
        this.name = CString(CPointer())
        this.id = CString(CPointer())
        this.label = CString(CPointer())
        this.icon = CString(CPointer())
        this.labelId = props.labelId
        this.iconId = props.iconId
        unsafe {
            try {
                this.name = LibC.mallocCString(props.name)
                this.id = LibC.mallocCString(props.id)
                this.label = LibC.mallocCString(props.label)
                this.icon = LibC.mallocCString(props.icon)
            } catch (e: Exception) {
                LibC.free(name)
                LibC.free(id)
                LibC.free(label)
                throw e
            }
        }
    }

    func free() {
        unsafe {
            LibC.free(name)
            LibC.free(id)
            LibC.free(label)
            LibC.free(icon)
        }
    }
}

@C
struct CInputMethodSubtype {
    CInputMethodSubtype(
        var name: CString,
        var id: CString,
        var locale: CString,
        var language: CString,
        var label: CString,
        var labelId: UInt32,
        var icon: CString,
        var iconId: UInt32,
        var mode: CString
    ) {}

    unsafe func toInputMethodSubtypeAndFree(): InputMethodSubtype {
        return try {
            InputMethodSubtype(name.toString(), id.toString(), locale.toString(), language.toString(), label.toString(),
                labelId, icon.toString(), iconId, mode.toString())
        } finally {
            free()
        }
    }

    func free() {
        unsafe {
            LibC.free(name)
            LibC.free(id)
            LibC.free(label)
            LibC.free(icon)
            LibC.free(locale)
            LibC.free(language)
            LibC.free(mode)
        }
    }
}

unsafe func mallocStringOp(str: ?String): CString {
    match (str) {
        case Some(v) => LibC.mallocCString(v)
        case None => CString(CPointer<UInt8>())
    }
}

@C
struct RetInputMethodSubtype {
    RetInputMethodSubtype(
        let code: Int32,
        let size: Int64,
        let head: CPointer<CInputMethodSubtype>
    ) {}

    func getResultAndFree() {
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "get inputMethod subtype failed: ${errorCode}")
        }
        let ret = try {
            unsafe {
                cArr2cjArr<CInputMethodSubtype, InputMethodSubtype>(size, head,
                    {
                        item => item.toInputMethodSubtypeAndFree()
                    })
            }
        } finally {
            unsafe { LibC.free(head) }
        }
        ret
    }
}

@C
struct RetInputMethodProperty {
    RetInputMethodProperty(
        let code: Int32,
        let size: Int64,
        let head: CPointer<CInputMethodProperty>
    ) {}

    func getResultAndFree() {
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "get inputMethod failed: ${errorCode}")
        }
        let ret = try {
            unsafe {
                cArr2cjArr<CInputMethodProperty, InputMethodProperty>(size, head,
                    {
                        item => item.toInputMethodPropertyAndFree()
                    })
            }
        } finally {
            unsafe { LibC.free(head) }
        }
        ret
    }
}

@C
struct CElementName {
    CElementName(
        let deviceId: CString,
        let bundleName: CString,
        let abilityName: CString,
        let moduleName: CString
    ) {}

    func free() {
        unsafe {
            LibC.free(deviceId)
            LibC.free(bundleName)
            LibC.free(abilityName)
            LibC.free(moduleName)
        }
    }

    func toElementName(): ElementName {
        ElementName(
            deviceId.toString(),
            bundleName.toString(),
            abilityName.toString(),
            moduleName.toString()
        )
    }
}

@C
struct CInputAttribute {
    let textInputType: Int8
    let enterKeyType: Int8
    init(input: InputAttribute) {
        textInputType = input.textInputType.getValue()
        enterKeyType = input.enterKeyType.getValue()
    }
}

@C
struct CTextConfig {
    let cInput: CInputAttribute
    let cursorInfo: CCursorInfo
    let range: CRange
    let windowId: UInt32

    init(textConfig: TextConfig) {
        cInput = CInputAttribute(textConfig.inputAttribute)
        cursorInfo = textConfig.cursorInfo.toCCursorInfo()
        range = textConfig.selection.toCRange()
        windowId = textConfig.windowId
    }
}

@C
struct CCursorInfo {
    CCursorInfo(
        let left: Float64,
        let top: Float64,
        let width: Float64,
        let height: Float64
    ) {}
}

@C
struct CRange {
    CRange(
        let start: Int32,
        let end: Int32
    ) {}

    func toRange(): Range {
        Range(start, end)
    }
}
