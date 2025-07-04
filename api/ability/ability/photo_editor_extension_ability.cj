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

// PhotoEditorExtensionAbility
func createPhotoEditorExtAbility(name: String): Int64 {
    let optAbility = PhotoEditorExtensionAbility.create(name)
    match (optAbility) {
        case None =>
            ABILITY_LOG.error("Failed to load UIExtensionAbility: " + name.toString())
            0
        case Some(ability) =>
            FFIDataManager.getInstance().register(ability)
            ability.getID()
    }
}

func releasePhotoEditorExtAbility(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw Exception("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ABILITY_LOG.info("Release PhotoEditorExtensionAbility end")
    }
    FFIDataManager.getInstance().releaseData(id)
}

func cjPhotoEditorExtAbilityInit(id: Int64, abilityHandle: ExtAbilityHandle): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.abilityInit(abilityHandle)
    }
}

func cjPhotoEditorExtAbilityOnCreate(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onCreate()
    }
}

func cjPhotoEditorExtAbilityOnDestroy(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onDestroy()
    }
}

func cjPhotoEditorExtAbilityOnForeground(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onForeground()
    }
}

func cjPhotoEditorExtAbilityOnBackground(id: Int64): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onBackground()
    }
}

func cjPhotoEditorExtAbilityOnStartContentEditing(id: Int64, uri: String, want: Want, session: UIExtensionContentSession): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onStartContentEditing(uri, want, session)
    }
}

func cjPhotoEditorExtAbilityOnConfigurationUpdate(id: Int64, configuration: AbilityConfiguration): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onConfigurationUpdate(configuration)
    }
}

func cjPhotoEditorExtAbilityOnMemoryLevel(id: Int64, level: MemoryLevel): Unit {
    let optAbility = FFIDataManager.getInstance().getData<PhotoEditorExtensionAbility>(id)
    match (optAbility) {
        case None => throw NoneValueException("No such PhotoEditorExtensionAbility: " + id.toString())
        case Some(ability) => ability.onMemoryLevel(level)
    }
}

@!APILevel[
    19,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
]
public open class PhotoEditorExtensionAbility <: ExtensionAbility {
    private var context_: ?PhotoEditorExtensionContext = None

    func abilityInit(remote: ExtAbilityHandle): Unit {
        if (remote == 0) {
            throw NoneValueException("Invalid remote PhotoEditorExtensionAbility")
        }

        // Init PhotoEditorExtensionContext
        var nativeAbilityContextId = 0
        let errorCode = unsafe { FFIPhotoExtAbilityGetContext(remote, inout nativeAbilityContextId) }
        checkCodeAndThrow(errorCode)
        var value = PhotoEditorExtensionContext(nativeAbilityContextId)
        context_ = Option<PhotoEditorExtensionContext>.Some(value)
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public prop context: PhotoEditorExtensionContext {
        get() {
            match (context_) {
                case None => throw IllegalArgumentException("Invalid context")
                case Some(value) => return value
            }
        }
    }

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public open func onCreate(): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public open func onStartContentEditing(uri: String, want: Want, session: UIExtensionContentSession): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"
    ]
    public open func onForeground(): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AbilityRuntime.AbilityCore"
    ]
    public open func onBackground(): Unit {}

    @!APILevel[
        19,
        stagemodelonly: true,
        syscap: "SystemCapability.Ability.AppExtension.PhotoEditorExtension"
    ]
    public open func onDestroy(): Unit {}
}
