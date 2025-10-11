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

internal import ohos.base.LengthProp
internal import ohos.arkui.component.Column
internal import ohos.arkui.component.Row
internal import ohos.arkui.component.Text
internal import ohos.arkui.component.CustomView
internal import ohos.arkui.component.CJEntry
internal import ohos.arkui.component.loadNativeView
internal import ohos.arkui.component.FontWeight
internal import ohos.arkui.state_management.SubscriberManager
internal import ohos.arkui.state_management.ObservedProperty
internal import ohos.arkui.state_management.LocalStorage
import ohos.arkui.state_macro_manage.Entry
import ohos.arkui.state_macro_manage.Component
import ohos.arkui.state_macro_manage.State
import ohos.arkui.state_macro_manage.r
import ohos.business_exception.BusinessException
import kit.AbilityKit.{Want, UIAbilityContext, AbilityResult, WantValueType}
import std.collection.HashMap

const RESULT_CODE: Int32 = 1001
// 见获取UIAbility的上下文信息章节
func getContext(): UIAbilityContext {
    return globalContext.getOrThrow()
}

var resultCallback = {
    errorCode: Option<BusinessException>, data: Option<AbilityResult> => match (errorCode) {
        case Some(e) => Hilog.info(0, "CangjieSample","callback error: errcode is ${e.code}")
        case _ => match (data) {
            case Some(value) =>
                if (value.resultCode == RESULT_CODE) {
                    let info = value
                            .want
                            .parameters.get("info")
                    match(info) {
                        case Some(WantValueType.StringValue(v)) =>
                            Hilog.info(0, "CangjieSample","startAbilityForResult get info: ${v}")
                        case _ => Hilog.error(0, "CangjieSample","startAbilityForResult get info failed")
                    }
                    
                }
            case _ => Hilog.info(0, "CangjieSample","callback data is null")
        }
    }
}

@Entry
@Component
class PageAbilityComponentsInteractive {
    func build() {
        Row {
            Column {
                Text("startAbility").onClick {
                    evt =>
                    // context为调用方Ability的AbilityContext
                    let context = getContext()
                    let parametersMap = HashMap<String, WantValueType>()
                    parametersMap.add("info", StringValue("来自EntryAbility PageAbilityComponentsInteractive页面"))
                    let want = Want(
                        deviceId: "", // deviceId为空表示本设备
                        bundleName: "com.example.myapplication",
                        abilityName: "FuncAbilityA",
                        moduleName: "entry", // moduleName非必选
                        // 自定义信息
                        parameters: parametersMap
                    )
                    try {
                        context.startAbilityForResult(want, resultCallback)
                    } catch (e: BusinessException) {
                        Hilog.error(0, "CangjieSample","Failed to start FuncAbility. Code is ${e.code}, message is ${e.message}")
                    }
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
