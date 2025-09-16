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
import ohos.arkui.state_macro_manage.*
import ohos.arkui.component.*
import ohos.arkui.state_management.*
import ohos.base.*
import ohos.arkui.ui_context.Router

@Entry
@Component
class View_EmptyAttrs_Width {
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
                    ObservedArrayList<(String, Any, String)>(WidthHeight_Prop_List),
                    itemGeneratorFunc: {
                        WidthHeight_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("AlphabetIndexer : ${WidthHeight_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("AlphabetIndexer : ${WidthHeight_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("AlphabetIndexer : ${WidthHeight_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("AlphabetIndexer : ${WidthHeight_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Blank : ${WidthHeight_Prop[0]}")
                                Blank(min: 10)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Blank : ${WidthHeight_Prop[0]}")
                                Blank(min: 10)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Blank : ${WidthHeight_Prop[0]}")
                                Blank(min: 10)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Blank : ${WidthHeight_Prop[0]}")
                                Blank(min: 10)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Button : ${WidthHeight_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Button : ${WidthHeight_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Button : ${WidthHeight_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Button : ${WidthHeight_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Checkbox : ${WidthHeight_Prop[0]}")
                                Checkbox()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Checkbox : ${WidthHeight_Prop[0]}")
                                Checkbox()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Checkbox : ${WidthHeight_Prop[0]}")
                                Checkbox()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Checkbox : ${WidthHeight_Prop[0]}")
                                Checkbox()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("CheckboxGroup : ${WidthHeight_Prop[0]}")
                                CheckboxGroup()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("CheckboxGroup : ${WidthHeight_Prop[0]}")
                                CheckboxGroup()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("CheckboxGroup : ${WidthHeight_Prop[0]}")
                                CheckboxGroup()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("CheckboxGroup : ${WidthHeight_Prop[0]}")
                                CheckboxGroup()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("DataPanel : ${WidthHeight_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("DataPanel : ${WidthHeight_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("DataPanel : ${WidthHeight_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("DataPanel : ${WidthHeight_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("DatePicker : ${WidthHeight_Prop[0]}")
                                DatePicker()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("DatePicker : ${WidthHeight_Prop[0]}")
                                DatePicker()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("DatePicker : ${WidthHeight_Prop[0]}")
                                DatePicker()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("DatePicker : ${WidthHeight_Prop[0]}")
                                DatePicker()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Divider : ${WidthHeight_Prop[0]}")
                                Divider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Divider : ${WidthHeight_Prop[0]}")
                                Divider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Divider : ${WidthHeight_Prop[0]}")
                                Divider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Divider : ${WidthHeight_Prop[0]}")
                                Divider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Gauge : ${WidthHeight_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Gauge : ${WidthHeight_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Gauge : ${WidthHeight_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Gauge : ${WidthHeight_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Image : ${WidthHeight_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Image : ${WidthHeight_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Image : ${WidthHeight_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Image : ${WidthHeight_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("ImageSpan : ${WidthHeight_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("ImageSpan : ${WidthHeight_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("ImageSpan : ${WidthHeight_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("ImageSpan : ${WidthHeight_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("LoadingProgress : ${WidthHeight_Prop[0]}")
                                LoadingProgress()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("LoadingProgress : ${WidthHeight_Prop[0]}")
                                LoadingProgress()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("LoadingProgress : ${WidthHeight_Prop[0]}")
                                LoadingProgress()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("LoadingProgress : ${WidthHeight_Prop[0]}")
                                LoadingProgress()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Menu : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Menu : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Menu : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Menu : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("MenuItem : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("MenuItem : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("MenuItem : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("MenuItem : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("MenuItemGroup : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("MenuItemGroup : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("MenuItemGroup : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("MenuItemGroup : ${WidthHeight_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Progress : ${WidthHeight_Prop[0]}")
                                Progress(value: 10.0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Progress : ${WidthHeight_Prop[0]}")
                                Progress(value: 10.0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Progress : ${WidthHeight_Prop[0]}")
                                Progress(value: 10.0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Progress : ${WidthHeight_Prop[0]}")
                                Progress(value: 10.0)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("QRCode : ${WidthHeight_Prop[0]}")
                                QRCode(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("QRCode : ${WidthHeight_Prop[0]}")
                                QRCode(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("QRCode : ${WidthHeight_Prop[0]}")
                                QRCode(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("QRCode : ${WidthHeight_Prop[0]}")
                                QRCode(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Radio : ${WidthHeight_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Radio : ${WidthHeight_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Radio : ${WidthHeight_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Radio : ${WidthHeight_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Rating : ${WidthHeight_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Rating : ${WidthHeight_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Rating : ${WidthHeight_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Rating : ${WidthHeight_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Refresh : ${WidthHeight_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Refresh : ${WidthHeight_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Refresh : ${WidthHeight_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Refresh : ${WidthHeight_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("RichEditor : ${WidthHeight_Prop[0]}")
                                RichEditor(richEditorController)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("RichEditor : ${WidthHeight_Prop[0]}")
                                RichEditor(richEditorController)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("RichEditor : ${WidthHeight_Prop[0]}")
                                RichEditor(richEditorController)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("RichEditor : ${WidthHeight_Prop[0]}")
                                RichEditor(richEditorController)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("RichText : ${WidthHeight_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("RichText : ${WidthHeight_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("RichText : ${WidthHeight_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("RichText : ${WidthHeight_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("RowSplit : ${WidthHeight_Prop[0]}")
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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("RowSplit : ${WidthHeight_Prop[0]}")
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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("RowSplit : ${WidthHeight_Prop[0]}")
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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("RowSplit : ${WidthHeight_Prop[0]}")
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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("ScrollBar : ${WidthHeight_Prop[0]}")

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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("ScrollBar : ${WidthHeight_Prop[0]}")

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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("ScrollBar : ${WidthHeight_Prop[0]}")

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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("ScrollBar : ${WidthHeight_Prop[0]}")

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
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Search : ${WidthHeight_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Search : ${WidthHeight_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Search : ${WidthHeight_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Search : ${WidthHeight_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Slider : ${WidthHeight_Prop[0]}")
                                Slider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Slider : ${WidthHeight_Prop[0]}")
                                Slider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Slider : ${WidthHeight_Prop[0]}")
                                Slider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Slider : ${WidthHeight_Prop[0]}")
                                Slider()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Stepper : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Stepper : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Stepper : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Stepper : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("StepperItem : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("StepperItem : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("StepperItem : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("StepperItem : ${WidthHeight_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Text : ${WidthHeight_Prop[0]}")
                                Text(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Text : ${WidthHeight_Prop[0]}")
                                Text(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Text : ${WidthHeight_Prop[0]}")
                                Text(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Text : ${WidthHeight_Prop[0]}")
                                Text(targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("TextArea : ${WidthHeight_Prop[0]}")
                                TextArea(text: targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("TextArea : ${WidthHeight_Prop[0]}")
                                TextArea(text: targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("TextArea : ${WidthHeight_Prop[0]}")
                                TextArea(text: targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("TextArea : ${WidthHeight_Prop[0]}")
                                TextArea(text: targetView)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("TextClock : ${WidthHeight_Prop[0]}")
                                TextClock()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("TextClock : ${WidthHeight_Prop[0]}")
                                TextClock()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("TextClock : ${WidthHeight_Prop[0]}")
                                TextClock()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("TextClock : ${WidthHeight_Prop[0]}")
                                TextClock()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("TextInput : ${WidthHeight_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("TextInput : ${WidthHeight_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("TextInput : ${WidthHeight_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("TextInput : ${WidthHeight_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("TextPicker : ${WidthHeight_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("TextPicker : ${WidthHeight_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("TextPicker : ${WidthHeight_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("TextPicker : ${WidthHeight_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("TextTimer : ${WidthHeight_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("TextTimer : ${WidthHeight_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("TextTimer : ${WidthHeight_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("TextTimer : ${WidthHeight_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Toggle : ${WidthHeight_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Toggle : ${WidthHeight_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Toggle : ${WidthHeight_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Toggle : ${WidthHeight_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Web : ${WidthHeight_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Web : ${WidthHeight_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Web : ${WidthHeight_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Web : ${WidthHeight_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Select : ${WidthHeight_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Select : ${WidthHeight_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Select : ${WidthHeight_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Select : ${WidthHeight_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Badge : ${WidthHeight_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Badge : ${WidthHeight_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Badge : ${WidthHeight_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Badge : ${WidthHeight_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Column : ${WidthHeight_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Column : ${WidthHeight_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Column : ${WidthHeight_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Column : ${WidthHeight_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Grid : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Grid : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Grid : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Grid : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("GridItem : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("GridItem : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("GridItem : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("GridItem : ${WidthHeight_Prop[0]}")
                                Grid ( child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("GridRow : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("GridRow : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("GridRow : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("GridRow : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("GridCol : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("GridCol : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("GridCol : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("GridCol : ${WidthHeight_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Flex : ${WidthHeight_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Flex : ${WidthHeight_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Flex : ${WidthHeight_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Flex : ${WidthHeight_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("List : ${WidthHeight_Prop[0]}")
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
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("List : ${WidthHeight_Prop[0]}")
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
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("List : ${WidthHeight_Prop[0]}")
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
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("List : ${WidthHeight_Prop[0]}")
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
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("ListItem : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("ListItem : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("ListItem : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("ListItem : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + WidthHeight_Prop[0])
                                            .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                            .height(100)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("ListItemGroup : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("ListItemGroup : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("ListItemGroup : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("ListItemGroup : ${WidthHeight_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + WidthHeight_Prop[0])
                                        .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                        .height(100)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("RelativeContainer : ${WidthHeight_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("RelativeContainer : ${WidthHeight_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("RelativeContainer : ${WidthHeight_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("RelativeContainer : ${WidthHeight_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Row : ${WidthHeight_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Row : ${WidthHeight_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Row : ${WidthHeight_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Row : ${WidthHeight_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Scroll : ${WidthHeight_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Scroll : ${WidthHeight_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Scroll : ${WidthHeight_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Scroll : ${WidthHeight_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Stack : ${WidthHeight_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Stack : ${WidthHeight_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Stack : ${WidthHeight_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Stack : ${WidthHeight_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Swiper : ${WidthHeight_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Swiper : ${WidthHeight_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Swiper : ${WidthHeight_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Swiper : ${WidthHeight_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Tabs : ${WidthHeight_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Tabs : ${WidthHeight_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Tabs : ${WidthHeight_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Tabs : ${WidthHeight_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Circle : ${WidthHeight_Prop[0]}")
                                Circle()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Circle : ${WidthHeight_Prop[0]}")
                                Circle()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Circle : ${WidthHeight_Prop[0]}")
                                Circle()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Circle : ${WidthHeight_Prop[0]}")
                                Circle()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Line : ${WidthHeight_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Line : ${WidthHeight_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Line : ${WidthHeight_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Line : ${WidthHeight_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Rect : ${WidthHeight_Prop[0]}")
                                Rect()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Rect : ${WidthHeight_Prop[0]}")
                                Rect()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Rect : ${WidthHeight_Prop[0]}")
                                Rect()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Rect : ${WidthHeight_Prop[0]}")
                                Rect()
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Shape : ${WidthHeight_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Shape : ${WidthHeight_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Shape : ${WidthHeight_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Shape : ${WidthHeight_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (WidthHeight_Prop[1] is Length) {
                                Text("Path : ${WidthHeight_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Length).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Float64) {
                                Text("Path : ${WidthHeight_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Float64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is Int64) {
                                Text("Path : ${WidthHeight_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as Int64).getOrThrow())
                            } else if (WidthHeight_Prop[1] is AppResource) {
                                Text("Path : ${WidthHeight_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + WidthHeight_Prop[0])
                                    .width((WidthHeight_Prop[1] as AppResource).getOrThrow())
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
