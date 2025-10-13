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

internal import kit.AbilityKit.Want
internal import kit.AbilityKit.UIAbility
internal import kit.AbilityKit.LaunchParam
internal import kit.AbilityKit.LaunchReason
internal import ohos.window.WindowStage
import kit.AbilityKit.UIAbility
import kit.ArkUI.{WindowStage, WindowCallbackType, WindowStageEventType}
import ohos.business_exception.BusinessException
import ohos.callback_invoke.Callback1Argument
import kit.PerformanceAnalysisKit.Hilog

class MainAbility <: UIAbility {

    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(0, "CangjieSample","MainAbility OnCreated.${want.abilityName}")
        match (launchParam.launchReason) {
            case LaunchReason.StartAbility => Hilog.info(0, "CangjieSample","StartAbility")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        // 设置UI加载
        windowStage.loadContent("EntryView")
    }

    public override func onWindowStageDestroy(): Unit {
        // 释放UI资源
        Hilog.info(0, "CangjieSample","MainAbility onWindowStageDestroy")
    }

    public override func onForeground(): Unit {
        // 申请系统需要的资源，或者重新申请在onBackground()中释放的资源
        Hilog.info(0, "CangjieSample","MainAbility onForeground")
    }

    public override func onBackground(): Unit {
        // 释放UI不可见时无用的资源，或者在此回调中执行较为耗时的操作
        // 例如状态保存等
        Hilog.info(0, "CangjieSample","MainAbility onBackground")
    }

    public override func onNewWant(want: Want, launchParam: LaunchParam): Unit {
        // 更新资源、数据
        Hilog.info(0, "CangjieSample","MainAbility onNewWant")
    }

    public override func onDestroy(): Unit {
        // 系统资源的释放、数据的保存等
        Hilog.info(0, "CangjieSample","MainAbility onDestroy")
    }
}
