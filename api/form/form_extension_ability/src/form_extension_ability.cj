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

package ohos.form.form_extension_ability

import std.collection.HashMap
import ohos.ffi.{FFIData, FFIDataManager}
import ohos.ability.{Want, AbilityConfiguration, WantHandle, CConfiguration, jsonStringUnWrapper}
import ohos.app.form.formBindingData.{FormBindingData, CFormBindingData}
import ohos.form.form_info.{FormState, formKitCheckCodeAndThrow, INTERNAL_ERROR, getErrorMsg}
import ohos.base.BusinessException
import ohos.labels.*

type FormExtAbilityHandle = UIntNative

/**
 * class of form extension.
 *
 * @relation export default class FormExtensionAbility;
 */
@!APILevel[
    20,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.Form"
]
public open class FormExtensionAbility <: FFIData {
    private static let CREATORS = HashMap<String, () -> FormExtensionAbility>()
    private var context_: ?FormExtensionContext = None

    func abilityInit(remote: FormExtAbilityHandle): Unit {
        if (remote == 0) {
            throw IllegalStateException("Invalid remote FormExtAbilityHandle")
        }

        // Init FormExtensionContext
        var nativeAbilityContextId = 0
        let errorCode = unsafe { FFIFormExtAbilityGetContext(remote, inout nativeAbilityContextId) }
        formKitCheckCodeAndThrow(errorCode)
        var value = FormExtensionContext(nativeAbilityContextId)
        context_ = Option<FormExtensionContext>.Some(value)
    }

    /**
     * Indicates form extension context.
     *
     * @relation context: FormExtensionContext;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public prop context: FormExtensionContext {
        get() {
            context_ ?? throw BusinessException(INTERNAL_ERROR, getErrorMsg(INTERNAL_ERROR))
        }
    }

    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public static func registerCreator(name: String, creator: () -> FormExtensionAbility): Unit {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                CREATORS.add(name, creator)
                FORM_EXTENSION_LOG.info("Register creator of " + name + " successfully.")
            case Some(creatorFunc) => FORM_EXTENSION_LOG.error(
                "Repeated registration for FormExtensionAbility in " + name + ", please check.")
        }
    }

    static func create(name: String): Option<FormExtensionAbility> {
        let optCreator = CREATORS.get(name)
        match (optCreator) {
            case None =>
                FORM_EXTENSION_LOG.error("No such create functions for FormExtensionAbility: " + name)
                Option<FormExtensionAbility>.None
            case Some(creator) => creator()
        }
    }

    /**
     * Called to return a FormBindingData object.
     *
     * @relation onAddForm(want: Want): formBindingData.FormBindingData;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onAddForm(want: Want): FormBindingData {
        return FormBindingData("")
    }

    /**
     * Called when the form provider is notified that a temporary form is successfully converted to a normal form.
     *
     * @relation onCastToNormalForm(formId: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onCastToNormalForm(formId: String): Unit {}

    /**
     * Called to notify the form provider to update a specified form.
     *
     * @relation onUpdateForm(formId: string, wantParams?: Record<string, Object>): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onUpdateForm(formId: String, wantParams: String): Unit {}

    /**
     * Called when the form provider receives form events from the system.
     *
     * @relation onChangeFormVisibility(newStatus: Record<string, number>): void;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onChangeFormVisibility(newStatus: HashMap<String, Int32>): Unit {}

    /**
     * Called when a specified message event defined by the form provider is triggered.
     * This method is valid only for JS forms.
     *
     * @relation onFormEvent(formId: string, message: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onFormEvent(formId: String, message: String): Unit {}

    /**
     * Called to notify the form provider that a specified form has been destroyed. Override this method if
     * you want your application, as the form provider, to be notified of form deletion.
     *
     * @relation onRemoveForm(formId: string): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onRemoveForm(formId: String): Unit {}

    /**
     * Called when the system configuration is updated.
     *
     * @relation onConfigurationUpdate(newConfig: Configuration): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onConfigurationUpdate(newConfig: AbilityConfiguration): Unit {}

    /**
     * Called to return a FormState object.
     * <p>You must override this callback if you want this ability to return the actual form state. Otherwise,
     * this method returns link FormState.Default by default.
     *
     * @relation onAcquireFormState?(want: Want): formInfo.FormState;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onAcquireFormState(want: Want): FormState {
        return Default
    }

    /**
     * Called when this ability breaks the last link, notifying the provider that the provider process is about to stop.
     *
     * @relation onStop?(): void;
     */
    @!APILevel[
        20,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.Form"
    ]
    public open func onStop(): Unit {}
}

@C
func createCjFormExtAbility(name: CString): Int64 {
    let optExecutor = FormExtensionAbility.create(name.toString())
    match (optExecutor) {
        case None =>
            FORM_EXTENSION_LOG.error("Failed to load FormExtensionAbility: " + name.toString())
            0
        case Some(executor) =>
            FFIDataManager.getInstance().register(executor)
            executor.getID()
    }
}

@C
func cjFormExtAbilityInit(id: Int64, remote: FormExtAbilityHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.abilityInit(remote)
    }
}

@C
func releaseFormExtAbility(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such FormExtensionAbility: " + id.toString())
        case Some(ability) =>
            FORM_EXTENSION_LOG.info("Release FormExtensionAbility end")
            FFIDataManager.getInstance().releaseData(id)
    }
}

@C
func cjFormExtAbilityOnAddForm(id: Int64, wantHandle: WantHandle): CFormBindingData {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let want = Want(wantHandle)
            let data = ability.onAddForm(want)
            return unsafe { CFormBindingData.fromFormBindingData(data) }
    }
}

@C
func cjFormExtAbilityOnCastToNormalForm(id: Int64, formId: CString): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let formIdStr = formId.toString()
            return ability.onCastToNormalForm(formIdStr)
    }
}

@C
func cjFormExtAbilityOnUpdateForm(id: Int64, formId: CString, params: CString): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let formIdStr = formId.toString()
            let jsonValue = jsonStringUnWrapper(params.toString()).toString()
            return ability.onUpdateForm(formIdStr, jsonValue)
    }
}

@C
func cjFormExtAbilityOnChangeFormVisibility(id: Int64, formEventsMap: CRecordI64I32): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let newStatus = unsafe { formEventsMap.toHashMap() }
            return ability.onChangeFormVisibility(newStatus)
    }
}

@C
func cjFormExtAbilityOnFormEvent(id: Int64, formId: CString, message: CString): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let formIdStr = formId.toString()
            let messageStr = message.toString()
            return ability.onFormEvent(formIdStr, messageStr)
    }
}

@C
func cjFormExtAbilityOnRemoveForm(id: Int64, formId: CString): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let formIdStr = formId.toString()
            return ability.onRemoveForm(formIdStr)
    }
}

@C
func cjFormExtAbilityOnConfigurationUpdate(id: Int64, configuration: CConfiguration): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let cfg = configuration.toConfiguration()
            ability.onConfigurationUpdate(cfg)
    }
}

@C
func cjFormExtAbilityOnAcquireFormState(id: Int64, wantHandle: WantHandle): Int32 {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let want = Want(wantHandle)
            return ability.onAcquireFormState(want).getValue()
    }
}

@C
func cjFormExtAbilityOnStop(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<FormExtensionAbility>(id)
    match (optAbility) {
        case None =>
            FORM_EXTENSION_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.onStop()
    }
}

@C
func freeCFormBindingData(data: CFormBindingData): Unit {
    data.free()
}

@C
struct CJFormExtAbilityFuncs {
    CJFormExtAbilityFuncs(
        let createCjFormExtAbility: CFunc<(CString) -> Int64>,
        let releaseFormExtAbility: CFunc<(Int64) -> Unit>,
        let cjFormExtAbilityInit: CFunc<(Int64, FormExtAbilityHandle) -> Unit>,
        let cjFormExtAbilityOnAddForm: CFunc<(Int64, WantHandle) -> CFormBindingData>,
        let cjFormExtAbilityOnCastToNormalForm: CFunc<(Int64, CString) -> Unit>,
        let cjFormExtAbilityOnUpdateForm: CFunc<(Int64, CString, CString) -> Unit>,
        let cjFormExtAbilityOnChangeFormVisibility: CFunc<(Int64, CRecordI64I32) -> Unit>,
        let cjFormExtAbilityOnFormEvent: CFunc<(Int64, CString, CString) -> Unit>,
        let cjFormExtAbilityOnRemoveForm: CFunc<(Int64, CString) -> Unit>,
        let cjFormExtAbilityOnConfigurationUpdate: CFunc<(Int64, CConfiguration) -> Unit>,
        let cjFormExtAbilityOnAcquireFormState: CFunc<(Int64, WantHandle) -> Int32>,
        let cjFormExtAbilityOnStop: CFunc<(Int64) -> Unit>,
        let freeCFormBindingData: CFunc<(CFormBindingData) -> Unit>
    ) {}
}

@C
func formExtAbilityCjFuncsRegister(result: CPointer<CJFormExtAbilityFuncs>): Unit {
    let atCFuncs = CJFormExtAbilityFuncs(
        createCjFormExtAbility,
        releaseFormExtAbility,
        cjFormExtAbilityInit,
        cjFormExtAbilityOnAddForm,
        cjFormExtAbilityOnCastToNormalForm,
        cjFormExtAbilityOnUpdateForm,
        cjFormExtAbilityOnChangeFormVisibility,
        cjFormExtAbilityOnFormEvent,
        cjFormExtAbilityOnRemoveForm,
        cjFormExtAbilityOnConfigurationUpdate,
        cjFormExtAbilityOnAcquireFormState,
        cjFormExtAbilityOnStop,
        freeCFormBindingData
    )
    unsafe { result.write(atCFuncs) }
}

// register
foreign func FFIRegisterCJFormExtAbilityFuncs(funcs: CFunc<(CPointer<CJFormExtAbilityFuncs>) -> Unit>): Unit

let REGISTER_FORM_EXT_ABILITY_FUNCS = unsafe {
    FFIRegisterCJFormExtAbilityFuncs(formExtAbilityCjFuncsRegister)
}
