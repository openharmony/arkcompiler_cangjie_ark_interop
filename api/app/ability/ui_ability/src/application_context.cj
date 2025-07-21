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

package ohos.app.ability.ui_ability

import ohos.app.ability.want.*
import ohos.ffi.*
import ohos.window.*
import std.sync.*
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

    func FfiCJApplicationContextKillAllProcesses(id: Int64, clearPageStack: Bool, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextGetCurrentAppCloneIndex(id: Int64, errCode: CPointer<Int32>): Int32

    func FfiCJApplicationContextRestartApp(id: Int64, want: WantHandle, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextClearUpApplicationData(id: Int64, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetSupportedProcessCache(id: Int64, isSupported: Bool, errCode: CPointer<Int32>): Unit

    func FfiCJApplicationContextSetFontSizeScale(id: Int64, fontSizeScale: Float64): Int32
}

let STATE_CHANGE_CALLBCAK_MUTEX = Mutex()

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

/**
 * The ApplicationContext module, inherited from Context, provides application-level context capabilities, including
 * APIs for registering and unregistering the lifecycle of application components.
 *
 * @relation declare class ApplicationContext extends Context
 */
@!APILevel[
    21,
    stagemodelonly: true,
    syscap: "SystemCapability.Ability.AbilityRuntime.Core"
]
public class ApplicationContext <: Context {
    protected init(id: Int64) {
        super(id)
        RemoteDataManager.getInstance().register(this)
    }
}