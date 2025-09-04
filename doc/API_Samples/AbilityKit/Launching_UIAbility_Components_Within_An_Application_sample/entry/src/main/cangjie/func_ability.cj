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

/**
 * Created on 2025/8/18
 */
package ohos_app_cangjie_entry

import std.collection.HashMap
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.BusinessException
import kit.AbilityKit.{UIAbilityContext, Want, UIAbilityContext, AbilityResult, WantValueType,
    UIAbility, LaunchParam}

var globalFuncAbilityAContext: ?UIAbilityContext = None

class FuncAbilityA <: UIAbility {
    public override func onCreate(want: Want, launchParam: LaunchParam): Unit {
        Hilog.info(0, "CangjieSample","MainAbility OnCreated.${want.abilityName}")
        let info = want.parameters.get("info")
        match(info) {
            case Some(WantValueType.StringValue(v)) =>
                Hilog.info(0, "CangjieSample","onCreate get info: ${v}")
            case _ => Hilog.error(0, "CangjieSample","startAbilityForResult get info failed")
        }
        match (launchParam.launchReason) {
            case LaunchReason.StartAbility => Hilog.info(0, "CangjieSample", "StartAbility")
            case _ => ()
        }
    }

    public override func onWindowStageCreate(windowStage: WindowStage): Unit {
        Hilog.info(0, "CangjieSample","FuncAbilityA onWindowStageCreate.")
        globalFuncAbilityAContext = this.context
        windowStage.loadContent("PageFuncAbilityA")
    }
}
