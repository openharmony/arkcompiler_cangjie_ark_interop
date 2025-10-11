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

import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import kit.ArkUI.Button
import kit.PerformanceAnalysisKit.Hilog
import ohos.business_exception.BusinessException
import kit.AbilityKit.*
import std.collection.HashMap

const RESULT_CODE_A: Int32 = 1001

// globalFuncAbilityAContext is defined above
func getFuncAbilityAContext(): UIAbilityContext {
    return globalFuncAbilityAContext.getOrThrow()
}

@Entry
@Component
class PageFuncAbilityA {
    func build() {
        Row {
            Column {
                Button("FuncAbility").onClick {
                    evt =>
                    let context = getFuncAbilityAContext()
                    let parametersMap = HashMap<String, WantValueType>()
                    parametersMap.add("info", StringValue("From FuncAbility Index page"))
                    let abilityResult = AbilityResult(
                        RESULT_CODE_A,
                        want: Want(
                            deviceId: "", // Empty deviceId indicates the current device
                            bundleName: "com.example.myapplication",
                            abilityName: "FuncAbilityA",
                            moduleName: "entry", // moduleName is optional
                            // Custom information
                            parameters: parametersMap
                        )
                    )
                    try {
                        context
                            .terminateSelfWithResult(abilityResult)
                    } catch (e: BusinessException) {
                        Hilog.error(0, "CangjieSample","Failed to start terminate self. Code is ${e.code}, message is ${e.message}")
                    }
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
