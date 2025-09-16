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
class View_EmptyAttrs_BackgroundColor {
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
                    ObservedArrayList<(String, Any, String)>(BackgroundColor_Prop_List),
                    itemGeneratorFunc: {
                        BackgroundColor_Prop: (String, Any, String), idx: Int64 => if (this.renderFlag) {}
                        else if (this.targetView == "AlphabetIndexer") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("AlphabetIndexer : ${BackgroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("AlphabetIndexer : ${BackgroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("AlphabetIndexer : ${BackgroundColor_Prop[0]}")
                                AlphabetIndexer(arrayValue: ["#", "A", "B", "C", "D"], selected: 0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Blank") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Blank : ${BackgroundColor_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Blank : ${BackgroundColor_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Blank : ${BackgroundColor_Prop[0]}")
                                Blank(min: 10)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Button") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Button : ${BackgroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Button : ${BackgroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Button : ${BackgroundColor_Prop[0]}")
                                Button {Text("Button").width(90.percent).height(90.percent).backgroundColor(Color.Gray)}
                                    .shape(ButtonType.Normal)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Checkbox") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Checkbox : ${BackgroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Checkbox : ${BackgroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Checkbox : ${BackgroundColor_Prop[0]}")
                                Checkbox()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "CheckboxGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("CheckboxGroup : ${BackgroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("CheckboxGroup : ${BackgroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("CheckboxGroup : ${BackgroundColor_Prop[0]}")
                                CheckboxGroup()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "DataPanel") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("DataPanel : ${BackgroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("DataPanel : ${BackgroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("DataPanel : ${BackgroundColor_Prop[0]}")
                                DataPanel(values: [30.0])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "DatePicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("DatePicker : ${BackgroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("DatePicker : ${BackgroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("DatePicker : ${BackgroundColor_Prop[0]}")
                                DatePicker()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Divider") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Divider : ${BackgroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Divider : ${BackgroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Divider : ${BackgroundColor_Prop[0]}")
                                Divider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Gauge") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Gauge : ${BackgroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Gauge : ${BackgroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Gauge : ${BackgroundColor_Prop[0]}")
                                Gauge(value: 50.0, min: 0.0, max: 100.0) {
                                    Text("Gauge").width(50.percent).height(50.percent).backgroundColor(Color.Red)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Image") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Image : ${BackgroundColor_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Image : ${BackgroundColor_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Image : ${BackgroundColor_Prop[0]}")
                                Image(@r(app.media.startIcon))
                                    .objectFit(ImageFit.Contain)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "ImageSpan") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("ImageSpan : ${BackgroundColor_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("ImageSpan : ${BackgroundColor_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("ImageSpan : ${BackgroundColor_Prop[0]}")
                                Text() {
                                    ImageSpan(@r(app.media.startIcon))
                                        .objectFit(ImageFit.Contain)
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                }.width(80.percent).height(100.percent).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "LoadingProgress") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("LoadingProgress : ${BackgroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("LoadingProgress : ${BackgroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("LoadingProgress : ${BackgroundColor_Prop[0]}")
                                LoadingProgress()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Menu") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Menu : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Menu : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Menu : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "MenuItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("MenuItem : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("MenuItem : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("MenuItem : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "MenuItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("MenuItemGroup : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("MenuItemGroup : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("MenuItemGroup : ${BackgroundColor_Prop[0]}")
                                Menu() {
                                    MenuItemGroup(header: "MenuItemGroup", footer: "") {
                                        MenuItem(startIcon: "MenuItem", content: "menuItem", endIcon: "", labelInfo: "")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Progress") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Progress : ${BackgroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Progress : ${BackgroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Progress : ${BackgroundColor_Prop[0]}")
                                Progress(value: 10.0)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "QRCode") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("QRCode : ${BackgroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("QRCode : ${BackgroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("QRCode : ${BackgroundColor_Prop[0]}")
                                QRCode(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Radio") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Radio : ${BackgroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Radio : ${BackgroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Radio : ${BackgroundColor_Prop[0]}")
                                Radio(group: "1", value: "A")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Rating") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Rating : ${BackgroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Rating : ${BackgroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Rating : ${BackgroundColor_Prop[0]}")
                                Rating(rating: 3.5, indicator: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Refresh") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Refresh : ${BackgroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Refresh : ${BackgroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Refresh : ${BackgroundColor_Prop[0]}")
                                Refresh(RefreshOptions(refreshing: @Binder(this.isRefreshing))) {
                                    Text("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RichEditor") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("RichEditor : ${BackgroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("RichEditor : ${BackgroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("RichEditor : ${BackgroundColor_Prop[0]}")
                                RichEditor(richEditorController)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RichText") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("RichText : ${BackgroundColor_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("RichText : ${BackgroundColor_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("RichText : ${BackgroundColor_Prop[0]}")
                                RichText("""
<p style="font-size: 35px;color: rgb(24,78,228)">Text</p> """)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "RowSplit") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("RowSplit : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("RowSplit : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("RowSplit : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "ScrollBar") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("ScrollBar : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("ScrollBar : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("ScrollBar : ${BackgroundColor_Prop[0]}")

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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Search") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Search : ${BackgroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Search : ${BackgroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Search : ${BackgroundColor_Prop[0]}")
                                Search(value: "", placeholder: "Type to search")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Slider") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Slider : ${BackgroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Slider : ${BackgroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Slider : ${BackgroundColor_Prop[0]}")
                                Slider()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Stepper") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Stepper : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Stepper : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Stepper : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            }
                        } else if (this.targetView == "StepperItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("StepperItem : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("StepperItem : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("StepperItem : ${BackgroundColor_Prop[0]}")
                                Stepper(index:0) {
                                    StepperItem() {
                                        Text("Page One")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Text") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Text : ${BackgroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Text : ${BackgroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Text : ${BackgroundColor_Prop[0]}")
                                Text(targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextArea") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TextArea : ${BackgroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TextArea : ${BackgroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TextArea : ${BackgroundColor_Prop[0]}")
                                TextArea(text: targetView)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextClock") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TextClock : ${BackgroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TextClock : ${BackgroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TextClock : ${BackgroundColor_Prop[0]}")
                                TextClock()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextInput") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TextInput : ${BackgroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TextInput : ${BackgroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TextInput : ${BackgroundColor_Prop[0]}")
                                TextInput(placeholder: "TextInput")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextPicker") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TextPicker : ${BackgroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TextPicker : ${BackgroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TextPicker : ${BackgroundColor_Prop[0]}")
                                TextPicker(range:["apple", "banana", "orange", "peach"])
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "TextTimer") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TextTimer : ${BackgroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TextTimer : ${BackgroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TextTimer : ${BackgroundColor_Prop[0]}")
                                TextTimer(isCountDown: true, count: 30000, controller: TextTimerController())
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Toggle") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Toggle : ${BackgroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Toggle : ${BackgroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Toggle : ${BackgroundColor_Prop[0]}")
                                Toggle(ToggleType.Switch, isOn: false)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Web") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Web : ${BackgroundColor_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Web : ${BackgroundColor_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Web : ${BackgroundColor_Prop[0]}")
                                Web(src: "www.baidu.com", controller: webController)
                                    .onPageBegin({evt => Hilog.info(0, "cangjietest", "test", "page begin url: ${evt.url}")})
                                    .onPageEnd({evt => Hilog.info(0, "cangjietest", "test", "page end url: ${evt.url}")})
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Select") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Select : ${BackgroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Select : ${BackgroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Select : ${BackgroundColor_Prop[0]}")
                                Select(
                                    [SelectOptions(value:"aaa", icon: @r(app.media.startIcon)),
                                        SelectOptions(value:"bbb", icon: @r(app.media.startIcon))])
                                    .value("Select")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Badge") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Badge : ${BackgroundColor_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Badge : ${BackgroundColor_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Badge : ${BackgroundColor_Prop[0]}")
                                Badge(count: 1, style: BadgeStyle(color: this.Colors[2])) {
                                    Button("message")
                                        .width(80.percent)
                                        .height(80.percent)
                                        .backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Column") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Column : ${BackgroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Column : ${BackgroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Column : ${BackgroundColor_Prop[0]}")

                                Column() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Grid") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Grid : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Grid : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Grid : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }).width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                })
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            }
                        } else if (this.targetView == "GridItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("GridItem : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("GridItem : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("GridItem : ${BackgroundColor_Prop[0]}")
                                Grid (child:{=>
                                    GridItem ({=>
                                        Text("Message")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    })
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }).width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "GridRow") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("GridRow : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("GridRow : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("GridRow : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            }
                        } else if (this.targetView == "GridCol") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("GridCol : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("GridCol : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("GridCol : ${BackgroundColor_Prop[0]}")
                                GridRow() {
                                    GridCol() {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Flex") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Flex : ${BackgroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Flex : ${BackgroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Flex : ${BackgroundColor_Prop[0]}")
                                Flex() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "List") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("List : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("List : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("List : ${BackgroundColor_Prop[0]}")
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
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            }
                        } else if (this.targetView == "ListItem") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("ListItem : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("ListItem : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("ListItem : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }
                                            .id(this.targetView + BackgroundColor_Prop[0])
                                            .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                            .width(80.percent)
                                            .height(80.percent)
                                    }.width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "ListItemGroup") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("ListItemGroup : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("ListItemGroup : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("ListItemGroup : ${BackgroundColor_Prop[0]}")
                                List() {
                                    ListItemGroup() {
                                        ListItem() {
                                            Text("Text")
                                                .width(80.percent)
                                                .height(80.percent)
                                                .backgroundColor(this.Colors[3])
                                        }.width(80.percent).height(80.percent).backgroundColor(this.Colors[2])
                                    }
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "RelativeContainer") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("RelativeContainer : ${BackgroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("RelativeContainer : ${BackgroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("RelativeContainer : ${BackgroundColor_Prop[0]}")

                                RelativeContainer() {
                                    Text("Text").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Row") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Row : ${BackgroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Row : ${BackgroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Row : ${BackgroundColor_Prop[0]}")

                                Row() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Scroll") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Scroll : ${BackgroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Scroll : ${BackgroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Scroll : ${BackgroundColor_Prop[0]}")

                                Scroll() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Stack") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Stack : ${BackgroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Stack : ${BackgroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Stack : ${BackgroundColor_Prop[0]}")

                                Stack() {
                                    Text("1").height(80.percent).width(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Swiper") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Swiper : ${BackgroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Swiper : ${BackgroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Swiper : ${BackgroundColor_Prop[0]}")

                                Swiper(controller:SwiperController()) {
                                    Text("1").width(80.percent).height(80.percent)
                                }
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Tabs") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Tabs : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Tabs : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Tabs : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }.tabBar("1").width(80.percent).height(80.percent).backgroundColor(this.Colors[1])
                                }
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                    .width(80.percent)
                                    .height(100)
                            }
                        } else if (this.targetView == "TabContent") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("TabContent : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("TabContent : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("TabContent : ${BackgroundColor_Prop[0]}")
                                Tabs() {
                                    TabContent {
                                        Text("Text")
                                            .width(80.percent)
                                            .height(80.percent)
                                            .backgroundColor(this.Colors[2])
                                    }
                                        .tabBar("1")
                                        .id(this.targetView + BackgroundColor_Prop[0])
                                        .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                                        .width(80.percent)
                                        .height(80.percent)
                                }.width(80.percent).height(100).backgroundColor(this.Colors[0])
                            }
                        } else if (this.targetView == "Circle") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Circle : ${BackgroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Circle : ${BackgroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Circle : ${BackgroundColor_Prop[0]}")
                                Circle()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Line") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Line : ${BackgroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Line : ${BackgroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Line : ${BackgroundColor_Prop[0]}")
                                Line()
                                    .startPoint((0.0, 0.0))
                                    .endPoint((10.0, 20.0))
                                    .stroke(Color.Black)
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Rect") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Rect : ${BackgroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Rect : ${BackgroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Rect : ${BackgroundColor_Prop[0]}")
                                Rect()
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Shape") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Shape : ${BackgroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Shape : ${BackgroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Shape : ${BackgroundColor_Prop[0]}")
                                Shape() {Rect().width(80.percent).height(80.percent).backgroundColor(this.Colors[1])}
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        } else if (this.targetView == "Path") {
                            if (this.renderFlag) {}
                            else if (BackgroundColor_Prop[1] is Color) {
                                Text("Path : ${BackgroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as Color).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is AppResource) {
                                Text("Path : ${BackgroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as AppResource).getOrThrow())
                            } else if (BackgroundColor_Prop[1] is UInt32) {
                                Text("Path : ${BackgroundColor_Prop[0]}")
                                Path()
                                    .commands("M0 0 H200 V200 H0 Z")
                                    .margin(3)
                                    .width(150)
                                    .height(80)
                                    .id(this.targetView + BackgroundColor_Prop[0])
                                    .backgroundColor((BackgroundColor_Prop[1] as UInt32).getOrThrow())
                            }
                        }
                    }
                )
            }
        }.id("Scroll").height(this.parentHeight).width(this.parentWidth).backgroundColor(this.parentBackGroundColor)
    }
}
