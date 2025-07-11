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
import ohos.ffi.*
import ohos.base.BusinessException
import ohos.labels.*

type AbilityStageHandle = UIntNative

foreign func RegisterCJAbilityStageFuncs(registerFunc: CFunc<(CPointer<CJAbilityStageFuncs>) -> Unit>): Unit

foreign func FFIAbilityGetAbilityStageContext(handle: AbilityStageHandle): Int64

const ERR_INVALID_INSTANCE_CODE: Int64 = -1;

@C
struct CJAbilityStageFuncs {
    CJAbilityStageFuncs(
        let loadAbilityStage: CFunc<(CString) -> Int64>,
        let releaseAbilityStage: CFunc<(Int64) -> Unit>,
        let abilityStageOnCreate: CFunc<(Int64) -> Unit>,
        let abilityStageOnAcceptWant: CFunc<(Int64, WantHandle) -> CString>,
        let abilityStageOnConfigurationUpdated: CFunc<(Int64, CJConfiguration) -> Unit>,
        let abilityStageOnMemoryLevel: CFunc<(Int64, Int32) -> Unit>,
        let abilityStageInit: CFunc<(Int64, AbilityStageHandle) -> Unit>,
        let abilityStageOnConfigurationUpdated2: CFunc<(Int64, CConfiguration) -> Unit>,
        let abilityStageOnDestroy: CFunc<(Int64) -> Unit>,
        let abilityStageOnNewProcessRequest: CFunc<(Int64, WantHandle) -> CString>
    ) {}
}

@C
func abilityStageInit(id: Int64, abilityStageHandle: AbilityStageHandle): Unit {
    let optStage = FFIDataManager.getInstance().getData<AbilityStage>(id)
    if (let Some(stage) <- optStage) {
        stage.abilityStageInit(abilityStageHandle)
    }
}

@C
func loadAbilityStage(moduleName: CString): Int64 {
    let optStage = AbilityStage.create(moduleName.toString())
    match (optStage) {
        case None =>
            ABILITY_LOG.error("Failed to load AbilityStage: " + moduleName.toString())
            0
        case Some(stage) =>
            FFIDataManager.getInstance().register(stage)
            stage.getID()
    }
}

@C
func releaseAbilityStage(id: Int64): Unit {
    FFIDataManager.getInstance().releaseData(id)
}

@C
func abilityStageOnCreate(id: Int64): Unit {
    let optStage = FFIDataManager.getInstance().getData<AbilityStage>(id)
    if (let Some(stage) <- optStage) {
        stage.onCreate()
    }
}

@C
func abilityStageOnDestroy(id: Int64): Unit {}

@C
func abilityStageOnAcceptWant(id: Int64, wantHandle: WantHandle): CString {
    let optStage = FFIDataManager.getInstance().getData<AbilityStage>(id)
    if (let Some(stage) <- optStage) {
        let result = ""
        unsafe { LibC.mallocCString(result) }
    } else {
        throw NoneValueException("No such AbilityStage!")
    }
}

@C
func abilityStageOnNewProcessRequest(id: Int64, wantHandle: WantHandle): CString {
    let optStage = FFIDataManager.getInstance().getData<AbilityStage>(id)
    if (let Some(stage) <- optStage) {
        let result = ""
        unsafe { LibC.mallocCString(result) }
    } else {
        throw NoneValueException("No such AbilityStage!")
    }
}

@C
func abilityStageOnConfigurationUpdated(_: Int64, _: CJConfiguration): Unit {
    ()
}

@C
func abilityStageOnConfigurationUpdated2(id: Int64, cConfiguration: CConfiguration): Unit {}

@C
func abilityStageOnMemoryLevel(id: Int64, level: Int32): Unit {}

class AbilityStageImpl {}

@!APILevel[
    12,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class AbilityStage <: FFIData {
    // Store methods of creating AbilityStage in different module.
    private static let CREATORS = HashMap<String, () -> AbilityStage>()
    private var abilityStageContext: Option<AbilityStageContext> = Option<AbilityStageContext>.None
    private let impl_: AbilityStageImpl = AbilityStageImpl()

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public static func registerCreator(moduleName: String, creator: () -> AbilityStage): Unit {
        let optCreator = CREATORS.get(moduleName)
        match (optCreator) {
            case None =>
                CREATORS.add(moduleName, creator)
                ABILITY_LOG.info("Register AbilityStage creator successfully in " + moduleName)
            case Some(creatorFunc) => ABILITY_LOG.error(
                "Repeated registration for AbilityStage in " + moduleName + ", please check.")
        }
    }

    // protected function: available only for this package.
    static func create(moduleName: String): Option<AbilityStage> {
        let optCreator = CREATORS.get(moduleName)
        match (optCreator) {
            case None =>
                ABILITY_LOG.error("No such create functions for AbilityStageCreator: " + moduleName)
                Option<AbilityStage>.None
            case Some(creator) => creator()
        }
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop context: AbilityStageContext {
        get() {
            match (abilityStageContext) {
                case None => throw Exception("Invalid context")
                case Some(value) => return value
            }
        }
    }

    func abilityStageInit(remote: AbilityStageHandle): Unit {
        if (remote == 0) {
            throw Exception("Invalid remote AbilityStage")
        }

        // Init abilityContext
        let nativeAbilityStageContextId = unsafe { FFIAbilityGetAbilityStageContext(remote) }
        if (nativeAbilityStageContextId == ERR_INVALID_INSTANCE_CODE) {
            throw IllegalStateException("Invalid remote AbilityStageContext")
        }
        var value = AbilityStageContext(nativeAbilityStageContextId)
        abilityStageContext = Option<AbilityStageContext>.Some(value)
    }

    @!APILevel[
        12,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onCreate(): Unit {}
}

@C
func abilityStageCjFuncsRegister(result: CPointer<CJAbilityStageFuncs>): Unit {
    let funcs = CJAbilityStageFuncs(
        loadAbilityStage,
        releaseAbilityStage,
        abilityStageOnCreate,
        abilityStageOnAcceptWant,
        abilityStageOnConfigurationUpdated,
        abilityStageOnMemoryLevel,
        abilityStageInit,
        abilityStageOnConfigurationUpdated2,
        abilityStageOnDestroy,
        abilityStageOnNewProcessRequest
    )
    unsafe { result.write(funcs) }
}

let REGISTER_ABILITY_STAGE = unsafe { RegisterCJAbilityStageFuncs(abilityStageCjFuncsRegister) }
