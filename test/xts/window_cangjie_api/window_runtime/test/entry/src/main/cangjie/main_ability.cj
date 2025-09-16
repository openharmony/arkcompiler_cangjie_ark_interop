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

package ohos_app_cangjie_entry

import kit.AbilityKit.{Ability, AbilityStage, Want, LaunchParam, LaunchReason}
import kit.ArkUI.{WindowStage}
import kit.ArkWeb.{WebviewController}
import ohos.arkui.state_management.*
import kit.AbilityKit.*
import ohos.hilog.Hilog
import ohos.window.Window
import ohos.window.{Configuration as Conf, getLastWindow, Orientation, createWindow, WindowType, SystemBarProperties,
    ColorSpace, AvoidAreaType, findWindow, Size as windowSize, TitleButtonRect, AvoidArea, Rect, Window}
public var windowStagevar:?Window  = None
class MainAbility <: UIAbility {
    public init() {
        super()
        registerSelf()
    }

    public  func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(0,"","","MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.StartAbility => Hilog.info(0,"","","START_ABILITY")
            case _ => throw Exception("unsupported enum constructor")
        }
    }

    public  func onWindowStageCreate(windowStage: WindowStage): Unit {
        Hilog.info(0,"","","MainAbility onWindowStageCreate.")
        AppStorage.setOrCreate("abilityContext", this.context)

        AppStorage.setOrCreate("windowStage", windowStage)
        windowStagevar = windowStage.getMainWindow()

        windowStage.loadContent("EntryView")
    }
}
