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
class View_TextCommon {
    func build(): Unit {
        Column() {
            Text("text font default")
            Divider()

            Text("text font color red").fontColor(0xAFEEEE).id("Text00")
            Text("text font color red").fontColor(@r(app.color.red)).id("Text01")
            Divider()

            Text("text font default")
            Text("text font size 20.vp").fontSize(20.vp).id("Text02")
            Text("text font size 10.00").fontSize(10.00).id("Text03")
            Text("text font size 10").fontSize(@r(app.string.fontSize)).id("Text04")
            Divider()

            Text("BLUE 18 Normal text").fontFamily(@r(app.string.fontFamily)).id("Text05")
        }
    }
}
