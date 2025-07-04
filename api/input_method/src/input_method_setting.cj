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
import ohos.ffi.*
import std.collection.*
import std.sync.*
import ohos.ability.ElementName

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputMethodSetting {
    static let INSTANCE = InputMethodSetting()
    let callbackList = ArrayList<CallbackObject>()
    let registered = AtomicBool(false)
    let settingMutex = Mutex()

    private init() {}

    private func findCallbackObject(callback: CallbackObject, remove!: Bool = false): Bool {
        synchronized(settingMutex) {
            for (idx in 0..callbackList.size) {
                if (refEq(callback, callbackList[idx])) {
                    if (remove) {
                        callbackList.remove(at: idx)
                    }
                    return true
                }
            }
            return false
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback2Argument<InputMethodProperty, InputMethodSubtype>): Unit {
        match (eventType) {
            case ImeChange => onImeChange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    private func onImeChange(callback: Callback2Argument<InputMethodProperty, InputMethodSubtype>): Unit {
        LOGGER.debug("subscribe imeChange")
        if (registered.compareAndSwap(false, true)) {
            let wrapper = {
                property: CInputMethodProperty, subprop: CInputMethodSubtype =>
                let imProp = unsafe { property.toInputMethodPropertyAndFree() }
                let imSubprop = unsafe { subprop.toInputMethodSubtypeAndFree() }
                let cbArray = synchronized(settingMutex) {
                    callbackList.toArray()
                }
                for (caller in cbArray) {
                    (caller as Callback2Argument<InputMethodProperty, InputMethodSubtype>)?.invoke(imProp, imSubprop)
                }
            }
            let registerCall = Callback2Param<CInputMethodProperty, CInputMethodSubtype, Unit>(wrapper)
            let code = synchronized(settingMutex) {
                unsafe { FfiInputMethodSettingOn(EVENT_IME_CHANGE_MASK, registerCall.getID()) }
            }
            if (code != SUCCESS_CODE) {
                let errorCode = innerCodeToErrCode(code)
                throw BusinessException(errorCode, "onImeChange failed: ${errorCode}")
            }
        } else {
            if (findCallbackObject(callback)) {
                LOGGER.info("[InputMethod] The callback object already exists.")
                return
            }
        }
        synchronized(settingMutex) {
            callbackList.add(callback)
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func off(
        eventType: IMFEventType,
        callback!: ?Callback2Argument<InputMethodProperty, InputMethodSubtype> = None
    ): Unit {
        match (eventType) {
            case ImeChange => offImeChange(callback: callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    private func offImeChange(callback!: ?Callback2Argument<InputMethodProperty, InputMethodSubtype> = None): Unit {
        LOGGER.debug("unsubscribe imeChange")
        match (callback) {
            case Some(v) =>
                if (!findCallbackObject(v, remove: true)) {
                    throw BusinessException(ERR_PARAMETER_ERROR, "Callback is not registered.")
                }
                synchronized(settingMutex) {
                    if (callbackList.isEmpty()) {
                        let code = unsafe { FfiInputMethodSettingOff(EVENT_IME_CHANGE_MASK) }
                        if (code != SUCCESS_CODE) {
                            let errorCode = innerCodeToErrCode(code)
                            throw BusinessException(errorCode, "offImeChange failed: ${errorCode}")
                        }
                        registered.compareAndSwap(true, false)
                    }
                }
            case None => synchronized(settingMutex) {
                if (registered.compareAndSwap(true, false)) {
                    let code = unsafe { FfiInputMethodSettingOff(EVENT_IME_CHANGE_MASK) }
                    if (code != SUCCESS_CODE) {
                        let errorCode = innerCodeToErrCode(code)
                        throw BusinessException(errorCode, "offImeChange failed: ${errorCode}")
                    }
                    callbackList.clear()
                }
                throw BusinessException(ERR_PARAMETER_ERROR, "Callback is not registered.")
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func listInputMethodSubtype(inputMethodProperty: InputMethodProperty): Array<InputMethodSubtype> {
        let cProp = CInputMethodProperty(inputMethodProperty)
        let ret = unsafe { FfiInputMethodSettingListInputMethodSubtype(cProp) }
        cProp.free()
        ret.getResultAndFree()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func listCurrentInputMethodSubtype(): Array<InputMethodSubtype> {
        let ret = unsafe { FfiInputMethodSettingListCurrentInputMethodSubtype() }
        ret.getResultAndFree()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func getInputMethods(enable: Bool): Array<InputMethodProperty> {
        let ret = unsafe { FfiInputMethodSettingGetInputMethods(enable) }
        ret.getResultAndFree()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func getAllInputMethods(): Array<InputMethodProperty> {
        let ret = unsafe { FfiInputMethodSettingGetAllInputMethods() }
        ret.getResultAndFree()
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func showOptionalInputMethods(): Bool {
        var result = false
        let code = unsafe { FfiInputMethodSettingShowOptionalInputMethods(inout result) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "showOptionalInputMethods failed: ${errorCode}")
        }
        result
    }
}
