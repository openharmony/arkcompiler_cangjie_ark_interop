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
class View_EmptyAttrs_SweepGradient {
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
                    ObservedArrayList<(String, ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor,
                                Float64)>, Bool), String)>(SweepGradient_Prop_List),
                    itemGeneratorFunc: {
                        SweepGradient_Prop: (String, ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor,
                                Float64)>, Bool), String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("AlphabetIndexer : ${SweepGradient_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Blank : ${SweepGradient_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Button : ${SweepGradient_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Checkbox : ${SweepGradient_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("CheckboxGroup : ${SweepGradient_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("DataPanel : ${SweepGradient_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("DatePicker : ${SweepGradient_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Divider : ${SweepGradient_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Gauge : ${SweepGradient_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Image : ${SweepGradient_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("ImageSpan : ${SweepGradient_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("LoadingProgress : ${SweepGradient_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Menu : ${SweepGradient_Prop[0]}")

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
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("MenuItem : ${SweepGradient_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + SweepGradient_Prop[0])
                                            .sweepGradient(
                                                ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                    Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                                start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                                end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                                rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                                colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                                repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, 
                                                    Float64, Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("MenuItemGroup : ${SweepGradient_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Progress : ${SweepGradient_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("QRCode : ${SweepGradient_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Radio : ${SweepGradient_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Rating : ${SweepGradient_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Refresh : ${SweepGradient_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("RichEditor : ${SweepGradient_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("RowSplit : ${SweepGradient_Prop[0]}")
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
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("ScrollBar : ${SweepGradient_Prop[0]}")

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
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Search : ${SweepGradient_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Slider : ${SweepGradient_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Stepper : ${SweepGradient_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("StepperItem : ${SweepGradient_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Text : ${SweepGradient_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TextArea : ${SweepGradient_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TextClock : ${SweepGradient_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TextInput : ${SweepGradient_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TextPicker : ${SweepGradient_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TextTimer : ${SweepGradient_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Toggle : ${SweepGradient_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Select : ${SweepGradient_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Badge : ${SweepGradient_Prop[0]}")
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
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Column : ${SweepGradient_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Grid : ${SweepGradient_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("GridItem : ${SweepGradient_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("GridRow : ${SweepGradient_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("GridCol : ${SweepGradient_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Flex : ${SweepGradient_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("List : ${SweepGradient_Prop[0]}")
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
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("ListItem : ${SweepGradient_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + SweepGradient_Prop[0])
                                            .sweepGradient(
                                                ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                    Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                                start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                                end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                                rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                                colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                    Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                                repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, 
                                                    Float64, Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                            )
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("ListItemGroup : ${SweepGradient_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("RelativeContainer : ${SweepGradient_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Row : ${SweepGradient_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Scroll : ${SweepGradient_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Stack : ${SweepGradient_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Swiper : ${SweepGradient_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Tabs : ${SweepGradient_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("TabContent : ${SweepGradient_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + SweepGradient_Prop[0])
                                        .sweepGradient(
                                            ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[0],
                                            start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                            end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                                Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                            rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                            colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                            repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                                Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                        )
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Circle : ${SweepGradient_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Line : ${SweepGradient_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Rect : ${SweepGradient_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Shape : ${SweepGradient_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (SweepGradient_Prop[1] is ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                Float64)>, Bool)) {
                                Text("Path : ${SweepGradient_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + SweepGradient_Prop[0])
                                    .sweepGradient(
                                        ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, Array<(ResourceColor, 
                                            Float64)>, Bool)).getOrThrow())[0],
                                        start: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[1],
                                        end: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[2],
                                        rotation: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[3],
                                        colors: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, Float64, 
                                            Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[4],
                                        repeating: ((SweepGradient_Prop[1] as ((Length, Length), Float64, Float64, 
                                            Float64, Array<(ResourceColor, Float64)>, Bool)).getOrThrow())[5]
                                    )
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
