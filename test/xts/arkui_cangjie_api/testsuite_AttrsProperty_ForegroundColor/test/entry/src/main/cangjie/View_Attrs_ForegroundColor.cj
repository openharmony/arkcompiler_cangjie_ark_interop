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
class View_EmptyAttrs_ForegroundColor {
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
                    ObservedArrayList<(String, Any, String)>(ForegroundColor_Prop_List),
                    itemGeneratorFunc: {
                        ForegroundColor_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("AlphabetIndexer : ${ForegroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("AlphabetIndexer : ${ForegroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("AlphabetIndexer : ${ForegroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("AlphabetIndexer : ${ForegroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Button : ${ForegroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Button : ${ForegroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Button : ${ForegroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Button : ${ForegroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Checkbox : ${ForegroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Checkbox : ${ForegroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Checkbox : ${ForegroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Checkbox : ${ForegroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("CheckboxGroup : ${ForegroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("CheckboxGroup : ${ForegroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("CheckboxGroup : ${ForegroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("CheckboxGroup : ${ForegroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("DataPanel : ${ForegroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("DataPanel : ${ForegroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("DataPanel : ${ForegroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("DataPanel : ${ForegroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("DatePicker : ${ForegroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("DatePicker : ${ForegroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("DatePicker : ${ForegroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("DatePicker : ${ForegroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Divider : ${ForegroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Divider : ${ForegroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Divider : ${ForegroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Divider : ${ForegroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Gauge : ${ForegroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Gauge : ${ForegroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Gauge : ${ForegroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Gauge : ${ForegroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("LoadingProgress : ${ForegroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("LoadingProgress : ${ForegroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("LoadingProgress : ${ForegroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("LoadingProgress : ${ForegroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Menu : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Menu : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Menu : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Menu : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("MenuItem : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("MenuItem : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("MenuItem : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("MenuItem : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("MenuItemGroup : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("MenuItemGroup : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("MenuItemGroup : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("MenuItemGroup : ${ForegroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Progress : ${ForegroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Progress : ${ForegroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Progress : ${ForegroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Progress : ${ForegroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("QRCode : ${ForegroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("QRCode : ${ForegroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("QRCode : ${ForegroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("QRCode : ${ForegroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Radio : ${ForegroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Radio : ${ForegroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Radio : ${ForegroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Radio : ${ForegroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Rating : ${ForegroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Rating : ${ForegroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Rating : ${ForegroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Rating : ${ForegroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Refresh : ${ForegroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Refresh : ${ForegroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Refresh : ${ForegroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Refresh : ${ForegroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("RichEditor : ${ForegroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("RichEditor : ${ForegroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("RichEditor : ${ForegroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("RichEditor : ${ForegroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("RowSplit : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("RowSplit : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("RowSplit : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("RowSplit : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("ScrollBar : ${ForegroundColor_Prop[0]}")

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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("ScrollBar : ${ForegroundColor_Prop[0]}")

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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("ScrollBar : ${ForegroundColor_Prop[0]}")

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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("ScrollBar : ${ForegroundColor_Prop[0]}")

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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Search : ${ForegroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Search : ${ForegroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Search : ${ForegroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Search : ${ForegroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Slider : ${ForegroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Slider : ${ForegroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Slider : ${ForegroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Slider : ${ForegroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Stepper : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Stepper : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Stepper : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Stepper : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("StepperItem : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("StepperItem : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("StepperItem : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("StepperItem : ${ForegroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Text : ${ForegroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Text : ${ForegroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Text : ${ForegroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Text : ${ForegroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TextArea : ${ForegroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TextArea : ${ForegroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TextArea : ${ForegroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TextArea : ${ForegroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TextClock : ${ForegroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TextClock : ${ForegroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TextClock : ${ForegroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TextClock : ${ForegroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TextInput : ${ForegroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TextInput : ${ForegroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TextInput : ${ForegroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TextInput : ${ForegroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TextPicker : ${ForegroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TextPicker : ${ForegroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TextPicker : ${ForegroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TextPicker : ${ForegroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TextTimer : ${ForegroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TextTimer : ${ForegroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TextTimer : ${ForegroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TextTimer : ${ForegroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Toggle : ${ForegroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Toggle : ${ForegroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Toggle : ${ForegroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Toggle : ${ForegroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Select : ${ForegroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Select : ${ForegroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Select : ${ForegroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Select : ${ForegroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Badge : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Badge : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Badge : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Badge : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Column : ${ForegroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Column : ${ForegroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Column : ${ForegroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Column : ${ForegroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Grid : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Grid : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Grid : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Grid : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("GridItem : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("GridItem : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("GridItem : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("GridItem : ${ForegroundColor_Prop[0]}")
                                Grid (child:{=>
                                        GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("GridRow : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("GridRow : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("GridRow : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("GridRow : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("GridCol : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("GridCol : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("GridCol : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("GridCol : ${ForegroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Flex : ${ForegroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Flex : ${ForegroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Flex : ${ForegroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Flex : ${ForegroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("List : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("List : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("List : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("List : ${ForegroundColor_Prop[0]}")
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
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("ListItem : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("ListItem : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("ListItem : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("ListItem : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + ForegroundColor_Prop[0])
                                            .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("ListItemGroup : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("ListItemGroup : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("ListItemGroup : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("ListItemGroup : ${ForegroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("RelativeContainer : ${ForegroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("RelativeContainer : ${ForegroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("RelativeContainer : ${ForegroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("RelativeContainer : ${ForegroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Row : ${ForegroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Row : ${ForegroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Row : ${ForegroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Row : ${ForegroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Scroll : ${ForegroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Scroll : ${ForegroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Scroll : ${ForegroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Scroll : ${ForegroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Stack : ${ForegroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Stack : ${ForegroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Stack : ${ForegroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Stack : ${ForegroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Swiper : ${ForegroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Swiper : ${ForegroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Swiper : ${ForegroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Swiper : ${ForegroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Tabs : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Tabs : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Tabs : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Tabs : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                                    .backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("TabContent : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("TabContent : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("TabContent : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("TabContent : ${ForegroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + ForegroundColor_Prop[0])
                                        .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Circle : ${ForegroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Circle : ${ForegroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Circle : ${ForegroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Circle : ${ForegroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Line : ${ForegroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Line : ${ForegroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Line : ${ForegroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Line : ${ForegroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Rect : ${ForegroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Rect : ${ForegroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Rect : ${ForegroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Rect : ${ForegroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Shape : ${ForegroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Shape : ${ForegroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Shape : ${ForegroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Shape : ${ForegroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (ForegroundColor_Prop[1] is Color) {
                                Text("Path : ${ForegroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as Color).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is UInt32) {
                                Text("Path : ${ForegroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as UInt32).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is ColoringStrategy) {
                                Text("Path : ${ForegroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as ColoringStrategy).getOrThrow())
                            } else if (ForegroundColor_Prop[1] is AppResource) {
                                Text("Path : ${ForegroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .backgroundColor(this.Colors[0])
                                    .id(this.targetView + ForegroundColor_Prop[0])
                                    .foregroundColor((ForegroundColor_Prop[1] as AppResource).getOrThrow())
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
