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
class View_EmptyAttrs_BackgroundImageSize {
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
                    ObservedArrayList<(String, Any, String)>(BackgroundImageSize_Prop_List),
                    itemGeneratorFunc: {
                        BackgroundImageSize_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("AlphabetIndexer : ${BackgroundImageSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("AlphabetIndexer : ${BackgroundImageSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("AlphabetIndexer : ${BackgroundImageSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("AlphabetIndexer : ${BackgroundImageSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("AlphabetIndexer : ${BackgroundImageSize_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Blank : ${BackgroundImageSize_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Blank : ${BackgroundImageSize_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Blank : ${BackgroundImageSize_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Blank : ${BackgroundImageSize_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Blank : ${BackgroundImageSize_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Button : ${BackgroundImageSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Button : ${BackgroundImageSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Button : ${BackgroundImageSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Button : ${BackgroundImageSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Button : ${BackgroundImageSize_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Checkbox : ${BackgroundImageSize_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Checkbox : ${BackgroundImageSize_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Checkbox : ${BackgroundImageSize_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Checkbox : ${BackgroundImageSize_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Checkbox : ${BackgroundImageSize_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("CheckboxGroup : ${BackgroundImageSize_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("CheckboxGroup : ${BackgroundImageSize_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("CheckboxGroup : ${BackgroundImageSize_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("CheckboxGroup : ${BackgroundImageSize_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("CheckboxGroup : ${BackgroundImageSize_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("DataPanel : ${BackgroundImageSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("DataPanel : ${BackgroundImageSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("DataPanel : ${BackgroundImageSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("DataPanel : ${BackgroundImageSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("DataPanel : ${BackgroundImageSize_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("DatePicker : ${BackgroundImageSize_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("DatePicker : ${BackgroundImageSize_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("DatePicker : ${BackgroundImageSize_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("DatePicker : ${BackgroundImageSize_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("DatePicker : ${BackgroundImageSize_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Divider : ${BackgroundImageSize_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Divider : ${BackgroundImageSize_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Divider : ${BackgroundImageSize_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Divider : ${BackgroundImageSize_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Divider : ${BackgroundImageSize_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Gauge : ${BackgroundImageSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Gauge : ${BackgroundImageSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Gauge : ${BackgroundImageSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Gauge : ${BackgroundImageSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Gauge : ${BackgroundImageSize_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Image : ${BackgroundImageSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Image : ${BackgroundImageSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Image : ${BackgroundImageSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Image : ${BackgroundImageSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Image : ${BackgroundImageSize_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("ImageSpan : ${BackgroundImageSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("ImageSpan : ${BackgroundImageSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("ImageSpan : ${BackgroundImageSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("ImageSpan : ${BackgroundImageSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("ImageSpan : ${BackgroundImageSize_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("LoadingProgress : ${BackgroundImageSize_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("LoadingProgress : ${BackgroundImageSize_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("LoadingProgress : ${BackgroundImageSize_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("LoadingProgress : ${BackgroundImageSize_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("LoadingProgress : ${BackgroundImageSize_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Menu : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Menu : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Menu : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Menu : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Menu : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("MenuItem : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                (BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("MenuItem : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("MenuItem : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow(
                                                ))[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("MenuItem : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItem : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[1])
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("MenuItemGroup : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("MenuItemGroup : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("MenuItemGroup : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("MenuItemGroup : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("MenuItemGroup : ${BackgroundImageSize_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Progress : ${BackgroundImageSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Progress : ${BackgroundImageSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Progress : ${BackgroundImageSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Progress : ${BackgroundImageSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Progress : ${BackgroundImageSize_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("QRCode : ${BackgroundImageSize_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("QRCode : ${BackgroundImageSize_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("QRCode : ${BackgroundImageSize_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("QRCode : ${BackgroundImageSize_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("QRCode : ${BackgroundImageSize_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Radio : ${BackgroundImageSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Radio : ${BackgroundImageSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Radio : ${BackgroundImageSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Radio : ${BackgroundImageSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Radio : ${BackgroundImageSize_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Rating : ${BackgroundImageSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Rating : ${BackgroundImageSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Rating : ${BackgroundImageSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Rating : ${BackgroundImageSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Rating : ${BackgroundImageSize_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Refresh : ${BackgroundImageSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Refresh : ${BackgroundImageSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Refresh : ${BackgroundImageSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Refresh : ${BackgroundImageSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Refresh : ${BackgroundImageSize_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("RichEditor : ${BackgroundImageSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("RichEditor : ${BackgroundImageSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("RichEditor : ${BackgroundImageSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("RichEditor : ${BackgroundImageSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("RichEditor : ${BackgroundImageSize_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("RichText : ${BackgroundImageSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("RichText : ${BackgroundImageSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("RichText : ${BackgroundImageSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("RichText : ${BackgroundImageSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("RichText : ${BackgroundImageSize_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("RowSplit : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("RowSplit : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("RowSplit : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("RowSplit : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("RowSplit : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("ScrollBar : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("ScrollBar : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("ScrollBar : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("ScrollBar : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("ScrollBar : ${BackgroundImageSize_Prop[0]}")

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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Search : ${BackgroundImageSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Search : ${BackgroundImageSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Search : ${BackgroundImageSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Search : ${BackgroundImageSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Search : ${BackgroundImageSize_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Slider : ${BackgroundImageSize_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Slider : ${BackgroundImageSize_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Slider : ${BackgroundImageSize_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Slider : ${BackgroundImageSize_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Slider : ${BackgroundImageSize_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Stepper : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Stepper : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Stepper : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Stepper : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Stepper : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("StepperItem : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("StepperItem : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("StepperItem : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("StepperItem : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("StepperItem : ${BackgroundImageSize_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Text : ${BackgroundImageSize_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Text : ${BackgroundImageSize_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Text : ${BackgroundImageSize_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Text : ${BackgroundImageSize_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Text : ${BackgroundImageSize_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TextArea : ${BackgroundImageSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TextArea : ${BackgroundImageSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TextArea : ${BackgroundImageSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TextArea : ${BackgroundImageSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TextArea : ${BackgroundImageSize_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TextClock : ${BackgroundImageSize_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TextClock : ${BackgroundImageSize_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TextClock : ${BackgroundImageSize_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TextClock : ${BackgroundImageSize_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TextClock : ${BackgroundImageSize_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TextInput : ${BackgroundImageSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TextInput : ${BackgroundImageSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TextInput : ${BackgroundImageSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TextInput : ${BackgroundImageSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TextInput : ${BackgroundImageSize_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TextPicker : ${BackgroundImageSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TextPicker : ${BackgroundImageSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TextPicker : ${BackgroundImageSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TextPicker : ${BackgroundImageSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TextPicker : ${BackgroundImageSize_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TextTimer : ${BackgroundImageSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TextTimer : ${BackgroundImageSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TextTimer : ${BackgroundImageSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TextTimer : ${BackgroundImageSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TextTimer : ${BackgroundImageSize_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Toggle : ${BackgroundImageSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Toggle : ${BackgroundImageSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Toggle : ${BackgroundImageSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Toggle : ${BackgroundImageSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Toggle : ${BackgroundImageSize_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Web : ${BackgroundImageSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Web : ${BackgroundImageSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Web : ${BackgroundImageSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Web : ${BackgroundImageSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Web : ${BackgroundImageSize_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Select : ${BackgroundImageSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Select : ${BackgroundImageSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Select : ${BackgroundImageSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Select : ${BackgroundImageSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Select : ${BackgroundImageSize_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Badge : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Badge : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Badge : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Badge : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Badge : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Column : ${BackgroundImageSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Column : ${BackgroundImageSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Column : ${BackgroundImageSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Column : ${BackgroundImageSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Column : ${BackgroundImageSize_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Grid : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Grid : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Grid : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Grid : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Grid : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("GridItem : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("GridItem : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("GridItem : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("GridItem : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("GridItem : ${BackgroundImageSize_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("GridRow : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("GridRow : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("GridRow : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("GridRow : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("GridRow : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("GridCol : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("GridCol : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("GridCol : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("GridCol : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("GridCol : ${BackgroundImageSize_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Flex : ${BackgroundImageSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Flex : ${BackgroundImageSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Flex : ${BackgroundImageSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Flex : ${BackgroundImageSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Flex : ${BackgroundImageSize_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("List : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("List : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("List : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("List : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("List : ${BackgroundImageSize_Prop[0]}")
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
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("ListItem : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                (BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("ListItem : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("ListItem : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow(
                                                ))[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("ListItem : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1]
                                            )
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItem : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundImageSize_Prop[0])
                                            .backgroundImageSize(
                                                width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[0],
                                                height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                    .getOrThrow())[1])
                                            .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("ListItemGroup : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("ListItemGroup : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("ListItemGroup : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("ListItemGroup : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("ListItemGroup : ${BackgroundImageSize_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("RelativeContainer : ${BackgroundImageSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("RelativeContainer : ${BackgroundImageSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("RelativeContainer : ${BackgroundImageSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("RelativeContainer : ${BackgroundImageSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("RelativeContainer : ${BackgroundImageSize_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Row : ${BackgroundImageSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Row : ${BackgroundImageSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Row : ${BackgroundImageSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Row : ${BackgroundImageSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Row : ${BackgroundImageSize_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Scroll : ${BackgroundImageSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Scroll : ${BackgroundImageSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Scroll : ${BackgroundImageSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Scroll : ${BackgroundImageSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Scroll : ${BackgroundImageSize_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Stack : ${BackgroundImageSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Stack : ${BackgroundImageSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Stack : ${BackgroundImageSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Stack : ${BackgroundImageSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Stack : ${BackgroundImageSize_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Swiper : ${BackgroundImageSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Swiper : ${BackgroundImageSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Swiper : ${BackgroundImageSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Swiper : ${BackgroundImageSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Swiper : ${BackgroundImageSize_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Tabs : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Tabs : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Tabs : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Tabs : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Tabs : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("TabContent : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("TabContent : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("TabContent : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1]
                                        )
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("TabContent : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("TabContent : ${BackgroundImageSize_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundImageSize_Prop[0])
                                        .backgroundImageSize(
                                            width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[0],
                                            height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource))
                                                .getOrThrow())[1])
                                        .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Circle : ${BackgroundImageSize_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Circle : ${BackgroundImageSize_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Circle : ${BackgroundImageSize_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Circle : ${BackgroundImageSize_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Circle : ${BackgroundImageSize_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Line : ${BackgroundImageSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Line : ${BackgroundImageSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Line : ${BackgroundImageSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Line : ${BackgroundImageSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Line : ${BackgroundImageSize_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Rect : ${BackgroundImageSize_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Rect : ${BackgroundImageSize_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Rect : ${BackgroundImageSize_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Rect : ${BackgroundImageSize_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Rect : ${BackgroundImageSize_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Shape : ${BackgroundImageSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Shape : ${BackgroundImageSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Shape : ${BackgroundImageSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Shape : ${BackgroundImageSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Shape : ${BackgroundImageSize_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (BackgroundImageSize_Prop[1] is ImageSize) {
                                Text("Path : ${BackgroundImageSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize((BackgroundImageSize_Prop[1] as ImageSize).getOrThrow())
                            } else if (BackgroundImageSize_Prop[1] is (Length, Length)) {
                                Text("Path : ${BackgroundImageSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Length, Length)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Float64, Float64)) {
                                Text("Path : ${BackgroundImageSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (Int64, Int64)) {
                                Text("Path : ${BackgroundImageSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                            } else if (BackgroundImageSize_Prop[1] is (AppResource, AppResource)) {
                                Text("Path : ${BackgroundImageSize_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .backgroundImage(@r(app.media.startIcon), ImageRepeat.NoRepeat)
                                    .id(this.targetView + BackgroundImageSize_Prop[0])
                                    .backgroundImageSize(
                                        width: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow())[0],
                                        height: ((BackgroundImageSize_Prop[1] as (AppResource, AppResource)).getOrThrow(
                                        ))[1]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
