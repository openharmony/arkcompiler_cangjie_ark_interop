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
import ohos.ffi.*
import ohos.labels.*

protected type ExtAbilityHandle = UIntNative

struct ExtAbilityFuncs {
    ExtAbilityFuncs(
        let createExtAbility!: ?(String) -> Int64 = None,
        let releaseExtAbility!: ?(Int64) -> Unit = None,
        let extAbilityInit!: (Int64, ExtAbilityHandle) -> Unit = {_, _ => ()},
        let extAbilityOnCreateWithParam!: (Int64, LaunchParam) -> Unit = {_, _ => ()},
        let extAbilityOnCreate!: (Int64) -> Unit = {_ => ()},
        let extAbilityOnDestroy!: (Int64) -> Unit = {_ => ()},
        let extAbilityOnSessionCreate!: (Int64, Want, UIExtensionContentSession) -> Unit = {_, _, _ => ()},
        let extAbilityOnSessionDestroy!: (Int64, UIExtensionContentSession) -> Unit = {_, _ => ()},
        let extAbilityOnForeground!: (Int64) -> Unit = {_ => ()},
        let extAbilityOnBackground!: (Int64) -> Unit = {_ => ()},
        let extAbilityOnConfigurationUpdate!: (Int64, AbilityConfiguration) -> Unit = {_, _ => ()},
        let extAbilityOnMemoryLevel!: (Int64, MemoryLevel) -> Unit = {_, _ => ()},
        let extAbilityOnStartContentEditing!: (Int64, String, Want, UIExtensionContentSession) -> Unit = {
            _, _, _, _ => ()
        }
    ) {}
}

/*
CJ_EXTENSION_ABILITY_TYPE:
ACTION = 0,
EMBEDDED,
PHOTO_EDITOR,
SHARE,
 */
let EXT_ABILITY_FUNCS = [
    // ActionExtensionAbility
    ExtAbilityFuncs(
        createExtAbility: createUIExtAbility,
        releaseExtAbility: releaseUIExtAbility,
        extAbilityInit: cjUIExtAbilityInit,
        extAbilityOnCreateWithParam: cjUIExtAbilityOnCreateWithParam,
        extAbilityOnCreate: cjActionExtAbilityOnCreate,
        extAbilityOnDestroy: cjUIExtAbilityOnDestroy,
        extAbilityOnSessionCreate: cjUIExtAbilityOnSessionCreate,
        extAbilityOnSessionDestroy: cjUIExtAbilityOnSessionDestroy,
        extAbilityOnForeground: cjUIExtAbilityOnForeground,
        extAbilityOnBackground: cjUIExtAbilityOnBackground,
        extAbilityOnConfigurationUpdate: cjUIExtAbilityOnConfigurationUpdate,
        extAbilityOnMemoryLevel: cjUIExtAbilityOnMemoryLevel
    ),

    // EmbeddedUIExtensionAbility
    ExtAbilityFuncs(
        createExtAbility: createUIExtAbility,
        releaseExtAbility: releaseUIExtAbility,
        extAbilityInit: cjUIExtAbilityInit,
        extAbilityOnCreateWithParam: cjUIExtAbilityOnCreateWithParam,
        extAbilityOnCreate: cjEmbeddedUIExtAbilityOnCreate,
        extAbilityOnDestroy: cjUIExtAbilityOnDestroy,
        extAbilityOnSessionCreate: cjUIExtAbilityOnSessionCreate,
        extAbilityOnSessionDestroy: cjUIExtAbilityOnSessionDestroy,
        extAbilityOnForeground: cjUIExtAbilityOnForeground,
        extAbilityOnBackground: cjUIExtAbilityOnBackground,
        extAbilityOnConfigurationUpdate: cjUIExtAbilityOnConfigurationUpdate,
        extAbilityOnMemoryLevel: cjUIExtAbilityOnMemoryLevel
    ),

    // PhotoEditorExtensionAbility
    ExtAbilityFuncs(
        createExtAbility: createPhotoEditorExtAbility,
        releaseExtAbility: releasePhotoEditorExtAbility,
        extAbilityInit: cjPhotoEditorExtAbilityInit,
        extAbilityOnCreate: cjPhotoEditorExtAbilityOnCreate,
        extAbilityOnDestroy: cjPhotoEditorExtAbilityOnDestroy,
        extAbilityOnForeground: cjPhotoEditorExtAbilityOnForeground,
        extAbilityOnBackground: cjPhotoEditorExtAbilityOnBackground,
        extAbilityOnConfigurationUpdate: cjPhotoEditorExtAbilityOnConfigurationUpdate,
        extAbilityOnMemoryLevel: cjPhotoEditorExtAbilityOnMemoryLevel,
        extAbilityOnStartContentEditing: cjPhotoEditorExtAbilityOnStartContentEditing
    ),

    // ShareExtensionAbility
    ExtAbilityFuncs(
        createExtAbility: createUIExtAbility,
        releaseExtAbility: releaseUIExtAbility,
        extAbilityInit: cjUIExtAbilityInit,
        extAbilityOnCreateWithParam: cjUIExtAbilityOnCreateWithParam,
        extAbilityOnCreate: cjShareExtAbilityOnCreate,
        extAbilityOnDestroy: cjUIExtAbilityOnDestroy,
        extAbilityOnSessionCreate: cjUIExtAbilityOnSessionCreate,
        extAbilityOnSessionDestroy: cjUIExtAbilityOnSessionDestroy,
        extAbilityOnForeground: cjUIExtAbilityOnForeground,
        extAbilityOnBackground: cjUIExtAbilityOnBackground,
        extAbilityOnConfigurationUpdate: cjUIExtAbilityOnConfigurationUpdate,
        extAbilityOnMemoryLevel: cjUIExtAbilityOnMemoryLevel
    ),

    // UIExtensionAbility
    ExtAbilityFuncs(
        createExtAbility: createUIExtAbility,
        releaseExtAbility: releaseUIExtAbility,
        extAbilityInit: cjUIExtAbilityInit,
        extAbilityOnCreateWithParam: cjUIExtAbilityOnCreateWithParam,
        extAbilityOnDestroy: cjUIExtAbilityOnDestroy,
        extAbilityOnSessionCreate: cjUIExtAbilityOnSessionCreate,
        extAbilityOnSessionDestroy: cjUIExtAbilityOnSessionDestroy,
        extAbilityOnForeground: cjUIExtAbilityOnForeground,
        extAbilityOnBackground: cjUIExtAbilityOnBackground,
        extAbilityOnConfigurationUpdate: cjUIExtAbilityOnConfigurationUpdate,
        extAbilityOnMemoryLevel: cjUIExtAbilityOnMemoryLevel
    )
]

@C
func createCjExtAbility(name: CString, index: Int32): Int64 {
    return EXT_ABILITY_FUNCS[Int64(index)].createExtAbility?(name.toString()) ?? throw Exception(
        "Failed to load ExtensionAbility.")
}

@C
func releaseCjExtAbility(id: Int64, index: Int32): Unit {
    EXT_ABILITY_FUNCS[Int64(index)].releaseExtAbility?(id) ?? throw Exception("No such ExtensionAbility.")
}

@C
func cjExtAbilityInit(id: Int64, index: Int32, abilityHandle: ExtAbilityHandle): Unit {
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityInit(id, abilityHandle)
}

@C
func cjExtAbilityOnCreate(id: Int64, index: Int32, _: WantHandle, launchParam: CJLaunchParam): Unit {
    let launchReason = unsafe { LaunchReason.parse(launchParam.launchReason) }
    let lastExitReason = unsafe { LastExitReason.parse(launchParam.lastExitReason) }
    let param: LaunchParam = LaunchParam(
        launchParam.lastExitMessage.toString(),
        launchReason: launchReason,
        lastExitReason: lastExitReason
    )
    unsafe { LibC.free(launchParam.lastExitMessage) }
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnCreateWithParam(id, param)
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnCreate(id)
}

@C
func cjExtAbilityOnDestroy(id: Int64, index: Int32): Unit {
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnDestroy(id)
}

@C
func cjExtAbilityOnSessionCreate(id: Int64, index: Int32, wantHandle: WantHandle, sessionId: Int64): Unit {
    let want = Want(wantHandle)
    UIExtensionContentSession.checkId(sessionId)
    let session = UIExtensionContentSession(sessionId)
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnSessionCreate(id, want, session)
}

@C
func cjExtAbilityOnSessionDestroy(id: Int64, index: Int32, sessionId: Int64): Unit {
    UIExtensionContentSession.checkId(sessionId)
    let session = UIExtensionContentSession(sessionId)
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnSessionDestroy(id, session)
}

@C
func cjExtAbilityOnForeground(id: Int64, index: Int32): Unit {
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnForeground(id)
}

@C
func cjExtAbilityOnBackground(id: Int64, index: Int32): Unit {
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnBackground(id)
}

@C
func cjExtAbilityOnConfigurationUpdate(id: Int64, index: Int32, configuration: CConfiguration): Unit {
    let cfg = configuration.toConfiguration()
    unsafe { configuration.free() }
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnConfigurationUpdate(id, cfg)
}

@C
func cjExtAbilityOnMemoryLevel(id: Int64, index: Int32, level: Int32): Unit {
    let memLevel = MemoryLevel.parse(level)
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnMemoryLevel(id, memLevel)
}

@C
func cjExtAbilityOnStartContentEditing(id: Int64, index: Int32, imageUri: CString, wantHandle: WantHandle,
    sessionId: Int64): Unit {
    let uri = imageUri.toString()
    unsafe { LibC.free(imageUri) }
    UIExtensionContentSession.checkId(sessionId)
    EXT_ABILITY_FUNCS[Int64(index)].extAbilityOnStartContentEditing(id, uri, Want(wantHandle),
        UIExtensionContentSession(sessionId))
}

@C
struct CJExtAbilityFuncs {
    CJExtAbilityFuncs(
        let createCjExtAbility: CFunc<(CString, Int32) -> Int64>,
        let releaseCjExtAbility: CFunc<(Int64, Int32) -> Unit>,
        let cjExtAbilityInit: CFunc<(Int64, Int32, ExtAbilityHandle) -> Unit>,
        let cjExtAbilityOnCreate: CFunc<(Int64, Int32, WantHandle, CJLaunchParam) -> Unit>,
        let cjExtAbilityOnDestroy: CFunc<(Int64, Int32) -> Unit>,
        let cjExtAbilityOnSessionCreate: CFunc<(Int64, Int32, WantHandle, Int64) -> Unit>,
        let cjExtAbilityOnSessionDestroy: CFunc<(Int64, Int32, Int64) -> Unit>,
        let cjExtAbilityOnForeground: CFunc<(Int64, Int32) -> Unit>,
        let cjExtAbilityOnBackground: CFunc<(Int64, Int32) -> Unit>,
        let cjExtAbilityOnConfigurationUpdate: CFunc<(Int64, Int32, CConfiguration) -> Unit>,
        let cjExtAbilityOnMemoryLevel: CFunc<(Int64, Int32, Int32) -> Unit>,
        let cjExtAbilityOnStartContentEditing: CFunc<(Int64, Int32, CString, WantHandle, Int64) -> Unit>
    ) {}
}

@C
func extensionAbilityCjFuncsRegister(result: CPointer<CJExtAbilityFuncs>): Unit {
    let atCFuncs = CJExtAbilityFuncs(
        createCjExtAbility,
        releaseCjExtAbility,
        cjExtAbilityInit,
        cjExtAbilityOnCreate,
        cjExtAbilityOnDestroy,
        cjExtAbilityOnSessionCreate,
        cjExtAbilityOnSessionDestroy,
        cjExtAbilityOnForeground,
        cjExtAbilityOnBackground,
        cjExtAbilityOnConfigurationUpdate,
        cjExtAbilityOnMemoryLevel,
        cjExtAbilityOnStartContentEditing
    )
    unsafe { result.write(atCFuncs) }
}

foreign func FFIRegisterCJExtAbilityFuncs(funcs: CFunc<(CPointer<CJExtAbilityFuncs>) -> Unit>): Unit

let REGISTER_UIEXTENSION_ABILITY = unsafe { FFIRegisterCJExtAbilityFuncs(extensionAbilityCjFuncsRegister) }

@!APILevel[
    19,
    atomicservice: true,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
abstract sealed class ExtensionAbility <: BaseAbility {}
