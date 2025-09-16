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
import ohos.arkui.state_macro_manage.*
import kit.LocalizationKit.{AppResource}
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.arkui.ui_context.*

@Entry
@Component
class View_EmptyAttrs_BackgroundImagePosition {
    @State
    var targetView = ""
    @State
    var parentHeight: Length = 800.vp
    @State
    var parentWidth: Length = 400.vp
    @State
    var parentBackGroundColor: Color = Color(0xE1FFFF)
    @State
    var BackGroundColor: Color = Color.Green
    @State
    var TouchHotZoneText: String = ""
    @State
    var RenderFitWidth: Length = 60.percent
    @State
    var RenderFitHeight: Length = 80.vp
    @State
    var RenderFitWidth1: Length = 80.percent
    @State
    var RenderFitHeight1: Length = 100.vp
    @State
    var RenderFitWidth2: Length = 60.percent
    @State
    var RenderFitHeight2: Length = 80.vp
    @State
    var RenderFitFlag: Bool = true

    let scroller = Scroller()
    let webController = WebviewController()
    let richEditorController = RichEditorController()
    @State
    var isShowPopup: Bool = false
    @State
    var isShowPopupBuilder: Bool = false

    @State
    var isRefreshing: Bool = false

    let renderFlag = false //跳过if
    let Colors = [Color(0x98FB98), Color(0x317aff), Color(0xFFD700), Color(0xFFE4E1), Color(0xAB82FF)]

    protected override func aboutToAppear() {
        this.targetView = getUIContext().getRouter().getParams().getOrThrow()
    }
    func build() {
        Scroll() {
            Column() {
                ForEach(
                    ObservedArrayList<(String, Any, String)>(BackgroundImagePosition_Prop_List),
                    itemGeneratorFunc: {
                        BackgroundImagePosition_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("AlphabetIndexer : ${BackgroundImagePosition_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("AlphabetIndexer : ${BackgroundImagePosition_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("AlphabetIndexer : ${BackgroundImagePosition_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("AlphabetIndexer : ${BackgroundImagePosition_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("AlphabetIndexer : ${BackgroundImagePosition_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Blank : ${BackgroundImagePosition_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Blank : ${BackgroundImagePosition_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Blank : ${BackgroundImagePosition_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Blank : ${BackgroundImagePosition_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Blank : ${BackgroundImagePosition_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Button : ${BackgroundImagePosition_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Button : ${BackgroundImagePosition_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Button : ${BackgroundImagePosition_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Button : ${BackgroundImagePosition_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Button : ${BackgroundImagePosition_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Checkbox : ${BackgroundImagePosition_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Checkbox : ${BackgroundImagePosition_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Checkbox : ${BackgroundImagePosition_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Checkbox : ${BackgroundImagePosition_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Checkbox : ${BackgroundImagePosition_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("CheckboxGroup : ${BackgroundImagePosition_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("CheckboxGroup : ${BackgroundImagePosition_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("CheckboxGroup : ${BackgroundImagePosition_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("CheckboxGroup : ${BackgroundImagePosition_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("CheckboxGroup : ${BackgroundImagePosition_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("DataPanel : ${BackgroundImagePosition_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("DataPanel : ${BackgroundImagePosition_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("DataPanel : ${BackgroundImagePosition_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("DataPanel : ${BackgroundImagePosition_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("DataPanel : ${BackgroundImagePosition_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("DatePicker : ${BackgroundImagePosition_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("DatePicker : ${BackgroundImagePosition_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("DatePicker : ${BackgroundImagePosition_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("DatePicker : ${BackgroundImagePosition_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("DatePicker : ${BackgroundImagePosition_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Divider : ${BackgroundImagePosition_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Divider : ${BackgroundImagePosition_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Divider : ${BackgroundImagePosition_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Divider : ${BackgroundImagePosition_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Divider : ${BackgroundImagePosition_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Gauge : ${BackgroundImagePosition_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Gauge : ${BackgroundImagePosition_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Gauge : ${BackgroundImagePosition_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Gauge : ${BackgroundImagePosition_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Gauge : ${BackgroundImagePosition_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Image : ${BackgroundImagePosition_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Image : ${BackgroundImagePosition_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Image : ${BackgroundImagePosition_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Image : ${BackgroundImagePosition_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Image : ${BackgroundImagePosition_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("ImageSpan : ${BackgroundImagePosition_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("ImageSpan : ${BackgroundImagePosition_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("ImageSpan : ${BackgroundImagePosition_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("ImageSpan : ${BackgroundImagePosition_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("ImageSpan : ${BackgroundImagePosition_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("LoadingProgress : ${BackgroundImagePosition_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("LoadingProgress : ${BackgroundImagePosition_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("LoadingProgress : ${BackgroundImagePosition_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("LoadingProgress : ${BackgroundImagePosition_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("LoadingProgress : ${BackgroundImagePosition_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Menu : ${BackgroundImagePosition_Prop[0]}")

                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Menu : ${BackgroundImagePosition_Prop[0]}")

                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Menu : ${BackgroundImagePosition_Prop[0]}")

                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Menu : ${BackgroundImagePosition_Prop[0]}")

                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Menu : ${BackgroundImagePosition_Prop[0]}")

                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("MenuItem : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("MenuItem : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("MenuItem : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("MenuItem : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItem : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("MenuItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("MenuItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("MenuItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("MenuItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Progress : ${BackgroundImagePosition_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Progress : ${BackgroundImagePosition_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Progress : ${BackgroundImagePosition_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Progress : ${BackgroundImagePosition_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Progress : ${BackgroundImagePosition_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("QRCode : ${BackgroundImagePosition_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("QRCode : ${BackgroundImagePosition_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("QRCode : ${BackgroundImagePosition_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("QRCode : ${BackgroundImagePosition_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("QRCode : ${BackgroundImagePosition_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Radio : ${BackgroundImagePosition_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Radio : ${BackgroundImagePosition_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Radio : ${BackgroundImagePosition_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Radio : ${BackgroundImagePosition_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Radio : ${BackgroundImagePosition_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Rating : ${BackgroundImagePosition_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Rating : ${BackgroundImagePosition_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Rating : ${BackgroundImagePosition_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Rating : ${BackgroundImagePosition_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Rating : ${BackgroundImagePosition_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Refresh : ${BackgroundImagePosition_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Refresh : ${BackgroundImagePosition_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Refresh : ${BackgroundImagePosition_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Refresh : ${BackgroundImagePosition_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Refresh : ${BackgroundImagePosition_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("RichEditor : ${BackgroundImagePosition_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("RichEditor : ${BackgroundImagePosition_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("RichEditor : ${BackgroundImagePosition_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("RichEditor : ${BackgroundImagePosition_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("RichEditor : ${BackgroundImagePosition_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("RichText : ${BackgroundImagePosition_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("RichText : ${BackgroundImagePosition_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("RichText : ${BackgroundImagePosition_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("RichText : ${BackgroundImagePosition_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("RichText : ${BackgroundImagePosition_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("RowSplit : ${BackgroundImagePosition_Prop[0]}")
                                RowSplit() {
                                    Text("1")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xF5DEB3)
                                        .textAlign(TextAlign.Center)
                                    Text("2")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xD2B48C)
                                        .textAlign(TextAlign.Center)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("RowSplit : ${BackgroundImagePosition_Prop[0]}")
                                RowSplit() {
                                    Text("1")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xF5DEB3)
                                        .textAlign(TextAlign.Center)
                                    Text("2")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xD2B48C)
                                        .textAlign(TextAlign.Center)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("RowSplit : ${BackgroundImagePosition_Prop[0]}")
                                RowSplit() {
                                    Text("1")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xF5DEB3)
                                        .textAlign(TextAlign.Center)
                                    Text("2")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xD2B48C)
                                        .textAlign(TextAlign.Center)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("RowSplit : ${BackgroundImagePosition_Prop[0]}")
                                RowSplit() {
                                    Text("1")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xF5DEB3)
                                        .textAlign(TextAlign.Center)
                                    Text("2")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xD2B48C)
                                        .textAlign(TextAlign.Center)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("RowSplit : ${BackgroundImagePosition_Prop[0]}")
                                RowSplit() {
                                    Text("1")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xF5DEB3)
                                        .textAlign(TextAlign.Center)
                                    Text("2")
                                        .width(10.percent)
                                        .height(80.percent)
                                        .backgroundColor(0xD2B48C)
                                        .textAlign(TextAlign.Center)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("ScrollBar : ${BackgroundImagePosition_Prop[0]}")

                                Scroll(this.scroller) {
                                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                                        ForEach(
                                            ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                                            itemGeneratorFunc: {
                                                item: Int64, idx: Int64 => Row() {
                                                    Text(item.toString())
                                                        .width(90.percent)
                                                        .height(50)
                                                        .backgroundColor(0x3366CC)
                                                        .fontSize(16)
                                                        .textAlign(TextAlign.Center)
                                                }
                                            }
                                        )
                                    }
                                }.height(150).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                                ScrollBar(scroller:this.scroller, direction:ScrollBarDirection.Vertical, state:BarState.On) {
                                    Text("").width(100).height(50).borderRadius(10).backgroundColor(0xC0C0C0)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("ScrollBar : ${BackgroundImagePosition_Prop[0]}")

                                Scroll(this.scroller) {
                                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                                        ForEach(
                                            ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                                            itemGeneratorFunc: {
                                                item: Int64, idx: Int64 => Row() {
                                                    Text(item.toString())
                                                        .width(90.percent)
                                                        .height(50)
                                                        .backgroundColor(0x3366CC)
                                                        .fontSize(16)
                                                        .textAlign(TextAlign.Center)
                                                }
                                            }
                                        )
                                    }
                                }.height(150).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                                ScrollBar(scroller:this.scroller, direction:ScrollBarDirection.Vertical, state:BarState.On) {
                                    Text("").width(100).height(50).borderRadius(10).backgroundColor(0xC0C0C0)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("ScrollBar : ${BackgroundImagePosition_Prop[0]}")

                                Scroll(this.scroller) {
                                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                                        ForEach(
                                            ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                                            itemGeneratorFunc: {
                                                item: Int64, idx: Int64 => Row() {
                                                    Text(item.toString())
                                                        .width(90.percent)
                                                        .height(50)
                                                        .backgroundColor(0x3366CC)
                                                        .fontSize(16)
                                                        .textAlign(TextAlign.Center)
                                                }
                                            }
                                        )
                                    }
                                }.height(150).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                                ScrollBar(scroller:this.scroller, direction:ScrollBarDirection.Vertical, state:BarState.On) {
                                    Text("").width(100).height(50).borderRadius(10).backgroundColor(0xC0C0C0)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("ScrollBar : ${BackgroundImagePosition_Prop[0]}")

                                Scroll(this.scroller) {
                                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                                        ForEach(
                                            ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                                            itemGeneratorFunc: {
                                                item: Int64, idx: Int64 => Row() {
                                                    Text(item.toString())
                                                        .width(90.percent)
                                                        .height(50)
                                                        .backgroundColor(0x3366CC)
                                                        .fontSize(16)
                                                        .textAlign(TextAlign.Center)
                                                }
                                            }
                                        )
                                    }
                                }.height(150).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                                ScrollBar(scroller:this.scroller, direction:ScrollBarDirection.Vertical, state:BarState.On) {
                                    Text("").width(100).height(50).borderRadius(10).backgroundColor(0xC0C0C0)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("ScrollBar : ${BackgroundImagePosition_Prop[0]}")

                                Scroll(this.scroller) {
                                    Flex(direction: FlexDirection.Column, alignItems: ItemAlign.Start) {
                                        ForEach(
                                            ObservedArrayList<Int64>([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                                            itemGeneratorFunc: {
                                                item: Int64, idx: Int64 => Row() {
                                                    Text(item.toString())
                                                        .width(90.percent)
                                                        .height(50)
                                                        .backgroundColor(0x3366CC)
                                                        .fontSize(16)
                                                        .textAlign(TextAlign.Center)
                                                }
                                            }
                                        )
                                    }
                                }.height(150).scrollBar(BarState.Off).scrollable(ScrollDirection.Vertical)
                                ScrollBar(scroller:this.scroller, direction:ScrollBarDirection.Vertical, state:BarState.On) {
                                    Text("").width(100).height(50).borderRadius(10).backgroundColor(0xC0C0C0)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Search : ${BackgroundImagePosition_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Search : ${BackgroundImagePosition_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Search : ${BackgroundImagePosition_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Search : ${BackgroundImagePosition_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Search : ${BackgroundImagePosition_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Slider : ${BackgroundImagePosition_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Slider : ${BackgroundImagePosition_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Slider : ${BackgroundImagePosition_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Slider : ${BackgroundImagePosition_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Slider : ${BackgroundImagePosition_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Stepper : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Stepper : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Stepper : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Stepper : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Stepper : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("StepperItem : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("StepperItem : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("StepperItem : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("StepperItem : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("StepperItem : ${BackgroundImagePosition_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Text : ${BackgroundImagePosition_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Text : ${BackgroundImagePosition_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Text : ${BackgroundImagePosition_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Text : ${BackgroundImagePosition_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Text : ${BackgroundImagePosition_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TextArea : ${BackgroundImagePosition_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TextArea : ${BackgroundImagePosition_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TextArea : ${BackgroundImagePosition_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TextArea : ${BackgroundImagePosition_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TextArea : ${BackgroundImagePosition_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TextClock : ${BackgroundImagePosition_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TextClock : ${BackgroundImagePosition_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TextClock : ${BackgroundImagePosition_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TextClock : ${BackgroundImagePosition_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TextClock : ${BackgroundImagePosition_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TextInput : ${BackgroundImagePosition_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TextInput : ${BackgroundImagePosition_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TextInput : ${BackgroundImagePosition_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TextInput : ${BackgroundImagePosition_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TextInput : ${BackgroundImagePosition_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TextPicker : ${BackgroundImagePosition_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TextPicker : ${BackgroundImagePosition_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TextPicker : ${BackgroundImagePosition_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TextPicker : ${BackgroundImagePosition_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TextPicker : ${BackgroundImagePosition_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TextTimer : ${BackgroundImagePosition_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TextTimer : ${BackgroundImagePosition_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TextTimer : ${BackgroundImagePosition_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TextTimer : ${BackgroundImagePosition_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TextTimer : ${BackgroundImagePosition_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Toggle : ${BackgroundImagePosition_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Toggle : ${BackgroundImagePosition_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Toggle : ${BackgroundImagePosition_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Toggle : ${BackgroundImagePosition_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Toggle : ${BackgroundImagePosition_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Web : ${BackgroundImagePosition_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Web : ${BackgroundImagePosition_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Web : ${BackgroundImagePosition_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Web : ${BackgroundImagePosition_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Web : ${BackgroundImagePosition_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Select : ${BackgroundImagePosition_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Select : ${BackgroundImagePosition_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Select : ${BackgroundImagePosition_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Select : ${BackgroundImagePosition_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Select : ${BackgroundImagePosition_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Badge : ${BackgroundImagePosition_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Badge : ${BackgroundImagePosition_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Badge : ${BackgroundImagePosition_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Badge : ${BackgroundImagePosition_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Badge : ${BackgroundImagePosition_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Column : ${BackgroundImagePosition_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Column : ${BackgroundImagePosition_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Column : ${BackgroundImagePosition_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Column : ${BackgroundImagePosition_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Column : ${BackgroundImagePosition_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Grid : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Grid : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Grid : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Grid : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Grid : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("GridItem : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("GridItem : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("GridItem : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("GridItem : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("GridItem : ${BackgroundImagePosition_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("GridRow : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("GridRow : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("GridRow : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("GridRow : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("GridRow : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("GridCol : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("GridCol : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("GridCol : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("GridCol : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("GridCol : ${BackgroundImagePosition_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Flex : ${BackgroundImagePosition_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Flex : ${BackgroundImagePosition_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Flex : ${BackgroundImagePosition_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Flex : ${BackgroundImagePosition_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Flex : ${BackgroundImagePosition_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("List : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("List : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("List : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("List : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("List : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("ListItem : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("ListItem : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("ListItem : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("ListItem : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItem : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImagePosition_Prop[0])
                                            .backgroundImagePosition(
                                                x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[0],
                                                y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("ListItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("ListItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("ListItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("ListItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItemGroup : ${BackgroundImagePosition_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("RelativeContainer : ${BackgroundImagePosition_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("RelativeContainer : ${BackgroundImagePosition_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("RelativeContainer : ${BackgroundImagePosition_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("RelativeContainer : ${BackgroundImagePosition_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("RelativeContainer : ${BackgroundImagePosition_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Row : ${BackgroundImagePosition_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Row : ${BackgroundImagePosition_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Row : ${BackgroundImagePosition_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Row : ${BackgroundImagePosition_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Row : ${BackgroundImagePosition_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Scroll : ${BackgroundImagePosition_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Scroll : ${BackgroundImagePosition_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Scroll : ${BackgroundImagePosition_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Scroll : ${BackgroundImagePosition_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Scroll : ${BackgroundImagePosition_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Stack : ${BackgroundImagePosition_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Stack : ${BackgroundImagePosition_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Stack : ${BackgroundImagePosition_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Stack : ${BackgroundImagePosition_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Stack : ${BackgroundImagePosition_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Swiper : ${BackgroundImagePosition_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Swiper : ${BackgroundImagePosition_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Swiper : ${BackgroundImagePosition_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Swiper : ${BackgroundImagePosition_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Swiper : ${BackgroundImagePosition_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Tabs : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Tabs : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Tabs : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Tabs : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Tabs : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("TabContent : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("TabContent : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("TabContent : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("TabContent : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("TabContent : ${BackgroundImagePosition_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImagePosition_Prop[0])
                                        .backgroundImagePosition(
                                            x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Circle : ${BackgroundImagePosition_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Circle : ${BackgroundImagePosition_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Circle : ${BackgroundImagePosition_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Circle : ${BackgroundImagePosition_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Circle : ${BackgroundImagePosition_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Line : ${BackgroundImagePosition_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Line : ${BackgroundImagePosition_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Line : ${BackgroundImagePosition_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Line : ${BackgroundImagePosition_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Line : ${BackgroundImagePosition_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Rect : ${BackgroundImagePosition_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Rect : ${BackgroundImagePosition_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Rect : ${BackgroundImagePosition_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Rect : ${BackgroundImagePosition_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Rect : ${BackgroundImagePosition_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Shape : ${BackgroundImagePosition_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Shape : ${BackgroundImagePosition_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Shape : ${BackgroundImagePosition_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Shape : ${BackgroundImagePosition_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Shape : ${BackgroundImagePosition_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (BackgroundImagePosition_Prop[1] is Alignment) {
                                Text("Path : ${BackgroundImagePosition_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        (BackgroundImagePosition_Prop[1] as Alignment).getOrThrow())
                            } else if (BackgroundImagePosition_Prop[1] is (Length, Length)) {
                                Text("Path : ${BackgroundImagePosition_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Length, Length)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Float64, Float64)) {
                                Text("Path : ${BackgroundImagePosition_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (Int64, Int64)) {
                                Text("Path : ${BackgroundImagePosition_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                    )
                            } else if (BackgroundImagePosition_Prop[1] is (AppResource, AppResource)) {
                                Text("Path : ${BackgroundImagePosition_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImagePosition_Prop[0])
                                    .backgroundImagePosition(
                                        x: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        y: ((BackgroundImagePosition_Prop[1] as (AppResource, AppResource)).getOrThrow())[1]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
