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

import std.collection.*
import ohos.base.*
import ohos.ffi.*
import ohos.rpc.*
import ohos.window.*
import ohos.encoding.json.*
import ohos.window.WindowStageNativeHandler as WindowStageHandle
import ohos.labels.*

type AbilityHandle = UIntNative

type VectorStringHandle = CPointer<Unit>

foreign func FFIAbilityGetAbilityContext(handle: AbilityHandle): Int64

@C
struct CJAbilityFuncs {
    CJAbilityFuncs(
        let createAbility: CFunc<(CString) -> Int64>,
        let releaseAbility: CFunc<(Int64) -> Unit>,
        let abilityOnStart: CFunc<(Int64, WantHandle, CJLaunchParam) -> Unit>,
        let abilityOnStop: CFunc<(Int64) -> Unit>,
        let abilityOnSceneCreated: CFunc<(Int64, WindowStageHandle) -> Unit>,
        let abilityOnSceneRestored: CFunc<(Int64, WindowStageHandle) -> Unit>,
        let abilityOnSceneDestroyed: CFunc<(Int64) -> Unit>,
        let abilityOnForeground: CFunc<(Int64, WantHandle) -> Unit>,
        let abilityOnBackground: CFunc<(Int64) -> Unit>,
        let abilityOnConfigurationUpdated: CFunc<(Int64, CJConfiguration) -> Unit>,
        let abilityOnNewWant: CFunc<(Int64, WantHandle, CJLaunchParam) -> Unit>,
        let abilityDump: CFunc<(Int64, VectorStringHandle) -> VectorStringHandle>,
        let abilityOnContinue: CFunc<(Int64, CString) -> Int32>,
        let abilityInit: CFunc<(Int64, AbilityHandle) -> Unit>,
        let abilityOnBackPress: CFunc<(Int64) -> Bool>,
        let abilityOnSceneWillDestroy: CFunc<(Int64, WindowStageHandle) -> Unit>,
        let abilityOnConfigurationUpdate: CFunc<(Int64, CConfiguration) -> Unit>,
        let abilityOnMemoryLevel: CFunc<(Int64, Int32) -> Unit>,
        let abilityOnPrepareTerminate: CFunc<(Int64) -> Bool>,
        let abilityOnSaveState: CFunc<(Int64, Int32, CString) -> CJNumberParmas>,
        let abilityOnShare: CFunc<(Int64, CString) -> CString>,
        let abilityOnContinueWithParams: CFunc<(Int64, CString) -> CJNumberParmas>,
        let abilityOnCallRequest: CFunc<(Int64) -> Int64>,
        let abilityOnSetCalleeFlag: CFunc<(Int64, Bool) -> Unit>
    ) {}
}

@C
struct CJNumberParmas {
    CJNumberParmas(
        let numberResult: Int32,
        let params: CString
    ) {}
}

@C
struct CJLaunchParam {
    CJLaunchParam(
        let launchReason: Int32,
        let lastExitReason: Int32,
        let lastExitMessage: CString
    ) {}
}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class LaunchParam {
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var launchReason: LaunchReason
    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public var lastExitReason: LastExitReason

    var lastExitMessage: String = ""

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public init(
        launchReason!: LaunchReason = LaunchReason.Unknown,
        lastExitReason!: LastExitReason = LastExitReason.Normal
    ) {
        this.launchReason = launchReason
        this.lastExitReason = lastExitReason
    }

    init(lastExitMessage: String, launchReason!: LaunchReason = LaunchReason.Unknown,
        lastExitReason!: LastExitReason = LastExitReason.Normal) {
        this.lastExitMessage = lastExitMessage
        this.launchReason = launchReason
        this.lastExitReason = lastExitReason
    }
}

@C
func createAbility(name: CString): Int64 {
    let optAbility = UIAbility.create(name.toString())
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("Failed to load Ability: " + name.toString())
            0
        case Some(ability) =>
            FFIDataManager.getInstance().register(ability)
            ability.getID()
    }
}

@C
func releaseAbility(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw Exception("No such Ability: " + id.toString())
        case Some(ability) => ABILITY_LOG.info("Release abilityContext end")
    }
    FFIDataManager.getInstance().releaseData(id)
    ABILITY_LOG.info("Release ability end")
}

@C
func abilityOnStart(id: Int64, wantHandle: WantHandle, launchParam: CJLaunchParam): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let want = Want(wantHandle)
            ability.setLaunchWant(want)
            ability.setLastRequestWant(want)

            let launchReason = unsafe { LaunchReason.parse(launchParam.launchReason) }
            let lastExitReason = unsafe { LastExitReason.parse(launchParam.lastExitReason) }
            let param: LaunchParam = LaunchParam(
                launchParam.lastExitMessage.toString(),
                launchReason: launchReason,
                lastExitReason: lastExitReason
            )
            ability.onCreate(want, param)
    }
}

@C
func abilityOnStop(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.onDestroy()
    }
}

@C
func abilityOnSceneCreated(id: Int64, windowStageHandle: WindowStageHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let windowStage = WindowStage(windowStageHandle)
            ability.context.windowStage_ = windowStage
            ability.onWindowStageCreate(windowStage)
    }
}

@C
func abilityOnSceneRestored(id: Int64, windowStageHandle: WindowStageHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let windowStage = WindowStage(windowStageHandle)
            ability.context.windowStage_ = windowStage
            ability.onWindowStageRestore(windowStage)
    }
}

@C
func abilityOnSceneDestroyed(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            ability.context.windowStage_ = None
            ability.onWindowStageDestroy()
    }
}

@C
func abilityOnSceneWillDestroy(id: Int64, windowStageHandle: WindowStageHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let windowStage = WindowStage(windowStageHandle)
            ability.context.windowStage_ = windowStage
            ability.onWindowStageWillDestroy(windowStage)
    }
}

@C
func abilityOnForeground(id: Int64, wantHandle: WantHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let want = Want(wantHandle)
            ability.setLastRequestWant(want)
            ability.onForeground()
    }
}

@C
func abilityOnBackground(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.onBackground()
    }
}

@C
func abilityOnBackPress(id: Int64): Bool {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.onBackPressed()
    }
}

@C
func abilityOnConfigurationUpdated(id: Int64, _: CJConfiguration): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ()
    }
}

@C
func abilityOnNewWant(id: Int64, wantHandle: WantHandle, launchParams: CJLaunchParam): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let want = Want(wantHandle)
            ability.setLastRequestWant(want)

            let launchReason = unsafe { LaunchReason.parse(launchParams.launchReason) }
            let lastExitReason = unsafe { LastExitReason.parse(launchParams.lastExitReason) }
            let param: LaunchParam = LaunchParam(
                launchParams.lastExitMessage.toString(),
                launchReason: launchReason,
                lastExitReason: lastExitReason
            )
            ability.onNewWant(want, param)
    }
}

@C
func abilityDump(id: Int64, params: VectorStringHandle): VectorStringHandle {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None => return FFIVectorString(0).getNativeHandle()
        case Some(ability) =>
            var unsafeParams = FFIVectorString(params)
            var paramsSize = unsafeParams.getSize()
            let arrayParams = Array<String>(paramsSize, repeat: "")
            for (i in 0..paramsSize) {
                arrayParams[i] = unsafeParams.getElement(i)
            }
            let info = ability.onDump(arrayParams)
            let vecFfi = FFIVectorString(info.size)
            for (i in 0..info.size) {
                vecFfi.setElement(i, info[i])
            }
            return vecFfi.getNativeHandle()
    }
}

@C
func abilityOnContinue(id: Int64, params: CString): Int32 {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let jsonValue = jsonStringUnWrapper(params.toString())
            let res = ability.onContinue(jsonValue.toString())
            return res.getValue()
    }
}

@C
func abilityInit(id: Int64, abilityHandle: AbilityHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.abilityInit(abilityHandle)
    }
}

@C
func abilityOnConfigurationUpdate(id: Int64, configuration: CConfiguration): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            unsafe { configuration.free() }
    }
}

@C
func abilityOnMemoryLevel(id: Int64, level: Int32): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            ()
    }
}

@C
func abilityOnPrepareTerminate(id: Int64): Bool {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) => ability.onPrepareToTerminate()
    }
}

@C
func abilityOnSaveState(id: Int64, reason: Int32, params: CString): CJNumberParmas {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let reasonType = StateType.parse(reason)
            let wantParam = jsonStringUnWrapper(params.toString())
            let saveState = ability.onSaveState(reasonType, wantParam.toString())
            let jsonCString = unsafe {
                LibC.mallocCString(jsonObjectWrapper(wantParam).toString())
            }
            return CJNumberParmas(saveState.getValue(), jsonCString)
    }
}

@C
func abilityOnShare(id: Int64, params: CString): CString {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let wantParam = jsonStringUnWrapper(params.toString())
            ability.onShare(wantParam.toString())
            let jsonCString = unsafe {
                LibC.mallocCString(jsonObjectWrapper(wantParam).toString())
            }
            return jsonCString
    }
}

@C
func abilityOnContinueWithParams(id: Int64, params: CString): CJNumberParmas {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("No such Ability: " + id.toString())
            throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let wantParam = jsonStringUnWrapper(params.toString())
            let continueResult = ability.onContinue(wantParam.toString())
            let jsonCString = unsafe {
                LibC.mallocCString(jsonObjectWrapper(wantParam).toString())
            }
            return CJNumberParmas(continueResult.getValue(), jsonCString)
    }
}

@C
func abilityOnCallRequest(id: Int64): Int64 {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            let callee = ability.onCallRequest()
            return callee.getID()
    }
}

@C
func abilityOnSetCalleeFlag(id: Int64, flag: Bool): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such Ability: " + id.toString())
        case Some(ability) =>
            ()
    }
}

class UIAbilityImpl {}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class UIAbility <: Ability {
    private var remoteLaunchWant: Option<Want> = Option<Want>.None
    private var remoteLastRequestWant: Option<Want> = Option<Want>.None
    private var abilityContext: Option<UIAbilityContext> = Option<UIAbilityContext>.None
    private let callee_: Callee = Callee()
    private let impl_: UIAbilityImpl = UIAbilityImpl()

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop launchWant: Want {
        get() {
            remoteLaunchWant.getOrThrow({=> Exception("Invalid LaunchWant")})
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop lastRequestWant: Want {
        get() {
            remoteLastRequestWant.getOrThrow({=> Exception("Invalid LastRequestWant")})
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop context: UIAbilityContext {
        get() {
            match (abilityContext) {
                case None =>
                    ABILITY_LOG.error("Invalid context")
                    throw Exception("Invalid context")
                case Some(value) => return value
            }
        }
    }

    prop callee: Callee {
        get() {
            callee_
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onCreate(want: Want, launchParam: LaunchParam): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onDestroy(): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onWindowStageCreate(windowStage: WindowStage): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    protected open func onWindowStageRestore(windowStage: WindowStage): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onWindowStageDestroy(): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onForeground(): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onBackground(): Unit {}

    func onBackPressed(): Bool {
        return true
    }

    func onWindowStageWillDestroy(windowStage: WindowStage): Unit {}

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onNewWant(want: Want, launchParam: LaunchParam): Unit {}

    func onContinue(wantParams: String): OnContinueResult {
        OnContinueResult.Agree
    }

    func onPrepareToTerminate(): Bool {
        return false
    }

    func onSaveState(reason: StateType, wantParam: String): OnSaveResult {
        return OnSaveResult.RecoveryAgree
    }

    func onShare(wantParam: String): Unit {}

    func onDump(params: Array<String>): Array<String> {
        return Array<String>()
    }

    func onCallRequest(): Callee {
        return this.callee
    }

    func abilityInit(remote: AbilityHandle): Unit {
        if (remote == 0) {
            ABILITY_LOG.error("Invalid remote Ability")
            throw NoneValueException("Invalid remote Ability")
        }

        // Init abilityContext
        let nativeAbilityContextId = unsafe { FFIAbilityGetAbilityContext(remote) }
        var value = UIAbilityContext(nativeAbilityContextId)
        abilityContext = Option<UIAbilityContext>.Some(value)
        ABILITY_LOG.info("Bind remote UIAbilityContext successfully, the id is ${nativeAbilityContextId}")
    }

    func setLaunchWant(want: Want): Unit {
        remoteLaunchWant = Option<Want>.Some(want)
    }

    func setLastRequestWant(want: Want): Unit {
        remoteLastRequestWant = Option<Want>.Some(want)
    }
}

@C
func abilityCjFuncsRegister(result: CPointer<CJAbilityFuncs>): Unit {
    let atCFuncs = CJAbilityFuncs(
        createAbility,
        releaseAbility,
        abilityOnStart,
        abilityOnStop,
        abilityOnSceneCreated,
        abilityOnSceneRestored,
        abilityOnSceneDestroyed,
        abilityOnForeground,
        abilityOnBackground,
        abilityOnConfigurationUpdated,
        abilityOnNewWant,
        abilityDump,
        abilityOnContinue,
        abilityInit,
        abilityOnBackPress,
        abilityOnSceneWillDestroy,
        abilityOnConfigurationUpdate,
        abilityOnMemoryLevel,
        abilityOnPrepareTerminate,
        abilityOnSaveState,
        abilityOnShare,
        abilityOnContinueWithParams,
        abilityOnCallRequest,
        abilityOnSetCalleeFlag
    )
    unsafe { result.write(atCFuncs) }
}

foreign func RegisterCJAbilityFuncs(funcs: CFunc<(CPointer<CJAbilityFuncs>) -> Unit>): Unit

let REGISTER_ABILITY = unsafe { RegisterCJAbilityFuncs(abilityCjFuncsRegister) }
