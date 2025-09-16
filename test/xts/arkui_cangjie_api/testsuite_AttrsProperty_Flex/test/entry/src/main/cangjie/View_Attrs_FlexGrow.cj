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
class View_EmptyAttrs_FlexGrow {
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
                    ObservedArrayList<(String, Any, String, String)>(FlexGrowShrink_Prop_List),
                    itemGeneratorFunc: {
                        FlexGrowShrink_Prop: (String, Any, String, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("AlphabetIndexer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("AlphabetIndexer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Blank : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Blank(min: 10)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Blank : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Blank(min: 10)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Blank(min: 10)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Button : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Button : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Button {
                                        Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)
                                    }
                                        .shape(ButtonType.Normal)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Checkbox : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Checkbox()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Checkbox : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Checkbox()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Checkbox()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("CheckboxGroup : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    CheckboxGroup()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("CheckboxGroup : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    CheckboxGroup()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    CheckboxGroup()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("DataPanel : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    DataPanel(values: [30.0])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("DataPanel : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    DataPanel(values: [30.0])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    DataPanel(values: [30.0])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("DatePicker : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    DatePicker()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("DatePicker : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    DatePicker()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    DatePicker()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Divider : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Divider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Divider : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Divider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Divider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Gauge : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Gauge : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                        Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Image : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Image : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Image(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("LoadingProgress : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    LoadingProgress()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("LoadingProgress : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    LoadingProgress()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    LoadingProgress()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Menu : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Menu : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Menu() {
                                        MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                            MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "",
                                                labelInfo: "")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Progress : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Progress(value: 10.0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Progress : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Progress(value: 10.0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Progress(value: 10.0)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("QRCode : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    QRCode(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("QRCode : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    QRCode(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    QRCode(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Radio : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Radio(group: "1", value: "A")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Radio : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Radio(group: "1", value: "A")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Radio(group: "1", value: "A")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Rating : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Rating : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Rating(rating: 3.5, indicator: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Refresh : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Refresh : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                        Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("RichEditor : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    RichEditor(richEditorController)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("RichEditor : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RichEditor(richEditorController)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    RichEditor(richEditorController)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("RichText : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("RichText : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("RowSplit : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("RowSplit : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("ScrollBar : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("ScrollBar : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Search : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Search : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Search(value: "", placeholder: "Type to search")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Slider : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Slider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Slider : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Slider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Slider()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Stepper : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Stepper : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Stepper(index:0) {
                                        StepperItem() {
                                            Text("Page One")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Text : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Text(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Text : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Text(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Text(targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("TextArea : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextArea(text: targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("TextArea : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextArea(text: targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextArea(text: targetView)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("TextClock : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextClock()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("TextClock : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextClock()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextClock()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("TextInput : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextInput(placeholder: "TextInput")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("TextInput : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextInput(placeholder: "TextInput")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextInput(placeholder: "TextInput")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("TextPicker : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("TextPicker : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextPicker(range:["apple", "banana", "orange", "peach"])
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("TextTimer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("TextTimer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Toggle : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Toggle : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Toggle(ToggleType.Switch, isOn: false)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Web : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Web : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Web(src: "www.baidu.com", controller: webController)
                                        .onPageBegin({evt => Hilog.info(0, "cangjietest", "page begin url: ${evt.url}")})
                                        .onPageEnd({evt => Hilog.info(0, "cangjietest", "page end url: ${evt.url}")})
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Select : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Select : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Select(
                                        [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                            SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                        .value("Select")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Badge : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Badge : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                        Button("message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Column : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Column : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Column() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Grid : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Grid : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Grid (child:{=>
                                        GridItem ({=>
                                            Text("Message")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    })
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("GridRow : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("GridRow : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    GridRow() {
                                        GridCol() {
                                            Row().width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Flex : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Flex : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Flex() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("List : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("List : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

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
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("RelativeContainer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("RelativeContainer : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    RelativeContainer() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Row : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Row : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Row() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Scroll : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Scroll : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Scroll() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Stack : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Stack : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Stack() {
                                        Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Swiper : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Swiper : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Swiper(controller:SwiperController()) {
                                        Text("1").width(80.percent).height(80.percent)
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Tabs : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Tabs : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")

                                    Tabs() {
                                        TabContent {
                                            Column()
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[2])
                                        }.tabBar("1").backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Circle : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Circle()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Circle : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Circle()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Circle()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Line : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Line : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Line()
                                        .startPoint((0.0, 0.0))
                                        .endPoint((10.0, 20.0))
                                        .stroke(Color.Black)
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Rect : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Rect()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Rect : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Rect()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Rect()
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Shape : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Shape : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Shape() {
                                        Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                    }
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (FlexGrowShrink_Prop[1] is (Float64, Float64)) {
                                Text("Path : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Float64, Float64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            } else if (FlexGrowShrink_Prop[1] is (Int64, Int64)) {
                                Text("Path : ${FlexGrowShrink_Prop[0]}")
                                Flex() {
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[1])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[0])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "1")
                                    Path()
                                        .commands("M0 0 H200 V200 H0 Z")
                                        .height(100.vp)
                                        .backgroundColor(this.Colors[2])
                                        .flexGrow(((FlexGrowShrink_Prop[1] as (Int64, Int64)).getOrThrow())[1])
                                        .key(this.targetView + FlexGrowShrink_Prop[0] + "2")
                                }.width(90.percent).height(150).backgroundColor(0xAFEEEE)
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
