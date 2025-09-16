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
import std.unittest.testmacro.*
import ohos.ui_test.*
import ohos.base.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.arkui.state_macro_manage.*
import ohos.multimedia.image.PixelMap
import ohos.multimedia.image.createPixelMap
import ohos.multimedia.image.InitializationOptions
import ohos.multimedia.image.Size
import ohos.multimedia.image.ScaleMode
import std.collection.*

@Entry
@Component
class View_DataPanel {
    var valueArr: Array<Float64> = [20.0, 20.0, 20.0, 20.0]
    var color1: LinearGradient = LinearGradient([ColorStop(0x65EEC9A3, 0), ColorStop(0xFFEF629F, 1)])
    var color2: LinearGradient = LinearGradient([ColorStop(0xFF67F9D4, 0), ColorStop(0xFFFF9554, 1)])
    var color3: LinearGradient = LinearGradient(0x00FF00)
    var color4: LinearGradient = LinearGradient(0x20FF0000)
    var colorShadow1: LinearGradient = LinearGradient([ColorStop(0x65EEC9A3, 0), ColorStop(0x65EF629F, 1)])
    var colorShadow2: LinearGradient = LinearGradient([ColorStop(0x65e26709, 0), ColorStop(0x65efbd08, 1)])
    var colorShadow3: LinearGradient = LinearGradient([ColorStop(0x6572B513, 0), ColorStop(0x6508efa6, 1)])
    var colorShadow4: LinearGradient = LinearGradient([ColorStop(0x65ed08f5, 0), ColorStop(0x65ef0849, 1)])
    @State
    var colorArray: Array<LinearGradient> = [this.color1, this.color2, this.color3, this.color4]
    @State
    var shadowColorArray: Array<LinearGradient> = [this.colorShadow1, this.colorShadow2, this.colorShadow3,
        this.colorShadow4]

    func build() {
        Column(space:30) {
            DataPanel(values: this.valueArr, max: 100.0, panelType: DataPanelType.Circle)
                .closeEffect(true)
                .valueColors(this.colorArray)
                .trackBackgroundColor(Color(0x08182431))
                .strokeWidth(30)
                .trackShadow(DataPanelShadowOptions(radius: 5.5, colors: shadowColorArray, offsetX: 15.5, offsetY: 15.5)
                )
                .width(300)
                .height(300)
                .id("dataPanelBasis")

            DataPanel(values: this.valueArr, max: 100.0, panelType: DataPanelType.Circle)
                .trackBackgroundColor(Color.Red)
                .strokeWidth(30.0)
                .trackShadow(DataPanelShadowOptions(radius: 5.5, colors: shadowColorArray, offsetX: 15.5, offsetY: 15.5)
                )
                .width(300)
                .height(300)
                .id("dataPanelBasis2")

            DataPanel(values: this.valueArr, max: 100.0, panelType: DataPanelType.Circle)
                .trackBackgroundColor(@r(app.color.red_color))
                .strokeWidth(30.vp)
                .trackShadow(DataPanelShadowOptions(radius: 5.5, colors: shadowColorArray, offsetX: 15.5, offsetY: 15.5)
                )
                .width(300)
                .height(300)
                .id("dataPanelBasis3")
        }.width(100.percent).margin(top: 10)
    }
}
