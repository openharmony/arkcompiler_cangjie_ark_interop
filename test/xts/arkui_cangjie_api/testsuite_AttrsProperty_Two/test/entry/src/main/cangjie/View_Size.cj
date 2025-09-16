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

import kit.PerformanceAnalysisKit.Hilog
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}

@Entry
@Component
class View_Size {
    func build() {
        Column() {
            Text("Test_Text00")
                .width(@r(app.string.width))
                .height(@r(app.string.height))
                .padding(@r(app.string.padding))
                .margin(@r(app.string.margin))
                .backgroundColor(Color.Green)
                .id("Test_Text00")
            Text("Test_Text01")
                .width(100)
                .height(100)
                .padding(top: 5.vp, right: 5.vp, bottom: 5.vp, left: 5.vp)
                .margin(top: 5.vp, right: 5.vp, bottom: 10.vp, left: 5.vp)
                .backgroundColor(Color.Green)
                .id("Test_Text01")
            Text("Test_Text02")
                .width(100.00)
                .height(100.00)
                .padding(top: @r(app.string.padding), right: @r(app.string.padding), bottom: @r(app.string.padding),
                    left: @r(app.string.padding))
                .margin(top: @r(app.string.margin), right: @r(app.string.margin), bottom: @r(app.string.margin),
                    left: @r(app.string.margin))
                .backgroundColor(Color.Green)
                .id("Test_Text02")
            Text("Test_Text03").size(width: @r(app.string.width), height: @r(app.string.height)).id("Test_Text03")
        }
    }
}
