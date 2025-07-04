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

package ohos.ability

import ohos.base.*
import ohos.ffi.*
import ohos.bundle_manager.*
import ohos.window.*
import ohos.window.WindowStageNativeHandler as WindowStageHandle
import std.sync.*
import std.deriving.*
import std.collection.*
import ohos.labels.*

@C
struct CApplicationInfo {
    CApplicationInfo(
        let name: CString,
        let bundleName: CString
    ) {}
    func free(): Unit {
        unsafe {
            LibC.free(this.name)
            LibC.free(this.bundleName)
        }
    }
}

foreign {
    func FFIGetArea(id: Int64): Int64

    func FFICJApplicationInfo(id: Int64): CPointer<CApplicationInfo>

    func FfiCJApplicationContextOnOnEnvironment(id: Int64, cfgCallbackId: Int64, memCallbackId: Int64,
        errCode: CPointer<Int32>): Int32

    func FfiCJApplicationContextOnOnAbilityLifecycle(id: Int64, cFuncIds: CArrI64, errCode: CPointer<Int32>): Int32

    func FfiCJApplicationContextOnOnApplicationStateChange(id: Int64, foregroundCallbackId: Int64,
        backgroundCallbackId: Int64, errCode: CPointer<Int32>): Int32

    func FfiCJApplicationContextOnOff(id: Int64, callbackType: CString, callbackId: Int32, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetFont(id: Int64, font: CString, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetLanguage(id: Int64, language: CString, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetColorMode(id: Int64, colorMode: Int32, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextGetRunningProcessInformation(id: Int64, errCode: CPointer<Int32>): CArrProcessInformation

    func FfiCJApplicationContextKillAllProcesses(id: Int64, clearPageStack: Bool, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextGetCurrentAppCloneIndex(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCJApplicationContextRestartApp(id: Int64, want: WantHandle, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextClearUpApplicationData(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetSupportedProcessCache(id: Int64, isSupported: Bool, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetFontSizeScale(id: Int64, fontSizeScale: Float64): Int32
}

let STATE_CHANGE_CALLBCAK_LIST = ArrayList<(ApplicationStateChangeCallback, Int32)>()
let STATE_CHANGE_CALLBCAK_MUTEX = Mutex()

@Derive[Equatable]
@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public enum ApplicationContextType {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ENVIRONMENT
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    ABILITY_LIFE_CYCLE
    | @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    APPLICATION_STATE_CHANGE
    | ...

    func toString(): String {
        match (this) {
            case ENVIRONMENT => "environment"
            case ABILITY_LIFE_CYCLE => "abilityLifecycle"
            case APPLICATION_STATE_CHANGE => "applicationStateChange"
            case _ => throw IllegalArgumentException("The type is not supported.")
        }
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ApplicationStateChangeCallback {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public ApplicationStateChangeCallback(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onApplicationForeground!: () -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onApplicationBackground!: () -> Unit
    ) {}
}

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class EnvironmentCallback {
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public EnvironmentCallback(
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onConfigurationUpdated!: (AbilityConfiguration) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onMemoryLevel!: (MemoryLevel) -> Unit
    ) {}
}

let LAMDA_ABILITY: (UIAbility) -> Unit = {
    _: UIAbility => ()
}
let LAMDA_ABILITY_WINDOW_SATGE: (UIAbility, WindowStage) -> Unit = {
    _: UIAbility, _: WindowStage => ()
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityLifecycleCallback {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public AbilityLifecycleCallback(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityCreate!: (UIAbility) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageCreate!: (UIAbility, WindowStage) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageActive!: (UIAbility, WindowStage) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageInactive!: (UIAbility, WindowStage) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageDestroy!: (UIAbility, WindowStage) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityDestroy!: (UIAbility) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityForeground!: (UIAbility) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityBackground!: (UIAbility) -> Unit,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityContinue!: (UIAbility) -> Unit,
        // optional callbacks
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillCreate!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageWillCreate!: ?(UIAbility, WindowStage) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageWillDestroy!: ?(UIAbility, WindowStage) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillForeground!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillDestroy!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillBackground!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWillNewWant!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onNewWant!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillContinue!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageWillRestore!: ?(UIAbility, WindowStage) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onWindowStageRestore!: ?(UIAbility, WindowStage) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilityWillSaveState!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public let onAbilitySaveState!: ?(UIAbility) -> Unit = None
    ) {}

    func toWrapperId(): Array<Int64> {
        let onAbilityCreateId = abilityCallbackWapperId(onAbilityCreate)
        let onWindowStageCreateId = abilityWindowStageCallbackWapperId(onWindowStageCreate)
        let onWindowStageActiveId = abilityWindowStageCallbackWapperId(onWindowStageActive)
        let onWindowStageInactiveId = abilityWindowStageCallbackWapperId(onWindowStageInactive)
        let onWindowStageDestroyId = abilityWindowStageCallbackWapperId(onWindowStageDestroy)
        let onAbilityDestroyId = abilityCallbackWapperId(onAbilityDestroy)
        let onAbilityForegroundId = abilityCallbackWapperId(onAbilityForeground)
        let onAbilityBackgroundId = abilityCallbackWapperId(onAbilityBackground)
        let onAbilityContinueId = abilityCallbackWapperId(onAbilityContinue)
        // optional callbacks
        let onAbilityWillCreateId = abilityCallbackWapperId(onAbilityWillCreate ?? LAMDA_ABILITY)
        let onWindowStageWillCreateId = abilityWindowStageCallbackWapperId(
            onWindowStageWillCreate ?? LAMDA_ABILITY_WINDOW_SATGE)
        let onWindowStageWillDestroyId = abilityWindowStageCallbackWapperId(
            onWindowStageWillDestroy ?? LAMDA_ABILITY_WINDOW_SATGE)
        let onAbilityWillForegroundId = abilityCallbackWapperId(onAbilityWillForeground ?? LAMDA_ABILITY)
        let onAbilityWillDestroyId = abilityCallbackWapperId(onAbilityWillDestroy ?? LAMDA_ABILITY)
        let onAbilityWillBackgroundId = abilityCallbackWapperId(onAbilityWillBackground ?? LAMDA_ABILITY)
        let onWillNewWantId = abilityCallbackWapperId(onWillNewWant ?? LAMDA_ABILITY)
        let onNewWantId = abilityCallbackWapperId(onNewWant ?? LAMDA_ABILITY)
        let onAbilityWillContinueId = abilityCallbackWapperId(onAbilityWillContinue ?? LAMDA_ABILITY)
        let onWindowStageWillRestoreId = abilityWindowStageCallbackWapperId(
            onWindowStageWillRestore ?? LAMDA_ABILITY_WINDOW_SATGE)
        let onWindowStageRestoreId = abilityWindowStageCallbackWapperId(
            onWindowStageRestore ?? LAMDA_ABILITY_WINDOW_SATGE)
        let onAbilityWillSaveStateId = abilityCallbackWapperId(onAbilityWillSaveState ?? LAMDA_ABILITY)
        let onAbilitySaveStateId = abilityCallbackWapperId(onAbilitySaveState ?? LAMDA_ABILITY)

        return [onAbilityCreateId, onWindowStageCreateId, onWindowStageActiveId, onWindowStageInactiveId,
            onWindowStageDestroyId, onAbilityDestroyId, onAbilityForegroundId, onAbilityBackgroundId,
            onAbilityContinueId, onAbilityWillCreateId, onWindowStageWillCreateId, onWindowStageWillDestroyId,
            onAbilityWillForegroundId, onAbilityWillDestroyId, onAbilityWillBackgroundId, onWillNewWantId, onNewWantId,
            onAbilityWillContinueId, onWindowStageWillRestoreId, onWindowStageRestoreId, onAbilityWillSaveStateId,
            onAbilitySaveStateId]
    }
}

func abilityCallbackWapperId(callback: (UIAbility) -> Unit): Int64 {
    let wrapper = {
        id: Int64 =>
        let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
        match (optAbility) {
            case None => ABILITY_LOG.error("No such Ability: " + id.toString())
            case Some(ability) => callback(ability)
        }
    }
    return Callback1Param<Int64, Unit>(wrapper).getID()
}

func abilityWindowStageCallbackWapperId(callback: (UIAbility, WindowStage) -> Unit): Int64 {
    let wrapper = {
        id: Int64, windowStageHandle: WindowStageHandle =>
        let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
        let windowStage = WindowStage(windowStageHandle)
        match (optAbility) {
            case None => ABILITY_LOG.error("No such Ability: " + id.toString())
            case Some(ability) => callback(ability, windowStage)
        }
    }
    return Callback2Param<Int64, WindowStageHandle, Unit>(wrapper).getID()
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ApplicationContext <: Context {
    protected init(id: Int64) {
        super(id)
        RemoteDataManager.getInstance().register(this)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getApplicationInfo(): ApplicationInfo {
        unsafe {
            let retApplicationInfo = FfiContextGetApplicationInfo(getID(), 0)
            let applicationInfo = ApplicationInfo(retApplicationInfo)
            retApplicationInfo.free()
            return applicationInfo
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getArea(): Int64 {
        return unsafe { FFIGetArea(this.getID()) }
    }

    /*
     * @brief on(type: 'environment', callback: EnvironmentCallback): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(onType: ApplicationContextType, callback: EnvironmentCallback): Int32 {
        var errCode: Int32 = 0
        if (onType != ApplicationContextType.ENVIRONMENT) {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        unsafe {
            let cfgCallbackWrapper = {
                cfg: CConfiguration =>
                let configuration = cfg.toConfiguration()
                cfg.free()
                callback.onConfigurationUpdated(configuration)
            }
            let memCallBackWrapper = {
                mem: Int32 => callback.onMemoryLevel(MemoryLevel.parse(mem))
            }
            let cfgCallback = Callback1Param<CConfiguration, Unit>(cfgCallbackWrapper)
            let memCallback = Callback1Param<Int32, Unit>(memCallBackWrapper)
            let callbackId = FfiCJApplicationContextOnOnEnvironment(getID(), cfgCallback.getID(), memCallback.getID(),
                inout errCode)
            checkCodeAndThrow(errCode)
            return callbackId
        }
    }

    /*
     * @brief on(type: 'abilityLifecycle', callback: AbilityLifecycleCallback): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(onType: ApplicationContextType, callback: AbilityLifecycleCallback): Int32 {
        var errCode: Int32 = 0
        if (onType != ApplicationContextType.ABILITY_LIFE_CYCLE) {
            throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
        }
        unsafe {
            let funcs = callback.toWrapperId()
            let cFuncIdsPtr = LibC.malloc<Int64>(count: funcs.size)
            if (cFuncIdsPtr.isNull()) {
                throw BusinessException(ERROR_CODE_INNER, getErrorMsg(ERROR_CODE_INNER))
            }
            for (i in 0..funcs.size) {
                cFuncIdsPtr.write(i, funcs[i])
            }
            let cFuncIds = CArrI64(cFuncIdsPtr, funcs.size)
            let callbackId = FfiCJApplicationContextOnOnAbilityLifecycle(getID(), cFuncIds, inout errCode)
            LibC.free(cFuncIdsPtr)
            checkCodeAndThrow(errCode)
            return callbackId
        }
    }

    /*
     * @brief on(type: 'applicationStateChange', callback: ApplicationStateChangeCallback): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func on(onType: ApplicationContextType, callback: ApplicationStateChangeCallback): Unit {
        synchronized(STATE_CHANGE_CALLBCAK_MUTEX) {
            for (item in STATE_CHANGE_CALLBCAK_LIST) {
                if (refEq(callback, item[0])) {
                    throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
                }
            }
            var callbackId: Int32 = 0
            var errCode: Int32 = 0
            if (onType != ApplicationContextType.APPLICATION_STATE_CHANGE) {
                throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
            }
            unsafe {
                let foregroundCallback = Callback0Param<Unit>(callback.onApplicationForeground)
                let backgroundCallback = Callback0Param<Unit>(callback.onApplicationBackground)
                callbackId = FfiCJApplicationContextOnOnApplicationStateChange(getID(), foregroundCallback.getID(),
                    backgroundCallback.getID(), inout errCode)
            }
            checkCodeAndThrow(errCode)
            STATE_CHANGE_CALLBCAK_LIST.add((callback, callbackId))
        }
    }

    /*
     * brief off(type: 'environment', callbackId: number, callback: AsyncCallback<void>): void
     * brief off(type: 'abilityLifecycle', callbackId: number, callback: AsyncCallback<void>): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(onType: ApplicationContextType, callbackId: Int32): Unit {
        var errCode: Int32 = 0
        unsafe {
            try (callbackType = LibC.mallocCString(onType.toString()).asResource()) {
                FfiCJApplicationContextOnOff(getID(), callbackType.value, callbackId, inout errCode)
            }
        }
        checkCodeAndThrow(errCode)
        return
    }

    /*
     * brief off(type: 'applicationStateChange', callback?: ApplicationStateChangeCallback): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func off(onType: ApplicationContextType, callback!: ?ApplicationStateChangeCallback = None): Unit {
        synchronized(STATE_CHANGE_CALLBCAK_MUTEX) {
            var errCode: Int32 = 0
            unsafe {
                if (let Some(call) <- callback) {
                    let funcId = Box<Int32>(-1)
                    STATE_CHANGE_CALLBCAK_LIST.removeIf {
                        item => if (refEq(call, item[0])) {
                            funcId.value = item[1]
                            true
                        } else {
                            false
                        }
                    }
                    if (funcId.value == -1) {
                        throw BusinessException(INVALID_PARA, getErrorMsg(INVALID_PARA))
                    }
                    try (callbackType = LibC.mallocCString(onType.toString()).asResource()) {
                        FfiCJApplicationContextOnOff(getID(), callbackType.value, funcId.value, inout errCode)
                    }
                } else {
                    try (callbackType = LibC.mallocCString(onType.toString()).asResource()) {
                        FfiCJApplicationContextOnOff(getID(), callbackType.value, -1, inout errCode)
                    }
                    STATE_CHANGE_CALLBCAK_LIST.clear()
                }
            }
            checkCodeAndThrow(errCode)
        }
    }

    /*
     * @brief setFont(font: string): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setFont(font: String): Unit {
        var code: Int32 = 0
        unsafe {
            try (cFont = LibC.mallocCString(font).asResource()) {
                FfiCJApplicationContextSetFont(getID(), cFont.value, inout code)
            }
        }
        throwIfNotSuccess(code)
    }

    /**
     * Sets the scale ratio for the font size of this application.
     * It can be called only by the main thread.
     *
     * @throws { IllegalArgumentException } - The specified fontSizeScale is negative.
     *
     * @relation setFontSizeScale(fontSizeScale: number): void;
     */
    @!APILevel[
        20,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setFontSizeScale(fontSizeScale: Float64): Unit {
        if (fontSizeScale < 0.0) {
            throw IllegalArgumentException("fontSizeScale must >= 0.0")
        }
        let code = unsafe { FfiCJApplicationContextSetFontSizeScale(getID(), fontSizeScale) }
        throwIfNotSuccess(code)
    }

    /*
     * @brief setLanguage(language: string): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setLanguage(language: String): Unit {
        var code: Int32 = 0
        unsafe {
            try (cLanguage = LibC.mallocCString(language).asResource()) {
                FfiCJApplicationContextSetLanguage(getID(), cLanguage.value, inout code)
            }
        }
        throwIfNotSuccess(code)
    }

    /*
     * @brief setColorMode(colorMode: ConfigurationConstant.ColorMode): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setColorMode(colorMode: ConfigurationColorMode): Unit {
        var code: Int32 = 0
        unsafe {
            FfiCJApplicationContextSetColorMode(getID(), colorMode.value, inout code)
        }
        throwIfNotSuccess(code)
    }

    /*
     * @brief getRunningProcessInformation(): Promise<Array<ProcessInformation>>
     */
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getRunningProcessInformation(): Array<ProcessInformation> {
        var code: Int32 = 0
        unsafe {
            let cArr = FfiCJApplicationContextGetRunningProcessInformation(getID(), inout code)
            throwIfNotSuccess(code)
            let processInformations = cArr.toArrProcessInformation()
            cArr.free()
            return processInformations
        }
    }

    /*
     * @brief killAllProcesses(clearPageStack: boolean): Promise<void>
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func killAllProcesses(clearPageStack!: Bool = true): Unit {
        var code: Int32 = 0
        unsafe {
            FfiCJApplicationContextKillAllProcesses(getID(), clearPageStack, inout code)
        }
        throwIfNotSuccess(code)
    }

    /*
     * @brief getCurrentAppCloneIndex(): number
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func getCurrentAppCloneIndex(): Int32 {
        var code: Int32 = 0
        unsafe {
            let index = FfiCJApplicationContextGetCurrentAppCloneIndex(getID(), inout code)
            throwIfNotSuccess(code)
            return index
        }
    }

    /*
     * @brief restartApp(want: Want): void
     */
    @!APILevel[
        19,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func restartApp(want: Want): Unit {
        var code: Int32 = 0
        unsafe {
            let wantHandle = want.createWantHandle()
            FfiCJApplicationContextRestartApp(getID(), wantHandle, inout code)
            Want.releaseWantHandle(wantHandle)
            throwIfNotSuccess(code)
        }
    }

    /*
     * @brief clearUpApplicationData(): Promise<void>
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func clearUpApplicationData(): Unit {
        var code: Int32 = 0
        unsafe {
            FfiCJApplicationContextClearUpApplicationData(getID(), inout code)
            throwIfNotSuccess(code)
        }
    }

    /*
     * @brief setSupportedProcessCache(isSupported : boolean): void
     */
    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public func setSupportedProcessCache(isSupported: Bool): Unit {
        var code: Int32 = 0
        unsafe {
            FfiCJApplicationContextSetSupportedProcessCache(getID(), isSupported, inout code)
            throwIfNotSuccess(code)
        }
    }
}

func throwIfNotSuccess(code: Int32): Unit {
    if (code != SUCCESS_CODE) {
        throw BusinessException(code, getErrorMsg(code))
    }
}
