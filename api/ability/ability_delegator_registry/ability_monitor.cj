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

package ohos.ability_delegator_registry

import ohos.base.*
import ohos.ffi.*
import ohos.ability.*
import ohos.labels.*

func executeFunc(optFunc: ?(UIAbility) -> Unit, ability: UIAbility): Unit {
    match (optFunc) {
        case Some(actFunc) => actFunc(ability)
        case _ => return
    }
}

@C
func monitorOnAbilityCreate(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onAbilityCreate, ability)
    }
}

@C
func monitorOnAbilityForeground(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onAbilityForeground, ability)
    }
}

@C
func monitorOnAbilityBackground(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onAbilityBackground, ability)
    }
}

@C
func monitorOnAbilityDestroy(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onAbilityDestroy, ability)
    }
}

@C
func monitorOnWindowStageCreate(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onWindowStageCreate, ability)
    }
}

@C
func monitorOnWindowStageRestore(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onWindowStageRestore, ability)
    }
}

@C
func monitorOnWindowStageDestroy(monitorId: Int64, abilityId: Int64): Unit {
    let optPara = (FFIDataManager.getInstance().getData<AbilityMonitor>(monitorId),
        FFIDataManager.getInstance().getData<UIAbility>(abilityId))
    match (optPara) {
        case (None, _) | (_, None) => throw NoneValueException("No such Ability or no such Monitor")
        case (Some(monitor), Some(ability)) => executeFunc(monitor.onWindowStageDestroy, ability)
    }
}

@!APILevel[
    19,
    atomicservice: true,
    crossplatform: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class AbilityMonitor <: FFIData {
    @!APILevel[
        19,
        atomicservice: true,
        crossplatform: true,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public AbilityMonitor(
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var abilityName: String,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var moduleName!: String = "",
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onAbilityCreate!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onAbilityForeground!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onAbilityBackground!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onAbilityDestroy!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onWindowStageCreate!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onWindowStageRestore!: ?(UIAbility) -> Unit = None,
        @!APILevel[
            19,
            atomicservice: true,
            crossplatform: true,
            stagemodelonly: true,
            syscap: "SystemCapability.Ability.AbilityRuntime.Core"
        ]
        public var onWindowStageDestroy!: ?(UIAbility) -> Unit = None
    ) {
        registerSelf()
    }

    ~init() {
        FFIDataManager.getInstance().releaseData(id_)
    }
}

@C
struct CJMonitorFuncs {
    CJMonitorFuncs(
        let onAbilityCreate: CFunc<(Int64, Int64) -> Unit>,
        let onAbilityForeground: CFunc<(Int64, Int64) -> Unit>,
        let onAbilityBackground: CFunc<(Int64, Int64) -> Unit>,
        let onAbilityDestroy: CFunc<(Int64, Int64) -> Unit>,
        let onWindowStageCreate: CFunc<(Int64, Int64) -> Unit>,
        let onWindowStageRestore: CFunc<(Int64, Int64) -> Unit>,
        let onWindowStageDestroy: CFunc<(Int64, Int64) -> Unit>
    ) {}
}

@C
func monitorCjFuncsRegister(result: CPointer<CJMonitorFuncs>): Unit {
    let atCFuncs = CJMonitorFuncs(
        monitorOnAbilityCreate,
        monitorOnAbilityForeground,
        monitorOnAbilityBackground,
        monitorOnAbilityDestroy,
        monitorOnWindowStageCreate,
        monitorOnWindowStageRestore,
        monitorOnWindowStageDestroy
    )
    unsafe { result.write(atCFuncs) }
}

foreign func RegisterCJMonitorFuncs(funcs: CFunc<(CPointer<CJMonitorFuncs>) -> Unit>): Unit

let REGISTER_MONITOR = unsafe { RegisterCJMonitorFuncs(monitorCjFuncsRegister) }
