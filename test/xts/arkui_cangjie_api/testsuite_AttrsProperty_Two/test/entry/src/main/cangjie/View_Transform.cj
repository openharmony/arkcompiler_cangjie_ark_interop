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
class View_Transform {
    func build() {
        Scroll() {
            Column() {
                Text("1")
                    .scale(x: 0.8, y: 0.8, z: 0.8, centerX: 10.vp, centerY: 10.vp)
                    .rotate(x: 0.8, y: 0.8, z: 0.8, angle: 0.8, centerX: @r(app.string.centerx),
                        centerY: @r(app.string.centery))
                    .translate(x: 2, y: 2, z: 2)
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text00")

                Text("2")
                    .scale(x: 0.8, y: 0.8, z: 0.8, centerX: @r(app.string.centerx), centerY: @r(app.string.centery))
                    .rotate(x: 1.0, y: 1.0, z: 1.0, angle: 300.0, centerX: 50.percent, centerY: 50.percent)
                    .translate(x: 2.0, y: 2.0, z: 2.0)
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text01")

                Text("3")
                    .scale(x: 2.0, y: 2.0)
                    .rotate(x: 1.0, y: 1.0, z: 2.0, angle: 300.0, centerX: 50.percent, centerY: 50.percent)
                    .translate(x: @r(app.string.traslatex), y: @r(app.string.traslatey), z: @r(app.string.traslatez))
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text02")

                Text("4")
                    .translate(x:2.0.vp,y:2.0.vp)
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text03")

                Text("5")
                    .translate(x:2.0,y:2.0)
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text04")

                Text("6").translate(x:2.0,y:2.0).size(width: 50, height: 50).backgroundColor(Color.Green).id("Text05")

                Text("7")
                    .translate(x:@r(app.string.traslatex))
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text06")

                Text("8")
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text07")

                Text("9")
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text08")

                Text("10")
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text09")

                Text("11")
                    .size(width: 50, height: 50)
                    .backgroundColor(Color.Green)
                    .id("Text10")
            }.width(100.percent).margin(top: 5)
        }
    }
}
