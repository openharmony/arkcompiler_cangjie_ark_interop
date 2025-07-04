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

import ohos.labels.*
import ohos.base.*
import ohos.ffi.*
import std.collection.*
import std.sync.*
import std.collection.*
import ohos.ability.ElementName

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.MiscServices.InputMethodFramework"
]
public class InputMethodController {
    static let INSTANCE = InputMethodController()
    let callbackMap = HashMap<Int8, ArrayList<CallbackObject>>()
    let registry = Array<AtomicBool>(12, {_ => AtomicBool(false)})
    let attached = AtomicBool(false)
    let mapMutex = Mutex()
    let listMutex = Mutex()

    private init() {}

    /**
     * Bind the input method to the self-drawn control.
     *
     * @param { Bool } showKeyboard - Indicates whether to start the input method keyboard after the input method is bound successfully.
     * @param { TextConfig } textConfig - Configuration information of the edit box.
     * @throws { BusinessException } 401 - parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @brief attach(showKeyboard: boolean, textConfig: TextConfig): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func attach(showKeyboard: Bool, textConfig: TextConfig): Unit {
        let ctextCfg = CTextConfig(textConfig)
        let ret = unsafe { FfiInputMethodControllerAttach(showKeyboard, ctextCfg) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "attach failed: ${innerCodeToMsg(ret)}")
        }
        attached.store(true)
    }

    /**
     * Attach application to the input method service.
     *
     * @param { Bool } showKeyboard - show the keyboard or not when attach the input method.
     * @param { TextConfig } textConfig - indicates the config of the textInput.
     * @param { RequestKeyboardReason } requestKeyboardReason - requestKeyboardReason of show the keyboard .
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @relation attach(showKeyboard: boolean, textConfig: TextConfig, requestKeyboardReason: RequestKeyboardReason): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func attach(showKeyboard: Bool, textConfig: TextConfig, requestKeyboardReason: RequestKeyboardReason): Unit {
        let ctextCfg = CTextConfig(textConfig)
        let ret = unsafe { FfiInputMethodControllerAttachWithReason(showKeyboard, ctextCfg,
            requestKeyboardReason.getValue()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "${innerCodeToMsg(ret)}")
        }
        attached.store(true)
    }

    /**
     * Unbind the self-drawn control from the input method.
     *
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @brief detach(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func detach(): Unit {
        let ret = unsafe { FfiInputMethodControllerDetach() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "detach failed: ${innerCodeToMsg(ret)}")
        }
        attached.store(false)
    }

    /**
     * Enter the text editing status.
     *
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief showTextInput(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func showTextInput(): Unit {
        let ret = unsafe { FfiInputMethodControllerShowTextInput() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "showTextInput failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Show the text input and start typing.
     *
     * @param { RequestKeyboardReason } requestKeyboardReason - requestKeyboardReason of show the keyboard .
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client detached.
     * @relation showTextInput(requestKeyboardReason: RequestKeyboardReason): Promise<void>;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func showTextInput(requestKeyboardReason: RequestKeyboardReason): Unit {
        let ret = unsafe { FfiInputMethodControllerShowTextInputWithReason(requestKeyboardReason.getValue()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Exit the text editing status.
     *
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief hideTextInput(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func hideTextInput(): Unit {
        let ret = unsafe { FfiInputMethodControllerHideTextInput() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "hideTextInput failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Sets the window to avoid the soft keyboard.
     *
     * @param { UInt32 } windowId - ID of the window where the application bound to the input method application is located.
     * @throws { BusinessException } 401 - parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief setCallingWindow(windowId: number): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func setCallingWindow(windowId: UInt32): Unit {
        let ret = unsafe { FfiInputMethodControllerSetCallingWindow(windowId) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "setCallingWindow failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * When the cursor information in the edit box changes, call this interface to make the input method sense the cursor change.
     *
     * @param { CursorInfo } cursorInfo - Cursor information.
     * @throws { BusinessException } 401 - parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief updateCursor(cursorInfo: CursorInfo): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func updateCursor(cursorInfo: CursorInfo): Unit {
        let ret = unsafe { FfiInputMethodControllerUpdateCursor(cursorInfo.toCCursorInfo()) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "updateCursor failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * When content of the selected text information or a text range in the edit box changes, this interface may be
     * called to update the text information, so that an input method application senses the change.
     *
     * @param { String } text - The entire input text.
     * @param { Int32 } start - The starting position of the selected text.
     * @param { Int32 } end - End position of the selected text.
     * @throws { BusinessException } 401 - parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief changeSelection(text: string, start: number, end: number): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func changeSelection(text: String, start: Int32, end: Int32): Unit {
        try (txt = unsafe { LibC.mallocCString(text).asResource() }) {
            let ret = unsafe { FfiInputMethodControllerChangeSelection(txt.value, start, end) }
            if (ret != SUCCESS_CODE) {
                throw BusinessException(innerCodeToErrCode(ret), "changeSelection failed: ${innerCodeToMsg(ret)}")
            }
        }
    }

    /**
     * Updates the edit box attribute information.
     *
     * @param { InputAttribute } attribute - The edit box properties object.
     * @throws { BusinessException } 401 - parameter error. Possible causes: 1. Mandatory parameters are left unspecified; 2. Incorrect parameter types.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief updateAttribute(attribute: InputAttribute): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func updateAttribute(attribute: InputAttribute): Unit {
        let cAttribute = CInputAttribute(attribute)
        let ret = unsafe { FfiInputMethodControllerUpdateAttribute(cAttribute) }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "updateAttribute failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Ends the input session.
     *
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @brief stopInputSession(): Promise<boolean>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func stopInputSession(): Bool {
        let ret = unsafe { FfiInputMethodControllerStopInputSession() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "stopInputSession failed: ${innerCodeToMsg(ret)}")
        }
        return true
    }

    /**
     * Displays the input method soft keyboard.
     *
     * @throws { BusinessException } 201 - permissions check fails.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @brief showSoftKeyboard(): Promise<void>
     */
    @!APILevel[
        19,
        permission: "ohos.permission.CONNECT_IME_ABILITY",
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func showSoftKeyboard(): Unit {
        let ret = unsafe { FfiInputMethodControllerShowSoftKeyboard() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "showSoftKeyboard failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Hides the input method soft keyboard.
     *
     * @throws { BusinessException } 201 - permissions check fails.
     * @throws { BusinessException } 12800003 - input method client error.
     * @throws { BusinessException } 12800008 - input method manager service error.
     * @brief hideSoftKeyboard(): Promise<void>
     */
    @!APILevel[
        19,
        permission: "ohos.permission.CONNECT_IME_ABILITY",
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func hideSoftKeyboard(): Unit {
        let ret = unsafe { FfiInputMethodControllerHideSoftKeyboard() }
        if (ret != SUCCESS_CODE) {
            throw BusinessException(innerCodeToErrCode(ret), "hideSoftKeyboard failed: ${innerCodeToMsg(ret)}")
        }
    }

    /**
     * Subscribe to the text insertion event of the IME application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<String> } callback -
            Callback function, Operates the content in the text box in the callback function based on the input text.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'insertText', callback: (text: string) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<String>): Unit {
        match (eventType) {
            case InsertText => onInsertText(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the input method application leftward(or rightward) deletion event.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<Int32> } callback -
            Operates the text in the edit box in the callback function based on the input length to be deleted.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'deleteLeft', callback: (length: number) => void): void
     * @brief on(type: 'deleteRight', callback: (length: number) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<Int32>): Unit {
        match (eventType) {
            case DeleteLeft => onDeleteLeft(callback)
            case DeleteRight => onDeleteRight(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the keyboard status event sent by the input method application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<KeyboardStatus> } callback -
            Performs the corresponding operation, for example, cut or copy, based on the extended editing operation type.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'sendKeyboardStatus', callback: (action: KeyboardStatus) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<KeyboardStatus>): Unit {
        match (eventType) {
            case SendKeyboardStatus => onSendKeyboardStatus(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the function key event sent by the input method application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<FunctionKey> } callback -
            Performs the corresponding operation, for example, cut or copy, based on the extended editing operation type.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'sendFunctionKey', callback: (action: FunctionKey) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<FunctionKey>): Unit {
        match (eventType) {
            case SendFunctionKey => onSendFunctionKey(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the function key event sent by the input method application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<Direction> } callback -
            Performs the corresponding operation, for example, cut or copy, based on the extended editing operation type.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'sendFunctionKey', callback: (action: Direction) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<Direction>): Unit {
        match (eventType) {
            case MoveCursor => onMoveCursor(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the extended editing operation event sent by the input method application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<ExtendAction> } callback -
            Performs the corresponding operation, for example, cut or copy, based on the extended editing operation type.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'handleExtendAction', callback: (action: ExtendAction) => void): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<ExtendAction>): Unit {
        match (eventType) {
            case HandleExtendAction => onHandleExtendAction(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the text input method application to obtain the text event of the specified length on the
        left(or right) of the cursor.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1ArgumentWithReturn<Int32, String> } callback -
            Callback function for obtaining and returning the text of the specified length on the left of the cursor in
            the latest edit box state.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'getLeftTextOfCursor', callback: (length: number) => string): void
     * @brief on(type: 'getRightTextOfCursor', callback: (length: number) => string): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1ArgumentWithReturn<Int32, String>): Unit {
        match (eventType) {
            case GetLeftTextOfCursor => onGetLeftTextOfCursor(callback)
            case GetRightTextOfCursor => onGetRightTextOfCursor(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the input method application to obtain the text index event at the cursor.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { CallbackWithReturn<Int32> } callback -
            Callback function used to obtain the text index of the cursor in the latest edit box status and return the
            index.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'getTextIndexAtCursor', callback: () => number): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: CallbackWithReturn<Int32>): Unit {
        match (eventType) {
            case GetTextIndexAtCursor => onGetTextIndexAtCursor(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the event of selecting text by range in the IME.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<Range> } callback -
            Based on the input text range, the developer edits the corresponding text in the callback function.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @brief on(type: 'selectByRange', callback: Callback<Range>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<Range>): Unit {
        match (eventType) {
            case SelectByRange => onSelectByRange(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Subscribe to the text selection event in the cursor movement direction of the input method application.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { Callback1Argument<Movement> } callback -
            Selects the text in the edit box based on the cursor moving direction.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @brief on(type: 'selectByMovement', callback: Callback<Movement>): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func on(eventType: IMFEventType, callback: Callback1Argument<Movement>): Unit {
        match (eventType) {
            case SelectByMovement => onSelectByMovement(callback)
            case _ => throw BusinessException(ERR_PARAMETER_ERROR, "${eventType} is not supported.")
        }
    }

    /**
     * Unsubscribe from the text insertion event of the input method app.
     *
     * @param { IMFEventType } eventType - Event type for callback.
     * @param { ?CallbackObject } callback -
            Subscription cancellation callback function, which must be the same as that transferred by the on interface.
            If this parameter is not specified, all callback events corresponding to type are unsubscribed from.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief off(type: 'insertText', callback?: (text: string) => void): void
     * @brief off(type: 'deleteLeft', callback?: (length: number) => void): void
     * @brief off(type: 'deleteRight', callback?: (length: number) => void): void
     * @brief off(type: 'sendKeyboardStatus', callback?: (keyboardStatus: KeyboardStatus) => void): void
     * @brief off(type: 'sendFunctionKey', callback?: (functionKey: FunctionKey) => void): void
     * @brief off(type: 'moveCursor', callback?: (direction: Direction) => void): void
     * @brief off(type: 'handleExtendAction', callback?: (action: ExtendAction) => void): void
     * @brief off(type: 'selectByRange', callback?: Callback<Range>): void
     * @brief off(type: 'selectByMovement', callback?: Callback<Movement>): void
     * @brief off(type: 'getLeftTextOfCursor', callback?: (length: number) => string): void
     * @brief off(type: 'getRightTextOfCursor', callback?: (length: number) => string): void
     * @brief off(type: 'getTextIndexAtCursor', callback?: () => number): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.MiscServices.InputMethodFramework"
    ]
    public func off(eventType: IMFEventType, callback!: ?CallbackObject = None): Unit {
        match (eventType) {
            case ImeChange => throw BusinessException(ERR_PARAMETER_ERROR, "imeChange is not supported.")
            case _ => commonUnSubscribe(eventType, callback: callback)
        }
    }

    private func onInsertText(callback: Callback1Argument<String>): Unit {
        commonSubscribe<CString, String>(InsertText, callback) {
            ctext: CString => return ctext.toString()
        }
    }

    private func onDeleteLeft(callback: Callback1Argument<Int32>): Unit {
        commonSubscribe<Int32, Int32>(DeleteLeft, callback) {
            length: Int32 => length
        }
    }

    private func onDeleteRight(callback: Callback1Argument<Int32>): Unit {
        commonSubscribe<Int32, Int32>(DeleteRight, callback) {
            length: Int32 => length
        }
    }

    private func onSendKeyboardStatus(callback: Callback1Argument<KeyboardStatus>): Unit {
        commonSubscribe<Int32, KeyboardStatus>(SendKeyboardStatus, callback) {
            status: Int32 => KeyboardStatus.of(status)
        }
    }

    private func onSendFunctionKey(callback: Callback1Argument<FunctionKey>): Unit {
        commonSubscribe<Int32, FunctionKey>(SendFunctionKey, callback) {
            key: Int32 => FunctionKey(EnterKeyType.of(key))
        }
    }

    private func onMoveCursor(callback: Callback1Argument<Direction>): Unit {
        commonSubscribe<Int32, Direction>(MoveCursor, callback) {
            direcion: Int32 => Direction.of(direcion)
        }
    }

    private func onHandleExtendAction(callback: Callback1Argument<ExtendAction>): Unit {
        commonSubscribe<Int32, ExtendAction>(HandleExtendAction, callback) {
            action: Int32 => ExtendAction.of(action)
        }
    }

    private func onSelectByRange(callback: Callback1Argument<Range>): Unit {
        commonSubscribe<CRange, Range>(SelectByRange, callback) {
            range: CRange => range.toRange()
        }
    }

    private func onSelectByMovement(callback: Callback1Argument<Movement>): Unit {
        commonSubscribe<Int32, Movement>(SelectByMovement, callback) {
            movement: Int32 => Movement(Direction.of(movement))
        }
    }

    private func onGetLeftTextOfCursor(callback: Callback1ArgumentWithReturn<Int32, String>): Unit {
        subscribeS2CS(GetLeftTextOfCursor, callback) {
            str: String => return unsafe { LibC.mallocCString(str) }
        }
    }

    /**
     * Subscribe to the text input method application to obtain the text event of the specified length on the right of
        the cursor.
     *
     * @param { Callback1ArgumentWithReturn<Int32, String> } callback -
            Callback function for obtaining and returning the text of the specified length on the right of the cursor in
            the latest edit box state.
     * @throws { BusinessException } 401 - parameter error.
            Possible causes:
            1. Mandatory parameters are left unspecified;
            2. Incorrect parameter types;
            3. Parameter verification failed.
     * @throws { BusinessException } 12800009 - input method client is detached.
     * @brief on(type: 'getRightTextOfCursor', callback: (length: number) => string): void
     */
    private func onGetRightTextOfCursor(callback: Callback1ArgumentWithReturn<Int32, String>): Unit {
        subscribeS2CS(GetRightTextOfCursor, callback) {
            str: String => return unsafe { LibC.mallocCString(str) }
        }
    }

    private func onGetTextIndexAtCursor(callback: CallbackWithReturn<Int32>): Unit {
        commonSubscribe2CT<Int32>(GetTextIndexAtCursor, callback)
    }

    private func findCallbackObject(eventType: Int8, callback: CallbackObject, remove!: Bool = false): Int64 {
        let callbackList = synchronized(mapMutex) {
            callbackMap.get(eventType) ?? return -1
        }
        synchronized(listMutex) {
            for (idx in 0..callbackList.size) {
                if (refEq(callback, callbackList[idx])) {
                    if (remove) {
                        callbackList.remove(at: idx)
                    }
                    return idx
                }
            }
            return -1
        }
    }

    private func on(eventType: Int8, id: Int64) {
        synchronized(mapMutex) {
            let code: Int32 = unsafe { FfiInputMethodControllerOn(eventType, id) }
            if (code != SUCCESS_CODE) {
                let errorCode = innerCodeToErrCode(code)
                throw BusinessException(errorCode, "on ${eventType} failed: ${errorCode}")
            }
        }
    }

    private func off(eventType: Int8) {
        let code: Int32 = unsafe { FfiInputMethodControllerOff(eventType) }
        if (code != SUCCESS_CODE) {
            let errorCode = innerCodeToErrCode(code)
            throw BusinessException(errorCode, "off ${eventType} failed: ${errorCode}")
        }
    }

    private func oneArgWrapper<CT, T>(eventType: Int8, ctor: (CT) -> T): Int64 where CT <: CType {
        let wrapper = {
            ctype: CT =>
            let cjType = ctor(ctype)
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(eventType) ?? ArrayList<CallbackObject>()
            }
            let cbArray = synchronized(listMutex) {
                callbackList.toArray()
            }
            for (caller in cbArray) {
                (caller as Callback1Argument<T>)?.invoke(cjType)
            }
        }
        let registerCall = Callback1Param<CT, Unit>(wrapper)
        registerCall.getID()
    }

    private func oneArgWrapperS2CS(eventType: Int8, ctor: (String) -> CString): Int64 {
        let wrapper: (Int32) -> CString = {
            param: Int32 =>
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(eventType) ?? ArrayList<CallbackObject>()
            }
            let cbArray = synchronized(listMutex) {
                callbackList.toArray()
            }
            for (caller in cbArray) {
                let result = (caller as Callback1ArgumentWithReturn<Int32, String>)?.invoke(param)
                return match (result) {
                    case None => CString(CPointer<UInt8>())
                    case Some(v) => ctor(v)
                }
            }
            return CString(CPointer<UInt8>())
        }
        let registerCall = Callback1Param<Int32, CString>(wrapper)
        registerCall.getID()
    }

    private func oneArgWrapper2U32(eventType: Int8): Int64 {
        let wrapper: () -> Int32 = {
            =>
            let callbackList = synchronized(mapMutex) {
                callbackMap.get(eventType) ?? ArrayList<CallbackObject>()
            }
            let cbArray = synchronized(listMutex) {
                callbackList.toArray()
            }
            for (caller in cbArray) {
                let result = (caller as CallbackWithReturn<Int32>)?.invoke()
                return match (result) {
                    case None => 0
                    case Some(v) => v
                }
            }
            return 0
        }
        let registerCall = Callback0Param<Int32>(wrapper)
        registerCall.getID()
    }

    private func commonSubscribe<CT, T>(
        eventType: IMFEventType,
        callback: CallbackObject,
        ctor: (CT) -> T
    ) where CT <: CType {
        LOGGER.info("subscribe ${eventType}")
        if (!attached.load()) {
            throw BusinessException(EXCEPTION_DETACHED, "input method client is detached.")
        }
        let typeValue = eventType.getValue()
        if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
            on(typeValue, oneArgWrapper<CT, T>(typeValue, ctor))
        } else {
            if (findCallbackObject(typeValue, callback) >= 0) {
                LOGGER.info("[InputMethod] The callback object already exists.")
                return
            }
        }
        synchronized(mapMutex) {
            callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
            synchronized(listMutex) {
                callbackMap[typeValue].add(callback)
            }
        }
    }

    private func subscribeS2CS(
        eventType: IMFEventType,
        callback: CallbackObject,
        ctor: (String) -> CString
    ) {
        if (!attached.load()) {
            throw BusinessException(EXCEPTION_DETACHED, "input method client is detached.")
        }
        LOGGER.debug("subscribe ${eventType}")
        let typeValue = eventType.getValue()
        if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
            on(typeValue, oneArgWrapperS2CS(typeValue, ctor))
        } else {
            if (findCallbackObject(typeValue, callback) >= 0) {
                LOGGER.info("[InputMethod] The callback object already exists.")
                return
            }
        }
        synchronized(mapMutex) {
            callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
            synchronized(listMutex) {
                callbackMap[typeValue].add(callback)
            }
        }
    }

    private func commonSubscribe2CT<CT>(
        eventType: IMFEventType,
        callback: CallbackObject
    ) where CT <: CType {
        LOGGER.debug("subscribe ${eventType}")
        if (!attached.load()) {
            throw BusinessException(EXCEPTION_DETACHED, "input method client is detached.")
        }
        let typeValue = eventType.getValue()
        if (registry[Int64(typeValue)].compareAndSwap(false, true)) {
            on(typeValue, oneArgWrapper2U32(typeValue))
        } else {
            if (findCallbackObject(typeValue, callback) >= 0) {
                LOGGER.info("[InputMethod] The callback object already exists.")
                return
            }
        }
        synchronized(mapMutex) {
            callbackMap.addIfAbsent(typeValue, ArrayList<CallbackObject>())
            synchronized(listMutex) {
                callbackMap[typeValue].add(callback)
            }
        }
    }

    private func commonUnSubscribe<T>(eventType: IMFEventType, callback!: ?T = None) where T <: CallbackObject {
        LOGGER.debug("unsubscribe ${eventType}")
        let typeValue = eventType.getValue()
        synchronized(mapMutex) {
            match (callback) {
                case Some(v) =>
                    if (findCallbackObject(typeValue, v, remove: true) < 0) {
                        throw BusinessException(ERR_PARAMETER_ERROR, "Callback is not registered.")
                    }
                    if (callbackMap[typeValue].isEmpty()) {
                        off(typeValue)
                        registry[Int64(typeValue)].store(false)
                    }
                case None =>
                    if (registry[Int64(typeValue)].compareAndSwap(true, false)) {
                        callbackMap[typeValue].clear()
                        off(typeValue)
                        return
                    }
                    throw BusinessException(ERR_PARAMETER_ERROR, "Callback is not registered.")
            }
        }
    }
}
