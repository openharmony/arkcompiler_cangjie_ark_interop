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

import std.collection.HashMap
import ohos.base.*
import ohos.ffi.*
import ohos.labels.*

// UIExtensionAbility
func createUIExtAbility(name: String): Int64 {
    let optAbility = UIExtensionAbility.create(name)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("Failed to load UIExtensionAbility: " + name.toString())
            0
        case Some(ability) =>
            FFIDataManager.getInstance().register(ability)
            ability.getID()
    }
}

func releaseUIExtAbility(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw Exception("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ABILITY_LOG.info("Release UIExtensionAbility end")
    }
    FFIDataManager.getInstance().releaseData(id)
}

func cjUIExtAbilityInit(id: Int64, abilityHandle: ExtAbilityHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.abilityInit(abilityHandle)
    }
}

func cjUIExtAbilityOnCreateWithParam(id: Int64, param: LaunchParam): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onCreate(param)
    }
}

func cjUIExtAbilityOnDestroy(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onDestroy()
    }
}

func cjUIExtAbilityOnSessionCreate(id: Int64, want: Want, session: UIExtensionContentSession): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onSessionCreate(want, session)
    }
}

func cjUIExtAbilityOnSessionDestroy(id: Int64, session: UIExtensionContentSession): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onSessionDestroy(session)
    }
}

func cjUIExtAbilityOnForeground(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onForeground()
    }
}

func cjUIExtAbilityOnBackground(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onBackground()
    }
}

func cjUIExtAbilityOnConfigurationUpdate(id: Int64, configuration: AbilityConfiguration): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onConfigurationUpdate(configuration)
    }
}

func cjUIExtAbilityOnMemoryLevel(id: Int64, level: MemoryLevel): Unit {
    let optAbility = FFIDataManager.getInstance().getData<UIExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such UIExtensionAbility: " + id.toString())
        case Some(ability) => ability.onMemoryLevel(level)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public open class UIExtensionAbility <: ExtensionAbility {
    private var context_: ?UIExtensionContext = None

    func abilityInit(remote: ExtAbilityHandle): Unit {
        if (remote == 0) {
            throw NoneValueException("Invalid remote UIExtensionAbility")
        }

        // Init UIExtensionContext
        var nativeAbilityContextId = 0
        let errorCode = unsafe { FFICJUIExtAbilityGetContext(remote, inout nativeAbilityContextId) }
        checkCodeAndThrow(errorCode)
        var value = UIExtensionContext(nativeAbilityContextId)
        context_ = Option<UIExtensionContext>.Some(value)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public prop context: UIExtensionContext {
        get() {
            match (context_) {
                case None => throw NoneValueException("Invalid context")
                case Some(value) => return value
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onCreate(launchParam: LaunchParam): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onSessionCreate(want: Want, session: UIExtensionContentSession): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onSessionDestroy(session: UIExtensionContentSession): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onForeground(): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onBackground(): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.Core"
    ]
    public open func onDestroy(): Unit {}
}
